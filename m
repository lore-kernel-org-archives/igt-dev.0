Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E1A6E449
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Mar 2018 17:34:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180305125417.12723-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20180305125417.12723-1-ville.syrjala@linux.intel.com>
Message-ID: <152027128011.32001.3483101857096898798@mail.alporthouse.com>
Date: Mon, 05 Mar 2018 17:34:40 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/sysfs: Fix fbcon unbind, again
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTAzLTA1IDEyOjU0OjE2KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gTG9va3MgbGlr
ZSB1bmJpbmRpbmcgdGhlIGR1bW15IGNvbiBkb2Vzbid0IHdvcmsgb24gYWxsIG1hY2hpbmVzLiBJ
bnN0ZWFkCj4gd2UgaGF2ZSB0byBiaW5kIGZiY29uICh3aGljaCBpcyB3aGF0IHdlIHVzZWQgdG8g
ZG8gYmVmb3JlIGNvbW1pdAo+IGQxOGZjYTdmNmNmMyAoImxpYi9zeXNmczogRml4IGZiY29uIHJl
YmluZCIpKS4gU2luY2Ugc29tZSBtYWNoaW5lcyBuZWVkCj4gdGhlIGJpbmQgYW5kIG90aGVycyBu
ZWVkIHRoZSB1bmJpbmQgbGV0J3MgZG8gYm90aC4gVGhlIG1vc3Qgb2J2aW91cwo+IGRpZmZlcmVu
Y2UgSSBvYnNlcnZlZCBiZXR3ZWVuIHR3byBtYWNoaW5lcyB0aGF0IGJlaGF2ZSBkaWZmZXJlbnRs
eQo+IHdhcyB0aGUgb3JkZXIgaW4gd2hpY2ggdGhlIGNvbnNvbGUgZHJpdmVycyB3ZXJlIGxpc3Rl
ZCBpbiBzeXNmcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgoKT2suLi4gRm9yIGJvdGgsClJldmlld2VkLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
