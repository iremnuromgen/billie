// Container(
//             width: size.width * 0.9,
//             padding: const EdgeInsets.all(AppSizes.lg),
//             decoration: BoxDecoration(
//               color: Color(0xFFE5E7EB),
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12.withOpacity(0.1),
//                   blurRadius: 10,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 // Email Field
//                 TextField(
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.email_outlined,
//                         color: Colors.red),
//                     hintText: loc.loginText,
//                     filled: true,
//                     fillColor: Colors.grey.shade100,
//                     contentPadding:
//                         const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: AppSizes.md),

//                 // Password Field
//                 TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.lock_outline,
//                         color: Colors.pink),
//                     suffixIcon: const Icon(Icons.visibility_outlined,
//                         color: Colors.amber),
//                     hintText: loc.loginText,
//                     filled: true,
//                     fillColor: Colors.grey.shade100,
//                     contentPadding:
//                         const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: AppSizes.sm),

//                 // Forgot Password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                       debugPrint("Forgot password clicked");
//                     },
//                     child: Text(
//                       loc.loginText,
//                       style: TextStyle(
//                         color: AppColors.purple,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'NunitoMedium',
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: AppSizes.sm),

//                 // Login Button
//                 CustomButton(
//                   width: 278,
//                   height: 56,
//                   onTap: () {
//                     debugPrint("Login to Billie tapped");
//                   }
//                 ),

//                 const SizedBox(height: AppSizes.lg),

//                 // Divider
//                 Row(
//                   children: [
//                     Expanded(child: Divider(color: Colors.grey.shade300)),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Text(
//                         loc.loginText,
//                         style: TextStyle(color: Colors.grey.shade600),
//                       ),
//                     ),
//                     Expanded(child: Divider(color: Colors.grey.shade300)),
//                   ],
//                 ),

//                 const SizedBox(height: AppSizes.lg),

//                 // Google Button
//                 Container(
//                   height: 56,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         "assets/icons/google.png",
//                         width: 24,
//                         height: 24,
//                       ),
//                       const SizedBox(width: 12),
//                       Text(
//                         loc.loginText,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: 'NunitoMedium',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),