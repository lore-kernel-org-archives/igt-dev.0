Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 28 Feb 2019 14:18:28 +0000
Message-Id: <20190228141828.2567-5-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
References: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 5/5] tests/i915/pm_rc6_residency: Fix
 linking
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClByb2JhYmx5
IGEgbGVmdG92ZXIgZnJvbSB0ZXN0IHJlbmFtZXM6CgogIHRlc3RzL01ha2VmaWxlLmFtOjEzNDog
d2FybmluZzogdmFyaWFibGUgJ3BtX3JjNl9yZXNpZGVuY3lfTERBREQnIGlzIGRlZmluZWQgYnV0
IG5vIHByb2dyYW0gb3IKICB0ZXN0cy9NYWtlZmlsZS5hbToxMzQ6IGxpYnJhcnkgaGFzICdwbV9y
YzZfcmVzaWRlbmN5JyBhcyBjYW5vbmljYWwgbmFtZSAocG9zc2libGUgdHlwbykKClNpZ25lZC1v
ZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQogdGVz
dHMvTWFrZWZpbGUuYW0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9NYWtlZmlsZS5hbSBiL3Rlc3RzL01ha2Vm
aWxlLmFtCmluZGV4IGM1ZGQyMTBjNzE2My4uODBiYzVmOTJhMTNiIDEwMDY0NAotLS0gYS90ZXN0
cy9NYWtlZmlsZS5hbQorKysgYi90ZXN0cy9NYWtlZmlsZS5hbQpAQCAtMTMxLDcgKzEzMSw3IEBA
IHBlcmZfcG11X0xEQUREID0gJChMREFERCkgJCh0b3BfYnVpbGRkaXIpL2xpYi9saWJpZ3RfcGVy
Zi5sYQogZ2VtX2Vpb19MREFERCA9ICQoTERBREQpIC1scnQKIGdlbV93YWl0X0xEQUREID0gJChM
REFERCkgLWxydAoga21zX2ZsaXBfTERBREQgPSAkKExEQUREKSAtbHJ0IC1scHRocmVhZAotcG1f
cmM2X3Jlc2lkZW5jeV9MREFERCA9ICQoTERBREQpIC1scnQKK2k5MTVfcG1fcmM2X3Jlc2lkZW5j
eV9MREFERCA9ICQoTERBREQpIC1scnQKIAogcHJpbWVfbnZfdGVzdF9DRkxBR1MgPSAkKEFNX0NG
TEFHUykgJChEUk1fTk9VVkVBVV9DRkxBR1MpCiBwcmltZV9udl90ZXN0X0xEQUREID0gJChMREFE
RCkgJChEUk1fTk9VVkVBVV9MSUJTKQotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1nZng=
