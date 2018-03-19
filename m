Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C165489E9E
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Mar 2018 15:07:28 +0000 (UTC)
References: <20180314112021.60224-1-maarten.lankhorst@linux.intel.com>
 <20180314112021.60224-6-maarten.lankhorst@linux.intel.com>
 <20180314144836.GH5453@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <9714947f-19f1-3915-1949-960441eee157@linux.intel.com>
Date: Mon, 19 Mar 2018 16:07:26 +0100
MIME-Version: 1.0
In-Reply-To: <20180314144836.GH5453@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/kms_chv_cursor_fail: Handle
 cleanup better.
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
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTQtMDMtMTggb20gMTU6NDggc2NocmVlZiBWaWxsZSBTeXJqw6Rsw6Q6Cj4gT24gV2VkLCBN
YXIgMTQsIDIwMTggYXQgMTI6MjA6MjFQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6
Cj4+IENsZWFuIHVwIGN1cnNvciBmYiBpbiBjbGVhbnVwX2NydGMsIHdoaWNoIG1lYW5zIHRoYXQg
Y3Vyc29yIGZiCj4+IGhhcyB0byBiZSBjcmVhdGVkIGFmdGVyIHByZXBhcmVfY3J0YygpIGlzIGNh
bGxlZC4KPj4KPj4gVGhpcyB3aWxsIGZpeCBhIHNtYWxsIGxlYWsgd2hlbiBhIHN1YnRlc3QgZmFp
bHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+IC0tLQo+PiAgdGVzdHMva21zX2Nodl9jdXJzb3JfZmFp
bC5jIHwgNyArKy0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Nodl9jdXJzb3JfZmFpbC5j
IGIvdGVzdHMva21zX2Nodl9jdXJzb3JfZmFpbC5jCj4+IGluZGV4IDBkZDM2NmMzYjRiMS4uNzEz
OGU1NDlhZWI3IDEwMDY0NAo+PiAtLS0gYS90ZXN0cy9rbXNfY2h2X2N1cnNvcl9mYWlsLmMKPj4g
KysrIGIvdGVzdHMva21zX2Nodl9jdXJzb3JfZmFpbC5jCj4+IEBAIC0yMjQsNiArMjI0LDcgQEAg
c3RhdGljIHZvaWQgY2xlYW51cF9jcnRjKGRhdGFfdCAqZGF0YSkKPj4gIAlkYXRhLT5waXBlX2Ny
YyA9IE5VTEw7Cj4+ICAKPj4gIAlpZ3RfcmVtb3ZlX2ZiKGRhdGEtPmRybV9mZCwgJmRhdGEtPnBy
aW1hcnlfZmIpOwo+PiArCWlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmZGF0YS0+ZmIpOwo+
PiAgfQo+PiAgCj4+ICBzdGF0aWMgdm9pZCBwcmVwYXJlX2NydGMoZGF0YV90ICpkYXRhKQo+PiBA
QCAtMjYyLDE1ICsyNjMsMTEgQEAgc3RhdGljIHZvaWQgcHJlcGFyZV9jcnRjKGRhdGFfdCAqZGF0
YSkKPj4gIAo+PiAgc3RhdGljIHZvaWQgdGVzdF9jcnRjKGRhdGFfdCAqZGF0YSwgdW5zaWduZWQg
aW50IGVkZ2VzKQo+PiAgewo+PiAtCWNsZWFudXBfY3J0YyhkYXRhKTsKPj4gKwlwcmVwYXJlX2Ny
dGMoZGF0YSk7Cj4+ICAKPj4gIAljcmVhdGVfY3Vyc29yX2ZiKGRhdGEsIGRhdGEtPmN1cncsIGRh
dGEtPmN1cmgpOwo+IDQgYW5kIDUgbGd0bSBhcyB3ZWxsCj4KPiBSZXZpZXdlZC1ieTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KVGhhbmtzLCBwdXNoZWQg
YWZ0ZXIgdGVzdHMgc3VjY2VlZGVkLiA6KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
