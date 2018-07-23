Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 23 Jul 2018 21:07:33 +0100
Message-Id: <20180723200736.29508-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH i-g-t 1/4] lib: Don't assert all KMS drivers
 support edid_override
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

ZWRpZF9vdmVycmlkZSBpcyBhIGk5MTUua28gZGVidWdmcyBmZWF0dXJlOyBqdXN0IHNraXAgYW55
IGttcyB0ZXN0IHRoYXQKZGVwZW5kcyBvbiBiZWluZyBhYmxlIHRvIG92ZXJyaWRlIHRoZSBlZGlk
LgoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lk
PTEwNzMzNwpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xpYi9p
Z3Rfa21zLmMKaW5kZXggNDc2YTc4NjIzLi5jOWUwMGMzYmQgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rf
a21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAtOTEzLDcgKzkxMyw3IEBAIHZvaWQga21zdGVz
dF9mb3JjZV9lZGlkKGludCBkcm1fZmQsIGRybU1vZGVDb25uZWN0b3IgKmNvbm5lY3RvciwKIAlk
ZWJ1Z2ZzX2ZkID0gaWd0X2RlYnVnZnNfb3Blbihkcm1fZmQsIHBhdGgsIE9fV1JPTkxZIHwgT19U
UlVOQyk7CiAJZnJlZShwYXRoKTsKIAotCWlndF9hc3NlcnQoZGVidWdmc19mZCAhPSAtMSk7CisJ
aWd0X3JlcXVpcmUoZGVidWdmc19mZCAhPSAtMSk7CiAKIAlpZiAobGVuZ3RoID09IDApCiAJCXJl
dCA9IHdyaXRlKGRlYnVnZnNfZmQsICJyZXNldCIsIDUpOwotLSAKMi4xOC4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBs
aXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
