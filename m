Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Mon, 20 May 2019 15:47:14 +0100
Message-Id: <20190520144739.13111-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20190520144739.13111-1-tvrtko.ursulin@linux.intel.com>
References: <20190520144739.13111-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 02/27] trace.pl: Ignore signaling on non
 i915 fences
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
aXB0cy90cmFjZS5wbCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvc2NyaXB0cy90cmFjZS5wbCBiL3NjcmlwdHMvdHJhY2UucGwKaW5kZXggOGM4
OTZjZmRlNmIwLi5hYzE0MWE1MTQwNTUgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvdHJhY2UucGwKKysr
IGIvc2NyaXB0cy90cmFjZS5wbApAQCAtNDQzLDYgKzQ0Myw5IEBAIHdoaWxlICg8PikgewogCX0g
ZWxzaWYgKCR0cF9uYW1lIGVxICdkbWFfZmVuY2U6ZG1hX2ZlbmNlX3NpZ25hbGVkOicpIHsKIAkJ
bXkgJG5rZXk7CiAKKwkJbmV4dCB1bmxlc3MgJHRweydkcml2ZXInfSBlcSAnaTkxNScgYW5kCisJ
CQkgICAgJHRweyd0aW1lbGluZSd9IGVxICdzaWduYWxlZCc7CisKIAkJJG5rZXkgPSBub3RpZnlf
a2V5KCR0cHsnY29udGV4dCd9LCAkdHB7J3NlcW5vJ30pOwogCiAJCWRpZSBpZiBleGlzdHMgJG5v
dGlmeXskbmtleX07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
