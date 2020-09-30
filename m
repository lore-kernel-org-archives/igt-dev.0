Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 30 Sep 2020 16:33:11 -0000
Message-ID: <160148359141.17418.2198963903989539807@emeril.freedesktop.org>
References: <20200930115307.1447-1-petri.latvala@intel.com>
In-Reply-To: <20200930115307.1447-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fchamelium=3A_Use_curl_timeout_for_xmlrpc_calls_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1490368564=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1490368564==
Content-Type: multipart/alternative;
 boundary="===============4720338185761375099=="

--===============4720338185761375099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_chamelium: Use curl timeout for xmlrpc calls (rev2)
URL   : https://patchwork.freedesktop.org/series/82061/
State : success

== Summary ==

CI Bug Log - changes from IGT_5794_full -> IGTPW_5031_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/index.html

Known issues
------------

  Here are the changes found in IGTPW_5031_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][1] -> [FAIL][2] ([i915#1635] / [i915#2389])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#2389]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-glk8/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-glk6/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-glk8/igt@gem_exec_whisper@basic-forked-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][7] -> [DMESG-WARN][8] ([i915#1982]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-tglb2/igt@i915_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-tglb2/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#454])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([i915#151] / [i915#155])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl6/igt@i915_pm_rpm@system-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl1/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb5/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#1911])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-tglb8/igt@kms_psr2_su@page_flip.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-tglb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  
#### Possible fixes ####

  * {igt@core_hotunplug@unbind-rebind}:
    - shard-tglb:         [INCOMPLETE][23] ([i915#1602]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-tglb2/igt@core_hotunplug@unbind-rebind.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-tglb2/igt@core_hotunplug@unbind-rebind.html
    - shard-iclb:         [INCOMPLETE][25] -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb1/igt@core_hotunplug@unbind-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb8/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-glk:          [DMESG-WARN][27] ([i915#118] / [i915#95]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-glk8/igt@gem_exec_nop@basic-parallel.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-glk5/igt@gem_exec_nop@basic-parallel.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [FAIL][29] ([i915#71]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl1/igt@kms_color@pipe-b-legacy-gamma.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl1/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-apl:          [FAIL][31] ([i915#1635] / [i915#71]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-apl8/igt@kms_color@pipe-b-legacy-gamma.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-apl6/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-WARN][33] ([i915#78]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +6 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a1:
    - shard-glk:          [FAIL][37] ([i915#407]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-glk5/igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-glk2/igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][39] ([i915#1982]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-stridechange.html
    - shard-glk:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-glk7/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-glk6/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][43] ([fdo#109441]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf_pmu@busy-hang@vecs0:
    - shard-iclb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb2/igt@perf_pmu@busy-hang@vecs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb3/igt@perf_pmu@busy-hang@vecs0.html

  * igt@syncobj_timeline@etime-single-wait-submitted:
    - shard-kbl:          [DMESG-WARN][47] ([i915#165]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl2/igt@syncobj_timeline@etime-single-wait-submitted.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl1/igt@syncobj_timeline@etime-single-wait-submitted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2469]: https://gitlab.freedesktop.org/drm/intel/issues/2469
  [i915#2476]: https://gitlab.freedesktop.org/drm/intel/issues/2476
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5794 -> IGTPW_5031

  CI-20190529: 20190529
  CI_DRM_9077: ae1f3f7de609df105aeceed2655656ffc838d720 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5031: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/index.html
  IGT_5794: eeccb2a17453f90ad92d1ab6f81ad7d344119d72 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/index.html

--===============4720338185761375099==
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
<tr><td><b>Series:</b></td><td>lib/igt_chamelium: Use curl timeout for xmlrpc calls (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82061/">https://patchwork.freedesktop.org/series/82061/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5794_full -&gt; IGTPW_5031_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5031_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-glk8/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-glk6/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-glk8/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-tglb2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-tglb2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl6/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl1/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/151">i915#151</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb5/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-tglb8/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-tglb6/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@core_hotunplug@unbind-rebind}:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-tglb2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-tglb2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb1/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb8/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_nop@basic-parallel:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-glk8/igt@gem_exec_nop@basic-parallel.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-glk5/igt@gem_exec_nop@basic-parallel.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-legacy-gamma:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl1/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl1/igt@kms_color@pipe-b-legacy-gamma.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-apl8/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-apl6/igt@kms_color@pipe-b-legacy-gamma.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-glk5/igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/407">i915#407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-glk2/igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-glk7/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-glk6/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-hang@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-iclb2/igt@perf_pmu@busy-hang@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-iclb3/igt@perf_pmu@busy-hang@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-single-wait-submitted:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5794/shard-kbl2/igt@syncobj_timeline@etime-single-wait-submitted.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/shard-kbl1/igt@syncobj_timeline@etime-single-wait-submitted.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5794 -&gt; IGTPW_5031</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9077: ae1f3f7de609df105aeceed2655656ffc838d720 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5031: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5031/index.html<br />
  IGT_5794: eeccb2a17453f90ad92d1ab6f81ad7d344119d72 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============4720338185761375099==--

--===============1490368564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1490368564==--
