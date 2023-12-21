Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AC710E6EB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 16:34:56 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 0/4] Add d3 mmap test
Date: Thu, 21 Dec 2023 22:03:34 +0530
Message-Id: <20231221163338.2157257-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kamil.konieczny@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add d3 mmap test.

Anshuman Gupta (4):
  test/xe_pm: Add exit handler to close fw handle
  lib/igt_pm: Add helper to get/set auto_suspenddelay_ms
  tests/xe_pm: Add d3-mmap IGT test
  HAX: Add d3-mmap to xe-fast-feedback

 lib/igt_pm.c                             |  53 ++++++---
 lib/igt_pm.h                             |   2 +
 tests/intel-ci/xe-fast-feedback.testlist |   1 +
 tests/intel/xe_pm.c                      | 131 +++++++++++++++++++++--
 4 files changed, 166 insertions(+), 21 deletions(-)

-- 
2.25.1
