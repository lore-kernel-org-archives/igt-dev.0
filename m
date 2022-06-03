Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6184910295843725527=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 03 Jun 2022 14:02:52 -0000
Message-ID: <165426497217.17721.13476962659092278490@emeril.freedesktop.org>
References: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_IGT_test_cleanup_=28rev5=29?=
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

--===============6184910295843725527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: IGT test cleanup (rev5)
URL   : https://patchwork.freedesktop.org/series/104029/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11726 -> IGTPW_7224
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7224 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7224, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/index.html

Participating hosts (43 -> 44)
------------------------------

  Additional (3): bat-adln-1 fi-kbl-x1275 bat-atsm-1 
  Missing    (2): bat-dg2-8 bat-adlp-4 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7224:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_legacy@basic-flip-before-cursor} (NEW):
    - {bat-adln-1}:       NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-adln-1/igt@kms_cursor_legacy@basic-flip-before-cursor.html
    - {bat-atsm-1}:       NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-before-cursor.html

  * {igt@kms_pipe_crc_basic@hang-read-crc} (NEW):
    - {bat-atsm-1}:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-atsm-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg1-5:          NOTRUN -> [SKIP][4] +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-dg1-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - {bat-atsm-1}:       NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-atsm-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-adln-1}:       NOTRUN -> [SKIP][7] +17 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - {bat-atsm-1}:       NOTRUN -> [SKIP][8] +4 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11726 and IGTPW_7224:

### New IGT tests (177) ###

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:
    - Statuses : 9 pass(s) 3 skip(s)
    - Exec time: [0.00, 2.20] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - Statuses : 9 pass(s) 3 skip(s)
    - Exec time: [0.00, 2.29] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - Statuses : 9 pass(s) 3 skip(s)
    - Exec time: [0.00, 2.28] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:
    - Statuses : 12 pass(s)
    - Exec time: [0.93, 1.41] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:
    - Statuses : 12 pass(s)
    - Exec time: [0.94, 2.20] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:
    - Statuses : 12 pass(s)
    - Exec time: [0.94, 2.29] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor:
    - Statuses : 1 fail(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.33, 0.44] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.34, 0.69] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.51, 2.76] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.32, 0.43] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.35, 0.55] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.26, 0.37] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.30, 0.43] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.28, 0.36] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.81, 1.00] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.28, 2.44] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.27, 0.39] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.29, 0.52] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.26, 0.45] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.31, 0.44] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.81, 0.99] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.27, 2.43] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.28, 0.35] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.28, 0.57] s

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
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 2.44] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.41] s

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.43, 0.52] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.46, 0.83] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.59, 2.86] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.41, 0.53] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 0.68] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.36, 0.47] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 0.48] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.37, 0.45] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.94, 1.09] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.35, 2.50] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.49] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.37, 0.66] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.35, 0.56] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 0.50] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.94, 1.12] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.35, 2.48] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.37, 0.44] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 0.66] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.36, 0.37] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 2.50] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 0.49] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.50, 0.59] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.52, 0.84] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.63, 2.95] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.48, 0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 0.74] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.43, 0.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.0, 1.20] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.43, 2.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.43, 0.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.43, 0.74] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.42, 0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.59] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.00, 1.15] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.40, 2.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.43, 0.65] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.42, 0.45] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.53, 2.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.50, 0.58] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.53, 0.88] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.62, 2.89] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.48, 0.61] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.53, 0.70] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.44, 0.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.00, 1.11] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.42, 2.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.44, 0.69] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.42, 0.62] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.00, 1.14] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.40, 2.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.43, 0.74] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.42, 0.45] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.54, 2.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.56] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.79] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.59, 2.87] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.41, 0.54] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 0.66] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.50] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 0.47] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.37, 0.45] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.94, 1.08] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.36, 2.55] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.49] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.36, 0.66] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.35, 0.54] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.41, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.94, 1.09] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.35, 2.49] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.37, 0.44] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.37, 0.64] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.36, 0.38] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.48, 2.50] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.51] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.43, 0.51] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.47, 0.83] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [0.58, 2.87] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.41, 0.54] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.46, 0.67] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.48] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 0.46] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.37, 0.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.94, 1.14] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:
    - Statuses : 9 pass(s)
    - Exec time: [1.37, 2.56] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-1:
    - Statuses : 7 pass(s)
    - Exec time: [0.37, 0.51] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-2:
    - Statuses : 4 pass(s)
    - Exec time: [0.36, 0.61] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.35, 0.54] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 0.52] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.93, 1.12] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.33, 2.51] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.37, 0.44] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [0.37, 0.69] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.35, 0.38] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 2.55] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.51] s

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.57, 2.73] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [3.02, 5.17] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [2.74, 17.74] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.62, 12.23] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [1.88, 3.88] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.61] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - Statuses : 5 pass(s)
    - Exec time: [1.48, 1.99] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.51, 2.09] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:
    - Statuses : 3 pass(s)
    - Exec time: [1.79, 2.61] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [3.40, 5.46] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
    - Statuses : 6 pass(s)
    - Exec time: [3.41, 18.96] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.48, 11.32] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.78, 3.74] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.49, 1.88] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.53, 2.73] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dsi-1:
    - Statuses : 3 pass(s)
    - Exec time: [3.40, 5.24] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
    - Statuses : 5 pass(s)
    - Exec time: [3.45, 18.99] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.54, 11.26] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [1.78, 3.68] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.49, 1.85] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.84] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [19.01] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  

Known issues
------------

  Here are the changes found in IGTPW_7224 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#2190])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-8109u:       [PASS][11] -> [DMESG-FAIL][12] ([i915#5334])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][13] -> [DMESG-FAIL][14] ([i915#4528])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][15] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-x1275/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][16] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][17] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-glk-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][18] ([fdo#109271]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-tgl-u2:          NOTRUN -> [SKIP][19] ([i915#4103])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-bxt-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][21] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][22] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-skl-6700k2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][23] ([i915#4103])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][24] ([i915#4103])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][25] ([i915#4103])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-adl-ddr5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][26] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][27] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][28] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][29] ([i915#4103])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-skl-guc:         NOTRUN -> [SKIP][30] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][31] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - bat-dg1-6:          NOTRUN -> [SKIP][32] ([i915#4103])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][33] ([fdo#109271]) +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][34] ([fdo#109271]) +9 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor@atomic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][35] ([fdo#109271]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size:
    - fi-elk-e7500:       NOTRUN -> [SKIP][36] ([fdo#109271]) +8 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][37] ([fdo#109271]) +6 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][38] ([fdo#109271]) +9 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        NOTRUN -> [SKIP][39] ([fdo#109271]) +9 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][40] ([fdo#109271]) +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@prime_vgem@basic-userptr:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][41] ([fdo#109271]) +11 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-x1275/igt@prime_vgem@basic-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6092]: https://gitlab.freedesktop.org/drm/intel/issues/6092
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6099]: https://gitlab.freedesktop.org/drm/intel/issues/6099
  [i915#6133]: https://gitlab.freedesktop.org/drm/intel/issues/6133
  [i915#6134]: https://gitlab.freedesktop.org/drm/intel/issues/6134
  [i915#6136]: https://gitlab.freedesktop.org/drm/intel/issues/6136
  [i915#6137]: https://gitlab.freedesktop.org/drm/intel/issues/6137
  [i915#6138]: https://gitlab.freedesktop.org/drm/intel/issues/6138
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6505 -> IGTPW_7224

  CI-20190529: 20190529
  CI_DRM_11726: 74ea63ad8ffc71b8345436147517253dcabd4793 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7224: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/index.html
  IGT_6505: edb1a467fb622b23b927e28ff603fa43851fea97 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 56 lines
--- 672 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/index.html

--===============6184910295843725527==
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
<tr><td><b>Series:</b></td><td>tests/kms: IGT test cleanup (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104029/">https://patchwork.freedesktop.org/series/104029/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11726 -&gt; IGTPW_7224</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7224 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7224, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/index.html</p>
<h2>Participating hosts (43 -&gt; 44)</h2>
<p>Additional (3): bat-adln-1 fi-kbl-x1275 bat-atsm-1 <br />
  Missing    (2): bat-dg2-8 bat-adlp-4 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7224:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_legacy@basic-flip-before-cursor} (NEW):</p>
<ul>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-adln-1/igt@kms_cursor_legacy@basic-flip-before-cursor.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-before-cursor.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@hang-read-crc} (NEW):</p>
<ul>
<li>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-atsm-1/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-dg1-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>
<p>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-atsm-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-atsm-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11726 and IGTPW_7224:</p>
<h3>New IGT tests (177)</h3>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:</p>
<ul>
<li>Statuses : 9 pass(s) 3 skip(s)</li>
<li>Exec time: [0.00, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>Statuses : 9 pass(s) 3 skip(s)</li>
<li>Exec time: [0.00, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 9 pass(s) 3 skip(s)</li>
<li>Exec time: [0.00, 2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.93, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.94, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.94, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor:</p>
<ul>
<li>Statuses : 1 fail(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.33, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.34, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.51, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.32, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.35, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
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
<li>Exec time: [0.30, 0.43] s</li>
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
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.81, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.28, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.27, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.29, 0.52] s</li>
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
<li>Exec time: [0.31, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.81, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.27, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.28, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.28, 0.57] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.43, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.46, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.59, 2.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.41, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.46, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.36, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.40, 0.48] s</li>
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
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.94, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.35, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.37, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.35, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.40, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.94, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.35, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.37, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.36, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.36, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.50, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.52, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.63, 2.95] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.53, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.43, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.47, 0.53] s</li>
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
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.0, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.43, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.43, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.43, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.42, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.47, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.00, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.40, 2.56] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.43, 0.65] s</li>
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
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.53, 2.56] s</li>
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
<li>Exec time: [0.50, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.53, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.62, 2.89] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.53, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.44, 0.55] s</li>
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
<li>Exec time: [0.44, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.00, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.42, 2.55] s</li>
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
<li>Exec time: [0.44, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.42, 0.62] s</li>
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
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.00, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.40, 2.56] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.43, 0.74] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.54, 2.56] s</li>
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
<li>Exec time: [0.44, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.47, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.59, 2.87] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.46, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.40, 0.47] s</li>
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
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.94, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.36, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.36, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.35, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.41, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.94, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.35, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.37, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.37, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.36, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.48, 2.50] s</li>
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
<li>Exec time: [0.43, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.47, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.58, 2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.41, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.46, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.37, 0.48] s</li>
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
<li>Exec time: [0.37, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.94, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.37, 2.56] s</li>
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
<li>Exec time: [0.36, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.35, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.40, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.93, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.33, 2.51] s</li>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.37, 0.69] s</li>
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
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 2.55] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.57, 2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.02, 5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.74, 17.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.62, 12.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.88, 3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.48, 1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.51, 2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.79, 2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.40, 5.46] s</li>
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
<li>Exec time: [1.48, 11.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.78, 3.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.49, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.53, 2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dsi-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.40, 5.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [3.45, 18.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.54, 11.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.78, 3.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.49, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dsi-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [19.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7224 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11726/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-x1275/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-cfl-8700k/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-glk-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-bxt-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-skl-6700k2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-adl-ddr5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-skl-6600u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-skl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size} (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-blb-e6850/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor@atomic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-pnv-d510/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-elk-e7500/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/fi-kbl-x1275/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6505 -&gt; IGTPW_7224</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11726: 74ea63ad8ffc71b8345436147517253dcabd4793 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7224: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7224/index.html<br />
  IGT_6505: edb1a467fb622b23b927e28ff603fa43851fea97 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 56 lines<br />
--- 672 lines</p>

</body>
</html>

--===============6184910295843725527==--
