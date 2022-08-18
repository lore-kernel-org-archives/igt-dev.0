Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2970316406296542724=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ananya Sharma" <ananya.sharma@intel.com>
Date: Thu, 18 Aug 2022 09:20:10 -0000
Message-ID: <166081441079.16681.2119984142177346590@emeril.freedesktop.org>
References: <20220818084908.427352-1-ananya.sharma@intel.com>
In-Reply-To: <20220818084908.427352-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSUdUIGNs?=
 =?utf-8?q?ean-up_tasks_=28rev3=29?=
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

--===============2970316406296542724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT clean-up tasks (rev3)
URL   : https://patchwork.freedesktop.org/series/104318/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11996 -> IGTPW_7658
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_7658 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7658, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/index.html

Participating hosts (31 -> 34)
------------------------------

  Additional (3): fi-icl-u2 bat-adls-5 bat-dg1-5 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7658:

### IGT changes ###

#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-elk-e7500:       [INCOMPLETE][1] ([i915#6601]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-elk-e7500/igt@i915_suspend@basic-s3-without-i915.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-elk-e7500/igt@i915_suspend@basic-s3-without-i915.html

  
Known issues
------------

  Here are the changes found in IGTPW_7658 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - bat-dg1-5:          NOTRUN -> [SKIP][3] ([i915#2582]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@fbdev@read.html

  * igt@gem_mmap@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][4] ([i915#4083])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@gem_mmap@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][5] ([i915#4077]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][6] ([i915#4079]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@gem_tiled_pread_basic.html

  * igt@i915_module_load@load:
    - fi-icl-u2:          NOTRUN -> [DMESG-WARN][7] ([i915#6599])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-icl-u2/igt@i915_module_load@load.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-dg1-5:          NOTRUN -> [SKIP][8] ([i915#1155])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          NOTRUN -> [DMESG-FAIL][9] ([i915#4494] / [i915#4957])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][10] -> [DMESG-FAIL][11] ([i915#4528])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-dg1-5:          NOTRUN -> [INCOMPLETE][12] ([i915#6011])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][13] ([i915#4817])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - bat-dg1-5:          NOTRUN -> [SKIP][14] ([i915#4212]) +7 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg1-5:          NOTRUN -> [SKIP][15] ([i915#4215])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_busy@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][16] ([i915#1845] / [i915#4303])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_busy@basic.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - bat-dg1-5:          NOTRUN -> [SKIP][17] ([fdo#111827]) +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg1-5:          NOTRUN -> [SKIP][18] ([fdo#109285])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg1-5:          NOTRUN -> [SKIP][19] ([i915#4078]) +13 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][20] ([fdo#109271]) +19 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-dg1-5:          NOTRUN -> [SKIP][21] ([i915#1072] / [i915#4078]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg1-5:          NOTRUN -> [SKIP][22] ([i915#3555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg1-5:          NOTRUN -> [SKIP][23] ([i915#1845] / [i915#3708])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - bat-dg1-5:          NOTRUN -> [SKIP][24] ([i915#3708]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg1-5:          NOTRUN -> [SKIP][25] ([i915#3708] / [i915#4077]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-userptr:
    - bat-dg1-5:          NOTRUN -> [SKIP][26] ([i915#3708] / [i915#4873])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-icl-u2:          NOTRUN -> [FAIL][27] ([i915#4312] / [i915#6599])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-icl-u2/igt@runner@aborted.html
    - bat-dg1-5:          NOTRUN -> [FAIL][28] ([i915#4312] / [i915#5257])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@runner@aborted.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][29] ([fdo#109271] / [i915#2403] / [i915#4312])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - fi-bdw-gvtdvm:      [DMESG-WARN][30] ([i915#6540]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@i915_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-bdw-gvtdvm/igt@i915_module_load@load.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-bdw-gvtdvm:      [DMESG-WARN][32] ([i915#5922]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-skl-6700k2:      [INCOMPLETE][34] ([i915#4939]) -> [INCOMPLETE][35] ([i915#4939] / [i915#6598])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3@smem.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3@smem.html
    - fi-bdw-5557u:       [INCOMPLETE][36] ([i915#146]) -> [INCOMPLETE][37] ([i915#146] / [i915#6598])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@runner@aborted:
    - fi-cfl-8109u:       [FAIL][38] ([i915#4312]) -> [FAIL][39] ([i915#4312] / [i915#6599])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-cfl-8109u/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-cfl-8109u/igt@runner@aborted.html
    - fi-adl-ddr5:        [FAIL][40] ([i915#4312]) -> [FAIL][41] ([i915#4312] / [i915#6599])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-adl-ddr5/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-adl-ddr5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4303]: https://gitlab.freedesktop.org/drm/intel/issues/4303
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5922]: https://gitlab.freedesktop.org/drm/intel/issues/5922
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6540]: https://gitlab.freedesktop.org/drm/intel/issues/6540
  [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#6601]: https://gitlab.freedesktop.org/drm/intel/issues/6601


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6630 -> IGTPW_7658

  CI-20190529: 20190529
  CI_DRM_11996: 79088b3740cb8192a131fae2c0d335b456557088 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7658: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/index.html
  IGT_6630: b5e2222c9a988015bdf237e6ebb9f5b6d87ac7e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_universal_plane@cursor-fb-leak
+igt@kms_universal_plane@disable-primary-vs-flip
+igt@kms_universal_plane@universal-plane-functional
+igt@kms_universal_plane@universal-plane-gen9-features
+igt@kms_universal_plane@universal-plane-sanity
-igt@kms_universal_plane@cursor-fb-leak-pipe-a
-igt@kms_universal_plane@cursor-fb-leak-pipe-b
-igt@kms_universal_plane@cursor-fb-leak-pipe-c
-igt@kms_universal_plane@cursor-fb-leak-pipe-d
-igt@kms_universal_plane@cursor-fb-leak-pipe-e
-igt@kms_universal_plane@cursor-fb-leak-pipe-f
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-c
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-d
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-e
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-f
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-a
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-b
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-c
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-d
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-e
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-f
-igt@kms_universal_plane@universal-plane-pipe-a-functional
-igt@kms_universal_plane@universal-plane-pipe-a-sanity
-igt@kms_universal_plane@universal-plane-pipe-b-functional
-igt@kms_universal_plane@universal-plane-pipe-b-sanity
-igt@kms_universal_plane@universal-plane-pipe-c-functional
-igt@kms_universal_plane@universal-plane-pipe-c-sanity
-igt@kms_universal_plane@universal-plane-pipe-d-functional
-igt@kms_universal_plane@universal-plane-pipe-d-sanity
-igt@kms_universal_plane@universal-plane-pipe-e-functional
-igt@kms_universal_plane@universal-plane-pipe-e-sanity
-igt@kms_universal_plane@universal-plane-pipe-f-functional
-igt@kms_universal_plane@universal-plane-pipe-f-sanity

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/index.html

--===============2970316406296542724==
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
<tr><td><b>Series:</b></td><td>IGT clean-up tasks (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104318/">https://patchwork.freedesktop.org/series/104318/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11996 -&gt; IGTPW_7658</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_7658 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7658, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/index.html</p>
<h2>Participating hosts (31 -&gt; 34)</h2>
<p>Additional (3): fi-icl-u2 bat-adls-5 bat-dg1-5 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7658:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-elk-e7500/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6601">i915#6601</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-elk-e7500/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7658 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-icl-u2/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6011">i915#6011</a>)</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4303">i915#4303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +13 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/bat-dg1-5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6540">i915#6540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-bdw-gvtdvm/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5922">i915#5922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</p>
</li>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11996/fi-adl-ddr5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/fi-adl-ddr5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6630 -&gt; IGTPW_7658</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11996: 79088b3740cb8192a131fae2c0d335b456557088 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7658: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7658/index.html<br />
  IGT_6630: b5e2222c9a988015bdf237e6ebb9f5b6d87ac7e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_universal_plane@cursor-fb-leak<br />
+igt@kms_universal_plane@disable-primary-vs-flip<br />
+igt@kms_universal_plane@universal-plane-functional<br />
+igt@kms_universal_plane@universal-plane-gen9-features<br />
+igt@kms_universal_plane@universal-plane-sanity<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-a<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-b<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-c<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-d<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-e<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-f<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-a<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-b<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-c<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-d<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-e<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-f<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-a<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-b<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-c<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-d<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-e<br />
-igt@kms_universal_plane@universal-plane-gen9-features-pipe-f<br />
-igt@kms_universal_plane@universal-plane-pipe-a-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-a-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-b-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-b-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-c-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-c-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-d-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-d-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-e-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-e-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-f-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-f-sanity</p>

</body>
</html>

--===============2970316406296542724==--
