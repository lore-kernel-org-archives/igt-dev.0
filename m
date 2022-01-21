Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD0F10EAFA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jan 2022 13:34:49 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Fri, 21 Jan 2022 19:18:27 +0530
Message-Id: <20220121134833.28740-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 0/6] Addition of new plane scaling test cases
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

In this series, combination of downscaling and upscaling testcases
are added.

    v2:-Minor fixes, to prevent CI crashes

Swati Sharma (6):
  tests/kms_plane_scaling: Removal of plane-scaling subtest
  tests/kms_plane_scaling: Add output name in dynamic subtests
  tests/kms_plane_scaling: Upscaling on 2 planes
  tests/kms_plane_scaling: Downscaling on 2 planes
  tests/kms_plane_scaling: Upscaling and downscaling scenario
  tests/kms_plane_scaling: Add negative test to check num of scalers

 tests/kms_plane_scaling.c | 407 +++++++++++++++++++++-----------------
 1 file changed, 227 insertions(+), 180 deletions(-)

-- 
2.25.1
