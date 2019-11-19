Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA686E075
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:11:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
In-Reply-To: <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
Message-ID: <157416186350.10169.17147049716181579154@skylake-alporthouse-com>
Date: Tue, 19 Nov 2019 11:11:03 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test/i915: gem_exec_parallel: Fix
 for using context engine map
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
To: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWZW5rYXRhIFNhbmRlZXAgRGhhbmFsYWtvdGEgKDIwMTktMTEtMTkgMTE6MDE6MTcp
Cj4gU2luY2UgZW5naW5lcyBhcmUgbm93IGxvb2tlZCB1cCBiYXNlZCBvbiBjb250ZXh0IGVuZ2lu
ZSBtYXAsCj4gY29udGV4dCBzaG91bGQgYmUgc2V0dXAgd2l0aCBlbmdpbmVzIGJlZm9yZSB1c2lu
ZyBpbiBleGVjYnVmLgoKU3RvcCBjaGFuZ2luZyBmdW5kYW1lbnRhbCB0ZXN0cyBvZiBsZWdhY3kg
YmVoYXZpb3VyLiBJZiB5b3Ugd2FudCB0bwpleGVyY2lzZSBuZXcgQVBJLCBkbyBzbyBpbiBwYXJh
bGxlbC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
