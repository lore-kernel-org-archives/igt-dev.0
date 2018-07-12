Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 12 Jul 2018 22:00:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180712190005.GF5565@intel.com>
References: <20180712153849.12517-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180712153849.12517-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_render_copy_redux: Check for
 GEM before use
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTIsIDIwMTggYXQgMDQ6Mzg6NDlQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEFzIHJlbmRlciBjb3B5IHdhbnRzIHRvIHVzZSB0aGUgR1BVLCB3ZSBzaG91bGQgbWFr
ZSBzdXJlIGl0IGlzIG5vdAo+IHdlZGdlZCBmaXJzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KClJldmlld2VkLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKPiAtLS0KPiAgdGVzdHMv
Z2VtX3JlbmRlcl9jb3B5X3JlZHV4LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2dlbV9yZW5kZXJfY29weV9yZWR1eC5jIGIv
dGVzdHMvZ2VtX3JlbmRlcl9jb3B5X3JlZHV4LmMKPiBpbmRleCAyNzA5OGVhNmQuLmE4NjE4NjJk
MCAxMDA2NDQKPiAtLS0gYS90ZXN0cy9nZW1fcmVuZGVyX2NvcHlfcmVkdXguYwo+ICsrKyBiL3Rl
c3RzL2dlbV9yZW5kZXJfY29weV9yZWR1eC5jCj4gQEAgLTIwOSw2ICsyMDksNyBAQCBpbnQgbWFp
bihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCj4gIAo+ICAJaWd0X2ZpeHR1cmUgewo+ICAJCWRhdGFf
aW5pdCgmZGF0YSk7Cj4gKwkJaWd0X3JlcXVpcmVfZ2VtKGRhdGEuZmQpOwo+ICAJfQo+ICAKPiAg
CWlndF9zdWJ0ZXN0KCJub3JtYWwiKSB7Cj4gLS0gCj4gMi4xOC4wCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlz
dAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2CgotLSAKVmlsbGUgU3lyasOkbMOkCklu
dGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
