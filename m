Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F546E2CB
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 13:13:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190307130130.6473-1-petri.latvala@intel.com>
References: <20190307112427.29146-5-petri.latvala@intel.com>
 <20190307130130.6473-1-petri.latvala@intel.com>
Message-ID: <155196439839.27405.1026874166212912543@skylake-alporthouse-com>
Date: Thu, 07 Mar 2019 13:13:18 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/5] lib/igt_pm: Avoid out-of-bounds
 reads and writes
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTAzLTA3IDEzOjAxOjMwKQo+IFJlYWQgc2l6ZW9m
IC0gMSB0byBidWZmZXJzIHNvIG51bGwtdGVybWluYXRpb24gc3RheXMgaW4gYm91bmRzLgo+IAo+
IHYyOiBBbHNvIGNsZWFyIHRoZSBidWZmZXJzIGJlZm9yZSByZXVzaW5nIChDaHJpcykuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4g
Q2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKVGhhdCdzIGV2ZXJ5
dGhpbmcgSSBzcG90dGVkIHNvClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
