Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B0210F3F8
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 09:58:16 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Feb 2022 15:42:16 +0530
Message-Id: <20220224101224.12319-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v6 0/8] Addition of new plane scaling test cases
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In this series, combination of downscaling and upscaling
testcases are added. Also, code refactoring is done for
existing code.

    v2:-minor fixes, to prevent CI crashes
    v3:-added subtests for testing upscaling/downscaling for
        each plane individually (Ville)
       -modified existing subtests for each N plane scaling
        combo (Ville)
    v4:-removal of i915sm (Ville)
       -code reusablity (Ville)
    v5:-use enum (Viile)
       -limit while loop (Ville)
       -add assert for fail/pass (Ville)
       -added primary plane for testing (Ville)
    v6:-after rebase, made changes accordingly to make
	test cases consistent and for better coverage (Petri)

Swati Sharma (8):
  tests/kms_plane_scaling: Removal of plane-scaling subtest
  tests/kms_plane_scaling: Add output name in dynamic subtests
  tests/kms_plane_scaling: Upscaling on 2 planes
  tests/kms_plane_scaling: Downscaling on 2 planes
  tests/kms_plane_scaling: Upscaling and downscaling scenario
  tests/kms_plane_scaling: Add negative test to check num of scalers
  tests/kms_plane_scaling: Refactor clipping-clamping subtest
  tests/kms_plane_scaling: Cleanup

 tests/kms_plane_scaling.c | 709 ++++++++++++++++++++++----------------
 1 file changed, 406 insertions(+), 303 deletions(-)

-- 
2.25.1
