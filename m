Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F1210E392
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 13:37:08 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 13:36:52 +0000
Message-Id: <20230711133653.2402574-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Remove unnecessary tests from
 fast-feedback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We have reached point where we need to reduce BAT testlist.
First step of cleaning up fast-feedback is covering:
 * remove 'race' testcases
 * reduce xe_exec_balancer, xe_exec_basic, xe_spin_batch test cases

Next steps:
 * some tests need to be on BAT list, but are failing - so these will be
   disabled from execution with blocklists
 * some tests need more analysis before deciding what should be a part of BAT 

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>

Katarzyna Dec (1):
  tests/intel-ci: Remove unnecessary tests from fast-feedback

 tests/intel-ci/xe-fast-feedback.testlist | 44 ------------------------
 1 file changed, 44 deletions(-)

-- 
2.34.1
