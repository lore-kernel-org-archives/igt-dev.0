Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA35C892ED
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2019 12:13:04 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id p24so682758vki.5
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2019 05:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190515101956.935-1-petri.latvala@intel.com>
In-Reply-To: <20190515101956.935-1-petri.latvala@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 15 May 2019 13:11:50 +0100
Message-ID: <CACvgo50TYVbv4t_0jG3bsMgPy=Om-Yo_mnCq_dqsF32KHSF6hQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "tests/core_unauth_vs_render:
 new test for the relaxed DRM_AUTH handling"
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Emil Velikov <emil.velikov@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAxNSBNYXkgMjAxOSBhdCAxMToyMCwgUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFs
YUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gVGhlIGtlcm5lbCBwYXRjaCBmb3IgcmVsYXhlZCBEUk1f
QVVUSCBoYW5kbGluZyBjYXVzZWQgYSByZWdyZXNzaW9uLAo+IGhpZ2hsaWdodGluZyBidWcgaW4g
dGhlIFJBRFYgaW1wbGVtZW50YXRpb24sIGFuZCB3YXMgcmV2ZXJ0ZWQuIFRoZQo+IHBhdGNoIHdp
bGwgYmUgcmVpbnN0YXRlZCwgbGlrZWx5IGluIGRpZmZlcmVudCBmb3JtLCBhbHRob3VnaCB1bnRp
bAo+IHRoZW4gZGlzYWJsZSB0aGUgdGVzdC4KPgo+IFNlZSB0aGUgdGhyZWFkIGZvciBkZXRhaWxz
Lgo+Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIw
MTktQXByaWwvMjE1MDE4Lmh0bWwKPgo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgOTBmNzhhYzcwNDcx
OGE0ZGMwODljYTk5MDQxZjAzMjE5MWM2ZjhiMS4KPgo+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3Mu
ZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTA0NjcKPiBTaWduZWQtb2ZmLWJ5OiBQ
ZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiBDYzogRW1pbCBWZWxpa292
IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4KPiAtLS0KPgo+IFJhdGhlciB0aGFuIGFkZGluZyAjaWYgMAo+ICho
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU5OTQ1LykgYmV0dGVyIHRv
IGNvbXBsZXRlbHkKPiByZXZlcnQgZm9yIG5vdy4KCkFja2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVt
aWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKU3RydWdnbGluZyB0byBzZWUgaG93IGEgcmV2ZXJ0
IGlzIGJldHRlciwgYnV0IGhleSAtIEknbSBnbGFkIHRvIHNlZQpzb21lIHByb2dyZXNzIGFmdGVy
IDMgd2Vla3Mgb2Ygc2lsZW5jZS4KU3BlYWtpbmcgb2YgcHJvZ3Jlc3MsIHdobyBkbyBJIG5lZWQg
dG8gYnJpYmVeV3Bva2UgdG8gZ2V0IHRoaXMgWzFdCnRyaXZpYWwgcGF0Y2ggbWVyZ2VkPwoKSFRI
Ci1FbWlsCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMwMjA0
OS8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
