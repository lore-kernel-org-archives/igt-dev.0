Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8445187104074825892=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Tue, 17 May 2022 15:53:13 -0000
Message-ID: <165280279300.31031.15434677386713179753@emeril.freedesktop.org>
References: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_IGT_test_cleanup_=28rev3=29?=
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

--===============8445187104074825892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: IGT test cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/104029/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11664 -> IGTPW_7120
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7120 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7120, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html

Participating hosts (41 -> 42)
------------------------------

  Additional (1): bat-dg2-8 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7120:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-modeset@a-dp2:
    - fi-skl-guc:         [PASS][1] -> [DMESG-WARN][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-skl-guc/igt@kms_flip@basic-flip-vs-modeset@a-dp2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-skl-guc/igt@kms_flip@basic-flip-vs-modeset@a-dp2.html

  * {igt@kms_pipe_crc_basic@hang-read-crc} (NEW):
    - bat-dg1-5:          NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-dg1-5/igt@kms_pipe_crc_basic@hang-read-crc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor}:
    - {bat-adln-1}:       NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * {igt@kms_cursor_legacy@basic-flip-after-cursor}:
    - bat-dg1-5:          NOTRUN -> [SKIP][6] +6 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-dg1-5/igt@kms_cursor_legacy@basic-flip-after-cursor.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11664 and IGTPW_7120:

### New IGT tests (225) ###

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.00, 2.25] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.00, 2.34] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - Statuses : 8 pass(s) 4 skip(s)
    - Exec time: [0.00, 2.29] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:
    - Statuses : 12 pass(s)
    - Exec time: [0.93, 1.43] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:
    - Statuses : 12 pass(s)
    - Exec time: [0.94, 2.25] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:
    - Statuses : 12 pass(s)
    - Exec time: [0.94, 2.24] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.43] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.72] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.51, 0.99] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.32, 0.44] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 0.56] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.26, 0.35] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.40] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.28, 0.41] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.85, 0.99] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.30, 1.92] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.28, 0.34] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.28, 0.56] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.26, 0.44] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 0.41] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.85, 1.00] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.32, 1.64] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.28, 0.34] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.27, 0.55] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.26] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.43] s

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.53] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.81] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.58, 1.12] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.41, 0.53] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 0.64] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.48] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.47] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.37, 0.48] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.05] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.36, 2.02] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.50] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.36, 0.62] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 0.54] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.51] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 1.07] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.33, 1.80] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.37, 0.44] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 0.67] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.37] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.49] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.88] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.62, 1.18] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.48, 0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 0.71] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.44, 0.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.03, 1.14] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.43, 2.04] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.44, 0.72] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.42, 0.63] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.04, 1.15] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.39, 1.92] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.44, 0.69] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.44] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.60] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.85] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.62, 1.22] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.48, 0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 0.70] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.44, 0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.04, 1.10] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.42, 2.09] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.44, 0.70] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.42, 0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.02, 1.18] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.40, 1.87] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.43, 0.70] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.44] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.56] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.85] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.59, 1.11] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.41, 0.55] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 0.65] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.48] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.48] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.37, 0.48] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.07] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.36, 2.03] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.51] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.37, 0.67] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.35, 0.55] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.51] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 1.17] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.33, 1.82] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.37, 0.44] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 0.65] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.37] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.49] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.83] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [0.58, 1.14] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.41, 0.53] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 0.68] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.46] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.37, 0.48] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 1.05] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.37, 2.03] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.51] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.36, 0.66] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 0.55] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.51] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.10] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.34, 1.80] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.37, 0.44] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 0.65] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.37] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.52] s

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.92, 4.85] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [2.73, 17.74] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.60, 12.91] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [1.85, 4.54] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.60] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.55, 2.66] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.04] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [1.76, 2.60] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.26, 5.07] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [3.41, 18.96] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.54, 11.33] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.77, 4.17] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.85, 2.57] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dsi-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.36, 4.88] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [3.39, 18.97] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.58, 11.27] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [1.76, 3.96] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.09] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [19.02] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  

Known issues
------------

  Here are the changes found in IGTPW_7120 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-bdw-5557u:       [PASS][7] -> [INCOMPLETE][8] ([i915#5502] / [i915#5801])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-11600:       [PASS][9] -> [DMESG-FAIL][10] ([i915#2373])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-rkl-11600/igt@i915_selftest@live@gt_lrc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-rkl-11600/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [PASS][11] -> [DMESG-FAIL][12] ([i915#4494] / [i915#4957])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-pnv-d510:        NOTRUN -> [SKIP][13] ([fdo#109271]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][14] ([fdo#111827])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-snb-2600:        NOTRUN -> [SKIP][15] ([fdo#109271] / [fdo#111827])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][16] ([fdo#109271]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-elk-e7500/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][17] ([fdo#109271]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][18] ([fdo#109271]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * {igt@kms_cursor_legacy@basic-flip-before-cursor} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][19] ([fdo#109271]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-before-cursor.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-bdw-gvtdvm/igt@kms_cursor_legacy@basic-flip-before-cursor.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][21] ([fdo#109271]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-bsw-nick/igt@kms_cursor_legacy@basic-flip-before-cursor.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][22] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:
    - fi-skl-guc:         [PASS][23] -> [DMESG-WARN][24] ([i915#118])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2.html

  * {igt@kms_pipe_crc_basic@hang-read-crc} (NEW):
    - {bat-dg2-8}:        NOTRUN -> [SKIP][25] ([i915#5354]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc.html

  * {igt@kms_pipe_crc_basic@suspend-read-crc} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][26] ([fdo#109271]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         [INCOMPLETE][27] ([i915#4983]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][29] ([i915#3921]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][31] ([i915#4528]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-pnv-d510/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5502]: https://gitlab.freedesktop.org/drm/intel/issues/5502
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5801]: https://gitlab.freedesktop.org/drm/intel/issues/5801
  [i915#5879]: https://gitlab.freedesktop.org/drm/intel/issues/5879
  [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
  [i915#5886]: https://gitlab.freedesktop.org/drm/intel/issues/5886
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6476 -> IGTPW_7120

  CI-20190529: 20190529
  CI_DRM_11664: ff658f5f8e7e427556a8e6f1adc0e4519527ca95 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7120: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html
  IGT_6476: 08aa9296163b94cf4c529fc890ae3e90e21c3cdb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 56 lines
--- 672 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html

--===============8445187104074825892==
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
<tr><td><b>Series:</b></td><td>tests/kms: IGT test cleanup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104029/">https://patchwork.freedesktop.org/series/104029/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11664 -&gt; IGTPW_7120</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7120 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7120, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html</p>
<h2>Participating hosts (41 -&gt; 42)</h2>
<p>Additional (1): bat-dg2-8 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7120:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp2:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-skl-guc/igt@kms_flip@basic-flip-vs-modeset@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-skl-guc/igt@kms_flip@basic-flip-vs-modeset@a-dp2.html">DMESG-WARN</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@hang-read-crc} (NEW):</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-dg1-5/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor}:</p>
<ul>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-flip-after-cursor}:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-dg1-5/igt@kms_cursor_legacy@basic-flip-after-cursor.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11664 and IGTPW_7120:</p>
<h3>New IGT tests (225)</h3>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.00, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.00, 2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 8 pass(s) 4 skip(s)</li>
<li>Exec time: [0.00, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.93, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.94, 2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.94, 2.24] s</li>
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
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.51, 0.99] s</li>
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
<li>Exec time: [0.36, 0.56] s</li>
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
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.26, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.28, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.85, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.30, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.28, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.28, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.26, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.85, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.32, 1.64] s</li>
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
<li>Exec time: [0.27, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.58, 1.12] s</li>
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
<li>Exec time: [0.46, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.37, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.97, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.36, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.36, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.36, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.98, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.33, 1.80] s</li>
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
<li>Exec time: [0.36, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
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
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.62, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.48, 0.61] s</li>
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
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.44, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.44, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.03, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.43, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.44, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.44, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.42, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.04, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.39, 1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.44, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.44, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.62, 1.22] s</li>
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
<li>Exec time: [0.53, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.44, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.44, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.04, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.42, 2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.44, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.44, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.42, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.02, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.40, 1.87] s</li>
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
<li>Exec time: [0.43, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.59, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.41, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.46, 0.65] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.37, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
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
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.36, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.37, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.35, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.98, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
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
<li>Exec time: [0.36, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.58, 1.14] s</li>
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
<li>Exec time: [0.46, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.37, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.98, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.37, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.36, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.36, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.97, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.34, 1.80] s</li>
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
<li>Exec time: [0.36, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.37] s</li>
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
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
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
<li>Exec time: [0.39, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Exec time: [2.92, 4.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.73, 17.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.60, 12.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.85, 4.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.55, 2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.76, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.26, 5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.41, 18.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.54, 11.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.77, 4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.85, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.36, 4.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [3.39, 18.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.58, 11.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.76, 3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [19.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7120 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5502">i915#5502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5801">i915#5801</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-rkl-11600/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-rkl-11600/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-elk-e7500/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions} (NEW):</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-flip-before-cursor} (NEW):</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-kbl-7567u/igt@kms_cursor_legacy@basic-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-bdw-gvtdvm/igt@kms_cursor_legacy@basic-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-bsw-nick/igt@kms_cursor_legacy@basic-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-kbl-guc/igt@kms_cursor_legacy@basic-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@hang-read-crc} (NEW):</p>
<ul>
<li>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@suspend-read-crc} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6476 -&gt; IGTPW_7120</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11664: ff658f5f8e7e427556a8e6f1adc0e4519527ca95 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7120: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html<br />
  IGT_6476: 08aa9296163b94cf4c529fc890ae3e90e21c3cdb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 56 lines<br />
--- 672 lines</p>

</body>
</html>

--===============8445187104074825892==--
