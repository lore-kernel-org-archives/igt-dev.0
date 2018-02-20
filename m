Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180220154438.GW22199@phenom.ffwll.local>
References: <20180220143308.2030-1-chris@chris-wilson.co.uk>
 <20180220154438.GW22199@phenom.ffwll.local>
Message-ID: <151914430032.4312.3495083185529477163@mail.alporthouse.com>
Date: Tue, 20 Feb 2018 16:31:40 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH igt] igt/kms_frontbuffer_tracking:
 Wait for PSR to be disabled
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
To: Daniel Vetter <daniel@ffwll.ch>, 
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE4LTAyLTIwIDE1OjQ0OjM4KQo+IE9uIFR1ZSwgRmVi
IDIwLCAyMDE4IGF0IDAyOjMzOjA4UE0gKzAwMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFBT
UiBtYXkgbm90IGV4aXQgaW5zdGFudGFuZW91c2x5LCBzbyB3aGlsZSBhc3NlcnRpbmcgdGhhdCBQ
U1IgaXMKPiA+IGRpc2FibGVkIGFmdGVyIGFuIGFjdGlvbiwgd2UgbWF5IGhhdmUgdG8gd2FpdCBh
IHNob3J0IHdoaWxlLiBDdXJyZW50bHkKPiA+IHRoYXQgd2FpdCBpcyB3YWl0aW5nIGZvciBQU1Ig
dG8gZW5hYmxlZCBhbmQgZXhwZWN0aW5nIHRvIHRpbWVvdXQ7IHRoaXMKPiA+IGZhaWxzIHdoZW4g
d2Ugc3RhcnQgdGhlIGFzc2VydGlvbiB3aXRoIFBTUiBhbHJlYWR5IGVuYWJsZWQuIEZpeCB0aGUg
d2FpdAo+ID4gdG8gd2FpdCB1bnRpbCBQU1IgaXMgZGlzYWJsZWQgcmF0aGVyIHRoYW4gdGltZW91
dC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Cj4gCj4gSSBndWVzcyB0aGF0J3MgdGhlIHJlcGx5IHRvIG15IHF1ZXN0aW9uIGFi
b3V0IHRoZSBlYXJsaWVyCj4ga21zX2Zyb250YnVmZmVyX3RyYWNraW5nIHBhdGNoPwoKV2hpY2gs
IHRoZSAtRU5PREVWPyBJIHRob3VnaHQgSSBleHBsYWluZWQgdGhhdCB3YXMgcHVyZWx5IHRvIGNv
cGUgd2l0aAp0aGUgaTkxNV9mYmNfaW5mbyBBUEkgZm9yICFIQVNfRkJDIG1hY2hpbmVzLCBhcyB3
ZSBhcmUgcnVubmluZwprbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcgYWNyb3NzIGZhcm0xIGluIGlk
bGUgdGltZS4KaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9rYXNhbjIu
aHRtbAogCj4gTWFrZXMgYSBidW5jaCBtb3JlIHNlbnNlIHRvIG1lLgoKVGhlcmUncyB0aGUgcXVl
c3Rpb24gb2Ygd2hldGhlciB0byBhcHBseSB0aGlzIHRvCmZiY193YWl0X3VudGlsX2Rpc2FibGVk
KCkgYXMgd2VsbCwgYnV0IEkgZ3Vlc3MgZmJjIGJlaGF2ZXMgc2xpZ2h0bHkKZGlmZmVyZW50bHkg
YXMgd2UgZG9uJ3Qgc2VlIHRoZSBhc3NlcnQgZmFpbHVyZSB0aGVyZS4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
