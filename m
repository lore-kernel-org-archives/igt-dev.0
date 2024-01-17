Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D141610E691
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 13:39:33 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t v3 3/3] tests/intel-ci: Add mi_atomic test to
 fast-feedback
Date: Wed, 17 Jan 2024 14:26:11 +0100
Message-ID: <20240117132612.4836-4-nirmoy.das@intel.com>
In-Reply-To: <20240117132612.4836-1-nirmoy.das@intel.com>
References: <20240117132612.4836-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add this basic functionality test the fast feedback list.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index bef5b0b8a..da79c76b4 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -29,6 +29,8 @@ igt@xe_evict@evict-small-multi-vm-cm
 igt@xe_evict@evict-threads-small
 igt@xe_evict_ccs@evict-overcommit-simple
 igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
+igt@xe_exec_atomic@basic-inc-all
+igt@xe_exec_atomic@basic-dec-all
 igt@xe_exec_balancer@twice-virtual-basic
 igt@xe_exec_balancer@no-exec-virtual-basic
 igt@xe_exec_balancer@twice-cm-virtual-basic
-- 
2.42.0


