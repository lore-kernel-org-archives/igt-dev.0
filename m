Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8236E053
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 00:34:30 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190215002910.7675-1-antonio.argenziano@intel.com>
References: <20190215002910.7675-1-antonio.argenziano@intel.com>
Message-ID: <155019085922.25941.6672130325715249412@skylake-alporthouse-com>
Date: Fri, 15 Feb 2019 00:34:19 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/i915/gem_exec_schedule.c:
 Switch to gem_sync and gem_read
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMTUgMDA6Mjk6MTApCj4gK3N0YXRp
YyBpbmxpbmUKPiArdm9pZCBfX3N5bmNfcmVhZF91MzJfY291bnQoaW50IGZkLCB1aW50MzJfdCBo
YW5kbGUsIHVpbnQzMl90ICpkc3QsIHVpbnQ2NF90IHNpemUpCgpTb21lIGNhbGxlcnMgYXJlIHBh
c3NpbmcgYnl0ZXMsIHNvbWUgY291bnQuCgo+ICt7Cj4gKyAgICAgICBnZW1fc3luYyhmZCwgaGFu
ZGxlKTsgLyogTm8gd3JpdGUgaGF6YXJkIGxpZXMhICovCj4gKyAgICAgICBnZW1fcmVhZChmZCwg
aGFuZGxlLCAwLCBkc3QsIHNpemUpOwo+ICt9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
