Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 May 2021 17:56:46 -0000
Message-ID: <162136060645.23336.15680094805050497312@emeril.freedesktop.org>
References: <20210518170219.25146-1-jeevan.b@intel.com>
In-Reply-To: <20210518170219.25146-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=5Ftiling=3A_Fix_clean_up_when_subtest_fails?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0290618534=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0290618534==
Content-Type: multipart/alternative;
 boundary="===============3513092604570161207=="

--===============3513092604570161207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip_tiling: Fix clean up when subtest fails
URL   : https://patchwork.freedesktop.org/series/90297/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10098 -> IGTPW_5821
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/index.html

Known issues
------------

  Here are the changes found in IGTPW_5821 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-await@rcs0:
    - fi-bsw-kefka:       [PASS][1] -> [FAIL][2] ([i915#3457])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-kefka/igt@gem_exec_fence@basic-await@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-kefka/igt@gem_exec_fence@basic-await@rcs0.html

  * igt@gem_exec_fence@basic-await@vcs0:
    - fi-bsw-n3050:       [PASS][3] -> [FAIL][4] ([i915#3457]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html
    - fi-bsw-nick:        [PASS][5] -> [FAIL][6] ([i915#3457])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-nick/igt@gem_exec_fence@basic-await@vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-nick/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@gem_exec_fence@basic-await@vecs0:
    - fi-glk-dsi:         [PASS][7] -> [FAIL][8] ([i915#3457])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-glk-dsi/igt@gem_exec_fence@basic-await@vecs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-glk-dsi/igt@gem_exec_fence@basic-await@vecs0.html

  * igt@kms_busy@basic@modeset:
    - fi-ilk-650:         [PASS][9] -> [INCOMPLETE][10] ([i915#3457])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-ilk-650/igt@kms_busy@basic@modeset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-ilk-650/igt@kms_busy@basic@modeset.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-elk-e7500:       [PASS][11] -> [FAIL][12] ([i915#53])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  
#### Possible fixes ####

  * igt@gem_busy@busy@all:
    - fi-bsw-kefka:       [FAIL][13] ([i915#3457]) -> [PASS][14] +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-kefka/igt@gem_busy@busy@all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-kefka/igt@gem_busy@busy@all.html

  * igt@gem_exec_fence@nb-await@vcs0:
    - fi-bsw-nick:        [FAIL][15] ([i915#3457]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html
    - fi-apl-guc:         [FAIL][17] ([i915#3457]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-apl-guc/igt@gem_exec_fence@nb-await@vcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-apl-guc/igt@gem_exec_fence@nb-await@vcs0.html

  * igt@gem_exec_fence@nb-await@vecs0:
    - fi-bsw-n3050:       [FAIL][19] ([i915#3457]) -> [PASS][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html

  * igt@gem_wait@busy@all:
    - fi-bsw-nick:        [FAIL][21] ([i915#3177] / [i915#3457]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-nick/igt@gem_wait@busy@all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-nick/igt@gem_wait@busy@all.html
    - fi-glk-dsi:         [FAIL][23] ([i915#3457]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-glk-dsi/igt@gem_wait@busy@all.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-glk-dsi/igt@gem_wait@busy@all.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
    - fi-ilk-650:         [FAIL][25] ([i915#53]) -> [PASS][26] +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
    - fi-elk-e7500:       [FAIL][27] ([i915#53]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-bsw-kefka:       [FAIL][29] ([i915#53]) -> [PASS][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  
#### Warnings ####

  * igt@gem_exec_gttfill@basic:
    - fi-ilk-650:         [FAIL][31] ([i915#3472]) -> [FAIL][32] ([i915#3457] / [i915#3472])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-ilk-650/igt@gem_exec_gttfill@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-ilk-650/igt@gem_exec_gttfill@basic.html

  * igt@i915_module_load@reload:
    - fi-icl-u2:          [DMESG-WARN][33] ([i915#1982] / [i915#3457]) -> [DMESG-WARN][34] ([i915#3457])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-icl-u2/igt@i915_module_load@reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-icl-u2/igt@i915_module_load@reload.html
    - fi-elk-e7500:       [DMESG-WARN][35] ([i915#3457]) -> [DMESG-FAIL][36] ([i915#3457]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-elk-e7500/igt@i915_module_load@reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-elk-e7500/igt@i915_module_load@reload.html
    - fi-bsw-kefka:       [DMESG-WARN][37] ([i915#1982] / [i915#3457]) -> [DMESG-FAIL][38] ([i915#1982] / [i915#3457])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-kefka/igt@i915_module_load@reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-kefka/igt@i915_module_load@reload.html
    - fi-glk-dsi:         [DMESG-WARN][39] ([i915#3457]) -> [DMESG-FAIL][40] ([i915#3457])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-glk-dsi/igt@i915_module_load@reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-glk-dsi/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-kefka:       [DMESG-FAIL][41] -> [INCOMPLETE][42] ([i915#2782] / [i915#2940])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-kefka/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][43] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][44] ([i915#1436] / [i915#3363])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-skl-6600u/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-skl-6600u/igt@runner@aborted.html
    - fi-glk-dsi:         [FAIL][45] ([i915#2426] / [i915#3363] / [k.org#202321]) -> [FAIL][46] ([i915#3363] / [k.org#202321])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-glk-dsi/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-glk-dsi/igt@runner@aborted.html
    - fi-bdw-5557u:       [FAIL][47] ([i915#3462]) -> [FAIL][48] ([i915#1602] / [i915#2029])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bdw-5557u/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bdw-5557u/igt@runner@aborted.html
    - fi-kbl-7500u:       [FAIL][49] ([i915#1436] / [i915#3363]) -> [FAIL][50] ([i915#1436] / [i915#2426] / [i915#3363])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-kbl-7500u/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-kbl-7500u/igt@runner@aborted.html
    - fi-kbl-7567u:       [FAIL][51] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][52] ([i915#1436] / [i915#3363])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-kbl-7567u/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-kbl-7567u/igt@runner@aborted.html
    - fi-skl-6700k2:      [FAIL][53] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][54] ([i915#1436] / [i915#3363])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-skl-6700k2/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-skl-6700k2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3177]: https://gitlab.freedesktop.org/drm/intel/issues/3177
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3457]: https://gitlab.freedesktop.org/drm/intel/issues/3457
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#3472]: https://gitlab.freedesktop.org/drm/intel/issues/3472
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (45 -> 38)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-skl-guc fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6087 -> IGTPW_5821

  CI-20190529: 20190529
  CI_DRM_10098: b33b0708e50291e2ba399aaf43286278015236e1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5821: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/index.html
  IGT_6087: a1772be7dede83a4f65e5986fd7083a9c8f89083 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/index.html

--===============3513092604570161207==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip_tiling: Fix clean up when subtest fails</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90297/">https://patchwork.freedesktop.org/series/90297/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10098 -&gt; IGTPW_5821</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5821 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-kefka/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-kefka/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-n3050/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-nick/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-nick/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-glk-dsi/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-glk-dsi/igt@gem_exec_fence@basic-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-ilk-650/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-ilk-650/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_busy@busy@all:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-kefka/igt@gem_busy@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-kefka/igt@gem_busy@busy@all.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-nick/igt@gem_exec_fence@nb-await@vcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-apl-guc/igt@gem_exec_fence@nb-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-apl-guc/igt@gem_exec_fence@nb-await@vcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-nick/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-nick/igt@gem_wait@busy@all.html">PASS</a></p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-glk-dsi/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-glk-dsi/igt@gem_wait@busy@all.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:</p>
<ul>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-ilk-650/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">PASS</a> +6 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3472">i915#3472</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-icl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-icl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-elk-e7500/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-elk-e7500/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-kefka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-kefka/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-glk-dsi/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-glk-dsi/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10098/fi-skl-6700k2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/fi-skl-6700k2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (45 -&gt; 38)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-skl-guc fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6087 -&gt; IGTPW_5821</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10098: b33b0708e50291e2ba399aaf43286278015236e1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5821: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5821/index.html<br />
  IGT_6087: a1772be7dede83a4f65e5986fd7083a9c8f89083 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3513092604570161207==--

--===============0290618534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0290618534==--
