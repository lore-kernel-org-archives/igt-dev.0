Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1095210E14E
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Feb 2023 13:41:24 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Feb 2023 19:13:43 +0530
Message-Id: <20230227134347.28053-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/4] Validate max source size
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

i915 specific test is added to validate max source size width.

Swati Sharma (4):
  tests/kms_plane_scaling: Prep work
  tests/kms_plane_scaling: Minor fixes
  tests/kms_plane_scaling: Add test to validate max source size
  HAX: Add i915-max-source-size to fast-feedback.testlist

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/kms_plane_scaling.c             | 133 ++++++++++++++++++++++----
 2 files changed, 116 insertions(+), 18 deletions(-)

-- 
2.25.1
