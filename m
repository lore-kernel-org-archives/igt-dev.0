Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ACE10E624
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 15:58:23 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] Add dsc+bigjoiner subtest
Date: Fri,  5 Jan 2024 21:29:48 +0530
Message-Id: <20240105155951.124374-1-swati2.sharma@intel.com>
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
  tests/intel/kms_dsc: add new subtest
  tests/intel/kms_dsc_helper: add dsc+big joiner helper func

 lib/igt_kms.c                | 75 ++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h                |  3 ++
 tests/intel/kms_dsc.c        | 16 ++++++++
 tests/intel/kms_dsc_helper.c | 32 +++++++++++++++
 tests/intel/kms_dsc_helper.h |  3 ++
 5 files changed, 129 insertions(+)

-- 
2.25.1
