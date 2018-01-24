Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89F56E5AA
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2018 11:08:08 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180124102500.71999-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20180124102500.71999-1-maarten.lankhorst@linux.intel.com>
Message-ID: <151679208421.13096.6619668340989603229@mail.alporthouse.com>
Date: Wed, 24 Jan 2018 11:08:04 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_render: Rewrite test to take
 advantage of igt_display.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNYWFydGVuIExhbmtob3JzdCAoMjAxOC0wMS0yNCAxMDoyNTowMCkKPiBUaGlzIHRl
c3Qgd2FzIHRha2luZyB+MTAwcyBmb3IgZWFjaCBzdWJ0ZXN0LCBhbmQgYm90aCB0ZXN0cyB3ZXJl
IHRoZSBzYW1lLAo+IGJ1dCByZXF1aXJlZCB0aGUgdXNlciB0byBwYXkgYXR0ZW50aW9uLiBJJ3Zl
IGNoYW5nZWQgaXQgdG8gYXV0b21hdGVkCj4gY2hlY2tpbmcgd2l0aCBDUkMsIGFuZCByZW1vdmVk
IHRoZSBzdWJ0ZXN0cy4KCldoYXQgZG8gd2UgZG8gaGVyZSB0aGF0IGlzbid0IGNvdmVyZWQgYnkg
a21zX2Zyb250YnVmZmVyKj8gTXkgZ3Vlc3MKd291bGQgYmUgZG8gc2ltcGxlIHRlc3Rpbmcgb2Yg
bW9yZSBjb25maWd1cmF0aW9ucyAoYXMgb3Bwb3NlZCB0bwprbXNfZnJvbnRidWZmZXIgdGhhdCBk
b2VzIGxvdHMgb2YgZGlmZmVyZW50IGRyYXdpbmcgdG8gdGhlIHNhbWUKY29uZmlndXJhdGlvbiku
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
