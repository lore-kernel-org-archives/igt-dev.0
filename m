Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988C26EC88
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2020 06:17:44 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date: Wed, 29 Apr 2020 11:42:26 +0530
Message-Id: <20200429061227.20343-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/1] tests/i915/gem_exec_reloc: free the
 spin in proper place
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Test is trying to set the domain for obj which is already submitted through
previous spin, since spin is not freed yet because of this test is unable to
set domain for obj

Bommu Krishnaiah (1):
  tests/i915/gem_exec_reloc: free the spin in proper place

 tests/i915/gem_exec_reloc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
