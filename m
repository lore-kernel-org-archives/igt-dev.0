Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19C310E02A
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Aug 2023 10:54:11 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  4 Aug 2023 10:53:57 +0000
Message-Id: <20230804105358.3079020-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] tests/intel-ci: Reduce xe_exec_threads
 tests in BATs
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

We received recommendation for KMD team to reduce xe_exec_threads
tests to have only:
igt@xe_exec_threads@threads-basic
igt@xe_exec_threads@threads-mixed-basic
igt@xe_exec_threads@threads-mixed-shared-vm-basic
igt@xe_exec_threads@threads-mixed-fd-basic
NEW igt@xe_exec_threads@threads-mixed-userptr-invalidate
NEW igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>

Katarzyna Dec (1):
  tests/intel-ci: Reduce xe_exec_threads tests in BATs

 tests/intel-ci/xe-fast-feedback.testlist | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

-- 
2.34.1
