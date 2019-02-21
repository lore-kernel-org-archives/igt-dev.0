Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81346892EF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 21:13:47 +0000 (UTC)
References: <20190221192745.31178-1-antonio.argenziano@intel.com>
 <20190221192745.31178-3-antonio.argenziano@intel.com>
 <155077847953.4937.918589523312592932@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <9abe409d-143d-18f7-36be-d9caa73319fb@intel.com>
Date: Thu, 21 Feb 2019 13:13:47 -0800
MIME-Version: 1.0
In-Reply-To: <155077847953.4937.918589523312592932@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC 2/5] lib/ioctl_wrappers: add mmap_offset support
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
Cc: Matthew Auld <matthew.auld@intel.com>, Janulgue Abdiel <abdiel.janulgue@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMS8wMi8xOSAxMTo0NywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTIxIDE5OjI3OjQyKQo+PiBGcm9tOiAiS2FsYW1hcnosIEx1
a2FzeiIgPGx1a2Fzei5rYWxhbWFyekBpbnRlbC5jb20+Cj4+Cj4+IFdpdGggcmVjZW50bHkgcHJv
cG9zZWQgY2hhbmdlcywgSUdUIG5lZWQgdG8gc3RhcnQgc3VwcG9ydGluZyBuZXcKPj4gd2F5IG9m
IG1tYXBpbmcgb2JqZWN0LCB3aGljaCB3aWxsIGJlIHVzZWQgZnJvbSBub3cgYnkgZGVmYXVsdC4K
Pj4gVGhpcyBwYXRjaCBtb2RpZnkgZ2VtX21tYXBfd2MgYW5kIGdlbV9tbWFwIGZ1bmN0aW9ucyB0
byBiZQo+PiBpbiBzeW5jIHdpdGggdGhvc2UgY2hhbmdlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
THVrYXN6IEthbGFtYXJ6IDxsdWthc3oua2FsYW1hcnpAaW50ZWwuY29tPgo+PiBDYzogSmFudWxn
dWUgQWJkaWVsIDxhYmRpZWwuamFudWxndWVAaW50ZWwuY29tPgo+PiBDYzogTWF0dGhldyBBdWxk
IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgo+PiBDYzogTWljaGFsIFdpbmlhcnNraSA8bWljaGFs
LndpbmlhcnNraUBpbnRlbC5jb20+Cj4+IENjOiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8u
YXJnZW56aWFub0BpbnRlbC5jb20+Cj4+IENjOiBEYW5pZWxlIFNwdXJpbyBDZXJhb2xvIDxkYW5p
ZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPgo+PiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29u
YXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgo+PiAtLS0KPj4gICBsaWIvaW9jdGxfd3JhcHBl
cnMuYyB8IDE1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDEyOSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2xpYi9pb2N0bF93cmFwcGVycy5jIGIvbGliL2lvY3RsX3dyYXBwZXJz
LmMKPj4gaW5kZXggNDA0YzJmYmYuLmQ5YjQ2MDg4IDEwMDY0NAo+PiAtLS0gYS9saWIvaW9jdGxf
d3JhcHBlcnMuYwo+PiArKysgYi9saWIvaW9jdGxfd3JhcHBlcnMuYwo+PiBAQCAtNjQxLDYgKzY0
MSwyNCBAQCB2b2lkIGdlbV9leGVjYnVmX3dyKGludCBmZCwgc3RydWN0IGRybV9pOTE1X2dlbV9l
eGVjYnVmZmVyMiAqZXhlY2J1ZikKPj4gICAgICAgICAgaWd0X2Fzc2VydF9lcShfX2dlbV9leGVj
YnVmX3dyKGZkLCBleGVjYnVmKSwgMCk7Cj4+ICAgfQo+PiAgIAo+PiArc3RhdGljIGJvb2wgaGFz
X21tYXBfb2Zmc2V0KGludCBmZCkKPj4gK3sKPj4gKyAgICAgICBzdGF0aWMgaW50IGhhc19tbWFw
X29mZnNldCA9IC0xOwo+IAo+IGEpIG5vdGhpbmcgbmV3IGluIGlvY3RsX3dyYXBwZXJzLCBwbGVh
c2UKCmk5MTUvZ2VtX21tYXAuYz8KCkFudG9uaW8KCj4gCj4gYikgZG8gbm90IHJlcGVhdCB0aGUg
bWlzdGFrZXMgb2YgdXNpbmcgc3RhdGljLCBhc3N1bWluZyBhbGwgZmQgYXJlIHRoZQo+IHNhbWUu
IEp1c3QgZG9uJ3QgY2FsbCBoYXNfbW1hcF9vZmZzZXQoKSBtb3JlIHRoYW4gaXMgc3RyaWN0bHkg
cmVxdWlyZWQuCj4gLUNocmlzCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
