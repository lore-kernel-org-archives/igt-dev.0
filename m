Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1944A89939
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2018 09:09:30 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Wed,  7 Feb 2018 10:09:07 +0100
Message-Id: <20180207090910.10775-1-boris.brezillon@bootlin.com>
Subject: [igt-dev] [PATCH v3 0/3] Add a testsuite to validate VC4 MADV ioctl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Eric Anholt <eric@anholt.net>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SGVsbG8sCiAgICAKVGhpcyBwYXRjaHNldCBhZGRzIFZDNCBzcGVjaWZpYyB0ZXN0cyB0byB2YWxp
ZGF0ZSB0aGUKRFJNX0lPQ1RMX1ZDNF9HRU1fTUFEVklTRSBpb2N0bC4gSSByZS1zdWJtaXQgaXQg
bm93IHRoYXQgYWxsIG90aGVyCnBpZWNlcyAoa2VybmVsK21lc2EpIGhhdmUgYmVlbiBtZXJnZWQu
CiAKVGhhbmtzLAogICAgCkJvcmlzCgpCb3JpcyBCcmV6aWxsb24gKDMpOgogIGlndC92YzQ6IEFk
ZCBhIGhlbHBlciBmdW5jdGlvbiB0byBtYXJrIEJPcyBwdXJnZWFibGUKICBpZ3Q6IEFkZCBpZ3Rf
dmM0X2dldF9wYXJhbSgpIGhlbHBlcgogIGlndDogQWRkIFZDNCBwdXJnZWFibGUgQk8gdGVzdHMK
CiBsaWIvaWd0X3ZjNC5jICAgICAgICAgICAgfCAgMjcgKysrKysKIGxpYi9pZ3RfdmM0LmggICAg
ICAgICAgICB8ICAgMiArCiB0ZXN0cy9NYWtlZmlsZS5zb3VyY2VzICAgfCAgIDEgKwogdGVzdHMv
bWVzb24uYnVpbGQgICAgICAgIHwgICAxICsKIHRlc3RzL3ZjNF9wdXJnZWFibGVfYm8uYyB8IDI2
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogNSBmaWxl
cyBjaGFuZ2VkLCAyOTUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3Zj
NF9wdXJnZWFibGVfYm8uYwoKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
