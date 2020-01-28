Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869776ED42
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 09:26:30 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200128092204.GA11349@zkempczy-desk.igk.intel.com>
References: <20200128090022.10547-1-zbigniew.kempczynski@intel.com>
 <158020271085.525.13300871984135519604@skylake-alporthouse-com>
 <20200128092204.GA11349@zkempczy-desk.igk.intel.com>
Message-ID: <158020358466.525.12722593605355564106@skylake-alporthouse-com>
Date: Tue, 28 Jan 2020 09:26:24 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_tiled_wc: skip on
 platforms without GGTT
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDEtMjggMDk6MjI6MDQpCj4gT24g
VHVlLCBKYW4gMjgsIDIwMjAgYXQgMDk6MTE6NTBBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3Rl
Ogo+ID4gUXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDEtMjggMDk6MDA6MjIp
Cj4gPiA+IE9uIHBsYXRmb3JtcyB3aXRob3V0IGFwZXJ0dXJlIGVuc3VyZSB0ZXN0IGlzIHNraXBw
ZWQuIExvY2FsaXplCj4gPiA+IEdFTV9NTUFQIGlvY3RsKCkgdG8gbWFrZSBzdXJlIHRoaXMgaW50
ZXJmYWNlIGlzIHRlc3RlZC4KPiA+IAo+ID4gQWN0dWFsbHkgdGhpcyB3b3VsZCBiZSBvayB3aXRo
IGRldmljZSBjb2hlcmVudC4gTm90IHN1cmUgaWYgaXQncwo+ID4gcmVsZXZhbnQuLi4gWW91IGNv
dWxkIGNlcnRhaW5seSB3cml0ZSB0aGUgZXF1aXZhbGVudCBmb3IgbW1hcF9vZmZzZXQsCj4gPiB0
aGF0IGlzIHRoZSBHVFQgcGF0aCB0YWtlcyB0aGUgZmVuY2UsIGFuZCB0aGUgb3RoZXJzIGRvIG5v
dC4KPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWdu
aWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KPiA+ID4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gCj4gPiBJIHdvdWxkIG1vdmUgdGhpcyBpbnRvIGdlbV9t
bWFwX3djIGp1c3QgdG8gbWFrZSBpdCBtb3JlIHNlbGYtY29udGFpbmVkLAo+ID4gaWd0X3N1YnRl
c3QoInRpbGVkIikuCj4gCj4gWW91IHRoaW5rIGp1c3QgdG8gcmVtb3ZlIHRoaXMgdGVzdCBhZnRl
ciBtaWdyYXRpbmcgdG8gZ2VtX21tYXBfd2M/IAoKSSB0aGluayB0aGlzIHdvdWxkIG1ha2UgYSB2
YWxpZCBzdWJ0ZXN0IGZvciBnZW1fbW1hcF93Yy5jIChyZXBsYWNpbmcgdGhpcwouYykgYW5kIGFs
c28gYXBwbGllcyB0byBnZW1fbW1hcF9vZmZzZXQuYwoKPiBPbmx5IGNvbnMgSSBzZWUgbm93IGlz
IHRoYXQgd2UgZG9uJ3Qgc3VwcG9ydCBvZmZzZXQgaW4gZ2VtX21tYXBfb2Zmc2V0X193YygpCj4g
c28gSSB3b3VsZCBkZWZlciBpdCB3aGVuIHRoaXMgYXJndW1lbnQgd2lsbCBiZSBoYW5kbGVkLgoK
VGhhdCdzIG5vdCBhIGh1Z2UgZGVhbCB3cnQgdG8gdGhlIHRlc3QsIGFsbCBpdCBpcyBkb2luZyBp
cyB2ZXJpZnlpbmcKdGhhdCBldmVuIHRob3VnaCB0aGUgb2JqZWN0IGhhcyBhIHRpbGluZywgdGhl
IFdDL1dCL1VDIHZpZXdzIGFyZSB1bnRpbGVkCndoZXJlYXMgR1RUIGlzLgotQ2hyaXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
