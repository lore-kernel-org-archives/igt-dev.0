Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 07 Sep 2020 01:21:23 -0000
Message-ID: <159944168356.31224.17279090518056851205@emeril.freedesktop.org>
References: <20200906173805.24916-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200906173805.24916-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2lv?=
 =?utf-8?q?ctl=5Fwrappers=3A_Handle_PREAD/PWRITE_ioctls_not_supported_in_g?=
 =?utf-8?q?em=5Fread/write_=28rev12=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1789359905=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1789359905==
Content-Type: multipart/alternative;
 boundary="===============4999745205299613599=="

--===============4999745205299613599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev12)
URL   : https://patchwork.freedesktop.org/series/81152/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8968_full -> IGTPW_4960_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/index.html

Known issues
------------

  Here are the changes found in IGTPW_4960_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@blt:
    - shard-hsw:          [PASS][1] -> [DMESG-FAIL][2] ([i915#1409])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-hsw4/igt@i915_selftest@live@blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-hsw6/igt@i915_selftest@live@blt.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][3] -> [FAIL][4] ([i915#96])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#79])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#49])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10] ([i915#1982]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +7 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109441])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#43])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk1/igt@kms_vblank@pipe-b-accuracy-idle.html

  
#### Possible fixes ####

  * igt@gem_flink_race@flink_close:
    - shard-iclb:         [DMESG-WARN][17] ([i915#1982]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-iclb2/igt@gem_flink_race@flink_close.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-iclb7/igt@gem_flink_race@flink_close.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [INCOMPLETE][19] ([i915#1635] / [i915#2278]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-apl4/igt@i915_selftest@mock@contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-apl8/igt@i915_selftest@mock@contexts.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-kbl:          [DMESG-WARN][21] ([i915#1982]) -> [PASS][22] +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-kbl4/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-kbl1/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][23] ([i915#1635] / [i915#1982]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-apl6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-apl8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-glk:          [DMESG-WARN][25] ([i915#1982]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][27] ([i915#2122]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-glk:          [FAIL][29] ([i915#79]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32] +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][33] ([i915#2055]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-hsw4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-hsw6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-glk:          [FAIL][35] ([i915#49]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-tglb:         [DMESG-WARN][37] ([i915#1982]) -> [PASS][38] +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [SKIP][39] ([i915#1911]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-tglb5/igt@kms_psr2_su@page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-tglb8/igt@kms_psr2_su@page_flip.html
    - shard-iclb:         [SKIP][41] ([fdo#109642] / [fdo#111068]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][43] ([fdo#109441]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-iclb4/igt@kms_psr@psr2_basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][45] ([i915#31]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-hsw4/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-hsw6/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][47] ([i915#1226]) -> [SKIP][48] ([fdo#109349])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1409]: https://gitlab.freedesktop.org/drm/intel/issues/1409
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5779 -> IGTPW_4960
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8968: 4d831cabbba82294ba008ec7999c71f443b1864f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4960: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/index.html
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/index.html

--===============4999745205299613599==
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
<tr><td><b>Series:</b></td><td>lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81152/">https://patchwork.freedesktop.org/series/81152/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8968_full -&gt; IGTPW_4960_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4960_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-hsw4/igt@i915_selftest@live@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-hsw6/igt@i915_selftest@live@blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1409">i915#1409</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk1/igt@kms_vblank@pipe-b-accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_flink_race@flink_close:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-iclb2/igt@gem_flink_race@flink_close.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-iclb7/igt@gem_flink_race@flink_close.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-apl4/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-apl8/igt@i915_selftest@mock@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-kbl4/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-kbl1/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-apl6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-apl8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-hsw4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-hsw6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-tglb5/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-tglb8/igt@kms_psr2_su@page_flip.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-iclb1/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-iclb4/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-hsw4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-hsw6/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dp_dsc@basic-dsc-enable-edp:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8968/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5779 -&gt; IGTPW_4960</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8968: 4d831cabbba82294ba008ec7999c71f443b1864f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4960: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4960/index.html<br />
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4999745205299613599==--

--===============1789359905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1789359905==--
