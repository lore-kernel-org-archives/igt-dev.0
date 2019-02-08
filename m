Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B453E6EE49
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 17:52:08 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n32so4834513qte.11
 for <igt-dev@lists.freedesktop.org>; Fri, 08 Feb 2019 09:52:08 -0800 (PST)
Message-ID: <b25fc0ff423823d53be0374eaa4ec32a6cffc3bd.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Fri, 08 Feb 2019 12:52:04 -0500
In-Reply-To: <20190208131901.1400-2-maxime.ripard@bootlin.com>
References: <20190208131901.1400-1-maxime.ripard@bootlin.com>
 <20190208131901.1400-2-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 01/10] igt: fb: Refactor dumb buffer
 allocation path
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBGcmksIDIwMTkt
MDItMDggYXQgMTQ6MTggKzAxMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gVGhlIGVsc2UgY29u
ZGl0aW9uIGlzIG5vdCBuZWVkZWQsIHNpbmNlIGFsbCB0aGUgb3RoZXIgY29uZGl0aW9ucyByZXR1
cm4KPiB3aGVuIHRoZXkgYXJlIGRvbmUuCj4gCj4gTW92ZSB0aGUgS01TIGR1bWIgYnVmZmVyIGFs
bG9jYXRpb24gb3V0c2lkZSBvZiB0aGUgb3V0ZXIgZWxzZSBjb25kaXRpb24sCj4gdGhpcyB3aWxs
IGFsc28gYWxsb3cgdG8gZWFzZSBsYXRlciBjaGFuZ2VzLgo+IAo+IFJldmlld2VkLWJ5OiBQYXVs
IEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiAtLS0KPiAg
bGliL2lndF9mYi5jIHwgMTUgKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIu
YyBiL2xpYi9pZ3RfZmIuYwo+IGluZGV4IDVkOGMxODdhOWFjOS4uYzYxZTY4MDVmZjdhIDEwMDY0
NAo+IC0tLSBhL2xpYi9pZ3RfZmIuYwo+ICsrKyBiL2xpYi9pZ3RfZmIuYwo+IEBAIC01NTksMTUg
KzU1OSwxNCBAQCBzdGF0aWMgaW50IGNyZWF0ZV9ib19mb3JfZmIoc3RydWN0IGlndF9mYiAqZmIp
Cj4gIAkJCWlndF9yZXF1aXJlKGRyaXZlcl9oYXNfZ2VtX2FwaSk7Cj4gIAkJCXJldHVybiAtRUlO
VkFMOwo+ICAJCX0KPiAtCX0gZWxzZSB7Cj4gLQkJZmItPmlzX2R1bWIgPSB0cnVlOwo+IC0KPiAt
CQlmYi0+Z2VtX2hhbmRsZSA9IGttc3Rlc3RfZHVtYl9jcmVhdGUoZmQsIGZiLT53aWR0aCwgZmIt
Cj4gPmhlaWdodCwKPiAtCQkJCQkJICAgICBmYi0+cGxhbmVfYnBwWzBdLAo+IC0JCQkJCQkgICAg
ICZmYi0+c3RyaWRlc1swXSwgJmZiLQo+ID5zaXplKTsKPiAtCj4gLQkJcmV0dXJuIGZiLT5nZW1f
aGFuZGxlOwo+ICAJfQo+ICsKPiArCWZiLT5pc19kdW1iID0gdHJ1ZTsKPiArCWZiLT5nZW1faGFu
ZGxlID0ga21zdGVzdF9kdW1iX2NyZWF0ZShmZCwgZmItPndpZHRoLCBmYi0+aGVpZ2h0LAo+ICsJ
CQkJCSAgICAgZmItPnBsYW5lX2JwcFswXSwKPiArCQkJCQkgICAgICZmYi0+c3RyaWRlc1swXSwg
JmZiLT5zaXplKTsKPiArCj4gKwlyZXR1cm4gZmItPmdlbV9oYW5kbGU7Cj4gIH0KPiAgCj4gIC8q
KgotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
