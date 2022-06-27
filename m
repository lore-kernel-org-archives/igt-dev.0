Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7001107699206351719=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 27 Jun 2022 23:52:27 -0000
Message-ID: <165637394759.11793.15707313999104110744@emeril.freedesktop.org>
References: <20220624043525.86679-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220624043525.86679-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fedge=5Fwalk=3A_Fix_test_requirement_to_avoid_SKI?=
 =?utf-8?b?UHMgKHJldjIp?=
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

--===============7001107699206351719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_edge_walk: Fix test requirement to avoid SKIPs (rev2)
URL   : https://patchwork.freedesktop.org/series/105574/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11809_full -> IGTPW_7394_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7394_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7394_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7394_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512:
    - shard-iclb:         NOTRUN -> [SKIP][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb1/igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor@toggle:
    - shard-iclb:         [PASS][2] -> [FAIL][3] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170:
    - {shard-dg1}:        NOTRUN -> [SKIP][4] +15 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-dg1-15/igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11809_full and IGTPW_7394_full:

### New IGT tests (133) ###

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.38] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.39] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.30, 3.36] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.28] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 4.27] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-2-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.38] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-2-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.42] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-2-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-b-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.30, 3.35] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.37] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.36] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 4.29] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 4.27] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 3.33] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 3.39] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.61, 3.36] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.36] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.41] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.31, 3.37] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-edp-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [3.21, 4.29] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-edp-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [3.19, 4.29] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-edp-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [3.19, 4.27] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 3.21] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 3.21] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 3.20] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-2-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.40] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-2-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.37] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-2-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-b-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.32, 3.36] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.37] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.36] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [1.63, 3.37] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [1.63, 3.39] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [1.61, 3.36] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.61, 3.21] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 3.20] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 3.21] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.36] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.40] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.36] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 4.25] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.27] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.27] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 3.21] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 3.21] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.61, 3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-2-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.38] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-2-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-2-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.37] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.36] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.36] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.32, 3.35] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 4.24] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 4.29] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.28] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [1.61, 3.36] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [1.64, 3.40] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [1.63, 3.35] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 3.21] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.61, 3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.64, 3.21] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.36] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.36] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.30, 3.40] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-edp-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-edp-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-edp-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [3.19, 4.27] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-2-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.36] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-2-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.43] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-2-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.36] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-b-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-c-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.39] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.36] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.35] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.23, 4.24] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 4.28] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 4.27] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 3.37] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 3.37] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 3.42] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  

Known issues
------------

  Here are the changes found in IGTPW_7394_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][5] ([i915#4991])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@gem_create@create-massive.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][6] -> [FAIL][7] ([i915#6268])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@in-flight-1us:
    - shard-tglb:         [PASS][8] -> [TIMEOUT][9] ([i915#3063]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-tglb1/igt@gem_eio@in-flight-1us.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb3/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#4525])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][12] ([i915#6141])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl7/igt@gem_exec_fair@basic-deadline.html
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#6141])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb6/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          NOTRUN -> [FAIL][14] ([i915#6141])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk2/igt@gem_exec_fair@basic-deadline.html
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#6141])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][16] -> [FAIL][17] ([i915#2842]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#2842]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#2849])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#2190])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl3/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_pread@exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][26] ([i915#2658])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4270]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb6/igt@gem_pxp@reject-modify-context-protection-on.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#4270]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb7/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#768])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb6/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#3297]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#2527] / [i915#2856])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb6/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#4281])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#4281])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109506] / [i915#2411])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-snb:          NOTRUN -> [SKIP][35] ([fdo#109271]) +76 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-snb6/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          NOTRUN -> [DMESG-WARN][36] ([i915#180])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl4/igt@i915_suspend@forcewake.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#1769])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#5286]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#5286])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111615]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110723])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3886]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278] / [i915#3886]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb5/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3886]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271]) +168 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3689] / [i915#3886]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3689] / [i915#6095]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271]) +54 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk9/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278]) +7 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb5/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +9 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#6095]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb6/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3689]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb3/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111615] / [i915#3689])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb6/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-snb:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-snb4/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl3/igt@kms_chamelium@vga-hpd-without-ddc.html
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb2/igt@kms_chamelium@vga-hpd-without-ddc.html
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk6/igt@kms_chamelium@vga-hpd-without-ddc.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb3/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-b-deep-color:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3555])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@kms_color@pipe-b-deep-color.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#1063])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb7/igt@kms_content_protection@atomic-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109300] / [fdo#111066])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb7/igt@kms_content_protection@atomic-dpms.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][63] ([i915#1319]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][64] ([i915#1319]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3359]) +7 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#4462]) +7 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#4462]) +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb1/igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-iclb:         [PASS][68] -> [FAIL][69] ([i915#2346])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109274]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109274] / [fdo#111825]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][72] ([i915#180]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#2587])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-iclb:         [PASS][74] -> [FAIL][75] ([i915#1888])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109280]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#109280] / [fdo#111825]) +11 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-apl:          [PASS][78] -> [DMESG-FAIL][79] ([i915#180])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl8/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][80] ([i915#180])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-kbl:          [PASS][81] -> [DMESG-WARN][82] ([i915#180]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][83] ([fdo#108145] / [i915#265])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][84] ([fdo#108145] / [i915#265])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-apl:          NOTRUN -> [FAIL][85] ([fdo#108145] / [i915#265])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271]) +85 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl1/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#5288])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-c-tiling-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][88] -> [SKIP][89] ([i915#5235]) +5 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#658]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#658]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#2920])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#658])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][95] ([i915#132] / [i915#3467])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb5/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][96] -> [SKIP][97] ([fdo#109441]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#2437])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-glk:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2437])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#2437])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#2530])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb2/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2530]) +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb3/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109291])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb8/igt@prime_nv_pcopy@test1_macro.html
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#109291]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb3/igt@prime_nv_pcopy@test1_macro.html

  * igt@sysfs_clients@pidname:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#2994]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb2/igt@sysfs_clients@pidname.html

  * igt@sysfs_clients@split-50:
    - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2994])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl3/igt@sysfs_clients@split-50.html
    - shard-glk:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#2994])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk2/igt@sysfs_clients@split-50.html
    - shard-iclb:         NOTRUN -> [SKIP][108] ([i915#2994])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb2/igt@sysfs_clients@split-50.html
    - shard-kbl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2994])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl6/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - {shard-rkl}:        [SKIP][110] ([i915#2582]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-5/igt@fbdev@unaligned-write.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@fbdev@unaligned-write.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [TIMEOUT][112] ([i915#3063]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@unwedge-stress:
    - {shard-rkl}:        [TIMEOUT][114] ([i915#3063]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-6/igt@gem_eio@unwedge-stress.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - {shard-tglu}:       [FAIL][116] ([i915#2842]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-tglu-8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][118] ([i915#2842]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - {shard-rkl}:        [FAIL][120] ([i915#2849]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [FAIL][122] ([i915#2842]) -> [PASS][123] +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - {shard-rkl}:        [SKIP][124] ([i915#3281]) -> [PASS][125] +7 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_mmap_wc@set-cache-level:
    - {shard-rkl}:        [SKIP][126] ([i915#1850]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@gem_mmap_wc@set-cache-level.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_pread@display:
    - {shard-rkl}:        [SKIP][128] ([i915#3282]) -> [PASS][129] +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-1/igt@gem_pread@display.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-5/igt@gem_pread@display.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][130] ([i915#5566] / [i915#716]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl8/igt@gen9_exec_parse@allowed-all.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-without-end:
    - {shard-rkl}:        [SKIP][132] ([i915#2527]) -> [PASS][133] +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@gen9_exec_parse@batch-without-end.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html

  * igt@i915_pm_backlight@bad-brightness:
    - {shard-rkl}:        [SKIP][134] ([i915#3012]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-1/igt@i915_pm_backlight@bad-brightness.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_dc@dc6-psr:
    - {shard-rkl}:        [SKIP][136] ([i915#658]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-5/igt@i915_pm_dc@dc6-psr.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@cursor:
    - {shard-rkl}:        [SKIP][138] ([i915#1849]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@i915_pm_rpm@cursor.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@i915_pm_rpm@cursor.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][140] ([i915#180]) -> [PASS][141] +3 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-kbl4/igt@i915_suspend@debugfs-reader.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_atomic@atomic_plane_damage:
    - {shard-rkl}:        [SKIP][142] ([i915#4098]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@kms_atomic@atomic_plane_damage.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_color@pipe-a-ctm-0-25:
    - {shard-rkl}:        [SKIP][144] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@kms_color@pipe-a-ctm-0-25.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_color@pipe-a-ctm-0-25.html

  * igt@kms_color@pipe-a-ctm-0-75:
    - {shard-rkl}:        [SKIP][146] ([i915#1149] / [i915#1849] / [i915#4098]) -> [PASS][147] +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-5/igt@kms_color@pipe-a-ctm-0-75.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_color@pipe-a-ctm-0-75.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][148] ([i915#2346]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - {shard-rkl}:        [SKIP][150] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][151] +4 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][152] ([i915#79]) -> [PASS][153] +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-fences-interruptible@b-vga1:
    - shard-snb:          [INCOMPLETE][154] -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-snb7/igt@kms_flip@flip-vs-fences-interruptible@b-vga1.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-snb5/igt@kms_flip@flip-vs-fences-interruptible@b-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-glk:          [FAIL][156] ([i915#4911]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][158] ([i915#1849] / [i915#4098]) -> [PASS][159] +33 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_invalid_mode@uint-max-clock:
    - {shard-rkl}:        [SKIP][160] ([i915#4278]) -> [PASS][161] +1 similar issue
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@kms_invalid_mode@uint-max-clock.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-apl:          [DMESG-WARN][162] ([i915#180]) -> [PASS][163] +1 similar issue
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
    - {shard-rkl}:        [SKIP][164] ([i915#1849] / [i915#3558]) -> [PASS][165] +2 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html

  * igt@kms_plane@plane-position-hole@pipe-b-planes:
    - {shard-rkl}:        [SKIP][166] ([i915#3558]) -> [PASS][167] +3 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - {shard-rkl}:        [SKIP][168] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-tglb:         [INCOMPLETE][170] -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-tglb3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][172] ([i915#5176]) -> [PASS][173] +2 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][174] ([fdo#109441]) -> [PASS][175] +3 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - {shard-rkl}:        [SKIP][176] ([i915#1072]) -> [PASS][177] +1 similar issue
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-1/igt@kms_psr@sprite_plane_onoff.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_universal_plane@universal-plane-pipe-b-sanity:
    - {shard-rkl}:        [SKIP][178] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - {shard-rkl}:        [SKIP][180] ([i915#1845] / [i915#4098]) -> [PASS][181] +33 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-rkl-2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@prime_self_import@reimport-vs-gem_close-race:
    - {shard-dg1}:        [SKIP][182] ([i915#2575]) -> [PASS][183] +3 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-dg1-17/igt@prime_self_import@reimport-vs-gem_close-race.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-dg1-12/igt@prime_self_import@reimport-vs-gem_close-race.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][184] ([i915#2852]) -> [FAIL][185] ([i915#2842])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][186] ([i915#2920]) -> [SKIP][187] ([i915#658]) +1 similar issue
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][188] ([i915#2920]) -> [SKIP][189] ([fdo#111068] / [i915#658])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][190] ([fdo#111068] / [i915#658]) -> [SKIP][191] ([i915#2920]) +1 similar issue
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][197], [FAIL][198], [FAIL][199], [FAIL][200]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl4/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl4/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl1/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl8/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl3/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl1/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl8/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl7/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
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
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3736]: https://gitlab.freedesktop.org/drm/intel/issues/3736
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3963]: https://gitlab.freedesktop.org/drm/intel/issues/3963
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4904]: https://gitlab.freedesktop.org/drm/intel/issues/4904
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5266]: https://gitlab.freedesktop.org/drm/intel/issues/5266
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6141]: https://gitlab.freedesktop.org/drm/intel/issues/6141
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6542 -> IGTPW_7394
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11809: 5a602421b7141011b90e2b2c3d8dab98d5253f7c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7394: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.html
  IGT_6542: d38a476ee4b9f9a95d8f452de0d66cc52f7f079b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.html

--===============7001107699206351719==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_edge_walk: Fix test require=
ment to avoid SKIPs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105574/">https://patchwork.freedesktop.org/series/105574/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7394/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11809_full -&gt; IGTPW_7394_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7394_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7394_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7394=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-iclb1/igt@kms_cursor_crc@cursor-onscreen@pip=
e-b-edp-1-512x512.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
394/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@toggle.html">FAIL</a> =
+2 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170:<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-dg1-15/igt@kms_cursor_crc@cursor-random@pipe=
-c-hdmi-a-1-512x170.html">SKIP</a> +15 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11809_full and IGTPW_7394_=
full:</p>
<h3>New IGT tests (133)</h3>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.30, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-2-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-2-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-2-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-b-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.30, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.61, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-c-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-d-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.31, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.21, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.19, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.19, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-2-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-2-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-2-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.32, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.63, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.63, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.61, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.61, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.61, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-2-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-2-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-2-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.32, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.61, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.64, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.63, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.61, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.64, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.30, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.19, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-2-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-2-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-2-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.23, 4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7394_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard=
-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-1us:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-tglb1/igt@gem_eio@in-flight-1us.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-tglb3/ig=
t@gem_eio@in-flight-1us.html">TIMEOUT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3063">i915#3063</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/=
shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-apl7/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6141">i=
915#6141</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-tglb6/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6141">=
i915#6141</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-glk2/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6141">i=
915#6141</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb8/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6141">=
i915#6141</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-=
tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-k=
bl7/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/sh=
ard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/sh=
ard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl4/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl3/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-tglb6/igt@gem_pxp@reject-modify-context-prote=
ction-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb7/igt@gem_pxp@reject-modify-context-prote=
ction-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-iclb6/igt@gem_render_copy@linear-to-vebox-y-=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb6/igt@gen9_exec_parse@shadow-peek.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">=
i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-tglb7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-=
stress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-snb6/igt@i915_pm_rpm@pm-caching.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +76 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-apl4/igt@i915_suspend@forcewake.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb5/igt@kms_atomic_transition@plane-all-mo=
deset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-tglb2/igt@kms_big_fb@4-tiled-addfb-size-offse=
t-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5286">i915#5286</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb6/igt@kms_big_fb@4-tiled-addfb-size-offse=
t-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-glk8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb5/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@kms_ccs@pipe-b-bad-pixel-format-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +168 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb2/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-glk9/igt@kms_ccs@pipe-c-bad-rotation-90-4_til=
ed_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a>) +54 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb5/igt@kms_ccs@pipe-c-bad-rotation-90-4_ti=
led_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109278">fdo#109278</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb6/igt@kms_ccs@pipe-c-crc-primary-basic-4=
_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb3/igt@kms_ccs@pipe-c-random-ccs-data-y_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb6/igt@kms_ccs@pipe-d-ccs-on-another-bo-y=
f_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-snb4/igt@kms_chamelium@hdmi-edid-read.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-apl3/igt@kms_chamelium@vga-hpd-without-ddc.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-tglb2/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-glk6/igt@kms_chamelium@vga-hpd-without-ddc.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb3/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@kms_color@pipe-b-deep-color.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">=
i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@kms_color_chamelium@pipe-a-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-tglb7/igt@kms_content_protection@atomic-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1063">i915#1063</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb7/igt@kms_content_protection@atomic-dpms.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09300">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-kbl7/igt@kms_content_protection@atomic-dpms.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1319">i915#1319</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-apl1/igt@kms_content_protection@lic.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@kms_cursor_crc@cursor-onscreen@pip=
e-a-edp-1-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-tglb1/igt@kms_cursor_crc@cursor-onscreen@pipe=
-c-edp-1-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4462">i915#4462</a>) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb1/igt@kms_cursor_crc@cursor-onscreen@pipe=
-c-edp-1-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4462">i915#4462</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-trans=
itions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7394/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-tra=
nsitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-iclb1/igt@kms_flip@2x-absolute-wf_vblank-int=
erruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb1/igt@kms_flip@2x-flip-vs-expired-vblank=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111825">fdo#111825</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl4/igt@kms_flip@flip-vs-suspend-interrupti=
ble@c-dp1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-mul=
tidraw.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7394/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-m=
ultidraw.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +11 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11809/shard-apl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394=
/shard-apl8/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp=
-1.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/180">i915#180</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7394/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-s=
uspend@pipe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-o=
paque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-o=
paque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-apl1/igt@kms_plane_alpha_blend@pipe-d-alpha-=
transparent-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +85 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb5/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7394/shard-iclb2/igt@kms_plane_scaling@planes-downscale-f=
actor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5235">i915#5235</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl1/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb5/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
2">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3467">i915#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shar=
d-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-apl8/igt@kms_writeback@writeback-invalid-para=
meters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-glk3/igt@kms_writeback@writeback-invalid-para=
meters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-kbl7/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-iclb2/igt@nouveau_crc@pipe-a-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb3/igt@nouveau_crc@pipe-c-source-outp-ina=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb8/igt@prime_nv_pcopy@test1_macro.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">f=
do#109291</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-tglb3/igt@prime_nv_pcopy@test1_macro.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">f=
do#109291</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-tglb2/igt@sysfs_clients@pidname.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-apl3/igt@sysfs_clients@split-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-glk2/igt@sysfs_clients@split-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-iclb2/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7394/shard-kbl6/igt@sysfs_clients@split-50.html">SKIP</a=
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
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-5/igt@fbdev@unaligned-write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rk=
l-6/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915=
#3063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7394/shard-tglb1/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shar=
d-rkl-2/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-tglu-8/igt@gem_exec_fair@basic-none-share@rcs0.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i9=
15#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7394/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11809/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
94/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></p>
</li>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11809/shard-rkl-2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
394/shard-rkl-1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
394/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i9=
15#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7394/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">PASS</a> =
+7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1850">i915#1850</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/sh=
ard-rkl-6/igt@gem_mmap_wc@set-cache-level.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-1/igt@gem_pread@display.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-5/=
igt@gem_pread@display.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-apl8/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5=
566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i=
915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7394/shard-apl2/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@gen9_exec_parse@batch-without-end.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#=
2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
394/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-1/igt@i915_pm_backlight@bad-brightness.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3=
012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
94/shard-rkl-6/igt@i915_pm_backlight@bad-brightness.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-5/igt@i915_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/i=
gt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6=
/igt@i915_pm_rpm@cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-kbl4/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#18=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394=
/shard-kbl3/igt@i915_suspend@debugfs-reader.html">PASS</a> +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@kms_atomic@atomic_plane_damage.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#409=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394=
/shard-rkl-6/igt@kms_atomic@atomic_plane_damage.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-25:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@kms_color@pipe-a-ctm-0-25.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#18=
49</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i=
915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7394/shard-rkl-6/igt@kms_color@pipe-a-ctm-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-75:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-5/igt@kms_color@pipe-a-ctm-0-75.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#18=
49</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i=
915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7394/shard-rkl-6/igt@kms_color@pipe-a-ctm-0-75.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7394/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic=
-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-unti=
led.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb2101010-blt-untiled.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7394/shard-glk3/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible@b-vga1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-snb7/igt@kms_flip@flip-vs-fences-interruptible@b-vga1.h=
tml">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7394/shard-snb5/igt@kms_flip@flip-vs-fences-interruptible@b-vga1.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-=
ytileccs-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4911">i915#4911</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7394/shard-glk2/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytileccs-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcps=
r-rgb565-draw-mmap-gtt.html">PASS</a> +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#42=
78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_739=
4/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-b-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7394/shard-apl8/igt@kms_plane@plane-panning-bott=
om-right-suspend@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-pla=
nes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms=
@pipe-b-planes.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7394/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.h=
tml">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparen=
t-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-=
a-alpha-transparent-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-tglb3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparen=
t-fb.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7394/shard-tglb7/igt@kms_plane_alpha_blend@pipe-c-alpha-tran=
sparent-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-=
a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-=
format-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-iclb5/igt@kms_plane_sca=
ling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html">PASS</=
a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
94/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/sha=
rd-rkl-6/igt@kms_psr@sprite_plane_onoff.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-b-sanity:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-b-sa=
nity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_universal_plane@univers=
al-plane-pipe-b-sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-rkl-2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7394/shard-rkl-6/igt@kms_vblank@pipe-a-ts-continuation-dp=
ms-suspend.html">PASS</a> +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@reimport-vs-gem_close-race:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-dg1-17/igt@prime_self_import@reimport-vs-gem_close-race=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7394/shard-dg1-12/igt@prime_self_import@reimport-vs-gem_close-ra=
ce.html">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2852">i915=
#2852</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7394/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7394/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7394/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11809/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7394/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#29=
20</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11809/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11809/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11809/shard-apl8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11809/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7394/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/shard-apl8/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/sh=
ard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7394/shard-apl4/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#18=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i9=
15#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/43=
12">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6542 -&gt; IGTPW_7394</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11809: 5a602421b7141011b90e2b2c3d8dab98d5253f7c @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7394: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7394/index.htm=
l<br />
  IGT_6542: d38a476ee4b9f9a95d8f452de0d66cc52f7f079b @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7001107699206351719==--
