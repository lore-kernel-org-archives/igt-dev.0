Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <153726492429.19296.3734650525652684233@skylake-alporthouse-com>
References: <20180917154619.30261-1-tvrtko.ursulin@linux.intel.com>
 <153719954742.19296.6666097501238302005@skylake-alporthouse-com>
 <3bc8b968-c8ac-487b-7130-0a691e0f1207@linux.intel.com>
 <153726384414.19296.7091957707742223128@skylake-alporthouse-com>
 <39d53250-7e14-91e4-cfa9-bec9bffd4d75@linux.intel.com>
 <153726492429.19296.3734650525652684233@skylake-alporthouse-com>
Message-ID: <153726500314.19296.6319588187438136083@skylake-alporthouse-com>
Date: Tue, 18 Sep 2018 11:03:23 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/2] tests/gem_ctx_bad_exec:
 Consolidate to gem_ctx_exec
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDktMTggMTE6MDI6MDkpCj4gUXVvdGluZyBUdnJ0
a28gVXJzdWxpbiAoMjAxOC0wOS0xOCAxMDo1OToxMSkKPiA+IAo+ID4gT24gMTgvMDkvMjAxOCAx
MDo0NCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gPiBRdW90aW5nIFR2cnRrbyBVcnN1bGluICgy
MDE4LTA5LTE4IDEwOjM4OjQ0KQo+ID4gPj4gQ2FuIEkgc2F5IGl0IGlzIHRlc3RpbmcgdGhlIGk5
MTVfZXhlY2J1ZmZlcjJfc2V0X2NvbnRleHRfaWQgYXMgd2VsbCBieQo+ID4gPj4ga25vd2luZyB1
bmRlcmx5aW5nIEFCSSBmaWVsZCBpcyA2NC1iaXQgd2lkZSBhbmQga2VlcCB0aGUgci1iPyAoTm8g
dHJhc2gKPiA+ID4+IGluIHVudXNlZCBwYXJ0IG9mIHJzdmQxLikKPiA+ID4gCj4gPiA+IFRoZSBm
aWVsZCBpc24ndCA2NC1iaXQgd2lkZSwgc28gdGhlIHRlc3Qgd291bGQgYmUgbWlzbGVhZGluZyB1
bmZvcnR1bmF0ZWx5Lgo+ID4gCj4gPiByc3ZkMT8gSXQgaXMgNjQtYml0IGluIGk5MTVfZHJtLmgg
SSBhbSBsb29raW5nIGF0LiBBbmQgQUJJIGlzIGZyZWUgdG8gCj4gPiBzZXQgaXQgZGlyZWN0bHku
Cj4gPiAKPiA+IEJ1dCB0cnVlLCBpdCBzZWVtcyB3ZSBhcmUgbm90IGNoZWNraW5nIGZvciB0cmFz
aCBpbiB1cHBlciAzMi1iaXRzIGluIAo+ID4gZXhlY2J1ZiBwYXRocy4uIDooCj4gPiAKPiA+IFNv
IHRoaXMgbWVhbnMgcmVnYXJkbGVzcyBvZiB3aGF0IGhlbHBlciBkb2VzIHRoZSBBQkkgaXMgYWN0
dWFsbHkgNjQtYml0LiAKPiA+IFNvIHRlc3Qgc2hvdWxkIGFjdHVhbGx5IGJ5cGFzcyB0aGUgaGVs
cGVyIEkgdGhpbmsgYW5kIHNldCByc3ZkMSBkaXJlY3RseSAKPiA+IEkgdGhpbmsuIEFuZCBrZWVw
IHRoZSA2NC1iaXQgaW52YWxpZCB2YWx1ZXMuCj4gCj4gV2UgYXJlIG5vdCBjaGVja2luZyA2NGIu
IFRoaW5rIG9mIG9uZSB2YWx1ZSB0aGF0IGludmFsaWRhdGVzIHRoZSB0ZXN0LgoKV2UgY2FuIGNv
bnN0cnVjdCBtb3JlIHZhbHVlcyB0aGF0IHdvdWxkIGZhaWwgaWYgd2UgY3JlYXRlIGEgZmV3IGNv
bnRleHRzCmFuZCBkZXN0cm95IHRoZW0gdGVzdGluZyB0aGF0IHRoYXQgYXJlIGludmFsaWQgYWZ0
ZXIgdXNlLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
