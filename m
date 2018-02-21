Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 21 Feb 2018 11:28:46 +0000
Message-Id: <20180221112846.28284-2-chris@chris-wilson.co.uk>
In-Reply-To: <20180221112846.28284-1-chris@chris-wilson.co.uk>
References: <20180221112846.28284-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt 2/2] igt/debugfs_tests: Record which file is
 being opened in kmsg
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

V2hlbiB0cmFja2luZyBkb3duIHRoZSBjYXVzZSBvZiBhIHBhcnRpY3VsYXIga2VybmVsIHdhcm5p
bmcsIGtub3dpbmcKd2hpY2ggZmlsZSBpdCBpcyBhc3NvY2lhdGVkIHdpdGggY2FuIGJlIGEgYmln
IGNsdWUuIFNvIHdyaXRlIHRoZQpmaWxlbmFtZSBpbnRvIHRoZSBrZXJuZWwgbWVzc2FnZSBsb2cg
cHJpb3IgdG8gb3BlbmluZyBpdC4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2RlYnVnZnNfdGVzdC5jIHwgMyArKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90ZXN0cy9kZWJ1Z2ZzX3Rlc3QuYyBiL3Rlc3RzL2RlYnVnZnNfdGVzdC5jCmluZGV4IDI2OGQ2
ZTc4Li4yZTg3ZTQ0MiAxMDA2NDQKLS0tIGEvdGVzdHMvZGVidWdmc190ZXN0LmMKKysrIGIvdGVz
dHMvZGVidWdmc190ZXN0LmMKQEAgLTYxLDggKzYxLDkgQEAgc3RhdGljIHZvaWQgcmVhZF9hbmRf
ZGlzY2FyZF9zeXNmc19lbnRyaWVzKGludCBwYXRoX2ZkLCBpbnQgaW5kZW50KQogCQkJaW50IHN1
Yl9mZDsKIAkJCXNzaXplX3QgcmV0OwogCi0JCQlpZ3Rfc2V0X3RpbWVvdXQoNSwgInJlYWRpbmcg
c3lzZnMgZW50cnkiKTsKKwkJCWlndF9rbXNnKEtNU0dfREVCVUcgIlJlYWRpbmcgZmlsZSBcIiVz
XCJcbiIsIGRpcmVudC0+ZF9uYW1lKTsKIAkJCWlndF9kZWJ1ZygiJXNSZWFkaW5nIGZpbGUgXCIl
c1wiXG4iLCB0YWJzLCBkaXJlbnQtPmRfbmFtZSk7CisJCQlpZ3Rfc2V0X3RpbWVvdXQoNSwgInJl
YWRpbmcgc3lzZnMgZW50cnkiKTsKIAogCQkJc3ViX2ZkID0gb3BlbmF0KHBhdGhfZmQsIGRpcmVu
dC0+ZF9uYW1lLCBPX1JET05MWSk7CiAJCQlpZiAoc3ViX2ZkID09IC0xKSB7Ci0tIAoyLjE2LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
