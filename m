Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F158C6E033
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Aug 2018 22:12:04 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <153454218366.10736.13913328360286747917@skylake-alporthouse-com>
References: <153454120121.10736.16460853969838180302@skylake-alporthouse-com>
 <20180817213553.4544-1-rodrigo.vivi@intel.com>
 <153454218366.10736.13913328360286747917@skylake-alporthouse-com>
Message-ID: <153454391443.10736.16188882454688797144@skylake-alporthouse-com>
Date: Fri, 17 Aug 2018 23:11:54 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] pm_rpm: Require DMC loaded before
 testing runtime_pm for gen9+
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
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDgtMTcgMjI6NDM6MDMpCj4gUXVvdGluZyBSb2Ry
aWdvIFZpdmkgKDIwMTgtMDgtMTcgMjI6MzU6NTMpCj4gPiBTaW5jZSB3ZSBibG9jayBydW50aW1l
IFBNIGlmIERNQyBpcyBub3QgbG9hZGVkLCBsZXQncyBza2lwCj4gPiB0aGUgdGVzdC4KPiA+IAo+
ID4gdjI6IFVzZSBpOTE1X2RtY19pbmZvIHByZXNlbmNlIHRvIGRldGVjdCBkbWMgcmVxdWlyZW1l
bnQKPiA+ICAgICBpbnN0ZWFkIG9mIGdlbiBjaGVjayBhcyBDaHJpcyBzdWdnZXN0ZWQuCj4gPiB2
MzogQWRkIG1pc3NpbmcgXDAgYmVmb3JlIHVzaW5nIGJ1Zi4gKENocmlzKQo+ID4gCj4gPiBDYzog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiBDYzogSW1yZSBEZWFr
IDxpbXJlLmRlYWtAaW50ZWwuY29tPgo+ID4gQ2M6IEFudXNoYSBTcml2YXRzYSA8YW51c2hhLnNy
aXZhdHNhQGludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmln
by52aXZpQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIHRlc3RzL3BtX3JwbS5jIHwgMTYgKysrKysr
KysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS90ZXN0cy9wbV9ycG0uYyBiL3Rlc3RzL3BtX3JwbS5jCj4gPiBpbmRleCBi
YmUzNmU1OS4uZmEwZDk4ZGMgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9wbV9ycG0uYwo+ID4gKysr
IGIvdGVzdHMvcG1fcnBtLmMKPiA+IEBAIC02OTMsNiArNjkzLDIxIEBAIHN0YXRpYyB2b2lkIHNl
dHVwX3BjOCh2b2lkKQo+ID4gICAgICAgICBoYXNfcGM4ID0gdHJ1ZTsKPiA+ICB9Cj4gPiAgCj4g
PiArc3RhdGljIGJvb2wgZG1jX2xvYWRlZCh2b2lkKQo+ID4gK3sKPiA+ICsgICAgICAgY2hhciBi
dWZbMTVdOwo+ID4gKyAgICAgICBpbnQgbGVuOwo+ID4gKwo+ID4gKyAgICAgICBsZW4gPSBpZ3Rf
c3lzZnNfcmVhZChkZWJ1Z2ZzLCAiaTkxNV9kbWNfaW5mbyIsIGJ1Ziwgc2l6ZW9mKGJ1ZikpOwo+
IAo+IHNpemVvZihidWYpIC0gMSA6KQo+IAo+IG9yIGVsc2UgbGVuIHdpbGwgYmUgc2l6ZW9mKGJ1
ZikgYW5kIGJ1ZltsZW5dIG5vdCB3aGVyZSBpdCBiZWxvbmdzLgoKSSB3YXMgZGViYXRpbmcgd2hl
dGhlciBvciBub3QgaGF2aW5nIGEgYmlnIHJlZCBmYWlsIHdhcyBhIGdvb2QgaWRlYSBvcgpub3Qs
IGJ1dCBhdCB0aGUgZW5kIG9mIHRoZSBkYXkgaXQgaXMgYW4gZXh0ZXJuYWwgZmFpbHVyZSAoZS5n
LiB0aGUgdXNlcgptYXkgcHVycG9zZWx5IG5vdCBwcm92aWRlIHRoZSBkbWMgZmlybXdhcmUpLgoK
V2l0aCB0aGUgZmluYWwgZml4LApSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
