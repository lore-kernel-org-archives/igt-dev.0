Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851B810E482
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jan 2022 09:08:54 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 17 Jan 2022 14:26:58 +0530
Message-Id: <20220117085700.1723228-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/2] Shared reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com, John.C.Harrison@Intel.com, saurabhg.gupta@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add lib to check for shared reset domain and 
igt_require condition to skip test when non preemption 
spinner submitted to all engines having shared reset domain.

v2: Some minox fixes.

v3: Added logic for multiple CCS.

Priyanka Dandamudi (2):
  lib/igt_gt: Check for shared reset domain
  tests/i915/gem_ctx_exec: Skip test for shared reset domain

 lib/igt_gt.c              | 20 ++++++++++++++++++++
 lib/igt_gt.h              |  2 ++
 tests/i915/gem_ctx_exec.c |  5 +++++
 3 files changed, 27 insertions(+)

-- 
2.25.1
