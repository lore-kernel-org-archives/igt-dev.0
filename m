Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1E86E384
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Dec 2018 18:06:50 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue, 11 Dec 2018 18:06:47 +0000
Message-Id: <20181211180647.23186-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20181211180647.23186-1-lionel.g.landwerlin@intel.com>
References: <20181211180647.23186-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/perf: polling: fix uninitialized
 start_times
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

Tm90IHF1aXRlIHN1cmUgaG93IHRoYXQgZmVsbCB0aHJvdWdoIHRoZSBjcmFja3MgZm9yIHNvIGxv
bmcuLi4KClNpZ25lZC1vZmYtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2Vy
bGluQGludGVsLmNvbT4KQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hv
d19idWcuY2dpP2lkPTEwMjI1MgotLS0KIHRlc3RzL3BlcmYuYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcGVyZi5jIGIvdGVzdHMvcGVy
Zi5jCmluZGV4IDIyMGM1MmVmLi41NGU3ZjRmNCAxMDA2NDQKLS0tIGEvdGVzdHMvcGVyZi5jCisr
KyBiL3Rlc3RzL3BlcmYuYwpAQCAtMjIzMCw2ICsyMjMwLDcgQEAgdGVzdF9wb2xsaW5nKHZvaWQp
CiAJICogdGhlIGVycm9yIGRlbHRhLgogCSAqLwogCXN0YXJ0ID0gZ2V0X3RpbWUoKTsKKwl0aW1l
cygmc3RhcnRfdGltZXMpOwogCWRvX2lvY3RsKHN0cmVhbV9mZCwgSTkxNV9QRVJGX0lPQ1RMX0VO
QUJMRSwgMCk7CiAJZm9yICgvKiBub3AgKi87ICgoZW5kID0gZ2V0X3RpbWUoKSkgLSBzdGFydCkg
PCB0ZXN0X2R1cmF0aW9uX25zOyAvKiBub3AgKi8pIHsKIAkJc3RydWN0IHBvbGxmZCBwb2xsZmQg
PSB7IC5mZCA9IHN0cmVhbV9mZCwgLmV2ZW50cyA9IFBPTExJTiB9OwotLSAKMi4yMC4wLnJjMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
