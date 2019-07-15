Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C74A89FC9
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2019 21:51:45 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 15 Jul 2019 14:51:31 -0700
Message-Id: <20190715215136.21744-6-lucas.demarchi@intel.com>
In-Reply-To: <20190715215136.21744-1-lucas.demarchi@intel.com>
References: <20190715215136.21744-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 05/10] lib/instdone.c/tgl: Add Gen12 support
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
Cc: Javier Villavicencio <javier.villavicencio@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogSmF2aWVyIFZpbGxhdmljZW5jaW8gPGphdmllci52aWxsYXZpY2VuY2lvQGludGVsLmNv
bT4KClNhbWUgYXMgR0VOMTEuCgpTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgVmlsbGF2aWNlbmNpbyA8
amF2aWVyLnZpbGxhdmljZW5jaW9AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBN
YXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KLS0tCiBsaWIvaW5zdGRvbmUuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2xpYi9pbnN0ZG9uZS5jIGIvbGliL2luc3Rkb25lLmMKaW5kZXggYTgzZjg4MzYuLmFh
NjQzNmM2IDEwMDY0NAotLS0gYS9saWIvaW5zdGRvbmUuYworKysgYi9saWIvaW5zdGRvbmUuYwpA
QCAtNDI4LDcgKzQyOCw3IEBAIGluaXRfZ2VuMTFfaW5zdGRvbmUodm9pZCkKIGJvb2wKIGluaXRf
aW5zdGRvbmVfZGVmaW5pdGlvbnModWludDMyX3QgZGV2aWQpCiB7Ci0JaWYgKElTX0dFTjExKGRl
dmlkKSkgeworCWlmIChJU19HRU4xMShkZXZpZCkgfHwgSVNfR0VOMTIoZGV2aWQpKSB7CiAJCWlu
aXRfZ2VuMTFfaW5zdGRvbmUoKTsKIAl9IGVsc2UgaWYgKElTX0dFTjgoZGV2aWQpIHx8IElTX0dF
TjkoZGV2aWQpIHx8IElTX0dFTjEwKGRldmlkKSkgewogCQlpbml0X2dlbjhfaW5zdGRvbmUoKTsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
