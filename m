Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A3E10E070
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Aug 2023 16:48:04 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  6 Aug 2023 22:17:25 +0530
Message-Id: <20230806164729.1016167-1-swati2.sharma@intel.com>
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
Cc: ankit.k.nautiyal@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DP-MST helpers are created to remove duplicate code.
Also, fix is added for excessive logging in deep-color
test seen on mst setup.

Swati Sharma (4):
  lib/igt_kms: add helper to check if output is mst
  lib/igt_kms: add helper for dp-mst connector id
  tests/kms: use dp-mst helpers
  tests/kms_color: skip deep-color test for mst

 lib/igt_kms.c                  | 61 ++++++++++++++++++++++++++++++++++
 lib/igt_kms.h                  |  2 ++
 tests/kms_color.c              | 13 ++++++--
 tests/kms_content_protection.c | 33 ++----------------
 tests/kms_display_modes.c      | 34 ++-----------------
 5 files changed, 78 insertions(+), 65 deletions(-)

-- 
2.25.1
