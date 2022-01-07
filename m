Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1D910F5E6
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jan 2022 16:30:51 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Fri,  7 Jan 2022 21:49:18 +0530
Message-Id: <20220107161920.1643369-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Shared reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com, John.C.Harrison@Intel.com, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add lib to check for shared reset domain and 
igt_require condition to skip test when non preemption 
spinner submitted to all engines having shared reset domain.

Priyanka Dandamudi (2):
  lib/igt_gt: Check for shared reset domain
  tests/i915/gem_ctx_exec: Skip test for shared reset domain

 lib/igt_gt.c              | 17 +++++++++++++++++
 lib/igt_gt.h              |  2 ++
 tests/i915/gem_ctx_exec.c |  1 +
 3 files changed, 20 insertions(+)

-- 
2.25.1
