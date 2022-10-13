Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1637252873179014612=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 13 Oct 2022 02:35:12 -0000
Message-ID: <166562851202.20378.3794318871846386182@emeril.freedesktop.org>
References: <20221012185756.9088-1-swati2.sharma@intel.com>
In-Reply-To: <20221012185756.9088-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvblank=3A_Convert_test_to_dynamic_=28rev2=29?=
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

--===============1637252873179014612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vblank: Convert test to dynamic (rev2)
URL   : https://patchwork.freedesktop.org/series/109170/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12238_full -> IGTPW_7953_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/index.html

Participating hosts (9 -> 6)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

New tests
---------

  New tests have been introduced between CI_DRM_12238_full and IGTPW_7953_full:

### New IGT tests (396) ###

  * igt@kms_vblank@accuracy-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@accuracy-idle@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_vblank@accuracy-idle@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.75, 2.48] s

  * igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_vblank@accuracy-idle@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_vblank@accuracy-idle@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_vblank@accuracy-idle@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.56, 3.20] s

  * igt@kms_vblank@accuracy-idle@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_vblank@accuracy-idle@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_vblank@accuracy-idle@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_vblank@accuracy-idle@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.36] s

  * igt@kms_vblank@accuracy-idle@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.55, 3.20] s

  * igt@kms_vblank@accuracy-idle@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_vblank@accuracy-idle@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_vblank@accuracy-idle@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_vblank@crtc-id@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_vblank@crtc-id@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_vblank@crtc-id@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_vblank@crtc-id@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_vblank@crtc-id@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_vblank@crtc-id@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_vblank@crtc-id@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_vblank@crtc-id@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_vblank@crtc-id@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_vblank@crtc-id@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_vblank@crtc-id@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_vblank@crtc-id@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_vblank@crtc-id@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_vblank@crtc-id@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_vblank@crtc-id@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_vblank@invalid@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_vblank@invalid@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.49] s

  * igt@kms_vblank@invalid@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_vblank@invalid@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_vblank@query-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@query-busy-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@query-busy-hang@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.18, 15.09] s

  * igt@kms_vblank@query-busy-hang@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.32] s

  * igt@kms_vblank@query-busy-hang@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.03] s

  * igt@kms_vblank@query-busy-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.37] s

  * igt@kms_vblank@query-busy-hang@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.97, 15.99] s

  * igt@kms_vblank@query-busy-hang@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.95] s

  * igt@kms_vblank@query-busy-hang@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.00] s

  * igt@kms_vblank@query-busy-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.01] s

  * igt@kms_vblank@query-busy-hang@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.00, 15.99] s

  * igt@kms_vblank@query-busy-hang@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.01] s

  * igt@kms_vblank@query-busy-hang@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.96] s

  * igt@kms_vblank@query-busy-hang@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [16.01] s

  * igt@kms_vblank@query-busy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_vblank@query-busy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.87, 2.67] s

  * igt@kms_vblank@query-busy@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.75] s

  * igt@kms_vblank@query-busy@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_vblank@query-busy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_vblank@query-busy@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_vblank@query-busy@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.68, 3.40] s

  * igt@kms_vblank@query-busy@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_vblank@query-busy@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_vblank@query-busy@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_vblank@query-busy@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@kms_vblank@query-busy@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.67, 3.39] s

  * igt@kms_vblank@query-busy@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_vblank@query-busy@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_vblank@query-busy@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_vblank@query-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@query-forked-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@query-forked-busy-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.76, 6.86] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.72] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.04] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.67] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.98] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.97] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.94] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.97, 6.98] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.04] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.96] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.97] s

  * igt@kms_vblank@query-forked-busy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_vblank@query-forked-busy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.89, 2.69] s

  * igt@kms_vblank@query-forked-busy@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_vblank@query-forked-busy@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.59] s

  * igt@kms_vblank@query-forked-busy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_vblank@query-forked-busy@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_vblank@query-forked-busy@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.66, 3.42] s

  * igt@kms_vblank@query-forked-busy@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_vblank@query-forked-busy@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.51] s

  * igt@kms_vblank@query-forked-busy@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_vblank@query-forked-busy@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@kms_vblank@query-forked-busy@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.68, 3.44] s

  * igt@kms_vblank@query-forked-busy@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_vblank@query-forked-busy@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@kms_vblank@query-forked-busy@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_vblank@query-forked-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@query-forked-hang@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.67] s

  * igt@kms_vblank@query-forked-hang@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.54, 16.18] s

  * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.19] s

  * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.95] s

  * igt@kms_vblank@query-forked-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.37] s

  * igt@kms_vblank@query-forked-hang@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.04] s

  * igt@kms_vblank@query-forked-hang@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.94, 17.00] s

  * igt@kms_vblank@query-forked-hang@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@query-forked-hang@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.03] s

  * igt@kms_vblank@query-forked-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.01] s

  * igt@kms_vblank@query-forked-hang@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@query-forked-hang@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [9.02, 16.99] s

  * igt@kms_vblank@query-forked-hang@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.99] s

  * igt@kms_vblank@query-forked-hang@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.03] s

  * igt@kms_vblank@query-forked-hang@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.16] s

  * igt@kms_vblank@query-forked@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_vblank@query-forked@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.78, 2.52] s

  * igt@kms_vblank@query-forked@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_vblank@query-forked@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_vblank@query-forked@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_vblank@query-forked@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_vblank@query-forked@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 3.29] s

  * igt@kms_vblank@query-forked@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_vblank@query-forked@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_vblank@query-forked@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_vblank@query-forked@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_vblank@query-forked@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.56, 3.26] s

  * igt@kms_vblank@query-forked@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_vblank@query-forked@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_vblank@query-forked@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_vblank@query-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@query-idle-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@query-idle-hang@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.91] s

  * igt@kms_vblank@query-idle-hang@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.52, 15.79] s

  * igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.18] s

  * igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.05] s

  * igt@kms_vblank@query-idle-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.11] s

  * igt@kms_vblank@query-idle-hang@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@query-idle-hang@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.00, 15.98] s

  * igt@kms_vblank@query-idle-hang@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.95] s

  * igt@kms_vblank@query-idle-hang@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.06] s

  * igt@kms_vblank@query-idle-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.01] s

  * igt@kms_vblank@query-idle-hang@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.04] s

  * igt@kms_vblank@query-idle-hang@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.00, 16.00] s

  * igt@kms_vblank@query-idle-hang@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.95] s

  * igt@kms_vblank@query-idle-hang@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.99] s

  * igt@kms_vblank@query-idle-hang@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [16.15] s

  * igt@kms_vblank@query-idle@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_vblank@query-idle@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.76, 2.49] s

  * igt@kms_vblank@query-idle@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_vblank@query-idle@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.36] s

  * igt@kms_vblank@query-idle@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.13] s

  * igt@kms_vblank@query-idle@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_vblank@query-idle@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.55, 3.22] s

  * igt@kms_vblank@query-idle@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_vblank@query-idle@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_vblank@query-idle@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_vblank@query-idle@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_vblank@query-idle@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.56, 3.20] s

  * igt@kms_vblank@query-idle@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.32] s

  * igt@kms_vblank@query-idle@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_vblank@query-idle@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.54, 2.61] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.24] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.34, 2.37] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.34] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.35, 2.37] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.36] s

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.63, 2.94] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.95] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.25, 3.68] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.23, 3.65] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.59] s

  * igt@kms_vblank@ts-continuation-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@ts-continuation-idle-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.86] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.57, 15.46] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.27] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.35] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.97] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.96, 15.97] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.01] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.00] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.01] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.04] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.01, 16.00] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.94] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.06] s

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [16.00] s

  * igt@kms_vblank@ts-continuation-idle@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_vblank@ts-continuation-idle@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.48] s

  * igt@kms_vblank@ts-continuation-idle@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_vblank@ts-continuation-idle@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_vblank@ts-continuation-idle@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_vblank@ts-continuation-idle@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_vblank@ts-continuation-idle@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 1.21] s

  * igt@kms_vblank@ts-continuation-idle@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_vblank@ts-continuation-idle@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_vblank@ts-continuation-idle@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_vblank@ts-continuation-idle@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_vblank@ts-continuation-idle@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.19, 1.22] s

  * igt@kms_vblank@ts-continuation-idle@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_vblank@ts-continuation-idle@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_vblank@ts-continuation-idle@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_vblank@ts-continuation-modeset:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@ts-continuation-modeset-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.67, 1.82] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.35, 2.58] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.37, 2.60] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_vblank@ts-continuation-modeset-rpm:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.55, 2.62] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.09] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.25] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.33, 2.35] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.33] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.31, 2.39] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_vblank@ts-continuation-suspend:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.82, 2.63] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-b-dp-1:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [1.87] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.50, 3.29] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.52, 3.26] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_vblank@wait-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@wait-busy-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@wait-busy-hang@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.74] s

  * igt@kms_vblank@wait-busy-hang@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.37, 15.33] s

  * igt@kms_vblank@wait-busy-hang@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.60] s

  * igt@kms_vblank@wait-busy-hang@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@wait-busy-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.69] s

  * igt@kms_vblank@wait-busy-hang@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@wait-busy-hang@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.98, 15.98] s

  * igt@kms_vblank@wait-busy-hang@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.03] s

  * igt@kms_vblank@wait-busy-hang@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.96] s

  * igt@kms_vblank@wait-busy-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.01] s

  * igt@kms_vblank@wait-busy-hang@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.06] s

  * igt@kms_vblank@wait-busy-hang@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.99, 16.04] s

  * igt@kms_vblank@wait-busy-hang@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@wait-busy-hang@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.04] s

  * igt@kms_vblank@wait-busy-hang@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [15.97] s

  * igt@kms_vblank@wait-busy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_vblank@wait-busy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.88, 2.66] s

  * igt@kms_vblank@wait-busy@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.80] s

  * igt@kms_vblank@wait-busy@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_vblank@wait-busy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_vblank@wait-busy@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_vblank@wait-busy@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.65, 3.40] s

  * igt@kms_vblank@wait-busy@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_vblank@wait-busy@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.54] s

  * igt@kms_vblank@wait-busy@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_vblank@wait-busy@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_vblank@wait-busy@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.67, 3.40] s

  * igt@kms_vblank@wait-busy@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.51] s

  * igt@kms_vblank@wait-busy@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@kms_vblank@wait-busy@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_vblank@wait-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@wait-forked-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@wait-forked-busy-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.47] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.08, 15.22] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.92] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.03] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.07] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.05] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.05, 15.99] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.97] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.96] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.01] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.96] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.92, 16.00] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.02] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.97] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [15.99] s

  * igt@kms_vblank@wait-forked-busy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.41] s

  * igt@kms_vblank@wait-forked-busy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.90, 2.70] s

  * igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.74] s

  * igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_vblank@wait-forked-busy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.31] s

  * igt@kms_vblank@wait-forked-busy@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.52] s

  * igt@kms_vblank@wait-forked-busy@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.63, 3.43] s

  * igt@kms_vblank@wait-forked-busy@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.51] s

  * igt@kms_vblank@wait-forked-busy@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_vblank@wait-forked-busy@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_vblank@wait-forked-busy@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@kms_vblank@wait-forked-busy@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.68, 3.45] s

  * igt@kms_vblank@wait-forked-busy@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_vblank@wait-forked-busy@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.51] s

  * igt@kms_vblank@wait-forked-busy@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_vblank@wait-forked-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@wait-forked-hang@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.21] s

  * igt@kms_vblank@wait-forked-hang@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.59, 15.59] s

  * igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.68] s

  * igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.95] s

  * igt@kms_vblank@wait-forked-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.90] s

  * igt@kms_vblank@wait-forked-hang@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@wait-forked-hang@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.97, 16.00] s

  * igt@kms_vblank@wait-forked-hang@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.05] s

  * igt@kms_vblank@wait-forked-hang@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@wait-forked-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.01] s

  * igt@kms_vblank@wait-forked-hang@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.04] s

  * igt@kms_vblank@wait-forked-hang@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.0, 15.98] s

  * igt@kms_vblank@wait-forked-hang@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.95] s

  * igt@kms_vblank@wait-forked-hang@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.02] s

  * igt@kms_vblank@wait-forked-hang@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [16.02] s

  * igt@kms_vblank@wait-forked@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_vblank@wait-forked@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.81, 2.53] s

  * igt@kms_vblank@wait-forked@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_vblank@wait-forked@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_vblank@wait-forked@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_vblank@wait-forked@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_vblank@wait-forked@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.56, 3.29] s

  * igt@kms_vblank@wait-forked@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_vblank@wait-forked@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_vblank@wait-forked@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_vblank@wait-forked@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_vblank@wait-forked@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.55, 3.28] s

  * igt@kms_vblank@wait-forked@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_vblank@wait-forked@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.36] s

  * igt@kms_vblank@wait-forked@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_vblank@wait-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@wait-idle-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_vblank@wait-idle-hang@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.28] s

  * igt@kms_vblank@wait-idle-hang@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.54, 15.71] s

  * igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.59] s

  * igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.00] s

  * igt@kms_vblank@wait-idle-hang@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.04] s

  * igt@kms_vblank@wait-idle-hang@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.96] s

  * igt@kms_vblank@wait-idle-hang@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [7.97, 16.00] s

  * igt@kms_vblank@wait-idle-hang@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.91] s

  * igt@kms_vblank@wait-idle-hang@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.04] s

  * igt@kms_vblank@wait-idle-hang@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.01] s

  * igt@kms_vblank@wait-idle-hang@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.04] s

  * igt@kms_vblank@wait-idle-hang@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [8.00, 16.00] s

  * igt@kms_vblank@wait-idle-hang@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.98] s

  * igt@kms_vblank@wait-idle-hang@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [6.97] s

  * igt@kms_vblank@wait-idle-hang@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [15.99] s

  * igt@kms_vblank@wait-idle@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.24] s

  * igt@kms_vblank@wait-idle@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.77, 2.50] s

  * igt@kms_vblank@wait-idle@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.59] s

  * igt@kms_vblank@wait-idle@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_vblank@wait-idle@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_vblank@wait-idle@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_vblank@wait-idle@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.55, 3.21] s

  * igt@kms_vblank@wait-idle@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_vblank@wait-idle@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_vblank@wait-idle@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_vblank@wait-idle@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_vblank@wait-idle@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.55, 3.20] s

  * igt@kms_vblank@wait-idle@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_vblank@wait-idle@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_vblank@wait-idle@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.51] s

  

Known issues
------------

  Here are the changes found in IGTPW_7953_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][1] -> [FAIL][2] ([i915#6268])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-snb6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#280])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#5784])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-tglb3/igt@gem_eio@reset-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-glk8/igt@gem_exec_fair@basic-none@vcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][12] -> [SKIP][13] ([i915#2190])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-tglb5/igt@gem_huc_copy@huc-copy.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4613]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk7/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#4613]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl6/igt@gem_lmem_swapping@parallel-multi.html
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#4613]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb7/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#4613]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb5/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#4270]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4270]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#768])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109312])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109312])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#3297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#3297])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#5566] / [i915#716])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-apl6/igt@gen9_exec_parse@allowed-single.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl7/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-apl:          NOTRUN -> [FAIL][27] ([i915#7036])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#3989] / [i915#454])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][30] ([i915#3989] / [i915#454])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#6537])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-apl2/igt@i915_pm_rps@engine-order.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl6/igt@i915_pm_rps@engine-order.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [PASS][33] -> [DMESG-FAIL][34] ([i915#5334])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl2/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-iclb:         [PASS][35] -> [INCOMPLETE][36] ([i915#5982] / [i915#7057])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-iclb1/igt@i915_suspend@basic-s3-without-i915.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          NOTRUN -> [DMESG-WARN][37] ([i915#180]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-tglb:         [PASS][38] -> [INCOMPLETE][39] ([i915#6987])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-tglb5/igt@kms_addfb_basic@legacy-format.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#5286]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271]) +146 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#5286]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb8/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111614]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#110723])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278] / [i915#3886])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb1/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +8 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271]) +89 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-snb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111615] / [i915#3689]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#6095])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3689]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl8/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb3/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-snb5/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb2/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@ctm-limited-range:
    - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk6/igt@kms_color_chamelium@ctm-limited-range.html

  * igt@kms_content_protection@uevent:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#7118])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb3/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#6944] / [i915#7118])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][62] ([i915#1339] / [i915#7144])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl8/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - shard-apl:          [PASS][63] -> [DMESG-WARN][64] ([i915#180]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109274] / [fdo#111825])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][66] -> [FAIL][67] ([i915#2346])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
    - shard-iclb:         [PASS][68] -> [FAIL][69] ([i915#2346])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109274]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb1/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#2587] / [i915#2672])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#2587] / [i915#2672])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#2672]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#3555])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109285])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_force_connector_basic@force-load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109285])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#6497]) +4 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109280]) +10 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#109280] / [fdo#111825]) +10 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][81] -> [SKIP][82] ([i915#433])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#6403]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#6403]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109289])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109289])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb5/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][87] ([i915#4573]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk6/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271]) +68 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl1/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-a-dp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#5176]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#5176]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#6524])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_prime@basic-modeset-hybrid.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#6524])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb5/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2920])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#658])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#658])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#658]) +4 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][97] -> [SKIP][98] ([fdo#109441]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2437])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sysfs_clients@recycle:
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#2994]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk5/igt@sysfs_clients@recycle.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [SKIP][101] ([i915#4525]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][103] ([i915#2842]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          [TIMEOUT][105] ([i915#4639]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-apl1/igt@gen9_exec_parse@bb-large.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl1/igt@gen9_exec_parse@bb-large.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [DMESG-WARN][107] ([i915#5591]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-tglb5/igt@i915_selftest@live@hangcheck.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb1/igt@i915_selftest@live@hangcheck.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][109] ([i915#2122]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][111] ([i915#5235]) -> [PASS][112] +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][113] ([fdo#109441]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-iclb6/igt@kms_psr@psr2_basic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [FAIL][115] ([i915#5639]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-iclb1/igt@perf@polling-parameterized.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb7/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][117] ([i915#2920]) -> [SKIP][118] ([i915#658])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-iclb:         [SKIP][119] ([i915#658]) -> [SKIP][120] ([i915#2920]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][121], [FAIL][122], [FAIL][123]) ([i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-apl8/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-apl7/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-apl3/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl8/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl8/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl3/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl7/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl7/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl8/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1339]: https://gitlab.freedesktop.org/drm/intel/issues/1339
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4639]: https://gitlab.freedesktop.org/drm/intel/issues/4639
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6987]: https://gitlab.freedesktop.org/drm/intel/issues/6987
  [i915#7036]: https://gitlab.freedesktop.org/drm/intel/issues/7036
  [i915#7057]: https://gitlab.freedesktop.org/drm/intel/issues/7057
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7144]: https://gitlab.freedesktop.org/drm/intel/issues/7144
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7012 -> IGTPW_7953
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12238: 87844a66c86d81ccc88314bd68b9f7292d6b32a5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7953: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/index.html
  IGT_7012: ca6f5bdd537d26692c4b1ca011b8c4f227d95703 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/index.html

--===============1637252873179014612==
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
<tr><td><b>Series:</b></td><td>tests/kms_vblank: Convert test to dynamic (r=
ev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109170/">https://patchwork.freedesktop.org/series/109170/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7953/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12238_full -&gt; IGTPW_7953_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/index.=
html</p>
<h2>Participating hosts (9 -&gt; 6)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12238_full and IGTPW_7953_=
full:</p>
<h3>New IGT tests (396)</h3>
<ul>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.75, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.56, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.55, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@invalid@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@invalid@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@invalid@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@invalid@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.18, 15.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.97, 15.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.00, 15.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.87, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.68, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.67, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.76, 6.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.97, 6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.89, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.66, 3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.68, 3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.54, 16.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.94, 17.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.02, 16.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.78, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.56, 3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.52, 15.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.00, 15.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.00, 16.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.76, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.55, 3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.56, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.54, 2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.34, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.35, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63, 2.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.25, 3.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.23, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.57, 15.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.96, 15.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.01, 16.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.67, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.35, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.37, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.55, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.33, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.31, 2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.82, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.50, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.52, 3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.37, 15.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.98, 15.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.99, 16.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.88, 2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.65, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.67, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.08, 15.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.05, 15.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.92, 16.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.90, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63, 3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.68, 3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.59, 15.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.97, 16.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.0, 15.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.81, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.56, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.55, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.54, 15.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.97, 16.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.00, 16.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.77, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.55, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.55, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7953_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard=
-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-snb6/igt@gem_ctx_persistence@hostile.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-tglb3/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb5/igt=
@gem_eio@reset-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-=
tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-glk8/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-g=
lk3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-glk9/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-tglb5/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-tglb7/ig=
t@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-glk7/igt@gem_lmem_swapping@massive-random.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-apl6/igt@gem_lmem_swapping@parallel-multi.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb7/igt@gem_lmem_swapping@parallel-multi.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/46=
13">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb5/igt@gem_lmem_swapping@parallel-random.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb7/igt@gem_pxp@protected-encrypted-src-cop=
y-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4270">i915#4270</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb8/igt@gem_pxp@protected-encrypted-src-cop=
y-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4270">i915#4270</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb3/igt@gem_softpin@evict-snoop-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb8/igt@gem_softpin@evict-snoop-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb2/igt@gem_userptr_blits@dmabuf-unsync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-apl6/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-=
apl7/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-yt=
iled.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/7036">i915#7036</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb3/igt@=
i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3989">i915#3989</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb1/igt@i915_pm_dc@dc6-psr.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915=
#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-apl2/igt@i915_pm_rps@engine-order.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl6/i=
gt@i915_pm_rps@engine-order.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/6537">i915#6537</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard=
-apl2/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-iclb1/igt@i915_suspend@basic-s3-without-i915.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/s=
hard-iclb3/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7057">i915#70=
57</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-apl8/igt@i915_suspend@sysfs-reader.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-tglb5/igt@kms_addfb_basic@legacy-format.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-=
tglb3/igt@kms_addfb_basic@legacy-format.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/6987">i915#6987</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb1/igt@kms_big_fb@4-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-glk5/igt@kms_big_fb@4-tiled-max-hw-stride-32b=
pp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +146 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb8/igt@kms_big_fb@linear-8bpp-rotate-90.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111614">fdo#111614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-90.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111615">fdo#111615</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-apl6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb1/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-snb7/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +89 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb5/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@kms_ccs@pipe-d-bad-pixel-format-4_=
tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb5/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-apl8/igt@kms_chamelium@hdmi-aspect-ratio.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb3/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-snb5/igt@kms_chamelium@vga-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb2/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-limited-range:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-glk6/igt@kms_color_chamelium@ctm-limited-ran=
ge.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb3/igt@kms_content_protection@uevent.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7118"=
>i915#7118</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb5/igt@kms_content_protection@uevent.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6944"=
>i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/7118">i915#7118</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-apl8/igt@kms_content_protection@uevent@pipe-=
a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1339">i915#1339</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/7144">i915#7144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7953/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb2/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12238/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transit=
ions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7953/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12238/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7953/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-tran=
sitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2346">i915#2346</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb1/igt@kms_flip@2x-flip-vs-panning.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274"=
>fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_flip@2x-flip-vs-panning-vs-han=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_force_connector_basic@force-loa=
d-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109285">fdo#109285</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb8/igt@kms_force_connector_basic@force-loa=
d-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/6497">i915#6497</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +10 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +10 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-t=
glb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb5/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-mo=
deset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb5/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-mo=
deset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-glk6/igt@kms_plane_alpha_blend@alpha-basic@p=
ipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-a-d=
p-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-apl1/igt@kms_plane_scaling@plane-downscale-w=
ith-modifiers-factor-0-5@pipe-a-dp-1.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +68 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-tglb7/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb3/igt@kms_prime@basic-modeset-hybrid.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6524=
">i915#6524</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb5/igt@kms_prime@basic-modeset-hybrid.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6524=
">i915#6524</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-tglb7/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7953/shard-apl6/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-glk2/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard=
-iclb8/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-apl8/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7953/shard-glk5/igt@sysfs_clients@recycle.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7953/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
953/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-apl1/igt@gen9_exec_parse@bb-large.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4639">i915#4639</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/sha=
rd-apl1/igt@gen9_exec_parse@bb-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-tglb5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5591">i915=
#5591</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7953/shard-tglb1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-glk9/igt@kms_flip@2x-plain-flip-=
fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-iclb8/igt@kms_plane_=
scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html">=
PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-iclb6/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-icl=
b2/igt@kms_psr@psr2_basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-iclb1/igt@perf@polling-parameterized.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/sha=
rd-iclb7/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7953/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12238/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7953/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg=
-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12238/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12238/shard-apl7/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12238/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-=
apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7953/shard-apl8/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl3/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7953/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl7/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7953/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/shard-apl2/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7012 -&gt; IGTPW_7953</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12238: 87844a66c86d81ccc88314bd68b9f7292d6b32a5 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7953: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7953/index.htm=
l<br />
  IGT_7012: ca6f5bdd537d26692c4b1ca011b8c4f227d95703 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1637252873179014612==--
