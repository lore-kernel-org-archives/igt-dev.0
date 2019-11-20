Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6D16E78A
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2019 15:36:46 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191120153219.30989-1-janusz.krzysztofik@linux.intel.com>
References: <20191120153219.30989-1-janusz.krzysztofik@linux.intel.com>
Message-ID: <157426420137.13839.15400764934886889585@skylake-alporthouse-com>
Date: Wed, 20 Nov 2019 15:36:41 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/prime_vgem: Skip basic-read/write
 subtests if no mappable GGTT
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
To: Daniel Vetter <daniel@ffwll.ch>, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@list.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKYW51c3ogS3J6eXN6dG9maWsgKDIwMTktMTEtMjAgMTU6MzI6MTkpCj4gQXMgd2Un
dmUgYWdyZWVkIHRoYXQgdXNpbmcgSTkxNV9HRU1fUFJFQUQvUFdSSVRFIElPQ1RMcyBvbiBkbWEt
YnVmCj4gb2JqZWN0cyBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSwgd2UgYXJlIG5vdCBnb2luZyB0
byBleHRlbmQgdGhlaXIKPiBoYW5kbGVycyBpbiB0aGUgaTkxNSBkcml2ZXIgd2l0aCBuZXcgcHJv
Y2Vzc2luZyBwYXRocyByZXF1aXJlZCBmb3IgdGhlbQo+IHRvIHdvcmsgY29ycmVjdGx5IHdpdGgg
ZG1hLWJ1ZiBvYmplY3RzIG9uIGZ1dHVyZSBoYXJkd2FyZSB3aXRoIG5vCj4gbWFwcGFibGUgYXBl
cnR1cmUuICBXaGVuIHJ1bm5pbmcgb24gdGhhdCBraW5kIG9mIGhhcmR3YXJlLCBqdXN0IHNraXAK
PiBzdWJ0ZXN0cyB3aGljaCB1c2UgdGhvc2UgSU9DVExzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEph
bnVzeiBLcnp5c3p0b2ZpayA8amFudXN6LmtyenlzenRvZmlrQGxpbnV4LmludGVsLmNvbT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBKb29uYXMgTGFodGluZW4g
PGpvb25hcy5sYWh0aW5lbkBpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL3ByaW1lX3ZnZW0uYyB8
IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvcHJpbWVfdmdlbS5jIGIvdGVzdHMvcHJpbWVfdmdlbS5jCj4gaW5kZXggMmIy
MWZmNDEuLmI3YmJkOTg5IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3ByaW1lX3ZnZW0uYwo+ICsrKyBi
L3Rlc3RzL3ByaW1lX3ZnZW0uYwo+IEBAIC0zNyw2ICszNyw4IEBAIHN0YXRpYyB2b2lkIHRlc3Rf
cmVhZChpbnQgdmdlbSwgaW50IGk5MTUpCj4gICAgICAgICB1aW50MzJfdCAqcHRyOwo+ICAgICAg
ICAgaW50IGRtYWJ1ZiwgaTsKPiAgCj4gKyAgICAgICBnZW1fcmVxdWlyZV9tYXBwYWJsZV9nZ3R0
KGk5MTUpOwoKSWYgdGhhdCB3ZXJlIHRoZSBjYXNlLCB0aGUgY2hhbmdlIGluIEFCSSB3b3VsZCBu
b3QgYmUgdGllZCB0byB0aGUgbW1hcApBQkkuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
