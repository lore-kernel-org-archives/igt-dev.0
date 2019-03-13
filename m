Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEE789FCA
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 21:12:22 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <ea532fec06df0e24c4cd1fa7f87b4aa6a540662c.1552524267.git.caz.yokoyama@intel.com>
In-Reply-To: <ea532fec06df0e24c4cd1fa7f87b4aa6a540662c.1552524267.git.caz.yokoyama@intel.com>
Message-ID: <155251153190.30003.15303697863062228863@skylake-alporthouse-com>
Date: Wed, 13 Mar 2019 21:12:17 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/1] i915_pm_rpm:
 gem-execbuf-stress-extra-wait faster
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
To: Caz Yokoyama <caz.yokoyama@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDYXogWW9rb3lhbWEgKDIwMTktMDMtMTQgMDA6NDY6MDgpCj4gUmVwbGFjZSAoNXNl
YyAqIDEwKSBkZWxheSBieSBmb3JjaW5nIHRvIHN1c3BlbmRlZCBzdGF0ZS4KPiBXaGlsZSB0aGlz
IHBhdGNoIGV4cGVjdHMgYSBjb3JyZXNwb25kaW5nIHBhdGNoIGluIGRybS10aXAsCj4gdGhlIHRl
c3QgcnVucyBzdWNjZXNzZnVsIHdpdGhvdXQgdGhlIGNvcnJlc3BvbmRpbmcgcGF0Y2guCj4gSXRz
IHJ1bnRpbWUgaXMgMi0zIHNlYyBvbiBteSBsb2NhbCBtYWNoaW5lLCBudWMuCgpXQUlUX0VYVFJB
IGlzIGFsd2F5cyBiZWluZyB1c2VkIGluIGNvbmp1bmN0aW9uIHdpdGggV0FJVF9TVEFUVVMsIHNv
IGl0CnNpbXBseSBpcyBjaGVja2luZyB0aGF0IHRoaW5ncyBkbyBub3QgYnJlYWsgd2l0aCBhbiBl
eHRyYSBzbGVlcCBhZnRlcgpzdXNwZW5kaW5nLgoKUmVtb3ZpbmcgdGhhdCBkZWxheSBuZXJmcyB0
aGUgdGVzdCwgeW91IG1heSBhcyB3ZWxsIHNpbXBseSBub3QgcnVuIHRoZQp0ZXN0LgoKSW5zdGVh
ZCBvZiByZW1vdmluZyB0aGUgZGVsYXkgd2UgbmVlZCB0byBiZSByZXBsYWNpbmcgdGhlIGRlbGF5
IHdpdGgKc29tZXRoaW5nIG1vcmUgbGlrZWx5IHRvIHRyaWdnZXIgYSBidWcsIG9yIGp1c3QgcmVt
b3ZlIHRoZSB0ZXN0IGFzIHdlCmJlbGlldmUgaXQgcHJvdmlkZXMgbm8gZXh0cmEgY292ZXJhZ2Uu
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
