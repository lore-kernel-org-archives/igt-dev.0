Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <1545239432-4936-1-git-send-email-talha.nassar@intel.com>
References: <1545239432-4936-1-git-send-email-talha.nassar@intel.com>
Date: Thu, 20 Dec 2018 12:54:33 +0200
Message-ID: <87o99g5uza.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_workarounds: adding 0xe420
 register to WO list
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
To: Talha Nassar <talha.nassar@intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGFsaGEgTmFzc2FyIDx0YWxoYS5uYXNzYXJAaW50ZWwuY29tPiB3cml0ZXM6Cgo+IEZyb206IHRh
bGhhIG5hc3NhciA8dGFsaGEubmFzc2FyQGludGVsLmNvbT4KPgo+IEhXIHRlYW0gY29uZmlybWVk
IHRoYXQgdGhpcyByZWdpc3RlciBpcyB3cml0ZS1vbmx5LgoKSXQgY291bGQgYmUgdGhhdCBpdCBp
cyB0aGF0IGJpdCBvbmx5LiBXZSBkb24ndCBuZWVkCnRvIGNhcmUgYWJvdXQgdGhhdCBub3csCgpS
ZXZpZXdlZC1ieTogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+
Cgo+Cj4gUmVmZXJlbmNlczogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MTA3MzM4Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
Pgo+IENjOiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiB0YWxoYSBuYXNzYXIgPHRhbGhhLm5hc3NhckBpbnRlbC5jb20+Cj4gLS0t
Cj4gIHRlc3RzL2k5MTUvZ2VtX3dvcmthcm91bmRzLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aTkxNS9nZW1fd29ya2Fyb3VuZHMuYyBiL3Rlc3RzL2k5MTUvZ2VtX3dvcmthcm91bmRzLmMKPiBp
bmRleCA3ODQ3OGFkLi5iN2Q3ZDljIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX3dvcmth
cm91bmRzLmMKPiArKysgYi90ZXN0cy9pOTE1L2dlbV93b3JrYXJvdW5kcy5jCj4gQEAgLTUxLDcg
KzUxLDggQEAgc3RhdGljIHN0cnVjdCB3cml0ZV9vbmx5X2xpc3Qgewo+ICAJdW5zaWduZWQgaW50
IGdlbjsKPiAgCXVpbnQzMl90IGFkZHI7Cj4gIH0gd29fbGlzdFtdID0gewo+IC0JeyAxMCwgMHhF
NUYwIH0gLyogV2FGb3JjZUNvbnRleHRTYXZlUmVzdG9yZU5vbkNvaGVyZW50OmNubCAqLwo+ICsJ
eyAxMCwgMHhFNUYwIH0sIC8qIFdhRm9yY2VDb250ZXh0U2F2ZVJlc3RvcmVOb25Db2hlcmVudDpj
bmwgKi8KPiArCXsgMTEsIDB4RTQyMCB9ICAvKiBXYUVuYWJsZUZsb2F0QmxlbmRPcHRpbWl6YXRp
b246aWNsICovCj4gIAo+ICAJLyoKPiAgCSAqIEZJWE1FOiBJZiB5b3UgYXJlIGNvbnRlbXBsYXRp
bmcgYWRkaW5nIHN0dWZmIGhlcmUKPiAtLSAKPiAyLjcuNApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
