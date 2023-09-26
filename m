Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CE610E3B8
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 11:56:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Tue, 26 Sep 2023 17:17:49 +0530
Message-Id: <20230926114751.2757259-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/2] kms_pm_lpsp: Test optimization
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

Optimizations:
- Don't skip dynamic subtest, instead don't run it
- Remove hard coded pipe & make it generic
- Fix bigjoiner checks

Bhanuprakash Modem (2):
  tests/intel/kms_pm_lpsp: Test optimization
  tests/intel/kms_pm_lpsp: Fix Bigjoiner checks

 tests/intel/kms_pm_lpsp.c | 70 +++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 25 deletions(-)

--
2.40.0
