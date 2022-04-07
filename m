Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B9110E0F2
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 09:03:53 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Apr 2022 14:33:40 +0530
Message-Id: <20220407090343.10067-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Improvements in plane scaling
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

Currently, plane scaling tests timesout in CI since they
take large amount of time to loop through all pixel-formats per
class for each modifier or rotation.
So, to reduce execution time we are looping through either format
or modifier or rotation keeping other two variants constant.

TODO: How to validate combination of format, modifier
and rotation which executes in CI's time limits.

v2: Forgot to add changes in v1

Swati Sharma (3):
  tests/kms_plane_scaling: Fix modifier
  tests/kms_plane_scaling: Fix modifier and format
  tests/kms_plane_scaling: Tests to validate modifiers

 tests/kms_plane_scaling.c | 217 ++++++++++++++++++++++++--------------
 1 file changed, 138 insertions(+), 79 deletions(-)

-- 
2.25.1
