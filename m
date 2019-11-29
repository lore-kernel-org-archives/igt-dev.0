Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761BB6E921
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2019 14:30:54 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 29 Nov 2019 16:30:47 +0200
Message-Id: <20191129143048.1936-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20191129143048.1936-1-ville.syrjala@linux.intel.com>
References: <20191129143048.1936-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/igt_draw: Fix blt tiled stride for
 gen2/3
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkdl
bjIvMyBibGl0dGVyIGRvZXNuJ3Qgd2FudCB1cyB0byBkbyB0aGUgLzQgYWRqdXN0bWVudAp0byB0
aGUgdGlsZWQgc3RyaWRlLgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2RyYXcuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xp
Yi9pZ3RfZHJhdy5jIGIvbGliL2lndF9kcmF3LmMKaW5kZXggMTFiYmZkMGExMzUzLi43ZTBlZGVj
MTk4ZDIgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZHJhdy5jCisrKyBiL2xpYi9pZ3RfZHJhdy5jCkBA
IC01NTEsNyArNTUxLDcgQEAgc3RhdGljIHZvaWQgZHJhd19yZWN0X2JsdChpbnQgZmQsIHN0cnVj
dCBjbWRfZGF0YSAqY21kX2RhdGEsCiAKIAlibHRfY21kX2xlbiA9IChnZW4gPj0gOCkgPyAgMHg1
IDogMHg0OwogCWJsdF9jbWRfdGlsaW5nID0gKHRpbGluZykgPyBYWV9DT0xPUl9CTFRfVElMRUQg
OiAwOwotCXBpdGNoID0gKHRpbGluZykgPyBidWYtPnN0cmlkZSAvIDQgOiBidWYtPnN0cmlkZTsK
KwlwaXRjaCA9IChnZW4gPj0gNCAmJiB0aWxpbmcpID8gYnVmLT5zdHJpZGUgLyA0IDogYnVmLT5z
dHJpZGU7CiAKIAlzd2l0Y2hfYmx0X3RpbGluZyhiYXRjaCwgdGlsaW5nLCB0cnVlKTsKIAotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
