Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9E310E626
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 16:09:27 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 16:05:16 +0000
Message-Id: <20230803160517.3054990-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] tests/intel-ci: Remove deleted IGT test
 from PVC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In commit xe_guc_pc@*rc6* testcases were remove from code:

commit 38af51c0ce6d9573793f53fc32782b77061bf169
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Fri Jun 30 12:34:39 2023 +0530

tests/xe/xe_guc_pc: Remove rc6 tests

Remove these tests as sysfs paths have been changed and
a generic naming used.

Let's remove test from blocklist.

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Katarzyna Dec (1):
  tests/intel-ci: Remove deleted IGT test from PVC blocklist

 tests/intel-ci/xe.pvc.blocklist.txt | 1 -
 1 file changed, 1 deletion(-)

-- 
2.34.1
