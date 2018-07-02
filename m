Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180702090727.7721-1-chris@chris-wilson.co.uk>
 <20180702090727.7721-3-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <2441645d-6f94-a103-c980-69d08ea6e828@linux.intel.com>
Date: Mon, 2 Jul 2018 13:00:38 +0100
MIME-Version: 1.0
In-Reply-To: <20180702090727.7721-3-chris@chris-wilson.co.uk>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t 03/17] igt/gem_set_tiling_vs_pwrite:
 Show the erroneous value
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDAyLzA3LzIwMTggMTA6MDcsIENocmlzIFdpbHNvbiB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAtLS0KPiAgIHRlc3Rz
L2dlbV9zZXRfdGlsaW5nX3ZzX3B3cml0ZS5jIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9n
ZW1fc2V0X3RpbGluZ192c19wd3JpdGUuYyBiL3Rlc3RzL2dlbV9zZXRfdGlsaW5nX3ZzX3B3cml0
ZS5jCj4gaW5kZXggMDA2ZWRmZTRlLi5mMDEyNmI2NDggMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvZ2Vt
X3NldF90aWxpbmdfdnNfcHdyaXRlLmMKPiArKysgYi90ZXN0cy9nZW1fc2V0X3RpbGluZ192c19w
d3JpdGUuYwo+IEBAIC03NSw3ICs3NSw3IEBAIGlndF9zaW1wbGVfbWFpbgo+ICAgCW1lbXNldChk
YXRhLCAwLCBPQkpFQ1RfU0laRSk7Cj4gICAJZ2VtX3JlYWQoZmQsIGhhbmRsZSwgMCwgZGF0YSwg
T0JKRUNUX1NJWkUpOwo+ICAgCWZvciAoaSA9IDA7IGkgPCBPQkpFQ1RfU0laRS80OyBpKyspCj4g
LQkJaWd0X2Fzc2VydChpID09IGRhdGFbaV0pOwo+ICsJCWlndF9hc3NlcnRfZXFfdTMyKGRhdGFb
aV0sIGkpOwo+ICAgCj4gICAJLyogdG91Y2ggaXQgYmVmb3JlIGNoYW5naW5nIHRoZSB0aWxpbmcs
IHNvIHRoYXQgdGhlIGZlbmNlIHN0aWNrcyBhcm91bmQgKi8KPiAgIAlnZW1fc2V0X2RvbWFpbihm
ZCwgaGFuZGxlLCBJOTE1X0dFTV9ET01BSU5fR1RULCBJOTE1X0dFTV9ET01BSU5fR1RUKTsKPiBA
QCAtODgsNyArODgsNyBAQCBpZ3Rfc2ltcGxlX21haW4KPiAgIAltZW1zZXQoZGF0YSwgMCwgT0JK
RUNUX1NJWkUpOwo+ICAgCWdlbV9yZWFkKGZkLCBoYW5kbGUsIDAsIGRhdGEsIE9CSkVDVF9TSVpF
KTsKPiAgIAlmb3IgKGkgPSAwOyBpIDwgT0JKRUNUX1NJWkUvNDsgaSsrKQo+IC0JCWlndF9hc3Nl
cnQoaSA9PSBkYXRhW2ldKTsKPiArCQlpZ3RfYXNzZXJ0X2VxX3UzMihkYXRhW2ldLCBpKTsKPiAg
IAo+ICAgCW11bm1hcChwdHIsIE9CSkVDVF9TSVpFKTsKPiAgIAo+IAoKUmV2aWV3ZWQtYnk6IFR2
cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CgpSZWdhcmRzLAoKVHZydGtv
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
