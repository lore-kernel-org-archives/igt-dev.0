Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BBD6EE81
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2018 17:32:22 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu,  1 Feb 2018 17:32:16 +0000
Message-Id: <20180201173216.22531-3-lionel.g.landwerlin@intel.com>
In-Reply-To: <20180201173216.22531-1-lionel.g.landwerlin@intel.com>
References: <20180201173216.22531-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 3/3] overlay: fix invalid pointer access
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhlICd2JyB2YXJpYWJsZSBpc24ndCBkZWZpbmVkIGluIHRoaXMgcGFydCBvZiB0aGUgJ1RyYWNl
cG9pbnRGbXQnCnJ1bGUgYnV0IGJlY2F1c2Ugb2YgdGhlIHdheSB0aGUgZ2VuZXJhdG9yIHByb2R1
Y2VzIGNvZGUgKG9uZSBmdW5jdGlvbgpwZXIgcnVsZSkgaXQgZG9lc24ndCByZWFsaXplIHdlJ3Jl
IGFjY2Vzc2luZyBhIHZhcmlhYmxlIGZyb20gYQpkaWZmZXJlbnQgY2FzZSBvZiB0aGUgcnVsZSBh
bmQgdGhpcyBkb2Vzbid0IGxlYWQgdG8gYSBDIGNvbXBpbGVyIGVycm9yCm9uIHVuZGVmaW5lZCB2
YXJpYWJsZS4KClNpZ25lZC1vZmYtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5k
d2VybGluQGludGVsLmNvbT4KLS0tCiBvdmVybGF5L3RyYWNlcG9pbnRfZm9ybWF0LmxlZyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL292ZXJsYXkvdHJhY2Vwb2ludF9mb3JtYXQubGVnIGIvb3ZlcmxheS90cmFjZXBvaW50
X2Zvcm1hdC5sZWcKaW5kZXggMGRiOWE1NWYuLjU1MDNlMWNjIDEwMDY0NAotLS0gYS9vdmVybGF5
L3RyYWNlcG9pbnRfZm9ybWF0LmxlZworKysgYi9vdmVybGF5L3RyYWNlcG9pbnRfZm9ybWF0Lmxl
ZwpAQCAtMSw1ICsxLDUgQEAKIFRyYWNlcG9pbnRGbXQgPQotICAgICduYW1lJyAnOicgU3BhY2Ug
bjpQcm9wZXJ0eU5hbWUgRW5kTGluZSB7IGZyZWUodi5zdHJpbmcpOyB9CisgICAgJ25hbWUnICc6
JyBTcGFjZSBuOlByb3BlcnR5TmFtZSBFbmRMaW5lIHsgZnJlZShuLnN0cmluZyk7IH0KICAgICAn
SUQ6JyBTcGFjZSB2Ok51bWJlciBFbmRMaW5lIHsgeXktPmN0eC50cC0+ZXZlbnRfaWQgPSB2Lmlu
dGVnZXI7IH0KICAgICAnZm9ybWF0OicgRW5kTGluZQogICAgIEZpZWxkKwotLSAKMi4xNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
