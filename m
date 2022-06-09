Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1028215521110161687=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 09 Jun 2022 06:52:39 -0000
Message-ID: <165475755963.17374.14177702541546472932@emeril.freedesktop.org>
References: <20220609053427.4061474-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220609053427.4061474-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpipe=5Fcrc=5Fbasic=3A_IGT_test_cleanup?=
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

--===============1028215521110161687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_pipe_crc_basic: IGT test cleanup
URL   : https://patchwork.freedesktop.org/series/104916/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11743 -> IGTPW_7265
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/index.html

Participating hosts (44 -> 38)
------------------------------

  Missing    (6): fi-kbl-soraka fi-bxt-dsi bat-adlm-1 bat-adlp-4 bat-jsl-2 fi-bdw-samus 

New tests
---------

  New tests have been introduced between CI_DRM_11743 and IGTPW_7265:

### New IGT tests (176) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.33, 0.43] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.70] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 0.75] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.32, 0.44] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.35, 0.54] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.26, 0.37] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.31, 0.39] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.27, 0.36] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.82, 0.98] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.30, 1.98] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.28, 0.37] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.29, 0.49] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.26, 0.45] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.31, 0.41] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.82, 1.03] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.26, 1.41] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.28, 0.34] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.27, 0.56] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.26, 0.29] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.43] s

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.83, 1.02] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.96] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.97, 2.93] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.79, 1.10] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.92, 1.39] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.72, 1.15] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.82, 0.97] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.75, 0.92] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.87, 2.29] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [2.73, 4.08] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.72, 1.00] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.87, 1.23] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.71, 1.23] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.81, 1.02] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.87, 2.31] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [2.68, 3.01] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.75, 0.98] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.80, 1.33] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.72, 0.75] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.95] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.88, 1.17] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.50, 0.58] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.89] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.64, 0.94] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.48, 0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.53, 0.72] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.43, 0.58] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.00, 1.14] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.41, 2.07] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 0.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.46, 0.68] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.42, 0.65] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.58] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.0, 1.14] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.40, 1.60] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.44, 0.72] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.42, 0.45] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.50, 0.59] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.85] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.63, 0.96] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.48, 0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.54, 0.74] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.43, 0.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.00, 1.13] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.43, 2.12] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 0.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.46, 0.71] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.42, 0.64] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.00, 1.19] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.38, 1.60] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.44, 0.73] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.42, 0.44] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.56] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.45, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.79] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.58, 0.89] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.41, 0.54] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.46, 0.66] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.48] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 0.46] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.37, 0.45] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.94, 1.05] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.36, 2.05] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.48] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.39, 0.67] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.35, 0.56] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 0.51] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.93, 1.09] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.33, 1.47] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.37, 0.45] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.37, 0.65] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.36, 0.37] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.49] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.43, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.82] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.59, 0.92] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.42, 0.54] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.46, 0.69] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 0.46] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.37, 0.46] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.94, 1.12] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.36, 2.06] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.49] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.39, 0.65] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.36, 0.57] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 0.50] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.94, 1.09] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.33, 1.49] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.37, 0.44] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.37, 0.66] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.35, 0.38] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.50] s

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.24, 2.93] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.43, 5.59] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [2.97, 6.97] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.79, 3.55] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [2.12, 4.48] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.04] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.75, 3.26] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.75, 2.27] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [2.03, 2.75] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.71, 6.54] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [3.62, 14.14] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.65, 11.62] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.99, 4.21] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.42] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.08, 3.25] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 2.99] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.31, 5.93] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [3.65, 14.38] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.75, 11.86] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [1.99, 4.24] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.69, 3.25] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.67] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  

Known issues
------------

  Here are the changes found in IGTPW_7265 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-snb-2600:        NOTRUN -> [SKIP][1] ([fdo#109271] / [fdo#111827])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][2] ([fdo#109271]) +6 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][3] ([fdo#109271]) +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([fdo#109271]) +6 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-kbl-8809g/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][5] ([fdo#109271]) +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        NOTRUN -> [SKIP][6] ([fdo#109271]) +6 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * {igt@kms_pipe_crc_basic@suspend-read-crc} (NEW):
    - {bat-dg2-8}:        NOTRUN -> [SKIP][7] ([i915#5354]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@gem_ringfill@basic-all:
    - {bat-dg2-8}:        [FAIL][8] ([i915#5886]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/bat-dg2-8/igt@gem_ringfill@basic-all.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/bat-dg2-8/igt@gem_ringfill@basic-all.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][10] ([i915#3921]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          [DMESG-FAIL][12] ([i915#4494] / [i915#4957]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@reset:
    - {bat-adlp-6}:       [DMESG-FAIL][14] ([i915#4983]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/bat-adlp-6/igt@i915_selftest@live@reset.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/bat-adlp-6/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
  [i915#5886]: https://gitlab.freedesktop.org/drm/intel/issues/5886
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6515 -> IGTPW_7265

  CI-20190529: 20190529
  CI_DRM_11743: 2d47fcd64571aa5e6b9ff875ddf061f372ed19a3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7265: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/index.html
  IGT_6515: 547f7c12716fe8e39573f32585d0377bdc8e7ff8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_pipe_crc_basic@compare-crc-sanitycheck
+igt@kms_pipe_crc_basic@disable-crc-after-crtc
+igt@kms_pipe_crc_basic@hang-read-crc
+igt@kms_pipe_crc_basic@nonblocking-crc
+igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
+igt@kms_pipe_crc_basic@read-crc
+igt@kms_pipe_crc_basic@read-crc-frame-sequence
+igt@kms_pipe_crc_basic@suspend-read-crc
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-e
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-f
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-b
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-c
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-d
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-e
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-f
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e-frame-sequence
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f-frame-sequence
-igt@kms_pipe_crc_basic@read-crc-pipe-a
-igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
-igt@kms_pipe_crc_basic@read-crc-pipe-b
-igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence
-igt@kms_pipe_crc_basic@read-crc-pipe-c
-igt@kms_pipe_crc_basic@read-crc-pipe-c-frame-sequence
-igt@kms_pipe_crc_basic@read-crc-pipe-d
-igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence
-igt@kms_pipe_crc_basic@read-crc-pipe-e
-igt@kms_pipe_crc_basic@read-crc-pipe-e-frame-sequence
-igt@kms_pipe_crc_basic@read-crc-pipe-f
-igt@kms_pipe_crc_basic@read-crc-pipe-f-frame-sequence
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-e
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/index.html

--===============1028215521110161687==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_pipe_crc_basic: IGT test cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104916/">https://patchwork.freedesktop.org/series/104916/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11743 -&gt; IGTPW_7265</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/index.html</p>
<h2>Participating hosts (44 -&gt; 38)</h2>
<p>Missing    (6): fi-kbl-soraka fi-bxt-dsi bat-adlm-1 bat-adlp-4 bat-jsl-2 fi-bdw-samus </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11743 and IGTPW_7265:</p>
<h3>New IGT tests (176)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.33, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.51, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.32, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.35, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.26, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.31, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.27, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.82, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.30, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.28, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.29, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.26, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.31, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.82, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.26, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.28, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.27, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.26, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.83, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.97, 2.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.79, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.92, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.72, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.82, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.75, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.87, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.73, 4.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.72, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.87, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.71, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.81, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.87, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.68, 3.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.75, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.80, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.72, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.88, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.50, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.64, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.48, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.53, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.43, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.47, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.44, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.00, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.41, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.44, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.46, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.42, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.47, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.0, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.40, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.44, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.44, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.42, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.50, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.63, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.48, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.54, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.43, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.47, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.44, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.00, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.43, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.44, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.46, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.42, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.47, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.00, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.38, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.44, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.44, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.42, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.45, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.58, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.41, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.46, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.40, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.37, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.94, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.36, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.39, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.35, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.40, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.93, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.33, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.37, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.37, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.36, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.43, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.59, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.42, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.46, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.40, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.37, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.94, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.36, 2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.39, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.36, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.40, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.94, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.33, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.37, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.37, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.35, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.24, 2.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.43, 5.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.97, 6.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.79, 3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.12, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.75, 3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.75, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.03, 2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.71, 6.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [3.62, 14.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.65, 11.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.99, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.08, 3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 2.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.31, 5.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [3.65, 14.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.75, 11.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.99, 4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.69, 3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7265 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-kbl-8809g/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@suspend-read-crc} (NEW):</p>
<ul>
<li>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ringfill@basic-all:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/bat-dg2-8/igt@gem_ringfill@basic-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5886">i915#5886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/bat-dg2-8/igt@gem_ringfill@basic-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11743/bat-adlp-6/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/bat-adlp-6/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6515 -&gt; IGTPW_7265</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11743: 2d47fcd64571aa5e6b9ff875ddf061f372ed19a3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7265: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7265/index.html<br />
  IGT_6515: 547f7c12716fe8e39573f32585d0377bdc8e7ff8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_pipe_crc_basic@compare-crc-sanitycheck<br />
+igt@kms_pipe_crc_basic@disable-crc-after-crtc<br />
+igt@kms_pipe_crc_basic@hang-read-crc<br />
+igt@kms_pipe_crc_basic@nonblocking-crc<br />
+igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence<br />
+igt@kms_pipe_crc_basic@read-crc<br />
+igt@kms_pipe_crc_basic@read-crc-frame-sequence<br />
+igt@kms_pipe_crc_basic@suspend-read-crc<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-e<br />
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-f<br />
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a<br />
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b<br />
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c<br />
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d<br />
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e<br />
-igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f<br />
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-a<br />
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-b<br />
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-c<br />
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-d<br />
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-e<br />
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-f<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e-frame-sequence<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f<br />
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f-frame-sequence<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-a<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-b<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-c<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-c-frame-sequence<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-d<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-e<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-e-frame-sequence<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-f<br />
-igt@kms_pipe_crc_basic@read-crc-pipe-f-frame-sequence<br />
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a<br />
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b<br />
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c<br />
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d<br />
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-e<br />
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-f</p>

</body>
</html>

--===============1028215521110161687==--
