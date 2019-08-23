Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607B16EBE8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2019 08:04:16 +0000 (UTC)
From: Madhumitha Tolakanahalli Pradeep
 <madhumitha.tolakanahalli.pradeep@intel.com>
Date: Thu, 22 Aug 2019 17:06:46 -0700
Message-Id: <20190823000648.31558-1-madhumitha.tolakanahalli.pradeep@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Added tile property parser library
 function and IGT test for DP tiled displays
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

Ck1hZGh1bWl0aGEgVG9sYWthbmFoYWxsaSBQcmFkZWVwICgyKToKICBpZ3QvdGVzdHMva21zX2Rw
X3RpbGVkX2Rpc3BsYXk6IGttcyB0ZXN0IGZvciBkaXNwbGF5IHBvcnQgdGlsZWQKICAgIGRpc3Bs
YXlzCiAgbGliL2lndF9rbXM6IGFkZGVkIHRpbGUgcHJvcGVydHkgcGFyc2VyCgogbGliL2lndF9r
bXMuYyAgICAgICAgICAgICAgICB8ICAyOSArKysKIGxpYi9pZ3Rfa21zLmggICAgICAgICAgICAg
ICAgfCAgMTEgKysKIHRlc3RzL01ha2VmaWxlLnNvdXJjZXMgICAgICAgfCAgIDEgKwogdGVzdHMv
a21zX2RwX3RpbGVkX2Rpc3BsYXkuYyB8IDM0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogdGVzdHMvbWVzb24uYnVpbGQgICAgICAgICAgICB8ICAgMSArCiA1IGZpbGVzIGNo
YW5nZWQsIDM4OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMva21zX2Rw
X3RpbGVkX2Rpc3BsYXkuYwoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
