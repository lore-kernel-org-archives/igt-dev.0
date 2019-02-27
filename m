Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B9D6E102
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Feb 2019 18:06:58 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 27 Feb 2019 20:06:43 +0200
Message-Id: <20190227180643.8038-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] meson: Make doc building dependent on
 gtk-doc
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Q3VycmVudGx5LCB3aGVuIGd0ay1kb2MgaXMgbm90IGluc3RhbGxlZCAnbmluamEnIHN1Y2NlZWRz
IGJ1dAonbmluamEgaW5zdGFsbCcgZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOgoKICAg
RmlsZU5vdEZvdW5kRXJyb3I6IFtFcnJubyAyXSBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5OiAn
Z3RrZG9jLXNjYW4nOiAnZ3RrZG9jLXNjYW4nCgpXaXRoIHRoaXMgcGF0Y2ggJ21lc29uIGJ1aWxk
JyB3aWxsIGxvZyB0aGF0IGRvY3VtZW50YXRpb25zIHdvdWxkIG5vdApidWlsZCBhbmQgJ25pbmph
IGluc3RhbGwnIHdpbGwgc3VjY2VlZC4KCldoZW4gZm9yY2luZyBidWlsZGluZyBkb2NzIHdpdGgg
J21lc29uIC1EYnVpbGRfZG9jcz10cnVlIGJ1aWxkJyB0aGUKZm9sbG93aW5nIGVycm9yIHdpbGwg
b2NjdXIgaW5zdGVhZDoKCiAgbWVzb24uYnVpbGQ6MzIzOjA6IEVSUk9SOiAgRGVwZW5kZW5jeSAi
Z3RrLWRvYyIgbm90IGZvdW5kLCB0cmllZCBwa2djb25maWcgYW5kIGNtYWtlCgpDYzogUGV0cmkg
TGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+ClJlcG9ydGVkLWJ5OiBUdnJ0a28gVXJz
dWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBcmth
ZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Ci0tLQogbWVzb24uYnVpbGQg
fCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCmluZGV4IDA5OWRiODk3Li41
NTc0MDBhNSAxMDA2NDQKLS0tIGEvbWVzb24uYnVpbGQKKysrIGIvbWVzb24uYnVpbGQKQEAgLTMy
MCw5ICszMjAsMTEgQEAgZW5kaWYKIHN1YmRpcignb3ZlcmxheScpCiBzdWJkaXIoJ21hbicpCiAK
K2d0a19kb2MgPSBkZXBlbmRlbmN5KCdndGstZG9jJywgcmVxdWlyZWQgOiBfZG9jc19yZXF1aXJl
ZCkKKwogZG9jc19pbmZvID0gJ05vJwogaWYgX2J1aWxkX2RvY3MKLQlpZiBfYnVpbGRfdGVzdHMK
KwlpZiBfYnVpbGRfdGVzdHMgYW5kIGd0a19kb2MuZm91bmQoKQogCQlzdWJkaXIoJ2RvY3MnKQog
CQlkb2NzX2luZm8gPSAnWWVzJwogCWVsaWYgX2RvY3NfcmVxdWlyZWQKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
