Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1551F10E5D1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 10:23:05 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Oct 2023 15:53:43 +0530
Message-Id: <20231013102346.95872-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] tests/kms_plane_scaling: add
 get_num_scalers()
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

Add get_num_scalers() to lib and use same in kms_plane_scaling.

Swati Sharma (3):
  lib/igt_kms: cosmetic changes
  lib/igt_kms: add get_num_scalers()
  tests/kms_plane_scaling: use get_num_scalers()

 lib/igt_kms.c             | 82 +++++++++++++++++++++++++++------------
 lib/igt_kms.h             |  1 +
 tests/kms_plane_scaling.c | 24 ++++++++++++
 3 files changed, 83 insertions(+), 24 deletions(-)

-- 
2.25.1
