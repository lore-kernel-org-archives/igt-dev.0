Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C876D891FA
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2019 12:06:51 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue, 14 May 2019 15:06:37 +0300
Message-Id: <20190514120646.19889-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/9] tests/kms_chamelium: add HDMI audio
 test
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

Q2hhbmdlcyBmcm9tIHYyIHRvIHYzOiBza2lwIHRlc3RzIGlmIEdldEF1ZGlvRm9ybWF0IGlzIG5v
dCBzdXBwb3J0ZWQKClNpbW9uIFNlciAoOSk6CiAgdGVzdHMva21zX2NoYW1lbGl1bTogc2tpcCBp
ZiBHZXRBdWRpb0Zvcm1hdCBpcyBub3Qgc3VwcG9ydGVkCiAgbGliL2lndF9lZGlkOiBhZGQgc3Vw
cG9ydCBmb3IgU2hvcnQgQXVkaW8gRGVzY3JpcHRvcnMKICBsaWIvaWd0X2VkaWQ6IGFkZCBzdXBw
b3J0IGZvciBWZW5kb3IgU3BlY2lmaWMgRGF0YSBibG9ja3MKICBsaWIvaWd0X2NoYW1lbGl1bTog
YWRkIENIQU1FTElVTV9ERUZBVUxUX0VESUQKICB0ZXN0cy9rbXNfY2hhbWVsaXVtOiBnZW5lcmF0
ZSBhbiBFRElEIHdpdGggYXVkaW8gc3VwcG9ydAogIHRlc3RzL2ttc19jaGFtZWxpdW06IGRpc2Fi
bGUgPjQ4S0h6IGF1ZGlvIHRlc3RzCiAgdGVzdHMva21zX2NoYW1lbGl1bTogZW5hYmxlIGF1ZGlv
IHRlc3Qgb24gSERNSSBwb3J0cwogIHRlc3RzL2ttc19jaGFtZWxpdW06IGRvbid0IGFib3J0IGF1
ZGlvIHRlc3Qgb24gZmlyc3QgZmFpbAogIEhBWDogYWRkIHtkcCxoZG1pfS1hdWRpbyB0ZXN0IHRv
IGZhc3QtZmVlZGJhY2sKCiBsaWIvaWd0X2NoYW1lbGl1bS5jICAgICAgICAgICAgICAgICAgIHwg
IDc0ICsrKysrKy0tCiBsaWIvaWd0X2NoYW1lbGl1bS5oICAgICAgICAgICAgICAgICAgIHwgICA3
ICsKIGxpYi9pZ3RfZWRpZC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAxMTMgKysrKysrKysr
KystCiBsaWIvaWd0X2VkaWQuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgMTAzICsrKysrKysr
KystCiB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgICAyICsKIHRlc3Rz
L2ttc19jaGFtZWxpdW0uYyAgICAgICAgICAgICAgICAgfCAyNDYgKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgNDUyIGluc2VydGlvbnMoKyksIDkzIGRlbGV0aW9u
cygtKQoKLS0KMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
