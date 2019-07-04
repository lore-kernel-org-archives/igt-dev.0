Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC186E35F
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2019 15:17:45 +0000 (UTC)
References: <20190703134303.328-1-lukasz.kalamarz@intel.com>
 <20190703134303.328-2-lukasz.kalamarz@intel.com>
Date: Thu, 04 Jul 2019 17:17:43 +0200
MIME-Version: 1.0
From: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Message-ID: <op.z4esrtxqxaggs7@mwajdecz-mobl1.ger.corp.intel.com>
In-Reply-To: <20190703134303.328-2-lukasz.kalamarz@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] lib/intel_chipset: Move BIT
 macro to common place
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lukasz Kalamarz <lukasz.kalamarz@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAwMyBKdWwgMjAxOSAxNTo0MzowMyArMDIwMCwgTHVrYXN6IEthbGFtYXJ6ICAKPGx1
a2Fzei5rYWxhbWFyekBpbnRlbC5jb20+IHdyb3RlOgoKPiBUaGlzIG1hY3JvIGlzIGRlZmluZWQg
aW4gdHdvIHRlc3RzLiBXZSBjYW4gbW92ZSBpdCB0byBjb21tb24gcGxhY2UKPiBpbiBpb2N0bF93
cmFwcGVycywgd2hpY2ggaXMgaW5jbHVkZWQgYnkgYWxsIHRlc3RzLgo+IHYyOiBNaXNzZWQgaW50
ZWxfZGV2aWNlX2luZm8gbGliLiBNb3ZlZCBCSVQgZGVmaW5pdGlvbiB0bwo+IGludGVsX2NoaXBz
ZXQsIHdoaWNoIGlzIHBhcnQgb2YgaWd0LmgKPgo+IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBLYWxh
bWFyeiA8bHVrYXN6LmthbGFtYXJ6QGludGVsLmNvbT4KPiBDYzogS2F0YXJ6eW5hIERlYyA8a2F0
YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4gQ2M6IE1pY2hhbCBXaW5pYXJza2kgPG1pY2hhbC53aW5p
YXJza2lAaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaW50ZWxfY2hpcHNldC5oICAgICAgICAgICAg
fCAyICsrCj4gIGxpYi9pbnRlbF9kZXZpY2VfaW5mby5jICAgICAgICB8IDIgLS0KPiAgdGVzdHMv
aTkxNS9nZW1fY3R4X2lzb2xhdGlvbi5jIHwgMSAtCj4gIHRlc3RzL2k5MTUvZ2VtX2N0eF9wYXJh
bS5jICAgICB8IDIgLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2NoaXBzZXQuaCBiL2xpYi9pbnRl
bF9jaGlwc2V0LmgKPiBpbmRleCA3ZmM5YmQ3Ny4uNzRhNDBhNDYgMTAwNjQ0Cj4gLS0tIGEvbGli
L2ludGVsX2NoaXBzZXQuaAo+ICsrKyBiL2xpYi9pbnRlbF9jaGlwc2V0LmgKPiBAQCAtMzEsNiAr
MzEsOCBAQAo+ICAjaW5jbHVkZSA8cGNpYWNjZXNzLmg+Cj4gICNpbmNsdWRlIDxzdGRib29sLmg+
Cj4gKyNkZWZpbmUgQklUKHgpICgxdWwgPDwoeCkpCj4gKwoKaW5zdGVhZCBvZiBwb2xsdXRpbmcg
aW5ub2NlbnQgaGVhZGVyIGZpbGUgYW5kIGludHJvZHVjZSBuZXcKZGVwZW5kZW5jeSBvbiAiaW50
ZWxfY2hpcHNldC5oIiB0byB1c2UgQklUIG1hY3JvLCBtYXliZSBiZXR0ZXIKb3B0aW9uIHdvdWxk
IGJlIHRvIGNyZWF0ZSBuZXcgaGVhZGVyIGZvciBzdWNoIHV0aWxpdGllcyBhbmQgdGhlbjoKCgkj
aW5jbHVkZSAiaWd0X3V0aWxzLmgiCm9yCgkjaW5jbHVkZSAiaWd0X2JpdG9wcy5oIgoKaW4gaW50
ZWxfZGV2aWNlX2luZm8uYyBhbmQgaWd0LmguCgpNaWNoYWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
