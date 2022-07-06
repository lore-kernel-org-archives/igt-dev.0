Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5085564569272609291=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Date: Wed, 06 Jul 2022 10:28:16 -0000
Message-ID: <165710329623.1549.47673906533795796@emeril.freedesktop.org>
References: <20220706085746.32363-1-karthik.b.s@intel.com>
In-Reply-To: <20220706085746.32363-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Move_output_check_to_the_beginning?=
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

--===============5085564569272609291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Move output check to the beginning
URL   : https://patchwork.freedesktop.org/series/105952/
State : success

== Summary ==

CI Bug Log - changes from IGT_6557 -> IGTPW_7467
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/index.html

Participating hosts (44 -> 41)
------------------------------

  Additional (2): bat-rpls-1 bat-adlp-4 
  Missing    (5): fi-hsw-4200u bat-adlm-1 fi-ilk-650 fi-ctg-p8600 bat-adln-1 

New tests
---------

  New tests have been introduced between IGT_6557 and IGTPW_7467:

### New IGT tests (26) ###

  * igt@gem_exec_basic@basic@bcs0-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@basic@rcs0-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_basic@basic@vcs0-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_basic@basic@vcs1-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@basic@vecs0-lmem0:
    - Statuses : 4 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_selftest@live@migrate:
    - Statuses : 1 dmesg-warn(s) 35 pass(s)
    - Exec time: [0.48, 8.48] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_flip@basic-flip-vs-dpms@d-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a2:
    - Statuses : 2 pass(s)
    - Exec time: [0.62, 0.73] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a2:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.70] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-hdmi-a2:
    - Statuses : 2 pass(s)
    - Exec time: [1.07, 1.16] s

  * igt@kms_flip@basic-plain-flip@a-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_flip@basic-plain-flip@b-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@basic-plain-flip@c-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_flip@basic-plain-flip@d-dp3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@basic-plain-flip@d-hdmi-a2:
    - Statuses : 2 pass(s)
    - Exec time: [0.62, 0.72] s

  

Known issues
------------

  Here are the changes found in IGTPW_7467 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adlp-4:         NOTRUN -> [SKIP][1] ([i915#4613]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-4:         NOTRUN -> [SKIP][2] ([i915#3282])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@gem_tiled_pread_basic.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][3] -> [INCOMPLETE][4] ([i915#4785])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-5:          [PASS][5] -> [DMESG-FAIL][6] ([i915#4494] / [i915#4957])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [PASS][7] -> [INCOMPLETE][8] ([i915#3921])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@migrate (NEW):
    - {bat-dg2-8}:        NOTRUN -> [DMESG-WARN][9] ([i915#5763])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-dg2-8/igt@i915_selftest@live@migrate.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-adlp-4:         NOTRUN -> [SKIP][10] ([i915#5903])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_busy@basic@flip:
    - bat-adlp-4:         NOTRUN -> [DMESG-WARN][11] ([i915#3576]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium@dp-crc-fast:
    - bat-adlp-4:         NOTRUN -> [SKIP][12] ([fdo#111827]) +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - bat-adlp-4:         NOTRUN -> [SKIP][13] ([i915#4103])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adlp-4:         NOTRUN -> [SKIP][14] ([i915#4093]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adlp-4:         NOTRUN -> [SKIP][15] ([i915#3555] / [i915#4579])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-userptr:
    - bat-adlp-4:         NOTRUN -> [SKIP][16] ([fdo#109295] / [i915#3301] / [i915#3708])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@basic-write:
    - bat-adlp-4:         NOTRUN -> [SKIP][17] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {bat-rpls-2}:       [SKIP][18] ([i915#2582]) -> [PASS][19] +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/bat-rpls-2/igt@fbdev@read.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-rpls-2/igt@fbdev@read.html

  * igt@i915_selftest@live@gt_timelines:
    - {bat-dg2-9}:        [DMESG-WARN][20] ([i915#5763]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][22] ([i915#3576]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5087]: https://gitlab.freedesktop.org/drm/intel/issues/5087
  [i915#5270]: https://gitlab.freedesktop.org/drm/intel/issues/5270
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6557 -> IGTPW_7467

  CI-20190529: 20190529
  CI_DRM_11850: 295e0e9b3a5d5ef71096cfac07684be807f5a8c0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7467: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/index.html
  IGT_6557: ac3cdf3a3791fc3521517df2f088bcb8b9560802 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/index.html

--===============5085564569272609291==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Move output check to the beginning</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105952/">https://patchwork.freedesktop.org/series/105952/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6557 -&gt; IGTPW_7467</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/index.html</p>
<h2>Participating hosts (44 -&gt; 41)</h2>
<p>Additional (2): bat-rpls-1 bat-adlp-4 <br />
  Missing    (5): fi-hsw-4200u bat-adlm-1 fi-ilk-650 fi-ctg-p8600 bat-adln-1 </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6557 and IGTPW_7467:</p>
<h3>New IGT tests (26)</h3>
<ul>
<li>
<p>igt@gem_exec_basic@basic@bcs0-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic@rcs0-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic@vcs0-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic@vcs1-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic@vecs0-lmem0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 35 pass(s)</li>
<li>Exec time: [0.48, 8.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.62, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-hdmi-a2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.07, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dp3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-hdmi-a2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.62, 0.72] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7467 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate (NEW):</p>
<ul>
<li>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-dg2-8/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5903">i915#5903</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-4/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-rpls-2/igt@fbdev@read.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6557/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6557 -&gt; IGTPW_7467</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11850: 295e0e9b3a5d5ef71096cfac07684be807f5a8c0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7467: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7467/index.html<br />
  IGT_6557: ac3cdf3a3791fc3521517df2f088bcb8b9560802 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5085564569272609291==--
