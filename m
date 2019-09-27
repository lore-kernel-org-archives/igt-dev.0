Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF636E243
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2019 20:54:05 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190927203203.tsmwk7vrxbotlz6n@ldmartin-desk1>
References: <20190920010723.27300-1-lucas.demarchi@intel.com>
 <156961499065.1880.13073384019803070359@skylake-alporthouse-com>
 <20190927202420.l4pzgzwv2imugbmx@ldmartin-desk1>
 <20190927203203.tsmwk7vrxbotlz6n@ldmartin-desk1>
Message-ID: <156961764095.1880.4462163479369823332@skylake-alporthouse-com>
Date: Fri, 27 Sep 2019 21:54:00 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/kmod: reimplement kmsg_dump()
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
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMdWNhcyBEZSBNYXJjaGkgKDIwMTktMDktMjcgMjE6MzI6MDMpCj4gT24gRnJpLCBT
ZXAgMjcsIDIwMTkgYXQgMDE6MjQ6MjBQTSAtMDcwMCwgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOgo+
ID5PbiBGcmksIFNlcCAyNywgMjAxOSBhdCAwOTowOTo1MFBNICswMTAwLCBDaHJpcyBXaWxzb24g
d3JvdGU6Cj4gPj5RdW90aW5nIEx1Y2FzIERlIE1hcmNoaSAoMjAxOS0wOS0yMCAwMjowNzoyMykK
PiA+Pj5Ob3cgdGhlIGxpbmUgaW4gKDEpIHByaW50IGFzOgo+ID4+PiAgICAgICAgKGk5MTVfc2Vs
ZnRlc3Q6NTA3MCkgaWd0X2ttb2QtV0FSTklORzogW2RybTppbnRlbF9wY2hfdHlwZSBbaTkxNV1d
IEZvdW5kIFRpZ2VyIExha2UgTFAgUENICj4gPgo+ID4uLi4KPiA+Cj4gPj4+Cj4gPj4+VGhpcyBh
bHNvIGZpeGVzIGEgZG91YmxlIGNsb3NlIG9uIGZjbG9zZSgpIGFscmVhZHkgY2xvc2VzIHRoZSBm
aWxlCj4gPj4+ZGVzY3JpcHRvci4KPiA+Pj4KPiA+Pj5TaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBN
YXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KPiA+Pgo+ID4+VG9vIGJhZCBpdCBkb2Vz
bid0IGFjdHVhbGx5IHdvcmsgYW5kIGJhaWxzIG9uIHRoZSBmaXJzdCByZWFkIHdpdGggRVBJUEUu
Cj4gPgo+ID5odW1uLi4uIEkgY29weS1wYXN0ZWQgdGhlIGxpbmUgYWJvdmUuCj4gPgo+ID5DaGVj
a2luZyBwcmludGsuYyBpdCB3aWxsIGhhcHBlbiBpZiB3ZSBleHBsb2RlIHRoZSByaW5nYnVmZmVy
IHdpdGggbG9nIG1lc3NhZ2VzCj4gPmJlZm9yZSBhY3R1YWxseSByZWFkaW5nIHRoZW0uIFlvdSBt
YXkgd2FudCB0byBpbmNyZWFzZSB0aGUgYnVmZmVyIHNpemUKPiA+dG8gZ2V0IHRoZW0gYWxsLCBi
dXQgaXQgbWF5IG1ha2Ugc2Vuc2UgdG8gY29udGludWUgb24gRVBJUEUgc2luY2UgdGhlCj4gPmJl
aGF2aW9yIGlzIHRvIHJlc2V0IHRvIHRoZSBmaXJzdCBhdmFpbGFibGUgbWVzc2FnZT8KPiAKPiBi
dHcgQUZBSUNTIHRoZSBwcmV2aW91cyBpbXBsIHdvdWxkIGVxdWFsbHkgYmFpbCBvdXQgZHVlIHRv
IGdldGxpbmUoKQo+IHJldHVybmluZyAtMS4gT3IgZGlkIEkgbWlzcyBhbnl0aGluZz8gKGFsc28g
dGhlIGRlZmF1bHQgYnVmZmVyIHNpemUgdXNlZAo+IGJ5IGdsaWJjIGlzIHRoZSBzYW1lIGFzIHRo
ZSBvbmUgSSdtIHVzaW5nIGhlcmUpCgpJdCdzIGJhaWxpbmcgaW4gQ0kgKHdlJ3ZlIGhhZCBubyBv
dXRwdXQgc2luY2UpIGFuZCB0aGF0J3MgdGhlIGZpcnN0IHRpbWUKSSd2ZSBzZWVuIGl0IGZhaWwg
dG8gcHJvdmlkZSBhbnkgb2YgdGhlIGttc2cuIE1heWJlIGZkb3BlbigpIGlzCnN0cmlwcGluZyBv
ZmYgdGhlIE9fTk9OQkxPQ0s/Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
