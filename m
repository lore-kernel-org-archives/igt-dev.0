Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E354110E4F2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:47:40 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:14:31 +0530
Message-Id: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 00/15] Add IGT support for plane color management
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

From the Plane Color Management feature design, userspace can
take the smart blending decisions based on hardware supported
plane color features to obtain an accurate color profile.

These IGT patches extend the existing pipe color management
tests to the plane level.

Kernel implementation:
https://patchwork.freedesktop.org/series/90825/

V2: Rebase

Bhanuprakash Modem (13):
  HAX: Get uapi headers to compile the IGT
  lib/igt_kms: Add plane color mgmt properties
  kms_color_helper: Add helper functions for plane color mgmt
  tests/kms_color: New subtests for Plane gamma
  tests/kms_color: New subtests for Plane degamma
  tests/kms_color: New subtests for Plane CTM
  tests/kms_color: New negative tests for plane level color mgmt
  tests/kms_color_chamelium: New subtests for Plane gamma
  tests/kms_color_chamelium: New subtests for Plane degamma
  tests/kms_color_chamelium: New subtests for Plane CTM
  tests/kms_color: Extended IGT tests to support logarithmic gamma mode
  tests/kms_color_chamelium: Extended IGT tests to support logarithmic
    gamma mode
  HAX: Add color mgmt tests to BAT

Mukunda Pramodh Kumar (2):
  lib/igt_kms: Add pipe color mgmt properties
  kms_color_helper: Add helper functions to support logarithmic gamma
    mode

 include/drm-uapi/drm.h                |  10 +
 include/drm-uapi/drm_mode.h           |  28 ++
 lib/igt_kms.c                         |   6 +
 lib/igt_kms.h                         |   6 +
 tests/intel-ci/fast-feedback.testlist | 113 +++++
 tests/kms_color.c                     | 672 +++++++++++++++++++++++++-
 tests/kms_color_chamelium.c           | 597 ++++++++++++++++++++++-
 tests/kms_color_helper.c              | 303 +++++++++++-
 tests/kms_color_helper.h              |  44 ++
 9 files changed, 1762 insertions(+), 17 deletions(-)

--
2.35.1
