Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B996EF08
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jul 2018 20:15:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k7-v6so2051134wrq.0
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Jul 2018 13:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180606222741.24096-1-lucas.demarchi@intel.com>
 <CAKi4VALGU5K5oNxQijgXi6gLdx3N3-6fphu6k14LGO9fLrv9Xw@mail.gmail.com>
 <20180619073741.lgaa2kbvc3o46yc2@platvala-desk.ger.corp.intel.com>
 <CAKi4VA+cOxESw17N3Yjyj-CH87uBfjQUJj=p_a1JAFz_6yGNEA@mail.gmail.com>
 <20180620095745.c4p35a6ftor3z5jg@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20180620095745.c4p35a6ftor3z5jg@platvala-desk.ger.corp.intel.com>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Thu, 5 Jul 2018 13:15:40 -0700
Message-ID: <CAKi4VAJS+4SWJXpo_U-ZhKaxncP-=Ws0SrTHu1iwNZcf=msvXQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tests/sw_sync: fix pthread
 start_routine declaration
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
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjAsIDIwMTggYXQgMjo1NyBBTSBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2
YWxhQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAxOSwgMjAxOCBhdCAwMTozMDoy
N1BNIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAxOSwgMjAx
OCBhdCAxMjozNyBBTSBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgSnVuIDE4LCAyMDE4IGF0IDExOjQ2OjMxUE0gLTA3MDAs
IEx1Y2FzIERlIE1hcmNoaSB3cm90ZToKPiA+ID4gPiBQaW5nPwo+ID4gPgo+ID4gPiBBIHRlbnRh
dGl2ZQo+ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFs
YUBpbnRlbC5jb20+Cj4gPiA+Cj4gPiA+IG9uIHRoZSBzZXJpZXMuCj4gPiA+Cj4gPiA+IFdoYXQg
aXMgdGhlIHByYWN0aWNhbCBlZmZlY3Qgb2YgLXN0ZD1nbnUxMSBpbiB0ZXJtcyBvZiBnY2MgdmVy
c2lvbgo+ID4gPiByZXF1aXJlbWVudD8gSSBrbm93IHVzaW5nIEMrKzExIHJlcXVpcmVzIHNvbWUg
Y3JlYXRpdmUgc2VsZWN0aW9uIG9mCj4gPiA+IGdjYyB2ZXJzaW9ucywgYnV0IEkgaGF2ZSBubyBp
ZGVhIGFib3V0IEMxMS4KPiA+Cj4gPiBJIHVzZSBpdCBzaW5jZSBmb3JldmVyIGluIGttb2QsIGJ1
dCB0aGVyZSBJIGhhdmUgc29tZQo+ID4gY3J1ZnReV2NvbXBhdGliaWxpdHkgbWFjcm9zLiBJIGNh
biBicmluZyBpdCBvdmVyIHRvIGlndCBpZiBpdCdzCj4gPiBuZWVkZWQsIGJ1dCBJIHRoaW5rIGl0
IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIGEgdGVudGF0aXZlIHB1c2gKPiA+IHdpdGhvdXQgdGhl
bS4KPiA+Cj4gPiBBbnN3ZXJpbmcgeW91ciBxdWVzdGlvbiwgYWNjb3JkaW5nIHRvCj4gPiBodHRw
czovL2djYy5nbnUub3JnL3dpa2kvQzExU3RhdHVzIF9TdGF0aWNfYXNzZXJ0KCkgdGhhdCBJJ20g
dXNpbmcgaW4KPiA+IHRoaXMgc2VyaWVzIGlzIGF2YWlsYWJsZSBzaW5jZSBnY2MgNC42LiBTb21l
IEMxMSBmZWF0dXJlcyBlbnRlcmVkIGluCj4gPiA0LjcgYW5kIGluIDQuOSBpdCB3YXMgImZlYXR1
cmUgY29tcGxldGUiLgo+Cj4KPiBUaGF0IHNvdW5kcyBhbHJpZ2h0LiBFdmVuIGRlYmlhbiBvbGRz
dGFibGUgaGFzIDQuOS4KCnNvIEkgYXNzdW1lIHRoZXJlJ3Mgbm90aGluZyBwZW5kaW5nIG9uIG15
IHNpZGUgYW5kIHRoaXMgY2FuIGJlIGluPwoKTHVjYXMgRGUgTWFyY2hpCgo+Cj4KPiAtLQo+IFBl
dHJpIExhdHZhbGEKCgoKLS0gCkx1Y2FzIERlIE1hcmNoaQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
