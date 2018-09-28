Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Deepak Rawat <drawat@vmware.com>
Date: Thu, 27 Sep 2018 17:43:47 -0700
Message-ID: <20180928004350.2346-4-drawat@vmware.com>
In-Reply-To: <20180928004350.2346-1-drawat@vmware.com>
References: <20180928004350.2346-1-drawat@vmware.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] lib/igt_fb: Don't call gem_set_domain()
 for dumb buffer
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, syeh@vmware.com
Cc: Deepak Rawat <drawat@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

Z2VtX3NldF9kb21haW4oKSBpcyBnZW0gc3BlY2lmaWMgYW5kIG5vdCBuZWVkZWQgZm9yIGR1bWIg
YnVmZmVycy4KClNpZ25lZC1vZmYtYnk6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+
Ci0tLQogbGliL2lndF9mYi5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIv
aWd0X2ZiLmMKaW5kZXggMDQ4NTcwOGIuLjc0YTRiNTAxIDEwMDY0NAotLS0gYS9saWIvaWd0X2Zi
LmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC0xMzU2LDE1ICsxMzU2LDE1IEBAIHN0YXRpYyB2b2lk
IGNyZWF0ZV9jYWlyb19zdXJmYWNlX19ndHQoaW50IGZkLCBzdHJ1Y3QgaWd0X2ZiICpmYikKIHsK
IAl2b2lkICpwdHI7CiAKLQlnZW1fc2V0X2RvbWFpbihmZCwgZmItPmdlbV9oYW5kbGUsCi0JCSAg
ICAgICBJOTE1X0dFTV9ET01BSU5fR1RULCBJOTE1X0dFTV9ET01BSU5fR1RUKTsKLQogCWlmIChm
Yi0+aXNfZHVtYikKIAkJcHRyID0ga21zdGVzdF9kdW1iX21hcF9idWZmZXIoZmQsIGZiLT5nZW1f
aGFuZGxlLCBmYi0+c2l6ZSwKIAkJCQkJICAgICAgUFJPVF9SRUFEIHwgUFJPVF9XUklURSk7Ci0J
ZWxzZQorCWVsc2UgeworCQlnZW1fc2V0X2RvbWFpbihmZCwgZmItPmdlbV9oYW5kbGUsCisJCQkg
ICAgICAgSTkxNV9HRU1fRE9NQUlOX0dUVCwgSTkxNV9HRU1fRE9NQUlOX0dUVCk7CiAJCXB0ciA9
IGdlbV9tbWFwX19ndHQoZmQsIGZiLT5nZW1faGFuZGxlLCBmYi0+c2l6ZSwKIAkJCQkgICAgUFJP
VF9SRUFEIHwgUFJPVF9XUklURSk7CisJfQogCiAJZmItPmNhaXJvX3N1cmZhY2UgPQogCQljYWly
b19pbWFnZV9zdXJmYWNlX2NyZWF0ZV9mb3JfZGF0YShwdHIsCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
