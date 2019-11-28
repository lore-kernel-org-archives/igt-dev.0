Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330D46E802
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2019 13:30:07 +0000 (UTC)
Date: Thu, 28 Nov 2019 15:30:03 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20191128133003.GT25209@platvala-desk.ger.corp.intel.com>
References: <20191122011036.136424-1-don.hiatt@intel.com>
 <6aec8095-d8e4-212f-5ef7-0eb97a144f8c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6aec8095-d8e4-212f-5ef7-0eb97a144f8c@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/aux: Ensure swap space prior to
 suspend to disk
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
To: Sujaritha <sujaritha.sundaresan@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDQ6NDk6NDdQTSAtMDgwMCwgU3VqYXJpdGhhIHdyb3Rl
Ogo+IAo+IE9uIDExLzIxLzE5IDU6MTAgUE0sIGRvbi5oaWF0dEBpbnRlbC5jb20gd3JvdGU6Cj4g
PiBGcm9tOiBEb24gSGlhdHQgPGRvbi5oaWF0dEBpbnRlbC5jb20+Cj4gPiAKPiA+IFN1c3BlbmRp
bmcgdG8gZGlzayByZXF1aXJlcyBzd2FwIHNwYWNlLCBtYWtlIHN1cmUgaXQgZXhpc3RzCj4gPiBi
ZWZvcmUgYXR0ZW1wdGluZyB0byBzdXNwZW5kIHRvIGRpc2suCj4gPiAKPiA+IHYyOiBVc2UgaWd0
X3NraXAoKSBbVGhhbmtzLCBDaHJpcyFdCj4gPiB2MzogVXNlIGlndF9za2lwX29uX2YoKQo+ID4g
Cj4gPiBDYzogU3VqYXJpdGhhIFN1bmRhcmVzYW4gPHN1amFyaXRoYS5zdW5kYXJlc2FuQGludGVs
LmNvbT4KPiA+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+
IFNpZ25lZC1vZmYtYnk6IERvbiBIaWF0dCA8ZG9uLmhpYXR0QGludGVsLmNvbT4KPiA+IC0tLQo+
ID4gICBsaWIvaWd0X2F1eC5jIHwgNCArKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYXV4LmMgYi9saWIvaWd0X2F1
eC5jCj4gPiBpbmRleCA1NzhmODU3OTMzZjAuLmE2YjExNGVkN2U2NSAxMDA2NDQKPiA+IC0tLSBh
L2xpYi9pZ3RfYXV4LmMKPiA+ICsrKyBiL2xpYi9pZ3RfYXV4LmMKPiA+IEBAIC04NjQsNiArODY0
LDEwIEBAIHZvaWQgaWd0X3N5c3RlbV9zdXNwZW5kX2F1dG9yZXN1bWUoZW51bSBpZ3Rfc3VzcGVu
ZF9zdGF0ZSBzdGF0ZSwKPiA+ICAgCWlndF9yZXF1aXJlKHRlc3QgPT0gU1VTUEVORF9URVNUX05P
TkUgfHwKPiA+ICAgCQkgICAgZmFjY2Vzc2F0KHBvd2VyX2RpciwgInBtX3Rlc3QiLCBSX09LIHwg
V19PSywgMCkgPT0gMCk7Cj4gPiArCWlndF9za2lwX29uX2Yoc3RhdGUgPT0gU1VTUEVORF9TVEFU
RV9ESVNLICYmCj4gPiArCQkgICAgICAhaW50ZWxfZ2V0X3RvdGFsX3N3YXBfbWIoKSwKPiA+ICsJ
CSAgICAgICJTdXNwZW5kIHRvIGRpc2sgcmVxdWlyZXMgc3dhcCBzcGFjZS5cbiIpOwo+ID4gKwo+
ID4gICAJb3JpZ190ZXN0ID0gZ2V0X3N1c3BlbmRfdGVzdChwb3dlcl9kaXIpOwo+ID4gICAJc2V0
X3N1c3BlbmRfdGVzdChwb3dlcl9kaXIsIHRlc3QpOwo+IAo+IAo+IFRoaXMgc2hvdWxkIGhlbHAg
Zml4IHBhcnQgb2YgdGhlIHJlYXNvbiBmb3IgdGhlIHN1c3BlbmQgdGVzdHMgZmFpbGluZyBvbiBD
SS4KPiAKPiBSZXZpZXdlZC1ieSA6IFN1amFyaXRoYSBTdW5kYXJlc2FuIDxzdWphcml0aGEuc3Vu
ZGFyZXNhbkBpbnRlbC5jb20+CgpBbG1vc3QgYWNjaWRlbnRhbGx5IGRyb3BwZWQgdGhpcyBSLWIs
IHBhdGNod29yayBkaWRuJ3QgYXV0b21hdGljYWxseSBhZGQgaXQgZHVlIHRvIHRoZSBleHRyYSBz
cGFjZSBiZWZvcmUgOgoKClRoaXMgcGF0Y2ggaXMgbWVyZ2VkLCB0aGFua3MuCgoKLS0gClBldHJp
IExhdHZhbGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
