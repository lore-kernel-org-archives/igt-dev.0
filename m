Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77226E0BD
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2019 08:46:50 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Thu, 18 Apr 2019 14:18:36 +0530
Message-Id: <20190418084842.5422-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 0/6] HDCP2.2 Tests
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
To: igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, arkadiusz.hiler@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyB0ZXN0cyBmb3I6CgkxLiBjb250ZW50X3R5cGUgd2hpY2ggaXMgYWRk
ZWQgZm9yIEhEQ1AyLjIuCgkgICAgIEFkZHMgYSBuZXcgdGVzdCBmb3IgVHlwZTEuCgkgICAgIEFk
ZHMgYW5vdGhlciB0ZXN0IGZvciBUeXBlMSAtPiBUeXBlMC4KCTIuIHRlYXJkb3duIGFuZCByZWJ1
aWxkIG9mIGk5MTUtbWVpIGludGVyZmFjZS4KCSAgICAgUmVtb3ZlcyB0aGUgbWVpX2hkY3AgYW5k
IHJlbG9hZHMgaXQgYW5kIHRlc3QgZm9yIEhEQ1AyLjIuCgkzLiBkb3duc3RyZWFtIGluZm8gZ2F0
aGVyaW5nIGFuZCBTUk0gcmV2b2NhdGlvbi4KCSAgICAgUmV0cmlldmVzIHRoZSByZWNlaXZlcnMg
SUQgZnJvbSBkb3duc3RyZWFtX2luZm8KCSAgICAgZmFicmljYXRlcyBhIFNSTSBhbmQgdGVzdCBm
b3IgdGhlIHJldm9jYXRpb24gb2YgdGhlIGRldmljZS4KCldhaXQgZm9yIEhEQ1Agc3RhdGUgY2hh
bmdlIGlzIGltcGxlbWVudGVkIHRocm91Z2ggdGhlIHVldmVudCBoYW5kbGVyLgoKdjU6CiAgc3Jt
IGlzIHdyaXR0ZW4gaW50byAvbGliL2Zpcm13YXJlL2Rpc3BsYXlfaGRjcF9zcm0uYmluIFtEYW52
ZXRdCgpSYW1hbGluZ2FtIEMgKDYpOgogIGttc19jb250ZW50X3Byb3RlY3Rpb246IENvbnRlbnQg
dHlwZSBzdXBwb3J0CiAga21zX2NvbnRlbnRfcHJvdGVjdGlvbjogdGVzdCB0ZWFyZG93biBhbmQg
cmVidWlsZCBvZiBJOTE1LW1laSBJL0YKICBrbXNfY29udGVudF9wcm90ZWN0aW9uOiB0ZXN0IGNv
bnRlbnQgdHlwZSBjaGFuZ2UKICBrbXNfY29udGVudF9wcm90ZWN0aW9uOiB1ZXZlbnQgZm9yIEhE
Q1Agc3RhdHVzIGNoYW5nZQogIGttc19jb250ZW50X3Byb3RlY3Rpb246IHNybSBhbmQgdG9wb2xv
Z3lfaW5mbyB0ZXN0CiAgRE8gTk9UIE1FUkdFOiBDUCBpbiBmYXN0IGZlZWRiYWNrIGxpc3QKCiBs
aWIvaWd0X2ttcy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIGxpYi9pZ3Rfa21z
LmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogdGVzdHMvaW50ZWwtY2kvZmFzdC1m
ZWVkYmFjay50ZXN0bGlzdCB8ICAgMyArCiB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMg
ICAgICAgIHwgNDk4ICsrKysrKysrKysrKysrKysrKysrKysrKy0tCiA0IGZpbGVzIGNoYW5nZWQs
IDQ3NyBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKCi0tIAoyLjE5LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
