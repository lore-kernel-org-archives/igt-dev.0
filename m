Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE9E6E510
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2018 12:49:07 +0000 (UTC)
Date: Thu, 15 Feb 2018 14:49:05 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20180215124905.kv2qytryek62k4ow@platvala-desk.ger.corp.intel.com>
References: <20180215123400.52281-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180215123400.52281-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_debugfs: Fix
 igt_pipe_get_crcs.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBGZWIgMTUsIDIwMTggYXQgMDE6MzM6NTlQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gcmVhZF9jcmMgcmV0dXJucyBhbiBlcnJvciBpbnN0ZWFkIG9mIDAgb24gdGlt
ZW91dCBub3csIHNvIGhhbmRsZQo+IHRoaXMgY29ycmVjdGx5LiBUaGlzIGlzIGEgc21hbGwgZXJy
b3IgaW50cm9kdWNlZCBpbgo+IAo+IGNvbW1pdCA3ZDQ4YzAyNTJjMzg0ZDE4MzE4ZGU4OWM1NDgx
N2JkZmU5YzgzMmZjCj4gQXV0aG9yOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgo+IERhdGU6ICAgRnJpIEZlYiAyIDEzOjM0OjI1IDIwMTggKzAx
MDAKPiAKPiAgICAgbGliL2lndF9kZWJ1Z2ZzOiBBZGQgaWd0X3BpcGVfY3JjX2dldF9zaW5nbGUg
YW5kIGlndF9waXBlX2NyY19kcmFpbiwgdjQuCj4gCj4gSXQgY2F1c2VzIHRoZSBrbXNfY2h2X2N1
cnNvcl9mYWlsIHRvIHRha2UgMjcgbWludXRlcywgc28gZml4IHRoaXMuLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5j
b20+CgpSZXZpZXdlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+
CgoKPiAtLS0KPiAgbGliL2lndF9kZWJ1Z2ZzLmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9p
Z3RfZGVidWdmcy5jIGIvbGliL2lndF9kZWJ1Z2ZzLmMKPiBpbmRleCBlMmIxNWY5YmRhMGIuLjRh
MTE5OTg1ZjEwMiAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2RlYnVnZnMuYwo+ICsrKyBiL2xpYi9p
Z3RfZGVidWdmcy5jCj4gQEAgLTc5NCwxMCArNzk0LDExIEBAIGlndF9waXBlX2NyY19nZXRfY3Jj
cyhpZ3RfcGlwZV9jcmNfdCAqcGlwZV9jcmMsIGludCBuX2NyY3MsCj4gIAkJaW50IHJldDsKPiAg
Cj4gIAkJcmV0ID0gcmVhZF9jcmMocGlwZV9jcmMsIGNyYyk7Cj4gKwkJaWYgKHJldCA9PSAtRUFH
QUlOKQo+ICsJCQlicmVhazsKPiArCj4gIAkJaWYgKHJldCA8IDApCj4gIAkJCWNvbnRpbnVlOwo+
IC0JCWlmIChyZXQgPT0gMCkKPiAtCQkJYnJlYWs7Cj4gIAo+ICAJCW4rKzsKPiAgCX0gd2hpbGUg
KG4gPCBuX2NyY3MpOwo+IC0tIAo+IDIuMTYuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
