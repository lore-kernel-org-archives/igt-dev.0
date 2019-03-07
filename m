Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630AB6E2A8
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 12:08:58 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190307112427.29146-1-petri.latvala@intel.com>
References: <20190307112427.29146-1-petri.latvala@intel.com>
Message-ID: <155196052029.27405.17162250294190251428@skylake-alporthouse-com>
Date: Thu, 07 Mar 2019 12:08:40 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] lib/aux: Plug memory leak in
 __igt_lsof_fds
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTAzLTA3IDExOjI0OjIzKQo+IEFkZCBhIG1pc3Np
bmcgY2xvc2VkaXIgY2FsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRy
aS5sYXR2YWxhQGludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lndF9hdXguYyB8IDIgKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2F1
eC5jIGIvbGliL2lndF9hdXguYwo+IGluZGV4IGZmOThkOTFkLi5lNWQ0MWUzMiAxMDA2NDQKPiAt
LS0gYS9saWIvaWd0X2F1eC5jCj4gKysrIGIvbGliL2lndF9hdXguYwo+IEBAIC0xNDE5LDYgKzE0
MTksOCBAQCBhZ2FpbjoKPiAgICAgICAgICAgICAgICAgZnJlZShjb3B5X2ZkX2xuayk7Cj4gICAg
ICAgICAgICAgICAgIGZyZWUoZmRfbG5rKTsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICBjbG9z
ZWRpcihkcCk7CgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
