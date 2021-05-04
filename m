Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B066E0CB
 for <igt-dev@lists.freedesktop.org>; Tue,  4 May 2021 09:39:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t18so8642703wry.1
 for <igt-dev@lists.freedesktop.org>; Tue, 04 May 2021 02:39:55 -0700 (PDT)
References: <20210429192628.4056795-1-imre.deak@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <3b8c4f8e-6151-a1da-da15-a879c3f5eab6@gmail.com>
Date: Tue, 4 May 2021 12:39:45 +0300
MIME-Version: 1.0
In-Reply-To: <20210429192628.4056795-1-imre.deak@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] lib/igt_fb: A few changes to fix
 test runs on ADL_P
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
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2VyaWVzIGlzCgpSZXZpZXdlZC1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhl
aWtraWxhQGdtYWlsLmNvbT4KCk9uIDI5LjQuMjAyMSAyMi4yNiwgSW1yZSBEZWFrIHdyb3RlOgo+
IFRoaXMgcGF0Y2hzZXQgZml4ZXMgYSBmZXcgdGhpbmdzIEkgbmVlZGVkIHRvIG1ha2UgdGVzdHMg
cGFzcyBvbiBBRExfUAo+ICh3aXRoIG90aGVyIHBhdGNoZXMgd2FpdGluZyBzdGlsbCBmb3IgdXBz
dHJlYW1pbmcgaW4gYW4gaW50ZXJuYWwKPiBicmFuY2gpLgo+IAo+IENjOiBQYXVsIEtvY2lhbGtv
d3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Cj4gQ2M6IEx5dWRlIFBhdWwgPGx5
dWRlQHJlZGhhdC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxp
bi5jb20+Cj4gQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVs
LmNvbT4KPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBp
bnRlbC5jb20+Cj4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBn
bWFpbC5jb20+Cj4gQ2M6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+Cj4gQ2M6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gSW1y
ZSBEZWFrICgzKToKPiAgICB0ZXN0cy9rbXNfY2NzOiBTa2lwIENDUyBjb2xvciBjbGVhciB2YWx1
ZSBjaGVjayBmb3IgcmFuZG9taXppbmcKPiAgICAgIHN1YnRlc3RzCj4gICAgbGliL2lndF9mYjog
Rml4IHN0cmlkZSBmb3IgcmVuZGVyX2NvcHkgYmFzZWQgRkIgY29udmVyc2lvbnMKPiAgICBsaWIv
aWd0X2ZiOiBSZW1vdmUgcmVkdW5kYW50IFZDNCBTQU5EIHBsYW5lIHNpemUgYWxpZ25tZW50Cj4g
Cj4gICBsaWIvaWd0X2ZiLmMgICAgICAgfCAxMCArKy0tLS0tLS0tCj4gICBsaWIvaW50ZWxfYnVm
b3BzLmMgfCAyNSArKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gICBsaWIvaW50ZWxfYnVmb3Bz
LmggfCAgMyArKy0KPiAgIHRlc3RzL2ttc19jY3MuYyAgICB8ICA2ICsrKy0tLQo+ICAgNCBmaWxl
cyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
