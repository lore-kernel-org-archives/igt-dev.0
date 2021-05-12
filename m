Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 12 May 2021 09:13:37 -0000
Message-ID: <162081081762.28503.8175309906232746470@emeril.freedesktop.org>
References: <20210507130714.2261738-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210507130714.2261738-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fmmap=5Fwrite=5Fcrc=3A_Add_subtest_description_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0983091168=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0983091168==
Content-Type: multipart/alternative;
 boundary="===============3613854726676790942=="

--===============3613854726676790942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_mmap_write_crc: Add subtest description (rev2)
URL   : https://patchwork.freedesktop.org/series/89870/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6083 -> IGTPW_5805
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5805 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5805, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5805:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - fi-elk-e7500:       [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - fi-bsw-kefka:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  
#### Warnings ####

  * igt@gem_exec_gttfill@basic:
    - fi-elk-e7500:       [FAIL][5] ([i915#3457]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-elk-e7500/igt@gem_exec_gttfill@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-elk-e7500/igt@gem_exec_gttfill@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5805 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-await@bcs0:
    - fi-bsw-kefka:       [PASS][7] -> [FAIL][8] ([i915#3457])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-kefka/igt@gem_exec_fence@basic-await@bcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-kefka/igt@gem_exec_fence@basic-await@bcs0.html

  * igt@gem_exec_fence@nb-await@vecs0:
    - fi-bsw-n3050:       [PASS][9] -> [FAIL][10] ([i915#3457]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html

  * igt@gem_wait@busy@all:
    - fi-bsw-kefka:       [PASS][11] -> [FAIL][12] ([i915#3177] / [i915#3457])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-kefka/igt@gem_wait@busy@all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-kefka/igt@gem_wait@busy@all.html

  * igt@gem_wait@wait@all:
    - fi-bwr-2160:        [PASS][13] -> [FAIL][14] ([i915#3457])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bwr-2160/igt@gem_wait@wait@all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bwr-2160/igt@gem_wait@wait@all.html
    - fi-pnv-d510:        [PASS][15] -> [FAIL][16] ([i915#3457])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-pnv-d510/igt@gem_wait@wait@all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-pnv-d510/igt@gem_wait@wait@all.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][17] -> [INCOMPLETE][18] ([i915#2782])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic@modeset:
    - fi-ilk-650:         [PASS][19] -> [INCOMPLETE][20] ([i915#3457])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-ilk-650/igt@kms_busy@basic@modeset.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-ilk-650/igt@kms_busy@basic@modeset.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-await@vcs0:
    - fi-bsw-n3050:       [FAIL][21] ([i915#3457]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@gem_exec_fence@nb-await@vcs0:
    - fi-bsw-nick:        [FAIL][23] ([i915#3457]) -> [PASS][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html

  * igt@gem_exec_fence@nb-await@vecs0:
    - fi-bsw-kefka:       [FAIL][25] ([i915#3457]) -> [PASS][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html

  * igt@gem_wait@busy@all:
    - fi-bwr-2160:        [FAIL][27] ([i915#3457]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bwr-2160/igt@gem_wait@busy@all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bwr-2160/igt@gem_wait@busy@all.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-elk-e7500:       [FAIL][29] -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
    - fi-ilk-650:         [FAIL][31] -> [PASS][32] +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-bsw-kefka:       [FAIL][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-kefka/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-kefka/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Warnings ####

  * igt@gem_exec_gttfill@basic:
    - fi-apl-guc:         [FAIL][35] ([i915#3457]) -> [DMESG-FAIL][36] ([i915#1610] / [i915#3457])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-apl-guc/igt@gem_exec_gttfill@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-apl-guc/igt@gem_exec_gttfill@basic.html
    - fi-ilk-650:         [FAIL][37] -> [FAIL][38] ([i915#3457])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-ilk-650/igt@gem_exec_gttfill@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-ilk-650/igt@gem_exec_gttfill@basic.html

  * igt@i915_module_load@reload:
    - fi-cml-s:           [DMESG-WARN][39] ([i915#3457]) -> [DMESG-WARN][40] ([i915#1982] / [i915#3457])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-cml-s/igt@i915_module_load@reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-cml-s/igt@i915_module_load@reload.html
    - fi-elk-e7500:       [DMESG-WARN][41] ([i915#3457]) -> [DMESG-FAIL][42] ([i915#3457])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-elk-e7500/igt@i915_module_load@reload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-elk-e7500/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-icl-u2:          [DMESG-FAIL][43] ([i915#3462]) -> [INCOMPLETE][44] ([i915#2782] / [i915#3462])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-icl-u2/igt@i915_selftest@live@execlists.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-icl-u2/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@mman:
    - fi-bwr-2160:        [DMESG-WARN][45] ([i915#3457]) -> [DMESG-FAIL][46] ([i915#3457])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bwr-2160/igt@i915_selftest@live@mman.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bwr-2160/igt@i915_selftest@live@mman.html
    - fi-pnv-d510:        [DMESG-WARN][47] ([i915#3457]) -> [DMESG-FAIL][48] ([i915#3457])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-pnv-d510/igt@i915_selftest@live@mman.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-pnv-d510/igt@i915_selftest@live@mman.html

  * igt@runner@aborted:
    - fi-kbl-x1275:       [FAIL][49] ([i915#1436] / [i915#3363]) -> [FAIL][50] ([i915#1436] / [i915#2426] / [i915#3363])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-kbl-x1275/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-kbl-x1275/igt@runner@aborted.html
    - fi-icl-u2:          [FAIL][51] ([i915#2426] / [i915#2782] / [i915#3363]) -> [FAIL][52] ([i915#2782] / [i915#3363])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-icl-u2/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-icl-u2/igt@runner@aborted.html
    - fi-glk-dsi:         [FAIL][53] ([i915#3363] / [k.org#202321]) -> [FAIL][54] ([i915#2426] / [i915#3363] / [k.org#202321])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-glk-dsi/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-glk-dsi/igt@runner@aborted.html
    - fi-apl-guc:         [FAIL][55] ([i915#2426] / [i915#3363]) -> [FAIL][56] ([i915#1186] / [i915#2426] / [i915#3363])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-apl-guc/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-apl-guc/igt@runner@aborted.html
    - fi-kbl-soraka:      [FAIL][57] ([i915#1436] / [i915#3363]) -> [FAIL][58] ([i915#1436] / [i915#2426] / [i915#3363])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-kbl-soraka/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-kbl-soraka/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][59] ([i915#3363]) -> [FAIL][60] ([i915#2426] / [i915#3363])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-cfl-guc/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-cfl-guc/igt@runner@aborted.html
    - fi-skl-6700k2:      [FAIL][61] ([i915#1436] / [i915#3363]) -> [FAIL][62] ([i915#1436] / [i915#2426] / [i915#3363])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-skl-6700k2/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-skl-6700k2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1186]: https://gitlab.freedesktop.org/drm/intel/issues/1186
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#3177]: https://gitlab.freedesktop.org/drm/intel/issues/3177
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3457]: https://gitlab.freedesktop.org/drm/intel/issues/3457
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (46 -> 41)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6083 -> IGTPW_5805

  CI-20190529: 20190529
  CI_DRM_10071: 77fc6f68ed347b0a4c6969f6adac70026d5b1449 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5805: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/index.html
  IGT_6083: d28aee5c5f528aa6c352c3339f20aaed4d698ffa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/index.html

--===============3613854726676790942==
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
<tr><td><b>Series:</b></td><td>tests/kms_mmap_write_crc: Add subtest description (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89870/">https://patchwork.freedesktop.org/series/89870/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6083 -&gt; IGTPW_5805</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5805 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5805, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5805:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-elk-e7500/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-elk-e7500/igt@gem_exec_gttfill@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5805 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-kefka/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-kefka/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-kefka/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-kefka/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bwr-2160/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bwr-2160/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-pnv-d510/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-pnv-d510/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-ilk-650/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-ilk-650/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bwr-2160/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bwr-2160/igt@gem_wait@busy@all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bsw-kefka/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bsw-kefka/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-apl-guc/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-apl-guc/igt@gem_exec_gttfill@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-cml-s/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-cml-s/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-elk-e7500/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-elk-e7500/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-icl-u2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-icl-u2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-bwr-2160/igt@i915_selftest@live@mman.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-bwr-2160/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-pnv-d510/igt@i915_selftest@live@mman.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-pnv-d510/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-apl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-apl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6083/fi-skl-6700k2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/fi-skl-6700k2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 41)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6083 -&gt; IGTPW_5805</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10071: 77fc6f68ed347b0a4c6969f6adac70026d5b1449 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5805: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5805/index.html<br />
  IGT_6083: d28aee5c5f528aa6c352c3339f20aaed4d698ffa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3613854726676790942==--

--===============0983091168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0983091168==--
