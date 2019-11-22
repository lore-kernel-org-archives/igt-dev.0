Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6E46E23B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2019 00:36:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191122004353.133274-1-don.hiatt@intel.com>
In-Reply-To: <20191122004353.133274-1-don.hiatt@intel.com>
Message-ID: <157438296149.2524.11158765191068497587@skylake-alporthouse-com>
Date: Fri, 22 Nov 2019 00:36:01 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/aux: Ensure swap space prior to
 suspend to disk
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
To: don.hiatt@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBkb24uaGlhdHRAaW50ZWwuY29tICgyMDE5LTExLTIyIDAwOjQzOjUzKQo+IEZyb206
IERvbiBIaWF0dCA8ZG9uLmhpYXR0QGludGVsLmNvbT4KPiAKPiBTdXNwZW5kaW5nIHRvIGRpc2sg
cmVxdWlyZXMgc3dhcCBzcGFjZSwgbWFrZSBzdXJlIGl0IGV4aXN0cwo+IGJlZm9yZSBhdHRlbXB0
aW5nIHRvIHN1c3BlbmQgdG8gZGlzay4KPiAKPiBDYzogU3VqYXJpdGhhIFN1bmRhcmVzYW4gPHN1
amFyaXRoYS5zdW5kYXJlc2FuQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEb24gSGlhdHQg
PGRvbi5oaWF0dEBpbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pZ3RfYXV4LmMgfCA0ICsrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0
X2F1eC5jIGIvbGliL2lndF9hdXguYwo+IGluZGV4IDU3OGY4NTc5MzNmMC4uMzFjMDE2MjRhNjUx
IDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfYXV4LmMKPiArKysgYi9saWIvaWd0X2F1eC5jCj4gQEAg
LTg2NCw2ICs4NjQsMTAgQEAgdm9pZCBpZ3Rfc3lzdGVtX3N1c3BlbmRfYXV0b3Jlc3VtZShlbnVt
IGlndF9zdXNwZW5kX3N0YXRlIHN0YXRlLAo+ICAgICAgICAgaWd0X3JlcXVpcmUodGVzdCA9PSBT
VVNQRU5EX1RFU1RfTk9ORSB8fAo+ICAgICAgICAgICAgICAgICAgICAgZmFjY2Vzc2F0KHBvd2Vy
X2RpciwgInBtX3Rlc3QiLCBSX09LIHwgV19PSywgMCkgPT0gMCk7Cj4gIAo+ICsgICAgICAgaWYg
KHN0YXRlID09IFNVU1BFTkRfU1RBVEVfRElTSykKPiArICAgICAgICAgICAgICAgaWd0X3JlcXVp
cmVfZihpbnRlbF9nZXRfdG90YWxfc3dhcF9tYigpID4gMCwKCmlndF9za2lwX2Yoc3RhdGUgPT0g
U1VTUEVORF9TVEFURV9ESVNLICYmCgkgICAhaW50ZWxfZ2V0X3RvdGFsX3N3YXBfbWIoKSwKCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlN1c3BlbmQgdG8gZGlzayByZXF1aXJlcyBz
d2FwIHNwYWNlLlxuIik7Cj4gKwo+ICAgICAgICAgb3JpZ190ZXN0ID0gZ2V0X3N1c3BlbmRfdGVz
dChwb3dlcl9kaXIpOwo+ICAgICAgICAgc2V0X3N1c3BlbmRfdGVzdChwb3dlcl9kaXIsIHRlc3Qp
Owo+ICAKPiAtLSAKPiAyLjE3LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
