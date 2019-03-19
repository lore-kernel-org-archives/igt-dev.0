Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205EF891B4
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2019 10:26:31 +0000 (UTC)
Date: Tue, 19 Mar 2019 12:26:28 +0200
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20190319102628.GB1135@intel.intel>
References: <20190318232812.1307-1-andi.shyti@intel.com>
 <20190318232812.1307-7-andi.shyti@intel.com>
 <def420a9-6290-20b7-060a-17d20d54ebc8@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <def420a9-6290-20b7-060a-17d20d54ebc8@linux.intel.com>
Subject: Re: [igt-dev] [PATCH v12 6/7] lib/igt_gt: use
 for_each_engine_class_instance to loop through active engines
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgVHZydGtvLAoKPiA+IC0JZm9yX2VhY2hfZW5naW5lX2NsYXNzX2luc3RhbmNlKGdlbV9mZCwg
ZV8pIHsKPiA+ICsJZm9yX2VhY2hfZW5naW5lX2NsYXNzX2luc3RhbmNlKGdlbV9mZCwgMCwgZV8p
IHsKPiAKPiBIb3cgbXVjaCBjaHVybiBpdCB3b3VsZCBiZSB0byBkcm9wIGZvcl9lYWNoX2VuZ2lu
ZV9jbGFzc19pbnN0YW5jZSBhbmQKPiBjb252ZXJ0IHRoZSBmb3JfZWFjaF9lbmdpbmVfcGh5c2lj
YWwgbWFjcm8gdG8gdXNlIHRoZSBuZXcgc2NoZW1lPwo+IAo+IEkgYW0gdGhpbmtpbmcgYWJvdXQg
ZW5kaW5nIHdpdGggdHdvIG1hY3JvczoKPiAKPiBmb3JfZWFjaF9lbmdpbmVfcGh5c2ljYWwoZmQs
IGUpIC8vIG9yIG5vdCBlLCBpZiBpdCBpcyBpbiB0aGUgaXRlcmF0b3I/Cj4gCj4gZm9yX2VhY2hf
ZW5naW5lX2NvbnRleHQoZmQsIGN0eCwgZSkgLy8gd2hlbiB0ZXN0cyBhcmUgdXNpbmcgY29udGV4
dHMKPiAKPiBUaGUgZm9ybWVyIHdvdWxkIGp1c3QgYmU6Cj4gCj4gI2RlZmluZSBmb3JfZWFjaF9l
bmdpbmVfcGh5c2ljYWwoZmQpIGZvcl9lYWNoX2VuZ2luZV9jb250ZXh0KGZkLCAwKQo+IAo+IENo
cmlzIHlvdXIgb3Bpbmlvbj8KCldlJ3ZlIGJlZW4gZGlzY3Vzc2luZyB0aGlzLCB0aGlzIGlzIHdo
YXQgSSBzdWdnZXN0ZWQgb2ZmbGluZSA6KQoKTWF5YmUgSSB3YXNuJ3QgY2xlYXIgdGhlbiA6KQoK
QnV0IHllcywgSSBkZWZpbml0ZWx5IGFncmVlLgoKQW5kaQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
