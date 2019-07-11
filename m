Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6B96E179
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2019 10:31:02 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 11 Jul 2019 12:30:56 +0200
Message-Id: <20190711103057.25693-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v1 0/1] Add device selection methods
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
List-ID: <igt-dev@lists.freedesktop.org>

QWZ0ZXIgaGF2aW5nIGEgdGFsayB3aXRoIEFyZWssIE9sZWcgYW5kIE1pY2hhxYIgcmVnYXJkaW5n
IGRldmljZQpzZWxlY3Rpb24gUkZDIHRoaXMgcGF0Y2ggZXh0ZW5kcyBjdXJyZW50IGNvZGUgdG86
CgoxLiBQQ0kgKyBwbGF0Zm9ybSBkZXZpY2VzIGRpc2NvdmVyeQoyLiBGaWx0ZXJzIGxpa2UgcGNp
LCBkcm0sIHZjNCwgZXh5bm9zLCB2Z2VtIGFuZCB2a21zCjMuIGxzZ3B1IHRvb2wgZm9yIGRpc2Nv
dmVyaW5nIEdQVSBkZXZpY2VzCjQuIERldmljZSBzZWxlY3Rpb24gZG9jdW1lbnRhdGlvbgoKWmJp
Z25pZXcgS2VtcGN6ecWEc2tpICgxKToKICBJbnRyb2R1Y2UgbmV3IG1ldGhvZCBvZiBkZXZpY2Ug
c2VsZWN0aW9uCgogZG9jcy9tdWx0aS1kZXZpY2Utc2VsZWN0aW9uLnR4dCB8ICAxMTUgKysrCiBs
aWIvTWFrZWZpbGUuc291cmNlcyAgICAgICAgICAgIHwgICAgMiArCiBsaWIvZHJtdGVzdC5jICAg
ICAgICAgICAgICAgICAgIHwgIDE1MSArKystCiBsaWIvZHJtdGVzdC5oICAgICAgICAgICAgICAg
ICAgIHwgICAgOSArCiBsaWIvaWd0X2NvcmUuYyAgICAgICAgICAgICAgICAgIHwgICAxMyArCiBs
aWIvaWd0X2RldmljZV9zY2FuLmMgICAgICAgICAgIHwgMTQyNSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiBsaWIvaWd0X2RldmljZV9zY2FuLmggICAgICAgICAgIHwgICA3MiArKwog
bGliL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICB8ICAgIDEgKwogdG9vbHMvTWFrZWZpbGUu
c291cmNlcyAgICAgICAgICB8ICAgIDEgKwogdG9vbHMvbHNncHUuYyAgICAgICAgICAgICAgICAg
ICB8ICAyODUgKysrKysrKwogdG9vbHMvbWVzb24uYnVpbGQgICAgICAgICAgICAgICB8ICAgIDEg
KwogMTEgZmlsZXMgY2hhbmdlZCwgMjA3MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvbXVsdGktZGV2aWNlLXNlbGVjdGlvbi50eHQKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBsaWIvaWd0X2RldmljZV9zY2FuLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBs
aWIvaWd0X2RldmljZV9zY2FuLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9sc2dwdS5jCgot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
