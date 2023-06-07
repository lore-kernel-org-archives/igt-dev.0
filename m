Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490DD10E4B6
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 11:31:53 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Jun 2023 16:55:56 +0530
Message-Id: <20230607112558.55830-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Fixed mode selection for MST modeset
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

From: Swati Sharma <swati2.sharma@intel.com>

This will find the connector mode combo that fits into the
bandwidth when more than one monitor is connected.

Mohammed Thasleem (2):
  tests/kms_display_modes: Fixed mode selection for extended mode tests
  tests/i915/kms_cdclk: Fixed mode selection for MST modeset

 tests/i915/kms_cdclk.c    | 5 +++++
 tests/kms_display_modes.c | 5 +++++
 2 files changed, 10 insertions(+)

-- 
2.25.1
