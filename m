Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B21E6EE85
 for <igt-dev@lists.freedesktop.org>; Fri, 18 May 2018 17:10:41 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 18 May 2018 18:10:40 +0100
Message-Id: <20180518171043.4438-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/3] intel/gem: test the partial
 whitelisting of the INSTPM register
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

SGksCgpPbiBIYXN3ZWxsLCBXZSB3b3VsZCBsaWtlIHRvIHN1cHBvcnQgdGhlIHNhbWUgZmVhdHVy
ZSB0aGF0IGlzIGFscmVhZHkKc3VwcG9ydGVkIG9uIEdlbjggb2YgY29uZmlndXJpbmcgdGhlIFJD
UyB0byB0dXJuIHNvbWUKM0RQUklNSVRJVkUvR1BVX1dBTEtFUiBpbnRvIE5PT1BzLgoKVGhpcyBz
ZXJpZXMgdmVyaWZ5IHRoZSBjaGFuZ2VzIG1hZGUgdG8gdGhlIGtlcm5lbCBjb21tYW5kIHBhcnNl
ci4KCkNoZWVycywKCkxpb25lbCBMYW5kd2VybGluICgzKToKICB0ZXN0cy9nZW1fZXhlY19wYXJz
ZTogYWRkIGEgcmVnaXN0ZXIgd3JpdGUgbWFzawogIHRlc3RzL2dlbV9leGVjX3BhcnNlOiB2ZXJp
ZnkgdGhhdCB3ZSBhbGxvdyBMUkkgb24gSU5TVFBNCiAgdGVzdC9nZW1fY3R4X2lzb2xhdGlvbjog
dmVyaWZ5IElOU1RQTSBpc29sYXRpb24gb24gR2VuNysKCiB0ZXN0cy9nZW1fY3R4X2lzb2xhdGlv
bi5jIHwgIDEgKwogdGVzdHMvZ2VtX2V4ZWNfcGFyc2UuYyAgICB8IDMzICsrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQoKLS0KMi4xNy4wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
