Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF626E001
 for <igt-dev@lists.freedesktop.org>; Mon, 21 May 2018 11:23:44 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 21 May 2018 12:23:35 +0100
Message-Id: <20180521112339.16650-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 0/4] intel/gem: test the partial
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
ci4KCkNoZWVycywKCkxpb25lbCBMYW5kd2VybGluICg0KToKICB0ZXN0cy9nZW1fZXhlY19wYXJz
ZTogYWRkIGEgcmVnaXN0ZXIgd3JpdGUgbWFzawogIHRlc3RzL2dlbV9leGVjX3BhcnNlOiB2ZXJp
ZnkgdGhhdCB3ZSBhbGxvdyBMUkkgb24gSU5TVFBNCiAgdGVzdHMvZ2VtX2N0eF9pc29sYXRpb246
IGFkZCBhIGNvbW1hbmQgcGFyc2VyIHZlcnNpb24gdG8gcmVnaXN0ZXJzCiAgdGVzdHMvZ2VtX2N0
eF9pc29sYXRpb246IHZlcmlmeSBJTlNUUE0gaXNvbGF0aW9uIG9uIEdlbjcrCgogdGVzdHMvZ2Vt
X2N0eF9pc29sYXRpb24uYyB8IDE3OSArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLQogdGVzdHMvZ2VtX2V4ZWNfcGFyc2UuYyAgICB8ICAzOSArKysrKysrLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMTMzIGluc2VydGlvbnMoKyksIDg1IGRlbGV0aW9ucygtKQoKLS0KMi4xNy4wCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
