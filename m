Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBFB899B5
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2019 10:49:30 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 11 Jul 2019 12:49:12 +0200
Message-ID: <1922643.DgTLQ80WSp@jkrzyszt-desk.ger.corp.intel.com>
In-Reply-To: <70b267817cf2f2a7bb1a6dba795026e31ad3893f.camel@intel.com>
References: <20190711083958.6935-1-janusz.krzysztofik@linux.intel.com>
 <70b267817cf2f2a7bb1a6dba795026e31ad3893f.camel@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/1] tests/prime_vgem: Fix broken
 handling of interprocess pipes
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
To: "Ser, Simon" <simon.ser@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgU2ltb24sCgpPbiBUaHVyc2RheSwgSnVseSAxMSwgMjAxOSAxMjozOTo1MSBQTSBDRVNUIFNl
ciwgU2ltb24gd3JvdGU6Cj4gT24gVGh1LCAyMDE5LTA3LTExIGF0IDEwOjM5ICswMjAwLCBKYW51
c3ogS3J6eXN6dG9maWsgd3JvdGU6Cj4gPiBJZiBhIGNoaWxkIHByb2Nlc3MgZGllcyBmb3IgYW55
IHJlYXNvbiB3aGlsZSBiYXNpYy1mZW5jZS1yZWFkIG9yCj4gPiBiYXNpYy1mZW5jZS1tbWFwIHN1
YnRlc3QgaXMgcnVuLCB0aGUgc3VidGVzdCBtYXkgaGFuZyBpbmRlZmluaXRlbHkgb24KPiA+IHJl
YWQoKSBmcm9tIGEgcGlwZSB3aGljaCBpcyBzdXBwb3NlZCB0byBiZSB3cml0dGVuIHRvIGJ5IHRo
YXQgY2hpbGQKPiA+IChjYW4KPiA+IGJlIGludGVycnVwdGVkIHRob3VnaCkuICBGaXggaXQgYnkg
Zmlyc3QgY2xvc2luZyB1bnVzZWQgcGlwZSBlbmRzIG9uCj4gPiBib3RoCj4gPiBwYXJlbnQgYW5k
IGNoaWxkIHNpZGUgYmVmb3JlIHVzaW5nIHRoZSBwaXBlLCBhcyByZWNvbW1lbmRlZCBieQo+ID4g
cGlwZSgyKQo+ID4gbWFudWFsIHBhZ2UuCj4gPiAKPiA+IFBsZWFzZSBub3RlIHRoYXQgZHVlIHRv
IHRoZSBJR1QgbGlicmFyeSB3YXkgb2YgaGFuZGxpbmcgc2lnbmFscywgbm93Cj4gPiB0aGUKPiA+
IHN1YnRlc3RzIG1heSBmYWlsIHdpdGggZXJyb3IgY29kZSAxNDEgKDEyOCArIFNJR1BJUEUpIGFu
ZCBubyB1c3VhbAo+ID4gREVCVUcKPiA+IG1lc3NhZ2UgYmxvY2sgb24gc3RkZXJyIG5vciBGQUlM
IG1lc3NhZ2UgbGluZSBvbiBzdGRvdXQsIGhvd2V2ZXIgc29tZQo+ID4gbWVhbmluZ2Z1bCBlcnJv
ciBtZXNzYWdlcyB3aWxsIHN0aWxsIGJlIHByaW50ZWQgb24gc3RkZXJyIGJ5IHRoZQo+ID4gZmFp
bGluZwo+ID4gY2hpbGQgcHJvY2Vzc2VzLgo+ID4gCj4gPiB2MjogcmVzZW5kIHdpdGggUmV2aWV3
ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gICAgIGFk
ZGVkCj4gCj4gWW91IGdlbmVyYWxseSBkb24ndCBuZWVkIHRvIHJlc2VuZCBhIHBhdGNoIGp1c3Qg
dG8gYWRkIGEgUi1iIHRhZy4KPiAKPiBEbyB5b3UgaGF2ZSBJR1QgY29tbWl0IHJpZ2h0cz8KCkkg
ZG9uJ3QgdGhpbmsgSSBoYXZlLgoKVGhhbmtzLApKYW51c3oKCj4gCj4gPiBKYW51c3ogS3J6eXN6
dG9maWsgKDEpOgo+ID4gICB0ZXN0cy9wcmltZV92Z2VtOiBGaXggYnJva2VuIGhhbmRsaW5nIG9m
IGludGVycHJvY2VzcyBwaXBlcwo+ID4gCj4gPiAgdGVzdHMvcHJpbWVfdmdlbS5jIHwgMTIgKysr
KysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiA+IAo+IAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
