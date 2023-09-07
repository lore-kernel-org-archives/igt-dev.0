Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C9410E761
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 06:02:32 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Sep 2023 11:36:36 +0530
Message-Id: <20230907060638.2317485-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add freq_power test
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

This test runs a spinner and sets the min and max frequencies
to rp0 and rpn respectively. It then checks if power measured
at lower frequencies is lesser.

Riana Tauro (2):
  test/intel/xe_guc_pc: Add freq_power test
  HAX: Add freq_power to xe-fast-feedback.testlist

 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/intel/xe_guc_pc.c                  | 88 ++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

-- 
2.40.0
