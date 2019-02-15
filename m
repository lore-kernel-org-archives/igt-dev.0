Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42B16E09E
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 12:33:42 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190215004901.29158-1-antonio.argenziano@intel.com>
References: <20190215004901.29158-1-antonio.argenziano@intel.com>
Message-ID: <155023401407.19733.5462184837059514024@skylake-alporthouse-com>
Date: Fri, 15 Feb 2019 12:33:34 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/i915/gem_exec_schedule.c:
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

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMTUgMDA6NDk6MDEpCj4gQEAgLTky
Myw3ICs5MjEsNyBAQCBzdGF0aWMgdm9pZCB3aWRlKGludCBmZCwgdW5zaWduZWQgcmluZykKPiAg
ICAgICAgIElHVF9DT1JLX0hBTkRMRShjb3JrKTsKPiAgICAgICAgIHVpbnQzMl90IHBsdWc7Cj4g
ICAgICAgICB1aW50MzJfdCByZXN1bHQ7Cj4gLSAgICAgICB1aW50MzJfdCAqcHRyOwo+ICsgICAg
ICAgdWludDMyX3QgcmVzdWx0X3JlYWRbNCpNQVhfQ09OVEVYVFNdOwoKT2gsIGRpZG4ndCBzcG90
IHRoaXMgdW50aWwgQ0kuCnVpbnQzMl90IHJlc3VsdF9yZWFkW01BWF9DT05URVhUU10KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
