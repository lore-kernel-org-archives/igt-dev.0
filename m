Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585C610E468
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 12:09:39 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue, 15 Feb 2022 17:53:35 +0530
Message-Id: <20220215122344.11168-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 0/9] Addition of new plane scaling test cases
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

In this series, combination of downscaling and upscaling
testcases are added. Also, code refactoring is done for
existing code.

    v2:-Minor fixes, to prevent CI crashes
    v3:-Added subtests for testing upscaling/downscaling for
        each plane individually (Ville)
       -Modified existing subtests for each N plane scaling
        combo (Ville)
    v4:-removal of i915sm (Ville)
       -code reusablity (Ville)

TODO: crc based validation (once this series is merged, will
work for crc based validation for all subtests, if possible)

Swati Sharma (9):
  tests/kms_plane_scaling: Removal of plane-scaling subtest
  tests/kms_plane_scaling: Add output name in dynamic subtests
  tests/kms_plane_scaling: Upscaling each plane
  tests/kms_plane_scaling: Downscaling each plane
  tests/kms_plane_scaling: Upscaling on 2 planes
  tests/kms_plane_scaling: Downscaling on 2 planes
  tests/kms_plane_scaling: Upscaling and downscaling scenario
  tests/kms_plane_scaling: Add negative test to check num of scalers
  tests/kms_plane_scaling: Refactor clipping-clamping subtest

 tests/kms_plane_scaling.c | 712 +++++++++++++++++++++++---------------
 1 file changed, 440 insertions(+), 272 deletions(-)

-- 
2.25.1
