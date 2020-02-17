Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5696E15B
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 14:13:06 +0000 (UTC)
Date: Mon, 17 Feb 2020 16:13:04 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200217141304.GM25209@platvala-desk.ger.corp.intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
 <20200212132313.108855-1-arkadiusz.hiler@intel.com>
 <20200214121958.GC25209@platvala-desk.ger.corp.intel.com>
 <20200217134504.u2fdtbuynjiimhvw@ahiler-desk1.fi.intel.com>
 <20200217140048.GL25209@platvala-desk.ger.corp.intel.com>
 <20200217141101.cqvflpzw2epmhq5v@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217141101.cqvflpzw2epmhq5v@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/9] lib/chamelium: Make it clear that
 function asserts
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMDQ6MTE6MDFQTSArMDIwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDA0OjAwOjQ4UE0gKzAyMDAsIFBldHJp
IExhdHZhbGEgd3JvdGU6Cj4gPiBPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAwMzo0NTowNFBNICsw
MjAwLCBBcmthZGl1c3ogSGlsZXIgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgRmViIDE0LCAyMDIwIGF0
IDAyOjE5OjU4UE0gKzAyMDAsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBG
ZWIgMTIsIDIwMjAgYXQgMDM6MjM6MTNQTSArMDIwMCwgQXJrYWRpdXN6IEhpbGVyIHdyb3RlOgo+
ID4gPiA+ID4gY2hhbWVsaXVtX3dhaXRfcmVhY2hhYmxlKCkgaXMgYXNzZXJ0aW5nIGludGVybmFs
bHkgaWYgdGhlIGNoYW1lbGl1bSBub3QKPiA+ID4gPiA+IHJlYWNoYWJsZS4gTGV0J3MgbWFrZSBp
dCByZXR1cm4gYm9vbCBpbnN0ZWFkIGFuZCBjcmVhdGUKPiA+ID4gPiA+IHZvaWQgY2hhbWVsaXVt
X2Fzc2VydF9yZWFjaGFibGUoKSB0aGF0IGZhaWxzIHRoZSBydW4uCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVs
LmNvbT4KPiA+ID4gPiAKPiA+ID4gPiBSZXZpZXdlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmku
bGF0dmFsYUBpbnRlbC5jb20+Cj4gPiA+ID4gCj4gPiA+ID4gQXNpZGUsIENoYW1lbGl1bSBzdHVm
ZiBpcyBkb2N1bWVudGVkIGluIGEgLnR4dCBidXQgYXJlIHRoZXJlIGRvY3MgZm9yCj4gPiA+ID4g
dGhlIGxpYi9pZ3RfY2hhbWVsaXVtIGZ1bmN0aW9ucyBhbnl3aGVyZT8KPiA+ID4gCj4gPiA+IGh0
dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9v
bHMtQ2hhbWVsaXVtLmh0bWwgPwo+ID4gCj4gPiAvbWUgYmxpbmQKPiA+IAo+ID4gSSBnb3QgY29u
ZnV6IGJ5IHRoZSBwYXRjaCBjb250ZXh0IG5vdCBoYXZpbmcgZG9jdW1lbnRhdGlvbiBjb21tZW50
cwo+ID4gdmlzaWJsZS4gQW5kIHNwZWFraW5nIG9mLCBkb2NzIGZvciBjaGFtZWxpdW1fd2FpdF9y
ZWFjaGFibGUgcGxzPwo+IAo+IOKGk+KGk+KGkyBidWVubyBlbm91Z2g/CgpHb29kLCBnb29kLiBS
LWIgc3RhbmRzIGlmIHlvdSBzcXVhc2ggdGhpcyBpbi4KCgotLSAKUGV0cmkgTGF0dmFsYQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
