Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D136E33C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2018 17:11:10 +0000 (UTC)
References: <20180123125642.58698-1-maarten.lankhorst@linux.intel.com>
 <20180123125642.58698-2-maarten.lankhorst@linux.intel.com>
 <20180123155052.GM5453@intel.com>
 <2571d0ca-50c5-b630-0f2f-793e325d4cc9@linux.intel.com>
 <1516880581.2602.1.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <880b614d-4850-5968-82cc-a1101c0c6ccd@linux.intel.com>
Date: Mon, 29 Jan 2018 18:01:37 +0100
MIME-Version: 1.0
In-Reply-To: <1516880581.2602.1.camel@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] lib/igt_fb: Add igt_put_cairo_ctx
 as counter to igt_get_cairo_ctx
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
To: mika.kahola@intel.com, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjUtMDEtMTggb20gMTI6NDMgc2NocmVlZiBNaWthIEthaG9sYToKPiBPbiBXZWQsIDIwMTgt
MDEtMjQgYXQgMTM6MjYgKzAxMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+PiBIZXksCj4+
Cj4+IE9wIDIzLTAxLTE4IG9tIDE2OjUwIHNjaHJlZWYgVmlsbGUgU3lyasOkbMOkOgo+Pj4gT24g
VHVlLCBKYW4gMjMsIDIwMTggYXQgMDE6NTY6MzVQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9yc3Qg
d3JvdGU6Cj4+Pj4gVGhpcyB3aWxsIGFsbG93IHN1cHBvcnQgZm9yIE5WMTIgaW4gdGhlIGZ1dHVy
ZSwgd2hlcmUKPj4+PiBpZ3RfZ2V0X2NhaXJvX2N0eAo+Pj4+IHdpbGwgcmV0dXJuIGEgUkdCIGlt
YWdlIHRvIGRyYXcgd2l0aCwgd2hpY2ggd2lsbCBiZSBjb252ZXJ0ZWQgaW4KPj4+PiBpZ3RfcHV0
X2NhaXJvX2N0eCBzbyB0ZXN0cyBkb24ndCBoYXZlIHRvIGFkZCBzcGVjaWFsIHN1cHBvcnQgZm9y
Cj4+Pj4gTlYxMi4KPj4+IFdoeSBkbyB3ZSBuZWVkIGEgc3BlY2lhbCBmdW5jaXRvbj8gQXMgaW4s
IGNhbid0IHlvdSBqdXN0IGRvIGl0IHRoZQo+Pj4gc2FtZSBhcyB3ZSBoYW5kbGUgdGhlIGd0dCB2
cy4gYmxpdCBzdHVmZj8KPj4+Cj4+IFRoZSBjYWlyb19kZXN0cm95KCkgY2FsbCB3aWxsIGRvIHRo
ZSBhY3R1YWwgY29udmVyc2lvbiBiYWNrLCBidXQgd2l0aAo+PiB0aGlzIGhlbHBlciB3ZSBjYW4K
Pj4gYWN0dWFsbHkgY2hlY2sgdGhhdCBldmVyeSBjYWxsIHRvIGdldCgpIGlzIGZvbGxvd2VkIGJ5
IGEgcHV0KCkgYW5kCj4+IGVycm9ycyBhcmUgY29uc2lzdGVudGx5Cj4+IGNoZWNrZWQuIE5vdCBh
bGwgY2FsbGVycyBoYXZlIGJvdGgsIHNvIEkgZmVsdCBpdCBiZXR0ZXIgdG8gcHV0IGl0IGluCj4+
IHRoZSBjb3JlLi4KPiBGcm9tIHRoZSBuYW1pbmcgY29udmVudGlvbiBwb2ludCBvZiB2aWV3LCBJ
IHdvdWxkIHVzZSBzZXQoKSBpbnN0ZWFkIG9mCj4gcHV0KCkgYXMgd2UgaGF2ZSBhIGdldCgpIGFz
IGNvdW50ZXJwYXJ0LgpMb3Qgb2YgcGxhY2VzIHVzaW5nIGdldCgpIHRvIGFjcXVpcmUgYSByZWYs
IHB1dCgpIHRvIHJlbGVhc2UgaXQuIFNvIEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UuLgoKfk1hYXJ0
ZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
