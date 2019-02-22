Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE778979F
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Feb 2019 16:55:52 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190221192745.31178-2-antonio.argenziano@intel.com>
 <20190221223859.14667-1-antonio.argenziano@intel.com>
 <155079223659.4937.12315376343973234618@skylake-alporthouse-com>
 <84b6be59-5705-5a7b-8f98-0c42cc52d846@intel.com>
In-Reply-To: <84b6be59-5705-5a7b-8f98-0c42cc52d846@intel.com>
Message-ID: <155085453789.4937.11051023274884383159@skylake-alporthouse-com>
Date: Fri, 22 Feb 2019 16:55:37 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/prime_self_import: Swap gtt
 mapping for cpu
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMjIgMTY6NTA6MDcpCj4gCj4gCj4g
T24gMjEvMDIvMTkgMTU6MzcsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTIxIDIyOjM4OjU5KQo+ID4+IFRoZSB0ZXN0IHVzZXMgZ3R0
IG1hcHBpbmcgdG8gY2hlY2sgdHdvIEJPcyBoYXZlIHRoZSBzYW1lIGNvbnRlbnQsIHNpbmNlCj4g
Pj4gaXQgc2VlbXMgdGhlcmUgaXMgbm8gY29udGVudGlvbiBvbiB0aGUgQk9zIHVzZSBjcHUgbWFw
cGluZyB0byBtYWtlIGl0Cj4gPj4gY29tcGF0aWJsZSB3aXRoIHBsYXRmb3JtcyB0aGF0IGRvIG5v
dCBoYXZlIGEgbWFwcGFibGUgYXBlcnR1cmUuCj4gPj4KPiA+PiB2MjoKPiA+PiAgICAgICAgICAt
IE5lZWQgdG8gaGF2ZSBhbiBleHBsaWNpdCBzZXRfZG9tYWluLiAoQ2hyaXMpCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRl
bC5jb20+Cj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsgaGFzIGFueSBzZW1hbnRpYyBpbXBhY3QsIHNv
IG5vIG5lZWQgdG8gdmVyaWZ5IGV2ZXJ5IHdyaXRlCj4gPiB0byBvbmUgb2YgdGhlIGNsb25lZCBm
ZCBpcyB2aXNpYmxlIGluIHRoZSBvdGhlciwganVzdCBvbmNlIGlzIGVub3VnaC4KPiAKPiBLZWVw
IG9ubHkgb25lIHNldF9kb21haW4gdGhlbj8KCk5vLCBJIHdhcyB0YWxraW5nIGFib3V0IHdoZXRo
ZXIgd2UgbmVlZGVkIHRvIGRvIHRoaXMgZm9yIGFsbCB0aGUKZGlmZmVyZW50IG1tYXAgcGF0aHMs
IGFuZCBkZWNpZGVkIHRoYXQgd2UgYXJlbid0IGRvaW5nIGFueSBjb2hlcmVuY3kKY2hlY2tzIGp1
c3QgdmVyaWZ5aW5nIHRoYXQgd2UgaGFkIG9uZSBvYmplY3RzLgoKV2hldGhlciB0byB1c2Ugb25l
IG9yIHR3byBzZXQtZG9tYWluIGhlcmUgaXMgYW4gaW50ZXJlc3RpbmcgcXVlc3Rpb24KcmVsYXRp
bmcgdG8gaG93IG11Y2ggd2Ugd2FudCB0byBhc3N1bWUgd2Ugb25seSBoYXZlIGEgc2luZ2xlIGJv
IGhlcmUKKHdoaWNoIGlzIHRoZSBvYmplY3Qgb2YgdGhlIGV4ZXJjaXNlIG9mYykuIEkgdGhpbmsg
SSBmYXZvdXIga2VlcGluZyBpdAphcyB0d28gZGlzdGluY3QgaGFuZGxlcyB3aXRoIHRoZSB0ZXN0
IGJlaW5nIG9ubHkgdGhhdCB0aGUgbWVtb3J5CmNvbnRlbnRzIGFyZSB0aGUgc2FtZS4gT3RoZXJ3
aXNlIHdlIG1pZ2h0IGFzIHdlbGwganVzdCB1c2Ugb25lIGhhbmRsZSA7KQogCj4gQW55IG9iamVj
dGlvbnMgdG8gc3BsaXR0aW5nIHRoaXMgZnJvbSB0aGUgc2VyaWVzIGFuZCBtZXJnZT8KClRoaXMg
Y2FuIGJlIGFwcGxpZWQgcmlnaHQgYXdheS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
