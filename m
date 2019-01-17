Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85486F37B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 09:55:50 +0000 (UTC)
References: <20190116112050.27647-1-petri.latvala@intel.com>
 <20190116112050.27647-5-petri.latvala@intel.com>
From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Message-ID: <7a521c19-20eb-e9fa-c413-1939c87b3047@linux.intel.com>
Date: Thu, 17 Jan 2019 11:55:49 +0200
MIME-Version: 1.0
In-Reply-To: <20190116112050.27647-5-petri.latvala@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 04/21] lib/igt_kms: Use correct type for
 calloc
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
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDAxLzE2LzIwMTkgMDE6MjAgUE0sIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gVGhlIHR5cGUg
bWlzbWF0Y2ggd2FzIGNoYXIgdnMuIHVuc2lnbmVkIGNoYXIsIGJvdGggYmVpbmcgc2l6ZSAxIHNv
Cj4gdGhpcyBkaWRuJ3QgY2F1c2UgYW55IGFjdHVhbCBpc3N1ZXMgb3RoZXIgdGhhbiBub2lzZSBp
biBzdGF0aWMKPiBhbmFseXNpcyB0aGF0IGRvZXNuJ3QgYmVsaWV2ZSAxIGlzIGVxdWFsIHRvIGFu
b3RoZXIgdHlwZSBvZiAxLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJp
LmxhdHZhbGFAaW50ZWwuY29tPgo+IENjOiBBYmRpZWwgSmFudWxndWUgPGFiZGllbC5qYW51bGd1
ZUBsaW51eC5pbnRlbC5jb20+CgoKUmV2aWV3ZWQtYnk6IEFiZGllbCBKYW51bGd1ZSA8YWJkaWVs
LmphbnVsZ3VlQGxpbnV4LmludGVsLmNvbT4KCj4gLS0tCj4gIGxpYi9pZ3Rfa21zLmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwo+IGluZGV4IDY4NGE1OTlj
Li5mOTI2ZWFmYiAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2ttcy5jCj4gKysrIGIvbGliL2lndF9r
bXMuYwo+IEBAIC0xMjM0LDcgKzEyMzQsNyBAQCBpbml0X2NlYV9ibG9jayhjb25zdCB1bnNpZ25l
ZCBjaGFyICplZGlkLCBzaXplX3QgbGVuZ3RoLAo+ICAKPiAgCSpuZXdfbGVuZ3RoID0gbGVuZ3Ro
ICsgMTI4Owo+ICAKPiAtCW5ld19lZGlkLmRhdGEgPSBjYWxsb2MoKm5ld19sZW5ndGgsIHNpemVv
ZihjaGFyKSk7Cj4gKwluZXdfZWRpZC5kYXRhID0gY2FsbG9jKCpuZXdfbGVuZ3RoLCBzaXplb2Yo
Km5ld19lZGlkLmRhdGEpKTsKPiAgCWlndF9hc3NlcnRfZihuZXdfZWRpZC5kYXRhLCAiRmFpbGVk
IHRvIGFsbG9jYXRlICV6dSBieXRlcyBmb3IgZWRpZFxuIiwgc2l6ZW9mKG5ld19sZW5ndGgpKTsK
PiAgCW1lbWNweShuZXdfZWRpZC5kYXRhLCBlZGlkLCBsZW5ndGgpOwo+ICAJKm5ld19lZGlkX3B0
ciA9IG5ld19lZGlkLmRhdGE7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
