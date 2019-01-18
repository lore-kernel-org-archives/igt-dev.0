Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 18 Jan 2019 21:18:01 +0000
Message-Id: <20190118211801.6362-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_capture: Really confirm error
 capturing is enabling
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SWYgdGhlIGRldmljZSBoYXMgZXJyb3IgY2FwdHVyaW5nIGRpc2FibGVkLCB3ZSBzdGlsbCBhbGxv
dyBwcmV2aW91cwplcnJvciBzdGF0ZSB0byBiZSBjbGVhcmVkIGJ5IGEgd3JpdGUgdG8gc3lzZnMv
ZXJyb3IuIFRvIGFjdHVhbGx5IGNvbmZpcm0KdGhhdCB3ZSBjYW4gY2FwdHVyZSBhIGZyZXNoIGVy
cm9yIHN0YXRlLCB3ZSBoYXZlIHRvIHBlcmZvcm0gYSByZWFkKCkuCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2dl
bV9leGVjX2NhcHR1cmUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19jYXB0dXJlLmMgYi90ZXN0cy9pOTE1L2dl
bV9leGVjX2NhcHR1cmUuYwppbmRleCBmMjZiNDEwMmMuLjQ5Mzk0YzMxMSAxMDA2NDQKLS0tIGEv
dGVzdHMvaTkxNS9nZW1fZXhlY19jYXB0dXJlLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19j
YXB0dXJlLmMKQEAgLTU0NCw2ICs1NDQsNyBAQCBpZ3RfbWFpbgogCiAJCWRpciA9IGlndF9zeXNm
c19vcGVuKGZkLCBOVUxMKTsKIAkJaWd0X3JlcXVpcmUoaWd0X3N5c2ZzX3NldChkaXIsICJlcnJv
ciIsICJCZWdvbmUhIikpOworCQlpZ3RfcmVxdWlyZShpZ3Rfc3lzZnNfZ2V0KGRpciwgImVycm9y
IikpOwogCX0KIAogCWZvciAoZSA9IGludGVsX2V4ZWN1dGlvbl9lbmdpbmVzOyBlLT5uYW1lOyBl
KyspIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
