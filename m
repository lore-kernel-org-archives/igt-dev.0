Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FBB6E18F
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Mar 2018 06:04:33 +0000 (UTC)
From: "Lofstedt, Marta" <marta.lofstedt@intel.com>
Date: Wed, 28 Mar 2018 06:04:30 +0000
Message-ID: <CA5F6A4B62957246A95956419746064382B7BCD2@IRSMSX106.ger.corp.intel.com>
References: <20180327131647.20941-1-marta.lofstedt@intel.com>
In-Reply-To: <20180327131647.20941-1-marta.lofstedt@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] blacklist: Don't run tests on pipe-d,
 pipe-e or pipe-f
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

SnVkZ2luZyBmcm9tIFBXIHJlc3VsdHMgdGhpcyBwYXRjaCBzYXZlIH4xMjAgc2Vjb25kcyBvZiBy
dW50aW1lIG9uIHRoZSBBUEwtc2hhcmRzCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4g
RnJvbTogTG9mc3RlZHQsIE1hcnRhCj4gU2VudDogVHVlc2RheSwgTWFyY2ggMjcsIDIwMTggNDox
NyBQTQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBMYXR2YWxhLCBQ
ZXRyaSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+OyBMb2ZzdGVkdCwgTWFydGEKPiA8bWFydGEu
bG9mc3RlZHRAaW50ZWwuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdF0gYmxhY2tsaXN0OiBE
b24ndCBydW4gdGVzdHMgb24gcGlwZS1kLCBwaXBlLWUgb3IgcGlwZS1mCj4gCj4gVGhlcmUgaXMg
Y3VycmVudGx5IG5vIGhhcmR3YXJlIGluIG91ciBsYWJzIHRoYXQgc3VwcG9ydHMgcGlwZS1kLCBw
aXBlLWUgbm9yCj4gcGlwZS1mLgo+IAo+IFNraXBwaW5nIHRha2VzIHRpbWUsIHNvIGFsbCB0ZXN0
cyBvbiB0aGVzZSBwaXBlcyBzaG91bGQgYmUgYmxhY2tsaXN0ZWQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTWFydGEgTG9mc3RlZHQgPG1hcnRhLmxvZnN0ZWR0QGludGVsLmNvbT4KPiAtLS0KPiAgdGVz
dHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dCB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0
LnR4dCBiL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQgaW5kZXgKPiA3Y2EzMTNhYy4uOTU5
ODViYjYgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dAo+ICsrKyBi
L3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQKPiBAQCAtNzMsMyArNzMsOSBAQCBpZ3RAZ2Vt
X3NvZnRwaW5Abm9yZWxvYy1zNAo+ICBpZ3RAZ2VtX3dvcmthcm91bmRzQGhpYmVybmF0ZS0uKgo+
ICBpZ3RAZ2VtX2V4ZWNfc3VzcGVuZEBiYXNpYy1zNCQKPiAgaWd0QGdlbV9jdHhfaXNvbGF0aW9u
QC4qLXM0Cj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gKyMgcGlwZS1kLCBwaXBlLWUsIHBpcGUtZiBubyBjdXJyZW50IEhXIHN1cHBvcnQKPiArIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAraWd0QC4qQC4q
cGlwZS1kLS4qCj4gK2lndEAuKkAuKnBpcGUtZS0uKgo+ICtpZ3RALipALipwaXBlLWYtLioKPiAt
LQo+IDIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
