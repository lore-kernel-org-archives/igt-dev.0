Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43036898AF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 11:56:46 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 16 Aug 2021 13:56:26 +0200
Message-Id: <20210816115626.22759-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
References: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] HAX: remove gttfill for tgl ci
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/intel-ci/fast-feedback.testlist | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index fa5006d2e..cac694b61 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -22,7 +22,6 @@ igt@gem_exec_fence@basic-busy
 igt@gem_exec_fence@basic-wait
 igt@gem_exec_fence@basic-await
 igt@gem_exec_fence@nb-await
-igt@gem_exec_gttfill@basic
 igt@gem_exec_parallel@engines
 igt@gem_exec_store@basic
 igt@gem_exec_suspend@basic-s0
-- 
2.26.0
