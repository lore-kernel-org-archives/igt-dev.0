Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 11 Sep 2020 12:30:31 +0200
Message-Id: <20200911103039.4574-17-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 16/24] tests/core_hotunplug: Explicitly
 ignore unused return values
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U29tZSByZXR1cm4gdmFsdWVzIGFyZSBub3QgdXNlZnVsIGFuZCBjYW4gYmUgaWdub3JlZC4gIFdy
YXAgdGhvc2UgY2FzZXMKaW5zaWRlIGlndF9pZ25vcmVfd2FybigpLCBub3Qgb25seSB0byBtYWtl
IHN1cmUgY29tcGlsZXJzIGFyZSBoYXBweSBidXQKYWxzbyB0byBjbGVhcmx5IGRvY3VtZW50IG91
ciBkZWNpc2lvbnMuCgpTaWduZWQtb2ZmLWJ5OiBKYW51c3ogS3J6eXN6dG9maWsgPGphbnVzei5r
cnp5c3p0b2Zpa0BsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBNaWNoYcWCIFdpbmlhcnNr
aSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvY29yZV9ob3R1bnBsdWcu
YyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMgYi90ZXN0cy9jb3JlX2hv
dHVucGx1Zy5jCmluZGV4IGE3ZGM0Y2YzYi4uNmNmNTZkMDQ3IDEwMDY0NAotLS0gYS90ZXN0cy9j
b3JlX2hvdHVucGx1Zy5jCisrKyBiL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMKQEAgLTI2MSw3ICsy
NjEsNyBAQCBzdGF0aWMgdm9pZCBzZXRfZmlsdGVyX2Zyb21fZGV2aWNlKGludCBmZCkKIAljaGFy
IHBhdGhbUEFUSF9NQVggKyAxXTsKIAogCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3BhdGgoZmQsIHBh
dGgsIFBBVEhfTUFYKSk7Ci0Jc3RybmNhdChwYXRoLCAiL2RldmljZSIsIFBBVEhfTUFYIC0gc3Ry
bGVuKHBhdGgpKTsKKwlpZ3RfaWdub3JlX3dhcm4oc3RybmNhdChwYXRoLCAiL2RldmljZSIsIFBB
VEhfTUFYIC0gc3RybGVuKHBhdGgpKSk7CiAJaWd0X2Fzc2VydChyZWFscGF0aChwYXRoLCBkc3Qp
KTsKIAogCWlndF9kZXZpY2VfZmlsdGVyX2ZyZWVfYWxsKCk7CkBAIC0zOTgsNyArMzk4LDcgQEAg
aWd0X21haW4KIAlpZ3RfZml4dHVyZSB7CiAJCXBvc3RfaGVhbHRoY2hlY2soJnByaXYpOwogCi0J
CWNsb3NlKHByaXYuZmQuc3lzZnNfYnVzKTsKLQkJY2xvc2UocHJpdi5mZC5zeXNmc19kcnYpOwor
CQlpZ3RfaWdub3JlX3dhcm4oY2xvc2UocHJpdi5mZC5zeXNmc19idXMpKTsKKwkJaWd0X2lnbm9y
ZV93YXJuKGNsb3NlKHByaXYuZmQuc3lzZnNfZHJ2KSk7CiAJfQogfQotLSAKMi4yMS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
