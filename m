Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258556ECE8
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2019 18:08:16 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191030180144.12976-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20191030180144.12976-1-ville.syrjala@linux.intel.com>
Message-ID: <157245889217.2281.7127563229464460106@skylake-alporthouse-com>
Date: Wed, 30 Oct 2019 18:08:12 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Allow an extra half
 frame for vblank waits
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTEwLTMwIDE4OjAxOjQ0KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gVGhlIHZibGFu
ayB0ZXN0cyB0cnkgdG8gbWFrZSBzdXJlIGEgcmVsYXRpdmUgdmJsYW5rIHdhaXQgb2YKPiAyIGNv
dW50cyBjb21wbGV0ZXMgaW4gfjEtMiBmcmFtZXMgKGRlcGVuZHMgb24gaG93IGZhciBhbG9uZyB0
aGUKPiBmaXJzdCBmcmFtZSB3ZSBhcmUgd2hlbiBpbml0aWF0aW5nIHRoZSB3YWl0KS4gVGhlIGFj
dHVhbAo+IGxpbWl0cyB3ZSBjaGVjayBhcmUgMC45IHRvIDIuMSBmcmFtZXMgdG8gYWNjb3VudCBm
b3IgaW5hY2N1cmFjaWVzCj4gaW4gdGhlIHJlcG9ydGVkIGRvdGNsb2NrLiBVbmZvcnR1bmF0ZWx5
IGl0IHNlZW1zIHdlIGVpdGhlcgo+IGhhdmUgZXZlbiBtb3JlIGluYWNjdXJhdGUgZG90Y2xvY2tz
IG9yIHNjaGVkdWxpbmcgbGF0ZW5jaWVzCj4gYW5kIHdoYXRub3QgYXJlIHB1c2hpbmcgdGhhdCBv
dXQgcXVpdGUgYSBiaXQgZnVydGhlci4gU28gbGV0J3MKPiBleHRlbmQgdGhlIGVuZCBsaW1pdCB0
byB+Mi42IGZyYW1lcyB0byBjdXQgZG93biBvbiB0aGUgbm9pc2UgYSBiaXQuCj4gCj4gQnVnemls
bGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMTYwOQo+
IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+CgpJIHRob3VnaHQgeW91IHdlcmUgY3JhenksIGJ1dCB1cG9uIGNoZWNraW5nIHdlIGFy
ZSBsb29raW5nIGF0IHdhbGx0aW1lCmFuZCBub3QgdGhlIHZibGFuayBpbnRlcnJ1cHQgdGltZXN0
YW1wLgoKLjUgZnJhbWVzIGlzIH44bXMsIHNvIHF1aXRlIHVuZGVyc3RhbmRhYmxlIGZvciBzY2hl
ZHVsaW5nIGxhdGVuY3kgb2YgdGhlCmlndCBpdHNlbGYuIFByb2JhYmx5IGl0IHdhcyB0aGF0IGph
dmEgaG9nLi4uCgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
