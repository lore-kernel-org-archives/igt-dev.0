Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D210010E58A
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 08:49:34 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Sep 2023 14:25:06 +0530
Message-Id: <20230921085508.2926812-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Add freq_power test
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

Rev2: Change test name and modify documentation

Riana Tauro (2):
  tests/intel/xe_guc_pc: Add freq-power test
  HAX: Add freq-power to xe-fast-feedback.testlist

 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/intel/xe_guc_pc.c                  | 88 ++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

-- 
2.40.0
