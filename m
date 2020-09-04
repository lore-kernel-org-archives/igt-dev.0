Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 04 Sep 2020 22:51:19 -0000
Message-ID: <159925987905.8516.14647047158911386723@emeril.freedesktop.org>
References: <20200904130607.133724-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200904130607.133724-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUGVyIGNs?=
 =?utf-8?q?ient_engine_busyness_for_intel=5Fgpu=5Ftop?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1543992162=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1543992162==
Content-Type: multipart/alternative;
 boundary="===============5339694470394360365=="

--===============5339694470394360365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Per client engine busyness for intel_gpu_top
URL   : https://patchwork.freedesktop.org/series/81338/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5779_full -> IGTPW_4954_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4954_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4954_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4954_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@engines-hostile@vecs0:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-tglb7/igt@gem_ctx_persistence@engines-hostile@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-tglb3/igt@gem_ctx_persistence@engines-hostile@vecs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4954_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#1635] / [i915#2389])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2389]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-glk6/igt@gem_exec_whisper@basic-forked.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-glk1/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-kbl1/igt@gem_softpin@noreloc-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1185] / [i915#250])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109441])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][17] ([i915#2389]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-glk3/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][19] ([i915#1519]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-hsw8/igt@i915_pm_rc6_residency@rc6-fence.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-glk:          [DMESG-WARN][21] ([i915#1982]) -> [PASS][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
    - shard-apl:          [DMESG-WARN][23] ([i915#1635] / [i915#1982]) -> [PASS][24] +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-apl3/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][25] ([i915#180]) -> [PASS][26] +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-vga1:
    - shard-hsw:          [INCOMPLETE][27] ([i915#2055]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-vga1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-vga1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][29] ([i915#1982]) -> [PASS][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-kbl4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-kbl7/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-glk:          [FAIL][31] ([i915#49]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-tglb:         [DMESG-WARN][33] ([i915#1982]) -> [PASS][34] +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][35] ([i915#1982]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-iclb6/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [SKIP][37] ([i915#1911]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-tglb3/igt@kms_psr2_su@page_flip.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-tglb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][39] ([fdo#109441]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Warnings ####

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][41] ([i915#1319] / [i915#1635] / [i915#1958]) -> [TIMEOUT][42] ([i915#1319] / [i915#1635])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-apl1/igt@kms_content_protection@srm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][43] ([i915#1226]) -> [SKIP][44] ([fdo#109349])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5779 -> IGTPW_4954

  CI-20190529: 20190529
  CI_DRM_8965: f4cbf17fababf80c1c67c6f1687fb8bf7e00a263 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4954: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/index.html
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/index.html

--===============5339694470394360365==
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
<tr><td><b>Series:</b></td><td>Per client engine busyness for intel_gpu_top</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81338/">https://patchwork.freedesktop.org/series/81338/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5779_full -&gt; IGTPW_4954_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4954_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4954_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4954_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_ctx_persistence@engines-hostile@vecs0:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-tglb7/igt@gem_ctx_persistence@engines-hostile@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-tglb3/igt@gem_ctx_persistence@engines-hostile@vecs0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4954_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-glk6/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-glk1/igt@gem_exec_whisper@basic-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-kbl1/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-kbl4/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/250">i915#250</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-glk3/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-hsw8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-apl3/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-vga1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-kbl4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-kbl7/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-iclb6/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-tglb3/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-tglb5/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-apl1/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-apl6/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5779/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5779 -&gt; IGTPW_4954</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8965: f4cbf17fababf80c1c67c6f1687fb8bf7e00a263 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4954: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4954/index.html<br />
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============5339694470394360365==--

--===============1543992162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1543992162==--
