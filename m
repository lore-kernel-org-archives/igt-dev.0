Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C53893E8
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 06:46:06 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 13 May 2019 08:45:57 +0200
Message-ID: <4274261.hrWvC1JWiC@jkrzyszt-desk.ger.corp.intel.com>
In-Reply-To: <CAKMK7uGNeP+p1C72KAS3RvGM3kCvZwy9pT2EHf9_Ok7UzYzK1A@mail.gmail.com>
References: <20190430112915.16889-1-janusz.krzysztofik@linux.intel.com>
 <6544250.x6q5FR7zo1@jkrzyszt-desk.ger.corp.intel.com>
 <CAKMK7uGNeP+p1C72KAS3RvGM3kCvZwy9pT2EHf9_Ok7UzYzK1A@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v8 1/1 i-g-t] tests: Add a new test for
 driver/device hot reload
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gVHVlc2RheSwgTWF5IDcsIDIwMTkgMzozMjoxMCBQTSBDRVNUIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gLi4uCj4gQW5vdGhlciBvcHRpb24gd291bGQgYmUgdG8gZmlyc3Qg
aGF2ZSBhIG1vcmUgbWluaW1hbCBob3R1bnBsdWcgdGVzdAo+IHdpdGhvdXQgYW55IGJ1c3kgYmF0
Y2hlcyBwZW5kaW5nLCBhbmQgbWFrZSBzdXJlIHRoYXQgd29ya3MgcmVsaWFibGUKPiAoaS5lLiBu
byBidWZmZXIsIG5vIGNvbnRleHQsIG5vIG5vdGhpbmcsIG5vIG9wZW4gZmQsIGFic29sdXRlbHkK
PiBub3RoaW5nIHJlYWxseSBhbGxvY2F0ZWQgZnJvbSB1c2Vyc3BhY2UpLiBUaGVuIGV4dGVuZCBm
cm9tIHRoZXJlCj4gc3RlcC1ieS1zdGVwLCBlLmcuIGZpcnN0IGp1c3Qgb3BlbiBhIGRybSBkZXZp
Y2UgZmQsIHRoZW4gYWxsb2NhdGUgYQo+IGJ1ZmZlciwgdGhlbiBtbWFwLCB0aGVuIG1heWJlIHRy
eSB0byB3cml0ZSB0byB0aGF0IGJ1ZmZlciBhZnRlcgo+IHVucGx1ZywgdHJ5IHRvIGRvIGFuIGlv
Y3RsIGFmdGVyIHVucGx1ZyAoZ28gdGhyb3VnaCBhbGwgb2YgdGhlbSkuCj4gCj4gT25seSBvbmNl
IHlvdSd2ZSBnb25lIHRocm91Z2ggYWxsIHRoZSBtb3JlIGJhc2ljIHRoaW5ncyBnbyB0byB0aGUg
bXVjaAo+IG1vcmUgZXZpbCBzdHVmZiBsaWtlIGhhdmluZyBhIGJhdGNoIGluLWZsaWdodCwgb3Ig
YSBrbXMgcmVxdWVzdAo+IGluLWZsaWdodC4gVGhhdCB3YXkgaXQgc2hvdWxkIGJlIGVhc2llciB0
byBtYWtlIGZvcndhcmQgcHJvZ3Jlc3Mgb24KPiB0aGVzZSBidWdzIHdpdGhvdXQgcmlza2luZyB0
aGUgd29ybGQuIFBsdXMgeW91IGNhbiBzdGFydCBtZXJnaW5nIHRoZQo+IGlndCBzaWRlIGFscmVh
ZHksIHRvIG1ha2Ugc3VyZSBubyBvbmUgcmVncmVzc2VzIGFueW1vcmUuCgpJdCBsb29rcyBsaWtl
IEkgbWlnaHQgaGF2ZSBtaXN1bmRlcnN0b29kIHlvdXIgaWRlYS4gIERpZCB5b3UgbWVhbiBJIHNo
b3VsZCAKc3RhcnQgd2l0aCBhIHBhdGNoIHRoYXQgYWRkcyBvbmx5IHRoZSBtaW5pbWFsIGhvdHVu
cGx1ZyB0ZXN0IGFuZCBub3RoaW5nIG1vcmU/IApUaGVuIGV4dGVuZCBpdCB3aXRoIG1vcmUgYWR2
YW5jZWQgc3VidGVzdHMgb25lIGJ5IG9uZSBjb25zZWN1dGl2ZWx5IGJ1dCBvbmx5IAp3aGVuIGRy
aXZlciBpc3N1ZXMgcmV2ZWFsZWQgYnkgdGhvc2Ugc3VidGVzdHMgYWxyZWFkeSBpbiBwbGFjZSBh
cmUgcmVzb2x2ZWQ/CgpJZiB0aGF0J3MgdGhlIGNhc2UsIEkgc2hvdWxkIHByb2JhYmx5IHN1Ym1p
dCB2MTAgbGltaXRlZCB0byB0aGUgbWluaW1hbCB0ZXN0IApzaW5jZSB2OSBJIHN1Ym1pdHRlZCBs
YXN0IHdlZWsgd2FzIG5vdCBnb2luZyB0byBiZSB0YWtlbiB1bmRlciBjb25zaWRlcmF0aW9uLgoK
VGhhbmtzLApKYW51c3oKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
