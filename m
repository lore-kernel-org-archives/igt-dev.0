Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BA26EFC8
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jun 2018 11:35:26 +0000 (UTC)
References: <20180605162323.26745-1-lionel.g.landwerlin@intel.com>
 <20180605162323.26745-3-lionel.g.landwerlin@intel.com>
 <152822443715.9058.14576326787476541400@mail.alporthouse.com>
 <c0ed2366-c7d1-3c01-a5e8-918705c4e125@intel.com>
 <152828116769.9058.10853416656605433368@mail.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <65d1bf95-89c1-37a0-ccd5-74d4dc4aa339@intel.com>
Date: Wed, 6 Jun 2018 12:35:23 +0100
MIME-Version: 1.0
In-Reply-To: <152828116769.9058.10853416656605433368@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915-query: add new tests for
 perf configurations queries
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

T24gMDYvMDYvMTggMTE6MzIsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIExpb25lbCBM
YW5kd2VybGluICgyMDE4LTA2LTA2IDExOjE5OjIwKQo+PiBPbiAwNS8wNi8xOCAxOTo0NywgQ2hy
aXMgV2lsc29uIHdyb3RlOgo+Pj4gUXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOC0wNi0w
NSAxNzoyMzoyMykKPj4+PiArICAgICAgIGxlbiA9IEFMSUdOKHF1ZXJ5Lm9hLm5fbXV4X3JlZ3Mg
KiBzaXplb2YodWludDMyX3QpICogMiwgNDA5Nik7Cj4+Pj4gKyAgICAgICBkYXRhID0gbW1hcCgw
LCBsZW4sIFBST1RfV1JJVEUsIE1BUF9QUklWQVRFIHwgTUFQX0FOT04sIC0xLCAwKTsKPj4+PiAr
ICAgICAgIG1lbXNldChkYXRhLCAwLCBsZW4pOwo+Pj4+ICsgICAgICAgbXByb3RlY3QoZGF0YSwg
bGVuLCBQUk9UX1JFQUQpOwo+Pj4+ICsgICAgICAgcXVlcnkub2EubXV4X3JlZ3NfcHRyID0gdG9f
dXNlcl9wb2ludGVyKGRhdGEpOwo+Pj4+ICsgICAgICAgaWd0X2Fzc2VydF9lcSgtRUZBVUxULAo+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICBxdWVyeV9wZXJmX2NvbmZpZ19kYXRhKGZkLCBzaXpl
b2YocXVlcnkpLCAmcXVlcnkucXVlcnkpKTsKPj4+IEp1c3QgdGhlIHJhbmRvbSB0aG91Z2h0LCBo
YXZlIHdlIHN0dWZmZWQgZ2VtX21tYXBfX2d0dCgpIGFkZHJlc3Nlcwo+Pj4gdGhyb3VnaCB0aGVz
ZSB5ZXQ/Cj4+PiAtQ2hyaXMKPj4+Cj4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhpcyB3b3Vs
ZCBiZSBhbiBpc3N1ZS4KPiBJdCdzIGEgdmVyeSBlYXN5IHdheSB0byBiZSBjYXVnaHQgb3V0IHdp
dGggYSBsb2NrIGludmVyc2lvbiwgYXMgdGhlCj4ga2VybmVsIGZhdWx0cyBvbiB0aGUgdXNlciBw
cm92aWRlZCBHR1RUIGFkZHJlc3MgYW5kIGNhbGxzIGludG8KPiBpOTE1X2dlbV9mYXVsdCgpLgo+
IC1DaHJpcwo+Ckp1c3QgdHJpZWQgYW5kIGl0IHNlZW1zIHRvIHdvcmsgZmluZS4KSSdtIG5vdCBz
dXJlIHdoYXQgeW91IGV4cGVjdGVkLi4uIElzIGl0IHRoYXQgaWYgd2UgdGFrZSBhIGxvY2sgb24g
dGhlIApkZXZpY2UgZnJvbSB0aGUgcXVlcnkgYXBpLCB0aGVuIHdlIGRlYWRsb2NrPwpJZiB0cnVl
IHRoYXQgd291bGQgYmUgb2theSwgYmVjYXVzZSB3ZSdyZSBub3QgdGFraW5nIGEgbG9jayBvbiB0
aGF0ICh5ZXQpLgoKLQpMaW9uZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
