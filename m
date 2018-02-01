Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4CB6EE80
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2018 17:32:20 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu,  1 Feb 2018 17:32:14 +0000
Message-Id: <20180201173216.22531-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/3] overlay: add missing foreground option
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SXQgc2VlbXMgd2UgaGFuZGxlIC1mIGJ1dCB3ZSBmb3Jnb3QgdG8gbGlzdCBpdC4KClNpZ25lZC1v
ZmYtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4K
LS0tCiBvdmVybGF5L292ZXJsYXkuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9vdmVybGF5L292ZXJsYXkuYyBiL292ZXJsYXkvb3ZlcmxheS5j
CmluZGV4IDQ4MDRmODEzLi41NDVhZjdiYyAxMDA2NDQKLS0tIGEvb3ZlcmxheS9vdmVybGF5LmMK
KysrIGIvb3ZlcmxheS9vdmVybGF5LmMKQEAgLTg0MCw2ICs4NDAsNyBAQCBzdGF0aWMgdm9pZCB1
c2FnZShjb25zdCBjaGFyICpwcm9nbmFtZSkKIAlwcmludGYoIlx0LS1nZW9tZXRyeXwtRyA8d2lk
dGg+eDxoZWlnaHQ+Kzx4LW9mZnNldD4rPHktb2Zmc2V0Plx0RXhhY3Qgd2luZG93IHBsYWNlbWVu
dCBhbmQgc2l6ZVxuIik7CiAJcHJpbnRmKCJcdC0tcG9zaXRpb258LVAgKHRvcHxtaWRkbGV8Ym90
dG9tKS0obGVmdHxjZW50cmV8cmlnaHQpXHRQbGFjZSB0aGUgd2luZG93IGluIGEgcGFydGljdWxh
ciBjb3JuZXJcbiIpOwogCXByaW50ZigiXHQtLXNpemV8LVMgPHdpZHRoPng8aGVpZ2h0PiB8IDxz
Y2FsZT4lJVx0XHRcdFdpbmRvdyBzaXplXG4iKTsKKwlwcmludGYoIlx0LS1mb3JlZ3JvdW5kfC1m
XHRcdFx0XHRcdFx0S2VlcCB0aGUgYXBwbGljYXRpb24gaW4gZm9yZWdyb3VuZFxuIik7CiAJcHJp
bnRmKCJcdC0taGVscHwtaFx0XHRcdFx0XHRcdFRoaXMgaGVscCBtZXNzYWdlXG4iKTsKIH0KIApA
QCAtODUwLDYgKzg1MSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAkJeyJn
ZW9tZXRyeSIsIDEsIDAsICdHJ30sCiAJCXsicG9zaXRpb24iLCAxLCAwLCAnUCd9LAogCQl7InNp
emUiLCAxLCAwLCAnUyd9LAorCQl7ImZvcmVncm91bmQiLCAwLCAwLCAnZid9LAogCQl7ImhlbHAi
LCAwLCAwLCAnaCd9LAogCQl7TlVMTCwgMCwgMCwgMCx9CiAJfTsKLS0gCjIuMTUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
