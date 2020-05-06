Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A216E21F
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2020 09:54:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e26so1851927wmk.5
 for <igt-dev@lists.freedesktop.org>; Wed, 06 May 2020 02:54:45 -0700 (PDT)
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
 <20200428202255.31309-6-juhapekka.heikkila@gmail.com>
 <20200505140912.pqtw6yyplacaop5u@ahiler-desk1.fi.intel.com>
 <a9c3b9e6-1f2c-6e08-7c61-74f4aeead861@gmail.com>
 <0169ef69-3a71-991e-0b0c-302b19ffd6ad@gmail.com>
 <20200506090500.v7qtdlbjcf2m6azg@ahiler-desk1.fi.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <68a9eb1a-4ed7-7ca1-7161-7b3ec740b319@gmail.com>
Date: Wed, 6 May 2020 12:54:37 +0300
MIME-Version: 1.0
In-Reply-To: <20200506090500.v7qtdlbjcf2m6azg@ahiler-desk1.fi.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 5/7] igt/params: add generic saving
 module parameter set
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gNi41LjIwMjAgMTIuMDUsIEFya2FkaXVzeiBIaWxlciB3cm90ZToKPiBPbiBUdWUsIE1heSAw
NSwgMjAyMCBhdCAxMTowMDowM1BNICswMzAwLCBKdWhhLVBla2thIEhlaWtraWxhIHdyb3RlOgo+
PiBPbiA1LjUuMjAyMCAyMS40NiwgSnVoYS1QZWtrYSBIZWlra2lsYSB3cm90ZToKPj4+IE9uIDUu
NS4yMDIwIDE3LjA5LCBBcmthZGl1c3ogSGlsZXIgd3JvdGU6Cj4+Pj4gT24gVHVlLCBBcHIgMjgs
IDIwMjAgYXQgMTE6MjI6NTNQTSArMDMwMCwgSnVoYS1QZWtrYSBIZWlra2lsYSB3cm90ZToKPj4+
Pj4gRnJvbTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPj4+Pj4KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdt
YWlsLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICDCoCBsaWIvaWd0X3BhcmFtcy5jIHwgNTcgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4+Pj4+ICDCoCBsaWIv
aWd0X3BhcmFtcy5oIHzCoCAzICsrKwo+Pj4+PiAgwqAgMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvbGliL2ln
dF9wYXJhbXMuYyBiL2xpYi9pZ3RfcGFyYW1zLmMKPj4+Pj4gaW5kZXggZmU0YjFkZjMuLmQ5Y2Y5
ODZjIDEwMDY0NAo+Pj4+PiAtLS0gYS9saWIvaWd0X3BhcmFtcy5jCj4+Pj4+ICsrKyBiL2xpYi9p
Z3RfcGFyYW1zLmMKPj4+Pj4gQEAgLTE1Myw2ICsxNTMsMjkgQEAgaW50IGlndF9wYXJhbXNfb3Bl
bihpbnQgZGV2aWNlKQo+Pj4+PiAgwqDCoMKgwqDCoCByZXR1cm4gX19pZ3RfcGFyYW1zX29wZW4o
ZGV2aWNlLCBOVUxMKTsKPj4+Pj4gIMKgIH0KPj4+Pj4gK19fYXR0cmlidXRlX18oKGZvcm1hdChw
cmludGYsIDMsIDApKSkKPj4+Pgo+Pj4+IHRoaXMgaXMgdXNpbmcgYSB2YV9saXN0LCBub3QgIi4u
LiIsIHNvIHRoaXMgZm9ybWF0IGF0dGlyYnVlIHNob3VsZCBub3QKPj4+PiBiZSBoZXJlCj4+Pj4K
Pj4+Cj4+PiBHb29kIGNhdGNoCj4+Pgo+Pgo+PiBMb29raW5nIGl0IHdpdGggYml0IG1vcmUgdGhv
dWdodCwgd2hhdCdzIHdyb25nIHdpdGggaXQ/IEkgdGhpbmsgaXQgaXMKPj4gcmVxdWlyZWQgdGhl
cmUuCj4gCj4gSSBmb3VuZCBpdCBhIGJpdCB1c2VsZXNzIHRoYXQgd2UgZG8gcHJpbnRmIGZvcm1h
dCBjaGVja2luZyB3aXRob3V0Cj4gaGF2aW5nIGFueSBhcnVnbWVudHMgdG8gbWF0Y2ggdHlwZXMg
Zm9yIGFzIHRoZXkgYXJlIHdyYXBwZWQgaW4gdmFfbGlzdCwKPiBidXQgaWYgY29tcGlsZXJzIGFy
ZSBzY3JlZW1pbmcgdGhhdCBpdCdzIG5lY2Vzc2FyeSBzbyBiZSBpdC4KPiAKPiBOb3Qgc3VyZSB3
aGF0IGJlbmVmaXQgZG9lcyBpdCBwcm92aWRlIHRob3VnaC4KCkJlbmVmaXQgaXMgbm90IHRvIGdl
dCBjb21waWxlciB3YXJuaW5nIHdoaWNoIHdvdWxkIGJlIGNhdXNlZCBmcm9tIGxhdGVyIAp1c2Fn
ZSBvZiB2c25wcmludGYuIE90aGVyIHdheSB0byBhdm9pZCBpdCBpcyB0byB0YWtlIG91dCAKIm1p
c3NpbmctZm9ybWF0LWF0dHJpYnV0ZSIgd2FybmluZ3MuCgp2YV9saXN0IGRvZXNuJ3QgZG8gYW55
dGhpbmcgaGVyZSwgcGFyYW1ldGVyIDMgaXMgImNvbnN0IGNoYXIgKmZtdCIuIApWYV9saXN0IHdp
bGwgbm90IGJlIHRvdWNoZWQuCgovSnVoYS1QZWtrYQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
