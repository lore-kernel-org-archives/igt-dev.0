Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496DC89B97
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Mar 2018 08:37:41 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed, 28 Mar 2018 10:37:36 +0200
Message-Id: <20180328083736.10249-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20180327132840.GI16453@ahiler-desk1.ger.corp.intel.com>
References: <20180327132840.GI16453@ahiler-desk1.ger.corp.intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: Improve connector probing in
 igt_display_init(), v2.
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

T25seSBkbyBhIGZ1bGwgcHJvYmUgd2hlbiB0aGUgaW5pdGlhbCBjb25uZWN0b3Igc3RhdHVzIGlz
IHVua25vd24sIGFuZApvdGhlcndpc2Ugc2tpcCBpdC4gVGhpcyBzaG91bGQgc3BlZWQgdXAga21z
IHRlc3RzIGV2ZXIgc28gc2xpZ2h0bHkuCgpBbHNvIHNldCBwaXBlIHRvIFBJUEVfTk9ORSBmb3Ig
aWd0X291dHB1dF9yZWZyZXNoKCksIHRvIG1ha2UgdGhlCmNvbm5lY3RvciBpbmZvIHNsaWdodGx5
IG1vcmUgYWNjdXJhdGUuCgpDaGFuZ2VzIHNpbmNlIHYxOgotIEluc3RlYWQgb2YgYSBmb3JjZV9y
ZXByb2JlIHRyaXN0YXRlLCBvbmx5IGZvcmNlIHJlcHJvYmUgZnJvbQogIGlndF9kaXNwbGF5X2lu
aXQoKSB3aGVuIGFuIHVua25vd24gY29ubmVjdGlvbiBpcyBmb3VuZC4KClNpZ25lZC1vZmYtYnk6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNj
OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Ci0tLQogbGliL2ln
dF9rbXMuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwpp
bmRleCAyYjgxY2FiYjA1ZDguLjE5ZDY1MGE4ZGNmOCAxMDA2NDQKLS0tIGEvbGliL2lndF9rbXMu
YworKysgYi9saWIvaWd0X2ttcy5jCkBAIC0xOTU1LDExICsxOTU1LDE3IEBAIHZvaWQgaWd0X2Rp
c3BsYXlfaW5pdChpZ3RfZGlzcGxheV90ICpkaXNwbGF5LCBpbnQgZHJtX2ZkKQogCQkgKiBXZSBk
b24ndCBhc3NpZ24gZWFjaCBvdXRwdXQgYSBwaXBlIHVubGVzcwogCQkgKiBhIHBpcGUgaXMgc2V0
IHdpdGggaWd0X291dHB1dF9zZXRfcGlwZSgpLgogCQkgKi8KLQkJb3V0cHV0LT5mb3JjZV9yZXBy
b2JlID0gdHJ1ZTsKKwkJb3V0cHV0LT5wZW5kaW5nX3BpcGUgPSBQSVBFX05PTkU7CiAJCW91dHB1
dC0+aWQgPSByZXNvdXJjZXMtPmNvbm5lY3RvcnNbaV07CiAJCW91dHB1dC0+ZGlzcGxheSA9IGRp
c3BsYXk7CiAKIAkJaWd0X291dHB1dF9yZWZyZXNoKG91dHB1dCk7CisKKwkJaWYgKG91dHB1dC0+
Y29uZmlnLmNvbm5lY3RvciAmJgorCQkgICAgb3V0cHV0LT5jb25maWcuY29ubmVjdG9yLT5jb25u
ZWN0aW9uID09IERSTV9NT0RFX1VOS05PV05DT05ORUNUSU9OKSB7CisJCQlvdXRwdXQtPmZvcmNl
X3JlcHJvYmUgPSB0cnVlOworCQkJaWd0X291dHB1dF9yZWZyZXNoKG91dHB1dCk7CisJCX0KIAl9
CiAKIAlkcm1Nb2RlRnJlZVBsYW5lUmVzb3VyY2VzKHBsYW5lX3Jlc291cmNlcyk7Ci0tIAoyLjE2
LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
