Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A5F10E0FA
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Sep 2023 10:12:11 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 29 Sep 2023 15:41:53 +0530
Message-Id: <20230929101155.614980-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/2] Add d3 mmap test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding d3 mmap test and adding forcewake igt exit handler.

Anshuman Gupta (2):
  test/xe_pm: Add exit handler to close fw handle
  tests/xe_pm: Add d3-mmap IGT test

 tests/intel/xe_pm.c | 122 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 113 insertions(+), 9 deletions(-)

-- 
2.25.1
