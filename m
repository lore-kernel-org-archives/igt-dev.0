Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCF489FEC
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 15:50:56 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <65484c84-5bfc-276a-8eda-7f404b9a5387@linux.intel.com>
References: <20190307024444.42432-1-nischala.yelchuri@intel.com>
 <20190313201635.20748-1-nischala.yelchuri@intel.com>
 <155250966026.30003.10001053991628825793@skylake-alporthouse-com>
 <65484c84-5bfc-276a-8eda-7f404b9a5387@linux.intel.com>
Message-ID: <155309704324.15790.7194354565433494435@skylake-alporthouse-com>
Date: Wed, 20 Mar 2019 15:50:43 +0000
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: Fix assertion
 failure due to vblank mismatch
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Nischala Yelchuri <nischala.yelchuri@intel.com>, igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNYWFydGVuIExhbmtob3JzdCAoMjAxOS0wMy0yMCAxNTo0NDozNikKPiBPcCAxMy0w
My0yMDE5IG9tIDIxOjQxIHNjaHJlZWYgQ2hyaXMgV2lsc29uOgo+ID4gUXVvdGluZyBOaXNjaGFs
YSBZZWxjaHVyaSAoMjAxOS0wMy0xMyAyMDoxNjozNSkKPiA+PiBGb3IgdGhlICFtb2Rlc2V0IGNh
c2UsIGFmdGVyIGEgcGFnZWZsaXAgaXMgcGVyZm9ybWVkIG9uIGJvdGggY3J0YydzLAo+ID4+IHZi
bGFuayBjb3VudGVyIGlzIGFkdmFuY2VkIGJ5IDEgd2hlbiBjb21wYXJlZCB0byBpdHMgb3JpZ2lu
YWwgdmFsdWUuCj4gPj4KPiA+PiBGb3IgdGhlIG1vZGVzZXQgY2FzZSwgd2hlbiBwYWdlZmxpcHMg
YW5kIG1vZGVzZXRzIGFyZSBpbnRlcmxlYXZlZCwKPiA+PiB2YmxhbmsgY291bnRlciBkb2VzIG5v
dCBhbHdheXMgYWR2YW5jZSBieSAxIGFzIG5vbmJsb2NraW5nIG1vZGVzZXQKPiA+PiBjb3VsZCBm
YWlsLCBpbiB3aGljaCBjYXNlIHdlIGRvIG5vdCBuZWVkIHZibGFua19tYXRjaGVzLgo+ID4gSGF2
aW5nIGFja25vd2xlZGdlZCB0aGUgYnVnLCB0cnkgZml4aW5nIGl0Lgo+ID4gLUNocmlzCj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gaWd0LWRl
diBtYWlsaW5nIGxpc3QKPiA+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKPiAKPiBI
ZXksCj4gCj4gTm90IHN1cmUgdGhhdCdzIHBvc3NpYmxlLiBXZSBuZWVkIGFjY2VzcyB0byBhbGwg
Y3J0Y19zdGF0ZSdzIHdoZW4gcmVhbGxvY2F0aW5nIGRkYiwgYW5kIHRoaXMgbWVhbnMgYSBwYWdl
ZmxpcCBvbiB0aGUgZmlyc3QgY3J0YyBpcyBzdGFsbGVkIHdoaWxlIGRvaW5nIGEgbW9kZXNldCBv
biBhbm90aGVyLgo+IAo+IFRoZSBwYWdlIGZsaXAgd2lsbCBiZSBibG9ja2VkIG9uIHRoZSBub25i
bG9ja2luZyBtb2Rlc2V0IHRvIGNvbXBsZXRlLgoKQW5kIGl0IHNob3VsZCBzdGlsbCBvbmx5IHRh
a2UgYSB2YmxhbmsuLi4gUmlnaHQ/IChUaGF0IGlzIHdoYXQgdGhlIHRlc3QKaXMgY29tcGxhaW5p
bmcgYWJvdXQgdGhhdCBpdCB0YWtlcyBtb3JlIHRoYW4gYSB2YmxhbmsgdG8gdXBkYXRlIGlpcmMu
KQoKQnV0IEknbGwgbGVhdmUgaXQgaW4geW91ciBoYW5kcyBpZiB5b3UgdGhpbmsgdGhlIHRlc3Qg
aXMgdG9vIGRlbWFuZGluZywKeW91IGNhbWUgdXAgd2l0aCBpdCBhZnRlciBhbGwgOikKLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
