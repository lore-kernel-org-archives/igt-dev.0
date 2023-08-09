Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9700510E243
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 07:01:49 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Aug 2023 12:36:40 +0530
Message-Id: <20230809070640.270414-6-riana.tauro@intel.com>
In-Reply-To: <20230809070640.270414-1-riana.tauro@intel.com>
References: <20230809070640.270414-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 5/5] HAX: Add gt-c6-freeze to
 xe-fast-feedback.testlist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add gt-c6-freeze to xe-fast-feedback.testlist

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f7c6b62f5..bce880a1b 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -144,6 +144,7 @@ igt@xe_mmap@vram-system
 igt@xe_mmio@mmio-timestamp
 igt@xe_mmio@mmio-invalid
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pm_residency@gt-c6-freeze
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.40.0
