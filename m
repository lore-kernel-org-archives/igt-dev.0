Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEE46E1EC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2020 14:09:30 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200526081451.2045-3-zbigniew.kempczynski@intel.com>
References: <20200526081451.2045-1-zbigniew.kempczynski@intel.com>
 <20200526081451.2045-3-zbigniew.kempczynski@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159050216635.30979.10748967952113074344@build.alporthouse.com>
Date: Tue, 26 May 2020 15:09:26 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] lib/media_fill: Migrate gen11 media
 pipeline creation to intel_bb
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
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDUtMjYgMDk6MTQ6NDgpCj4gRnVu
Y3Rpb24gaXMgbm93IGxpYmRybS1mcmVlLCBidXQgbWl4ZXMgY2FsbHMgdG8gcmVwbGFjZWQgYW5k
ICJfdjIiCj4gdmVyc2lvbnMuIFRoaXMgY2xlYW51cCBhbmQgb2xkIGNvZGUgcmVtb3ZhbCB3aWxs
IGJlIGFkZHJlc3NlZAo+IGluIHRoZSBhbm90aGVyIGNvbW1pdC4KCkkgc3F1YXNoZWQgdG9nZXRo
ZXIgIzIsIzMsIzQgc28gd2UgZG9uJ3QgYnJlYWsgdGhlIGJ1aWxkIG1pZC1zZXJpZXMgYW5kCnB1
c2hlZC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
