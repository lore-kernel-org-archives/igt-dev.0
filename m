Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CC910E049
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 19:40:45 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Aug 2023 01:10:32 +0530
Message-Id: <20230808194036.1045626-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] dp-mst helpers
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

DP-MST helpers are created to remove duplicate code.
Also, fix is added for excessive logging in deep-color
test seen on mst setup.

v2: -addressed review comments from Bhanu

Swati Sharma (4):
  lib/igt_kms: add helper to check if output is mst
  lib/igt_kms: add helper for dp-mst connector id
  tests/kms: use dp-mst helpers
  tests/kms_color: skip deep-color test for mst

 lib/igt_kms.c                  | 52 ++++++++++++++++++++++++++++++++++
 lib/igt_kms.h                  |  2 ++
 tests/kms_color.c              | 13 +++++++--
 tests/kms_content_protection.c | 33 ++-------------------
 tests/kms_display_modes.c      | 34 ++--------------------
 5 files changed, 69 insertions(+), 65 deletions(-)

-- 
2.25.1
