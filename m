Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596476E60E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Aug 2018 03:17:57 +0000 (UTC)
Message-ID: <c1153aa1ffca54365d2c9f5a49aeda5ab35e084a.camel@intel.com>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Thu, 23 Aug 2018 20:17:54 -0700
In-Reply-To: <20180719150415.935-5-ville.syrjala@linux.intel.com>
References: <20180719150415.935-1-ville.syrjala@linux.intel.com>
 <20180719150415.935-5-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 05/25] tests/gem_render_copy: Fix
 clipped height
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiBUaHUsIDIwMTgtMDctMTkgYXQgMTg6MDMgKzAzMDAsIFZpbGxlIFN5cmphbGEgd3JvdGU6
Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
PiAKPiBBc3NpZ24gdGhlIGNsaXBwZWQgaGVpZ2h0IHRvICdoJywgbm90ICd3Jy4gVGhpcyBkaWRu
J3QgY2F1c2UgYW55Cj4gcHJvYmxlbXMgc28gZmFyIGJlY2F1c2Ugd2UgdXNlIHNxdWFyZSBidWZm
ZXJzLgo+IAo+IEFsc28gZ2V0IHJpZCBvZiB0aGUgZ2NjIHZhcmlhYmxlIHNoYWRvd2luZyB3YXJu
aW5ncyBieSBub3QgbmVzdGluZwo+IHRoZQo+IG1pbigpL21heCgpLgo+IApSZXZpZXdlZC1ieTog
RGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+Cgo+IEZp
eGVzOiBhYWEyM2VmZjIxYTEgKCJ0ZXN0cy9nZW1fcmVuZGVyX2NvcHk6IFVzZSBhIG1vcmUgZWxh
Ym9yYXRlCj4gcGF0dGVybiBvZiBwaXhlbHMiKQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2dlbV9y
ZW5kZXJfY29weS5jIHwgNyArKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2dlbV9yZW5kZXJfY29w
eS5jIGIvdGVzdHMvZ2VtX3JlbmRlcl9jb3B5LmMKPiBpbmRleCAyMzhlNzBlOTdiNWQuLjEzNTM3
NWE5MGVjMiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9nZW1fcmVuZGVyX2NvcHkuYwo+ICsrKyBiL3Rl
c3RzL2dlbV9yZW5kZXJfY29weS5jCj4gQEAgLTI1NCw4ICsyNTQsMTEgQEAgc2NyYXRjaF9idWZf
Y29weShkYXRhX3QgKmRhdGEsCj4gIAlsaW5lYXJfc3JjID0gZ2VtX21tYXBfX2d0dChkYXRhLT5k
cm1fZmQsIHNyYy0+Ym8tPmhhbmRsZSwKPiAgCQkJCSAgIHNyYy0+Ym8tPnNpemUsIFBST1RfUkVB
RCk7Cj4gIAo+IC0JdyA9IG1pbih3LCBtaW4od2lkdGggLSBzeCwgd2lkdGggLSBkeCkpOwo+IC0J
dyA9IG1pbihoLCBtaW4oaGVpZ2h0IC0gc3ksIGhlaWdodCAtIGR5KSk7Cj4gKwl3ID0gbWluKHcs
IHdpZHRoIC0gc3gpOwo+ICsJdyA9IG1pbih3LCB3aWR0aCAtIGR4KTsKPiArCj4gKwloID0gbWlu
KGgsIGhlaWdodCAtIHN5KTsKPiArCWggPSBtaW4oaCwgaGVpZ2h0IC0gZHkpOwo+ICAKPiAgCWZv
ciAoaW50IHkgPSAwOyB5IDwgaDsgeSsrKSB7Cj4gIAkJaWd0X21lbWNweV9mcm9tX3djKCZsaW5l
YXJfZHN0WyhkeSt5KSAqIHdpZHRoICsgZHhdLApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
