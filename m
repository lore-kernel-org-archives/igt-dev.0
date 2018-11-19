Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E256E0BE
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Nov 2018 15:55:57 +0000 (UTC)
From: Andi Shyti <andi.shyti@intel.com>
Date: Mon, 19 Nov 2018 17:55:39 +0200
Message-Id: <20181119155541.3242-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 0/2] new engine discovery interface
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
To: IGT dev <igt-dev@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgp0aGlzIGlzIGEgcmVxdWVzdCBmb3IgY29tbWVudHMgZm9yIHRoZSBuZXcgZW5naW5lIGRp
c2NvdmVyeQppbnRlcmZhY2UgZGV2ZWxvcGVkIGJ5IFR2cnRrbyBhbmQgQ2hyaXNbKl0uCgpJIHdv
dWxkIGxpa2UgdG8gcmVjZWl2ZSBzb21lIGZlZWRiYWNrIGFib3V0IGl0cyBpbXBsZW1lbnRhdGlv
bgphbmQgd2hldGhlciB0aGUgbGlicmFyaWVzIGFyZSBpbXBsZW1lbnRlZCBmb2xsb3dpbmcgdGhl
IGlndApzdHlsZS4KClBlcmhhcHMgVHZydGtvIGFuZCBDaHJpcyBjb3VsZCBjaGVjayBpZiBJJ20g
bWFraW5nIGEgcHJvcGVyIHVzZQpvZiB0aGVpciBuZXcgaW9jdGxzLgoKVGhhbmtzLApBbmRpCgpB
bmRpIFNoeXRpICgyKToKICBpbmNsdWRlL2RybS11YXBpOiBpbXBvcnQgaTkxNV9kcm0uaCBoZWFk
ZXIgZmlsZQogIGxpYjogaW1wbGVtZW50IG5ldyBlbmdpbmUgZGlzY292ZXJ5IGludGVyZmFjZQoK
IGluY2x1ZGUvZHJtLXVhcGkvaTkxNV9kcm0uaCB8IDIzOSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0KIGxpYi9pZ3RfZ3QuYyAgICAgICAgICAgICAgICB8ICA4OSArKysrKysr
KysrKysrKwogbGliL2lndF9ndC5oICAgICAgICAgICAgICAgIHwgICA2ICsKIGxpYi9pb2N0bF93
cmFwcGVycy5jICAgICAgICB8ICAyNSArKysrCiBsaWIvaW9jdGxfd3JhcHBlcnMuaCAgICAgICAg
fCAgIDEgKwogNSBmaWxlcyBjaGFuZ2VkLCAzNTggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
