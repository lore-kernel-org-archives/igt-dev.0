Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6402110E667
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 13:24:26 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 18:53:58 +0530
Message-Id: <20230922132401.177284-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Add d3 mmap test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding d3 mmap test and adding forcewake igt exit handler to 
vram-d3cold-threshold as well.

Anshuman Gupta (3):
  tests/xe_pm: Add d3-mmap IGT test
  test/xe_pm: Use fw_handle exit handler for vram-d3cold-threshold
  HAX: Add d3-mmap to xe-fast-feedback

 tests/intel-ci/xe-fast-feedback.testlist |   1 +
 tests/intel/xe_pm.c                      | 114 +++++++++++++++++++++--
 2 files changed, 106 insertions(+), 9 deletions(-)

-- 
2.25.1
