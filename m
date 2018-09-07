Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42186E972
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Sep 2018 15:52:01 +0000 (UTC)
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date: Fri,  7 Sep 2018 18:51:53 +0300
Message-Id: <20180907155157.5798-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t,v4 0/4] kms_plane: Add clipping subtests
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBpcyB2NCBvZiBbMV0sIFsyXSBhbmQgWzNdIGltcGxlbWVudGluZyBhbiBpZGVhIG9mIERh
bmllbCB0byBhY2hpZXZlCmltcHJvdmluZyB0ZXN0IHNwZWVkLiBCZXNpZGVzIHRoZSBjaGFuZ2Vz
IGRlc2NyaWJlZCBpbiBwYXRjaCA0LgoKTm90ZSB0aGF0IHRoZSBzdWJ0ZXN0IHRha2VzIH4xMCBz
ZWNvbmRzIHRvIHJ1biBvbiBhIHNpbmdsZSBwaXBlLgooYSBwcmlvciB2ZXJzaW9uIHRvb2sgfiA0
MyBzZWNvbmRzLikKClsxXQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9p
Z3QtZGV2LzIwMTgtRmVicnVhcnkvMDAwNTIzLmh0bWwKClsyXQpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9hcmNoaXZlcy9pZ3QtZGV2LzIwMTgtTWFyY2gvMDAxNDA3Lmh0bWwKClszXQpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9pZ3QtZGV2LzIwMTgtU2VwdGVt
YmVyLzAwNTQ3OS5odG1sCgpDYzogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4K
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
CkNjOiBKdWhhLVBla2thIEhlaWtraWzDpCA8anVoYS1wZWtrYS5oZWlra2lsYUBpbnRlbC5jb20+
CkNjOiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+CkNjOiBJbXJl
IERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgoKSW1yZSBEZWFrICg0KToKICBrbXNfcGxhbmU6IFJlbW92ZSByZWR1bmRh
bnQgbW9kZXNldCBhZnRlciBDUkMgY2FwdHVyZQogIGxpYjogRXhwb3J0IGhlbHBlcnMgdG8gZ2V0
IHJvdGF0aW9uL3RpbGluZyBzdHJpbmdzCiAga21zX3BsYW5lOiBTcGxpdCBoZWxwZXJzIGNyZWF0
aW5nIHJlZmVyZW5jZSBGQiBhbmQgY2FwdHVyaW5nIENSQwogIGttc19wbGFuZTogQWRkIGNsaXBw
aW5nIHN1YnRlc3RzCgogbGliL2lndF9mYi5jICAgICAgfCAgMjMgKysKIGxpYi9pZ3RfZmIuaCAg
ICAgIHwgICAxICsKIGxpYi9pZ3Rfa21zLmMgICAgIHwgIDExICstCiBsaWIvaWd0X2ttcy5oICAg
ICB8ICAgMSArCiB0ZXN0cy9rbXNfcGxhbmUuYyB8IDU2NyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDU4MiBpbnNlcnRpb25z
KCspLCAyMSBkZWxldGlvbnMoLSkKCi0tIAoyLjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
