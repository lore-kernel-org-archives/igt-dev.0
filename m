Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 May 2021 11:52:07 -0000
Message-ID: <162125232710.27268.4485503273962021632@emeril.freedesktop.org>
References: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Flease=3A_Add_subtest_description_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0964450828=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0964450828==
Content-Type: multipart/alternative;
 boundary="===============2506507050864391303=="

--===============2506507050864391303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_lease: Add subtest description (rev3)
URL   : https://patchwork.freedesktop.org/series/89869/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10090 -> IGTPW_5815
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5815:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@execlists:
    - {fi-rkl-11500t}:    NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-rkl-11500t/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_5815 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-await@bcs0:
    - fi-bsw-n3050:       [PASS][2] -> [FAIL][3] ([i915#3457]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html

  * igt@gem_exec_fence@nb-await@rcs0:
    - fi-bsw-nick:        [PASS][4] -> [FAIL][5] ([i915#3457]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-nick/igt@gem_exec_fence@nb-await@rcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-nick/igt@gem_exec_fence@nb-await@rcs0.html

  * igt@gem_exec_fence@nb-await@vecs0:
    - fi-glk-dsi:         [PASS][6] -> [FAIL][7] ([i915#3457]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-glk-dsi/igt@gem_exec_fence@nb-await@vecs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-glk-dsi/igt@gem_exec_fence@nb-await@vecs0.html
    - fi-bsw-kefka:       [PASS][8] -> [FAIL][9] ([i915#3457]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][10] -> [INCOMPLETE][11] ([i915#2782])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic@modeset:
    - fi-ilk-650:         [PASS][12] -> [INCOMPLETE][13] ([i915#3457])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-ilk-650/igt@kms_busy@basic@modeset.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-ilk-650/igt@kms_busy@basic@modeset.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-kbl-7500u:       NOTRUN -> [FAIL][14] ([i915#1161])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-bwr-2160:        [PASS][15] -> [FAIL][16] ([i915#53])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bwr-2160/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bwr-2160/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - fi-elk-e7500:       [PASS][17] -> [FAIL][18] ([i915#53])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-elk-e7500/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-elk-e7500/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@nb-await@bcs0:
    - fi-bsw-nick:        [FAIL][19] ([i915#3457]) -> [PASS][20] +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html
    - fi-bsw-n3050:       [FAIL][21] ([i915#3457]) -> [PASS][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-n3050/igt@gem_exec_fence@nb-await@bcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-n3050/igt@gem_exec_fence@nb-await@bcs0.html

  * igt@gem_exec_fence@nb-await@rcs0:
    - fi-glk-dsi:         [FAIL][23] ([i915#3457]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-glk-dsi/igt@gem_exec_fence@nb-await@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-glk-dsi/igt@gem_exec_fence@nb-await@rcs0.html

  * igt@gem_exec_fence@nb-await@vcs0:
    - fi-bsw-kefka:       [FAIL][25] ([i915#3457]) -> [PASS][26] +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vcs0.html

  * igt@gem_wait@busy@all:
    - fi-bsw-nick:        [FAIL][27] ([i915#3177] / [i915#3457]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-nick/igt@gem_wait@busy@all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-nick/igt@gem_wait@busy@all.html

  * igt@gem_wait@wait@all:
    - fi-bwr-2160:        [FAIL][29] ([i915#3457]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bwr-2160/igt@gem_wait@wait@all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bwr-2160/igt@gem_wait@wait@all.html
    - fi-elk-e7500:       [FAIL][31] ([i915#3457]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-elk-e7500/igt@gem_wait@wait@all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-elk-e7500/igt@gem_wait@wait@all.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-kbl-7500u:       [{ABORT}][33] ([i915#1814]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-kbl-7500u/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-kbl-7500u/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:
    - fi-bwr-2160:        [FAIL][35] ([i915#53]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bwr-2160/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bwr-2160/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - fi-pnv-d510:        [FAIL][37] ([i915#53]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-pnv-d510/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-pnv-d510/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
    - fi-ilk-650:         [FAIL][39] ([i915#53]) -> [PASS][40] +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-elk-e7500:       [FAIL][41] ([i915#53]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  
#### Warnings ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][43] ([i915#3472]) -> [FAIL][44] ([i915#3457] / [i915#3472])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
    - fi-ilk-650:         [FAIL][45] ([i915#3472]) -> [FAIL][46] ([i915#3457] / [i915#3472])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-ilk-650/igt@gem_exec_gttfill@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-ilk-650/igt@gem_exec_gttfill@basic.html

  * igt@i915_module_load@reload:
    - fi-bsw-kefka:       [DMESG-WARN][47] ([i915#1982] / [i915#3457]) -> [DMESG-FAIL][48] ([i915#1982] / [i915#3457])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-kefka/igt@i915_module_load@reload.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-kefka/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [DMESG-FAIL][49] -> [INCOMPLETE][50] ([i915#2782] / [i915#2940])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-nick/igt@i915_selftest@live@execlists.html
    - fi-icl-u2:          [INCOMPLETE][51] ([i915#2782] / [i915#3462]) -> [DMESG-FAIL][52] ([i915#3462])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-icl-u2/igt@i915_selftest@live@execlists.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-icl-u2/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@mman:
    - fi-bwr-2160:        [DMESG-FAIL][53] ([i915#3457]) -> [DMESG-WARN][54] ([i915#3457])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bwr-2160/igt@i915_selftest@live@mman.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bwr-2160/igt@i915_selftest@live@mman.html
    - fi-pnv-d510:        [DMESG-FAIL][55] ([i915#3457]) -> [DMESG-WARN][56] ([i915#3457])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-pnv-d510/igt@i915_selftest@live@mman.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-pnv-d510/igt@i915_selftest@live@mman.html

  * igt@runner@aborted:
    - fi-cfl-8700k:       [FAIL][57] ([i915#2426] / [i915#3363]) -> [FAIL][58] ([i915#3363])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-cfl-8700k/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-cfl-8700k/igt@runner@aborted.html
    - fi-icl-u2:          [FAIL][59] ([i915#2782] / [i915#3363]) -> [FAIL][60] ([i915#2426] / [i915#2782] / [i915#3363])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-icl-u2/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-icl-u2/igt@runner@aborted.html
    - fi-kbl-r:           [FAIL][61] ([i915#1436] / [i915#3363]) -> [FAIL][62] ([i915#1569] / [i915#192] / [i915#193] / [i915#194] / [i915#3363])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-kbl-r/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-kbl-r/igt@runner@aborted.html
    - fi-kbl-7500u:       [FAIL][63] ([i915#3363]) -> [FAIL][64] ([i915#1814] / [i915#3363])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-kbl-7500u/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-kbl-7500u/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][65] ([i915#2426] / [i915#3363]) -> [FAIL][66] ([i915#3363])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-cfl-guc/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-cfl-guc/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1222]: https://gitlab.freedesktop.org/drm/intel/issues/1222
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1569]: https://gitlab.freedesktop.org/drm/intel/issues/1569
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#192]: https://gitlab.freedesktop.org/drm/intel/issues/192
  [i915#193]: https://gitlab.freedesktop.org/drm/intel/issues/193
  [i915#194]: https://gitlab.freedesktop.org/drm/intel/issues/194
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2932]: https://gitlab.freedesktop.org/drm/intel/issues/2932
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#2966]: https://gitlab.freedesktop.org/drm/intel/issues/2966
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3177]: https://gitlab.freedesktop.org/drm/intel/issues/3177
  [i915#3180]: https://gitlab.freedesktop.org/drm/intel/issues/3180
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3457]: https://gitlab.freedesktop.org/drm/intel/issues/3457
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#3468]: https://gitlab.freedesktop.org/drm/intel/issues/3468
  [i915#3472]: https://gitlab.freedesktop.org/drm/intel/issues/3472
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (43 -> 38)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6084 -> IGTPW_5815

  CI-20190529: 20190529
  CI_DRM_10090: e28f8dd2a3f0981ebaad3056674553da7718da81 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5815: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/index.html
  IGT_6084: 5c5734d8ee1afac871b69c4554ff14e9b56100e4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/index.html

--===============2506507050864391303==
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
<tr><td><b>Series:</b></td><td>tests/kms_lease: Add subtest description (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89869/">https://patchwork.freedesktop.org/series/89869/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10090 -&gt; IGTPW_5815</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5815:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>{fi-rkl-11500t}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-rkl-11500t/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5815 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-nick/igt@gem_exec_fence@nb-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-nick/igt@gem_exec_fence@nb-await@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-glk-dsi/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-glk-dsi/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-ilk-650/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-ilk-650/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bwr-2160/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bwr-2160/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-elk-e7500/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-elk-e7500/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@nb-await@bcs0:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-nick/igt@gem_exec_fence@nb-await@bcs0.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-n3050/igt@gem_exec_fence@nb-await@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-n3050/igt@gem_exec_fence@nb-await@bcs0.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-glk-dsi/igt@gem_exec_fence@nb-await@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-glk-dsi/igt@gem_exec_fence@nb-await@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-nick/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-nick/igt@gem_wait@busy@all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bwr-2160/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bwr-2160/igt@gem_wait@wait@all.html">PASS</a></p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-elk-e7500/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-elk-e7500/igt@gem_wait@wait@all.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-kbl-7500u/igt@kms_addfb_basic@addfb25-bad-modifier.html">{ABORT}</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-kbl-7500u/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bwr-2160/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bwr-2160/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-pnv-d510/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-pnv-d510/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-kefka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-kefka/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bsw-nick/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-icl-u2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-icl-u2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-bwr-2160/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-bwr-2160/igt@i915_selftest@live@mman.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-pnv-d510/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-pnv-d510/igt@i915_selftest@live@mman.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1569">i915#1569</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/192">i915#192</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/193">i915#193</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/194">i915#194</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10090/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6084 -&gt; IGTPW_5815</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10090: e28f8dd2a3f0981ebaad3056674553da7718da81 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5815: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5815/index.html<br />
  IGT_6084: 5c5734d8ee1afac871b69c4554ff14e9b56100e4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============2506507050864391303==--

--===============0964450828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0964450828==--
