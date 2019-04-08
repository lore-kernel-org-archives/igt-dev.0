Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B77890AD
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 20:49:27 +0000 (UTC)
Date: Mon, 8 Apr 2019 23:48:59 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20190408204859.GC21909@ideak-desk.fi.intel.com>
References: <20190405225549.7306-1-manasi.d.navare@intel.com>
 <20190408120805.GC4786@ideak-desk.fi.intel.com>
 <20190408190636.GA23276@intel.com>
 <20190408203927.GA21909@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190408203927.GA21909@ideak-desk.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_dp_dsc: Force a full
 modeset when we force dsc enable
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

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMTE6Mzk6MjdQTSArMDMwMCwgSW1yZSBEZWFrIHdyb3Rl
Ogo+IE9uIE1vbiwgQXByIDA4LCAyMDE5IGF0IDEyOjA2OjM3UE0gLTA3MDAsIE1hbmFzaSBOYXZh
cmUgd3JvdGU6Cj4gPiBPbiBNb24sIEFwciAwOCwgMjAxOSBhdCAwMzowODowNVBNICswMzAwLCBJ
bXJlIERlYWsgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgQXByIDA1LCAyMDE5IGF0IDAzOjU1OjQ5UE0g
LTA3MDAsIE1hbmFzaSBOYXZhcmUgd3JvdGU6Cj4gPiA+ID4gRFNDIGVuYWJsZSBnZXRzIGNvbmZp
Z3VyZWQgZHVyaW5nIGNvbXB1dGVfY29uZmlnIGFuZCBuZWVkcwo+ID4gPiA+IGEgZnVsbCBtb2Rl
c2V0IHRvIGZvcmNlIERTQy4KPiA+ID4gPiBTb21ldGltZXMgaW4gYmV0d2VlbiB0aGUgdGVzdHMs
IGlmIHRoZSBpbml0aWFsIG91dHB1dCBpcyBzYW1lIGFzIHRoZQo+ID4gPiA+IG1vZGUgYmVpbmcg
c2V0IGZvciBEU0MgdGhlbiBpdCB3aWxsIG5vdCBkbyBhIGZ1bGwgbW9kZXNldC4KPiA+ID4gPiBT
byB3ZSBkaXNhYmxlIHRoZSBvdXRwdXQgYmVmb3JlIGZvcmNpbmcgYSBtb2RlIHdpdGggRFNDIGVu
YWJsZS4KPiA+ID4gPiAKPiA+ID4gPiBZb3UgbmVlZCB0aGUga2VybmVsIHBhdGNoOgo+ID4gPiA+
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTkwODQvCj4gPiA+ID4g
Cj4gPiA+ID4gdjI6Cj4gPiA+ID4gKiBSZXN0b3JlIHRoZSB2YWx1ZSBvZiBmb3JjZSBkc2MgZW5h
YmxlIGFmdGVyIHRoZSB0ZXN0IGFuZCBpbiBpZ3RfZXhpdF9oYW5kbGVyCj4gPiA+ID4gKiBBZGQg
aWd0X2luc3RhbGxfZXhpdF9oYW5kbGVyIHRvIHJlc3RvcmUgdmFsdWVzIG9uIGZhaWwvZXhpdAoK
QWxzbywgcGxlYXNlIHNwbGl0IHRoZSBmaXggcmVzdG9yaW5nIGZvcmNlX2RzY19lbiBpbnRvIGEg
c2VwYXJhdGUgcGF0Y2guIAoKLS1JbXJlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
