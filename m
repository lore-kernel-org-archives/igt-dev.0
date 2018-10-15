Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FF389DB9
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Oct 2018 14:14:51 +0000 (UTC)
References: <20181015134338.9109-1-maarten.lankhorst@linux.intel.com>
 <20181015135746.GA9144@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <a85c6388-fba2-197e-4759-75b660778a3b@linux.intel.com>
Date: Mon, 15 Oct 2018 16:14:49 +0200
MIME-Version: 1.0
In-Reply-To: <20181015135746.GA9144@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Do not
 skip on 4k displays.
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTUtMTAtMTggb20gMTU6NTcgc2NocmVlZiBWaWxsZSBTeXJqw6Rsw6Q6Cj4gT24gTW9uLCBP
Y3QgMTUsIDIwMTggYXQgMDM6NDM6MzhQTSArMDIwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6
Cj4+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+Cj4+IC0tLQo+PiAgdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5n
LmMgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIGIv
dGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKPj4gaW5kZXggOWFlY2I4MTUwMjRmLi5i
ZjRhNjhmZjJiZGUgMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2lu
Zy5jCj4+ICsrKyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCj4+IEBAIC0yNDYs
NyArMjQ2LDcgQEAgc3RydWN0IHsKPj4gIAkuc2hvd19oaWRkZW49IGZhbHNlLAo+PiAgCS5zdGVw
ID0gMCwKPj4gIAkub25seV9waXBlcyA9IFBJUEVfQ09VTlQsCj4+IC0JLnNoYXJlZF9mYl94X29m
ZnNldCA9IDUwMCwKPj4gKwkuc2hhcmVkX2ZiX3hfb2Zmc2V0ID0gMjQ4LAo+IENhbid0IHNlZSB3
aHkgNTAwIHdvdWxkIGJlIGluaGVyZW50bHkgYmV0dGVyIHRoYW4gMjQ4LiBBbHRob3VnaCBJIGhh
dmUKPiB0byB3b25kZXIgd2h5IDI0OCBpbnN0ZWFkIG9mIGVnLiAyNTYuIE1hZ2ljIG51bWJlcnMg
YXJlIGp1c3QgdGhhdC4KPgo+IFJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgpJJ20gZmluZSB3aXRoIDI1NiB0b28sIGp1c3Qgd2FudGVk
IHRvIGJlIGV2aWwgYW5kIG5vdCBtYWtlIGl0IGEgcG93ZXIgb2YgMi4KSnVzdCBidW1wIHRvIDI1
NiB0aGVuPyBFaXRoZXIgZml0cyBpbiAxNjM4NCBieXRlcy4uCgp+TWFhcnRlbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
