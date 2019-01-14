Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEDC6E2F4
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 11:39:33 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
Date: Mon, 14 Jan 2019 13:41:03 +0200
Message-Id: <20190114114105.6944-1-jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/3] dim: pass git directory via parameter in dim
 cite, don't cd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

TWFrZSBkaW1fY2l0ZSBzYWZlciB0byB1c2Ugd2l0aGluIGRpbS4KClNpZ25lZC1vZmYtYnk6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0tLQogZGltIHwgNSArKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kaW0gYi9kaW0KaW5kZXggYjJmZGRmZjEwMTBjLi45YWFjODE3YmU1NjcgMTAwNzU1Ci0tLSBh
L2RpbQorKysgYi9kaW0KQEAgLTIyNzUsOSArMjI3NSw4IEBAIGZ1bmN0aW9uIGRpbV9jaXRlCiAK
IAlzaGExPSR7MTo/JHVzYWdlfQogCi0JY2QgJERJTV9QUkVGSVgvJERJTV9SRVBPCi0KLQlnaXQg
bG9nIC0xICRzaGExICItLXByZXR0eT1mb3JtYXQ6JUggKFwiJXNcIiklbiIgfCBcCisJZ2l0IC0t
Z2l0LWRpcj0iJERJTV9QUkVGSVgvJERJTV9SRVBPLy5naXQiIGxvZyAtMSAkc2hhMSBcCisJICAg
ICItLXByZXR0eT1mb3JtYXQ6JUggKFwiJXNcIiklbiIgfCBcCiAJCXNlZCAtZSAncy9cKFswLWZd
XHsxMlx9XClbMC1mXSovXDEvJwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
