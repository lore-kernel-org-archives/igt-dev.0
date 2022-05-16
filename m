Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6660383309709196728=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Mon, 16 May 2022 15:08:03 -0000
Message-ID: <165271368334.21523.15574624952710514948@emeril.freedesktop.org>
References: <20220516140201.3428227-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220516140201.3428227-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_IGT_cleanup_=28rev3=29?=
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

--===============6660383309709196728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: IGT cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/102370/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11658 -> IGTPW_7108
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/index.html

Participating hosts (44 -> 44)
------------------------------

  Additional (1): bat-adlm-1 
  Missing    (1): bat-dg2-9 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7108:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_legacy@basic-flip-after-cursor} (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-dg1-5/igt@kms_cursor_legacy@basic-flip-after-cursor.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@requests:
    - {bat-adlm-1}:       NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-adlm-1/igt@i915_selftest@live@requests.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor}:
    - {bat-adln-1}:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * {igt@kms_pipe_crc_basic@read-crc-frame-sequence}:
    - bat-dg1-5:          NOTRUN -> [SKIP][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-dg1-5/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11658 and IGTPW_7108:

### New IGT tests (211) ###

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:
    - Statuses : 9 pass(s) 4 skip(s)
    - Exec time: [0.00, 2.19] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - Statuses : 9 pass(s) 4 skip(s)
    - Exec time: [0.00, 2.24] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - Statuses : 9 pass(s) 4 skip(s)
    - Exec time: [0.00, 2.35] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:
    - Statuses : 13 pass(s)
    - Exec time: [0.93, 1.46] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:
    - Statuses : 13 pass(s)
    - Exec time: [0.94, 2.21] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:
    - Statuses : 13 pass(s)
    - Exec time: [0.95, 2.22] s

  * igt@kms_cursor_legacy@basic-flip-after-cursor:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.37, 0.45] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.70] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.52, 0.99] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.32, 0.44] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.34, 0.55] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-vga-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.27, 0.37] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.33, 0.38] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.28, 0.36] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.84, 0.99] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.30, 2.30] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.28, 0.38] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.28, 0.52] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.26, 0.45] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.34, 0.41] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.86, 1.02] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.81, 1.62] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.28, 0.34] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.27, 0.57] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.26, 0.27] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.40] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.40] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.41] s

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.48, 0.54] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.82] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.58, 1.16] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.41, 0.53] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 0.67] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.37, 0.48] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.43, 0.46] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.37, 0.45] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 1.07] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.37, 2.02] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.37, 0.51] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.36, 0.63] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 0.55] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.44, 0.51] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.10] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.33, 1.86] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.37, 0.44] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 0.68] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.36, 0.38] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.48] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.47] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.49] s

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.56, 0.60] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.90] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.62, 1.23] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.48, 0.62] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 0.71] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.44, 0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.50, 0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.04, 1.15] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.43, 2.05] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.43, 0.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.43, 0.71] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.42, 0.65] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.51, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.04, 1.12] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.40, 1.88] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.44, 0.51] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.44, 0.74] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.42, 0.44] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.53, 1.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.56, 0.58] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.85] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.63, 1.17] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.48, 0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 0.71] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-vga-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.42, 0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.50, 0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.04, 1.15] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.42, 2.01] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.44, 0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.44, 0.73] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.42, 0.64] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.49, 0.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.04, 1.16] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.40, 1.89] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.43, 0.73] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.42, 0.45] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.53, 1.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.56] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.83] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.58, 1.11] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.42, 0.54] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 0.66] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-vga-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.37, 0.47] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.43, 0.46] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.37, 0.45] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.07] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.37, 1.95] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.35, 0.47] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.36, 0.61] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.35, 0.57] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.44, 0.50] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.95, 1.09] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.33, 1.82] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.37, 0.44] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.37, 0.63] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.35, 0.38] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.48] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.45, 1.47] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.51] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.49, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.80] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.60, 1.13] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.41, 0.53] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 0.64] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.37, 0.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.43, 0.45] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.37, 0.45] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 1.08] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.35, 2.03] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.35, 0.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.36, 0.62] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.35, 0.56] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.05] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.33, 1.83] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.37, 0.44] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.37, 0.60] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.36, 0.38] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.48] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.51] s

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.83, 5.07] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.64, 17.74] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.59, 12.78] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [1.88, 9.51] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.76] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.63, 2.26] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [1.82, 2.61] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.42, 4.93] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [3.35, 18.95] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.46, 11.32] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [1.77, 9.01] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.17] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.86, 2.21] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.77] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.41, 5.18] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [3.39, 18.97] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.59, 11.26] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [1.75, 9.05] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.50, 1.85] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.81] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.74, 19.02] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.77, 9.12] s

  

Known issues
------------

  Here are the changes found in IGTPW_7108 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][6] -> [INCOMPLETE][7] ([i915#4785])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11658/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          [PASS][8] -> [DMESG-FAIL][9] ([i915#4494] / [i915#4957])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11658/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][10] ([fdo#109271]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-elk-e7500/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][11] ([fdo#109271]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][12] ([fdo#109271]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-pnv-d510/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][13] ([fdo#109271]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * {igt@kms_cursor_legacy@basic-flip-after-cursor} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][14] ([fdo#109271]) +6 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-bsw-nick/igt@kms_cursor_legacy@basic-flip-after-cursor.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][15] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor.html

  * {igt@kms_cursor_legacy@basic-flip-before-cursor} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][16] ([fdo#109271]) +6 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-before-cursor.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][17] ([fdo#109271]) +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-bdw-gvtdvm/igt@kms_cursor_legacy@basic-flip-before-cursor.html

  * {igt@kms_pipe_crc_basic@compare-crc-sanitycheck} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][18] ([fdo#109271]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html

  * {igt@kms_pipe_crc_basic@hang-read-crc} (NEW):
    - {bat-dg2-8}:        NOTRUN -> [SKIP][19] ([i915#5354]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-rpls-2}:       [DMESG-WARN][20] ([i915#4391]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11658/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_busy@basic@flip:
    - {bat-adlp-6}:       [DMESG-WARN][22] ([i915#3576]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11658/bat-adlp-6/igt@kms_busy@basic@flip.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-adlp-6/igt@kms_busy@basic@flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5879]: https://gitlab.freedesktop.org/drm/intel/issues/5879
  [i915#5886]: https://gitlab.freedesktop.org/drm/intel/issues/5886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6473 -> IGTPW_7108

  CI-20190529: 20190529
  CI_DRM_11658: 6e9381cb50fd172bc8adfe2b201344b6166d684b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7108: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/index.html
  IGT_6473: 64723cd44c1cd2f8b8263e3b3681c99f05a1b499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 56 lines
--- 672 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/index.html

--===============6660383309709196728==
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
<tr><td><b>Series:</b></td><td>tests/kms: IGT cleanup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102370/">https://patchwork.freedesktop.org/series/102370/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11658 -&gt; IGTPW_7108</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/index.html</p>
<h2>Participating hosts (44 -&gt; 44)</h2>
<p>Additional (1): bat-adlm-1 <br />
  Missing    (1): bat-dg2-9 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7108:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_cursor_legacy@basic-flip-after-cursor} (NEW):<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-dg1-5/igt@kms_cursor_legacy@basic-flip-after-cursor.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-adlm-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor}:</p>
<ul>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@read-crc-frame-sequence}:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-dg1-5/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11658 and IGTPW_7108:</p>
<h3>New IGT tests (211)</h3>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:</p>
<ul>
<li>Statuses : 9 pass(s) 4 skip(s)</li>
<li>Exec time: [0.00, 2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>Statuses : 9 pass(s) 4 skip(s)</li>
<li>Exec time: [0.00, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 9 pass(s) 4 skip(s)</li>
<li>Exec time: [0.00, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:</p>
<ul>
<li>Statuses : 13 pass(s)</li>
<li>Exec time: [0.93, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:</p>
<ul>
<li>Statuses : 13 pass(s)</li>
<li>Exec time: [0.94, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:</p>
<ul>
<li>Statuses : 13 pass(s)</li>
<li>Exec time: [0.95, 2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.37, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.52, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.32, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.34, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.27, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.33, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.28, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.84, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.30, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.28, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.28, 0.52] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.26, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.34, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.86, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.81, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.28, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.27, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.26, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.41] s</li>
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
<li>Exec time: [0.48, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.58, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.41, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.46, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.37, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.43, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.37, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.98, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.37, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.37, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.36, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.36, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.44, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.97, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.33, 1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.37, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.36, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.36, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.56, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.62, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.48, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.53, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.44, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.50, 0.53] s</li>
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
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.04, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.43, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.43, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.43, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.42, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.51, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.04, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.40, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.44, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.44, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.42, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.53, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.56, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
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
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.63, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.48, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.53, 0.71] s</li>
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
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.42, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.50, 0.53] s</li>
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
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.04, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.42, 2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.44, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.44, 0.73] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.42, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.49, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.04, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.40, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.44, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.43, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.42, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.53, 1.54] s</li>
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
<li>Exec time: [0.47, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.58, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.42, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.46, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.37, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.43, 0.46] s</li>
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
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.97, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.37, 1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.35, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.36, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.35, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.44, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.95, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.33, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.37, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.37, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.35, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.45, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.49, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.60, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.41, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.46, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.37, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.43, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.37, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.98, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.35, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.35, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.36, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.35, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.44, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.97, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.33, 1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.37, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.37, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.36, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.51] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.83, 5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.64, 17.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.59, 12.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.88, 9.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.63, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.82, 2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.42, 4.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [3.35, 18.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.46, 11.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.77, 9.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.86, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.41, 5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [3.39, 18.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.59, 11.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.75, 9.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.50, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.74, 19.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.77, 9.12] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7108 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11658/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11658/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-elk-e7500/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-pnv-d510/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions} (NEW):</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-flip-after-cursor} (NEW):</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-bsw-nick/igt@kms_cursor_legacy@basic-flip-after-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-flip-before-cursor} (NEW):</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-bdw-gvtdvm/igt@kms_cursor_legacy@basic-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@compare-crc-sanitycheck} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@hang-read-crc} (NEW):</p>
<ul>
<li>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11658/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11658/bat-adlp-6/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/bat-adlp-6/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6473 -&gt; IGTPW_7108</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11658: 6e9381cb50fd172bc8adfe2b201344b6166d684b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7108: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7108/index.html<br />
  IGT_6473: 64723cd44c1cd2f8b8263e3b3681c99f05a1b499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 56 lines<br />
--- 672 lines</p>

</body>
</html>

--===============6660383309709196728==--
