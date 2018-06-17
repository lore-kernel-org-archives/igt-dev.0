Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Sat, 16 Jun 2018 21:34:29 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <d6f004f76c5f7524a7491f1b4f5feb23893f5b07.1529175003.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1529175003.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1529175003.git.rodrigosiqueiramelo@gmail.com>
Subject: [Intel-gfx] [PATCH V2 i-g-t 2/3] Account for NULL character when
 using strncpy
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
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCBmaXggdGhlIGZvbGxvd2luZyBnY2Mgd2FybmluZzoKCndhcm5pbmc6IOKAmHN0
cm5jcHnigJkgc3BlY2lmaWVkIGJvdW5kIDMyIGVxdWFscyBkZXN0aW5hdGlvbiBzaXplClstV3N0
cmluZ29wLXRydW5jYXRpb25dCiAgc3RybmNweShkYXRhLT5uYW1lLCBuYW1lLCBQQVJBTV9OQU1F
X01BWF9TWik7CgpUaGlzIGVycm9yIGhhcHBlbnMgZHVlIHRvIHRoZSAnXDAnIGNoYXJhY3RlciBh
cHBlbmRlZCBieSBzdHJuY3B5LiBOb3RpY2UKdGhhdCByZWR1Y2VzIGJ5IG9uZSBpbiB0aGUgdG90
YWwgb2YgYnl0ZXMgdG8gYmUgY29waWVkLCBpbiB0aGlzIGNhc2UsIGlzCmhhcm1sZXNzIGJlY2F1
c2UgdGhlIHN0cmluZ3MgcmVjZWl2ZWQgaW4gdGhlIHBhcmFtZXRlciBhbHJlYWR5IGhhdmUKJ1ww
Jy4KClNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9A
Z21haWwuY29tPgotLS0KIGxpYi9pZ3RfYXV4LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2F1eC5jIGIv
bGliL2lndF9hdXguYwppbmRleCAxZWE1MmVmZS4uYTYwNWJlY2MgMTAwNjQ0Ci0tLSBhL2xpYi9p
Z3RfYXV4LmMKKysrIGIvbGliL2lndF9hdXguYwpAQCAtMTI0NCw3ICsxMjQ0LDcgQEAgc3RhdGlj
IHZvaWQgaWd0X3NhdmVfbW9kdWxlX3BhcmFtKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIg
KmZpbGVfcGF0aCkKIAlkYXRhID0gY2FsbG9jKDEsIHNpemVvZiAoKmRhdGEpKTsKIAlpZ3RfYXNz
ZXJ0KGRhdGEpOwogCi0Jc3RybmNweShkYXRhLT5uYW1lLCBuYW1lLCBQQVJBTV9OQU1FX01BWF9T
Wik7CisJc3RybmNweShkYXRhLT5uYW1lLCBuYW1lLCBQQVJBTV9OQU1FX01BWF9TWiAtIDEpOwog
CiAJZmQgPSBvcGVuKGZpbGVfcGF0aCwgT19SRE9OTFkpOwogCWlndF9hc3NlcnQoZmQgPj0gMCk7
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdm
eAo=
