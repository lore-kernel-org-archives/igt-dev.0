Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9928210E5DF
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jun 2023 15:48:02 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Jun 2023 08:47:56 -0700
Message-Id: <20230608154756.2866519-5-ashutosh.dixit@intel.com>
In-Reply-To: <20230608154756.2866519-1-ashutosh.dixit@intel.com>
References: <20230608154756.2866519-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] HAX: Add gem_ctx_freq to BAT testlist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 31639c892987..0ef62e0f60b6 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -19,6 +19,7 @@ igt@gem_close_race@basic-threads
 igt@gem_ctx_create@basic
 igt@gem_ctx_create@basic-files
 igt@gem_ctx_exec@basic
+igt@gem_ctx_freq@sysfs
 igt@gem_exec_basic@basic
 igt@gem_exec_create@basic
 igt@gem_exec_fence@basic-busy
-- 
2.38.0
