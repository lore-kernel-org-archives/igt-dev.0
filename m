Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B91E10E150
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 18:14:43 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 6 May 2022 11:14:29 -0700
Message-ID: <20220506181432.165-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1 0/3] Add helper method to get primary
 plane assigned by driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch series introduces a helper method to get the primary plane
assigned to a pipe by the driver.

Currently, IGT will use igt_pipe_get_plane_type to get the primary
plane of a pipe and assumes that this is also the plane being assigned
to the pipe by the driver. This isn't necessarily true in cases where
there are multiple primary planes and causes a mismatch between IGT
and driver.

To address this issue, this patch series introduces a helper method to
get the primary plane being assigned to a pipe by the driver and adds
calls to the method within some KMS subtests.

Jessica Zhang (3):
  lib/igt_kms: Add helper method to get assigned primary plane from pipe
  tests/kms_universal_plane: Use igt_get_assigned_primary to get the
    primary plane
  tests/kms_rotation_crc: Use igt_get_assigned_primary to get the
    primary plane

 lib/igt_kms.c               | 47 +++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h               |  1 +
 tests/kms_rotation_crc.c    |  6 ++++-
 tests/kms_universal_plane.c |  2 +-
 4 files changed, 54 insertions(+), 2 deletions(-)

-- 
2.31.0
