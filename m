Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB8A892E6
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2019 05:37:36 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190425205822.8995-2-daniel.t.mrzyglod@intel.com>
References: <20190425205822.8995-1-daniel.t.mrzyglod@intel.com>
 <20190425205822.8995-2-daniel.t.mrzyglod@intel.com>
Message-ID: <155625704105.3869.2563417705681817213@skylake-alporthouse-com>
Date: Fri, 26 Apr 2019 06:37:21 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/6] lib/igt_device: add
 igt_device_get_pci_addr by fd
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
To: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgTXJ6eWdsb2QgKDIwMTktMDQtMjUgMjE6NTg6MTcpCj4gRnJvbTogTWlj
aGHFgiBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPgo+IAo+IFRoaXMgZnVu
Y3Rpb24gZ2V0IHVzIHBjaSBhZGRyZXNzIGJhc2VkIGJ5IGZkLgo+IEl0IGFsbG93cyB1cyB0byBt
YWtlIHRoaW5ncyBhIGxpdHRsZSBiaXQgbW9yZSBnZW5lcmljLgo+IEFsc28sIHdlIG5vdyByZXF1
aXJlIGZkIHJhdGhlciB0aGFuIGRvaW5nIGd1ZXNzd29yayB3aGVuIGl0IGNvbWVzIHRvIHBjaSBh
ZGRyZXNzLgo+IAo+IHY0OiBjbG9zZSBzeXNmcyBmZAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIg
V2luaWFyc2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIE1yenln
bG9kIDxkYW5pZWwudC5tcnp5Z2xvZEBpbnRlbC5jb20+Cj4gLS0tCj4gZGlmZiAtLWdpdCBhL2xp
Yi9pZ3RfZGV2aWNlLmggYi9saWIvaWd0X2RldmljZS5oCj4gaW5kZXggOWQ3ZGMyYzMuLjg2MGIz
YThhIDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfZGV2aWNlLmgKPiArKysgYi9saWIvaWd0X2Rldmlj
ZS5oCj4gQEAgLTI1LDYgKzI1LDcgQEAKPiAgI2lmbmRlZiBfX0lHVF9ERVZJQ0VfSF9fCj4gICNk
ZWZpbmUgX19JR1RfREVWSUNFX0hfXwo+ICAKPiArI2luY2x1ZGUgPHN0ZGludC5oPgoKTm90IHJl
cXVpcmVkIGZvciBoZWFkZXIgY29tcGlsYXRpb24uCgpCdXQgaXQgd291bGQgYmUgY2xlYXJlciB0
byBkcm9wIGEgc3RydWN0IHBjaV9kZXZpY2UgZm9yd2FyZCBkZWNsIGhlcmUgYXMKd2VsbC4KCj4g
IGludCBfX2lndF9kZXZpY2Vfc2V0X21hc3RlcihpbnQgZmQpOwo+ICB2b2lkIGlndF9kZXZpY2Vf
c2V0X21hc3RlcihpbnQgZmQpOwo+ICAKPiBAQCAtMzIsNSArMzMsNiBAQCBpbnQgX19pZ3RfZGV2
aWNlX2Ryb3BfbWFzdGVyKGludCBmZCk7Cj4gIHZvaWQgaWd0X2RldmljZV9kcm9wX21hc3Rlcihp
bnQgZmQpOwo+ICAKPiAgaW50IGlndF9kZXZpY2VfZ2V0X2NhcmRfaW5kZXgoaW50IGZkKTsKPiAr
c3RydWN0IHBjaV9kZXZpY2UgKmlndF9kZXZpY2VfZ2V0X3BjaV9kZXZpY2UoaW50IGZkKTsKCldp
dGggdGhhdCBuaXQsClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
