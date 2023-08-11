Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09ECE10E686
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 10:27:09 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Aug 2023 16:02:15 +0530
Message-Id: <20230811103217.415744-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Idle Residency on Exec
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a test that validates idle residency on exec when
a background load is running approximately 1% of time.

Riana Tauro (2):
  tests/xe: Add a test that validates idle residency on exec
  HAX: Add idle-residency-on-exec to xe-fast-feedback.testlist

 tests/intel-ci/xe-fast-feedback.testlist |   1 +
 tests/xe/xe_pm_residency.c               | 135 ++++++++++++++++++++++-
 2 files changed, 134 insertions(+), 2 deletions(-)

-- 
2.40.0
