Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8358804875127964588=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 12 Oct 2023 12:59:32 -0000
Message-ID: <169711557235.25006.16656912158963933279@emeril.freedesktop.org>
References: <20231011044052.53282-1-swati2.sharma@intel.com>
In-Reply-To: <20231011044052.53282-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/kms=5Fbig=5Ffb=3A_skip_if_rendercopy_support_is_not_prese?=
 =?utf-8?q?nt?=
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

--===============8358804875127964588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_big_fb: skip if rendercopy support is not present
URL   : https://patchwork.freedesktop.org/series/124936/
State : success

== Summary ==

CI Bug Log - changes from IGT_7528 -> IGTPW_9968
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/index.html

Participating hosts (39 -> 33)
------------------------------

  Missing    (6): fi-kbl-soraka fi-bsw-n3050 bat-dg2-8 bat-dg2-9 fi-hsw-4770 fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_9968 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-11:         [PASS][1] -> [ABORT][2] ([i915#9523])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7528/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/bat-dg2-11/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [PASS][3] -> [DMESG-FAIL][4] ([i915#9500])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7528/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [PASS][5] -> [FAIL][6] ([IGT#3])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7528/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [FAIL][7] ([i915#9276]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7528/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][9] ([i915#8668]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7528/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276
  [i915#9500]: https://gitlab.freedesktop.org/drm/intel/issues/9500
  [i915#9523]: https://gitlab.freedesktop.org/drm/intel/issues/9523


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7528 -> IGTPW_9968

  CI-20190529: 20190529
  CI_DRM_13737: c768959add20d28639e5bfa4cea2544aab51879e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9968: 9968
  IGT_7528: 5c8af52f630edfea70624d2bd71b32280a53c8f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/index.html

--===============8358804875127964588==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_big_fb: skip if rendercopy support is not present</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124936/">https://patchwork.freedesktop.org/series/124936/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7528 -&gt; IGTPW_9968</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/index.html</p>
<h2>Participating hosts (39 -&gt; 33)</h2>
<p>Missing    (6): fi-kbl-soraka fi-bsw-n3050 bat-dg2-8 bat-dg2-9 fi-hsw-4770 fi-pnv-d510 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9968 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7528/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9523">i915#9523</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7528/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9500">i915#9500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7528/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7528/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7528/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9968/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7528 -&gt; IGTPW_9968</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13737: c768959add20d28639e5bfa4cea2544aab51879e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9968: 9968<br />
  IGT_7528: 5c8af52f630edfea70624d2bd71b32280a53c8f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8358804875127964588==--
