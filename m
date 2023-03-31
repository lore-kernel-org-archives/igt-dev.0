Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5612192066968458033=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Mar 2023 01:46:09 -0000
Message-ID: <168022716974.14984.11710329059124797362@emeril.freedesktop.org>
References: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgSW1wcm92?=
 =?utf-8?q?e_igt=5Fdoc=2Epy_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============5612192066968458033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve igt_doc.py (rev2)
URL   : https://patchwork.freedesktop.org/series/115667/
State : success

== Summary ==

CI Bug Log - changes from IGT_7227_full -> IGTPW_8719_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_8719_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [PASS][1] -> [FAIL][2] ([i915#6537])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl1/igt@i915_pm_rps@engine-order.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl2/igt@i915_pm_rps@engine-order.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][3] -> [DMESG-FAIL][4] ([i915#8319])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-snb2/igt@i915_pm_rps@reset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-snb7/igt@i915_pm_rps@reset.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#3886]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-glk7/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#3886]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-apl:          NOTRUN -> [SKIP][7] ([fdo#109271]) +29 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl6/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271]) +73 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-glk:          NOTRUN -> [SKIP][9] ([fdo#109271]) +13 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_vblank@pipe-b-query-forked-busy-hang:
    - shard-apl:          [PASS][10] -> [SKIP][11] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl4/igt@kms_vblank@pipe-b-query-forked-busy-hang.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy-hang.html
    - shard-glk:          [PASS][12] -> [SKIP][13] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-glk1/igt@kms_vblank@pipe-b-query-forked-busy-hang.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-glk1/igt@kms_vblank@pipe-b-query-forked-busy-hang.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-tglu}:       [FAIL][14] ([i915#6268]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-apl:          [TIMEOUT][16] ([i915#3063]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl6/igt@gem_eio@in-flight-contexts-1us.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl4/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][18] ([i915#2842]) -> [PASS][19] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - {shard-dg1}:        [SKIP][20] ([i915#1397]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-dg1-18/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][22] ([i915#2346]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][24] ([i915#2346]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - {shard-tglu}:       [FAIL][26] ([i915#4767]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-tglu-10/igt@kms_fbcon_fbt@fbc-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-tglu-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [FAIL][28] ([i915#79]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [ABORT][30] ([i915#180]) -> [PASS][31] +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  
#### Warnings ####

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-snb:          [ABORT][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-snb7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-snb4/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5251]: https://gitlab.freedesktop.org/drm/intel/issues/5251
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7953]: https://gitlab.freedesktop.org/drm/intel/issues/7953
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308
  [i915#8319]: https://gitlab.freedesktop.org/drm/intel/issues/8319


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7227 -> IGTPW_8719

  CI-20190529: 20190529
  CI_DRM_12937: 6848d3613c0a63382d00ff550c41394902bda903 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8719: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/index.html
  IGT_7227: 5dfa3675c36bab82cdda056db7ef622363c324ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/index.html

--===============5612192066968458033==
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
<tr><td><b>Series:</b></td><td>Improve igt_doc.py (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115667/">https://patchwork.freedesktop.org/series/115667/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7227_full -&gt; IGTPW_8719_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8719_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl1/igt@i915_pm_rps@engine-order.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl2/igt@i915_pm_rps@engine-order.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6537">i915#6537</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-snb2/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-snb7/igt@i915_pm_rps@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8319">i915#8319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-glk7/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl6/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy-hang:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl4/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-glk1/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-glk1/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl6/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl4/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-dg1-18/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-tglu-10/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-tglu-8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7227/shard-snb7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/shard-snb4/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7227 -&gt; IGTPW_8719</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12937: 6848d3613c0a63382d00ff550c41394902bda903 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8719: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8719/index.html<br />
  IGT_7227: 5dfa3675c36bab82cdda056db7ef622363c324ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5612192066968458033==--

