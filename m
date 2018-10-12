Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856AA89C55
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Oct 2018 13:06:13 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g32-v6so11392827edg.13
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Oct 2018 06:06:13 -0700 (PDT)
Date: Fri, 12 Oct 2018 15:06:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181012130609.GP31561@phenom.ffwll.local>
References: <20181012102947.32489-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181012102947.32489-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] runner: Fix results when there's
 warns and dmesg-warns
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTIsIDIwMTggYXQgMDE6Mjk6NDdQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBBZnRlciBzZXR0aW5nIHRoZSByZXN1bHQgb2JqZWN0IHRleHQsIHRoZSBzdHJpbmcg
cmV0cmlldmVkIGZyb20gdGhlCj4gb2xkIG9iamVjdCBpcyBpbnZhbGlkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENjOiBNYXJ0
aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IEFya2FkaXVzeiBI
aWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KPiAtLS0KPiAgcnVubmVyL3Jlc3VsdGdl
bi5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1n
aXQgYS9ydW5uZXIvcmVzdWx0Z2VuLmMgYi9ydW5uZXIvcmVzdWx0Z2VuLmMKPiBpbmRleCA5ZmM1
NGNkYy4uZWQ4YzkyNjYgMTAwNjQ0Cj4gLS0tIGEvcnVubmVyL3Jlc3VsdGdlbi5jCj4gKysrIGIv
cnVubmVyL3Jlc3VsdGdlbi5jCj4gQEAgLTgyOCw2ICs4MjgsNyBAQCBzdGF0aWMgdm9pZCBvdmVy
cmlkZV9yZXN1bHRfc2luZ2xlKHN0cnVjdCBqc29uX29iamVjdCAqb2JqKQo+ICAJaWYgKCFzdHJj
bXAocmVzdWx0LCAicGFzcyIpICYmCj4gIAkgICAgY291bnRfbGluZXMoZXJydGV4dCwgZXJydGV4
dCArIHN0cmxlbihlcnJ0ZXh0KSkgPiAyKSB7Cj4gIAkJc2V0X3Jlc3VsdChvYmosICJ3YXJuIik7
Cj4gKwkJcmVzdWx0ID0gIndhcm4iOwoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+CgpEbyB3ZSBoYXZlIHVuaXQgdGVzdHMgZm9yIHRoZSBydW5uZXIg
dGhhdCBhcmUgY2hlY2tlZCB3aGVuIHlvdSBkbyBtYWtlCmNoZWNrL25pbmphIHRlc3Q/CgpXb3Vs
ZCBiZSByZWFsbHkgbmljZSB0byBoYXZlIHRoYXQsIHNpbmNlIG9uIHRoZSBwaWdsaXQgc2lkZSBE
eWxhbiBtYWRlCnRoYXQgaGFwcGVuLiBBbmQgaWYgd2UgaGF2ZSB0aGF0IGFscmVhZHksIHdlIGRl
ZmluaXRlbHkgd2FudCBhIHVuaXQgdGVzdApmb3IgdGhpcyBzdHVmZiBoZXJlLgotRGFuaWVsCgo+
ICAJfQo+ICAKPiAgCWlmIChkbWVzZ3dhcm5zKSB7Cj4gLS0gCj4gMi4xOC4wCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxp
bmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2CgotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
