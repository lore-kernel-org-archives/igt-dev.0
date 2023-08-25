Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5E810E5FF
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 05:42:07 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 11:16:59 +0530
Message-Id: <20230825054659.1320824-4-riana.tauro@intel.com>
In-Reply-To: <20230825054659.1320824-1-riana.tauro@intel.com>
References: <20230825054659.1320824-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] HAX: Add toggle-gt-c6 to
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

Add toggle-gt-c6 to xe-fast-feedback.testlist

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 311f90c79..9cf158f2e 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -144,6 +144,7 @@ igt@xe_mmap@vram-system
 igt@xe_mmio@mmio-timestamp
 igt@xe_mmio@mmio-invalid
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pm_residency@toggle-gt-c6
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.40.0
