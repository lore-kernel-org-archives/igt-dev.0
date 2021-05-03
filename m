Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1347D89D89
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 14:13:20 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a4so5751906wrr.2
 for <igt-dev@lists.freedesktop.org>; Mon, 03 May 2021 07:13:20 -0700 (PDT)
References: <20210501015044.4139096-1-imre.deak@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <1b81e245-76cb-835b-4e85-7b4ab49e3e1f@gmail.com>
Date: Mon, 3 May 2021 17:13:11 +0300
MIME-Version: 1.0
In-Reply-To: <20210501015044.4139096-1-imre.deak@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/intel_bufops: Fix CCS plane
 width calculation
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
List-ID: <igt-dev@lists.freedesktop.org>

U2VyaWVzIGlzCgpSZXZpZXdlZC1ieTogSnVoYS1QZWtrYSBIZWlra2lsw6QgPGp1aGEtcGVra2Eu
aGVpa2tpbGFAaW50ZWwuY29tPgoKCk9uIDEuNS4yMDIxIDQuNTAsIEltcmUgRGVhayB3cm90ZToK
PiBUaGUgQ0NTIHBsYW5lIHdpZHRoIGNhbGN1bGF0aW9uIHdhcyBjb3JyZWN0IG9ubHkgZm9yIDMy
YnBwIGZvcm1hdHMsCj4gd2hlcmUgYSA2NCBieXRlIENDUyB1bml0IG1hcHMgdG8gYSA0IHRpbGVz
ICogMzIgcGl4ZWwgd2lkdGggb24gdGhlIG1haW4KPiBzdXJmYWNlLCBidXQgZm9yIG90aGVyIGJw
cHMgdGhlIHNhbWUgQ0NTIHVuaXQgbWFwcyB0byBhCj4gKDQgdGlsZXMgKiAxMjggYnl0ZXMgLyAo
YnBwLzggYnl0ZXMvcGl4ZWwpKSB3aWR0aC4gRml4IHRoZSB3aWR0aAo+IGNhbGN1bGF0aW9uIGFj
Y29yZGluZ2x5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVs
LmNvbT4KPiAtLS0KPiAgIGxpYi9pbnRlbF9idWZvcHMuaCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIv
aW50ZWxfYnVmb3BzLmggYi9saWIvaW50ZWxfYnVmb3BzLmgKPiBpbmRleCAxYTNkODY5MjUuLjNk
YzA1OTgwOCAxMDA2NDQKPiAtLS0gYS9saWIvaW50ZWxfYnVmb3BzLmgKPiArKysgYi9saWIvaW50
ZWxfYnVmb3BzLmgKPiBAQCAtNzgsNyArNzgsNyBAQCBpbnRlbF9idWZfY2NzX3dpZHRoKGludCBn
ZW4sIGNvbnN0IHN0cnVjdCBpbnRlbF9idWYgKmJ1ZikKPiAgIAkgKiBtYWluIHN1cmZhY2UuCj4g
ICAJICovCj4gICAJaWYgKGdlbiA+PSAxMikKPiAtCQlyZXR1cm4gRElWX1JPVU5EX1VQKGludGVs
X2J1Zl93aWR0aChidWYpLCAxMjgpICogNjQ7Cj4gKwkJcmV0dXJuIERJVl9ST1VORF9VUChpbnRl
bF9idWZfd2lkdGgoYnVmKSwgNTEyIC8gKGJ1Zi0+YnBwIC8gOCkpICogNjQ7Cj4gICAKPiAgIAly
ZXR1cm4gRElWX1JPVU5EX1VQKGludGVsX2J1Zl93aWR0aChidWYpLCAxMDI0KSAqIDEyODsKPiAg
IH0KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
