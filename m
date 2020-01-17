Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984596F57C
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2020 13:52:47 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200117075449.6928-1-zbigniew.kempczynski@intel.com>
References: <20200117075449.6928-1-zbigniew.kempczynski@intel.com>
Message-ID: <157926915673.2389.14208125162387943918@skylake-alporthouse-com>
Date: Fri, 17 Jan 2020 13:52:36 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_set: Adding combinatorics
 facility
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDEtMTcgMDc6NTQ6NDkpCj4gRHlu
YW1pYyB0ZXN0cyBnaXZlcyB1cyBuZXcgbWV0aG9kIHRvIGNyZWF0ZSB0ZXN0cyBkZXBlbmRpbmcg
b24gdGhlCj4gaGFyZHdhcmUvc29mdHdhcmUgY2FwYWJpbGl0aWVzLiBUbyBjaGVjayBjb3ZlcmFn
ZSBzb21lIHRlc3RzIHJlcXVpcmUKPiB2ZXJpZmljYXRpb24gb3ZlciBzb21lIHNldCBvZiBvYmpl
Y3RzL2RhdGEuIFRvIG1ha2UgbGlmZSBlYXNpZXIKPiB3aXRoIGNvbWJpbmF0b3JpY3MgdGhpcyBw
YXRjaCBpbnRyb2R1Y2VzIGlndF9zZXQuIEN1cnJlbnRseSBpdCBzdXBwb3J0cwo+IGl0ZXJhdGlu
ZyBvdmVyIHNldCB0byBnZXQgc3Vic2V0cywgY29tYmluYXRpb25zIGFuZCBtdWx0aWNvbWJpbmF0
aW9ucy4KPiBDb2RlIGhhcyBzb21lIGxpbWl0YXRpb24gKHNldC9zdWJzZXQgY2Fubm90IGJlIGxh
cmdlciB0aGFuIDE2IGVsZW1lbnRzLAo+IHdoYXQgaXMgZW5vdWdoIGZvciBtb3N0IGNhc2VzKS4K
CkkgaGF2ZSB0byBzYXksIHRoaXMgbG9va3MgbGlrZSBpdCBpcyBnb2luZyB0byBiZSB2ZXJ5LCB2
ZXJ5IHVzZWZ1bC4gQWxsCnRob3NlIHRpbWVzIHdoZXJlIEkndmUgdXNlZAoJZm9yX2VhY2hfZW5n
aW5lIHsKCQlmb3JfZWFjaF9lbmdpbmUgewoJCX0KCX0KY2FuIGJlIHJlZHVjZWQgdG8gYSBzdGFu
ZGFyZCBjb21iaW5hdG9yaWFsIHNldCwgd2l0aCBpZ3RfZHluYW1pYwpsYWJlbGxpbmcgdGhyb3du
IG9uIHRvcC4KClBldHJpLCBjYW4geW91IHN1Z2dlc3QgaG93IHRvIHdyaXRlIHRoZSBzZWxmdGVz
dHMgZm9yIGlndD8gV2UgZGVmaW5pdGVseQpuZWVkIGEgZmV3IHRvIHZlcmlmeSBpdCB3b3JrcyBh
cyBleHBlY3RlZCBhbmQgcHJvdmlkZSBhIGZldyBzaW1wbGUKZXhhbXBsZXMuCi1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
