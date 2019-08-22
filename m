Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA906EA67
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2019 07:33:47 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <cd7d5ae437e5ffcff9ac929a033468ba20b2effd.camel@intel.com>
References: <20190821130928.29640-1-jani.nikula@intel.com>
 <cd7d5ae437e5ffcff9ac929a033468ba20b2effd.camel@intel.com>
Date: Thu, 22 Aug 2019 10:33:44 +0300
Message-ID: <8736htejs7.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_reg: fix use-after-free bug
 in register spec read
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
To: "Ser, Simon" <simon.ser@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMSBBdWcgMjAxOSwgIlNlciwgU2ltb24iIDxzaW1vbi5zZXJAaW50ZWwuY29tPiB3
cm90ZToKPiBPbiBXZWQsIDIwMTktMDgtMjEgYXQgMTY6MDkgKzAzMDAsIEphbmkgTmlrdWxhIHdy
b3RlOgo+PiBlIHBvaW50cyBpbnRvIHRoZSBidWZmZXIgcG9pbnRlciB0byBieSBwLgo+Cj4gVHlw
bzogcG9pbnRlZAoKV2hvb3BzLiBGaXhlZCB3aGlsZSBhcHBseWluZywgdGhhbmtzIGZvciB0aGUg
cmV2aWV3LgoKQlIsCkphbmkuCgoKPgo+PiAKPj4gRml4ZXM6IGRmZGEwYjZhZWNjZSAoImludGVs
X3JlZzogaW50cm9kdWNlIG9uZSBpbnRlbF9yZWcgdG9vbCB0byBydWxlIHRoZW0gYWxsIikKPj4g
U2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPgo+IFJl
dmlld2VkLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+Cj4KPj4gLS0tCj4+ICB0
b29scy9pbnRlbF9yZWdfc3BlYy5jIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvaW50ZWxfcmVn
X3NwZWMuYyBiL3Rvb2xzL2ludGVsX3JlZ19zcGVjLmMKPj4gaW5kZXggMGRmNjliNjg4NGRlLi41
YWI1NmVjMWEzMWYgMTAwNjQ0Cj4+IC0tLSBhL3Rvb2xzL2ludGVsX3JlZ19zcGVjLmMKPj4gKysr
IGIvdG9vbHMvaW50ZWxfcmVnX3NwZWMuYwo+PiBAQCAtMjMzLDkgKzIzMyw5IEBAIHN0YXRpYyBp
bnQgcGFyc2VfbGluZShzdHJ1Y3QgcmVnICpyZWcsIGNvbnN0IGNoYXIgKmxpbmUpCj4+ICAJCQly
ZWctPm5hbWUgPSBwOwo+PiAgCQl9IGVsc2UgaWYgKGkgPT0gMikgewo+PiAgCQkJcmVnLT5hZGRy
ID0gc3RydG91bChwLCAmZSwgMTYpOwo+PiAtCQkJZnJlZShwKTsKPj4gIAkJCWlmICgqZSkKPj4g
IAkJCQlyZXQgPSAtMTsKPj4gKwkJCWZyZWUocCk7Cj4+ICAJCX0gZWxzZSBpZiAoaSA9PSAzKSB7
Cj4+ICAJCQlyZXQgPSBwYXJzZV9wb3J0X2Rlc2MocmVnLCBwKTsKPj4gIAkJCWZyZWUocCk7Cgot
LSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
