Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3645C6E218
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jun 2018 05:53:10 +0000 (UTC)
MIME-Version: 1.0
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <1529507678-6180-1-git-send-email-tomasz.lis@intel.com>
References: <1529507678-6180-1-git-send-email-tomasz.lis@intel.com>
Message-ID: <152956038492.4624.12489203603306133967@jlahtine-desk.ger.corp.intel.com>
Date: Thu, 21 Jun 2018 08:53:05 +0300
Subject: Re: [igt-dev] [PATCH i-g-t v1] Data Port Cache Coherency tests.
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
To: Tomasz Lis <tomasz.lis@intel.com>, igt-dev@lists.freedesktop.org
Cc: bartosz.dunajski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUb21hc3ogTGlzICgyMDE4LTA2LTIwIDE4OjE0OjM4KQo+IFRoaXMgYWRkcyBhIG5l
dyB0ZXN0IGJpbmFyeSwgY29udGFpbmluZyB0ZXN0cyBmb3IgdGhlIERhdGEgUG9ydCBDb2hlcmVu
Y3kKPiBvcHRpb24uIFRoZSB0ZXN0cyBjaGVjayB3aGV0aGVyIHRoZSBvcHRpb24gdmFsdWUgaXMg
c3RvcmVkIHByb3Blcmx5IG9uIHRoZQo+IGtlcm5lbCBzaWRlLCBidXQgYWxzbyB3aGV0aGVyIGlz
IGlzIGNvcnJlY3RseSBzZXQgdG8gcHJvcGVyIEdQVSByZWdpc3Rlci4KCkknbSBmYWlybHkgc3Vy
ZSB0aGVyZSBhbHJlYWR5IHdhcyByZXZpZXcgZmVlZGJhY2sgdGhhdCBzaW1wbHkgY2hlY2tpbmcK
dGhlIHJlZ2lzdGVyIHN0YXRlIGlzIG5vdCBhIGdvb2QgSUdUIHRlc3QuCgpJR1QgdGVzdHMgbWFr
ZSBzdXJlIHRoYXQgd2hhdGV2ZXIgdUFQSSB0aGUga2VybmVsIGhhcywgdGhlIHByb21pc2VkIGVm
ZmVjdHMKb2YgdGhhdCB1QVBJIGRvIG5vdCBnZXQgYnJva2VuLiBBbmQgdGhlIHByb21pc2UgZm9y
IGNhY2hlIGNvaGVyZW5jeSB1QVBJCmZvciBzdXJlbHkgaXNuJ3QgdGhhdCBzb21lIHJlZ2lzdGVy
IHZhbHVlIGdldHMgd3JpdHRlbiwgaXQncyB0aGF0IHRoZQpjYWNoZSBjb2hlcmVuY3kgaXMgdHJh
ZGVkIHdpdGggc29tZSBwZXJmb3JtYW5jZS4gVGhlIGNoaWNrZW4gYml0cyBvciB0aGUKd2hvbGUg
aW1wbGVtZW50YXRpb24gb2YgdGhlIGZlYXR1cmUgbWlnaHQgYmUgdHVybmVkIHVwc2lkZSBkb3du
LCBidXQgYXMKbG9uZyBhcyB0aGUgdXNlcnNwYWNlIGlzIHN0aWxsIHdvcmtpbmcsIHVzZXJzcGFj
ZSBzaG91bGQgbm90IGNhcmUuCgpTbyB0aGUgY2hpY2tlbiBiaXQgc2V0dGluZyBzaG91bGQgYmUg
c2NyYXBwZWQsIGFuZCBhY3R1YWwgY2FjaGUKY29oZXJlbmN5IG9ic2VydmVkLiBJdCBtaWdodCBi
ZSBhIHdvcnRoeSBrZXJuZWwgc2VsZnRlc3QgdGhhdCByZWdpc3Rlcgp3cml0ZXMgc3RpY2sgYW5k
IHJlbWFpbiBvdmVyIHNsZWVwIHN0YXRlcyBhcyBhIGdlbmVyaWMgdGhpbmcsIGJ1dCBub3QKaGVy
ZS4KCklmIHlvdSBkb24ndCBhZGRyZXNzIHRoZSBmZWVkYmFjayBnaXZlbiwgYnV0IGhhbW1lciB0
aGUgbWFpbGluZyBsaXN0CndpdGhvdXQgYWRkcmVzc2luZyBpdCwgZG9uJ3QgZXhwZWN0IGZ1cnRo
ZXIgZmVlZGJhY2suCgpSZWdhcmRzLCBKb29uYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
