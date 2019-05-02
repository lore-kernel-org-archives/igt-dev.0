Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46685894C9
 for <igt-dev@lists.freedesktop.org>; Thu,  2 May 2019 13:14:31 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Thu,  2 May 2019 18:46:17 +0530
Message-Id: <20190502131625.27551-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 0/8] HDCP2.2 Tests
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
IHJlbG9hZHMgaXQgYW5kIHRlc3QgZm9yIEhEQ1AyLjIuCgkzLiBUZXN0IGZvciBTUk0gd3JpdGUg
YW5kIGtlcm5lbCB2YWxpZGF0aW9uCgk0LiBMaW5rIEludGVncml0eSBjaGVjayBpcyBjb252ZXJ0
ZWQgYXMgYSBzZXBhcmF0ZSBzdWJ0ZXN0Cgk1LiBTdWJ0ZXN0IGlzIGFkZGVkIHRvIHRlc3QgdGhl
IHVldmVudCBmb3IgSERDUCBzdGF0ZSBjaGFuZ2UuCgpSYW1hbGluZ2FtIEMgKDgpOgogIGttc19j
b250ZW50X3Byb3RlY3Rpb246IFRlc3RzIGFyZSBkZWZpbmVkIGJ5IGZsYWdzCiAga21zX2NvbnRl
bnRfcHJvdGVjdGlvbjogTGluayBJbnRlZ3JpdHkgQ2hlY2sgc3VidGVzdAogIGttc19jb250ZW50
X3Byb3RlY3Rpb246IENvbnRlbnQgdHlwZSBzdXBwb3J0CiAga21zX2NvbnRlbnRfcHJvdGVjdGlv
bjogdGVzdCB0ZWFyZG93biBhbmQgcmVidWlsZCBvZiBJOTE1LW1laSBJL0YKICBrbXNfY29udGVu
dF9wcm90ZWN0aW9uOiB0ZXN0IGNvbnRlbnQgdHlwZSBjaGFuZ2UKICBrbXNfY29udGVudF9wcm90
ZWN0aW9uOiB1ZXZlbnQgZm9yIEhEQ1Agc3RhdHVzIGNoYW5nZQogIGttc19jb250ZW50X3Byb3Rl
Y3Rpb246IFNSTSBUZXN0aW5nCiAgRE8gTk9UIE1FUkdFOiBDUCBpbiBmYXN0IGZlZWRiYWNrIGxp
c3QKCiBsaWIvaWd0X2ttcy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGxpYi9p
Z3Rfa21zLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogdGVzdHMvaW50ZWwtY2kv
ZmFzdC1mZWVkYmFjay50ZXN0bGlzdCB8ICAgMyArCiB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0
aW9uLmMgICAgICAgIHwgMzU3ICsrKysrKysrKysrKysrKysrKysrKysrKy0tCiA0IGZpbGVzIGNo
YW5nZWQsIDMzOSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCi0tIAoyLjE5LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
