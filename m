Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A806E6A6
 for <igt-dev@lists.freedesktop.org>; Thu, 24 May 2018 14:59:01 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu, 24 May 2018 15:58:55 +0100
Message-Id: <20180524145857.19696-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t v5 0/2] intel: per context powergating tests
 & benchmark
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

SGkgYWxsLAoKVXBkYXRpbmcgdGhlIHNlcmllcyBmb3Iga2VybmVsIHNpZGUgY2hhbmdlcyA6KQoK
Q2hlZXJzLAoKTGlvbmVsIExhbmR3ZXJsaW4gKDIpOgogIGhlYWRlcnM6IGJ1bXAKICB0ZXN0czog
YWRkIHNsaWNlIHBvd2VyIHByb2dyYW1taW5nIHRlc3QKCiBpbmNsdWRlL2RybS11YXBpL2FtZGdw
dV9kcm0uaCAgfCAgIDIzICsKIGluY2x1ZGUvZHJtLXVhcGkvZHJtLmggICAgICAgICB8ICAgIDcg
KwogaW5jbHVkZS9kcm0tdWFwaS9kcm1fbW9kZS5oICAgIHwgICAyMiArLQogaW5jbHVkZS9kcm0t
dWFwaS9ldG5hdml2X2RybS5oIHwgICAgNiArCiBpbmNsdWRlL2RybS11YXBpL2V4eW5vc19kcm0u
aCAgfCAgMjQwICsrKysrKysrCiBpbmNsdWRlL2RybS11YXBpL2k5MTVfZHJtLmggICAgfCAgIDQz
ICsrCiBpbmNsdWRlL2RybS11YXBpL21zbV9kcm0uaCAgICAgfCAgICAyICsKIGluY2x1ZGUvZHJt
LXVhcGkvdGVncmFfZHJtLmggICB8ICA0OTIgKysrKysrKysrKysrKystCiBpbmNsdWRlL2RybS11
YXBpL3ZjNF9kcm0uaCAgICAgfCAgIDEzICstCiBpbmNsdWRlL2RybS11YXBpL3ZpcnRncHVfZHJt
LmggfCAgICAxICsKIHRlc3RzL01ha2VmaWxlLnNvdXJjZXMgICAgICAgICB8ICAgIDEgKwogdGVz
dHMvZ2VtX2N0eF9wYXJhbS5jICAgICAgICAgIHwgICAgNCArLQogdGVzdHMvZ2VtX2N0eF9zc2V1
LmMgICAgICAgICAgIHwgMTAxNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGVz
dHMvbWVzb24uYnVpbGQgICAgICAgICAgICAgIHwgICAgMSArCiAxNCBmaWxlcyBjaGFuZ2VkLCAx
ODU1IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRl
c3RzL2dlbV9jdHhfc3NldS5jCgotLQoyLjE3LjAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
