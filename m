Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DAF6E1B3
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Mar 2018 13:55:54 +0000 (UTC)
References: <20180323124828.4350-1-maarten.lankhorst@linux.intel.com>
 <20180323130325.GR5453@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ed968855-348e-abb7-29f9-644b007b7d99@linux.intel.com>
Date: Fri, 23 Mar 2018 14:55:51 +0100
MIME-Version: 1.0
In-Reply-To: <20180323130325.GR5453@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC incomplete PATCH i-g-t] lib/igt_kms: Reduce
 probing and allow initial hotplug during igt_display_init()
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
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Lyude <lyude@redhat.com>, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjMtMDMtMTggb20gMTQ6MDMgc2NocmVlZiBWaWxsZSBTeXJqw6Rsw6Q6Cj4gT24gRnJpLCBN
YXIgMjMsIDIwMTggYXQgMDE6NDg6MjhQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6
Cj4+IFdoZW4gYm9vdGluZyB3aXRoIGZiZGV2IGRpc2FibGVkLCBhbGwgb3V0cHV0cyBhcmUgc2V0
IHRvIFVOS05PV05DT05ORUNUSU9OLgo+PiBJbiB0aGlzIGNhc2Ugd2UgaGF2ZSB0byByZXByb2Jl
LCBidXQgaW4gYWxsIG90aGVycyB3ZSBjYW4gc2FmZWx5IGFzc3VtZSB0aGF0Cj4+IHRoZSBvdXRw
dXQgY29ubmVjdG9yIHN0YXR1cyBpcyB2YWxpZC4KPj4KPj4gRW51bWVyYXRlIGFsbCBvdXRwdXRz
LCBhbmQgZm9yIGdvb2QgbWVhc3VyZSByZWNoZWNrIGFmdGVyIHdlIHByb2JlZCwgdG8gYWRkCj4+
IGFuZCBEUC1NU1Qgd2UgbWF5IGhhdmUgbWlzc2VkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+PiBDYzog
THl1ZGUgPGx5dWRlQHJlZGhhdC5jb20+Cj4+IENjOiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGlu
YWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KPj4gLS0tCj4+IFVuZm9ydHVuYXRlbHkgd2UgbGFj
ayBhIHdheSB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUgcHJvYmluZyB3aWxsIGVudW1lcmF0ZQo+
PiBhZGRpdGlvbmFsIERQLU1TVCBkaXNwbGF5cywgc28gdGhlIG9ubHkgd2F5IHJpZ2h0IG5vdyB0
byB0ZXN0IERQLU1TVCB3b3VsZCBiZQo+PiB0byBhZGQgYSBzbGVlcCg1KSBpbiBpZ3RfZGlzcGxh
eV9jaGVja19ob3RwbHVnLgo+Pgo+PiBBbnkgdGhvdWdodHMgaG93IHdlIGNhbiBtYWtlIHRoaXMg
bW9yZSByZWxpYWJsZSBmb3IgRFAtTVNUPwo+IFdoZW4gZG8gd2UgZmlsbCBvdXQgdGhlIGRlYnVn
ZnMgbXN0IHRvcG9sb2d5IGluZm9ybWF0aW9uPwpJIGhhdmUgbm8gaWRlYS4uCgpkcm1fZHBfbXN0
X2xpbmtfcHJvYmVfd29yayBzZWVtcyB0byBiZSBjYWxsZWQgZnJvbSBpcnEsIEkgZG9uJ3QgdGhp
bmsgd2UgaW5pdGlhbGx5IGRvIGRpc2NvdmVyeSwgbWF5YmUgd2Ugc2hvdWxkLi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
