Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C8110E206
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 19:43:07 +0000 (UTC)
From: Brian Welty <brian.welty@intel.com>
To: igt-dev@lists.freedesktop.org,
	Pallavi Mishra <pallavi.mishra@intel.com>
Date: Mon,  4 Dec 2023 11:43:04 -0800
Message-Id: <20231204194306.12950-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Fix xe_exec_reset@cm-gt-reset
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

Introduce __xe_wait_ufence() and use in xe_exec_reset.

v2: Add underscore to name, assert timeout is valid (Kamil)
    Don't validate xe_exec results for GT_RESET (Pallavi)

Brian Welty (2):
  lib/xe_ioctl: Add __xe_wait_ufence()
  tests/intel/xe_exec_reset: Fix cm-gt-reset

 lib/xe/xe_ioctl.c           | 24 ++++++++++++++++++------
 lib/xe/xe_ioctl.h           |  3 +++
 tests/intel/xe_exec_reset.c | 21 ++++++++++++++++-----
 3 files changed, 37 insertions(+), 11 deletions(-)

-- 
2.38.0
