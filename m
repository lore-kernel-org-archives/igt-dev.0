Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5FC6E2D4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Apr 2018 07:39:59 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Mon, 16 Apr 2018 09:39:54 +0200
Message-Id: <20180416073954.3651-1-katarzyna.dec@intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Reuse
 gen9_media_fill on Gen 10
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

TWVkaWEgZmlsbCBmdW5jdGlvbiBjYW4gYmUgcmV1c2VkIG9uIEdlbjEwLiBDb2RlIGhhcyBub3QK
Y2hhbmdlZC4gTGV0J3MgcmV1c2UgZ2VuOS4KCkNjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRl
bWFyY2hpQGludGVsLmNvbT4KQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNv
bT4KQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRl
bC5jb20+ClNpZ25lZC1vZmYtYnk6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwu
Y29tPgotLS0KIGxpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2Jh
dGNoYnVmZmVyLmMgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYwppbmRleCAxMGQ0ZGNlOC4uNTNk
ZGFlMjQgMTAwNjQ0Ci0tLSBhL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jCisrKyBiL2xpYi9pbnRl
bF9iYXRjaGJ1ZmZlci5jCkBAIC03OTQsNyArNzk0LDcgQEAgaWd0X2ZpbGxmdW5jX3QgaWd0X2dl
dF9tZWRpYV9maWxsZnVuYyhpbnQgZGV2aWQpCiB7CiAJaWd0X2ZpbGxmdW5jX3QgZmlsbCA9IE5V
TEw7CiAKLQlpZiAoSVNfR0VOOShkZXZpZCkpCisJaWYgKElTX0dFTjkoZGV2aWQpIHx8IElTX0dF
TjEwKGRldmlkKSkKIAkJZmlsbCA9IGdlbjlfbWVkaWFfZmlsbGZ1bmM7CiAJZWxzZSBpZiAoSVNf
R0VOOChkZXZpZCkpCiAJCWZpbGwgPSBnZW44X21lZGlhX2ZpbGxmdW5jOwotLSAKMi4xNC4zCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
