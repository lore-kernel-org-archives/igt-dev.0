Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940F46E1A9
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2018 14:40:09 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180219143603.18856-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20180219143603.18856-1-lionel.g.landwerlin@intel.com>
Message-ID: <151905120400.2041.8470376826441182646@mail.alporthouse.com>
Date: Mon, 19 Feb 2018 14:40:04 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/pm_sseu: dump the bit of sysfs
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOC0wMi0xOSAxNDozNjowMykKPiBXZSdyZSBz
ZWVpbmcgZmFpbHVyZXMgb24gdGhlIENJIGJ1dCB3ZSdyZSBtaXNzaW5nIHRoZSBkdW1wIG9mIHdo
YXQgaGFzCj4gYmVlbiByZWFkIHRvIGhlbHAgdXMgdW5kZXJzdGFuZCB3aGF0J3MgZ29pbmcgd3Jv
bmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3
ZXJsaW5AaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9wbV9zc2V1LmMgfCA4ICsrKysrKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvcG1fc3NldS5jIGIvdGVzdHMvcG1fc3NldS5jCj4gaW5kZXggMmEyZjA2
YmIuLjQyNjJhZDJhIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3BtX3NzZXUuYwo+ICsrKyBiL3Rlc3Rz
L3BtX3NzZXUuYwo+IEBAIC0xNDMsNyArMTQzLDcgQEAgZGJnX2dldF9ib29sKGNvbnN0IGNoYXIg
KmZpcnN0LCBjb25zdCBjaGFyICpsYXN0LCBjb25zdCBjaGFyICpuYW1lKQo+ICBzdGF0aWMgdm9p
ZAo+ICBkYmdfZ2V0X3N0YXR1cyhzdHJ1Y3Qgc3RhdHVzICpzdGF0KQo+ICB7Cj4gLSAgICAgICBj
aGFyICpmaXJzdCwgKmxhc3Q7Cj4gKyAgICAgICBjaGFyICp0bXAsICpmaXJzdCwgKmxhc3Q7Cj4g
ICAgICAgICBpbnQgbnJlYWQ7Cj4gIAo+ICAgICAgICAgbHNlZWsoZGJnLnN0YXR1c19mZCwgMCwg
U0VFS19TRVQpOwo+IEBAIC0xNTQsNiArMTU0LDkgQEAgZGJnX2dldF9zdGF0dXMoc3RydWN0IHN0
YXR1cyAqc3RhdCkKPiAgICAgICAgIG1lbXNldChzdGF0LCAwLCBzaXplb2YoKnN0YXQpKTsKPiAg
Cj4gICAgICAgICBkYmdfZ2V0X3N0YXR1c19zZWN0aW9uKCJTU0VVIERldmljZSBJbmZvIiwgJmZp
cnN0LCAmbGFzdCk7CgppZ3RfZGVidWcoIlNTRVUgRGV2aWNlIEluZm9cbiIpOwoKPiArICAgICAg
IGZvciAodG1wID0gZmlyc3Q7IHRtcCA8IGxhc3Q7IHRtcCsrKQoKQzk5IGZ0dywgZm9yIChjaGFy
ICpsaW5lID0gZmlyc3Q7IGxpbmUgPCBsYXN0OyBsaW5lKyspCj4gKyAgICAgICAgICAgICAgIGln
dF9kZWJ1ZygiJWMiLCAqdG1wKTsKCj4gKyAgICAgICBpZ3RfZGVidWcoIlxuIik7CgpBbnl3YXks
IGxvb2tzIGp1c3QgdG8gYmUgdGhlIHJpZ2h0IGluZm9ybWF0aW9uIHdlIG5lZWQgdG8gdGFrZSBh
bm90aGVyCnN0ZXAgdG93YXJkcyBkZWJ1Z2dpbmcgdGhlIGZvbGxvd2luZyBhc3NlcnRpb25zLAoK
UmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hy
aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
