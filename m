Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF166E925
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2018 10:34:16 +0000 (UTC)
References: <20180130101119.15758-1-tvrtko.ursulin@linux.intel.com>
 <20180130101119.15758-8-tvrtko.ursulin@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <6ca79d10-0462-8923-2a96-e3141662fa72@linux.intel.com>
Date: Tue, 30 Jan 2018 10:34:14 +0000
MIME-Version: 1.0
In-Reply-To: <20180130101119.15758-8-tvrtko.ursulin@linux.intel.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t 06/11] trace.pl: Move sortQueue near to
 the user
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CkdhcmJhZ2UgaW4gdGhlIGN3ZCwgcGxlYXNlIGlnbm9yZSB0aGlzIG9uZSEgOigKCk9uIDMwLzAx
LzIwMTggMTA6MTEsIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+IEZyb206IFR2cnRrbyBVcnN1bGlu
IDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gCj4gSnVzdCB0byBjbGVhciB1cCBzb21lIHNw
YWNlIGZvciBpbmNvbWluZyBjb2RlIHJlZmFjdG9yaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFR2
cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gQ2M6IEpvaG4gSGFycmlz
b24gPEpvaG4uQy5IYXJyaXNvbkBpbnRlbC5jb20+Cj4gLS0tCj4gICBzY3JpcHRzL3RyYWNlLnBs
IHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL3RyYWNl
LnBsIGIvc2NyaXB0cy90cmFjZS5wbAo+IGluZGV4IDk1OGM4M2M4MmI4Yi4uZjMwZmNhYzg3OGMx
IDEwMDc1NQo+IC0tLSBhL3NjcmlwdHMvdHJhY2UucGwKPiArKysgYi9zY3JpcHRzL3RyYWNlLnBs
Cj4gQEAgLTUyNywxNyArNTI3LDYgQEAgc3ViIHNvcnRTdGFydCB7Cj4gICAJcmV0dXJuICR2YWw7
Cj4gICB9Cj4gICAKPiAtc3ViIHNvcnRRdWV1ZSB7Cj4gLQlteSAkYXMgPSAkZGJ7JGF9LT57J3F1
ZXVlJ307Cj4gLQlteSAkYnMgPSAkZGJ7JGJ9LT57J3F1ZXVlJ307Cj4gLQlteSAkdmFsOwo+IC0K
PiAtCSR2YWwgPSAkYXMgPD0+ICRiczsKPiAtCSR2YWwgPSAkYSBjbXAgJGIgaWYgJHZhbCA9PSAw
Owo+IC0KPiAtCXJldHVybiAkdmFsOwo+IC19Cj4gLQo+ICAgbXkgQHNvcnRlZF9rZXlzID0gc29y
dCBzb3J0U3RhcnQga2V5cyAlZGI7Cj4gICBteSAkcmVfc29ydCA9IDA7Cj4gICAKPiBAQCAtODQx
LDYgKzgzMCwxNyBAQCBwcmludCA8PEVOREhUTUw7Cj4gICAgIHZhciBpdGVtcyA9IG5ldyB2aXMu
RGF0YVNldChbCj4gICBFTkRIVE1MCj4gICAKPiArc3ViIHNvcnRRdWV1ZSB7Cj4gKwlteSAkYXMg
PSAkZGJ7JGF9LT57J3F1ZXVlJ307Cj4gKwlteSAkYnMgPSAkZGJ7JGJ9LT57J3F1ZXVlJ307Cj4g
KwlteSAkdmFsOwo+ICsKPiArCSR2YWwgPSAkYXMgPD0+ICRiczsKPiArCSR2YWwgPSAkYSBjbXAg
JGIgaWYgJHZhbCA9PSAwOwo+ICsKPiArCXJldHVybiAkdmFsOwo+ICt9Cj4gKwo+ICAgbXkgJGkg
PSAwOwo+ICAgZm9yZWFjaCBteSAka2V5IChzb3J0IHNvcnRRdWV1ZSBrZXlzICVkYikgewo+ICAg
CW15ICgkbmFtZSwgJGN0eCwgJHNlcW5vKSA9ICgkZGJ7JGtleX0tPnsnbmFtZSd9LCAkZGJ7JGtl
eX0tPnsnY3R4J30sICRkYnska2V5fS0+eydzZXFubyd9KTsKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
