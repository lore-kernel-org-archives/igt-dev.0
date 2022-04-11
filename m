Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1269810E32E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 09:43:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Date: Mon, 11 Apr 2022 15:11:42 +0530
Message-Id: <20220411094147.1650859-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V2 0/5] Add support for connector & crtc debugfs
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
    - Compare/Assert if Current & Requested bpc are not equal

Bhanuprakash Modem (5):
  lib/igt_kms: Add helper functions to read few debugfs
  tests/kms_color: Use debugfs apis for deep-color
  tests/kms_hdr: Adopt to use updated debugfs functions
  tests/kms_dither: Adopt to use updated debugfs functions
  tests/amdgpu: Adopt to use updated debugfs functions

 lib/igt_kms.c              | 110 +++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h              |   7 +++
 tests/amdgpu/amd_dp_dsc.c  |  56 +------------------
 tests/amdgpu/amd_max_bpc.c |  47 +---------------
 tests/kms_color.c          |   9 ++-
 tests/kms_color_helper.c   |  46 ++--------------
 tests/kms_color_helper.h   |   2 +-
 tests/kms_dither.c         |  11 ++--
 tests/kms_hdr.c            |  69 +++--------------------
 9 files changed, 151 insertions(+), 206 deletions(-)

--
2.35.1
