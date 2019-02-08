Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891966EE4C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 17:55:38 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l11so4946562qtp.0
 for <igt-dev@lists.freedesktop.org>; Fri, 08 Feb 2019 09:55:38 -0800 (PST)
Message-ID: <cc235689e35eb3f7627a7ed08b46f5443a1782c7.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Fri, 08 Feb 2019 12:55:34 -0500
In-Reply-To: <20190208131901.1400-3-maxime.ripard@bootlin.com>
References: <20190208131901.1400-1-maxime.ripard@bootlin.com>
 <20190208131901.1400-3-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 02/10] igt: fb: Add size checks and
 recalculation before dumb allocation
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
MDItMDggYXQgMTQ6MTggKzAxMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gU2luY2Ugd2Ugd2Fu
dCB0byB1c2UgdGhlIGR1bWIgYnVmZmVycyB0byBzdG9yZSBmcmFtZXMgaW4gZm9ybWF0cyB3aXRo
Cj4gbXVsdGlwbGUgcGxhbmVzLCB3ZSBuZWVkIHRvIGFkZCBjaGVja3MgZm9yIHVuc3VwcG9ydGVk
IGNvcm5lciBjYXNlcywgYW5kIHdlCj4gbmVlZCB0byBjYWxjdWxhdGUgdGhlIG9mZnNldHMgYW5k
IHNpemVzIG9mIGVhY2ggcGxhbmVzLiBMZXQncyB1c2UKPiBjYWxjX2ZiX3NpemUgZm9yIHRoYXQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGlu
LmNvbT4KPiAtLS0KPiAgbGliL2lndF9mYi5jIHwgMTAgKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9s
aWIvaWd0X2ZiLmMKPiBpbmRleCBjNjFlNjgwNWZmN2EuLmNhNDg2NTUxOWMxMyAxMDA2NDQKPiAt
LS0gYS9saWIvaWd0X2ZiLmMKPiArKysgYi9saWIvaWd0X2ZiLmMKPiBAQCAtNTYxLDYgKzU2MSwx
NiBAQCBzdGF0aWMgaW50IGNyZWF0ZV9ib19mb3JfZmIoc3RydWN0IGlndF9mYiAqZmIpCj4gIAkJ
fQo+ICAJfQo+ICAKPiArCS8qCj4gKwkgKiBUaGUgY3VycmVudCBkdW1iIGJ1ZmZlciBhbGxvY2F0
aW9uIEFQSSBkb2Vzbid0IHJlYWxseSBhbGxvdyB0bwo+ICsJICogc3BlY2lmeSBhIGN1c3RvbSBz
aXplIG9yIHN0cmlkZS4gWWV0IHRoZSBjYWxsZXIgaXMgZnJlZSB0byBzcGVjaWZ5Cj4gKwkgKiB0
aGVtLCBzbyB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0byBlcnJvciBvdXQgaW4gdGhpcyBjYXNlLgo+
ICsJICovCj4gKwlpZ3RfYXNzZXJ0KGZiLT5zaXplID09IDApOwo+ICsJaWd0X2Fzc2VydChmYi0+
c3RyaWRlc1swXSA9PSAwKTsKPiArCj4gKwlmYi0+c2l6ZSA9IGNhbGNfZmJfc2l6ZShmYik7Cj4g
Kwo+ICAJZmItPmlzX2R1bWIgPSB0cnVlOwo+ICAJZmItPmdlbV9oYW5kbGUgPSBrbXN0ZXN0X2R1
bWJfY3JlYXRlKGZkLCBmYi0+d2lkdGgsIGZiLT5oZWlnaHQsCj4gIAkJCQkJICAgICBmYi0+cGxh
bmVfYnBwWzBdLAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
