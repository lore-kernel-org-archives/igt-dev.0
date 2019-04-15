Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F989892A5
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2019 08:23:38 +0000 (UTC)
Date: Mon, 15 Apr 2019 11:23:35 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190415082335.GH22949@platvala-desk.ger.corp.intel.com>
References: <20190226102029.GE4038@platvala-desk.ger.corp.intel.com>
 <20190412133603.31320-1-sergii.romantsov@globallogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190412133603.31320-1-sergii.romantsov@globallogic.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] meson: missed dependency of liblzma
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
To: Sergii Romantsov <sergii.romantsov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMDQ6MzY6MDNQTSArMDMwMCwgU2VyZ2lpIFJvbWFudHNv
diB3cm90ZToKPiBGYWlsZWQgdG8gY29uZmlndXJlIGludGVsLWdwdS10b29scyB3aXRoIGVycm9y
Ogo+IAo+IAltZXNvbi5idWlsZDoxNTE6MDogRVJST1I6ICBDb3VsZCBub3QgZ2VuZXJhdGUgY2Fy
Z3MgZm9yIGxpYmR3Ogo+IAo+IGxpYmR3IGRlcGVuZHMgb24gbGlibHptYS4KPiBJbnN0YWxsYXRp
b24gb2YgbGlibHptYS1kZXYgZml4ZXMgaXNzdWUuCj4gQXQgbGVhc3QgaXQgaGFzIHRvIGJlIHBv
aW50ZWQgaW4gUmVhZG1lLgo+IAo+IHYyOiBqdXN0IHJlYWRtZSB1cGRhdGVkCj4gCj4gQ2M6IFBl
dHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENDOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFNlcmdpaSBSb21hbnRzb3YgPHNlcmdpaS5yb21hbnRzb3ZAZ2xvYmFsbG9naWMuY29tPgoKUmV2
aWV3ZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgoKCj4gLS0t
Cj4gIFJFQURNRS5tZCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvUkVBRE1FLm1kIGIvUkVBRE1FLm1kCj4gaW5kZXggMmQ1ODMwOTUuLjdi
YWNlMDAyIDEwMDY0NAo+IC0tLSBhL1JFQURNRS5tZAo+ICsrKyBiL1JFQURNRS5tZAo+IEBAIC0x
NTcsNiArMTU3LDcgQEAgdGhlIGRlZmF1bHQgY29uZmlndXJhdGlvbiAocGFja2FnZSBuYW1lcyBt
YXkgdmFyeSk6Cj4gIAlsaWJwY2lhY2Nlc3MtZGV2Cj4gIAlsaWJwcm9jcHMtZGV2Cj4gIAlsaWJ1
bndpbmQtZGV2Cj4gKwlsaWJsem1hLWRldgo+ICAJbGliZHctZGV2Cj4gIAlweXRob24tZG9jdXRp
bHMKPiAgCXgxMXByb3RvLWRyaTItZGV2Cj4gLS0gCj4gMi4xNy4xCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlz
dAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
