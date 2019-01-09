Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3336EC58
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jan 2019 12:40:11 +0000 (UTC)
References: <20190109122829.713-1-petri.latvala@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <78e9048f-f138-1bc1-3235-d881eaafe682@linux.intel.com>
Date: Wed, 9 Jan 2019 13:40:08 +0100
MIME-Version: 1.0
In-Reply-To: <20190109122829.713-1-petri.latvala@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/fb: Fix rgb24 to nv12 conversion
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
Cc: Martin Liska <mliska@suse.cz>
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDktMDEtMjAxOSBvbSAxMzoyOCBzY2hyZWVmIFBldHJpIExhdHZhbGE6Cj4gQSB0eXBvIGZp
eCBpbiAxeDIgcGl4ZWwgYmxvY2sgY29udmVyc2lvbiBjb2RlLCByZXZlYWxlZCBieSBHQ0MgOQo+
Cj4gRml4ZXM6IDFjN2VmMzg5MDA0NSAoImxpYjogVXNlIGlndF9tYXRyaXggZm9yIHljYmNyPC0+
cmdiIGNvbnZlcnNpb24iKQo+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3Jn
L3Nob3dfYnVnLmNnaT9pZD0xMDkyNTcKPiBSZXBvcnRlZC1ieTogTWFydGluIExpc2thIDxtbGlz
a2FAc3VzZS5jej4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxh
QGludGVsLmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lndF9mYi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvaWd0
X2ZiLmMgYi9saWIvaWd0X2ZiLmMKPiBpbmRleCA4MjQ0ZTUxNy4uNWNkMTgyOWEgMTAwNjQ0Cj4g
LS0tIGEvbGliL2lndF9mYi5jCj4gKysrIGIvbGliL2lndF9mYi5jCj4gQEAgLTE3NzksNyArMTc3
OSw3IEBAIHN0YXRpYyB2b2lkIGNvbnZlcnRfcmdiMjRfdG9fbnYxMihzdHJ1Y3QgZmJfY29udmVy
dCAqY3Z0KQo+ICAJCQlzdHJ1Y3QgaWd0X3ZlYzQgeXV2WzJdOwo+ICAKPiAgCQkJcmVhZF9yZ2Io
JnJnYlswXSwgJnJnYjI0W2ogKiA4ICsgMF0pOwo+IC0JCQlyZWFkX3JnYigmcmdiWzJdLCAmcmdi
MjRbaiAqIDggKyAwICsgcmdiMjRfc3RyaWRlXSk7Cj4gKwkJCXJlYWRfcmdiKCZyZ2JbMV0sICZy
Z2IyNFtqICogOCArIDAgKyByZ2IyNF9zdHJpZGVdKTsKPiAgCj4gIAkJCXl1dlswXSA9IGlndF9t
YXRyaXhfdHJhbnNmb3JtKCZtLCAmcmdiWzBdKTsKPiAgCQkJeXV2WzFdID0gaWd0X21hdHJpeF90
cmFuc2Zvcm0oJm0sICZyZ2JbMV0pOwoKUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
