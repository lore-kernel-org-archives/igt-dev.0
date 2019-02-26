Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C2B89C6E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 07:29:23 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Tue, 26 Feb 2019 12:53:25 +0530
Message-Id: <1551165805-19130-5-git-send-email-ramalingam.c@intel.com>
In-Reply-To: <1551165805-19130-1-git-send-email-ramalingam.c@intel.com>
References: <1551165805-19130-1-git-send-email-ramalingam.c@intel.com>
Subject: [igt-dev] [PATCH i-g-t 4/4] DO NOT MERGE: CP in fast feedback list
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
To: igt-dev@lists.freedesktop.org, daniel.vetter@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yIGFkZGluZyB0aGUgSERDUCB0ZXN0cyBpbnRvIGZhc3RmZWVkYmFjayBsaXN0CgpTaWduZWQt
b2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Ci0tLQogdGVzdHMv
aW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFj
ay50ZXN0bGlzdCBiL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKaW5kZXgg
YTk1ZDJlOTVjNzQzLi5kYTFiYmI5YzFhN2IgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ludGVsLWNpL2Zh
c3QtZmVlZGJhY2sudGVzdGxpc3QKKysrIGIvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50
ZXN0bGlzdApAQCAtMTg1LDYgKzE4NSw5IEBAIGlndEBrbXNfY2hhbWVsaXVtQGhkbWktY3JjLWZh
c3QKIGlndEBrbXNfY2hhbWVsaXVtQHZnYS1ocGQtZmFzdAogaWd0QGttc19jaGFtZWxpdW1Admdh
LWVkaWQtcmVhZAogaWd0QGttc19jaGFtZWxpdW1AY29tbW9uLWhwZC1hZnRlci1zdXNwZW5kCitp
Z3RAa21zX2NvbnRlbnRfcHJvdGVjdGlvbkBsZWdhY3kKK2lndEBrbXNfY29udGVudF9wcm90ZWN0
aW9uQGF0b21pYworaWd0QGttc19jb250ZW50X3Byb3RlY3Rpb25Ac3JtCiBpZ3RAa21zX2N1cnNv
cl9sZWdhY3lAYmFzaWMtYnVzeS1mbGlwLWJlZm9yZS1jdXJzb3ItYXRvbWljCiBpZ3RAa21zX2N1
cnNvcl9sZWdhY3lAYmFzaWMtYnVzeS1mbGlwLWJlZm9yZS1jdXJzb3ItbGVnYWN5CiBpZ3RAa21z
X2N1cnNvcl9sZWdhY3lAYmFzaWMtZmxpcC1hZnRlci1jdXJzb3ItYXRvbWljCi0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
