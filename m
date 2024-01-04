Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4458059496543551822=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_lib/intel=5Fmmio=3A_Allow_a?=
 =?utf-8?q?ccess_to_full_register_space_on_modern_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 04 Jan 2024 00:56:59 -0000
Message-ID: <170432981971.1406.9879779877066665561@5338d5abeb45>
References: <20240103234929.132148-1-matthew.d.roper@intel.com>
In-Reply-To: <20240103234929.132148-1-matthew.d.roper@intel.com>
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

--===============4458059496543551822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_mmio: Allow access to full register space on modern platforms
URL   : https://patchwork.freedesktop.org/series/128173/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14074 -> IGTPW_10471
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/index.html

Participating hosts (40 -> 36)
------------------------------

  Missing    (4): bat-rpls-2 bat-jsl-1 fi-snb-2520m fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_10471 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-adlm-1:         NOTRUN -> [SKIP][1] ([i915#9875] / [i915#9900])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-adlm-1:         [ABORT][2] -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14074/bat-adlm-1/igt@i915_selftest@live@hangcheck.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/bat-adlm-1/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - fi-rkl-11600:       [FAIL][4] ([fdo#103375]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14074/fi-rkl-11600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/fi-rkl-11600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#9875]: https://gitlab.freedesktop.org/drm/intel/issues/9875
  [i915#9900]: https://gitlab.freedesktop.org/drm/intel/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7655 -> IGTPW_10471

  CI-20190529: 20190529
  CI_DRM_14074: 50f4f5c97328bed06bd18802a896257326b06460 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10471: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/index.html
  IGT_7655: ddf7cf40a00caa7d02f3729e1e50f78f102463d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@kms_colorop@plane-ctm_3x4_50_desat
-igt@kms_colorop@plane-ctm_3x4_bt709_dec
-igt@kms_colorop@plane-ctm_3x4_bt709_dec_enc
-igt@kms_colorop@plane-ctm_3x4_bt709_enc
-igt@kms_colorop@plane-ctm_3x4_bt709_enc_dec
-igt@kms_colorop@plane-ctm_3x4_overdrive
-igt@kms_colorop@plane-ctm_3x4_oversaturate
-igt@kms_colorop@plane-srgb_eotf
-igt@kms_colorop@plane-srgb_eotf-srgb_inv_eotf
-igt@kms_colorop@plane-srgb_inv_eotf
-igt@kms_color@plane-ctm-0-25
-igt@kms_color@plane-ctm-0-50
-igt@kms_color@plane-ctm-0-75
-igt@kms_color@plane-ctm-blue-to-red
-igt@kms_color@plane-ctm-green-to-red
-igt@kms_color@plane-ctm-max
-igt@kms_color@plane-ctm-negative
-igt@kms_color@plane-ctm-red-to-blue
-igt@kms_color@plane-ctm-signed
-igt@kms_properties@colorop-properties-atomic

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/index.html

--===============4458059496543551822==
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
<tr><td><b>Series:</b></td><td>lib/intel_mmio: Allow access to full register space on modern platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128173/">https://patchwork.freedesktop.org/series/128173/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14074 -&gt; IGTPW_10471</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/index.html</p>
<h2>Participating hosts (40 -&gt; 36)</h2>
<p>Missing    (4): bat-rpls-2 bat-jsl-1 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10471 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc:<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/bat-adlm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9875">i915#9875</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14074/bat-adlm-1/igt@i915_selftest@live@hangcheck.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/bat-adlm-1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14074/fi-rkl-11600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/fi-rkl-11600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7655 -&gt; IGTPW_10471</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14074: 50f4f5c97328bed06bd18802a896257326b06460 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10471: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10471/index.html<br />
  IGT_7655: ddf7cf40a00caa7d02f3729e1e50f78f102463d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@kms_colorop@plane-ctm_3x4_50_desat<br />
-igt@kms_colorop@plane-ctm_3x4_bt709_dec<br />
-igt@kms_colorop@plane-ctm_3x4_bt709_dec_enc<br />
-igt@kms_colorop@plane-ctm_3x4_bt709_enc<br />
-igt@kms_colorop@plane-ctm_3x4_bt709_enc_dec<br />
-igt@kms_colorop@plane-ctm_3x4_overdrive<br />
-igt@kms_colorop@plane-ctm_3x4_oversaturate<br />
-igt@kms_colorop@plane-srgb_eotf<br />
-igt@kms_colorop@plane-srgb_eotf-srgb_inv_eotf<br />
-igt@kms_colorop@plane-srgb_inv_eotf<br />
-igt@kms_color@plane-ctm-0-25<br />
-igt@kms_color@plane-ctm-0-50<br />
-igt@kms_color@plane-ctm-0-75<br />
-igt@kms_color@plane-ctm-blue-to-red<br />
-igt@kms_color@plane-ctm-green-to-red<br />
-igt@kms_color@plane-ctm-max<br />
-igt@kms_color@plane-ctm-negative<br />
-igt@kms_color@plane-ctm-red-to-blue<br />
-igt@kms_color@plane-ctm-signed<br />
-igt@kms_properties@colorop-properties-atomic</p>

</body>
</html>

--===============4458059496543551822==--
