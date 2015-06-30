//

#import "NewPostViewController.h"

@implementation NewPostViewController

@synthesize textView;

#pragma mark - View lifecycle

- (void)loadView
{
    [super loadView];
    [self setTitle:@"Add new post"];
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 5, 310, 186)];
    [textView setFont:[UIFont systemFontOfSize:16]];
    [textView becomeFirstResponder];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleBordered target:self action:@selector(addButtonTouchHandler:)]];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelButtonTouchHandler:)]];
    
    [self.view addSubview:textView];
}


#pragma mark - Button handlers

- (void)addButtonTouchHandler:(id)sender
{
    // Create a new Post object and create relationship with LASUser
    LASObject *newPost = [LASObject objectWithClassName:@"Post"];
    [newPost setObject:[textView text] forKey:@"textContent"];
    [newPost setObject:[LASUser currentUser] forKey:@"author"]; // One-to-Many relationship created here!
    
    // Set ACL permissions for added security
    LASACL *postACL = [LASACL ACLWithUser:[LASUser currentUser]];
    [postACL setPublicReadAccess:YES];
    [newPost setACL:postACL];
    
    // Save new Post object in LAS
    [LASDataManager saveObjectInBackground:newPost block:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self dismissViewControllerAnimated:YES completion:nil]; // Dismiss the viewController upon success
        }
    }];
}

- (void)cancelButtonTouchHandler:(id)sender 
{
    [self dismissViewControllerAnimated:YES completion:nil]; // Dismiss the viewController upon cancel
}

@end
