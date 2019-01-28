Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4966E48F
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 12:22:42 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20190128115436.14527-1-maarten.lankhorst@linux.intel.com>
References: <20190128115436.14527-1-maarten.lankhorst@linux.intel.com>
Date: Mon, 28 Jan 2019 14:24:19 +0200
Message-ID: <87zhrlynpo.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] debugfs: Fix writing an extra zero out
 of bounds in igt_crc_to_string_extended()
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAyOCBKYW4gMjAxOSwgTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lndF9k
ZWJ1Z2ZzLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9kZWJ1Z2ZzLmMgYi9saWIv
aWd0X2RlYnVnZnMuYwo+IGluZGV4IDM2NTZjNjZhNTY3NC4uZDFmYzBmZjdmNzEwIDEwMDY0NAo+
IC0tLSBhL2xpYi9pZ3RfZGVidWdmcy5jCj4gKysrIGIvbGliL2lndF9kZWJ1Z2ZzLmMKPiBAQCAt
NDU4LDE3ICs0NTgsMTcgQEAgY2hhciAqaWd0X2NyY190b19zdHJpbmdfZXh0ZW5kZWQoaWd0X2Ny
Y190ICpjcmMsIGNoYXIgZGVsaW1pdGVyLCBpbnQgY3JjX3NpemUpCj4gIAlpbnQgaTsKPiAgCWlu
dCBsZW4gPSAwOwo+ICAJaW50IGZpZWxkX3dpZHRoID0gMiAqIGNyY19zaXplOyAvKiBUd28gY2hh
cnMgcGVyIGJ5dGUuICovCj4gLQljaGFyICpidWYgPSBtYWxsb2MoKGZpZWxkX3dpZHRoKzEpICog
Y3JjLT5uX3dvcmRzICogc2l6ZW9mKGNoYXIpKTsKPiArCWNoYXIgKmJ1ZiA9IG1hbGxvYygoZmll
bGRfd2lkdGgrMSkgKiBjcmMtPm5fd29yZHMpOwo+ICAKPiAgCWlmICghYnVmKQo+ICAJCXJldHVy
biBOVUxMOwo+ICAKPiAtCWZvciAoaSA9IDA7IGkgPCBjcmMtPm5fd29yZHM7IGkrKykKPiArCWZv
ciAoaSA9IDA7IGkgPCBjcmMtPm5fd29yZHMgLSAxOyBpKyspCj4gIAkJbGVuICs9IHNwcmludGYo
YnVmICsgbGVuLCAiJTAqeCVjIiwgZmllbGRfd2lkdGgsCj4gIAkJCSAgICAgICBjcmMtPmNyY1tp
XSwgZGVsaW1pdGVyKTsKCk9yIGtlZXAgdGhlIGxvb3AgY29uZGl0aW9uIGFuZCBtYWtlIHRoaXM6
CgoJCWxlbiArPSBzcHJpbnRmKGJ1ZiArIGxlbiwgIiVzJTAqeCIsIGkgPyAmZGVsaW1pdGVyIDog
IiIsCgkJCSAgICAgICBmaWVsZF93aWR0aCwgY3JjLT5jcmNbaV0pOwoKQWRkaXRpb25hbGx5IGNv
dWxkIG1ha2UgdGhlIGRlbGltaXRlciBwYXNzZWQgaGVyZSBhIGNoYXIqLgoKQlIsCkphbmkuCgo+
ICAKPiAtCS8qIEVhdCB0aGUgbGFzdCBkZWxpbWl0ZXIgKi8KPiAtCWJ1ZltsZW4gLSAxXSA9ICdc
MCc7Cj4gKwlzcHJpbnRmKGJ1ZiArIGxlbiwgIiUwKngiLCBmaWVsZF93aWR0aCwgY3JjLT5jcmNb
aV0pOwo+ICsKPiAgCXJldHVybiBidWY7Cj4gIH0KCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3Bl
biBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
