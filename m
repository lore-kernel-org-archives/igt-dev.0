Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180928004350.2346-7-drawat@vmware.com>
References: <20180928004350.2346-1-drawat@vmware.com>
 <20180928004350.2346-7-drawat@vmware.com>
Message-ID: <153813361518.11401.14222641332455324685@skylake-alporthouse-com>
Date: Fri, 28 Sep 2018 12:20:15 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] tests/plane_damage: Integrate
 kernel selftest test-drm_damage_helper
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
To: Deepak Rawat <drawat@vmware.com>, igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, syeh@vmware.com, thellstrom@vmware.com
Cc: Deepak Rawat <drawat@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEZWVwYWsgUmF3YXQgKDIwMTgtMDktMjggMDE6NDM6NTApCj4gQ2FsbCBrZXJuZWwg
c2VsZnRlc3QgbW9kdWxlIHRlc3QtZHJtX2RhbWFnZV9oZWxwZXIgZnJvbSBpZ3QuCj4gCj4gU2ln
bmVkLW9mZi1ieTogRGVlcGFrIFJhd2F0IDxkcmF3YXRAdm13YXJlLmNvbT4KPiAtLS0KPiAgdGVz
dHMvTWFrZWZpbGUuc291cmNlcyAgIHwgIDEgKwo+ICB0ZXN0cy9kcm1fcGxhbmVfZGFtYWdlLmMg
fCAxMCArKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZHJtX3BsYW5lX2RhbWFnZS5jCj4gCj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL01ha2VmaWxlLnNvdXJjZXMgYi90ZXN0cy9NYWtlZmlsZS5zb3VyY2VzCj4gaW5k
ZXggMjY5MzM2YWQuLjMxZWE4ODE5IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL01ha2VmaWxlLnNvdXJj
ZXMKPiArKysgYi90ZXN0cy9NYWtlZmlsZS5zb3VyY2VzCj4gQEAgLTIyOSw2ICsyMjksNyBAQCBU
RVNUU19wcm9ncyA9IFwKPiAgICAgICAgIHRvb2xzX3Rlc3QgXAo+ICAgICAgICAgdmdlbV9iYXNp
YyBcCj4gICAgICAgICB2Z2VtX3Nsb3cgXAo+ICsgICAgICAgZHJtX3BsYW5lX2RhbWFnZSBcCgpB
bHBoYWJldGljYWwsIHBsZWFzZS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
