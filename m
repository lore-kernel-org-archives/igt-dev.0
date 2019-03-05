Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9652E6E042
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2019 23:15:28 +0000 (UTC)
Message-ID: <678cb1a5caa56b23e92c338ccc4c07e08df999bb.camel@intel.com>
From: Caz Yokoyama <Caz.Yokoyama@intel.com>
Date: Tue, 05 Mar 2019 15:22:06 -0800
In-Reply-To: <155180654478.27405.14279936406391255294@skylake-alporthouse-com>
References: <ebc791267be5d25674767591abe0830df7027b9d.1551830533.git.caz.yokoyama@intel.com>
 <155180654478.27405.14279936406391255294@skylake-alporthouse-com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] i915_pm_rpm:
 gem-execbuf-stress-extra-wait faster
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTAzLTA1IGF0IDE3OjIyICswMDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4g
UXVvdGluZyBDYXogWW9rb3lhbWEgKDIwMTktMDMtMDYgMDA6MDY6NTUpCj4gPiBMZXNzIGl0ZXJh
dGUgYmVjYXVzZSBXQUlUX0VYVFJBIGFkZHMgZXh0cmEgNSBzZWMgZGVsYXkgZm9yIGVhY2gKPiA+
IGl0ZXJhdGlvbi4KPiA+IFRoaXMgdGVzdCBpcyBzaW1pbGFyIHRvIGdlbS1leGVjYnVmLXN0cmVz
cyBleGNlcHQgZm9yIFdBSVRfRVhUUkEuCj4gPiBJdCBydW5zIDg2IHNlYy4gd2hpbGUgZ2VtLWV4
ZWNidWYtc3RyZXNzIHJ1bnMgMzggc2VjLgo+ID4gaS5lLiAzOHMgKyBpdGVyYXRpb24ocm91bmRz
LDEwKSAqIDVzID0gODhzCj4gCj4gV2h5IGRvZXMgaXQgd2FpdCBmb3IgNXM/IFRoZXJlJ3Mgbm8g
c2Vjb25kIHN0YWdlIHRvIHJ1bnRpbWUgc3VzcGVuZCwKPiBidXQKPiBpZiB0aGVyZSB3YXMsIGFk
ZCBhIGRlYnVnIGludGVyZmFjZSB0byBmb3JjZSBpdC4KSSBiZWxpZXZlIG5vIGJlY2F1c2UgdGVh
cmRvd25fZW52aXJvbm1lbnQoKSBpcyB0aGUgb25seWUgc3RhdGVtZW50CmFmdGVyIGlndF9zdWJ0
ZXN0KCJnZW0tZXhlY2J1Zi1zdHJlc3MtZXh0cmEtd2FpdCIpLgoKPiBTb21ldGhpbmcgZWxzZSB0
aGF0IGNhbiBiZSBlbXBsb3llZCB0byBzcGVlZCB1cCB0aGlzIHRlc3Qgd291bGQgYmUKPiBpZ3Rf
ZHJvcF9jYWNoZXNfc2V0KERST1BfSURMRSkgKGJlZm9yZSB3YWl0aW5nIGZvciBydW50aW1lIHN1
c3BlbmQpLgpZZXMsIGl0IGRvZXMgc3BlZWQgdXAgdG8gNTZzZWMgZnJvbSA4OHNlYy4gTm90IG9u
bHkgZ2VtLWV4ZWNidWYtc3RyZXNzLQpleHRyYS13YWl0LCBidXQgYWxzbyBvdGhlciAyIHRlc3Rz
IHNwZWVkIHVwLiBGb3IgZXhhbXBsZSwgZ2VtLWV4ZWNidWYtCnN0cmVzcyBzcGVlZCB1cCB0byA5
c2VjIGZyb20gMzhzZWMuIFRoYW5rIHlvdS4KCkhvdyBkbyB5b3Ugd2FudCB0byBoYXZlIHBhdGNo
ZXM/IE9ubHkgaWd0X2Ryb3BfY2FjaGVzX3NldChEUk9QX0lETEUpPwpCb3RoIGlndF9kcm9wX2Nh
Y2hlc19zZXQoRFJPUF9JRExFKSBhbmQgcm91bmRzIC8gMiBpbiBhIHNpbmdsZSBwYXRjaD8KU2Vw
YXJhdGUgMiBwYXRjaGVzPwotY2F6Cgo+IC1DaHJpcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2
