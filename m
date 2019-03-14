Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203496E298
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 09:35:06 +0000 (UTC)
Date: Thu, 14 Mar 2019 10:35:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <20190314103502.395e0941@collabora.com>
In-Reply-To: <20190220162530.31643-4-daniel.vetter@ffwll.ch>
References: <20190220162530.31643-1-daniel.vetter@ffwll.ch>
 <20190220162530.31643-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/9] tests/kms_release: invalid checks
 for revoke-lease ioctl
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Keith Packard <keithp@keithp.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMCBGZWIgMjAxOSAxNzoyNToyNSArMDEwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gRm91bmQgYSBmZXcgY29ybmVyIGNhc2VzIHRvIHZh
bGlkYXRlLiBQdXQgdGhlbSBpbnRvIHRoZSBleGlzdGluZwo+IHRlc3RjYXNlLgo+IAo+IENjOiBL
ZWl0aCBQYWNrYXJkIDxrZWl0aHBAa2VpdGhwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBCcmV6
aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiAgdGVzdHMva21z
X2xlYXNlLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2xlYXNlLmMgYi90ZXN0cy9rbXNfbGVh
c2UuYwo+IGluZGV4IDQwNjJhMGIzNjVjOS4uMjk4ZDgxYzcxYmE5IDEwMDY0NAo+IC0tLSBhL3Rl
c3RzL2ttc19sZWFzZS5jCj4gKysrIGIvdGVzdHMva21zX2xlYXNlLmMKPiBAQCAtNTExLDYgKzUx
MSwxNCBAQCBzdGF0aWMgdm9pZCBsZWFzZV9yZXZva2UoZGF0YV90ICpkYXRhKQo+ICAKPiAgCWln
dF9kaXNwbGF5X3JlcXVpcmUoJmxlYXNlLmRpc3BsYXksIGxlYXNlLmZkKTsKPiAgCj4gKwkvKiB0
cnkgdG8gcmV2b2tlIGFuIGludmFsaWQgbGVhc2UgKi8KPiArCW1ybC5sZXNzZWVfaWQgPSAwOwo+
ICsJaWd0X2Fzc2VydF9lcShyZXZva2VfbGVhc2UoZGF0YS0+bWFzdGVyLmZkLCAmbXJsKSwgLUVO
T0VOVCk7Cj4gKwo+ICsJLyogdHJ5IHRvIHJldm9rZSB3aXRoIHRoZSB3cm9uZyBmZCAqLwo+ICsJ
bXJsLmxlc3NlZV9pZCA9IGxlYXNlLmxlc3NlZV9pZDsKPiArCWlndF9hc3NlcnRfZXEocmV2b2tl
X2xlYXNlKGxlYXNlLmZkLCAmbXJsKSwgLUVBQ0NFUyk7Cj4gKwo+ICAJLyogUmV2b2tlIHRoZSBs
ZWFzZSB1c2luZyB0aGUgbWFzdGVyIGZkICovCj4gIAltcmwubGVzc2VlX2lkID0gbGVhc2UubGVz
c2VlX2lkOwo+ICAJaWd0X2Fzc2VydF9lcShyZXZva2VfbGVhc2UoZGF0YS0+bWFzdGVyLmZkLCAm
bXJsKSwgMCk7Cj4gQEAgLTUyMiw2ICs1MzAsMTAgQEAgc3RhdGljIHZvaWQgbGVhc2VfcmV2b2tl
KGRhdGFfdCAqZGF0YSkKPiAgCWlndF9hc3NlcnRfZXEocmV0LCAtRU5PRU5UKTsKPiAgCj4gIAl0
ZXJtaW5hdGVfbGVhc2UoJmxlYXNlKTsKPiArCj4gKwkvKiBtYWtlIHN1cmUgdGhlIGxlYXNlIGlz
IGdvbmUgKi8KPiArCW1ybC5sZXNzZWVfaWQgPSBsZWFzZS5sZXNzZWVfaWQ7Cj4gKwlpZ3RfYXNz
ZXJ0X2VxKHJldm9rZV9sZWFzZShkYXRhLT5tYXN0ZXIuZmQsICZtcmwpLCAtRU5PRU5UKTsKPiAg
fQo+ICAKPiAgLyogVGVzdCBsZWFzaW5nIG9iamVjdHMgbW9yZSB0aGFuIG9uY2UgKi8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
