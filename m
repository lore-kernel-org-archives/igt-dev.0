Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8116298732571163975=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 15 Jun 2023 08:07:27 -0000
Message-ID: <168681644784.10724.6806670567068811696@emeril.freedesktop.org>
References: <20230615052438.15220-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230615052438.15220-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fcursor=3A_Pipe-D_is_invalid_in_big_joiner_=28rev2?=
 =?utf-8?q?=29?=
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

--===============8116298732571163975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_cursor: Pipe-D is invalid in big joiner (rev2)
URL   : https://patchwork.freedesktop.org/series/119335/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7330 -> IGTPW_9175
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9175 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9175, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9175:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:
    - bat-dg2-8:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:
    - bat-dg2-8:          [PASS][4] -> [DMESG-WARN][5] +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - fi-kbl-7567u:       [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/fi-kbl-7567u/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_9175 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-11:        [PASS][8] -> [ABORT][9] ([i915#8011])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@core_auth@basic-auth.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-adlp-11/igt@core_auth@basic-auth.html

  * igt@i915_module_load@load:
    - bat-adlp-11:        [PASS][10] -> [DMESG-WARN][11] ([i915#4423])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@i915_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-adlp-11/igt@i915_module_load@load.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [PASS][12] -> [DMESG-FAIL][13] ([i915#8497])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-rpls-2:         NOTRUN -> [ABORT][14] ([i915#6687])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][15] -> [DMESG-WARN][16] ([i915#7507])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][17] -> [DMESG-WARN][18] ([i915#8585])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:
    - bat-dg2-8:          [PASS][19] -> [DMESG-FAIL][20] ([i915#7507])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][21] -> [FAIL][22] ([i915#7932]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][23] ([i915#5334]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
    - fi-kbl-soraka:      [DMESG-FAIL][25] ([i915#5334] / [i915#7872]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         [ABORT][27] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@reset.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:
    - bat-dg2-11:         [INCOMPLETE][29] ([i915#7908]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html

  
#### Warnings ####

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         [SKIP][31] ([i915#3555] / [i915#4579]) -> [ABORT][32] ([i915#4579] / [i915#8260])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7507]: https://gitlab.freedesktop.org/drm/intel/issues/7507
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7908]: https://gitlab.freedesktop.org/drm/intel/issues/7908
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7330 -> IGTPW_9175

  CI-20190529: 20190529
  CI_DRM_13270: a8b181a60198ccf04a1ad1c34f46be4c2a5e64b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9175: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/index.html
  IGT_7330: 592a0e56412b3323fb103ce3cc9977035c29f402 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/index.html

--===============8116298732571163975==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_cursor: Pipe-D is invalid in big joiner (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119335/">https://patchwork.freedesktop.org/series/119335/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7330 -&gt; IGTPW_9175</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9175 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9175, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9175:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1.html">DMESG-WARN</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/fi-kbl-7567u/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9175 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-adlp-11/igt@core_auth@basic-auth.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-mtlp-8/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7507">i915#7507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7507">i915#7507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7908">i915#7908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_setmode@basic-clone-single-crtc:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8260">i915#8260</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7330 -&gt; IGTPW_9175</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13270: a8b181a60198ccf04a1ad1c34f46be4c2a5e64b7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9175: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9175/index.html<br />
  IGT_7330: 592a0e56412b3323fb103ce3cc9977035c29f402 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8116298732571163975==--
