Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D486E15D
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Oct 2018 13:07:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id x31-v6so4967312edd.8
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Oct 2018 06:07:24 -0700 (PDT)
Date: Wed, 24 Oct 2018 15:07:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181024130720.GQ324@phenom.ffwll.local>
References: <20181024130004.12770-1-arkadiusz.hiler@intel.com>
 <20181024130004.12770-2-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181024130004.12770-2-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] gitlab-ci: Compile using autotools
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjQsIDIwMTggYXQgMDQ6MDA6MDJQTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IExldCdzIG1ha2Ugc3VyZSB0aGF0IElHVCBjb21waWxlcyB3aXRoIGF1dG90b29s
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBp
bnRlbC5jb20+CgpTaG91bGQgd2UgYWxzbyB0ZXN0IGF1dG90b29scyB0ZXN0cywgYW5kIGRpc3Rj
aGVjaz8gVGhhdCBzdHVmZiB0ZW5kcyB0bwpicmVhaywgdW50aWwgc29tZW9uZSBuZWVkcyB0byBj
dXQgYSByZWxlYXNlIGFnYWluIDotKQoKU2ltaWxhciBJIGd1ZXNzIGZvciBtZXNvbi4KCkp1c3Qg
YW4gYXNpZGUsIHBhdGNoIGl0c2VsZiBsb29rcyBmaW5lLgotRGFuaWVsCgo+IC0tLQo+ICAuZ2l0
bGFiLWNpLnltbCAgICB8IDcgKysrKysrKwo+ICBEb2NrZXJmaWxlLmRlYmlhbiB8IDggKysrKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
Ly5naXRsYWItY2kueW1sIGIvLmdpdGxhYi1jaS55bWwKPiBpbmRleCAwMzBiMzQwNS4uMzk0Y2Q4
NmQgMTAwNjQ0Cj4gLS0tIGEvLmdpdGxhYi1jaS55bWwKPiArKysgYi8uZ2l0bGFiLWNpLnltbAo+
IEBAIC0zMyw2ICszMywxMyBAQCBidWlsZDp0ZXN0cy1kZWJpYW46Cj4gICAgICAtIG1lc29uICRN
RVNPTl9PUFRJT05TIGJ1aWxkCj4gICAgICAtIG5pbmphIC1DIGJ1aWxkCj4gIAo+ICtidWlsZDp0
ZXN0cy1kZWJpYW4tYXV0b3Rvb2xzOgo+ICsgIGltYWdlOiAkQ0lfUkVHSVNUUlkvJENJX1BST0pF
Q1RfUEFUSC9pZ3QtZGViaWFuOmxhdGVzdAo+ICsgIHN0YWdlOiBidWlsZAo+ICsgIHNjcmlwdDoK
PiArICAgIC0gLi9hdXRvZ2VuLnNoIC0tZW5hYmxlLXtjaGFtZWxpdW0sYXVkaW8saW50ZWwsYW1k
Z3B1LG5vdXZlYXUsdGVzdHMscnVubmVyfQo+ICsgICAgLSBtYWtlIC1qCj4gKwo+ICBuaW5qYTp0
ZXN0Ogo+ICAgIHN0YWdlOiB0ZXN0Cj4gICAgc2NyaXB0Ogo+IGRpZmYgLS1naXQgYS9Eb2NrZXJm
aWxlLmRlYmlhbiBiL0RvY2tlcmZpbGUuZGViaWFuCj4gaW5kZXggMWM3MGYwMTUuLjEwNDkwNmMx
IDEwMDY0NAo+IC0tLSBhL0RvY2tlcmZpbGUuZGViaWFuCj4gKysrIGIvRG9ja2VyZmlsZS5kZWJp
YW4KPiBAQCAtMzMsMyArMzMsMTEgQEAgUlVOIGFwdC1nZXQgaW5zdGFsbCAtdCBzdHJldGNoLWJh
Y2twb3J0cyAteSBcCj4gIAkJCQkJbWVzb24gXAo+ICAJCQkJCWxpYmRybS1kZXYgXAo+ICAJCQkJ
CWxpYmRybS1pbnRlbDEKPiArCj4gKyMgYXV0b3Rvb2xzIGJ1aWxkIGRlcHMKPiArUlVOIGFwdC1n
ZXQgaW5zdGFsbCAteSBcCj4gKwkJCWF1dG9jb25mIFwKPiArCQkJYXV0b21ha2UgXAo+ICsJCQl4
dXRpbHMtZGV2IFwKPiArCQkJbGlidG9vbCBcCj4gKwkJCW1ha2UKPiAtLSAKPiAyLjE3LjIKPiAK
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
