Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6601864024781855316=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Mon, 17 Oct 2022 06:08:49 -0000
Message-ID: <166598692943.13567.16682712534625253738@emeril.freedesktop.org>
References: <20221017053524.2538178-1-riana.tauro@intel.com>
In-Reply-To: <20221017053524.2538178-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIGh3?=
 =?utf-8?q?mon_energy_support_for_dgfx_=28rev5=29?=
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

--===============6601864024781855316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add hwmon energy support for dgfx (rev5)
URL   : https://patchwork.freedesktop.org/series/108185/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12250 -> IGTPW_7968
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7968 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7968, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.html

Participating hosts (45 -> 42)
------------------------------

  Additional (1): fi-rkl-guc 
  Missing    (4): fi-bdw-samus fi-icl-u2 fi-skl-6700k2 fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7968:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-rkl-guc:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-rkl-guc/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {fi-tgl-dsi}:       [INCOMPLETE][2] ([i915#7190]) -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/fi-tgl-dsi/igt@i915_pm_rpm@module-reload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-tgl-dsi/igt@i915_pm_rpm@module-reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_7968 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - fi-elk-e7500:       NOTRUN -> [SKIP][4] ([fdo#109271]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][5] ([fdo#109271]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - fi-ilk-650:         NOTRUN -> [SKIP][6] ([fdo#109271]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - fi-snb-2600:        NOTRUN -> [FAIL][7] ([fdo#103375])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-snb-2600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-bdw-gvtdvm:      [FAIL][8] ([fdo#103375]) -> [INCOMPLETE][9] ([i915#146])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/fi-bdw-gvtdvm/igt@i915_suspend@basic-s3-without-i915.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-bdw-gvtdvm/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#7190]: https://gitlab.freedesktop.org/drm/intel/issues/7190


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7016 -> IGTPW_7968

  CI-20190529: 20190529
  CI_DRM_12250: 9b84132c9b266a89e2865cbe8b586dd0b14cc2a4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7968: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.html
  IGT_7016: 642f4bf44e2b42791b4d1684936a1bfbe2d099ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.html

--===============6601864024781855316==
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
<tr><td><b>Series:</b></td><td>Add hwmon energy support for dgfx (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108185/">https://patchwork.freedesktop.org/series/108185/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12250 -&gt; IGTPW_7968</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7968 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7968, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.html</p>
<h2>Participating hosts (45 -&gt; 42)</h2>
<p>Additional (1): fi-rkl-guc <br />
  Missing    (4): fi-bdw-samus fi-icl-u2 fi-skl-6700k2 fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7968:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-rkl-guc/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/fi-tgl-dsi/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7190">i915#7190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-tgl-dsi/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7968 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-snb-2600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/fi-bdw-gvtdvm/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/fi-bdw-gvtdvm/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7016 -&gt; IGTPW_7968</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12250: 9b84132c9b266a89e2865cbe8b586dd0b14cc2a4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7968: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7968/index.html<br />
  IGT_7016: 642f4bf44e2b42791b4d1684936a1bfbe2d099ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6601864024781855316==--
