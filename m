Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD096E0DB
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 16:52:18 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue,  6 Mar 2018 18:52:11 +0200
Message-Id: <20180306165215.16490-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/4] kms_plane: Add clipping subtests
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
Cc: =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBpcyB2MiBvZiBbMV0sIGZpeGluZyB0aGUgaXNzdWVzIHJlcG9ydGVkIGJ5IEFyZWsgYW5k
IENJLiBCZXNpZGVzCnRoZSBjaGFuZ2VzIGRlc2NyaWJlZCBpbiBwYXRjaCA0LCB0aGVyZSBpcyBh
bHNvIGFuIEZCQyB3b3JrYXJvdW5kCmFwcGxpZWQgbm93IGluIGtlcm5lbC4gV2l0aG91dCB0aGUg
V0EgdGhlIHRlc3QgY2FzZXMgdXNpbmcgdGhlIHByaW1hcnkKcGxhbmUgKHdpdGggRkJDKSBjb3Vs
ZCB0cmlnZ2VyIEZJRk8gdW5kZXJmbG93IGVycm9ycy4KCk5vdGUgdGhhdCB0aGUgc3VidGVzdCB0
YWtlcyB+NDAgc2Vjb25kcyB0byBydW4gb24gYSBzaW5nbGUgcGlwZS4KClsxXQpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9pZ3QtZGV2LzIwMTgtRmVicnVhcnkvMDAwNTIz
Lmh0bWwKCkNjOiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPgpDYzogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IEp1aGEt
UGVra2EgSGVpa2tpbMOkIDxqdWhhLXBla2thLmhlaWtraWxhQGludGVsLmNvbT4KQ2M6IEFya2Fk
aXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KCkltcmUgRGVhayAoNCk6CiAg
a21zX3BsYW5lOiBSZW1vdmUgcmVkdW5kYW50IG1vZGVzZXQgYWZ0ZXIgQ1JDIGNhcHR1cmUKICBs
aWI6IEV4cG9ydCBoZWxwZXJzIHRvIGdldCByb3RhdGlvbi90aWxpbmcgc3RyaW5ncwogIGttc19w
bGFuZTogU3BsaXQgaGVscGVycyBjcmVhdGluZyByZWZlcmVuY2UgRkIgYW5kIGNhcHR1cmluZyBD
UkMKICBrbXNfcGxhbmU6IEFkZCBjbGlwcGluZyBzdWJ0ZXN0cwoKIGxpYi9pZ3RfZmIuYyAgICAg
IHwgIDIzICsrKwogbGliL2lndF9mYi5oICAgICAgfCAgIDEgKwogbGliL2lndF9rbXMuYyAgICAg
fCAgMTEgKy0KIGxpYi9pZ3Rfa21zLmggICAgIHwgICAxICsKIHRlc3RzL2ttc19wbGFuZS5jIHwg
NTAyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LQogNSBmaWxlcyBjaGFuZ2VkLCA1MTcgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgot
LSAKMi4xMy4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
