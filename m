Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A187B6EC6D
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2019 15:55:44 +0000 (UTC)
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Fri, 20 Dec 2019 21:10:29 +0530
Message-Id: <20191220154030.25684-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/1] tests/i915/gem_ctx_persistence:
 pre-emption
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Check for I915_SCHEDULER_CAP_PREEMPTION support, if driver has support for
pre-emption test will continue otherwise skip the test

Bommu, Krishnaiah (1):
  tests/i915/gem_ctx_persistence: pre-emption support check.

 tests/i915/gem_ctx_persistence.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
