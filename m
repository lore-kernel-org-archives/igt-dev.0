Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9CE6E1AB
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2018 14:48:11 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180219143603.18856-1-lionel.g.landwerlin@intel.com>
 <151905120400.2041.8470376826441182646@mail.alporthouse.com>
 <c8113202-c3fc-8e84-c494-a58ffbddb400@intel.com>
In-Reply-To: <c8113202-c3fc-8e84-c494-a58ffbddb400@intel.com>
Message-ID: <151905168689.2041.209868151183945189@mail.alporthouse.com>
Date: Mon, 19 Feb 2018 14:48:06 +0000
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

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOC0wMi0xOSAxNDo0MjowNSkKPiBPbiAxOS8w
Mi8xOCAxNDo0MCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gUXVvdGluZyBMaW9uZWwgTGFuZHdl
cmxpbiAoMjAxOC0wMi0xOSAxNDozNjowMykKPiA+PiBXZSdyZSBzZWVpbmcgZmFpbHVyZXMgb24g
dGhlIENJIGJ1dCB3ZSdyZSBtaXNzaW5nIHRoZSBkdW1wIG9mIHdoYXQgaGFzCj4gPj4gYmVlbiBy
ZWFkIHRvIGhlbHAgdXMgdW5kZXJzdGFuZCB3aGF0J3MgZ29pbmcgd3JvbmcuCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRl
bC5jb20+Cj4gPj4gLS0tCj4gPj4gICB0ZXN0cy9wbV9zc2V1LmMgfCA4ICsrKysrKystCj4gPj4g
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvcG1fc3NldS5jIGIvdGVzdHMvcG1fc3NldS5jCj4gPj4gaW5k
ZXggMmEyZjA2YmIuLjQyNjJhZDJhIDEwMDY0NAo+ID4+IC0tLSBhL3Rlc3RzL3BtX3NzZXUuYwo+
ID4+ICsrKyBiL3Rlc3RzL3BtX3NzZXUuYwo+ID4+IEBAIC0xNDMsNyArMTQzLDcgQEAgZGJnX2dl
dF9ib29sKGNvbnN0IGNoYXIgKmZpcnN0LCBjb25zdCBjaGFyICpsYXN0LCBjb25zdCBjaGFyICpu
YW1lKQo+ID4+ICAgc3RhdGljIHZvaWQKPiA+PiAgIGRiZ19nZXRfc3RhdHVzKHN0cnVjdCBzdGF0
dXMgKnN0YXQpCj4gPj4gICB7Cj4gPj4gLSAgICAgICBjaGFyICpmaXJzdCwgKmxhc3Q7Cj4gPj4g
KyAgICAgICBjaGFyICp0bXAsICpmaXJzdCwgKmxhc3Q7Cj4gPj4gICAgICAgICAgaW50IG5yZWFk
Owo+ID4+ICAgCj4gPj4gICAgICAgICAgbHNlZWsoZGJnLnN0YXR1c19mZCwgMCwgU0VFS19TRVQp
Owo+ID4+IEBAIC0xNTQsNiArMTU0LDkgQEAgZGJnX2dldF9zdGF0dXMoc3RydWN0IHN0YXR1cyAq
c3RhdCkKPiA+PiAgICAgICAgICBtZW1zZXQoc3RhdCwgMCwgc2l6ZW9mKCpzdGF0KSk7Cj4gPj4g
ICAKPiA+PiAgICAgICAgICBkYmdfZ2V0X3N0YXR1c19zZWN0aW9uKCJTU0VVIERldmljZSBJbmZv
IiwgJmZpcnN0LCAmbGFzdCk7Cj4gPiBpZ3RfZGVidWcoIlNTRVUgRGV2aWNlIEluZm9cbiIpOwo+
IAo+IFRoYXQgYml0IGlzIGFscmVhZHkgaW4gdGhlIGR1bXAgOykKCkZhaXIgZW5vdWdoIHRoZW4s
IGp1c3QgZGlkbid0IGV4cGVjdCB0aGUgaGVhZGVyIHRvIGJlIHJldHVybmVkIGZvcgpwYXJzaW5n
IDopCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
