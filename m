Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F14989E3B
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Oct 2018 14:04:44 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Mon,  8 Oct 2018 17:04:19 +0300
Message-Id: <20181008140433.32399-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20181008140433.32399-1-arkadiusz.hiler@intel.com>
References: <20181008140433.32399-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [CI 02/16] fb: Only set the GEM domain on intel platforms
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

RnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KClRoZSBnZW1f
c2V0X2RvbWFpbiBjYWxsIHVzZXMgYW4gaTkxNSBzcGVjaWZpYyBpb2N0bCB0aGF0IHdpbGwgZmFp
bCBvbgphbnl0aGluZyBlbHNlLiBMZXQncyBtb3ZlIHRoYXQgY2FsbCB1bmRlciBhIGNoZWNrIGZv
ciB3aGV0aGVyIG9yIG5vdCB3ZSdyZQpydW5uaW5nIG9uIGFuIGludGVsIHBsYXRmb3JtLgoKU2ln
bmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KUmV2
aWV3ZWQtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KLS0t
CiBsaWIvaWd0X2ZiLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIu
YwppbmRleCBmMTMzMjE2OS4uYWFhOTBiZjcgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZmIuYworKysg
Yi9saWIvaWd0X2ZiLmMKQEAgLTEzNTYsOCArMTM1Niw5IEBAIHN0YXRpYyB2b2lkICptYXBfYm8o
aW50IGZkLCBzdHJ1Y3QgaWd0X2ZiICpmYikKIHsKIAl2b2lkICpwdHI7CiAKLQlnZW1fc2V0X2Rv
bWFpbihmZCwgZmItPmdlbV9oYW5kbGUsCi0JCSAgICAgICBJOTE1X0dFTV9ET01BSU5fR1RULCBJ
OTE1X0dFTV9ET01BSU5fR1RUKTsKKwlpZiAoaXNfaTkxNV9kZXZpY2UoZmQpKQorCQlnZW1fc2V0
X2RvbWFpbihmZCwgZmItPmdlbV9oYW5kbGUsCisJCQkgICAgICAgSTkxNV9HRU1fRE9NQUlOX0dU
VCwgSTkxNV9HRU1fRE9NQUlOX0dUVCk7CiAKIAlpZiAoZmItPmlzX2R1bWIpCiAJCXB0ciA9IGtt
c3Rlc3RfZHVtYl9tYXBfYnVmZmVyKGZkLCBmYi0+Z2VtX2hhbmRsZSwgZmItPnNpemUsCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
