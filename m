Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F62589F24
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Apr 2018 16:11:06 +0000 (UTC)
References: <20180410122043.22021-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <0f92bbea-b528-5b58-1ada-27ccc305e178@intel.com>
Date: Tue, 10 Apr 2018 09:00:52 -0700
MIME-Version: 1.0
In-Reply-To: <20180410122043.22021-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH igt] lib: Dump meminfo and slabinfo if we
 complain about insufficient memory
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAxMC8wNC8xOCAwNToyMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEFsbCB0b28gZnJlcXVl
bnRseSwgd2UgZmFpbCBvdXIgbWVtb3J5IGNoZWNrcyB0byBhIGxlYWsgaW4gdGhlIGRyaXZlci4K
PiBXaGlsZSB3ZSBnaXZlIGV2ZXJ5IG9wcG9ydHVuaXR5IGZvciB0aGUgZHJpdmVyIHRvIHJlbGVh
c2UgdGhlIG1lbW9yeQo+IGJlZm9yZSB3ZSBmYWlsLCBpZiB3ZSBkbyBkdW1wIHRoZSBtZW1pbmZv
IGFuZCBzbGFiaW5mbywgaWYgYXZhaWxhYmxlLCBzbwo+IHdlIGNhbiBhc3NpZ24gYmxhbWVeV15X
IHJlc29sdmUgdGhlIHByb2JsZW0gcXVpY2tseS4KPiAKPiBSZWZlcmVuY2VzOiBodHRwczovL2J1
Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDU5NjcKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogTWFydGluIFBl
cmVzIDxtYXJ0aW4ucGVyZXNAbGludXguaW50ZWwuY29tPgo+IENjOiBUb21pIFNhcnZlbGEgPHRv
bWkucC5zYXJ2ZWxhQGludGVsLmNvbT4KPiAtLS0KPiAgIGxpYi9pbnRlbF9vcy5jIHwgMjggKysr
KysrKysrKysrKysrKysrKysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9vcy5jIGIv
bGliL2ludGVsX29zLmMKPiBpbmRleCBiYjJjMTZiZi4uZjBmMjg3MmIgMTAwNjQ0Cj4gLS0tIGEv
bGliL2ludGVsX29zLmMKPiArKysgYi9saWIvaW50ZWxfb3MuYwo+IEBAIC01MSw2ICs1MSw3IEBA
Cj4gICAjaW5jbHVkZSAiZHJtdGVzdC5oIgo+ICAgI2luY2x1ZGUgImlndF9hdXguaCIKPiAgICNp
bmNsdWRlICJpZ3RfZGVidWdmcy5oIgo+ICsjaW5jbHVkZSAiaWd0X3N5c2ZzLmgiCj4gICAKPiAg
IC8qKgo+ICAgICogaW50ZWxfZ2V0X3RvdGFsX3JhbV9tYjoKPiBAQCAtMjgwLDkgKzI4MSwzMiBA
QCBpbnQgX19pbnRlbF9jaGVja19tZW1vcnkodWludDY0X3QgY291bnQsIHVpbnQ2NF90IHNpemUs
IHVuc2lnbmVkIG1vZGUsCj4gICB2b2lkIGludGVsX3JlcXVpcmVfbWVtb3J5KHVpbnQ2NF90IGNv
dW50LCB1aW50NjRfdCBzaXplLCB1bnNpZ25lZCBtb2RlKQo+ICAgewo+ICAgCXVpbnQ2NF90IHJl
cXVpcmVkLCB0b3RhbDsKPiArCWJvb2wgc3VmZmljaWVudF9tZW1vcnk7Cj4gKwo+ICsJc3VmZmlj
aWVudF9tZW1vcnkgPSBfX2ludGVsX2NoZWNrX21lbW9yeShjb3VudCwgc2l6ZSwgbW9kZSwKPiAr
CQkJCQkJICZyZXF1aXJlZCwgJnRvdGFsKTsKPiArCWlmICghc3VmZmljaWVudF9tZW1vcnkpIHsK
PiArCQlpbnQgZGlyID0gb3BlbigiL3Byb2MiLCBPX1JET05MWSk7CgpObyBlYXJseSBleGl0IG9u
IGRpciA8IDA/CgpMR1RNLgpSZXZpZXdlZC1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlv
LmFyZ2Vuemlhbm9AaW50ZWwuY29tPgoKVGhhbmtzLApBbnRvbmlvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
