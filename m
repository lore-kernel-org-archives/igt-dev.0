Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E92B6E0B5
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 12:35:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <155248042775.30003.13353197120871486151@skylake-alporthouse-com>
References: <20190313120641.7350-1-petri.latvala@intel.com>
 <20190313120641.7350-3-petri.latvala@intel.com>
 <155248042775.30003.13353197120871486151@skylake-alporthouse-com>
Message-ID: <155248049580.30003.3090724109518486637@skylake-alporthouse-com>
Date: Wed, 13 Mar 2019 12:34:55 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] gem_exec_latency: Initialize
 variance to zero
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDMtMTMgMTI6MzM6NDgpCj4gUXVvdGluZyBQZXRy
aSBMYXR2YWxhICgyMDE5LTAzLTEzIDEyOjA2OjQwKQo+ID4gSXQncyBqdXN0IGFkZGVkIHRvIGlu
IGEgbG9vcCBsYXRlciB3aXRob3V0IGFueSBpbml0aWFsaXphdGlvbiBvcgo+ID4gZGlyZWN0IGFz
c2lnbm1lbnQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxh
dHZhbGFAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19sYXRlbmN5
LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9leGVjX2xhdGVuY3kuYyBi
L3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfbGF0ZW5jeS5jCj4gPiBpbmRleCA2ZGQxOTFlYy4uMWIwMjJk
ZjUgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX2xhdGVuY3kuYwo+ID4gKysr
IGIvdGVzdHMvaTkxNS9nZW1fZXhlY19sYXRlbmN5LmMKPiA+IEBAIC01OTcsNyArNTk3LDcgQEAg
cnRob2dfbGF0ZW5jeV9vbl9yaW5nKGludCBmZCwgdW5zaWduZWQgaW50IGVuZ2luZSwgY29uc3Qg
Y2hhciAqbmFtZSwgdW5zaWduZWQgaW4KPiA+ICAgICAgICAgZm9yICh1bnNpZ25lZCBpbnQgY2hp
bGQgPSAwOyBjaGlsZCA8IG5lbmdpbmU7IGNoaWxkKyspIHsKPiA+ICAgICAgICAgICAgICAgICBz
dHJ1Y3QgcnRfcGt0IG5vcm1hbCA9IHJlc3VsdHNbTlBBU1MgKiBjaGlsZCArIDFdOwo+ID4gICAg
ICAgICAgICAgICAgIGlndF9zdGF0c190IHN0YXRzOwo+ID4gLSAgICAgICAgICAgICAgIGRvdWJs
ZSB2YXJpYW5jZTsKPiA+ICsgICAgICAgICAgICAgICBkb3VibGUgdmFyaWFuY2UgPSAwLjA7Cj4g
Cj4gSnVzdCA9IDA7IHdvdWxkIGRvLgoKSSB3b3VsZCBwdXNoIGl0IGRvd24gdG8ganVzdCBiZWZv
cmUgd2UgY29tcHV0ZSB2YXJpYW5jZSB0aG91Z2guCi1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
