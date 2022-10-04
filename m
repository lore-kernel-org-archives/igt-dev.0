Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA0210E184
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Oct 2022 21:16:48 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 4 Oct 2022 15:16:22 -0600
Message-ID: <20221004211626.1480938-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [RFC PATCH 0/4][[i-g-t] IGT tests for pre-blending 3D LUT
 interfaces
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: bhawanpreet.lakha@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a draft of the IGT sample tests for the kernel proposal of the pre-blending
3D LUT API. It includes two subtests:

  1) verify supported 3D LUT modes returned by a GPU driver, and
  2) enable 3D LUT by passing a 3D LUT in the GPU driver.

Notes:

1. This patchset is based the previous work on https://gitlab.freedesktop.org/hwentland/igt-gpu-tools

2. The kernel 3DLUT API proposal "Proposal for Pre-blending 3D LUT
   interfaces" is sent to dri-devel mailing list.

Alex Hung (4):
  include/drm-uapi: Add 3D LUT structs and its attributes
  lib/igt_kms: Add 3D LUT properties
  tests/kms_color: add 3D LUT mode tests
  tests/kms_color: add 3D LUT tests

 include/drm-uapi/drm_mode.h |  18 +++++
 lib/igt_kms.c               |   2 +
 lib/igt_kms.h               |   2 +
 tests/kms_color.c           | 130 ++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.c    |  71 ++++++++++++++++++++
 tests/kms_color_helper.h    |   2 +
 6 files changed, 225 insertions(+)

-- 
2.25.1
