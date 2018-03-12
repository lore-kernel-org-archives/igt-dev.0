Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CE06E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Mar 2018 13:09:32 +0000 (UTC)
References: <20180227085232.54025-1-maarten.lankhorst@linux.intel.com>
 <20180227085232.54025-4-maarten.lankhorst@linux.intel.com>
 <20180308085700.GA22044@ahiler-desk1.ger.corp.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <30541b86-24d8-02f7-1458-6c089bd5fd3f@linux.intel.com>
Date: Mon, 12 Mar 2018 14:09:30 +0100
MIME-Version: 1.0
In-Reply-To: <20180308085700.GA22044@ahiler-desk1.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/4] tests/kms_frontbuffer_tracking:
 Convert test to use igt_display, v3.
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

SGV5LAoKT3AgMDgtMDMtMTggb20gMDk6NTcgc2NocmVlZiBBcmthZGl1c3ogSGlsZXI6Cj4gT24g
VHVlLCBGZWIgMjcsIDIwMTggYXQgMDk6NTI6MzFBTSArMDEwMCwgTWFhcnRlbiBMYW5raG9yc3Qg
d3JvdGU6Cj4+IFN0cmFpZ2h0IGNvbnZlcnNpb24sIG5vIGJlaGF2aW9yYWwgY2hhbmdlcyB5ZXQu
Cj4+Cj4+IENoYW5nZXMgc2luY2UgdjE6Cj4+IC0gSGFuZGxlIDJ4IG91dHB1dHMgY29ycmVjdGx5
Lgo+PiBDaGFuZ2VzIHNpbmNlIHYyOgo+PiAtIFNldCBjb3JyZWN0IHBhcmFtZXRlcnMgaW4gc2V0
X21vZGVfZm9yX3BhcmFtcywgc28gYXRvbWljIGNvbW1pdCBmb3IKPj4gICAyeCBvdXRwdXRzIGRv
ZXNuJ3Qgc2NhbGUuCj4+IC0gRml4IGFjY2lkZW50YWwgc2NhbGluZyBpbiBzZXRfcHJpbV9wbGFu
ZV9mb3JfcGFyYW1zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENJIHJlc3VsdHMgYXJlIGNsZWFuIGZv
ciB0aGUgY29udmVyc2lvbiwgc286Cj4gUmV2aWV3ZWQtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJr
YWRpdXN6LmhpbGVyQGludGVsLmNvbT4KClRoYW5rcywgSSBwdXNoZWQgdGhlIGZpcnN0IDMgcGF0
Y2hlcy4KClBhdGNoIDQgbmVlZHMgc29tZSB1cHN0cmVhbSBmaXhlcyBmaXJzdC4gSSBjYW4gc3dp
dGNoIEZCQyBhdCBydW50aW1lIG5vdyB0aHJvdWdoIHRoZSBtb2R1bGUgcGFyYW1ldGVyLApmb2xs
b3dlZCBieSBhbiBhdG9taWMgY29tbWl0LiBCdXQgUFNSIG5lZWRzIGEgZGVidWdmcyBob29rIHNp
bWlsYXIgdG8gZHJycyB0byBzd2l0Y2ggaXQgYXQgcnVudGltZS4KCkl0J3MgbGlrZWx5IHRoZSBG
QkMgaXNzdWUgaXMgcmVhbCwgYW5kIGV4cG9zZWQgdGhyb3VnaCB0aGUgYWx0ZXJlZCB0aW1pbmcu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
