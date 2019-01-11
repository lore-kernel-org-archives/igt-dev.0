Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 11 Jan 2019 13:54:00 +0000
Message-Id: <20190111135400.23246-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190107112833.19083-1-chris@chris-wilson.co.uk>
References: <20190107112833.19083-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] i915/gem_tiled_pread: Skip on unknown
 swizzling
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

SWYgd2UgZG8gbm90IGtub3cgdGhlIHVuZGVybHlpbmcgc3dpenpsZSBvbiB0aGUgSFcsIHdlIGRv
IG5vdCBrbm93IHRoZQpmdWxsIHRpbGluZyBwYXR0ZXJuIGFuZCBjYW5ub3QgcHJlZGljdCB0aGUg
ZXhwZWN0ZWQgcmVzdWx0cy4gVGhpcyBpcwpvZnRlbiBiZWNhdXNlIHRoZSBzd2l6emxlIHZhcmll
cyBiZXR3ZWVuIHBhZ2VzIGFuZCBpcyBub3QgYXMgY29uc3RhbnQgYXMKd2UgbmFpdmVseSBleHBl
Y3RlZC4KCnYyOiBnZW1fZ2V0X3RpbGluZygpIGRvZXMgdGhlIHBoeXNpY2FsPT1yZXBvcnRlZCBj
aGVjaywgd2UganVzdCBuZWVkIHRvCmFkZCBhbiBhY3F1aXJlCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IDx0dnJ0a28udXJzdWxpbkBs
aW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fdGlsZWRfcHJlYWRfcHdyaXRlLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV90aWxlZF9wcmVhZF9wd3JpdGUuYyBiL3Rlc3RzL2k5
MTUvZ2VtX3RpbGVkX3ByZWFkX3B3cml0ZS5jCmluZGV4IDMxM2RhYTM4OC4uZmNmMDc4MGFmIDEw
MDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV90aWxlZF9wcmVhZF9wd3JpdGUuYworKysgYi90ZXN0
cy9pOTE1L2dlbV90aWxlZF9wcmVhZF9wd3JpdGUuYwpAQCAtMTIyLDcgKzEyMiw3IEBAIGlndF9z
aW1wbGVfbWFpbgogCQljdXJyZW50X3RpbGluZ19tb2RlID0gSTkxNV9USUxJTkdfWDsKIAogCQlo
YW5kbGUgPSBjcmVhdGVfYm9fYW5kX2ZpbGwoZmQpOwotCQlnZW1fZ2V0X3RpbGluZyhmZCwgaGFu
ZGxlLCAmdGlsaW5nLCAmc3dpenpsZSk7CisJCWlndF9yZXF1aXJlKGdlbV9nZXRfdGlsaW5nKGZk
LCBoYW5kbGUsICZ0aWxpbmcsICZzd2l6emxlKSk7CiAKIAkJZ2VtX3JlYWQoZmQsIGhhbmRsZSwg
MCwgbGluZWFyLCBzaXplb2YobGluZWFyKSk7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
