Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAF76E207
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Feb 2021 12:29:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v15so13199584wrx.4
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Feb 2021 04:29:59 -0800 (PST)
Message-ID: <52b977b0d59d74e8283c4f2f2630db91df030a1b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 28 Feb 2021 12:29:54 +0000
In-Reply-To: <4b0ea6a7-92a7-566a-ce32-f8548eb87092@mupuf.org>
References: <20210227144900.3961632-1-richard.purdie@linuxfoundation.org>
 <4b0ea6a7-92a7-566a-ce32-f8548eb87092@mupuf.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] meson: Allow source location to be
 configurable
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
To: Martin Peres <martin.peres@mupuf.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gU3VuLCAyMDIxLTAyLTI4IGF0IDEyOjA2ICswMjAwLCBNYXJ0aW4gUGVyZXMgd3JvdGU6Cj4g
T24gMjcvMDIvMjAyMSAxNjo0OSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6Cj4gPiAKPiA+IMKgwqBs
aWJfdmVyc2lvbiA9IHZjc190YWcoaW5wdXQgOiAndmVyc2lvbi5oLmluJywgb3V0cHV0IDogJ3Zl
cnNpb24uaCcsCj4gPiDCoMKgCQkgICAgICBmYWxsYmFjayA6ICdOTy1HSVQnLAo+ID4gZGlmZiAt
LWdpdCBhL21lc29uX29wdGlvbnMudHh0IGIvbWVzb25fb3B0aW9ucy50eHQKPiA+IGluZGV4IGZm
M2FiZjA4Li5hMGExYWFlZCAxMDA2NDQKPiA+IC0tLSBhL21lc29uX29wdGlvbnMudHh0Cj4gPiAr
KysgYi9tZXNvbl9vcHRpb25zLnR4dAo+ID4gQEAgLTUwLDMgKzUwLDcgQEAgb3B0aW9uKCd1c2Vf
cnBhdGgnLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgdHlwZSA6ICdib29sZWFuJywKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoHZhbHVlIDogZmFsc2UsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqBkZXNjcmlw
dGlvbiA6ICdTZXQgcnVucGF0aCBvbiBpbnN0YWxsZWQgZXhlY3V0YWJsZXMgZm9yIGxpYmlndC5z
bycpCj4gPiArCj4gPiArb3B0aW9uKCdzcmNkaXInLAo+ID4gKyAgICAgICB0eXBlIDogJ3N0cmlu
ZycsCj4gPiArICAgICAgIGRlc2NyaXB0aW9uIDogJ1BhdGggdG8gc291cmNlIGNvZGUgdG8gYmUg
Y29tcGlsZWQgaW50byBiaW5hcmllcyAob3B0aW9uYWwpJykKPiAKPiBTaG91bGRuJ3QgdGhpcyBy
ZWFkOiAiUGF0aCB0byBUSEUgc291cmNlIGNvZGUgdG8gYmUgY29tcGlsZWQgCj4gKG9wdGlvbmFs
KSI/IENvbXBpbGluZyBpbnRvIGJpbmFyaWVzIGlzIGEgbGl0dGxlIHJlZHVuZGFudCwgc28gSSB3
b3VsZCAKPiBkcm9wIGl0LgoKSSdtIG5vdCBzdXJlIHRoYXQgZG9lcyBxdWl0ZSBtZWFuIHRoZSBz
YW1lIHRoaW5nLiBUaGUgb3B0aW9uIGlzIHRhbGtpbmcKYWJvdXQgYSBwYXRoIHdoaWNoIGdldHMg
Y29tcGlsZWQgaW5zaWRlIHRoZSBiaW5hcnkgcmF0aGVyIHRoYW4gYSBwYXRoIHRvIGNvZGUKd2hp
Y2ggaXMgY29tcGlsZWQuCgpSZWdhcmRsZXNzLCBpdCBjbGVhcmx5IG5lZWRzIHRvIGJlIG1vcmUg
Y2xlYXIhIDopCgpIb3cgYWJvdXQgIlNvdXJjZSBjb2RlIHBhdGggaW4gdGhlIHRhcmdldCBlbnZp
cm9ubWVudCBmb3IgdXNlIHdpdGhpbiB0YXJnZXQKYmluYXJpZXMgKG9wdGlvbmFsKSI/CgpDaGVl
cnMsCgpSaWNoYXJkCgo+IE90aGVyIHRoYW4gdGhpcywgdGhlIHJhdGlvbmFsZSBzZWVtcyBzYW5l
LCBidXQgSSBhbSBub3QgCj4ga25vd2xlZGdlYWJsZS1lbm91Z2ggYWJvdXQgSUdUJ3MgYnVpbGQg
c3lzdGVtIHRvIGNvbW1lbnQgbW9yZSBvbiBpdDoKPiAKPiBBY2tlZC1ieTogTWFydGluIFBlcmVz
IDxtYXJ0aW4ucGVyZXNAbXVwdWYub3JnPgo+IAo+ID4gCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
