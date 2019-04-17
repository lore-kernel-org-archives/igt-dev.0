Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1F16E078
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2019 16:40:44 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <a0de5a71-e513-0e8c-a1ed-3a7571bd1275@linux.intel.com>
References: <20190416151128.2465-1-andi.shyti@intel.com>
 <20190416151128.2465-6-andi.shyti@intel.com>
 <030e2dba-1dd8-da25-2dd7-e2a7cdd6ad87@intel.com>
 <a0de5a71-e513-0e8c-a1ed-3a7571bd1275@linux.intel.com>
Message-ID: <155551808147.25904.958785807683888289@skylake-alporthouse-com>
Date: Wed, 17 Apr 2019 17:21:21 +0100
Subject: Re: [igt-dev] [PATCH v21 5/6] lib: igt_dummyload: use
 for_each_context_engine()
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
To: Andi Shyti <andi.shyti@intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNC0xNyAxNzoxNDo0NSkKPiBTbyB3aGF0IHRv
IGRvIHRvIHByZXNlcnZlIGNvbXBhdGliaWxpdHkgd2l0aCBlYi5mbGFncyBhbmQgbm90IG1lc3Mg
dXAgCj4gdGhlIGNvbnRleHQgaW4gaGVyZS4uIHVzZSB0aGUgc3RhdGljIGl0ZXJhdG9yIGZvciBj
b250ZXh0cyB3by8gbWFwcyBhbmQgCj4gbGVnYWN5IGViPyBCdXQgd2hhdCBkb2VzIEFMTF9FTkdJ
TkVTIG1lYW4gdGhlbj8gUGhhc2Ugb3V0IEFMTF9FTkdJTkVTIAo+IHN1cHBvcnQgaW4gc3BpbiBi
YXRjaD8gTmVlZHMgYW4gYXVkaXQgb2YgaG93IG1hbnkgY2FsbCBzaXRlcyB3ZSBoYXZlIGFuZCAK
PiBob3cgZG8gdGhleSBsb29rLgoKQWN0dWFsbHksIHdlJ3ZlXkkndmUgb3Blbi1jb2RlZCBzZXZl
cmFsIGNhbGxzaXRlIHRoYXQgY291bGQgZG8gd2l0aCAKQUxMX0VOR0lORVMuIEFuZCBJIHRoaW5r
IHRoYXQncyBhIGdvb2QgdGhpbmcgLS0gYXMgdGhlIHNldHVwIHJlcXVpcmVzIGEKYml0IG9mIGZp
bmVzc2UgYW5kIHJlc3VibWl0dGluZyB0aGUgc3BpbiBiYXRjaCB3b3JrcyBxdWl0ZSB3ZWxsLiBO
bwpkb3VidCBzb21lb25lIGVsc2Ugd2lsbCBiZSB0ZW1wdGVkIHRvIHJlZmFjdG9yLgotQ2hyaXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
