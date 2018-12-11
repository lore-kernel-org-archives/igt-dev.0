Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56B06E282
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Dec 2018 16:16:10 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Tue, 11 Dec 2018 17:16:08 +0100
Message-Id: <20181211161608.7345-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] PSR: Bump wait for active timeout to 2.5s
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VHlwaWNhbGx5IFBTUiBlbmFibGVzIGluIGFyb3VuZCAxMzYgbXMsIGJ1dCB3aGVuIGVuYWJsaW5n
IDIKc2NyZWVucywgNTAwIG1zIGlzIG5vdCBlbm91Z2ggb24gaWNlbGFrZSBzb21ldGltZXMsIHNv
IGJ1bXAKaXQgYSBiaXQgaGlnaGVyLgoKT24ga21zX2Zyb250YnVmZmVyX3RyYWNraW5nOgpTdGFy
dGluZyBzdWJ0ZXN0OiBwc3ItMnAtc2NuZHNjcm4tc2hyZmItcGxmbGlwLWJsdApwc3JfYWN0aXZl
KGRlYnVnZnNfZmQsIHRydWUpIHRvb2sgMTM2bXMKcHNyX2FjdGl2ZShkZWJ1Z2ZzX2ZkLCB0cnVl
KSB0b29rIDEzNm1zCnBzcl9hY3RpdmUoZGVidWdmc19mZCwgdHJ1ZSkgdG9vayAzNTBtcwpwc3Jf
YWN0aXZlKGRlYnVnZnNfZmQsIHRydWUpIHRvb2sgMTM2bXMKcHNyX2FjdGl2ZShkZWJ1Z2ZzX2Zk
LCB0cnVlKSB0b29rIDE1OThtcwoKQ2M6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4u
cGFuZGl5YW5AaW50ZWwuY29tPgpDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+CkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3df
YnVnLmNnaT9pZD0xMDg3MzMKLS0tCiBsaWIvaWd0X3Bzci5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9w
c3IuYyBiL2xpYi9pZ3RfcHNyLmMKaW5kZXggMGRkZmI2NGYwZTcyLi4yNjU1MjEyMTdhMmQgMTAw
NjQ0Ci0tLSBhL2xpYi9pZ3RfcHNyLmMKKysrIGIvbGliL2lndF9wc3IuYwpAQCAtMzksNyArMzks
NyBAQCBzdGF0aWMgYm9vbCBwc3JfYWN0aXZlKGludCBkZWJ1Z2ZzX2ZkLCBib29sIGNoZWNrX2Fj
dGl2ZSkKIAogYm9vbCBwc3Jfd2FpdF9lbnRyeShpbnQgZGVidWdmc19mZCkKIHsKLQlyZXR1cm4g
aWd0X3dhaXQocHNyX2FjdGl2ZShkZWJ1Z2ZzX2ZkLCB0cnVlKSwgNTAwLCAyMCk7CisJcmV0dXJu
IGlndF93YWl0KHBzcl9hY3RpdmUoZGVidWdmc19mZCwgdHJ1ZSksIDI1MDAsIDIwKTsKIH0KIAog
Ym9vbCBwc3Jfd2FpdF9leGl0KGludCBkZWJ1Z2ZzX2ZkKQotLSAKMi4xOS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
