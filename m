Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5339D10E1AF
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 14:11:59 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Mon, 31 Jul 2023 19:39:52 +0530
Message-Id: <20230731140953.1167462-4-priyanka.dandamudi@intel.com>
In-Reply-To: <20230731140953.1167462-1-priyanka.dandamudi@intel.com>
References: <20230731140953.1167462-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] xe-fast-feedback.testlist: Add sysfs
 tests to BAT
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add sysfs_scheduler and sysfs_defaults to BAT.
This validates the basic sysfs scheduler parameters.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Acked-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 2799d9cfb..c994d29e9 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -164,6 +164,16 @@ igt@xe_query@query-invalid-query
 igt@xe_query@query-invalid-size
 igt@xe_spin_batch@spin-basic
 igt@xe_spin_batch@spin-batch
+igt@xe_sysfs_defaults@engine-defaults
+igt@xe_sysfs_scheduler@preempt_timeout_us-invalid
+igt@xe_sysfs_scheduler@preempt_timeout_us-min-max
+igt@xe_sysfs_scheduler@preempt_timeout_us-nonprivileged-user
+igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
+igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
+igt@xe_sysfs_scheduler@timeslice_duration_us-nonprivileged-user
+igt@xe_sysfs_scheduler@job_timeout_ms-invalid
+igt@xe_sysfs_scheduler@job_timeout_ms-min-max
+igt@xe_sysfs_scheduler@job_timeout_ms-nonprivileged-user
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.25.1
