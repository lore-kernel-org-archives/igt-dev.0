Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D486E90C
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2019 08:28:13 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191024123114.30474-1-arkadiusz.hiler@intel.com>
References: <20191024123114.30474-1-arkadiusz.hiler@intel.com>
Message-ID: <157199206963.2725.1946559282996035646@skylake-alporthouse-com>
Date: Fri, 25 Oct 2019 09:27:49 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_list: Update,
 clean-up and document igt_list
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTktMTAtMjQgMTM6MzE6MTQpCj4gT3VyIGxpc3Qg
d2FzIHNvbWV0aGluZyBiZXR3ZWVuIFdheWxhbmQgYW5kIExpbnV4IEtlcm5lbCBsaXN0Cj4gaW1w
bGVtZW50YXRpb25zLCByaWdodCBpbiB0aGUgdW5jYW5ueSB2YWxsZXkuCj4gCj4gT24gdG9wIG9m
IHRoYXQgaXQgZmFsc2VseSBjbGFpbWVkIHRoYXQgaXQncyBhIHN0cmFpZ2h0IGNvcHkgZnJvbSB0
aGUKPiBXYXlsYW5kIHByb2plY3QuCj4gCj4gTGV0J3MgbWFrZSBvdXIgaW1wbCBtb3JlIGFraW4g
dG8gdGhlIGtlcm5lbCBvbmUgdG8gZWFzZSB0aGUgY29nbml0aXZlCj4gZGlzc29uYW5jZSBmb3Ig
dGhlIGRldmVsb3BlcnMgd29ya2luZyBvbiBhbGwgdGhvc2UgcHJvamVjdHMuCj4gCj4gVGhpcyBw
YXRjaDoKPiAgKiBtaW1pY3MgdGhlIGN1cnJlbnQga2VybmVsIGxpc3QgaW50ZXJmYWNlCj4gICog
c2VwYXJhdGVzIElHVCBoZWxwZXJzIGluIHRoZSBzb3VyY2UgZmlsZXMKPiAgKiBhZGRzIGJyaWVm
IGV4cGxhbmF0aW9uIGFuZCBjb2RlIGV4YW1wbGUgZm9yIGlndC1kb2MKPiAgKiBpbnRyb2R1Y2Vz
IGlndF9saXN0LmMgYXMgc3RhdGljIGlubGluZXMgYXJlIG5vdCB2aXNpYmxlIGluIHRoZSBkb2Nz
Cj4gCj4gdjI6IG1pbWljIHRoZSBrZXJuZWwgaW5zdGVhZCBvZiB3YXlsYW5kIChDaHJpcykKPiAg
ICAgLSBfaGVhZCBzdWZmaXggZm9yIHRoZSBzZW50aW5lbC9saW5rIHN0cnVjdAo+ICAgICAtIF9l
bnRyeV8gaW4gaXRlcmF0b3IgbmFtZXMgdGhhdCBnbyBvdmVyIHRoZSBlbGVtZW50cwoKV2UgZGlk
bid0IGxpc3QgdGhlIF9oZWFkIHN1ZmZpeCBhcyB0aGUgbGlzdCBpcyBib3RoIGl0cyBoZWFkIGFu
ZApub2RlLiA6KQoKVGhlIG90aGVyIG9wdGlvbiB3YXMgdG8gZ28gd2l0aCBtZXNhJ3Mgd2l0aCBh
dXRvbWF0aWMgdmFyaWFibGVzCihkaWZmZXJlbnQgY29udGFpbmVyX29mIGltcGxlbWVudGF0aW9u
KS4KCj4gQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENjOiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBTaWduZWQtb2ZmLWJ5OiBB
cmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+CgpJJ2QgZ2V0IGEgc2Vj
b25kIG9waW5pb24sIGJ1dCBzaW5jZSB5b3UgZmVlbCBzdHJvbmdseSBlbm91Z2ggdG8gd3JpdGUK
dGhlIHBhdGNoLi4uCgpBY2tlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
