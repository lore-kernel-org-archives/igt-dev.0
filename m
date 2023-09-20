Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2148808025065484755=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Wed, 20 Sep 2023 11:26:01 -0000
Message-ID: <169520916187.6464.329377382234164036@emeril.freedesktop.org>
References: <20230920103128.1016220-1-jeevan.b@intel.com>
In-Reply-To: <20230920103128.1016220-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsetmode=3A_Add_info_as_comment_for_valid_scenario_=28rev2?=
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

--===============2148808025065484755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Add info as comment for valid scenario (rev2)
URL   : https://patchwork.freedesktop.org/series/123952/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13653 -> IGTPW_9830
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9830 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][1] ([i915#7952]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13653/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - {bat-dg2-13}:       [DMESG-WARN][3] ([Intel XE#485]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13653/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][5] ([IGT#3] / [i915#6121]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13653/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7493 -> IGTPW_9830

  CI-20190529: 20190529
  CI_DRM_13653: 56d487b04d902a227f8bc5cc93b73a71f7c06a12 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9830: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/index.html
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/index.html

--===============2148808025065484755==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Add info as comment for valid scenario (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123952/">https://patchwork.freedesktop.org/series/123952/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13653 -&gt; IGTPW_9830</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9830 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13653/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13653/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/485">Intel XE#485</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13653/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7493 -&gt; IGTPW_9830</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13653: 56d487b04d902a227f8bc5cc93b73a71f7c06a12 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9830: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9830/index.html<br />
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2148808025065484755==--
