Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6255145830115954571=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ryszard Knop" <ryszard.knop@intel.com>
Date: Thu, 01 Sep 2022 09:30:20 -0000
Message-ID: <166202462025.11919.15318835354665562382@emeril.freedesktop.org>
References: <20220901090431.110527-1-ryszard.knop@intel.com>
In-Reply-To: <20220901090431.110527-1-ryszard.knop@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Don=27t_free_uninitialized_pointers_in_add=5Fenv=5Fvar?=
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

--===============6255145830115954571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Don't free uninitialized pointers in add_env_var
URL   : https://patchwork.freedesktop.org/series/108009/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12058 -> IGTPW_7717
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/index.html

Participating hosts (37 -> 34)
------------------------------

  Missing    (3): fi-adl-ddr5 fi-rkl-11600 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7717 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][1] -> [INCOMPLETE][2] ([i915#4785])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12058/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][3] -> [DMESG-FAIL][4] ([i915#4528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12058/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-g3258:       NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][6] ([i915#5594] / [i915#6246])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-hsw-4770/igt@runner@aborted.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][7] ([fdo#109271] / [i915#2403] / [i915#4312])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [INCOMPLETE][8] ([i915#3303] / [i915#4785]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12058/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6639 -> IGTPW_7717

  CI-20190529: 20190529
  CI_DRM_12058: 2ef8278465adc6572e0d22dffbaa332d56b4b40c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7717: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/index.html
  IGT_6639: ba61c48dba71d5597d7297a07dc3e307665f961b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/index.html

--===============6255145830115954571==
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
<tr><td><b>Series:</b></td><td>runner: Don&#39;t free uninitialized pointers in add_env_var</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108009/">https://patchwork.freedesktop.org/series/108009/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12058 -&gt; IGTPW_7717</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/index.html</p>
<h2>Participating hosts (37 -&gt; 34)</h2>
<p>Missing    (3): fi-adl-ddr5 fi-rkl-11600 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7717 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12058/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12058/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12058/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6639 -&gt; IGTPW_7717</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12058: 2ef8278465adc6572e0d22dffbaa332d56b4b40c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7717: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7717/index.html<br />
  IGT_6639: ba61c48dba71d5597d7297a07dc3e307665f961b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6255145830115954571==--
