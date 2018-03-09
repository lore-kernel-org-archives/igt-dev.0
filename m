Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D845A6EC0E
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Mar 2018 21:23:51 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180309204308.4605-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20180309204308.4605-1-ville.syrjala@linux.intel.com>
Message-ID: <152063062641.571.6919692629291896250@mail.alporthouse.com>
Date: Fri, 09 Mar 2018 21:23:46 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/pm_rpm: Don't try to create an
 X-tiled ARGB8888 framebuffer
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTAzLTA5IDIwOjQzOjA4KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gT24gbW9zdCBw
bGF0Zm9ybXMgQVJHQjg4ODggaXMgb25seSBzdXBwb3J0ZWQgYnkgdGhlIGN1cnNvciBwbGFuZSwK
PiB3aGljaCBkb2Vzbid0IHN1cHBvcnQgdGlsZWQgYnVmZmVycy4gSGVuY2UgdGhlIGtlcm5lbCBp
cyB1bmRlciBubwo+IG9ibGlnYXRpb24gdG8gYWNjZXB0IHRoZSByZXF1ZXN0IHRvIGNyZWF0ZSBh
IHRpbGVkIEFSR0I4ODgKPiBmcmFtZWJ1ZmZlci4gQXBwYXJlbnRseSB3ZSd2ZSBiZWVuIGxldHRp
bmcgdGhpcyBzbGlwIHRocm91Z2ggc28KPiBmYXIsIGJ1dCB0aGF0IGlzIGFib3V0IHRvIGNoYW5n
ZS4KPiAKPiBGb3J0dW5hdGVseSB0aGUgcmVzdWx0aW5nIGZiIHdhcyBuZWVyIGFjdHVhbGx5IHVz
ZWQgKGluIGZhY3QgdGhlCj4ga2VybmVsIHdvdWxkIGhhdmUgcmVqZWN0ZWQgdGhlIHNldHBsYW5l
L2F0b21pYyBpb2N0bCB3aXRoIHN1Y2gKPiBhIGZyYW1lYnVmZmVyKS4gQWxsIHdlJ3JlIHJlYWxs
eSBpbnRlcmVzdGVkIGhlcmUgaXMgdGhlIGdlbSBCTwo+IHdoaWNoIHdlIGZlZWQgdG8gdGhlIGtl
cm5lbCB2aWEgdGhlIHNldGN1cnNvciBpb2N0bCBhZnRlciBjaGFuZ2luZwo+IHRoZSB0aWxpbmcg
dG8gbGluZWFyLiBUbyBhdm9pZCBjaGFuZ2luZyB0aGUgdGVzdCBkcmFzdGljYWxseSB3ZQo+IGNh
biBzaW1wbHkgY2hhbmdlIHRoZSBmYiB0byBYUkdCODg4OCwgd2hpY2ggY29tYmluZWQgd2l0aCBY
LXRpbGluZwo+IGlzIHN1cHBvcnRlZCBvbiBhbGwgcGxhdGZvcm1zLgoKWXVwLCBYUkdCIGNhbiBi
ZSB1c2VkIGZvciBjdXJzb3IgYXMgd2VsbCBhcyBhbGwgdGhlIG90aGVyIHBsYW5lcywgc28gbm8K
bG9zcyBvZiBnZW5lcmFsaXR5IChhbmQgYXMgc3RhdGVkIG11Y2ggZ2FpbmVkISkuCgo+IFNpZ25l
ZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNo
cmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
