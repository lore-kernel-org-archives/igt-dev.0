Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361F410E354
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 08:13:44 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 May 2023 13:23:36 +0530
Message-Id: <20230509075340.48546-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 0/4] Fixed mode selection for MST modeset
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

This will find the connector mode combo that fits into the
bandwidth when more than one monitor is connected.

Mohammed Thasleem (4):
  tests/kms_display_modes: Add negative test for extended display
  lib/igt_kms: Check for other modes to fit on bw when ENOSPC failure
  tests/kms_display_modes: Fixed mode selection for extended mode tests
  tests/i915/kms_cdclk: Fixed mode selection for MST modeset

 lib/igt_kms.c             |   2 +
 tests/i915/kms_cdclk.c    |   5 ++
 tests/kms_display_modes.c | 170 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)

-- 
2.25.1
