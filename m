Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD366E318
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 17:17:10 +0000 (UTC)
Date: Thu, 7 Mar 2019 19:17:06 +0200
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20190307171706.GA8818@intel.intel>
References: <20190305131611.2367-1-andi.shyti@intel.com>
 <20190305131611.2367-5-andi.shyti@intel.com>
 <e39e0cf7-028f-cac5-6aca-72c67bb417b2@linux.intel.com>
 <20190307135426.GD1418@intel.intel>
 <6fba9cb1-9155-1715-22ea-a44aa12cef6f@linux.intel.com>
 <20190307154642.GE1418@intel.intel>
 <13e2091d-9ff4-3f01-95f1-3523aad1e3b2@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13e2091d-9ff4-3f01-95f1-3523aad1e3b2@linux.intel.com>
Subject: Re: [igt-dev] [RFC PATCH v10 4/6] lib: ioctl_wrappers: reach
 engines by index as well
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

PiBJIHVuZGVyc3RhbmQgdGhlIGxvb3AgaXRzZWxmIHdvcmtzLCBidXQgSSB3YW50ZWQgdG8gZmlu
ZCBvdXQgaG93IGRvIEkgd3JpdGUKPiBhIHRlc3Qgd2hpY2ggdXNlcyBpdCBhbmQgYWN0dWFsbHkg
c3VibWl0cyB3b3JrLgo+IAo+IGZvcl9lYWNoX2VuZ2luZTIoZmQsIGN0eCkgewo+IAkuLi4KPiAJ
ZWIuZmxhZ3MgPSA/Pz87Cj4gCWViLnJzdmQxID0gY3R4Owo+IAo+IAlnZW1fZXhlY2J1ZihmZCwg
JmViKTsKPiB9Cj4gCj4gV2hhdCBkbyBJIHJlcGxhY2UgPz8/IHdpdGggc28gdGhlIHRlc3Qgd29y
a3Mgb24gb2xkIGFuZCBuZXcga2VybmVscz8KCkkgZ3Vlc3MgaXQgd291bGQgYmU6CgogIGluZGV4
X21hcCA9IDA7CiAgZm9yX2VhY2hfZW5naW5lMihmZCwgY3R4KSB7CiAgICAgIC4uLgogICAgICBl
Yi5mbGFncyA9ICsraW5kZXhfbWFwOwogICAgICBlYi5yc3ZkMSA9IGN0eDsKCiAgICAgIGdlbV9l
eGVjYnVmKGZkLCAmZWIpOwogIH0KCmZvcl9lYWNoX2VuZ2luZTIgaXMganVzdCByZXNwb25zaWJs
ZSBmb3IgaXRlcmF0aW5nIHRocm91Z2gKZW5naW5lcy4gKCopCgp3aGlsZSBmb3IgdGhlIGN1cnJl
bnQgYXBpIGl0IHdvdWxkIGJlOgoKICBmb3JfZWFjaF9lbmdpbmUyKGZkLCAwKSB7CiAgICAgIGVi
LmZsYWdzID0gZ2VtX2NsYXNzX2luc3RhbmNlX3RvX2ViX2ZsYWdzKGZkLCBlMl9fLT5jbGFzcywg
ZTJfXy0+aW5zdGFuY2UpKTsKICAgICAgZWIucnN2ZDEgPSAwOwogIH0KClRoZXJlIGRlZmluaXRl
bHkgYXJlIGJldHRlciB3YXkgZm9yIGRvaW5nIHRoZQpmb3JfZWFjaF9lbmdpbmUoLi4uKSBidXQg
SSB0aGluayB0aGlzIGlzIHRoZSBtb3N0IGNvbnNpc3RlbnQgdG8KdGhlIHdheSB0aGluZ3MgYXJl
IGRvbmUgbm93LgoKSW4gbXkgb3BpbmlvbiwgbmV4dCBzdGVwIHdvdWxkIGJlLCBpbmRlZWQsIHRv
IGdldCByaWQgb2YgYWxsCmxlZ2FjeSBhbmQgaGF2ZSBhIHNpbmdsZSBmb3JfZWFjaF9lbmdpbmUo
Li4uKSB0aGF0IHdvcmtzIHdpdGgKZXZlcnl0aGluZy4KCkJ1dCBmb3IgdGhpcywgYXQgbXkgY3Vy
cmVudCB1bmRlcnN0YW5kaW5nLCB3ZSBuZWVkIHNvbWUKcmUtYXJjaGl0ZWN0dXJpbmcgb2YgaWd0
IChhbmQgcG9zc2libHkgdXNpbmcgZHluYW1pYyBsaXN0cyBvZgplbmdpbmVzIGFzIENocmlzIHBv
aW50ZWQgb3V0KS4KCk9uY2UgdGhpcyBwYXRjaCBnZXRzIGluLCBJIGNhbiBzdGFydCBsb29raW5n
IGF0IHRoZSBuZXh0IHN0ZXBzLApidXQgaW4gb25lIGdvLCB3ZSB3b3VsZCBnZXQgZXZlcnl0aGlu
ZyBpbiBvbmx5IGF0ICJbUEFUQ0ggdjExNzRdIiA6KQoKQW5kaQoKKCopIFNvbWUgZXh0cmEgY29k
ZSB3b3VsZCBiZSByZXF1aXJlZCB0byBpbmNyZW1lbnQgaW5kZXhfbWFwCmludG8gdGhlIGZvcl9l
YWNoX2VuZ2luZTIoKSwgQ2hyaXMgd2FzIHN1Z2dlc3RpbmcsIGluZGVlZCwgYW4KaXRlciBzdHJ1
Y3R1cmUgKG9yIHdlIGNhbiB1c2Ugc29tZSBvdGhlciAnQycgdHJpY2tzIHRoYXQgd291bGQKbWFr
ZSB0aGUgY29kZSBxdWl0ZSB1bnJlYWRhYmxlKS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
