Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EE16E42C
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 22:23:42 +0000 (UTC)
References: <20191115231625.2368317-1-vanshidhar.r.konda@intel.com>
 <20191115231625.2368317-3-vanshidhar.r.konda@intel.com>
From: Brian Welty <brian.welty@intel.com>
Message-ID: <cfcba40f-5e12-f084-13d6-b4ea981b1cb0@intel.com>
Date: Tue, 19 Nov 2019 14:23:41 -0800
MIME-Version: 1.0
In-Reply-To: <20191115231625.2368317-3-vanshidhar.r.konda@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH 2/2] i915/i915_fb_tiling: Check if device
 supports tiling
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
To: Vanshidhar Konda <vanshidhar.r.konda@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAxMS8xNS8yMDE5IDM6MTYgUE0sIFZhbnNoaWRoYXIgS29uZGEgd3JvdGU6Cj4gU2tpcCB0
aGlzIHRlc3QgaWYgdGhlIHBsYXRmb3JtIGRvZXMgbm90IHN1cHBvcnQgc2V0dGluZyB0aWxpbmcg
Zm9yIGZyYW1lCj4gYnVmZmVyIG9iamVjdC4KPiAKCkxvb2tpbmcgb3ZlciBzb21lIG90aGVyIHRl
c3RzLCBJIGNhbWUgYWNyb3NzIGEgbGliZHJtIGZ1bmN0aW9uIHRoYXQgdXNlcyBTRVRfVElMSU5H
LApkcm1faW50ZWxfYm9fYWxsb2NfdGlsZWQoKS4KCkFueSBjaGFuY2UgeW91IGNhbiBleHBhbmQg
eW91ciBwYXRjaCBzZXJpZXMgdG8gZml4IHRlc3RzIHVzaW5nIHRoYXQgZnVuY3Rpb24gYXMgd2Vs
bD8KSXQgaXMgbm90IHF1aXRlIGFzIGVhc3ksIEkgYmVsaWV2ZSB5b3UgbWF5YmUgc2hvdWxkbid0
IGRpc2FibGUgdGhlbSBhbGwgYnV0IHNob3VsZAptYXliZSBjb25kaXRpb25hbGx5IHVzZSBkcm1f
aW50ZWxfYm9fYWxsb2NfdGlsZWQoKSBvciBkcm1faW50ZWxfYm9fYWxsb2MoKS4KTm90IHN1cmUu
CgpUaGFua3MsCi1CcmlhbgoKCj4gU2lnbmVkLW9mZi1ieTogVmFuc2hpZGhhciBLb25kYSA8dmFu
c2hpZGhhci5yLmtvbmRhQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogQXNodXRvc2ggRGl4aXQg
PGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvaTkxNS9pOTE1X2ZiX3Rp
bGluZy5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2k5MTUvaTkxNV9mYl90aWxpbmcuYyBiL3Rlc3RzL2k5MTUvaTkxNV9m
Yl90aWxpbmcuYwo+IGluZGV4IDdkNWMzZjFmLi40ZWM4NDk2MiAxMDA2NDQKPiAtLS0gYS90ZXN0
cy9pOTE1L2k5MTVfZmJfdGlsaW5nLmMKPiArKysgYi90ZXN0cy9pOTE1L2k5MTVfZmJfdGlsaW5n
LmMKPiBAQCAtMzIsNiArMzIsOCBAQCBpZ3Rfc2ltcGxlX21haW4KPiAgCXN0cnVjdCBpZ3RfZmIg
ZmI7Cj4gIAlpbnQgcmV0Owo+ICAKPiArCWlndF9yZXF1aXJlKGdlbV9oYXNfbGVnYWN5X2h3X3Rp
bGluZyhkcm1fZmQpKTsKPiArCj4gIAlpZ3RfY3JlYXRlX2ZiKGRybV9mZCwgNTEyLCA1MTIsIERS
TV9GT1JNQVRfWFJHQjg4ODgsCj4gIAkJICAgICAgTE9DQUxfSTkxNV9GT1JNQVRfTU9EX1hfVElM
RUQsICZmYik7Cj4gIAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
