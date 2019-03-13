Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6B989DAB
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 20:41:15 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190313201635.20748-1-nischala.yelchuri@intel.com>
References: <20190307024444.42432-1-nischala.yelchuri@intel.com>
 <20190313201635.20748-1-nischala.yelchuri@intel.com>
Message-ID: <155250966026.30003.10001053991628825793@skylake-alporthouse-com>
Date: Wed, 13 Mar 2019 20:41:05 +0000
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: Fix assertion
 failure due to vblank mismatch
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
To: Nischala Yelchuri <nischala.yelchuri@intel.com>, igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBOaXNjaGFsYSBZZWxjaHVyaSAoMjAxOS0wMy0xMyAyMDoxNjozNSkKPiBGb3IgdGhl
ICFtb2Rlc2V0IGNhc2UsIGFmdGVyIGEgcGFnZWZsaXAgaXMgcGVyZm9ybWVkIG9uIGJvdGggY3J0
YydzLAo+IHZibGFuayBjb3VudGVyIGlzIGFkdmFuY2VkIGJ5IDEgd2hlbiBjb21wYXJlZCB0byBp
dHMgb3JpZ2luYWwgdmFsdWUuCj4gCj4gRm9yIHRoZSBtb2Rlc2V0IGNhc2UsIHdoZW4gcGFnZWZs
aXBzIGFuZCBtb2Rlc2V0cyBhcmUgaW50ZXJsZWF2ZWQsCj4gdmJsYW5rIGNvdW50ZXIgZG9lcyBu
b3QgYWx3YXlzIGFkdmFuY2UgYnkgMSBhcyBub25ibG9ja2luZyBtb2Rlc2V0Cj4gY291bGQgZmFp
bCwgaW4gd2hpY2ggY2FzZSB3ZSBkbyBub3QgbmVlZCB2YmxhbmtfbWF0Y2hlcy4KCkhhdmluZyBh
Y2tub3dsZWRnZWQgdGhlIGJ1ZywgdHJ5IGZpeGluZyBpdC4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
