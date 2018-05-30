Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 29 May 2018 21:46:55 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <0d8325c242cc19f74149bfe721e395bf4de951df.1527639529.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1527639529.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1527639529.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 2/3] Remove extra '\0' in strncpy in
 igt_save_module_param
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
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, gustavo@padovan.org, intel-gfx@lists.freedesktop.org
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
bGliL2lndF9hdXguYwppbmRleCA1ZGQyNzYxZS4uMDZmNTg2ZDYgMTAwNjQ0Ci0tLSBhL2xpYi9p
Z3RfYXV4LmMKKysrIGIvbGliL2lndF9hdXguYwpAQCAtMTI0MCw3ICsxMjQwLDcgQEAgc3RhdGlj
IHZvaWQgaWd0X3NhdmVfbW9kdWxlX3BhcmFtKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIg
KmZpbGVfcGF0aCkKIAlkYXRhID0gY2FsbG9jKDEsIHNpemVvZiAoKmRhdGEpKTsKIAlpZ3RfYXNz
ZXJ0KGRhdGEpOwogCi0Jc3RybmNweShkYXRhLT5uYW1lLCBuYW1lLCBQQVJBTV9OQU1FX01BWF9T
Wik7CisJc3RybmNweShkYXRhLT5uYW1lLCBuYW1lLCBQQVJBTV9OQU1FX01BWF9TWiAtIDEpOyAv
LyAtMSBiZWNhdXNlIG9mICdcMCcKIAogCWZkID0gb3BlbihmaWxlX3BhdGgsIE9fUkRPTkxZKTsK
IAlpZ3RfYXNzZXJ0KGZkID49IDApOwotLSAKMi4xNy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
