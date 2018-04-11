Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C173F891F8
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 14:45:28 +0000 (UTC)
From: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
Date: Wed, 11 Apr 2018 16:45:10 +0200
Message-Id: <20180411144513.25686-1-lukasz.kalamarz@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 0/3] lib/gen6_render.h refactoring
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

VGhpcyBwYXRjaCBpcyBzdGFydGluZyBhIHNlcmllcyBvZiByZWZhY3RvcmluZyBjaGFuZ2VzIGZv
ciAqcmVuZGVyKiAKbGlicy4gQSBsb3Qgb2YgY29kZSBpbiB0aG9zZSBsaWJyYXJpZXMgaXMgY29w
eS9wYXN0ZWQgYW5kIHJlbmFtZWQgZm9yCmRpZmZlcmVudCBnZW4uCgpDaGFuZ2VzIG1hZGUgaW4g
dGhpcyBwYXRjaDoKLSByZW1vdmFsIG9mIGR1cGxpY2F0ZWQgcmVnaXN0ZXJzIGRlZmluaXRpb25z
Ci0gbW92ZSBmaWVsZCBkZWZpbml0aW9ucyBhYm92ZSBpdCByZWdpc3RlciBkZWZpbml0aW9uCi0g
bW92ZSBkZWZpbml0aW9ucyBvZiByZWdpc3RlciBpbnRvIGFzY2VuZGluZyBvcmRlcgotIHVuaWZ5
IHNwYWNlcyBiZXR3ZWVuIHJlZ2lzdGVyIG5hbWUgYW5kIGl0J3MgYWRkcmVzcy92YWx1ZQoKdjI6
Ci0gcmVtb3ZhbCBvZiBzcGFyZSB3aGl0ZXNwYWNlcyBhbmQgbmV3bGluZXMKCnYzOgotIHNwbGl0
IGludG8gdGhyZWUgc21hbGxlciBjaHVua3MsIHdoaWNoIG1ha2UgcmV2aWV3IGVhc2llcgoKTHVr
YXN6IEthbGFtYXJ6ICgzKToKICBsaWIvZ2VuNl9yZW5kZXI6IFJlbW92YWwgb2YgZHVwbGljYXRl
ZCBkZWZpbml0aW9ucwogIGxpYi9nZW42X3JlbmRlcjogUmVvcmRlciByZWdpc3RlcnMgYW5kIGZp
ZWxkcyBkZWZpbml0aW9ucwogIGxpYi9nZW42X3JlbmRlcjogVW5pZnkgc3BhY2VzIGFuZCBvdGhl
ciBjb3NtZXRpYyBjaGFuZ2VzCgogbGliL2dlbjZfcmVuZGVyLmggfCAxOTY0ICsrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgODU1IGluc2VydGlvbnMoKyksIDExMDkgZGVsZXRpb25zKC0pCgotLSAKMi45LjUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
