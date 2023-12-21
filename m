Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A551710E6D3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 16:35:06 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 4/4] HAX: Add d3-mmap to xe-fast-feedback
Date: Thu, 21 Dec 2023 22:03:38 +0530
Message-Id: <20231221163338.2157257-5-anshuman.gupta@intel.com>
In-Reply-To: <20231221163338.2157257-1-anshuman.gupta@intel.com>
References: <20231221163338.2157257-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kamil.konieczny@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding d3-mmap to xe-fast-feedback.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index bef5b0b8a..eafeb83a8 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -113,6 +113,7 @@ igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pm@d3-mmap
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.25.1
