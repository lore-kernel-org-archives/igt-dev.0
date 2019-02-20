Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8EF892C2
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 11:10:33 +0000 (UTC)
Date: Wed, 20 Feb 2019 13:10:28 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190220111028.4czrfis574rjjcph@ahiler-desk1.fi.intel.com>
References: <20190219075716.11553-1-daniel.vetter@ffwll.ch>
 <20190219075716.11553-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190219075716.11553-4-daniel.vetter@ffwll.ch>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] lib/tests: Convert no_exit tests
 into positive tests
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMTksIDIwMTkgYXQgMDg6NTc6MTVBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGlzIHdheSB3ZSBjYW4gbWFrZSBzdXJlIHRoZXkgZGllIHdpdGggYW4gYXNzZXJ0
LCB3aGljaCBpcyB3aGF0IHdlCj4gd2FudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgbGliL3Rlc3RzL2lndF9ub19l
eGl0LmMgICAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICBs
aWIvdGVzdHMvaWd0X25vX2V4aXRfbGlzdF9vbmx5LmMgfCA0MSAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gIGxpYi90ZXN0cy9tZXNvbi5idWlsZCAgICAgICAgICAgICB8IDE3ICsrKysrLS0t
LS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0p
Cj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBsaWIvdGVzdHMvaWd0X25vX2V4aXRfbGlzdF9vbmx5LmMK
PiAKPiBkaWZmIC0tZ2l0IGEvbGliL3Rlc3RzL2lndF9ub19leGl0LmMgYi9saWIvdGVzdHMvaWd0
X25vX2V4aXQuYwo+IGluZGV4IGRjODliODMwMmE3MS4uNGE3Nzc0MTJiNmE5IDEwMDY0NAo+IC0t
LSBhL2xpYi90ZXN0cy9pZ3Rfbm9fZXhpdC5jCj4gKysrIGIvbGliL3Rlc3RzL2lndF9ub19leGl0
LmMKPiBAQCAtMjUsOSArMjUsMjYgQEAKPiAgICoKPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8c3lz
L3dhaXQuaD4KPiArCj4gICNpbmNsdWRlICJkcm10ZXN0LmgiCj4gIAo+IC1pbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqKmFyZ3YpCj4gKyNpbmNsdWRlICJpZ3RfdGVzdHNfY29tbW9uLmgiCj4gKwo+
ICtzdGF0aWMgdm9pZCBub19leGl0X2xpc3Rfb25seSh2b2lkKQo+ICt7Cj4gKwljaGFyIHByb2db
XSA9ICJpZ3RfbGlzdF9vbmx5IjsKPiArCWNoYXIgYXJnW10gPSAiLS1saXN0LXN1YnRlc3RzIjsK
PiArCWNoYXIgKmZha2VfYXJndltdID0ge3Byb2csIGFyZ307Cj4gKwlpbnQgZmFrZV9hcmdjID0g
MjsKCkFSUkFZX1NJWkUoZmFrZV9hcmd2KSA/CgpSZXZpZXdlZC1ieTogQXJrYWRpdXN6IEhpbGVy
IDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
