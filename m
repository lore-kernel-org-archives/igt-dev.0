Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Wed,  2 May 2018 20:17:00 +0100
Message-Id: <20180502191700.28973-1-matthew.auld@intel.com>
Subject: [Intel-gfx] [PATCH i-g-t] tests/gem_userptr_blits: test zero
 user_size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hlY2sgdGhhdCB0aGUga2VybmVsIHJlamVjdHMgYSB6ZXJvIHVzZXJfc2l6ZS4KClNpZ25lZC1v
ZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KQ2M6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2dlbV91c2VycHRyX2Js
aXRzLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvdGVzdHMvZ2VtX3VzZXJwdHJfYmxpdHMuYyBiL3Rlc3RzL2dlbV91c2VycHRyX2Js
aXRzLmMKaW5kZXggODQ5MDU0YWQuLjdlM2I2ZWYzIDEwMDY0NAotLS0gYS90ZXN0cy9nZW1fdXNl
cnB0cl9ibGl0cy5jCisrKyBiL3Rlc3RzL2dlbV91c2VycHRyX2JsaXRzLmMKQEAgLTQ0Miw2ICs0
NDIsMTQgQEAgc3RhdGljIGludCB0ZXN0X2lucHV0X2NoZWNraW5nKGludCBmZCkKIAlyZXQgPSBk
cm1Jb2N0bChmZCwgTE9DQUxfSU9DVExfSTkxNV9HRU1fVVNFUlBUUiwgJnVzZXJwdHIpOwogCWln
dF9hc3NlcnRfbmVxKHJldCwgMCk7CiAKKwkvKiBaZXJvIHVzZXJfc2l6ZS4gKi8KKwltZW1zZXQo
JnVzZXJwdHIsIDAsIHNpemVvZih1c2VycHRyKSk7CisJdXNlcnB0ci51c2VyX3B0ciA9IDA7CisJ
dXNlcnB0ci51c2VyX3NpemUgPSAwOworCXVzZXJwdHIuZmxhZ3MgPSAwOworCXJldCA9IGRybUlv
Y3RsKGZkLCBMT0NBTF9JT0NUTF9JOTE1X0dFTV9VU0VSUFRSLCAmdXNlcnB0cik7CisJaWd0X2Fz
c2VydF9uZXEocmV0LCAwKTsKKwogCXJldHVybiAwOwogfQogCi0tIAoyLjE3LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5n
IGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
