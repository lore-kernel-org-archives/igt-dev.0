Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D0B890BA
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Oct 2018 07:49:30 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue,  2 Oct 2018 10:45:42 +0300
Message-Id: <20181002074542.20302-2-petri.latvala@intel.com>
In-Reply-To: <20181002074542.20302-1-petri.latvala@intel.com>
References: <20181002074542.20302-1-petri.latvala@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] runner: Add a unit test that checks for
 fd leaks
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
List-ID: <igt-dev@lists.freedesktop.org>

UHJldHR5IG11Y2ggbmVlZGVkLCBhcyBwcm92ZW4uCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2
YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRp
dXN6LmhpbGVyQGludGVsLmNvbT4KLS0tCiBydW5uZXIvcnVubmVyX3Rlc3RzLmMgfCAxOCArKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvcnVubmVyL3J1bm5lcl90ZXN0cy5jIGIvcnVubmVyL3J1bm5lcl90ZXN0cy5jCmluZGV4
IDM3MDVkNzExLi4zN2QyNzEyMyAxMDA2NDQKLS0tIGEvcnVubmVyL3J1bm5lcl90ZXN0cy5jCisr
KyBiL3J1bm5lci9ydW5uZXJfdGVzdHMuYwpAQCAtMTAwMyw2ICsxMDAzLDI0IEBAIGlndF9tYWlu
CiAJCX0KIAl9CiAKKwlpZ3Rfc3VidGVzdCgiZmlsZS1kZXNjcmlwdG9yLWxlYWthZ2UiKSB7CisJ
CWludCBpOworCisJCS8qCisJCSAqIFRoaXMgaXMgYSBidWlsZC10aW1lIHRlc3QsIGFuZCBpdCdz
IGV4cGVjdGVkIHRoYXQKKwkJICogYWxsIHN1YnRlc3RzIGFyZSBub3JtYWxseSBydW4uIEtlZXAg
dGhpcyBvbmUgYXQgdGhlCisJCSAqIGVuZC4KKwkJICoKKwkJICogVHJ5IHRvIGNsb3NlIHNvbWUg
bnVtYmVyIG9mIGZkcyBhZnRlciBzdGRlcnIgYW5kCisJCSAqIGV4cGVjdCBFQkFERiBmb3IgZWFj
aCBvbmUuCisJCSAqLworCQlmb3IgKGkgPSAzOyBpIDwgNDAwOyBpKyspIHsKKwkJCWVycm5vID0g
MDsKKwkJCWlndF9hc3NlcnRfbmVxKGNsb3NlKGkpLCAwKTsKKwkJCWlndF9hc3NlcnRfZXEoZXJy
bm8sIEVCQURGKTsKKwkJfQorCX0KKwogCWlndF9maXh0dXJlCiAJCWZyZWVfc2V0dGluZ3MoJnNl
dHRpbmdzKTsKIH0KLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
