Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E745C89133
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 13:49:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i13so19193078edf.11
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 06:49:54 -0700 (PDT)
Date: Thu, 25 Apr 2019 15:49:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190425134949.GB3273@phenom.ffwll.local>
References: <20190424161526.19208-1-simon.ser@intel.com>
 <20190425073525.GA9857@phenom.ffwll.local>
 <87a7getn6f.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a7getn6f.fsf@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] ci: build with Clang
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMDE6MDU6MjhQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gVGh1LCAyNSBBcHIgMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PiB3cm90ZToKPiA+IE9uIFdlZCwgQXByIDI0LCAyMDE5IGF0IDA3OjE1OjI2UE0gKzAzMDAsIFNp
bW9uIFNlciB3cm90ZToKPiA+PiBUaGlzIGFkZHMgYSBidWlsZCBzdGVwIHdpdGggQ2xhbmcgb24g
RmVkb3JhLiBIb3BlZnVsbHkgdGhpcyBjYW4gaGVscCBrZWVwaW5nCj4gPj4gQ2xhbmcgYnVpbGRz
IGhlYWx0aHkuCj4gPj4gCj4gPj4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJA
aW50ZWwuY29tPgo+ID4+IC0tLQo+ID4+ICAuZ2l0bGFiLWNpLnltbCB8IDggKysrKysrKysKPiA+
PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+ID4+IAo+ID4+IGRpZmYgLS1naXQg
YS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCj4gPj4gaW5kZXggYWU4Y2JiNjcuLmU3
ZDMxMzc2IDEwMDY0NAo+ID4+IC0tLSBhLy5naXRsYWItY2kueW1sCj4gPj4gKysrIGIvLmdpdGxh
Yi1jaS55bWwKPiA+PiBAQCAtNDcsNiArNDcsMTQgQEAgYnVpbGQ6dGVzdHMtZmVkb3JhLW9sZGVz
dC1tZXNvbjoKPiA+PiAgICAgIC0gbmluamEgLUMgYnVpbGQKPiA+PiAgICAgIC0gbmluamEgLUMg
YnVpbGQgaWd0LWdwdS10b29scy1kb2MKPiA+PiAgCj4gPj4gK2J1aWxkOnRlc3RzLWZlZG9yYS1j
bGFuZzoKPiA+PiArICBzdGFnZTogYnVpbGQKPiA+PiArICBzY3JpcHQ6Cj4gPj4gKyAgICAtIGRu
ZiBpbnN0YWxsIC15IGNsYW5nCj4gPj4gKyAgICAtIGV4cG9ydCBDQz1jbGFuZwo+ID4+ICsgICAg
LSBtZXNvbiAkTUVTT05fT1BUSU9OUyBidWlsZAo+ID4+ICsgICAgLSBuaW5qYSAtQyBidWlsZAo+
ID4KPiA+IFVoIHdoeT8KPiA+Cj4gPiBUaGUgdGhpbmcgdGhhdCBicm9rZW4gaXMgYnVpbGRpbmcg
b24gbm9uLXg4NiBob3N0cywgYW5kIHRoYXQncyB0aGUgdGhpbmcKPiA+IGdpdGxhYiBDSSBjYXVn
aHQuIEkgaGF2ZSBubyBpZGVhIHdoeSB0aGlzIGlzIGFsbCBhYm91dCBjbGFuZyAoaW1vIGl0J3MK
PiA+IG5vdCksIGFuZCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBjYXJlIGFib3V0IGNsYW5nIGVp
dGhlci4KPiAKPiBBbmQgd2h5IHNob3VsZG4ndCB3ZSBjYXJlIGFib3V0IGNsYW5nPwoKV2hhdCBJ
IG1lYW50IGlzOiBXZSBhbHJlYWR5IGhhdmUgZ2l0bGFiIGNpIHRhcmdldHMgdGhhdCBjYXVnaHQg
dGhlIHJlY2VudApjbGFuZyByZWdyZXNzaW9uIChiZWNhdXNlIGEgbG90IG1vcmUgYnJva2UpLiBO
byBvbmUgZ2F2ZSBhIHNoaXQgZnJvbSB3aGF0CkkgY2FuIHRlbGwsIHNvIEkgZ3Vlc3MgSSdtIHF1
ZXN0aW9uaW5nIHRoZSB2YWx1ZSBvZiBtb3JlIGdpdGxhYiBDSSB0YXJnZXRzCmluIGdlbmVyYWwu
IFdlIGNvdWxkIGZpeCB0aGF0IGJ5IGdvaW5nIHRvIG1lcmdlIHJlcXVlc3RzIGFuZCBibG9ja2lu
ZwpwdWxscyB0aGF0IGZhaWwgdG8gYnVpbGQgSSBndWVzcy4KLURhbmllbAotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
