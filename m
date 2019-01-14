Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C3A6E5FC
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 10:21:25 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f9so18150675eds.10
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 02:21:25 -0800 (PST)
Date: Mon, 14 Jan 2019 11:21:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190114102122.GH10517@phenom.ffwll.local>
References: <20190114083753.14681-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190114083753.14681-1-emil.l.velikov@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/core_setmaster_vs_auth: drop
 __linux__ includes hunk
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgMDg6Mzc6NTNBTSArMDAwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4g
Cj4gU2VlbWluZyBjb3B5L3Bhc3RlIGZyb20gYW5vdGhlciB0ZXN0LiBOb25lIG9mIHRoZSBpbmNs
dWRlcyBhcmUgcmVxdWlyZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWls
LnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgoKSSdsbCBhbHNvIGNoYXQgd2l0aCBpZ3QgbWFpbnRhaW5lcnMgYW5k
IGdldCB5b3UgYSBjb21taXR0ZXIgaW52aXRlIHRvIGdldAp0aGF0IHNvcnRlZC4KClRoYW5rcywg
RGFuaWVsCj4gLS0tCj4gIHRlc3RzL2NvcmVfc2V0bWFzdGVyX3ZzX2F1dGguYyB8IDUgLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2NvcmVfc2V0bWFzdGVyX3ZzX2F1dGguYyBiL3Rlc3RzL2NvcmVfc2V0bWFzdGVyX3ZzX2F1dGgu
Ywo+IGluZGV4IGYxYWUwYzYzLi5jMzM1ZGRmZiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9jb3JlX3Nl
dG1hc3Rlcl92c19hdXRoLmMKPiArKysgYi90ZXN0cy9jb3JlX3NldG1hc3Rlcl92c19hdXRoLmMK
PiBAQCAtMzgsMTEgKzM4LDYgQEAKPiAgI2luY2x1ZGUgPHN0ZGxpYi5oPgo+ICAjaW5jbHVkZSA8
c3RkaW8uaD4KPiAgI2luY2x1ZGUgPHN0cmluZy5oPgo+IC0jaWZkZWYgX19saW51eF9fCj4gLSMg
aW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KPiAtI2Vsc2UKPiAtIyBpbmNsdWRlIDxwdGhyZWFkLmg+
Cj4gLSNlbmRpZgo+ICAKPiAgSUdUX1RFU1RfREVTQ1JJUFRJT04oIkNoZWNrIHRoYXQgZHJvcC9z
ZXRNYXN0ZXIgY29ycmVjdGx5IHRyYW5zZmVyIG1hc3RlciAiCj4gIAkJICAgICAic3RhdGUiKTsK
PiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
