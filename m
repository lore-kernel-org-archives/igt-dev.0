Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDBE89026
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2018 14:42:21 +0000 (UTC)
References: <20180219143603.18856-1-lionel.g.landwerlin@intel.com>
 <151905120400.2041.8470376826441182646@mail.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <c8113202-c3fc-8e84-c494-a58ffbddb400@intel.com>
Date: Mon, 19 Feb 2018 14:42:05 +0000
MIME-Version: 1.0
In-Reply-To: <151905120400.2041.8470376826441182646@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/pm_sseu: dump the bit of sysfs
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
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTkvMDIvMTggMTQ6NDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIExpb25lbCBM
YW5kd2VybGluICgyMDE4LTAyLTE5IDE0OjM2OjAzKQo+PiBXZSdyZSBzZWVpbmcgZmFpbHVyZXMg
b24gdGhlIENJIGJ1dCB3ZSdyZSBtaXNzaW5nIHRoZSBkdW1wIG9mIHdoYXQgaGFzCj4+IGJlZW4g
cmVhZCB0byBoZWxwIHVzIHVuZGVyc3RhbmQgd2hhdCdzIGdvaW5nIHdyb25nLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5j
b20+Cj4+IC0tLQo+PiAgIHRlc3RzL3BtX3NzZXUuYyB8IDggKysrKysrKy0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS90ZXN0cy9wbV9zc2V1LmMgYi90ZXN0cy9wbV9zc2V1LmMKPj4gaW5kZXggMmEyZjA2YmIuLjQy
NjJhZDJhIDEwMDY0NAo+PiAtLS0gYS90ZXN0cy9wbV9zc2V1LmMKPj4gKysrIGIvdGVzdHMvcG1f
c3NldS5jCj4+IEBAIC0xNDMsNyArMTQzLDcgQEAgZGJnX2dldF9ib29sKGNvbnN0IGNoYXIgKmZp
cnN0LCBjb25zdCBjaGFyICpsYXN0LCBjb25zdCBjaGFyICpuYW1lKQo+PiAgIHN0YXRpYyB2b2lk
Cj4+ICAgZGJnX2dldF9zdGF0dXMoc3RydWN0IHN0YXR1cyAqc3RhdCkKPj4gICB7Cj4+IC0gICAg
ICAgY2hhciAqZmlyc3QsICpsYXN0Owo+PiArICAgICAgIGNoYXIgKnRtcCwgKmZpcnN0LCAqbGFz
dDsKPj4gICAgICAgICAgaW50IG5yZWFkOwo+PiAgIAo+PiAgICAgICAgICBsc2VlayhkYmcuc3Rh
dHVzX2ZkLCAwLCBTRUVLX1NFVCk7Cj4+IEBAIC0xNTQsNiArMTU0LDkgQEAgZGJnX2dldF9zdGF0
dXMoc3RydWN0IHN0YXR1cyAqc3RhdCkKPj4gICAgICAgICAgbWVtc2V0KHN0YXQsIDAsIHNpemVv
Zigqc3RhdCkpOwo+PiAgIAo+PiAgICAgICAgICBkYmdfZ2V0X3N0YXR1c19zZWN0aW9uKCJTU0VV
IERldmljZSBJbmZvIiwgJmZpcnN0LCAmbGFzdCk7Cj4gaWd0X2RlYnVnKCJTU0VVIERldmljZSBJ
bmZvXG4iKTsKClRoYXQgYml0IGlzIGFscmVhZHkgaW4gdGhlIGR1bXAgOykKPgo+PiArICAgICAg
IGZvciAodG1wID0gZmlyc3Q7IHRtcCA8IGxhc3Q7IHRtcCsrKQo+IEM5OSBmdHcsIGZvciAoY2hh
ciAqbGluZSA9IGZpcnN0OyBsaW5lIDwgbGFzdDsgbGluZSsrKQoKU3VyZS4KCj4+ICsgICAgICAg
ICAgICAgICBpZ3RfZGVidWcoIiVjIiwgKnRtcCk7Cj4+ICsgICAgICAgaWd0X2RlYnVnKCJcbiIp
Owo+IEFueXdheSwgbG9va3MganVzdCB0byBiZSB0aGUgcmlnaHQgaW5mb3JtYXRpb24gd2UgbmVl
ZCB0byB0YWtlIGFub3RoZXIKPiBzdGVwIHRvd2FyZHMgZGVidWdnaW5nIHRoZSBmb2xsb3dpbmcg
YXNzZXJ0aW9ucywKPgo+IFJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdp
bHNvbi5jby51az4KPiAtQ2hyaXMKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
