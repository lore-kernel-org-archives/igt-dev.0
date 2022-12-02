Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9105968395247418675=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 02 Dec 2022 16:30:05 -0000
Message-ID: <166999860586.27864.769735443579743368@emeril.freedesktop.org>
References: <20221202154228.45766-1-mcanal@igalia.com>
In-Reply-To: <20221202154228.45766-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVkM0IElH?=
 =?utf-8?q?T_Tests_Updates_=28rev2=29?=
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

--===============9105968395247418675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VC4 IGT Tests Updates (rev2)
URL   : https://patchwork.freedesktop.org/series/110948/
State : success

== Summary ==

CI Bug Log - changes from IGT_7079 -> IGTPW_8188
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/index.html

Participating hosts (42 -> 44)
------------------------------

  Additional (3): bat-adlp-9 bat-adlp-6 bat-dg1-5 
  Missing    (1): fi-ilk-m540 

Known issues
------------

  Here are the changes found in IGTPW_8188 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_mmap@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][1] ([i915#4083])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@gem_mmap@basic.html

  * igt@gem_tiled_blits@basic:
    - fi-pnv-d510:        [PASS][2] -> [SKIP][3] ([fdo#109271]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-pnv-d510/igt@gem_tiled_blits@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/fi-pnv-d510/igt@gem_tiled_blits@basic.html
    - bat-dg1-5:          NOTRUN -> [SKIP][4] ([i915#4077]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][5] ([i915#4079]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-dg1-5:          NOTRUN -> [SKIP][6] ([i915#7561])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-5:          NOTRUN -> [SKIP][7] ([i915#6621])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - bat-dg1-5:          NOTRUN -> [SKIP][8] ([i915#4212]) +7 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg1-5:          NOTRUN -> [SKIP][9] ([i915#4215])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_chamelium@dp-crc-fast:
    - bat-dg1-5:          NOTRUN -> [SKIP][10] ([fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - bat-dg1-5:          NOTRUN -> [SKIP][11] ([i915#4103] / [i915#4213])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg1-5:          NOTRUN -> [SKIP][12] ([fdo#109285])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - bat-dg1-5:          NOTRUN -> [FAIL][13] ([fdo#103375])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg1-5:          NOTRUN -> [SKIP][14] ([i915#1072] / [i915#4078]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_psr@primary_page_flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg1-5:          NOTRUN -> [SKIP][15] ([i915#3555])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-dg1-5:          NOTRUN -> [SKIP][16] ([i915#3708]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg1-5:          NOTRUN -> [SKIP][17] ([i915#3708] / [i915#4077]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-userptr:
    - bat-dg1-5:          NOTRUN -> [SKIP][18] ([i915#3708] / [i915#4873])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-guc:         [DMESG-FAIL][19] ([i915#5334]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - {fi-tgl-dsi}:       [INCOMPLETE][21] ([i915#6856] / [i915#7125]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-tgl-dsi/igt@i915_selftest@live@gt_lrc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/fi-tgl-dsi/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@migrate:
    - {bat-dg2-11}:       [DMESG-WARN][23] ([i915#7359]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - fi-kbl-soraka:      [INCOMPLETE][25] ([i915#7640]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-kbl-soraka/igt@i915_selftest@live@requests.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/fi-kbl-soraka/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5153]: https://gitlab.freedesktop.org/drm/intel/issues/5153
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6856]: https://gitlab.freedesktop.org/drm/intel/issues/6856
  [i915#6949]: https://gitlab.freedesktop.org/drm/intel/issues/6949
  [i915#7058]: https://gitlab.freedesktop.org/drm/intel/issues/7058
  [i915#7125]: https://gitlab.freedesktop.org/drm/intel/issues/7125
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7433]: https://gitlab.freedesktop.org/drm/intel/issues/7433
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7640]: https://gitlab.freedesktop.org/drm/intel/issues/7640


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7079 -> IGTPW_8188

  CI-20190529: 20190529
  CI_DRM_12462: 00b10bdfd8b9edc9b2c681d806fbb6ae2e5f31a3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8188: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/index.html
  IGT_7079: 272354f8e1bbeb56df1663c42a9958f2ff9b8f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@vc4/vc4_create_bo@create-bo-0
+igt@vc4/vc4_create_bo@create-bo-4096
+igt@vc4/vc4_create_bo@create-bo-zeroed
+igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done
+igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done
+igt@vc4/vc4_label_bo@set-bad-handle
+igt@vc4/vc4_label_bo@set-bad-name
+igt@vc4/vc4_label_bo@set-kernel-name
+igt@vc4/vc4_label_bo@set-label
+igt@vc4/vc4_lookup_fail@bad-color-write
+igt@vc4/vc4_perfmon@create-perfmon-0
+igt@vc4/vc4_perfmon@create-perfmon-exceed
+igt@vc4/vc4_perfmon@create-perfmon-invalid-events
+igt@vc4/vc4_perfmon@create-single-perfmon
+igt@vc4/vc4_perfmon@create-two-perfmon
+igt@vc4/vc4_perfmon@destroy-invalid-perfmon
+igt@vc4/vc4_perfmon@destroy-valid-perfmon
+igt@vc4/vc4_perfmon@get-values-invalid-perfmon
+igt@vc4/vc4_perfmon@get-values-invalid-pointer
+igt@vc4/vc4_perfmon@get-values-valid-perfmon
+igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem
+igt@vc4/vc4_purgeable_bo@access-purged-bo-mem
+igt@vc4/vc4_purgeable_bo@free-purged-bo
+igt@vc4/vc4_purgeable_bo@mark-purgeable
+igt@vc4/vc4_purgeable_bo@mark-purgeable-twice
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice
+igt@vc4/vc4_purgeable_bo@mark-willneed
+igt@vc4/vc4_tiling@get-after-free
+igt@vc4/vc4_tiling@get-bad-flags
+igt@vc4/vc4_tiling@get-bad-handle
+igt@vc4/vc4_tiling@get-bad-modifier
+igt@vc4/vc4_tiling@set-bad-flags
+igt@vc4/vc4_tiling@set-bad-handle
+igt@vc4/vc4_tiling@set-bad-modifier
+igt@vc4/vc4_tiling@set-get
+igt@vc4/vc4_wait_bo@bad-bo
+igt@vc4/vc4_wait_bo@bad-pad
+igt@vc4/vc4_wait_bo@unused-bo-0ns
+igt@vc4/vc4_wait_bo@unused-bo-1ns
+igt@vc4/vc4_wait_bo@used-bo
+igt@vc4/vc4_wait_bo@used-bo-0ns
+igt@vc4/vc4_wait_bo@used-bo-1ns
+igt@vc4/vc4_wait_seqno@bad-seqno-0ns
+igt@vc4/vc4_wait_seqno@bad-seqno-1ns
-igt@vc4_create_bo@create-bo-0
-igt@vc4_create_bo@create-bo-4096
-igt@vc4_create_bo@create-bo-zeroed
-igt@vc4_dmabuf_poll@poll-read-waits-until-write-done
-igt@vc4_dmabuf_poll@poll-write-waits-until-write-done
-igt@vc4_label_bo@set-bad-handle
-igt@vc4_label_bo@set-bad-name
-igt@vc4_label_bo@set-kernel-name
-igt@vc4_label_bo@set-label
-igt@vc4_lookup_fail@bad-color-write
-igt@vc4_purgeable_bo@access-purgeable-bo-mem
-igt@vc4_purgeable_bo@access-purged-bo-mem
-igt@vc4_purgeable_bo@free-purged-bo
-igt@vc4_purgeable_bo@mark-purgeable
-igt@vc4_purgeable_bo@mark-purgeable-twice
-igt@vc4_purgeable_bo@mark-unpurgeable-check-retained
-igt@vc4_purgeable_bo@mark-unpurgeable-purged
-igt@vc4_purgeable_bo@mark-unpurgeable-twice
-igt@vc4_purgeable_bo@mark-willneed
-igt@vc4_tiling@get-after-free
-igt@vc4_tiling@get-bad-flags
-igt@vc4_tiling@get-bad-handle
-igt@vc4_tiling@get-bad-modifier
-igt@vc4_tiling@set-bad-flags
-igt@vc4_tiling@set-bad-handle
-igt@vc4_tiling@set-bad-modifier
-igt@vc4_tiling@set-get
-igt@vc4_wait_bo@bad-bo
-igt@vc4_wait_bo@bad-pad
-igt@vc4_wait_bo@unused-bo-0ns
-igt@vc4_wait_bo@unused-bo-1ns
-igt@vc4_wait_bo@used-bo
-igt@vc4_wait_bo@used-bo-0ns
-igt@vc4_wait_bo@used-bo-1ns
-igt@vc4_wait_seqno@bad-seqno-0ns
-igt@vc4_wait_seqno@bad-seqno-1ns

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/index.html

--===============9105968395247418675==
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
<tr><td><b>Series:</b></td><td>VC4 IGT Tests Updates (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110948/">https://patchwork.freedesktop.org/series/110948/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7079 -&gt; IGTPW_8188</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/index.html</p>
<h2>Participating hosts (42 -&gt; 44)</h2>
<p>Additional (3): bat-adlp-9 bat-adlp-6 bat-dg1-5 <br />
  Missing    (1): fi-ilk-m540 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8188 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-pnv-d510/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/fi-pnv-d510/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-tgl-dsi/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6856">i915#6856</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7125">i915#7125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/fi-tgl-dsi/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7359">i915#7359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7079/fi-kbl-soraka/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7640">i915#7640</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/fi-kbl-soraka/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7079 -&gt; IGTPW_8188</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12462: 00b10bdfd8b9edc9b2c681d806fbb6ae2e5f31a3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8188: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8188/index.html<br />
  IGT_7079: 272354f8e1bbeb56df1663c42a9958f2ff9b8f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@vc4/vc4_create_bo@create-bo-0<br />
+igt@vc4/vc4_create_bo@create-bo-4096<br />
+igt@vc4/vc4_create_bo@create-bo-zeroed<br />
+igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done<br />
+igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done<br />
+igt@vc4/vc4_label_bo@set-bad-handle<br />
+igt@vc4/vc4_label_bo@set-bad-name<br />
+igt@vc4/vc4_label_bo@set-kernel-name<br />
+igt@vc4/vc4_label_bo@set-label<br />
+igt@vc4/vc4_lookup_fail@bad-color-write<br />
+igt@vc4/vc4_perfmon@create-perfmon-0<br />
+igt@vc4/vc4_perfmon@create-perfmon-exceed<br />
+igt@vc4/vc4_perfmon@create-perfmon-invalid-events<br />
+igt@vc4/vc4_perfmon@create-single-perfmon<br />
+igt@vc4/vc4_perfmon@create-two-perfmon<br />
+igt@vc4/vc4_perfmon@destroy-invalid-perfmon<br />
+igt@vc4/vc4_perfmon@destroy-valid-perfmon<br />
+igt@vc4/vc4_perfmon@get-values-invalid-perfmon<br />
+igt@vc4/vc4_perfmon@get-values-invalid-pointer<br />
+igt@vc4/vc4_perfmon@get-values-valid-perfmon<br />
+igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem<br />
+igt@vc4/vc4_purgeable_bo@access-purged-bo-mem<br />
+igt@vc4/vc4_purgeable_bo@free-purged-bo<br />
+igt@vc4/vc4_purgeable_bo@mark-purgeable<br />
+igt@vc4/vc4_purgeable_bo@mark-purgeable-twice<br />
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained<br />
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged<br />
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice<br />
+igt@vc4/vc4_purgeable_bo@mark-willneed<br />
+igt@vc4/vc4_tiling@get-after-free<br />
+igt@vc4/vc4_tiling@get-bad-flags<br />
+igt@vc4/vc4_tiling@get-bad-handle<br />
+igt@vc4/vc4_tiling@get-bad-modifier<br />
+igt@vc4/vc4_tiling@set-bad-flags<br />
+igt@vc4/vc4_tiling@set-bad-handle<br />
+igt@vc4/vc4_tiling@set-bad-modifier<br />
+igt@vc4/vc4_tiling@set-get<br />
+igt@vc4/vc4_wait_bo@bad-bo<br />
+igt@vc4/vc4_wait_bo@bad-pad<br />
+igt@vc4/vc4_wait_bo@unused-bo-0ns<br />
+igt@vc4/vc4_wait_bo@unused-bo-1ns<br />
+igt@vc4/vc4_wait_bo@used-bo<br />
+igt@vc4/vc4_wait_bo@used-bo-0ns<br />
+igt@vc4/vc4_wait_bo@used-bo-1ns<br />
+igt@vc4/vc4_wait_seqno@bad-seqno-0ns<br />
+igt@vc4/vc4_wait_seqno@bad-seqno-1ns<br />
-igt@vc4_create_bo@create-bo-0<br />
-igt@vc4_create_bo@create-bo-4096<br />
-igt@vc4_create_bo@create-bo-zeroed<br />
-igt@vc4_dmabuf_poll@poll-read-waits-until-write-done<br />
-igt@vc4_dmabuf_poll@poll-write-waits-until-write-done<br />
-igt@vc4_label_bo@set-bad-handle<br />
-igt@vc4_label_bo@set-bad-name<br />
-igt@vc4_label_bo@set-kernel-name<br />
-igt@vc4_label_bo@set-label<br />
-igt@vc4_lookup_fail@bad-color-write<br />
-igt@vc4_purgeable_bo@access-purgeable-bo-mem<br />
-igt@vc4_purgeable_bo@access-purged-bo-mem<br />
-igt@vc4_purgeable_bo@free-purged-bo<br />
-igt@vc4_purgeable_bo@mark-purgeable<br />
-igt@vc4_purgeable_bo@mark-purgeable-twice<br />
-igt@vc4_purgeable_bo@mark-unpurgeable-check-retained<br />
-igt@vc4_purgeable_bo@mark-unpurgeable-purged<br />
-igt@vc4_purgeable_bo@mark-unpurgeable-twice<br />
-igt@vc4_purgeable_bo@mark-willneed<br />
-igt@vc4_tiling@get-after-free<br />
-igt@vc4_tiling@get-bad-flags<br />
-igt@vc4_tiling@get-bad-handle<br />
-igt@vc4_tiling@get-bad-modifier<br />
-igt@vc4_tiling@set-bad-flags<br />
-igt@vc4_tiling@set-bad-handle<br />
-igt@vc4_tiling@set-bad-modifier<br />
-igt@vc4_tiling@set-get<br />
-igt@vc4_wait_bo@bad-bo<br />
-igt@vc4_wait_bo@bad-pad<br />
-igt@vc4_wait_bo@unused-bo-0ns<br />
-igt@vc4_wait_bo@unused-bo-1ns<br />
-igt@vc4_wait_bo@used-bo<br />
-igt@vc4_wait_bo@used-bo-0ns<br />
-igt@vc4_wait_bo@used-bo-1ns<br />
-igt@vc4_wait_seqno@bad-seqno-0ns<br />
-igt@vc4_wait_seqno@bad-seqno-1ns</p>

</body>
</html>

--===============9105968395247418675==--
