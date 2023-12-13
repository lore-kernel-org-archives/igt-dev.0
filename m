Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73ADB10E74D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 10:26:58 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] add new test for dark screen detection
Date: Wed, 13 Dec 2023 16:04:40 +0530
Message-Id: <20231213103442.2599632-1-kunal1.joshi@intel.com>
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

dark screen detection feature when enable will monitor frames
and if black frame is detcted it will raise drm_error, added
two tests for positive (black frame) and negative case (white frame)

Kunal Joshi (2):
  lib/igt_debugfs: added helper to enable/disable dark screen detection
  tests/intel/kms_dark_screen_detection: Added IGT for validating dark
    screen detection

 lib/igt_debugfs.c                      |  39 +++++
 lib/igt_debugfs.h                      |   2 +
 tests/intel/kms_darkscreen_detection.c | 196 +++++++++++++++++++++++++
 tests/meson.build                      |   1 +
 4 files changed, 238 insertions(+)
 create mode 100644 tests/intel/kms_darkscreen_detection.c

-- 
2.25.1
