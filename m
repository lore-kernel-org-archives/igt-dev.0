Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C717891B4
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2019 14:13:31 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a16so4159728edn.1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2019 07:13:31 -0700 (PDT)
Date: Mon, 11 Mar 2019 15:13:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190311141327.GL2665@phenom.ffwll.local>
References: <20190311133222.10030-1-arkadiusz.hiler@intel.com>
 <20190311133222.10030-2-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190311133222.10030-2-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] Revert "tests: kms_plane: Disable
 XBGR8888"
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMDM6MzI6MjJQTSArMDIwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMDY3YTY4OTY5YjJkNDFlMTAxYWM3NzhiMDZm
Mjc0M2ZhNjliMjdhYi4KPiAKPiBXaXRoIHRoZSBrbXNfcGxhbmUgcGl4ZWwgZm9ybWF0IHRlc3Rz
IG5vdyBleGhhdXN0aXZlbHkgdGVzdGluZyBhbGwgdGhlCj4gZm9ybWF0cyBldmVuIHdpdGggZWFy
bHkgQ1JDIG1pc21hdGNoZXMsIGl0J3MgYmV0dGVyIHRvIG5vdCBoaWRlIHN1Y2gKPiBpc3N1ZXMg
aW4gSUdULiBUaGVyZSBhcmUgb3RoZXIgc3lzdGVtcyBpbiBwbGFjZSB0byBkbyBzdWNoIHRoaW5n
cy4KPiAKPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4g
UGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQXJr
YWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgoKT24gYm90aCBwYXRjaGVz
OgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+
IC0tLQo+ICB0ZXN0cy9rbXNfcGxhbmUuYyB8IDEwIC0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmUuYyBi
L3Rlc3RzL2ttc19wbGFuZS5jCj4gaW5kZXggNGNkMGI1NjUuLmJiOTJmMDc4IDEwMDY0NAo+IC0t
LSBhL3Rlc3RzL2ttc19wbGFuZS5jCj4gKysrIGIvdGVzdHMva21zX3BsYW5lLmMKPiBAQCAtNTM0
LDE2ICs1MzQsNiBAQCBzdGF0aWMgYm9vbCB0ZXN0X2Zvcm1hdF9wbGFuZShkYXRhX3QgKmRhdGEs
IGVudW0gcGlwZSBwaXBlLAo+ICAJCWlmICghaWd0X2ZiX3N1cHBvcnRlZF9mb3JtYXQoZm9ybWF0
KSkKPiAgCQkJY29udGludWU7Cj4gIAo+IC0JCS8qCj4gLQkJICogVGhlcmUgc2VlbXMgdG8gYmUg
c29tZSBpc3N1ZSB0aGVyZSB3aXRoIHRoZSBDUkMgbm90Cj4gLQkJICogbWF0Y2hpbmcuIEJvdGgg
Q1JDcyBhcmUgc3RhYmxlLCBidXQgZG9uJ3QgbWF0Y2gsCj4gLQkJICogd2hpY2ggc2VlbXMgdG8g
aW5kaWNhdGUgc29tZSBpc3N1ZSB3aXRoIHRoZSBDUkMKPiAtCQkgKiBjb21wdXRhdGlvbiBsb2dp
YywgYnV0IEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gZmluZAo+IC0JCSAqIHdoYXQuCj4gLQkJICov
Cj4gLQkJaWYgKGZvcm1hdCA9PSBEUk1fRk9STUFUX1hCR1I4ODg4KQo+IC0JCQljb250aW51ZTsK
PiAtCj4gIAkJaWd0X2luZm8oIlRlc3RpbmcgZm9ybWF0ICIgSUdUX0ZPUk1BVF9GTVQgIiBvbiAl
cy4ldVxuIiwKPiAgCQkJIElHVF9GT1JNQVRfQVJHUyhmb3JtYXQpLAo+ICAJCQkga21zdGVzdF9w
aXBlX25hbWUocGlwZSksIHBsYW5lLT5pbmRleCk7Cj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
