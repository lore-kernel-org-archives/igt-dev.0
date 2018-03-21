Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917F26E8D1
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Mar 2018 12:15:31 +0000 (UTC)
Received: by mail-lf0-x241.google.com with SMTP id x205-v6so7506647lfa.0
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Mar 2018 05:15:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180321120132.GV5453@intel.com>
References: <20180321110948.11816-1-daniels@collabora.com>
 <20180321120132.GV5453@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 21 Mar 2018 12:15:29 +0000
Message-ID: <CAPj87rN+22WbSQwBJs9F+csSM=3LrCyuebmwtUL+8-BW34yzmw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Don't fail if plane IN_FORMATS not
 present
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
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SGkgVmlsbGUsCgpPbiAyMSBNYXJjaCAyMDE4IGF0IDEyOjAxLCBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiBPbiBXZWQsIE1hciAyMSwgMjAx
OCBhdCAxMTowOTo0OEFNICswMDAwLCBEYW5pZWwgU3RvbmUgd3JvdGU6Cj4+IGlndF9kaXNwbGF5
X2luaXQoKSBub3cgdW5jb25kaXRpb25hbGx5IHRyaWVzIHRvIGdldCB0aGUgcGxhbmUgSU5fRk9S
TUFUUwo+PiBibG9iLCB3aGljaCBjYXVzZXMgYSBoYXJkIGFzc2VydCBmYWlsdXJlIGlmIHdlIGRv
bid0IGhhdmUgdGhlIHByb3BlcnR5Cj4+IHByZXNlbnQuCj4KPiBUaGF0J3MgcXVpdGUgb2RkLiBJ
J20gcHJldHR5IHN1cmUgSSB0ZXN0ZWQgdGhpcyB3aXRoIGJsb2JpZmllcnMgZGlzYWJsZWQKPiBp
biBpOTE1IHdoZW4gSSBkaWQgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy80MDExMy8gYnV0Cj4gc29tZWhvdyBJIGRpZCBub3QgaGl0IHRoYXQgYXNzZXJ0LiBNYWtlcyBt
ZSB3b25kZXIgd2hhdCBJIGFjdHVhbGx5Cj4gdGVzdGVkLgoKSSBjYW4ndCBzaGVkIGFueSBsaWdo
dCBvbiB0aGF0IHF1ZXN0aW9uLCBJJ20gYWZyYWlkLiA7KQoKPiBSZXZpZXdlZC1ieTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClB1c2hlZCBub3csIHRo
YW5rcyEKCkNoZWVycywKRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
