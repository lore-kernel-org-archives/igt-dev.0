Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22786E3FB
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Dec 2018 12:12:28 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed,  5 Dec 2018 14:12:24 +0200
Message-Id: <20181205121224.13529-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] runner: Produce json with
 results_version=10
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

TmV3IHBpZ2xpdCBidW1wZWQgaXRzIHJlc3VsdHNfdmVyc2lvbiB0byAxMCwgbWFraW5nIGdseGlu
Zm8gYW5kIHBhbHMKb3B0aW9uYWwgaW4gcHJhY3RpY2UsIG5vdCBqdXN0IGJ5IGFjY2lkZW50LiBV
bmZvcnR1bmF0ZWx5IHJlYWRpbmcKcmVzdWx0cyB3aXRoIG5ld2VyIHBpZ2xpdCBhdHRlbXB0cyB0
byBjb252ZXJ0IHRoZSByZXN1bHRzIHRvIHZlcnNpb24KMTAsIHJlYWRpbmcgZ2x4aW5mbyBhbmQg
cGFscywgYW5kIHRodXMgZmFpbHMuIEluIGEgaGlsYXJpb3VzIHN1bW1hcnk6CkEgY29tbWl0IHRv
IHBpZ2xpdCBtYWtpbmcgZ2x4aW5mbyBvcHRpb25hbCBtYWtlcyBpdCBtYW5kYXRvcnkgZm9yIHVz
LgoKUmVwb3J0ZWQtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEFya2Fk
aXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KQ2M6IEFuZGkgU2h5dGkgPGFu
ZGkuc2h5dGlAaW50ZWwuY29tPgotLS0KIHJ1bm5lci9yZXN1bHRnZW4uYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3J1
bm5lci9yZXN1bHRnZW4uYyBiL3J1bm5lci9yZXN1bHRnZW4uYwppbmRleCBiMDkzM2FkNy4uZjJi
ZjYyYjMgMTAwNjQ0Ci0tLSBhL3J1bm5lci9yZXN1bHRnZW4uYworKysgYi9ydW5uZXIvcmVzdWx0
Z2VuLmMKQEAgLTEwMjYsNyArMTAyNiw3IEBAIHN0cnVjdCBqc29uX29iamVjdCAqZ2VuZXJhdGVf
cmVzdWx0c19qc29uKGludCBkaXJmZCkKIAogCW9iaiA9IGpzb25fb2JqZWN0X25ld19vYmplY3Qo
KTsKIAlqc29uX29iamVjdF9vYmplY3RfYWRkKG9iaiwgIl9fdHlwZV9fIiwganNvbl9vYmplY3Rf
bmV3X3N0cmluZygiVGVzdHJ1blJlc3VsdCIpKTsKLQlqc29uX29iamVjdF9vYmplY3RfYWRkKG9i
aiwgInJlc3VsdHNfdmVyc2lvbiIsIGpzb25fb2JqZWN0X25ld19pbnQoOSkpOworCWpzb25fb2Jq
ZWN0X29iamVjdF9hZGQob2JqLCAicmVzdWx0c192ZXJzaW9uIiwganNvbl9vYmplY3RfbmV3X2lu
dCgxMCkpOwogCWpzb25fb2JqZWN0X29iamVjdF9hZGQob2JqLCAibmFtZSIsCiAJCQkgICAgICAg
c2V0dGluZ3MubmFtZSA/CiAJCQkgICAgICAganNvbl9vYmplY3RfbmV3X3N0cmluZyhzZXR0aW5n
cy5uYW1lKSA6Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
