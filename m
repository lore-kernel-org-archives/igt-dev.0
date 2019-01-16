Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001D36EFCE
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:02 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:43 +0200
Message-Id: <20190116112050.27647-15-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 14/21] lib/igt_audio: Initialize freq in
 audio_signal_detect()
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

SXQncyBub3QgY2xlYXIgdG8gdGhlIHN0YXRpYyBhbmFseXplciB0aGF0IGZyZXEgaXMgYXNzaWdu
ZWQgd2hlbgpoYW5kbGluZyB0aGUgcHJldmlvdXMgZnJhbWUgYW5kIHRoZW4gdXNlZCBpbiB0aGUg
bmV4dC4gSW4gZmFjdCwgaXQKd2Fzbid0IGNsZWFyIHRvIG1lIGVpdGhlciBiZWZvcmUgc3Rhcmlu
ZyBhdCB0aGUgY29kZSBmb3Igc29tZQptaW51dGVzLiBJbml0aWFsaXppbmcgaXQgdG8gc29tZXRo
aW5nIG1ha2VzIGJvdGggb2YgdXMgaGFwcGllci4KClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZh
bGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpDYzogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwu
a29jaWFsa293c2tpQGJvb3RsaW4uY29tPgotLS0KIGxpYi9pZ3RfYXVkaW8uYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2xpYi9pZ3RfYXVkaW8uYyBiL2xpYi9pZ3RfYXVkaW8uYwppbmRleCAyMjljZTZjNi4uYTA1OTJk
NTMgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfYXVkaW8uYworKysgYi9saWIvaWd0X2F1ZGlvLmMKQEAg
LTI1MCw3ICsyNTAsNyBAQCBib29sIGF1ZGlvX3NpZ25hbF9kZXRlY3Qoc3RydWN0IGF1ZGlvX3Np
Z25hbCAqc2lnbmFsLCBpbnQgY2hhbm5lbHMsCiAJaW50IHRocmVzaG9sZDsKIAlib29sIGFib3Zl
OwogCWludCBlcnJvcjsKLQlpbnQgZnJlcTsKKwlpbnQgZnJlcSA9IDA7CiAJaW50IG1heDsKIAlp
bnQgYywgaSwgajsKIAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
