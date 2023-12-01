Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCC210E91E
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 21:00:14 +0000 (UTC)
From: Brian Welty <brian.welty@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 13:00:11 -0800
Message-Id: <20231201210013.16147-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Fix xe_exec_reset@cm-gt-reset
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

Introduce _xe_wait_ufence() and use in xe_exec_reset.

Brian Welty (2):
  lib/xe_ioctl: Add _xe_wait_ufence()
  tests/xe/exec_reset: Fix cm-gt-reset

 lib/xe/xe_ioctl.c           | 22 ++++++++++++++++------
 lib/xe/xe_ioctl.h           |  3 +++
 tests/intel/xe_exec_reset.c | 11 ++++++++---
 3 files changed, 27 insertions(+), 9 deletions(-)

-- 
2.38.0
