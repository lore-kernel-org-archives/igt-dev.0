Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5045920769234441961=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 09 Jun 2022 11:50:53 -0000
Message-ID: <165477545301.17375.13774681060156412259@emeril.freedesktop.org>
References: <20220608174148.22867-1-swati2.sharma@intel.com>
In-Reply-To: <20220608174148.22867-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv2=2C1/2=5D_lib/igt=5Fkms=3A_Add_scaling_filt?=
 =?utf-8?q?er_property?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============5045920769234441961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/2] lib/igt_kms: Add scaling filter property
URL   : https://patchwork.freedesktop.org/series/104906/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11739_full -> IGTPW_7261_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7261_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7261_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7261_full:

### IGT changes ###

#### Possible regressions ####

  * igt@api_intel_allocator@fork-simple-stress-signal:
    - shard-tglb:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-tglb5/igt@api_intel_allocator@fork-simple-stress-signal.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@api_intel_allocator@fork-simple-stress-signal.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11739_full and IGTPW_7261_full:

### New IGT tests (193) ###

  * igt@kms_scaling_filters@scaling-filter-default-downscale:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.17, 1.18] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.21] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-plane-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.06] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.08] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.17, 1.19] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.21] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plane-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.05, 0.07] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.08] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.16, 1.18] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.21] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-6:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_7261_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hang.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][4] -> [FAIL][5] ([i915#5784])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-tglb6/igt@gem_eio@kms.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#4525])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#4525])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#4613])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][14] ([i915#4613])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl3/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#4613])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#111656])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb5/igt@gem_mmap_gtt@coherency.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109292])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4270])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#4270]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#768])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109290])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@gem_userptr_blits@coherency-sync.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#2856])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-apl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#658]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#454]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4281])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#1902])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb7/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109293] / [fdo#109506])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-iclb:         [PASS][30] -> [INCOMPLETE][31] ([i915#5420])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb1/igt@i915_pm_rpm@system-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb7/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-kbl6/igt@i915_suspend@forcewake.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          NOTRUN -> [DMESG-WARN][34] ([i915#180])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#4765])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb6/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#5286]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#5286]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111614]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#110723]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111615]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#2705])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb1/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#6095]) +5 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271]) +100 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278] / [i915#3886]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +7 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3689] / [i915#3886])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-glk1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-snb:          NOTRUN -> [SKIP][48] ([fdo#109271]) +123 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-snb4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3689]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl6/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-glk4/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl8/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278] / [i915#1149])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-ctm-green-to-red:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_color_chamelium@pipe-a-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-negative.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-c-degamma:
    - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-snb4/igt@kms_color_chamelium@pipe-c-degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109300] / [fdo#111066])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109279] / [i915#3359]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x128-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278]) +16 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-128x128-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3359]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x10-rapid-movement.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109274] / [fdo#111825]) +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#4103])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][66] -> [FAIL][67] ([i915#2346] / [i915#533])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109274]) +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#5287]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-render-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#5287])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          NOTRUN -> [FAIL][71] ([i915#4767])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          NOTRUN -> [FAIL][72] ([i915#4767])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#109280] / [fdo#111825]) +12 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109280]) +16 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271]) +126 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#3555])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#3555])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109289]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb7/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#533])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#533])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][81] ([i915#265]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-glk:          NOTRUN -> [FAIL][82] ([i915#265])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][83] ([i915#265]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111615] / [fdo#112054])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb2/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#3536])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][86] -> [SKIP][87] ([i915#5176]) +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#5176]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#111068] / [i915#658])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#1911]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@kms_psr2_su@page_flip-nv12.html
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#658]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109642] / [fdo#111068] / [i915#658])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-glk2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][94] -> [SKIP][95] ([fdo#109441]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-tglb:         NOTRUN -> [FAIL][96] ([i915#132] / [i915#3467])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb5/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [PASS][97] -> [SKIP][98] ([i915#5519])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * {igt@kms_scaling_filters@scaling-filter-default-upscale} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][99] ([i915#4098]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-1/igt@kms_scaling_filters@scaling-filter-default-upscale.html

  * {igt@kms_scaling_filters@scaling-filter-nn-upscale} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271]) +25 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-glk1/igt@kms_scaling_filters@scaling-filter-nn-upscale.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2437])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl1/igt@kms_writeback@writeback-pixel-formats.html
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2437])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@kms_writeback@writeback-pixel-formats.html
    - shard-glk:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#2437])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-glk2/igt@kms_writeback@writeback-pixel-formats.html
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#2437])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#2530])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@nouveau_crc@pipe-a-source-outp-inactive.html

  * igt@nouveau_crc@pipe-d-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#2530]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb2/igt@nouveau_crc@pipe-d-source-outp-inactive.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109289]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb7/igt@perf@per-context-mode-unprivileged.html

  * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#109291])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109291])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@prime_nv_pcopy@test3_5.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#109295])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_clients@create:
    - shard-kbl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#2994]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl3/igt@sysfs_clients@create.html

  * igt@sysfs_clients@split-25:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([i915#2994]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@sysfs_clients@split-25.html

  * igt@sysfs_clients@split-50:
    - shard-apl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#2994])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl4/igt@sysfs_clients@split-50.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2994]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb5/igt@sysfs_clients@split-50.html
    - shard-glk:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2994])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-glk6/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - {shard-rkl}:        [SKIP][116] ([i915#658]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-1/igt@feature_discovery@psr2.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@feature_discovery@psr2.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [DMESG-WARN][118] ([i915#180]) -> [PASS][119] +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-apl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-tglb:         [TIMEOUT][120] ([i915#3063]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-tglb2/igt@gem_eio@in-flight-contexts-immediate.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb5/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@kms:
    - {shard-dg1}:        [FAIL][122] ([i915#5784]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-dg1-13/igt@gem_eio@kms.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-dg1-19/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - {shard-tglu}:       [TIMEOUT][124] ([i915#3063]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-tglu-3/igt@gem_eio@unwedge-stress.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglu-6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [SKIP][126] ([i915#4525]) -> [PASS][127] +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][128] ([i915#2842]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-tglu}:       [FAIL][130] ([i915#2842]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglu-1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][132] ([i915#2842]) -> [PASS][133] +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [SKIP][134] ([fdo#109271]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][136] ([i915#2842]) -> [PASS][137] +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][138] ([i915#2190]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - {shard-dg1}:        [DMESG-WARN][140] ([i915#4936]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@i915_pm_backlight@fade_with_dpms:
    - {shard-rkl}:        [SKIP][142] ([i915#3012]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-1/igt@i915_pm_backlight@fade_with_dpms.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@i915_pm_backlight@fade_with_dpms.html

  * igt@i915_pm_dc@dc6-dpms:
    - {shard-tglu}:       [FAIL][144] ([i915#454]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][146] ([i915#3921]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-snb6/igt@i915_selftest@live@hangcheck.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-snb7/igt@i915_selftest@live@hangcheck.html

  * igt@kms_color@pipe-a-ctm-red-to-blue:
    - {shard-rkl}:        [SKIP][148] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][149] +2 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-1/igt@kms_color@pipe-a-ctm-red-to-blue.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_color@pipe-a-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - {shard-rkl}:        [SKIP][150] ([fdo#112022] / [i915#4070]) -> [PASS][151] +7 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - {shard-rkl}:        [SKIP][152] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-2/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_cursor_legacy@all-pipes-forked-move:
    - {shard-dg1}:        [WARN][154] -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-dg1-19/igt@kms_cursor_legacy@all-pipes-forked-move.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-dg1-13/igt@kms_cursor_legacy@all-pipes-forked-move.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-iclb:         [FAIL][156] ([i915#5072]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - {shard-rkl}:        [SKIP][158] ([fdo#111825] / [i915#4070]) -> [PASS][159] +4 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@pipe-c-single-move:
    - {shard-rkl}:        [SKIP][160] ([i915#4070]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-1/igt@kms_cursor_legacy@pipe-c-single-move.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-4/igt@kms_cursor_legacy@pipe-c-single-move.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - {shard-rkl}:        [SKIP][162] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][163] +6 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][164] ([i915#2122]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][166] ([i915#1849] / [i915#4098]) -> [PASS][167] +20 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - {shard-rkl}:        [SKIP][168] ([i915#4278]) -> [PASS][169] +1 similar issue
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-1/igt@kms_invalid_mode@bad-vsync-end.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [DMESG-WARN][170] ([i915#180]) -> [PASS][171] +2 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - {shard-dg1}:        [SKIP][172] ([i915#1836]) -> [PASS][173] +7 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-dg1-19/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-dg1-13/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-y:
    - {shard-rkl}:        [SKIP][174] ([i915#3558] / [i915#4070]) -> [PASS][175] +1 similar issue
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-1/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html

  * igt@kms_prime@basic-crc@second-to-first:
    - {shard-rkl}:        [SKIP][176] ([i915#1849]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-1/igt@kms_prime@basic-crc@second-to-first.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][178] ([fdo#109441]) -> [PASS][179] +2 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr@sprite_plane_move:
    - {shard-rkl}:        [SKIP][180] ([i915#1072]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-1/igt@kms_psr@sprite_plane_move.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_psr@sprite_plane_move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [SKIP][182] ([i915#5519]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rmfb@rmfb-ioctl:
    - {shard-rkl}:        [SKIP][184] ([i915#1845] / [i915#4098]) -> [PASS][185] +18 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-1/igt@kms_rmfb@rmfb-ioctl.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_rmfb@rmfb-ioctl.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-a:
    - {shard-rkl}:        [SKIP][186] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-rkl-1/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html

  * igt@kms_vblank@pipe-a-ts-continuation-idle:
    - {shard-dg1}:        [FAIL][188] ([i915#4241]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-dg1-19/igt@kms_vblank@pipe-a-ts-continuation-idle.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-dg1-13/igt@kms_vblank@pipe-a-ts-continuation-idle.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-dg1}:        [FAIL][190] ([i915#4349]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-dg1-16/igt@perf_pmu@idle@rcs0.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-dg1-12/igt@perf_pmu@idle@rcs0.html

  
#### Warnings ####

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         [SKIP][192] ([fdo#109300]) -> [SKIP][193] ([fdo#109300] / [fdo#111066])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb5/igt@kms_content_protection@mei_interface.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_content_protection@mei_interface.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          [DMESG-FAIL][194] ([i915#180]) -> [FAIL][195] ([i915#1188])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-kbl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][196] ([i915#2920]) -> [SKIP][197] ([i915#658])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][198] ([i915#658]) -> [SKIP][199] ([i915#2920])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@runner@aborted:
    - shard-tglb:         ([FAIL][200], [FAIL][201]) ([i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][202], [FAIL][203], [FAIL][204]) ([i915#3002] / [i915#3690] / [i915#4312] / [i915#5257])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-tglb2/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-tglb3/igt@runner@aborted.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb2/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3690]: https://gitlab.freedesktop.org/drm/intel/issues/3690
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4241]: https://gitlab.freedesktop.org/drm/intel/issues/4241
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4765]: https://gitlab.freedesktop.org/drm/intel/issues/4765
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4904]: https://gitlab.freedesktop.org/drm/intel/issues/4904
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5420]: https://gitlab.freedesktop.org/drm/intel/issues/5420
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5721]: https://gitlab.freedesktop.org/drm/intel/issues/5721
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6076]: https://gitlab.freedesktop.org/drm/intel/issues/6076
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6513 -> IGTPW_7261
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11739: 0cd75930f7f15ed82136bfc75ac2fdbad4af8bc8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7261: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/index.html
  IGT_6513: 2aff41793e5f7f23206547ff615187708e728b92 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/index.html

--===============5045920769234441961==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [v2,1/2] lib/igt_kms: A=
dd scaling filter property</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/104906/">https://patchwork.freedesktop.org/series/104906/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7261/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11739_full -&gt; IGTPW_7261_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7261_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7261_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7261=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@api_intel_allocator@fork-simple-stress-signal:<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-tglb5/igt@api_intel_allocator@fork-simple-stress-signal=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7261/shard-tglb6/igt@api_intel_allocator@fork-simple-stress-signal.htm=
l">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11739_full and IGTPW_7261_=
full:</p>
<h3>New IGT tests (193)</h3>
<ul>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-pl=
ane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-pl=
ane-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-pl=
ane-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-pl=
ane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-pl=
ane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-pl=
ane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-a-edp-1-pl=
ane-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-pl=
ane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.17, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-pl=
ane-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-pl=
ane-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-pl=
ane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-pl=
ane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-pl=
ane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-b-edp-1-pl=
ane-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-pl=
ane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-pl=
ane-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-pl=
ane-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-pl=
ane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-pl=
ane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-pl=
ane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-c-edp-1-pl=
ane-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-pl=
ane-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-pl=
ane-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-pl=
ane-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-pl=
ane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-pl=
ane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-pl=
ane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-downscale@pipe-d-edp-1-pl=
ane-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plan=
e-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plan=
e-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plan=
e-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plan=
e-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plan=
e-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plan=
e-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-edp-1-plan=
e-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-p=
lane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-p=
lane-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-p=
lane-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-p=
lane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-p=
lane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-p=
lane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-a-hdmi-a-1-p=
lane-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plan=
e-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.17, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plan=
e-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plan=
e-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plan=
e-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plan=
e-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plan=
e-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-edp-1-plan=
e-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-p=
lane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-p=
lane-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-p=
lane-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-p=
lane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-p=
lane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-p=
lane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-b-hdmi-a-1-p=
lane-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plan=
e-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plan=
e-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plan=
e-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plan=
e-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plan=
e-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plan=
e-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-edp-1-plan=
e-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-p=
lane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-p=
lane-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-p=
lane-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-p=
lane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-p=
lane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-p=
lane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-c-hdmi-a-1-p=
lane-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plan=
e-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plan=
e-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plan=
e-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plan=
e-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plan=
e-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plan=
e-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-edp-1-plan=
e-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-p=
lane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-p=
lane-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-p=
lane-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-p=
lane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-p=
lane-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-p=
lane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-default-upscale@pipe-d-hdmi-a-1-p=
lane-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-0=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-1=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-2=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-3=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-5=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-edp-1-plane-6=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plan=
e-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plan=
e-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plan=
e-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plan=
e-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plan=
e-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plan=
e-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-a-hdmi-a-1-plan=
e-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-0=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-1=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-2=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-3=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-5=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-edp-1-plane-6=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plan=
e-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.05, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plan=
e-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plan=
e-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plan=
e-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plan=
e-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plan=
e-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-b-hdmi-a-1-plan=
e-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-0=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-1=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-2=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-3=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-5=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-edp-1-plane-6=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plan=
e-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plan=
e-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plan=
e-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plan=
e-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plan=
e-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plan=
e-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-c-hdmi-a-1-plan=
e-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plan=
e-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plan=
e-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plan=
e-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plan=
e-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plan=
e-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plan=
e-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-downscale@pipe-d-hdmi-a-1-plan=
e-6:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-0:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-2:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-3:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-4:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-5:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-edp-1-plane-6:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-=
0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-=
2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-=
3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-=
4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-=
5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-a-hdmi-a-1-plane-=
6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-0:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.16, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-2:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-3:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-4:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-5:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-edp-1-plane-6:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-=
0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-=
2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-=
3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-=
4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-=
5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-b-hdmi-a-1-plane-=
6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-0:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-1:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-2:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-3:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-4:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-5:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-edp-1-plane-6:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-=
0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-=
2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-=
3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-=
4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-=
5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-c-hdmi-a-1-plane-=
6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-0:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-2:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-3:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-4:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-5:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-edp-1-plane-6:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-=
0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-=
2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-=
3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-=
4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-=
5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_filters@scaling-filter-nn-upscale@pipe-d-hdmi-a-1-plane-=
6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7261_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
hang.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-tglb6/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@gem_eio@=
kms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@gem_exec_balancer@parallel-balance=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261=
/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb5/igt@gem_exec_fair@basic-none-rrul@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-k=
bl3/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/284=
2">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb3/igt@gem_lmem_swapping@heavy-verify-ran=
dom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-kbl3/igt@gem_lmem_swapping@parallel-random-ve=
rify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-tglb7/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-tglb5/igt@gem_mmap_gtt@coherency.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656">fdo#1=
11656</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-iclb5/igt@gem_mmap_gtt@coherency.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109292">fdo#1=
09292</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@gem_pxp@fail-invalid-protected-con=
text.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@gem_pxp@verify-pxp-key-change-afte=
r-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@gem_render_copy@linear-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@gem_userptr_blits@coherency-sync.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9290">fdo#109290</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@gen9_exec_parse@basic-rejected-ctx=
-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-apl8/igt@i915_pm_dc@dc3co-vpb-simulation.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb3/igt@=
i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/454">i915#454</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb2/igt@i915_pm_dc@dc9-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#428=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb7/igt@i915_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1902=
">i915#1902</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@i915_pm_rpm@pc8-residency.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109293">f=
do#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb1/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-icl=
b7/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5420">i915#5420</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-kbl6/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-kbl4/igt=
@i915_suspend@forcewake.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/180">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-apl1/igt@i915_suspend@sysfs-reader.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb6/igt@kms_atomic@atomic_plane_damage.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/476=
5">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb1/igt@kms_big_fb@4-tiled-16bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110723">fdo#110723</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb1/igt@kms_big_joiner@2x-modeset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i9=
15#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_ccs@pipe-a-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6095">i915#6095</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-apl4/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +100 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-iclb6/igt@kms_ccs@pipe-a-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-kbl6/igt@kms_ccs@pipe-a-random-ccs-data-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-glk1/igt@kms_ccs@pipe-a-random-ccs-data-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-snb4/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +123 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-apl6/igt@kms_ccs@pipe-c-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-glk4/igt@kms_chamelium@dp-crc-multiple.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-apl8/igt@kms_chamelium@vga-frame-dump.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@kms_color@pipe-d-ctm-0-5.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-green-to-red:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_color_chamelium@pipe-a-ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-degamma:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-snb4/igt@kms_color_chamelium@pipe-c-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb6/igt@kms_content_protection@atomic-dpms=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109300">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111066">fdo#111066</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3359">i915#3359</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x128-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-128x1=
28-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x10=
-rapid-movement.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3359">i915#3359</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@kms_cursor_legacy@2x-flip-vs-curso=
r-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111825">fdo#111825</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7261/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor=
-atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_display_modes@extended-mode-ba=
sic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-re=
nder-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5287">i915#5287</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-=
render-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915=
#4767</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915=
#4767</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +12 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-kbl7/igt@kms_frontbuffer_tracking@psr-indfb-=
scaledprimary.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a>) +126 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@kms_hdr@bpc-switch-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915=
#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb7/igt@kms_hdr@bpc-switch-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb7/igt@kms_pipe_b_c_ivb@pipe-b-double-mod=
eset-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-kbl4/igt@kms_pipe_crc_basic@nonblocking-crc-=
pipe-d-frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-d-=
frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb2/igt@kms_plane_lowres@pipe-b-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3536">i915#3536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-=
a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb1/igt@kms_plane_scaling@plane-downscale-with-pixel-=
format-factor-0-5@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_plane_scaling@p=
lane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp=
-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_plane_scaling@plane-upscale-wi=
th-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@kms_psr2_sf@cursor-plane-update-sf=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-tglb1/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1911">i9=
15#1911</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-kbl7/igt@kms_psr2_su@page_flip-nv12.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-iclb8/igt@kms_psr2_su@page_flip-xrgb8888.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10964=
2">fdo#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-glk2/igt@kms_psr2_su@page_flip-xrgb8888.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-i=
clb4/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb5/igt@kms_psr@psr2_sprite_blt.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915#=
132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467">=
i915#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7261/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_scaling_filters@scaling-filter-default-upscale} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-rkl-1/igt@kms_scaling_filters@scaling-filter=
-default-upscale.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_scaling_filters@scaling-filter-nn-upscale} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-glk1/igt@kms_scaling_filters@scaling-filter-=
nn-upscale.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-apl1/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-tglb1/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-glk2/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-iclb8/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb4/igt@nouveau_crc@pipe-a-source-outp-ina=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb2/igt@nouveau_crc@pipe-d-source-outp-ina=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb7/igt@perf@per-context-mode-unprivileged=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_import_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@prime_nv_api@nv_i915_import_twice_=
check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb8/igt@prime_nv_pcopy@test3_5.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@prime_vgem@fence-write-hang.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295"=
>fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-kbl3/igt@sysfs_clients@create.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@sysfs_clients@split-25.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#=
2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-apl4/igt@sysfs_clients@split-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-tglb5/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-glk6/igt@sysfs_clients@split-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-1/igt@feature_discovery@psr2.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl=
-6/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-apl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7261/shard-apl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PAS=
S</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-tglb2/igt@gem_eio@in-flight-contexts-immediate.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063"=
>i915#3063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7261/shard-tglb5/igt@gem_eio@in-flight-contexts-immediate.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-dg1-13/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-dg1-19/igt@=
gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-tglu-3/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/sha=
rd-tglu-6/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7261/shard-iclb4/igt@gem_exec_balancer@parallel-bb-first.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/s=
hard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i9=
15#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7261/shard-tglu-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/s=
hard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_726=
1/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_72=
61/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tg=
lb3/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4936"=
>i915#4936</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7261/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-1/igt@i915_pm_backlight@fade_with_dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3=
012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_72=
61/shard-rkl-6/igt@i915_pm_backlight@fade_with_dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglu=
-2/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#=
3921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
261/shard-snb7/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-1/igt@kms_color@pipe-a-ctm-red-to-blue.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1=
149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">=
i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_color@pipe-a-ctm-red-to-blue.html"=
>PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2022">fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-64x64-on=
screen.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-2/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-256=
x256-left-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@all-pipes-forked-move:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-dg1-19/igt@kms_cursor_legacy@all-pipes-forked-move.html=
">WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7261/shard-dg1-13/igt@kms_cursor_legacy@all-pipes-forked-move.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5072"=
>i915#5072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7261/shard-iclb4/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825=
">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7261/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.h=
tml">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-single-move:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-1/igt@kms_cursor_legacy@pipe-c-single-move.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i9=
15#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7261/shard-rkl-4/igt@kms_cursor_legacy@pipe-c-single-move.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-unti=
led.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb2101010-blt-untiled.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-=
hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7261/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ac=
-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_frontbuffer_tr=
acking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +20 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-1/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#427=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261=
/shard-rkl-6/igt@kms_invalid_mode@bad-vsync-end.html">PASS</a> +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7261/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.h=
tml">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-dg1-19/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/183=
6">i915#1836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7261/shard-dg1-13/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html"=
>PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-a-tiling-y:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-1/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/355=
8">i915#3558</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7261/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-a-tiling-y=
.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-1/igt@kms_prime@basic-crc@second-to-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i91=
5#1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7261/shard-rkl-6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shar=
d-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_move:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-1/igt@kms_psr@sprite_plane_move.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shar=
d-rkl-6/igt@kms_psr@sprite_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7261/shard-iclb5/igt@kms_psr_stress_test@invalidate-primar=
y-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-1/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/sh=
ard-rkl-6/igt@kms_rmfb@rmfb-ioctl.html">PASS</a> +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-rkl-1/igt@kms_universal_plane@cursor-fb-leak-pipe-a.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/184=
5">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7261/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-=
pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-idle:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-dg1-19/igt@kms_vblank@pipe-a-ts-continuation-idle.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4241"=
>i915#4241</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7261/shard-dg1-13/igt@kms_vblank@pipe-a-ts-continuation-idle.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-dg1-16/igt@perf_pmu@idle@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-dg=
1-12/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb5/igt@kms_content_protection@mei_interface.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">f=
do#109300</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7261/shard-iclb2/igt@kms_content_protection@mei_interface.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#10=
9300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111066=
">fdo#111066</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-kbl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">D=
MESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7261/shard-kbl3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i91=
5#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7261/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11739/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7261/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11739/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11739/shard-tglb3/igt@runner@=
aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7261/shard-tglb6/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/sha=
rd-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7261/shard-tglb1/igt@runner@aborted.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#=
3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3690"=
>i915#3690</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6513 -&gt; IGTPW_7261</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11739: 0cd75930f7f15ed82136bfc75ac2fdbad4af8bc8 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7261: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7261/index.htm=
l<br />
  IGT_6513: 2aff41793e5f7f23206547ff615187708e728b92 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5045920769234441961==--
