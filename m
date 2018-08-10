Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180810091129.4xhhujctnczk2k2e@platvala-desk.ger.corp.intel.com>
References: <20180810090246.9726-1-chris@chris-wilson.co.uk>
 <20180810091129.4xhhujctnczk2k2e@platvala-desk.ger.corp.intel.com>
Message-ID: <153389291472.6849.14340274070793106812@skylake-alporthouse-com>
Date: Fri, 10 Aug 2018 10:21:59 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] intel-ci: Skip module
 reloads
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE4LTA4LTEwIDEwOjExOjI5KQo+IE9uIEZyaSwgQXVn
IDEwLCAyMDE4IGF0IDEwOjAyOjQ2QU0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFJl
bG9hZGluZyB0aGUgbW9kdWxlIG1heSBpbXBhY3Qgc3Vic2VxdWVudCB0ZXN0cyBieSBkZXN0YWJp
bGlzaW5nIHRoZQo+ID4gc3lzdGVtLiBBcyB3ZSBkbyBmb3IgQkFULCBpZiB3ZSB3YW50IHRvIHRl
c3QgcmVsb2FkcywgaXQgc2hvdWxkIGJlCj4gPiBoYW5kbGVkIGV4cGxpY2l0bHkgYXQgdGhlIGVu
ZCBvZiB0aGUgcnVuLCByYXRoZXIgdGhhbiBwbGFjZWQgYXQgcmFuZG9tCj4gPiBpbiB0aGUgbWlk
ZGxlIG9mIHRoZSB0ZXN0IGxpc3QuCj4gPiAKPiA+IFJlZmVyZW5jZXM6IGh0dHBzOi8vYnVncy5m
cmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwNjUzOQo+ID4gU2lnbmVkLW9mZi1ieTog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiBDYzogVG9taSBTYXJ2
ZWxhIDx0b21pLnAuc2FydmVsYUBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICB0ZXN0cy9pbnRlbC1j
aS9ibGFja2xpc3QudHh0IHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0IGIvdGVz
dHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dAo+ID4gaW5kZXggMWQxNjUyOTY0Li4wNjZhNWMwMTQg
MTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0Cj4gPiArKysgYi90
ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0Cj4gPiBAQCAtMiw2ICsyLDcgQEAgaWd0QG1ldGFf
dGVzdChALiopPwo+ID4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gPiAgIyBHRU0KPiA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+ID4gK2lndEBkcnZfbW9kdWxlX3JlbG9hZChALiopPwo+IAo+ICJHRU0i
PwoKVGhhdCBkaWRuJ3QgYXBwbHkgdG8gdGhlIHNlbGZ0ZXN0cyBvciBkcm1fbW0sIHNvIEkgdGhv
dWdodCBpdCB3YXMgdGhlCnVzdWFsIG1pc2xlYWRpbmcgY29tbWVudC4KIAo+IENvbW1lbnQgdGhl
IGxpbmUgd2l0aCB0aGUgZXhwbGFuYXRpb24gZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UuCgpXaGVy
ZSBhcmUgY29tbWVudHMgYWxsb3dlZD8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
