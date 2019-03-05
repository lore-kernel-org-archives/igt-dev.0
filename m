Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9D789AEB
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2019 12:55:04 +0000 (UTC)
Date: Tue, 5 Mar 2019 14:55:01 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190305125501.GI4038@platvala-desk.ger.corp.intel.com>
References: <20190207133652.5346-1-petri.latvala@intel.com>
 <20190207140212.GH20097@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190207140212.GH20097@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Fix comparison of
 unsigned integers
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
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBGZWIgMDcsIDIwMTkgYXQgMDQ6MDI6MTJQTSArMDIwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIFRodSwgRmViIDA3LCAyMDE5IGF0IDAzOjM2OjUyUE0gKzAyMDAsIFBldHJp
IExhdHZhbGEgd3JvdGU6Cj4gPiBEaWZmZXJlbmNlIG9mIHVuc2lnbmVkIGludHMgaXMgdW5zaWdu
ZWQgaW50LCBhbmQgdGhlcmVmb3JlIGFsd2F5cwo+ID4gbGFyZ2VyIHRoYW4gemVyby4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+
Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IC0tLQo+
ID4gIHRlc3RzL2ttc19mbGlwLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZmxp
cC5jIGIvdGVzdHMva21zX2ZsaXAuYwo+ID4gaW5kZXggNzk4ZmM0ZTguLjk2ZjRhMmY3IDEwMDc1
NQo+ID4gLS0tIGEvdGVzdHMva21zX2ZsaXAuYwo+ID4gKysrIGIvdGVzdHMva21zX2ZsaXAuYwo+
ID4gQEAgLTUwMiw3ICs1MDIsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19zdGF0ZShjb25zdCBzdHJ1
Y3QgdGVzdF9vdXRwdXQgKm8sIGNvbnN0IHN0cnVjdCBldmVudF9zdGF0ZSAqZQo+ID4gIAlpZiAo
by0+ZmxhZ3MgJiBURVNUX1RTX0NPTlQpIHsKPiA+ICAJCS8qIElnbm9yZSBzZXFfc3RlcCBoZXJl
IHNpbmNlIHZibGFuayB3YWl0cyB0aW1lIG91dCBpbW1lZGlhdGVseQo+ID4gIAkJICogd2hlbiB3
ZSBraWxsIHRoZSBjcnRjLiAqLwo+ID4gLQkJaWd0X2Fzc2VydF9mKGVzLT5jdXJyZW50X3NlcSAt
IGVzLT5sYXN0X3NlcSA+PSAwLAo+ID4gKwkJaWd0X2Fzc2VydF9mKGVzLT5jdXJyZW50X3NlcSA+
PSBlcy0+bGFzdF9zZXEsCj4gCj4gVGhhdCB3b24ndCBoYW5kbGUgd3JhcGFyb3VuZC4KCkFyZSB5
b3UgcmVmZXJyaW5nIHRvIHNvbWV0aGluZyBvdGhlciB0aGFuIHRoZSBjaGVja2VkIG92ZXJmbG93
PyBPciBpbgpvdGhlciB3b3JkcywgYXJlIHlvdSBvYmplY3RpbmcgdG8gdGhpcyBwYXRjaD8KCgot
LSAKUGV0cmkgTGF0dmFsYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
