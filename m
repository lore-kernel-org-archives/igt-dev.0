Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932A16EC11
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 19:51:27 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b25so4262550ljp.6
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 12:51:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200622164415.30352-7-janusz.krzysztofik@linux.intel.com>
References: <20200622164415.30352-1-janusz.krzysztofik@linux.intel.com>
 <20200622164415.30352-7-janusz.krzysztofik@linux.intel.com>
From: =?utf-8?q?Micha=C5=82?= Winiarski <michal@hardline.pl>
Date: Thu, 25 Jun 2020 21:51:24 +0200
Message-ID: <159311468453.202818.18055756190300144808@macragge.hardline.pl>
Subject: Re: [igt-dev] [RFC PATCH i-g-t v2 6/8] tests/core_hotunplug: Add
 'GEM object' variant
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKYW51c3ogS3J6eXN6dG9maWsgKDIwMjAtMDYtMjIgMTg6NDQ6MTMpCj4gR0VNIG9i
amVjdHMgYmVsb25naW5nIHRvIHVzZXIgZmlsZSBkZXNjcmlwdG9ycyBzdGlsbCBvcGVuIG9uIGRl
dmljZQo+IGhvdHVucGx1ZyBtYXkgZXhoaWJpdCBzdGlsbCBtb3JlIGRyaXZlciBpc3N1ZXMuICBB
ZGQgYSBzdWJ0ZXN0IHRoYXQKPiBpbXBsZW1lbnRzIHRoaXMgc2NlbmFyaW8uCj4gCj4gdjI6IHJl
YmFzZSBvbiB1cHN0cmVhbQo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbnVzeiBLcnp5c3p0b2ZpayA8
amFudXN6LmtyenlzenRvZmlrQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvY29yZV9o
b3R1bnBsdWcuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9jb3JlX2hv
dHVucGx1Zy5jIGIvdGVzdHMvY29yZV9ob3R1bnBsdWcuYwo+IGluZGV4IDE4YTk2MzU2NC4uYzMw
ZDk4YTY5IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMKPiArKysgYi90ZXN0
cy9jb3JlX2hvdHVucGx1Zy5jCj4gQEAgLTM1Niw2ICszNTYsMjkgQEAgc3RhdGljIHZvaWQgdm1f
aG90dW5wbHVnX2xhdGVjbG9zZSh2b2lkKQo+ICAgICAgICAgaGVhbHRoY2hlY2soKTsKPiAgfQo+
ICAKPiArc3RhdGljIHZvaWQgZ2VtX2hvdHVucGx1Z19sYXRlY2xvc2Uodm9pZCkKPiArewo+ICsg
ICAgICAgc3RydWN0IGhvdHVucGx1ZyBwcml2Owo+ICsKPiArICAgICAgIHByZXBhcmVfZm9yX3Jl
c2NhbigmcHJpdik7Cj4gKwo+ICsgICAgICAgaWd0X3JlcXVpcmVfZ2VtKHByaXYuZmQuZHJtKTsK
PiArCj4gKyAgICAgICBsb2NhbF9kZWJ1ZygiY3JlYXRpbmcgYSBHRU0gdXNlciBvYmplY3QiKTsK
PiArICAgICAgIGlndF9pZ25vcmVfd2FybihnZW1fY3JlYXRlKHByaXYuZmQuZHJtLCA0MDk2KSk7
CgpTYW1lIGFzIHByZXZpb3VzIG9uZS4KKG5vdGUgLSB3ZSBjb3VsZCBqdXN0IGNoZWNrIGZvciBw
cm9wZXIgZXJyb3Igd2hlbiB3ZSBhdHRlbXB0IHRvIGNsb3NlIHRoaXMKaGFuZGxlIGFmdGVyIHVu
cGx1ZywgYW5kIHRoZSBzYW1lIHRoaW5nIGFwcGxpZXMgdG8gdGhlIHByZXZpb3VzIG9uZSB3aXRo
IHRoZSB2bSkKCkxHVE0gb3RoZXJ3aXNlLgoKUmV2aWV3ZWQtYnk6IE1pY2hhxYIgV2luaWFyc2tp
IDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KCi1NaWNoYcWCCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
