Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7614F10E571
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 11:29:43 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 0/2] add force bigjoiner test
Date: Wed, 10 Jan 2024 17:09:04 +0530
Message-Id: <20240110113906.523857-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Earlier bigjoiner was enabled only for below cases
a) for mode having hdisplay > 5k
b) if clock requirement were higher than 1 pipe could handle

https://patchwork.freedesktop.org/series/124730/
With above series we can force bigjoiner without such constraints.

Kunal Joshi (1):
  tests/intel/kms_big_joiner: add new test for force bigjoiner

Swati Sharma (1):
  lib/igt_kms: add helpers for big joiner debugfs

 lib/igt_kms.c                | 75 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h                |  3 ++
 tests/intel/kms_big_joiner.c | 82 +++++++++++++++++++++++++++++++++---
 3 files changed, 154 insertions(+), 6 deletions(-)

-- 
2.25.1
