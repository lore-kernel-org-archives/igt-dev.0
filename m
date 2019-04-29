Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C0F892BB
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2019 09:24:43 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 29 Apr 2019 11:24:37 +0200
Message-Id: <20190429092437.23489-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/audio: Fix compiler error with missing
 permsisions to O_CREAT.
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

SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91c3IvaW5jbHVkZS9mY250bC5oOjI5MDowLAogICAgICAg
ICAgICAgICAgIGZyb20gLi4vLi4vbGliL2lndF9hdWRpby5jOjMwOgpJbiBmdW5jdGlvbiDigJhv
cGVu4oCZLAogICAgaW5saW5lZCBmcm9tIOKAmGF1ZGlvX2NyZWF0ZV93YXZfZmlsZV9zMzJfbGXi
gJkgYXQgaWd0X2F1ZGlvLmM6NDUwOjU6Ci91c3IvaW5jbHVkZS94ODZfNjQtbGludXgtZ251L2Jp
dHMvZmNudGwyLmg6NTA6NDogZXJyb3I6IGNhbGwgdG8KCeKAmF9fb3Blbl9taXNzaW5nX21vZGXi
gJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IG9wZW4gd2l0aAoJT19DUkVBVCBvciBP
X1RNUEZJTEUgaW4gc2Vjb25kIGFyZ3VtZW50IG5lZWRzIDMgYXJndW1lbnRzCiAgICBfX29wZW5f
bWlzc2luZ19tb2RlICgpOwogICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1i
eTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
Q2M6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KQ2M6IE1hcnRpbiBQZXJlcyA8bWFy
dGluLnBlcmVzQGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2F1ZGlvLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9saWIvaWd0X2F1ZGlvLmMgYi9saWIvaWd0X2F1ZGlvLmMKaW5kZXggNWIwODYwZTZjYzc2Li5m
ZDhjZjA3YzBkZTMgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfYXVkaW8uYworKysgYi9saWIvaWd0X2F1
ZGlvLmMKQEAgLTQ0Nyw3ICs0NDcsNyBAQCBpbnQgYXVkaW9fY3JlYXRlX3dhdl9maWxlX3MzMl9s
ZShjb25zdCBjaGFyICpxdWFsaWZpZXIsIHVpbnQzMl90IHNhbXBsZV9yYXRlLAogCQkqcGF0aCA9
IHN0cmR1cChfcGF0aCk7CiAKIAlpZ3RfZGVidWcoIkR1bXBpbmcgJXMgYXVkaW8gdG8gJXNcbiIs
IHF1YWxpZmllciwgX3BhdGgpOwotCWZkID0gb3BlbihfcGF0aCwgT19XUk9OTFkgfCBPX0NSRUFU
IHwgT19UUlVOQyk7CisJZmQgPSBvcGVuKF9wYXRoLCBPX1dST05MWSB8IE9fQ1JFQVQgfCBPX1RS
VU5DLCAwNjQ0KTsKIAlpZiAoZmQgPCAwKSB7CiAJCWlndF93YXJuKCJvcGVuIGZhaWxlZDogJXNc
biIsIHN0cmVycm9yKGVycm5vKSk7CiAJCXJldHVybiAtMTsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
