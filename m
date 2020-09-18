Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 18 Sep 2020 00:25:30 -0000
Message-ID: <160038873075.6347.261591594974236774@emeril.freedesktop.org>
References: <20200916201147.7618-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200916201147.7618-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2lv?=
 =?utf-8?q?ctl=5Fwrappers=3A_Keep_IGT_working_without_pread/pwrite_ioctls_?=
 =?utf-8?b?KHJldjUp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1281712629=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1281712629==
Content-Type: multipart/alternative;
 boundary="===============8718471620770963967=="

--===============8718471620770963967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/ioctl_wrappers: Keep IGT working without pread/pwrite ioctls (rev5)
URL   : https://patchwork.freedesktop.org/series/81384/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9023 -> IGTPW_4996
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/index.html

Known issues
------------

  Here are the changes found in IGTPW_4996 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-byt-j1900:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-byt-j1900/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-byt-j1900/igt@i915_module_load@reload.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - fi-icl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([i915#1982]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@prime_vgem@basic-read:
    - fi-tgl-y:           [PASS][7] -> [DMESG-WARN][8] ([i915#402]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-tgl-y/igt@prime_vgem@basic-read.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-tgl-y/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@flink-lifetime:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#402]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-tgl-y/igt@gem_flink_basic@flink-lifetime.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-tgl-y/igt@gem_flink_basic@flink-lifetime.html

  * igt@i915_pm_rpm@module-reload:
    - fi-bsw-n3050:       [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-x1275:       [DMESG-WARN][13] ([i915#62] / [i915#92] / [i915#95]) -> [PASS][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-kbl-x1275/igt@kms_busy@basic@flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-kbl-x1275/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [DMESG-WARN][15] ([i915#1982]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - fi-icl-u2:          [DMESG-WARN][17] ([i915#1982]) -> [PASS][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - fi-tgl-y:           [DMESG-WARN][19] ([i915#1982]) -> [PASS][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-tgl-y/igt@kms_pipe_crc_basic@read-crc-pipe-c.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-tgl-y/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  * igt@vgem_basic@unload:
    - fi-skl-guc:         [DMESG-WARN][21] ([i915#2203]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-skl-guc/igt@vgem_basic@unload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-skl-guc/igt@vgem_basic@unload.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [DMESG-WARN][23] ([i915#62] / [i915#92]) -> [DMESG-WARN][24] ([i915#62] / [i915#92] / [i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-y:           [DMESG-WARN][25] ([i915#2411]) -> [DMESG-WARN][26] ([i915#1982] / [i915#2411])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-tgl-y/igt@i915_pm_rpm@module-reload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-tgl-y/igt@i915_pm_rpm@module-reload.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [DMESG-WARN][27] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][28] ([i915#62] / [i915#92]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (46 -> 40)
------------------------------

  Missing    (6): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5787 -> IGTPW_4996

  CI-20190529: 20190529
  CI_DRM_9023: 5887fa2d8b9b7f6a278f9a1bc8642cb9d5d0279a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4996: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/index.html
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/index.html

--===============8718471620770963967==
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
<tr><td><b>Series:</b></td><td>lib/ioctl_wrappers: Keep IGT working without pread/pwrite ioctls (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81384/">https://patchwork.freedesktop.org/series/81384/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9023 -&gt; IGTPW_4996</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4996 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-byt-j1900/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-byt-j1900/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-tgl-y/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-tgl-y/igt@prime_vgem@basic-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_flink_basic@flink-lifetime:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-tgl-y/igt@gem_flink_basic@flink-lifetime.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-tgl-y/igt@gem_flink_basic@flink-lifetime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-kbl-x1275/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-kbl-x1275/igt@kms_busy@basic@flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-c:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-tgl-y/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-tgl-y/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-skl-guc/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-skl-guc/igt@vgem_basic@unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-tgl-y/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-tgl-y/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 40)</h2>
<p>Missing    (6): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5787 -&gt; IGTPW_4996</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9023: 5887fa2d8b9b7f6a278f9a1bc8642cb9d5d0279a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4996: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4996/index.html<br />
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8718471620770963967==--

--===============1281712629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1281712629==--
