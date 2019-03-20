Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB35289D00
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 10:33:45 +0000 (UTC)
References: <20190319234441.1449-1-andi.shyti@intel.com>
 <20190319234441.1449-8-andi.shyti@intel.com>
 <fefbaf78-9a42-b449-3676-92c6ac99dcbc@linux.intel.com>
 <155307658058.8718.6756951288202495614@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <435bfc2f-0c8c-ff95-7c02-1c3e96fdfbc1@linux.intel.com>
Date: Wed, 20 Mar 2019 10:33:43 +0000
MIME-Version: 1.0
In-Reply-To: <155307658058.8718.6756951288202495614@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v13 7/9] lib/igt_gt: use
 for_each_engine_class_instance to loop through active engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi.shyti@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDIwLzAzLzIwMTkgMTA6MDksIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTAzLTIwIDEwOjA0OjUwKQo+Pgo+PiBPbiAxOS8wMy8yMDE5IDIzOjQ0
LCBBbmRpIFNoeXRpIHdyb3RlOgo+PiBJZiB5b3UgZG8gdGhpcywgYW5kIGFsc28gYWRkIHZjczIg
dG8gdGhlIHN0YXRpYyB0YWJsZSBpbiB0aGlzIHNlcmllcywKPiAKPiBDYW4gd2UgZ2l2ZSB0aGUg
c3RhdGljIHRhYmxlIGV2ZXJ5IGNsYXNzIHdpdGggdXAgdG8gTUFYX0lOU1RBTkNFXjI/Cj4gU2hv
dGd1biBhcHByb2FjaC4KClByb2JsZW0gaXMgdGVzdCBlbnVtZXJhdGlvbiBpcyBkcml2ZW4gb2Yg
aXQgYW5kIHdlIGFyZSBub3QgYWxsb3dlZCB0byAKYWNjZXNzIHRoZSBkZXZpY2UgaW4gdGhhdCBw
aGFzZS4gQW5kIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBlbnVtZXJhdGUgCmEgZ2F6aWxsaW9u
IG9mIHN1YnRlc3RzIGp1c3QgdG8gbWFrZSB0aGUgc3RhdGljIHRhYmxlIGZ1dHVyZSBwcm9vZi4K
ClNvIEkgd2FzIHRoaW5raW5nIEFuZGkgd291bGQgYmUgYWRkaW5nIGFuIGFzc2VydCBpbiB0aGUg
Y29kZSB3aGljaCAKYm9ycm93cyB0aGUgbmFtZSBmcm9tIHRoZSBzdGF0aWMgdGFibGUgc28gd2Ug
bm90aWNlIGl0IG5lZWRzIHRvIGJlIApleHBhbmRlZCBmb3IgbmV3IGVuZ2luZXMuCgpSZWdhcmRz
LAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
