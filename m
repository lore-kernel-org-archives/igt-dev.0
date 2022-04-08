Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2B010F6B0
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Apr 2022 06:53:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Date: Fri,  8 Apr 2022 12:21:39 +0530
Message-Id: <20220408065143.1485069-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/4] Add support for connector & crtc debugfs
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

Add helper functions to read debugfs & update the subtests
to use newly added helper functions:
    - Read maximum bpc from connector debugfs
    - Read Current bpc from crtc debugfs
    - Assert if Current & Requested bpc are not equal

Bhanuprakash Modem (4):
  lib/igt_kms: Add helper functions to read few debugfs
  tests/kms_color: Used debugfs apis for deep-color
  tests/kms_hdr: Adopt to use updated debugfs functions
  tests/amdgpu: Adopt to use updated debugfs functions

 lib/igt_kms.c              | 84 ++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h              |  5 +++
 tests/amdgpu/amd_dp_dsc.c  | 56 ++-----------------------
 tests/amdgpu/amd_max_bpc.c | 47 +--------------------
 tests/kms_color.c          |  6 ++-
 tests/kms_color_helper.c   | 46 +++------------------
 tests/kms_color_helper.h   |  2 +-
 tests/kms_hdr.c            | 69 ++++---------------------------
 8 files changed, 113 insertions(+), 202 deletions(-)

--
2.35.1
