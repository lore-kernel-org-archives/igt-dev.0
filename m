Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190213093137.22678-1-guillaume.tucker@collabora.com>
References: <20190213093137.22678-1-guillaume.tucker@collabora.com>
Message-ID: <155006688232.2264.2955984791588395728@skylake-alporthouse-com>
Date: Wed, 13 Feb 2019 14:08:02 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_sseu: Fix
 32-bit build
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, kernel@collabora.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBHdWlsbGF1bWUgVHVja2VyICgyMDE5LTAyLTEzIDA5OjMxOjM3KQo+IFRoaXMgZml4
ZXMgYSBjb21waWxlciB3YXJuaW5nIHRyZWF0ZWQgYXMgYW4gZXJyb3Igd2hlbiBidWlsZGluZyBm
b3IKPiAzMi1iaXQgYXJjaGl0ZWN0dXJlcyBzaW5jZSB0aGVpciBwb2ludGVyIHNpemUgZG9lcyBu
b3QgbWF0Y2ggdGhlIHNpemUKPiBvZiBkcm1faTkxNV9nZW1fY29udGV4dF9wYXJhbS52YWx1ZSB3
aGljaCBpcyA2NCBiaXRzOgo+IAo+ICAgQ0MgICAgICAgaTkxNS9nZW1fY3R4X3NzZXUubwo+ICAg
aTkxNS9nZW1fY3R4X3NzZXUuYzogSW4gZnVuY3Rpb24g4oCYdGVzdF9nZ3R0X2FyZ3PigJk6Cj4g
ICBpOTE1L2dlbV9jdHhfc3NldS5jOjM4NDo5OiBlcnJvcjogY2FzdCB0byBwb2ludGVyIGZyb20g
aW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6ZSBbLVdlcnJvcj1pbnQtdG8tcG9pbnRlci1jYXN0XQo+
ICAgICBtdW5tYXAoKHZvaWQgKilhcmcudmFsdWUsIDQwOTYpOwo+IAo+IEl0IHdhcyBmb3VuZCB3
aGlsZSBidWlsZGluZyBmb3IgYXJtIHdpdGggZ2NjIDYuMy4wIGFuZCBJIHN1c3BlY3QgdGhlCj4g
c2FtZSBwcm9ibGVtIHdvdWxkIGFyaXNlIGZvciBpMzg2IG9yIG90aGVyIDMyLWJpdCBhcmNoaXRl
Y3R1cmVzLiAgVGhlCj4gdWludHB0cl90IHR5cGUgaXMgYnkgZGVmaW5pdGlvbiBhbiB1bnNpZ25l
ZCBpbnRlZ2VyIG9mIHRoZSBzYW1lIGxlbmd0aAo+IGFzIGEgcG9pbnRlciBvbiBhIGdpdmVuIGFy
Y2hpdGVjdHVyZSwgc28gdGhpcyBzaG91bGQgZml4IHRoZSBwcm9ibGVtCj4gZm9yIGFsbCBhcmNo
aXRlY3R1cmVzIHVwIHRvIDY0IGJpdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIFR1
Y2tlciA8Z3VpbGxhdW1lLnR1Y2tlckBjb2xsYWJvcmEuY29tPgoKQXQgc29tZSBwb2ludCwgd2Ug
c2hvdWxkIHNhdmUgb3VyIGV5ZXNpZ2h0IGFuZCBkbyB1NjRfdG9fcG9pbnRlcigpLgpSZXZpZXdl
ZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
