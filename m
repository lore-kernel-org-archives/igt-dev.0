Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977DE6E40E
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2019 15:04:59 +0000 (UTC)
References: <20190819223137.3605-1-antonio.argenziano@intel.com>
 <156629106028.1374.13852420105577002712@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <840fc79e-33a0-0c23-30aa-a101d5def66b@intel.com>
Date: Tue, 20 Aug 2019 08:04:58 -0700
MIME-Version: 1.0
In-Reply-To: <156629106028.1374.13852420105577002712@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/igt_command_line.sh: Add new
 selftest for special handling
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

CgpPbiAyMC8wOC8xOSAwMTo1MSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTA4LTE5IDIzOjMxOjM3KQo+PiBkbWFidWZfc2VsZnRlc3RzIGhh
cyBiZWVuIHJlY2VudGx5IGFkZGVkIHRvIHRoZSB0ZXN0IGxpc3QgYnV0IG5vdCBhZGRlZAo+PiB0
byB0aGUgc3BlY2lhbCBoYW5kbGluZyBpbiBpZ3RfY29tbWFuZF9saW5lLnNoIGFuZCB0aGVyZWZv
cmUgYnVpbGQKPj4gdGVzdGluZyB3b3VsZCBmYWlsLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbnRv
bmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4+IENjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4gLS0tCj4+ICAgdGVzdHMvaWd0
X2NvbW1hbmRfbGluZS5zaCB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lndF9jb21tYW5kX2xp
bmUuc2ggYi90ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoCj4+IGluZGV4IDkyNjQzYzRkLi5lYWVj
MWI0ZiAxMDA3NTUKPj4gLS0tIGEvdGVzdHMvaWd0X2NvbW1hbmRfbGluZS5zaAo+PiArKysgYi90
ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoCj4+IEBAIC05MCw3ICs5MCw3IEBAIGNoZWNrX3Rlc3Qg
KCkKPj4gICAgICAgICAgICAgICAgICAjIFN1YnRlc3QgZW51bWVyYXRpb24gb2Yga2VybmVsIHNl
bGZ0ZXN0IGxhdW5jaGVycyBkZXBlbmRzCj4+ICAgICAgICAgICAgICAgICAgIyBvbiB0aGUgcnVu
bmluZyBrZXJuZWwuIElmIHNlbGZ0ZXN0cyBhcmUgbm90IGVuYWJsZWQsCj4+ICAgICAgICAgICAg
ICAgICAgIyB0aGV5IHdpbGwgb3V0cHV0IG5vdGhpbmcgYW5kIGV4aXQgd2l0aCAwLgo+PiAtICAg
ICAgICAgICAgICAgaWYgWyAiJHRlc3RuYW1lIiAhPSAiaTkxNV9zZWxmdGVzdCIgLWEgIiR0ZXN0
bmFtZSIgIT0gImRybV9tbSIgLWEgIiR0ZXN0bmFtZSIgIT0gImttc19zZWxmdGVzdCIgXTsgdGhl
bgo+PiArICAgICAgICAgICAgICAgaWYgWyAiJHRlc3RuYW1lIiAhPSAiaTkxNV9zZWxmdGVzdCIg
LWEgIiR0ZXN0bmFtZSIgIT0gImRybV9tbSIgLWEgIiR0ZXN0bmFtZSIgIT0gImttc19zZWxmdGVz
dCIgLWEgIiR0ZXN0bmFtZSIgIT0gImRtYWJ1Zl9zZWxmdGVzdHMiXTsgdGhlbgo+IAo+IFRoZSBu
YW1lIGlzIGp1c3QgImRtYWJ1ZiIKCkkgdGhpbmsgaXQgd2FudHMgdGhlIHN1YnRlc3QgbmFtZSBv
ciBhdCBsZWFzdCB0aGF0IHdvcmtlZCBmb3IgbWUuCgpBbnRvbmlvCgo+IC1DaHJpcwo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
