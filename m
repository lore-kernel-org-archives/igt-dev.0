Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C24889220
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 10:03:12 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20190425073525.GA9857@phenom.ffwll.local>
References: <20190424161526.19208-1-simon.ser@intel.com>
 <20190425073525.GA9857@phenom.ffwll.local>
Date: Thu, 25 Apr 2019 13:05:28 +0300
Message-ID: <87a7getn6f.fsf@intel.com>
MIME-Version: 1.0
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
To: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <simon.ser@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyNSBBcHIgMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90
ZToKPiBPbiBXZWQsIEFwciAyNCwgMjAxOSBhdCAwNzoxNToyNlBNICswMzAwLCBTaW1vbiBTZXIg
d3JvdGU6Cj4+IFRoaXMgYWRkcyBhIGJ1aWxkIHN0ZXAgd2l0aCBDbGFuZyBvbiBGZWRvcmEuIEhv
cGVmdWxseSB0aGlzIGNhbiBoZWxwIGtlZXBpbmcKPj4gQ2xhbmcgYnVpbGRzIGhlYWx0aHkuCj4+
IAo+PiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+Cj4+IC0t
LQo+PiAgLmdpdGxhYi1jaS55bWwgfCA4ICsrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFi
LWNpLnltbAo+PiBpbmRleCBhZThjYmI2Ny4uZTdkMzEzNzYgMTAwNjQ0Cj4+IC0tLSBhLy5naXRs
YWItY2kueW1sCj4+ICsrKyBiLy5naXRsYWItY2kueW1sCj4+IEBAIC00Nyw2ICs0NywxNCBAQCBi
dWlsZDp0ZXN0cy1mZWRvcmEtb2xkZXN0LW1lc29uOgo+PiAgICAgIC0gbmluamEgLUMgYnVpbGQK
Pj4gICAgICAtIG5pbmphIC1DIGJ1aWxkIGlndC1ncHUtdG9vbHMtZG9jCj4+ICAKPj4gK2J1aWxk
OnRlc3RzLWZlZG9yYS1jbGFuZzoKPj4gKyAgc3RhZ2U6IGJ1aWxkCj4+ICsgIHNjcmlwdDoKPj4g
KyAgICAtIGRuZiBpbnN0YWxsIC15IGNsYW5nCj4+ICsgICAgLSBleHBvcnQgQ0M9Y2xhbmcKPj4g
KyAgICAtIG1lc29uICRNRVNPTl9PUFRJT05TIGJ1aWxkCj4+ICsgICAgLSBuaW5qYSAtQyBidWls
ZAo+Cj4gVWggd2h5Pwo+Cj4gVGhlIHRoaW5nIHRoYXQgYnJva2VuIGlzIGJ1aWxkaW5nIG9uIG5v
bi14ODYgaG9zdHMsIGFuZCB0aGF0J3MgdGhlIHRoaW5nCj4gZ2l0bGFiIENJIGNhdWdodC4gSSBo
YXZlIG5vIGlkZWEgd2h5IHRoaXMgaXMgYWxsIGFib3V0IGNsYW5nIChpbW8gaXQncwo+IG5vdCks
IGFuZCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBjYXJlIGFib3V0IGNsYW5nIGVpdGhlci4KCkFu
ZCB3aHkgc2hvdWxkbid0IHdlIGNhcmUgYWJvdXQgY2xhbmc/CgoKQlIsCkphbmkuCgotLSAKSmFu
aSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
