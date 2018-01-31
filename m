Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB546EC75
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2018 21:21:24 +0000 (UTC)
References: <20180131193901.5150-1-antonio.argenziano@intel.com>
 <151743196553.13929.1941192402202071748@mail.alporthouse.com>
 <151743285379.13929.10650919310387095806@mail.alporthouse.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <b00a32fb-b0bc-8dbc-c9ae-775ce7a73758@intel.com>
Date: Wed, 31 Jan 2018 13:21:23 -0800
MIME-Version: 1.0
In-Reply-To: <151743285379.13929.10650919310387095806@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_exec_params: Drop drm master
 privileges only on drm master fds
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAzMS8wMS8xOCAxMzowNywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQ2hyaXMg
V2lsc29uICgyMDE4LTAxLTMxIDIwOjUyOjQ1KQo+PiBRdW90aW5nIEFudG9uaW8gQXJnZW56aWFu
byAoMjAxOC0wMS0zMSAxOTozOTowMSkKPj4+IFN1YnRlc3QgJ3NlY3VyZS1ub24tbWFzdGVyJyB0
cmllcyB0byBkcm9wIGRybS1tYXN0ZXIgcHJpdmlsZWdlcyBvbiBhCj4+PiBub24gZHJtLW1hc3Rl
ciBmZC4gSW5zdGVhZCBkcm9wIG1hc3RlciBwcml2aWxlZ2VzIGFmdGVyIHRoZSBzdWJ0ZXN0Cj4+
PiBhY3F1aXJlcyBpdCBzbyB0aGF0IG90aGVyIHN1YnRlc3RzIGFyZSBub3QgYWZmZWN0ZWQgYnkg
aXQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFy
Z2Vuemlhbm9AaW50ZWwuY29tPgo+Pj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgo+Pj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cj4+PiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29t
Pgo+Pj4gLS0tCj4+PiAgIHRlc3RzL2dlbV9leGVjX3BhcmFtcy5jIHwgMiArLQo+Pj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvdGVzdHMvZ2VtX2V4ZWNfcGFyYW1zLmMgYi90ZXN0cy9nZW1fZXhlY19wYXJhbXMuYwo+
Pj4gaW5kZXggZTFjNDhiNDAuLmRiZDg5ZTdjIDEwMDY0NAo+Pj4gLS0tIGEvdGVzdHMvZ2VtX2V4
ZWNfcGFyYW1zLmMKPj4+ICsrKyBiL3Rlc3RzL2dlbV9leGVjX3BhcmFtcy5jCj4+PiBAQCAtMzQz
LDEzICszNDMsMTMgQEAgaWd0X21haW4KPj4+ICAgICAgICAgIH0KPj4+ICAgCj4+PiAgICAgICAg
ICBpZ3Rfc3VidGVzdCgic2VjdXJlLW5vbi1tYXN0ZXIiKSB7Cj4+Cj4+IGlndF9yZXF1aXJlKGlh
bXJvb3QoKSk7Cj4+Cj4+PiAtICAgICAgICAgICAgICAgaWd0X2RldmljZV9kcm9wX21hc3Rlcihm
ZCk7Cj4gCj4gT3IgbWF5YmU6Cj4gCWlndF9yZXF1aXJlKF9faWd0X2RldmljZV9zZXRfbWFzdGVy
KGZkKSk7IC8qIHJlcXVpcmVzIHJvb3QgcHJpdmlsZWdlICovCj4gCWlndF9kZXZpY2VfZHJvcF9t
YXN0ZXIoZmQpOwo+ID8KClllcCwgd2hpY2ggaXMgdmVyeSBzaW1pbGFyIHRvIG9wZW5pbmcgYSBs
b2NhbCBmZCBhcyBtYXN0ZXIuCgpUaGFua3MsCkFudG9uaW8KCj4gCj4gVG8gdmVyaWZ5IHdlIGNh
biBvYnRhaW4gRFJNX01BU1RFUiBpZiB3ZSB3YW50ZWQgaXQsIGFuZCBhc3NlcnQgdGhhdCB3ZQo+
IGRvbid0IGhhdmUgaXQgZm9yIHRoZSBhY3R1YWwgdGVzdC4KPiAtQ2hyaXMKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
