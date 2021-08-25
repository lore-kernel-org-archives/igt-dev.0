Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5655782472166459358=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Aug 2021 13:14:29 -0000
Message-ID: <162989726913.17675.1429481631333723139@emeril.freedesktop.org>
References: <20210713120016.463320-1-stylon.wang@amd.com>
In-Reply-To: <20210713120016.463320-1-stylon.wang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgTmV3IHRl?=
 =?utf-8?q?sts_for_ASSR_Content_Protection_on_DP/eDP_=28rev5=29?=
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
To: Stylon Wang <stylon.wang@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============5655782472166459358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New tests for ASSR Content Protection on DP/eDP (rev5)
URL   : https://patchwork.freedesktop.org/series/92472/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10519 -> IGTPW_6154
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/index.html

Known issues
------------

  Here are the changes found in IGTPW_6154 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-8700k:       [PASS][1] -> [DMESG-FAIL][2] ([i915#2291] / [i915#541])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/fi-cfl-8700k/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/fi-cfl-8700k/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#2203] / [i915#2868])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-rkl-11600:       [SKIP][5] ([i915#3919]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3919]: https://gitlab.freedesktop.org/drm/intel/issues/3919
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (40 -> 33)
------------------------------

  Missing    (7): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-tgl-1115g4 fi-bsw-cyan fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6185 -> IGTPW_6154

  CI-20190529: 20190529
  CI_DRM_10519: 3edb12bf2c3cd732bc930e3e418e4aeaaaf32ffa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6154: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/index.html
  IGT_6185: 5dca04416f50576f464ebbd9aea96edccd7e4eab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@amdgpu/amd_assr@assr-links
+igt@amdgpu/amd_assr@assr-links-dpms
+igt@amdgpu/amd_assr@assr-links-suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/index.html

--===============5655782472166459358==
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
<tr><td><b>Series:</b></td><td>New tests for ASSR Content Protection on DP/eDP (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92472/">https://patchwork.freedesktop.org/series/92472/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10519 -&gt; IGTPW_6154</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6154 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/fi-cfl-8700k/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/fi-cfl-8700k/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3919">i915#3919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (40 -&gt; 33)</h2>
<p>Missing    (7): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-tgl-1115g4 fi-bsw-cyan fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6185 -&gt; IGTPW_6154</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10519: 3edb12bf2c3cd732bc930e3e418e4aeaaaf32ffa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6154: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6154/index.html<br />
  IGT_6185: 5dca04416f50576f464ebbd9aea96edccd7e4eab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@amdgpu/amd_assr@assr-links<br />
+igt@amdgpu/amd_assr@assr-links-dpms<br />
+igt@amdgpu/amd_assr@assr-links-suspend</p>

</body>
</html>

--===============5655782472166459358==--
