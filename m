Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Mon, 20 May 2019 13:04:55 +0100
Message-Id: <20190520120455.878-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20190517112526.6738-3-tvrtko.ursulin@linux.intel.com>
References: <20190517112526.6738-3-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 02/25] trace.pl: Ignore signaling on non i915
 fences
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCmdlbV93c2lt
IHVzZXMgdGhlIHN3X2ZlbmNlIHRpbWVsaW5lIGFuZCBjb25mdXNlcyB0aGUgc2NyaXB0LgoKdjI6
CiAqIENoZWNrIHRoZSBjb3JyZWN0IHRpbWVsaW5lIGFzIHdlbGwuIChDaHJpcykKClNpZ25lZC1v
ZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQogc2Ny
aXB0cy90cmFjZS5wbCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9zY3JpcHRzL3RyYWNlLnBsIGIvc2NyaXB0cy90cmFjZS5wbAppbmRleCBiN2Ji
YWJjNzlmNjguLjVmNzBjZDIzOTc5YiAxMDA3NTUKLS0tIGEvc2NyaXB0cy90cmFjZS5wbAorKysg
Yi9zY3JpcHRzL3RyYWNlLnBsCkBAIC00MzksNiArNDM5LDggQEAgd2hpbGUgKDw+KSB7CiAJfSBl
bHNpZiAoJHRwX25hbWUgZXEgJ2RtYV9mZW5jZTpkbWFfZmVuY2Vfc2lnbmFsZWQ6JykgewogCQlt
eSAkZ2tleTsKIAorCQluZXh0IHVubGVzcyAkdHB7J2RyaXZlcid9IGVxICdpOTE1JyBhbmQKKwkJ
CSAgICAkdHB7J3RpbWVsaW5lJ30gZXEgJ3NpZ25hbGVkJzsKIAkJZGllIHVubGVzcyBleGlzdHMg
JGN0eGVuZ2luZXN7JHRweydjb250ZXh0J319OwogCiAJCSRna2V5ID0gZGJfa2V5KCRjdHhlbmdp
bmVzeyR0cHsnY29udGV4dCd9fSwgJHRweydjb250ZXh0J30sICR0cHsnc2Vxbm8nfSk7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
