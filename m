Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61BD89271
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2019 09:08:25 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190513175613.2507-5-andi.shyti@intel.com>
References: <20190513175613.2507-1-andi.shyti@intel.com>
 <20190513175613.2507-5-andi.shyti@intel.com>
Message-ID: <155782487795.2525.16323516297882838434@skylake-alporthouse-com>
Date: Tue, 14 May 2019 10:07:57 +0100
Subject: Re: [igt-dev] [PATCH v24 04/14] lib: igt_gt: make
 gem_engine_can_store_dword() check engine class
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
To: Andi Shyti <andi.shyti@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTA1LTEzIDE4OjU2OjAzKQo+IC1ib29sIGdlbV9jYW5f
c3RvcmVfZHdvcmQoaW50IGZkLCB1bnNpZ25lZCBpbnQgZW5naW5lKQo+ICtib29sIGdlbV9jbGFz
c19jYW5fc3RvcmVfZHdvcmQoaW50IGZkLCBpbnQgY2xhc3MpCj4gIHsKPiAgICAgICAgIHVpbnQx
Nl90IGRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChmZCk7Cj4gICAgICAgICBjb25zdCBzdHJ1
Y3QgaW50ZWxfZGV2aWNlX2luZm8gKmluZm8gPSBpbnRlbF9nZXRfZGV2aWNlX2luZm8oZGV2aWQp
Owo+IEBAIC01NjksOCArNTY5LDggQEAgYm9vbCBnZW1fY2FuX3N0b3JlX2R3b3JkKGludCBmZCwg
dW5zaWduZWQgaW50IGVuZ2luZSkKPiAgICAgICAgIGlmIChnZW4gPT0gMyAmJiAoaW5mby0+aXNf
Z3JhbnRzZGFsZSB8fCBpbmZvLT5pc19hbHZpc28pKQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
ZmFsc2U7IC8qIG9ubHkgc3VwcG9ydHMgcGh5c2ljYWwgYWRkcmVzc2VzICovCj4gIAo+IC0gICAg
ICAgaWYgKGdlbiA9PSA2ICYmICgoZW5naW5lICYgMHgzZikgPT0gSTkxNV9FWEVDX0JTRCkpCj4g
LSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsgLyoga2lsbHMgdGhlIG1hY2hpbmUhICovCj4g
KyAgICAgICBpZiAoZ2VuID09IDYgJiYgY2xhc3MgPT0gSTkxNV9FTkdJTkVfQ0xBU1NfVklERU8p
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKClByb2JhYmx5IHdpc2UgdG8ga2VlcCB0
aGUgbm90ZSBhYm91dCB3aHkgaXQgaXMgZXhjbHVkZWQuIEl0J3MgYSBuYXN0eQpzdXJwcmlzZS4K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
