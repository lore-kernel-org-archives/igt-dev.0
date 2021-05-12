Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 12 May 2021 07:12:05 -0000
Message-ID: <162080352500.28506.476705152403581297@emeril.freedesktop.org>
References: <20210512063742.185593-1-khaled.almahallawy@intel.com>
In-Reply-To: <20210512063742.185593-1-khaled.almahallawy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Finvalid=5Fdotclock=3A_Test_every_mode?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0246679075=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0246679075==
Content-Type: multipart/alternative;
 boundary="===============8694682526222368122=="

--===============8694682526222368122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_invalid_dotclock: Test every mode
URL   : https://patchwork.freedesktop.org/series/90053/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10071 -> IGTPW_5804
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5804 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5804, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5804:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@coherency:
    - fi-icl-y:           [PASS][1] -> [DMESG-WARN][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-icl-y/igt@i915_selftest@live@coherency.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-icl-y/igt@i915_selftest@live@coherency.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - fi-elk-e7500:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - fi-bsw-kefka:       [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  
#### Warnings ####

  * igt@gem_exec_gttfill@basic:
    - fi-elk-e7500:       [FAIL][7] ([i915#3457]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-elk-e7500/igt@gem_exec_gttfill@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-elk-e7500/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [INCOMPLETE][9] ([i915#2782] / [i915#2940]) -> [DMESG-FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
Known issues
------------

  Here are the changes found in IGTPW_5804 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-await@vecs0:
    - fi-glk-dsi:         [PASS][11] -> [FAIL][12] ([i915#3457])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-glk-dsi/igt@gem_exec_fence@basic-await@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-glk-dsi/igt@gem_exec_fence@basic-await@vecs0.html

  * igt@gem_exec_fence@nb-await@vcs0:
    - fi-bsw-n3050:       [PASS][13] -> [FAIL][14] ([i915#3457])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vcs0.html

  * igt@gem_exec_fence@nb-await@vecs0:
    - fi-bsw-kefka:       [PASS][15] -> [FAIL][16] ([i915#3457]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html

  * igt@gem_wait@busy@all:
    - fi-bwr-2160:        [PASS][17] -> [FAIL][18] ([i915#3457])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bwr-2160/igt@gem_wait@busy@all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bwr-2160/igt@gem_wait@busy@all.html

  * igt@gem_wait@wait@all:
    - fi-bsw-nick:        [PASS][19] -> [FAIL][20] ([i915#3457]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-nick/igt@gem_wait@wait@all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-nick/igt@gem_wait@wait@all.html

  * igt@i915_pm_rpm@module-reload:
    - fi-icl-y:           [PASS][21] -> [FAIL][22] ([i915#579])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-icl-y/igt@i915_pm_rpm@module-reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-icl-y/igt@i915_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-await@rcs0:
    - fi-glk-dsi:         [FAIL][23] ([i915#3457]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-glk-dsi/igt@gem_exec_fence@basic-await@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-glk-dsi/igt@gem_exec_fence@basic-await@rcs0.html

  * igt@gem_exec_fence@nb-await@rcs0:
    - fi-bsw-nick:        [FAIL][25] ([i915#3457]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-nick/igt@gem_exec_fence@nb-await@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-nick/igt@gem_exec_fence@nb-await@rcs0.html

  * igt@gem_wait@busy@all:
    - fi-bsw-kefka:       [FAIL][27] ([i915#3177] / [i915#3457]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-kefka/igt@gem_wait@busy@all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-kefka/igt@gem_wait@busy@all.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:
    - fi-ilk-650:         [FAIL][29] -> [PASS][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
    - fi-elk-e7500:       [FAIL][31] -> [PASS][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-bsw-kefka:       [FAIL][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  
#### Warnings ####

  * igt@gem_exec_gttfill@basic:
    - fi-ilk-650:         [FAIL][35] -> [FAIL][36] ([i915#3457])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-ilk-650/igt@gem_exec_gttfill@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-ilk-650/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live@execlists:
    - fi-cfl-8109u:       [DMESG-FAIL][37] ([i915#3462]) -> [INCOMPLETE][38] ([i915#3462])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
    - fi-icl-u2:          [INCOMPLETE][39] ([i915#2782] / [i915#3462]) -> [DMESG-FAIL][40] ([i915#3462])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-icl-u2/igt@i915_selftest@live@execlists.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-icl-u2/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@mman:
    - fi-bwr-2160:        [DMESG-WARN][41] ([i915#3457]) -> [DMESG-FAIL][42] ([i915#3457])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bwr-2160/igt@i915_selftest@live@mman.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bwr-2160/igt@i915_selftest@live@mman.html

  * igt@runner@aborted:
    - fi-kbl-x1275:       [FAIL][43] ([i915#1436] / [i915#3363]) -> [FAIL][44] ([i915#1436] / [i915#2426] / [i915#3363])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-kbl-x1275/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-kbl-x1275/igt@runner@aborted.html
    - fi-cfl-8109u:       [FAIL][45] ([i915#2426] / [i915#3363]) -> [FAIL][46] ([i915#3363])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-cfl-8109u/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-cfl-8109u/igt@runner@aborted.html
    - fi-icl-u2:          [FAIL][47] ([i915#2782] / [i915#3363]) -> [FAIL][48] ([i915#2426] / [i915#2782] / [i915#3363])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-icl-u2/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-icl-u2/igt@runner@aborted.html
    - fi-cml-s:           [FAIL][49] ([i915#3363]) -> [FAIL][50] ([i915#2082] / [i915#2426] / [i915#3363])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-cml-s/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-cml-s/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][51] ([i915#3363]) -> [FAIL][52] ([i915#2426] / [i915#3363])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-cfl-guc/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-cfl-guc/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2082]: https://gitlab.freedesktop.org/drm/intel/issues/2082
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3177]: https://gitlab.freedesktop.org/drm/intel/issues/3177
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3457]: https://gitlab.freedesktop.org/drm/intel/issues/3457
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (46 -> 40)
------------------------------

  Missing    (6): fi-rkl-11500t fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6082 -> IGTPW_5804

  CI-20190529: 20190529
  CI_DRM_10071: 77fc6f68ed347b0a4c6969f6adac70026d5b1449 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5804: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/index.html
  IGT_6082: 355269577baef0c5d8114e8851acaeac657e4fe6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/index.html

--===============8694682526222368122==
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
<tr><td><b>Series:</b></td><td>tests/kms_invalid_dotclock: Test every mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90053/">https://patchwork.freedesktop.org/series/90053/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10071 -&gt; IGTPW_5804</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5804 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5804, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5804:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-icl-y/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-icl-y/igt@i915_selftest@live@coherency.html">DMESG-WARN</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-elk-e7500/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-elk-e7500/igt@gem_exec_gttfill@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-nick/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5804 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-glk-dsi/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-glk-dsi/igt@gem_exec_fence@basic-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-kefka/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bwr-2160/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bwr-2160/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-nick/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-nick/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-icl-y/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-icl-y/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-glk-dsi/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-glk-dsi/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-nick/igt@gem_exec_fence@nb-await@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-nick/igt@gem_exec_fence@nb-await@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-kefka/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-kefka/igt@gem_wait@busy@all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-ilk-650/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-cfl-8109u/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-cfl-8109u/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-icl-u2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-icl-u2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-bwr-2160/igt@i915_selftest@live@mman.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-bwr-2160/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-cml-s/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-cml-s/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2082">i915#2082</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10071/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 40)</h2>
<p>Missing    (6): fi-rkl-11500t fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6082 -&gt; IGTPW_5804</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10071: 77fc6f68ed347b0a4c6969f6adac70026d5b1449 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5804: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5804/index.html<br />
  IGT_6082: 355269577baef0c5d8114e8851acaeac657e4fe6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8694682526222368122==--

--===============0246679075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0246679075==--
