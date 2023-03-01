Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B01A10E0BB
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Mar 2023 11:39:57 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  1 Mar 2023 17:12:16 +0530
Message-Id: <20230301114220.15941-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 0/4] Validate max source size
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

i915 specific test is added to validate max source size.

Swati Sharma (4):
  tests/kms_plane_scaling: Prep work
  tests/kms_plane_scaling: Minor fixes
  tests/kms_plane_scaling: Add test to validate max source size
  HAX: Add i915-max-source-size to fast-feedback.testlist

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/kms_plane_scaling.c             | 161 +++++++++++++++++++++++---
 2 files changed, 144 insertions(+), 18 deletions(-)

-- 
2.25.1
