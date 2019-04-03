Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5263E6E95F
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 07:45:16 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <8eb9c24250eb482bda91f1bcc430a21053d16017.camel@intel.com>
References: <36a00595c5083adb40d496ff30ebc820ae770474.1552545177.git.harish.chegondi@intel.com>
 <155254958544.4168.8591390419495126785@skylake-alporthouse-com>
 <8eb9c24250eb482bda91f1bcc430a21053d16017.camel@intel.com>
Message-ID: <155427749709.24691.14658564444185406872@skylake-alporthouse-com>
Date: Wed, 03 Apr 2019 08:44:57 +0100
Subject: Re: [igt-dev] [RFC i-g-t 1/1] i915/pm_backlight: turn on dpms
 before backlight fade out and fade in
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
To: "Chegondi, Harish" <harish.chegondi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Taylor, Clinton A" <clinton.a.taylor@intel.com>, "Yadav,
 Jyoti R" <jyoti.r.yadav@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaGVnb25kaSwgSGFyaXNoICgyMDE5LTA0LTAzIDAxOjQ3OjA5KQo+IE9uIFRodSwg
MjAxOS0wMy0xNCBhdCAwNzo0NiArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gUXVvdGlu
ZyBIYXJpc2ggQ2hlZ29uZGkgKDIwMTktMDMtMTQgMDY6NDE6NDgpCj4gPiA+IGJhY2tsaWdodCBm
YWRlIHdpdGggc3VzcGVuZCB0ZXN0IHR1cm5zIG9mZiBkcG1zIHdoaWNoIHR1cm5zIG9mZgo+ID4g
PiB0aGUgZWRwIGJhY2tsaWdodCBhbmQgcGFuZWwuIFRoZW4gaXQgZG9lcyBhIHJ1bnRpbWUgc3Vz
cGVuZCwKPiA+ID4gc3lzdGVtIHN1c3BlbmQgYW5kIHJlc3VtZS4gQWZ0ZXIgcmVzdW1lLCBpdCBk
b2VzIGEgZmFkZSBvdXQgYW5kCj4gPiA+IGZhZGUgaW4gb2YgdGhlIGJhY2tsaWdodCBicmlnaHRu
ZXNzLiBGcm9tIHRoZSBkbWVzZyBsb2dzIG9mIHRoZQo+ID4gPiBjaSB0ZXN0cyBpdCBhcHBlYXJz
IHRoYXQgdGhlIHRlc3QgaXMgc2V0dGluZyB0aGUgYnJpZ2h0bmVzcwo+ID4gPiBldmVuIGJlZm9y
ZSB0aGUgZWRwIHBhbmVsIGFuZCBiYWNrbGlnaHQgYXJlIHR1cm5lZCBvbiByZXN1aWx0aW5nCj4g
PiA+IGluIHRoZSBicmlnaHRuZXNzIHZhbHVlcyB3cml0dGVuIGFuZCByZWFkIHRvIGJlIGRpZmZl
cmVudC4KPiA+ID4gVHVybiBvbiB0aGUgZHBtcyB3aGljaCB0dXJucyBvbiB0aGUgZWRwIHBhbmVs
IGFuZCBiYWNrbGlnaHQKPiA+ID4gYmVmb3JlIGJhY2tsaWdodCBmYWRlIG91dCBhbmQgZmFkZSBp
bi4gV2l0aCB0aGlzIGNoYW5nZSB0aGUKPiA+ID4gZmFkZV93aXRoX3N1c3BlbmQgdGVzdCBwYXNz
ZXMuCj4gCj4gQ2hyaXMsCj4gCj4gTXkgY29tbWl0IG1lc3NhZ2Ugd2FzIGNvbmZ1c2luZy4gSSB3
aWxsIHJlZG8gdGhlIGNvbW1pdCBtZXNzYWdlIGluIHRoZQo+IG5leHQgdmVyc2lvbiBvZiBteSBw
YXRjaC4KPiAKPiA+IAo+ID4gQnV0IGlzIGl0IGxlZ2FsIGZvciB0aGUga2VybmVsIHRvIHRoYXQ/
IElzIHRoZSBrZXJuZWwgbWVhbnQgdG8KPiA+IHJlc3RvcmUKPiA+IHRoZSBwcmV2aW91cyBjb25m
aWd1cmF0aW9uIHVwb24gcmVzdW1lIG9yIGxlYXZlIGl0IHRvIHVzZXJzcGFjZT8gV2hhdAo+ID4g
YWJvdXQgZm9yIGZiY29uPwo+IAo+IFllcywgdGhlIGtlcm5lbCBpcyBtZWFudCB0byByZXN0b3Jl
IHRoZSBwcmV2aW91cyBjb25maWd1cmF0aW9uIHVwb24KPiByZXN1bWUuCgpBcmUgeW91IHN1cmU/
CgpXZSBzZW5kIGEgaG90cGx1ZyB0byB1c2Vyc3BhY2UgdG8gdGVsbCB0aGVtIHRvIHJlc3RvcmUg
dGhlIGNvbmZpZ3VyYXRpb24KYXMgdGhleSBzZWUgZml0IChiZWNhdXNlIHRoZSBjb25maWd1cmF0
aW9uIHdpbGwgb2Z0ZW4gY2hhbmdlKS4gSWYgZmJjb24KaXMgYWN0aXZlLCBpdCByZXN0b3JlcyB0
aGUgZmJjb24gc2NyZWVuIHdoaWNoIGNhbiBqdXN0IGJlIHRoZSBjb25zZXF1ZW5jZQpvZiBoYW5k
bGluZyBpdHMgaG90cGx1ZyBldmVudC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
