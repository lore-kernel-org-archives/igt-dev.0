Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08726E4E9
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Dec 2018 00:16:30 +0000 (UTC)
Message-ID: <6ce3aaad562f8e3242dc7921de4baeab1f3f98ad.camel@intel.com>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 11 Dec 2018 16:16:26 -0800
In-Reply-To: <20181204230944.7753-4-jose.souza@intel.com>
References: <20181204230944.7753-1-jose.souza@intel.com>
 <20181204230944.7753-4-jose.souza@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/8] lib/psr: Make psr_active() only
 cares about PSR1
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: dhinakaran.pandiyan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE4LTEyLTA0IGF0IDE1OjA5IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOgo+IFBTUjIgd2lsbCBoYXZlIGl0IG93biBmdW5jdGlvbiB0byBkZXRlY3QgaWYgaXMg
YWN0aXZlIHNvIHdlIGNhbiBkcm9wCj4gdGhlIHNsZWVwIHN0YXRlIHNlYXJjaCBhbmQgYWxzbyB0
byBtYWtlIHN1cmUgdGhhdCBQU1IxIGlzIGFjdGl2ZSBsZXRzCj4gc2VhcmNoIGZvciAiUFNSMSBl
bmFibGVkIi4KCkhvdyBkbyB5b3UgcGxhbiB0byBoYW5kbGUgUFNSMiBpbiBrbXNfZnJvbnRidWZm
ZXJfdHJhY2tpbmcgb3IKZmJ0X2ZiY29uPyBIYXZlIG5ldyBQU1IyIHN1YiB0ZXN0cyBmb3IgdGhl
bT8KCgpXb3VsZCBpdCBiZSBiZXR0ZXIgdG8gaGF2ZSBzb21lIHNvcnQgb2YgUFNSIHN0YXRlIG1h
aW50YWluZWQgaW4gdGhlIHBzcgpsaWJyYXJ5IHNvIHRoYXQgdGhlIGZ1bmN0aW9ucyBrbm93IHdo
ZXRoZXIgdG8gdGVzdCBmb3IgUFNSMSBvciBQU1IyPwoKPiAKPiBDYzogUm9kcmlnbyBWaXZpIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+IENjOiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWth
cmFuLnBhbmRpeWFuQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lndF9wc3IuYyB8IDMg
KystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMKPiBpbmRleCBlZWNl
ZTQ1OS4uYzZkNjM5MGYgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9wc3IuYwo+ICsrKyBiL2xpYi9p
Z3RfcHNyLmMKPiBAQCAtMzcsNyArMzcsOCBAQCBzdGF0aWMgYm9vbCBwc3JfYWN0aXZlKGludCBk
ZWJ1Z2ZzX2ZkLCBib29sCj4gY2hlY2tfYWN0aXZlKQo+ICAKPiAgCWFjdGl2ZSA9IHN0cnN0cihi
dWYsICJIVyBFbmFibGVkICYgQWN0aXZlIGJpdDogeWVzXG4iKSB8fAo+ICAJCSBzdHJzdHIoYnVm
LCAiU291cmNlIFBTUiBjdGw6IGVuYWJsZWQiKTsKPiAtCWFjdGl2ZSAmPSAhIShzdHJzdHIoYnVm
LCAiU1JERU5UIikgfHwgc3Ryc3RyKGJ1ZiwgIlNMRUVQIikpOwo+ICsJYWN0aXZlICY9ICEhc3Ry
c3RyKGJ1ZiwgIlNSREVOVCIpOwo+ICsJYWN0aXZlICY9ICEhc3Ryc3RyKGJ1ZiwgIlN0YXR1czog
UFNSMSBlbmFibGVkIik7Cj4gIAlyZXR1cm4gY2hlY2tfYWN0aXZlID8gYWN0aXZlIDogIWFjdGl2
ZTsKPiAgfQo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
