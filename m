Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8806EAC0
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2019 07:57:07 +0000 (UTC)
Date: Thu, 10 Oct 2019 09:55:28 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20191010075528.GG18974@kdec5-desk.ger.corp.intel.com>
References: <94c5547153d1c9ebce2b8eda730286aba6184793.1565040517.git.caz.yokoyama@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94c5547153d1c9ebce2b8eda730286aba6184793.1565040517.git.caz.yokoyama@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/1] tests/i915/gem_exec_balancer.c -
 remove unnecessary simulation check
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
To: Caz Yokoyama <caz.yokoyama@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDI6MzA6MzVQTSAtMDcwMCwgQ2F6IFlva295YW1hIHdy
b3RlOgoKVXN1YWwgYXBwcm9hY2ggZm9yIHBhdGNoZXMgaXQgdG8gZXhwbGFpbiBXSFkgd2UgZG8g
dGhpbmdzLiBXSEFUIGlzCnNlbGYtZXhwbGFpbmFibGUgYnkgY29kZS4KQWRkaW5nIGNvbW1pdCBt
c2cgY291bGQgbWFrZSBwYXRjaCBtb3JlIG5vdGljYWJsZS4KCk1vcmVvdmVyIC0gSSB3b3VsZCB0
YWxrIHRvIGF1dGhvciBvZiB0aGUgY29kZSB3aGF0IGhlIHRoaW5rcyBvZiB0aGlzIGNoYW5nZS4K
Ckthc2lhCgo+IFNpZ25lZC1vZmYtYnk6IENheiBZb2tveWFtYSA8Y2F6Lnlva295YW1hQGludGVs
LmNvbT4KPiAtLS0KPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19iYWxhbmNlci5jIHwgMiAtLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkx
NS9nZW1fZXhlY19iYWxhbmNlci5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19iYWxhbmNlci5jCj4g
aW5kZXggYjIwNzQ0ODYuLmFiZjkwZGY2IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4
ZWNfYmFsYW5jZXIuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFsYW5jZXIuYwo+IEBA
IC0xMjY3LDggKzEyNjcsNiBAQCBpZ3RfbWFpbgo+ICB7Cj4gIAlpbnQgaTkxNSA9IC0xOwo+ICAK
PiAtCWlndF9za2lwX29uX3NpbXVsYXRpb24oKTsKPiAtCj4gIAlpZ3RfZml4dHVyZSB7Cj4gIAkJ
aTkxNSA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfSU5URUwpOwo+ICAJCWlndF9yZXF1aXJlX2dl
bShpOTE1KTsKPiAtLSAKPiAyLjIxLjAuNS5nYWViNTgyYTk4Mwo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QK
PiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
