Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A0A6E34C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2019 10:52:31 +0000 (UTC)
Date: Tue, 15 Oct 2019 13:52:29 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20191015105229.GN4019@platvala-desk.ger.corp.intel.com>
References: <1570993695-3208-1-git-send-email-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570993695-3208-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/sw_sync: fix gcc warning
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gU3VuLCBPY3QgMTMsIDIwMTkgYXQgMTA6MDg6MTVQTSArMDMwMCwgSnVoYS1QZWtrYSBIZWlr
a2lsYSB3cm90ZToKPiBjYXN0aW5nIHZvaWQgcG9pbnRlciB0byBpbnQgcG9pbnRlciBjYXVzZXMg
Z2NjIHRvIGJlIHVuaGFweSB3aXRoIGNvbW1lbnQ6Cj4gIndhcm5pbmc6IGRlcmVmZXJlbmNpbmcg
dHlwZS1wdW5uZWQgcG9pbnRlciB3aWxsIGJyZWFrIHN0cmljdC1hbGlhc2luZyAKPiBydWxlcyIK
Ck1ha2UgdGhhdCAiY2FzdGluZyB1bnNpZ25lZCBjaGFyIHBvaW50ZXIgdG8gaW50IHBvaW50ZXIi
LgoKSWYgaXQgaGFkIGJlZW4gdm9pZCogaXQgd291bGQgaGF2ZSBiZWVuIGZpbmUuCgoKUmV2aWV3
ZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgoKCgo+IAo+IGNo
YW5nZToKPiAqKChpbnQgKikgQ01TR19EQVRBKGNtc2cpKSA9IHRpbWVsaW5lOwo+IHRvOgo+IG1l
bWNweShDTVNHX0RBVEEoY21zZyksICZ0aW1lbGluZSwgc2l6ZW9mKHRpbWVsaW5lKSk7Cj4gCj4g
c28gZXZlcnl0aW5nIGlzIG5pY2VseSBkZWZpbmVkIGZvciBjb21waWxlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29t
Pgo+IC0tLQo+ICB0ZXN0cy9zd19zeW5jLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9zd19zeW5j
LmMgYi90ZXN0cy9zd19zeW5jLmMKPiBpbmRleCA2MmQxZDE3Li42MjZiNmQzIDEwMDY0NAo+IC0t
LSBhL3Rlc3RzL3N3X3N5bmMuYwo+ICsrKyBiL3Rlc3RzL3N3X3N5bmMuYwo+IEBAIC0yMjgsNyAr
MjI4LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9zeW5jX2J1c3lfZm9ya191bml4c29ja2V0KHZvaWQp
Cj4gIAkJY21zZy0+Y21zZ190eXBlID0gU0NNX1JJR0hUUzsKPiAgCQljbXNnLT5jbXNnX2xlbiA9
IENNU0dfTEVOKHNpemVvZih0aW1lbGluZSkpOwo+ICAKPiAtCQkqKChpbnQgKikgQ01TR19EQVRB
KGNtc2cpKSA9IHRpbWVsaW5lOwo+ICsJCW1lbWNweShDTVNHX0RBVEEoY21zZyksICZ0aW1lbGlu
ZSwgc2l6ZW9mKHRpbWVsaW5lKSk7Cj4gIAkJbXNnLm1zZ19jb250cm9sbGVuID0gY21zZy0+Y21z
Z19sZW47Cj4gIAo+ICAJCWlndF9hc3NlcnRfZihzeW5jX2ZlbmNlX3dhaXQoZmVuY2UsIDApID09
IC1FVElNRSwKPiAtLSAKPiAyLjcuNAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
