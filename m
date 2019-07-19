Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47526E492
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2019 09:50:34 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 19 Jul 2019 11:50:13 +0200
Message-Id: <20190719095014.2061-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/1] Add device selection methods
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

djI6IEluIHRoaXMgc2VyaWVzIEkndmUgcmVtb3ZlZCBtb2R1bGUgbWFuYWdlbWVudCBhbmQgaGFu
ZCBkZXZpY2UgY2xhc3NlcwogICAgZmlsdGVyaW5nICh1ZGV2IGZpbHRlcnMgYXJlIG5vdyB1c2Vk
IGluIHRoaXMgY2FzZSkuIExzZ3B1IHdhcwogICAgc2ltcGxpZmllZCAoc29tZSBvcHRpb25zIHdl
cmUgdW5yZWFkYWJsZSBhbmQgdGhleSB3ZXJlIHJlbW92ZWQpLgogICAgU3RpbGwgbWlncmF0aW9u
IHRvIGd0a2RvYyBpcyBuZWNlc3Nhcnkgd2hpY2ggd2lsbCBiZSBtYWRlIGluIHYzLgoKWmJpZ25p
ZXcgS2VtcGN6ecWEc2tpICgxKToKICBJbnRyb2R1Y2UgbmV3IG1ldGhvZCBvZiBkZXZpY2Ugc2Vs
ZWN0aW9uCgogZG9jcy9tdWx0aS1kZXZpY2Utc2VsZWN0aW9uLnR4dCB8ICAxMDggKysrCiBsaWIv
TWFrZWZpbGUuc291cmNlcyAgICAgICAgICAgIHwgICAgMiArCiBsaWIvZHJtdGVzdC5jICAgICAg
ICAgICAgICAgICAgIHwgIDE1MSArKysrLQogbGliL2RybXRlc3QuaCAgICAgICAgICAgICAgICAg
ICB8ICAgIDkgKwogbGliL2lndF9jb3JlLmMgICAgICAgICAgICAgICAgICB8ICAgMTMgKwogbGli
L2lndF9kZXZpY2Vfc2Nhbi5jICAgICAgICAgICB8IDEwODQgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogbGliL2lndF9kZXZpY2Vfc2Nhbi5oICAgICAgICAgICB8ICAgODIgKysrCiBs
aWIvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgIHwgICAgMSArCiB0b29scy9NYWtlZmlsZS5z
b3VyY2VzICAgICAgICAgIHwgICAgMSArCiB0b29scy9sc2dwdS5jICAgICAgICAgICAgICAgICAg
IHwgIDIyMSArKysrKysrCiB0b29scy9tZXNvbi5idWlsZCAgICAgICAgICAgICAgIHwgICAgMSAr
CiAxMSBmaWxlcyBjaGFuZ2VkLCAxNjcxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9tdWx0aS1kZXZpY2Utc2VsZWN0aW9uLnR4dAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGxpYi9pZ3RfZGV2aWNlX3NjYW4uYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGxp
Yi9pZ3RfZGV2aWNlX3NjYW4uaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xzZ3B1LmMKCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
