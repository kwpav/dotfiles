;;;;;;;;;;;;;;;;;
;; ~/.emacs.d/init.el
;;;;;;;;;;;;;;;;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
<<<<<<< Updated upstream
    ("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "35eddbaa052a71ab98bbe0dbc1a5cb07ffbb5d569227ce00412579c2048e7699" "f4260b30a578a781b4c0858a4a0a6071778aaf69aed4ce2872346cbb28693c1a" "f71859eae71f7f795e734e6e7d178728525008a28c325913f564a42f74042c31" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "222113f148cd70d99c44d84bf4e3a76795f001bd6cfd449b7ff27aeda65ffd78" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "afc220610bee26945b7c750b0cca03775a8b73c27fdca81a586a0a62d45bbce2" "6d8d8af130783e4e91bfcda284ad3271e598e9e78374f5ad406ab63243e75982" "19553e40ff93a241cdfce090fd60e1420e0b371eec1d134a0da21f6f6488a74a" "1c50040ec3b3480b1fec3a0e912cac1eb011c27dd16d087d61e72054685de345" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "9122dfb203945f6e84b0de66d11a97de6c9edf28b3b5db772472e4beccc6b3c5" "d09467d742f713443c7699a546c0300db1a75fed347e09e3f178ab2f3aa2c617" "9e87bddff84cbce28c01fa05eb22f986d770628fa202cd5ca0cd7ed53db2f068" "01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "5f8f1e226274b73f6e706431399a597dbfd64db34f3fba56a6ccf57d148a0e01" "78f614a58e085bd7b33809e98b6f1a5cdd38dae6257e48176ce21424ee89d058" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "0c387e27a3dd040b33c6711ff92e13bd952369a788eee97e4e4ea2335ac5528f" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "9ab634dcc9131f79016c96c4955298409649f6538908c743a8a9d2c6bc8321ef" "76bd62f6ce376bf0597fab7f478eaa98cd94a7b41f0ae46de63a958fbe99c1d9" "91fba9a99f7b64390e1f56319c3dbbaed22de1b9676b3c73d935bf62277b799c" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "e426d22803ef4c21c1735ca0cb638e80e0893cac629ce3b879b94bd3bb67a7a0" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" "d5aac94c0051c3acec2b274347b343372b4e64c3e226be7b7c56725ea26b1ba8" "101a10b15bbbd0d5a0e56e4773e614962197886780afb2d62523a63a144ad96c" "890d09dcc8d2326e98eee74b307b2cc42f07ab7701bcff521e6152aa3e08f7a8" "e8e744a1b0726814ac3ab86ad5ccdf658b9ff1c5a63c4dc23841007874044d4a" "294834baa9ca874795a3181cce7aaf228b1e3fb3899587ffd3ae7546de328c90" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "59ca830d4df5e79503b79103485d28c6a578ca14d526ffc6a43596808daf1282" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "cb18233197cedab557c70d171b511bed49cc702f428750925280090c31498bd2" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "d1a42ed39a15a843cccadf107ee0242b5f78bfbb5b70ba3ce19f3ea9fda8f52d" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
=======
    ("f71859eae71f7f795e734e6e7d178728525008a28c325913f564a42f74042c31" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "222113f148cd70d99c44d84bf4e3a76795f001bd6cfd449b7ff27aeda65ffd78" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "afc220610bee26945b7c750b0cca03775a8b73c27fdca81a586a0a62d45bbce2" "6d8d8af130783e4e91bfcda284ad3271e598e9e78374f5ad406ab63243e75982" "19553e40ff93a241cdfce090fd60e1420e0b371eec1d134a0da21f6f6488a74a" "1c50040ec3b3480b1fec3a0e912cac1eb011c27dd16d087d61e72054685de345" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "9122dfb203945f6e84b0de66d11a97de6c9edf28b3b5db772472e4beccc6b3c5" "d09467d742f713443c7699a546c0300db1a75fed347e09e3f178ab2f3aa2c617" "9e87bddff84cbce28c01fa05eb22f986d770628fa202cd5ca0cd7ed53db2f068" "01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "5f8f1e226274b73f6e706431399a597dbfd64db34f3fba56a6ccf57d148a0e01" "78f614a58e085bd7b33809e98b6f1a5cdd38dae6257e48176ce21424ee89d058" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "0c387e27a3dd040b33c6711ff92e13bd952369a788eee97e4e4ea2335ac5528f" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "9ab634dcc9131f79016c96c4955298409649f6538908c743a8a9d2c6bc8321ef" "76bd62f6ce376bf0597fab7f478eaa98cd94a7b41f0ae46de63a958fbe99c1d9" "91fba9a99f7b64390e1f56319c3dbbaed22de1b9676b3c73d935bf62277b799c" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "e426d22803ef4c21c1735ca0cb638e80e0893cac629ce3b879b94bd3bb67a7a0" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" "d5aac94c0051c3acec2b274347b343372b4e64c3e226be7b7c56725ea26b1ba8" "101a10b15bbbd0d5a0e56e4773e614962197886780afb2d62523a63a144ad96c" "890d09dcc8d2326e98eee74b307b2cc42f07ab7701bcff521e6152aa3e08f7a8" "e8e744a1b0726814ac3ab86ad5ccdf658b9ff1c5a63c4dc23841007874044d4a" "294834baa9ca874795a3181cce7aaf228b1e3fb3899587ffd3ae7546de328c90" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "59ca830d4df5e79503b79103485d28c6a578ca14d526ffc6a43596808daf1282" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "cb18233197cedab557c70d171b511bed49cc702f428750925280090c31498bd2" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "d1a42ed39a15a843cccadf107ee0242b5f78bfbb5b70ba3ce19f3ea9fda8f52d" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(evil-goggles-mode t nil (evil-goggles))
>>>>>>> Stashed changes
 '(flycheck-phpcs-standard "WellspringCodingStandard")
 '(lsp-php-workspace-root-detectors
   (quote
    (lsp-php-root-projectile lsp-php-root-composer-json "index.php" "robots.txt")))
 '(package-selected-packages
   (quote
<<<<<<< Updated upstream
    (rjsx-mode json-mode prettier-js tide company-tern tern geiser hy-mode lsp-python smartparens company-lsp lsp-ui multi-term ob-restclient company-restclient restclient restart-emacs editorconfig counsel-projectile counsel php-eldoc company-php phpcbf kaolin-themes eglot lsp-php challenger-deep-theme evil-goggles spacemacs-theme diff-hl eyebrowse vi-tilde-fringe dumb-jump solaire-mode treemacs-projectile treemacs-evil treemacs yasnippet-snippets yasnippet-classic-snippets php-mode keyfreq general htmlize git-gutter ox-pandoc ox-nikola doom-modeline magit-org-todos olivetti pipenv stumpwm-mode use-package-ensure-system-package js2-mode all-the-icons web-mode use-package twilight-theme subatomic256-theme spacegray-theme slime-theme slime slack reykjavik-theme rainbow-mode rainbow-delimiters racket-mode planet-theme paredit paradox ox-twbs org-bullets omnisharp obsidian-theme nyan-mode neotree material-theme kooten-theme jedi jabber hlinum hipster-theme helm haskell-mode gruvbox-theme gotham-theme flatland-theme flatland-black-theme farmhouse-theme evil-magit dracula-theme darktooth-theme cyberpunk-theme bubbleberry-theme base16-theme afternoon-theme)))
=======
    (ede-php-autoload-composer-installers challenger-deep-theme evil-goggles spacemacs-theme diff-hl eyebrowse vi-tilde-fringe dumb-jump solaire-mode treemacs-projectile treemacs-evil treemacs yasnippet-snippets yasnippet-classic-snippets php-mode keyfreq general htmlize git-gutter ox-pandoc ox-nikola doom-modeline magit-org-todos olivetti pipenv stumpwm-mode use-package-ensure-system-package js2-mode all-the-icons web-mode use-package twilight-theme subatomic256-theme spacegray-theme slime-theme slime slack reykjavik-theme rainbow-mode rainbow-delimiters racket-mode planet-theme paredit paradox ox-twbs org-bullets omnisharp obsidian-theme nyan-mode neotree material-theme kooten-theme jedi jabber hlinum hipster-theme helm haskell-mode gruvbox-theme gotham-theme flatland-theme flatland-black-theme farmhouse-theme evil-magit dracula-theme darktooth-theme cyberpunk-theme bubbleberry-theme base16-theme afternoon-theme)))
>>>>>>> Stashed changes
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-1 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-1 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-1 :height 1.0)))))

;;(org-babel-load-file "~/.emacs.d/starting.org")
;;(org-babel-load-file "~/.emacs.d/emacs.org")
(org-babel-load-file "~/dotfiles/emacs.org")


