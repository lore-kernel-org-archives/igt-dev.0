Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86CB10E03A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 07:33:21 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [v2 0/3] Add dsc+bigjoiner subtest
Date: Thu, 11 Jan 2024 13:04:59 +0530
Message-Id: <20240111073502.151340-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series uses big joiner debugfs from
https://patchwork.freedesktop.org/series/124730/
New subtest is added to validate dsc + big joiner use case.

Swati Sharma (3):
  lib/igt_kms: add helpers for big joiner debugfs
  tests/intel/kms_dsc_helper: add dsc+big joiner helper func
  tests/intel/kms_dsc: add new subtest

 lib/igt_kms.c                | 75 ++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h                |  3 ++
 tests/intel/kms_dsc.c        | 29 ++++++++++++--
 tests/intel/kms_dsc_helper.c | 32 +++++++++++++++
 tests/intel/kms_dsc_helper.h |  3 ++
 5 files changed, 139 insertions(+), 3 deletions(-)

-- 
2.25.1
