Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490076E4F2
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 21:42:57 +0000 (UTC)
Date: Thu, 4 Apr 2019 00:42:33 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20190403214233.GA21640@ideak-desk.fi.intel.com>
References: <20190402193119.27721-1-manasi.d.navare@intel.com>
 <20190403132510.GA20669@ideak-desk.fi.intel.com>
 <20190403182058.GA17236@intel.com>
 <20190403193341.GA20770@ideak-desk.fi.intel.com>
 <20190403201717.GE17236@intel.com>
 <20190403203405.GA21185@ideak-desk.fi.intel.com>
 <20190403204944.GF17236@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190403204944.GF17236@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_dsc: Force a full modeset
 when we force dsc enable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Manasi Navare <manasi.d.navare@intel.com>
Cc: igt-dev@lists.freedesktop.org, Anusha Srivatsa <anusha.srivatsa@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMDMsIDIwMTkgYXQgMDE6NDk6NDRQTSAtMDcwMCwgTWFuYXNpIE5hdmFyZSB3
cm90ZToKPiBbLi4uXQo+IEN1cnJlbnRseSB3ZSBoYXZlIGluaCBpOTE1X2RzY19mZWNfc3VwcG9y
dF9zaG93Ogo+IERTQ19lbmFibGVkOgo+IERTQ19zaW5rX3N1cHBvcnQ6Cj4gRkVDX3Npbmtfc3Vw
cG9ydDoKClllcywgYW5kIGFmdGVyIHRoZSBrZXJuZWwgY2hhbmdlIHlvdSdsbCBoYXZlIGFuIGFk
ZGl0aW9uYWwKICAKICBGb3JjZSBEU0MgZW5hYmxlOiB5ZXMvbm8KCmxpbmUgaGVyZS4KCj4gQW5k
IHRoaXMgbm9kZSB3ZSBvcGVuIGFzIGEgcmVhZCBvbmx5IGZpcnN0IGFuZCB0aGVuIGFzIHdyaXRl
IG5vZGUgYW5kCj4gZm9yY2VfZHNjX2VuYWJsZSgpIGZyb20gSUdUIGp1c3Qgd3JpdGVzIGEgMSB0
byB0aGlzLCBzbyB5b3UgYXJlIHNheWluZwo+IHRoYXQgaW4gdGhlIGtlcm5lbCBfd3JpdGUoKSBu
b2RlLCBJIGFjY2VwdCB0aGlzIGFuZCB3cml0ZSB0bwo+IGZvcmNlX2RzY19lbmFibGUgZW50cnkg
aW4gdGhpcyBmaWxlIGluc3RlYWQgb2YgcmV3cml0aW5nIHRoZSB3aG9sZQo+IGZpbGU/CgpJJ20g
bm90IHN1cmUgd2hhdCB5b3UgbWVhbi4gQ3VycmVudGx5ICIxIiBvciAiMCIgaXMgd3JpdHRlbiB0
byB0aGUKZGVidWdmcyBmaWxlIHdoaWNoIHdpbGwgc2V0IGludGVsX2RwLT5mb3JjZV9kc2NfZW5h
YmxlLiBUaGlzIGRvZXNuJ3QKbmVlZCB0byBiZSBjaGFuZ2VkIGF0IGFsbCwgbm8gbmVlZCB0byBy
ZXdyaXRlIHRoZSB3aG9sZSBmaWxlLgoKPiBTbyBpbiBJR1QgYWxzbyBJIHdpbGwgaGF2ZSB0byBw
YXJzZSB0aGUgZmlsZSBhbmQgd3JpdGUgMSBmb3IKPiBmb3JjZV9kc2NfZW5hYmxlIGVudHJ5PwoK
WW91IGNhbiBnZXQgdGhlIG9yaWdpbmFsIHZhbHVlIG9mIGl0IHNpbWlsYXJseSB0byBob3cgaXQn
cyBkb25lIGFscmVhZHkKZm9yICdEU0NfU2lua19TdXBwb3J0JywgYnkgcmVhZGluZyB0aGUgZmls
ZSBhbmQgZG9pbmcKCglzdHJzdHIoYnVmLCAiRm9yY2UgRFNDIGVuYWJsZTogeWVzIik7CgpvbiB0
aGUgY29udGVudC4KCj4gSSBzdGlsbCBjYW50IGZpZ3VyZSBvdXQgaG93IHRoZSByZXN0b3JlKCkg
ZnVuY3Rpb24gd29yaywgd2Ugd3JpdGUgdGhlCj4gc3RvcmVkX3ZhbHVlcyBhbmQgd3JpdGUgZm9y
IGVhY2ggb2YgdGhlIGVudHJpZXMgaW4gdGhlIGZpbGU/IEFuZCB0aGVuCj4gaW4gdGhlIGtlcm5l
bCBkZWJ1Z2ZzX3dyaXRlLCBnZXQgdGhlc2UgYW5kIHdyaXRlIGJhY2sgdG8gZWFjaCBlbnRyeT8K
Ck9ubHkgZm9yY2VfZHNjX2VuYWJsZSBuZWVkIHRvIGJlIHJlc3RvcmVkLCB0aGUgb25seSB2YWx1
ZSB0aGF0IHlvdQpjaGFuZ2UgYnkgd3JpdGluZyB0byB0aGUgZGVidWdmcyBmaWxlLiBBbGwgdGhl
IHJlc3QgYXJlIGNhbGN1bGF0ZWQKdmFsdWVzIHRoYXQgeW91IGRvbid0IG5lZWQgdG8gY2FyZSBh
Ym91dC4KCi0tSW1yZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
