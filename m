Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736776E910
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2020 21:03:00 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200214165502.21990-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200214165502.21990-1-ville.syrjala@linux.intel.com>
Message-ID: <158180057571.19707.18358629129000856628@skylake-alporthouse-com>
Date: Sat, 15 Feb 2020 21:02:55 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: Speed up by not
 testing every format
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDIwLTAyLTE0IDE2OjU1OjAyKQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gQXMgd2UgZGlk
IHdpdGgga21zX3BsYW5lX3NjYWxpbmcgbGV0J3Mgbm90IHRlc3QgZXZlcnkgcGl4ZWwKPiBmb3Jt
YXQgZm9yIHJvdGF0aW9uIGZhaWxzIGVpdGhlci4gSW5zdGVhZCB3ZSB0ZXN0IGVhY2ggImNsYXNz
Igo+IG9mIGZvcm1hdHMgYXMgZGVmaW5lZCBieSBpZ3RfcmVkdWNlX2Zvcm1hdCgpLiBUaGUgaG9w
ZSBiZWluZwo+IHRoYXQgdGhlcmUgYXJlIG5vIHNwZWNpZmljIGJ1Z3MgaW4gdGhlIGh3IGZvciBk
aWZmZXJlbnQKPiBzd2l6emxlcyBvZiB0aGUgc2FtZSB1bmRlcmx5aW5nIGJhc2UgZm9ybWF0Lgo+
IAo+IE9uIEtCTDoKPiAkIHRpbWUgLi9idWlsZC90ZXN0cy9rbXNfcm90YXRpb25fY3JjIC0tciBz
cHJpdGUtcm90YXRpb24tOTAKPiAtIHJlYWwgIDBtMzksODUxcwo+IC0gdXNlciAgMG0xLDAzN3MK
PiAtIHN5cyAgIDBtMTIsODk1cwo+ICsgcmVhbCAgMG0xNiw3NzNzCj4gKyB1c2VyICAwbTAsMzU3
cwo+ICsgc3lzICAgMG01LDQ3NXMKPiAKPiBBcyBwZXIgdGhlIHVzdWFsIHJlY2lwZSB3ZSBhZGQg
YW4gLS1leHRlbmRlZCBjbWRsaW5lIGtub2IgdG8KPiBmb3JjZSB0aGUgZnVsbCBjb3ZlcmFnZS4K
PiAKPiBPbmx5IGN1dHMgfjMwJSBvZiB0aGUgdG90YWwga21zX3JvdGF0aW9uX2NyYyBydW50aW1l
IHRob3VnaC4KPiBUaGVyZSBhcmUgb3RoZXIgc3VidGVzdHMgd2hpY2ggdGFrZSBvdmVyIDgwcyBv
biB0aGlzIHBhcnRpY3VsYXIKPiBtYWNoaW5lLCBzbyBmdXJ0aGVyIHdvcmsgaXMgY2xlYXJseSBy
ZXF1aXJlZCB0byBnZXQgdGhlIHRlc3RpbmcKPiB0aW1lIHRvIHNhbmUgbGV2ZWxzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
