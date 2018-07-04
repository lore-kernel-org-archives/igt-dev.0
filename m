Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  4 Jul 2018 15:51:00 +0100
Message-Id: <20180704145100.19202-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] igt/perf: Check the GPU is not wedged
 before running
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SWYgdGhlIEdQVSBpcyBub3QgdXNhYmxlLCB3ZSB3aWxsIG5vdCBiZSBhYmxlIHRvIHN1Ym1pdCB3
b3JrbG9hZHMgdG8gYmUKbWVhc3VyZWQgYW5kIHNvIG9ic2VydmluZyB0aGVtIHdpbGwgZmFpbC4K
ClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpD
YzogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgotLS0K
IHRlc3RzL3BlcmYuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvdGVzdHMvcGVyZi5jIGIvdGVzdHMvcGVyZi5jCmluZGV4IDk1MDQ4YmZhNS4u
MjczNjkxOGY3IDEwMDY0NAotLS0gYS90ZXN0cy9wZXJmLmMKKysrIGIvdGVzdHMvcGVyZi5jCkBA
IC00MTA5LDcgKzQxMDksMTAgQEAgaWd0X21haW4KIAkJICogc2hvdWxkIGhhdmUgY2xvc2VkIGRy
bV9mZC4uLgogCQkgKi8KIAkJaWd0X2Fzc2VydF9lcShkcm1fZmQsIC0xKTsKKwogCQlkcm1fZmQg
PSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsKKwkJaWd0X3JlcXVpcmVfZ2VtKGRybV9m
ZCk7CisKIAkJZGV2aWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGRybV9mZCk7CiAJCXN5c2ZzID0g
aWd0X3N5c2ZzX29wZW4oZHJtX2ZkLCAmY2FyZCk7CiAKLS0gCjIuMTguMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
