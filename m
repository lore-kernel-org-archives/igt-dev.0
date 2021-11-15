Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 15 Nov 2021 15:17:45 +0530
Message-Id: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 00/14] Add IGT support for plane color management
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From the Plane Color Management feature design, userspace can
take the smart blending decisions based on hardware supported
plane color features to obtain an accurate color profile.

These IGT patches extend the existing pipe color management
tests to the plane level.

Kernel implementation:
https://patchwork.freedesktop.org/series/90825/

Bhanuprakash Modem (11):
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
  tests/kms_color_chamelium: Extended IGT tests to support logarithmic
    gamma mode

Mukunda Pramodh Kumar (3):
  lib/igt_kms: Add pipe color mgmt properties
  kms_color_helper: Add helper functions to support logarithmic gamma
    mode
  tests/kms_color: Extended IGT tests to support logarithmic gamma mode

 include/drm-uapi/drm.h      |  10 +
 include/drm-uapi/drm_mode.h |  28 ++
 lib/igt_kms.c               |   6 +
 lib/igt_kms.h               |   6 +
 tests/kms_color.c           | 674 +++++++++++++++++++++++++++++++++++-
 tests/kms_color_chamelium.c | 588 ++++++++++++++++++++++++++++++-
 tests/kms_color_helper.c    | 300 ++++++++++++++++
 tests/kms_color_helper.h    |  45 +++
 8 files changed, 1648 insertions(+), 9 deletions(-)

--
2.32.0
