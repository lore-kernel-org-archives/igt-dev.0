Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Feb 2021 09:33:27 -0000
Message-ID: <161415920738.17226.2651068419708818757@emeril.freedesktop.org>
References: <20210223210950.13515-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210223210950.13515-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_tests/kms=5Fconcurrent=3A_Actu?=
 =?utf-8?q?ally_seed_the_rng?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1189210774=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1189210774==
Content-Type: multipart/alternative;
 boundary="===============3901602158408124921=="

--===============3901602158408124921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] tests/kms_concurrent: Actually seed the rng
URL   : https://patchwork.freedesktop.org/series/87330/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9798 -> IGTPW_5550
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/index.html

Known issues
------------

  Here are the changes found in IGTPW_5550 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9798/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7500u:       [PASS][3] -> [INCOMPLETE][4] ([i915#151] / [i915#2405])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9798/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html

  * igt@runner@aborted:
    - fi-kbl-7500u:       NOTRUN -> [FAIL][5] ([fdo#109271] / [i915#1814] / [i915#2722])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/fi-kbl-7500u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_hangman@error-state-basic:
    - fi-tgl-y:           [DMESG-WARN][6] ([i915#402]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9798/fi-tgl-y/igt@i915_hangman@error-state-basic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/fi-tgl-y/igt@i915_hangman@error-state-basic.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (45 -> 40)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6013 -> IGTPW_5550

  CI-20190529: 20190529
  CI_DRM_9798: 70e2e79cd772b97799f4cecd823539f452063562 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5550: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/index.html
  IGT_6013: a6c7181747850161377dae5161d33c0675ab273e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_ccs@pipe-a-random-ccs-data
+igt@kms_ccs@pipe-b-random-ccs-data
+igt@kms_ccs@pipe-c-random-ccs-data
+igt@kms_ccs@pipe-d-random-ccs-data
+igt@kms_ccs@pipe-e-random-ccs-data
+igt@kms_ccs@pipe-f-random-ccs-data

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/index.html

--===============3901602158408124921==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] tests/kms_concurrent: Actually seed the rng</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87330/">https://patchwork.freedesktop.org/series/87330/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9798 -&gt; IGTPW_5550</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5550 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9798/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9798/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/151">i915#151</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_hangman@error-state-basic:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9798/fi-tgl-y/igt@i915_hangman@error-state-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/fi-tgl-y/igt@i915_hangman@error-state-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (45 -&gt; 40)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6013 -&gt; IGTPW_5550</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9798: 70e2e79cd772b97799f4cecd823539f452063562 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5550: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5550/index.html<br />
  IGT_6013: a6c7181747850161377dae5161d33c0675ab273e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_ccs@pipe-a-random-ccs-data<br />
+igt@kms_ccs@pipe-b-random-ccs-data<br />
+igt@kms_ccs@pipe-c-random-ccs-data<br />
+igt@kms_ccs@pipe-d-random-ccs-data<br />
+igt@kms_ccs@pipe-e-random-ccs-data<br />
+igt@kms_ccs@pipe-f-random-ccs-data</p>

</body>
</html>

--===============3901602158408124921==--

--===============1189210774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1189210774==--
