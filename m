Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D90893A4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 20:25:27 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <53135e5acf3668084a7f8453add2bd04bf2481ed.1550800923.git.caz.yokoyama@intel.com>
In-Reply-To: <53135e5acf3668084a7f8453add2bd04bf2481ed.1550800923.git.caz.yokoyama@intel.com>
Message-ID: <155078072287.4937.3476435993095071861@skylake-alporthouse-com>
Date: Thu, 21 Feb 2019 20:25:23 +0000
Subject: Re: [igt-dev] [igt PATCH v2 1/1] lib: Incrementally mlock()
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
To: Caz Yokoyama <caz.yokoyama@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDYXogWW9rb3lhbWEgKDIwMTktMDItMjIgMDI6MDM6NTcpCj4gQXMgd2UgYWxyZWFk
eSBoYXZlIHRoZSBwcmV2aW91cyBwb3J0aW9uIG9mIHRoZSBtbWFwIG1sb2NrZWQsIHdlIG9ubHkK
PiBuZWVkIHRvIG1sb2NrKCkgdGhlIGZyZXNoIHBvcnRpb24gZm9yIHRlc3RpbmcgYXZhaWxhYmxl
IG1lbW9yeS4KCkkgbGlrZWQgbXkgdjIgbXVjaCBiZXR0ZXIgdGhhdCBhdm9pZGVkIHRoZSByZXBl
YXRlZCBtbG9jay4KIAo+IEFkZHJlc3MgY2FsY3VsYXRpb24gb24gbWxvY2sgaXMgZml4ZWQuCj4g
Cj4gV2hlbiB0aGUgcGFyZW50IHByb2Nlc3MgbWxvY2tzLCBpLmUuLAo+ICAgaWd0X2Fzc2VydCgh
bWxvY2soY2FuX21sb2NrLCAqY2FuX21sb2NrKSk7Cj4gbW9zdCBsaWtlbHkga2lsbGVkLgo+IAo+
IEluIHN1c3BlbmQuYywgT09NIGtpbGxzIHdoZW4gNjRNQiBsZXNzIG1lbW9yeSBpcyBtbG9ja2Vk
Lgo+IAo+IFRoaXMgcGF0Y2ggZG9lcyBub3QgbWFrZSB0aGUgdGVzdCBmYXN0ZXIuIEl0IHJ1bnMg
MzAwLTkwMHNlYy4KPiBJIHJlY29tbWVuZCBmb2xsb3dpbmdzLgo+IAo+IDEuIFJ1biBwYXRjaGVk
IGk5MTVfc3VzcGVuZEBzaHJpbmsgb25seSBvbiBmdWxsIHRlc3Qoc2hhcmQgdGVzdCA/KQo+IDIu
IGFkZCBsaWdodGVyIHRlc3Qgc3VjaCBhcyAxKSBtbG9jayAzLzQgb2YgYXZhaWwgbWVtb3J5LCAy
KSBzdXNwZW5kLXJlc3VtZQoKVGhhdCdzIGNvbXBsZXRlbHkgbWlzc2luZyB0aGUgcG9pbnQuIFRo
ZSBwb2ludCBvZiB0aGUgdGVzdCBpcyB3aGF0CmhhcHBlbnMgaWYgd2UgaGl0IG9vbSBkdXJpbmcg
c3VzcGVuZC4gSWYgbm90aGluZyBoYXBwZW5zIGR1cmluZyBzdXNwZW5kLAppdCBpcyBqdXN0IHll
dCBhbm90aGVyIHN1c3BlbmQuCgpUaGUgY29tcGxhaW50IGZvciB0aGUgdGVzdCB3YXMgdGhlIHNo
ZWVyIHZvbHVtZSBvZiBkbWVzZyBzcGFtIGFsb25nIHdpdGgKcmVndWxhcmx5IGxvY2tpbmcgdXAg
dGhlIHN5c3RlbSAoYW5kIGlmIHdlIGFyZW4ndCBsb2NraW5nIHVwIHRoZSBzeXN0ZW0sCnRoZSB0
ZXN0IGlzbid0IGRvaW5nIGl0cyBqb2IuLi4pCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
