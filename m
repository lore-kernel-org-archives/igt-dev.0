Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4542021409305499833=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Tue, 05 Sep 2023 20:10:55 -0000
Message-ID: <169394465533.19171.16746409600213918650@emeril.freedesktop.org>
References: <20230905185146.76834-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230905185146.76834-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2Ft?=
 =?utf-8?q?dgpu=3A_add_GFX1036=2C_GFX1037_chips_for_IGT_tests?=
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

--===============4542021409305499833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: add GFX1036, GFX1037 chips for IGT tests
URL   : https://patchwork.freedesktop.org/series/123298/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13599 -> IGTPW_9726
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/index.html

Participating hosts (38 -> 35)
------------------------------

  Missing    (3): fi-hsw-4770 bat-dg2-9 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9726 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-dp6:
    - bat-adlp-11:        NOTRUN -> [FAIL][1] ([i915#6121]) +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html

  * igt@kms_flip@basic-plain-flip@d-dp5:
    - bat-adlp-11:        [PASS][2] -> [DMESG-WARN][3] ([i915#6868])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-plain-flip@d-dp5.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-adlp-11/igt@kms_flip@basic-plain-flip@d-dp5.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][4] ([i915#1845]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][5] ([i915#7952]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - {bat-dg2-13}:       [DMESG-WARN][7] ([Intel XE#485]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:
    - bat-adlp-11:        [FAIL][9] ([i915#6121]) -> [PASS][10] +4 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5:
    - bat-adlp-11:        [DMESG-WARN][11] ([i915#6868]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [FAIL][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7468 -> IGTPW_9726

  CI-20190529: 20190529
  CI_DRM_13599: 58fe10f34e80d0eeb5609128faa135260623a715 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9726: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/index.html
  IGT_7468: 7468

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/index.html

--===============4542021409305499833==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: add GFX1036, GFX1037 chips for IGT tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123298/">https://patchwork.freedesktop.org/series/123298/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13599 -&gt; IGTPW_9726</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): fi-hsw-4770 bat-dg2-9 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9726 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp6:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-plain-flip@d-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-adlp-11/igt@kms_flip@basic-plain-flip@d-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/485">Intel XE#485</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7468 -&gt; IGTPW_9726</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13599: 58fe10f34e80d0eeb5609128faa135260623a715 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9726: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9726/index.html<br />
  IGT_7468: 7468</p>

</body>
</html>

--===============4542021409305499833==--
