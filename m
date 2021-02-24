Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Feb 2021 07:50:05 -0000
Message-ID: <161415300538.17225.9593276346604880885@emeril.freedesktop.org>
References: <20210223134924.10045-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210223134924.10045-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frmfb=3A_Use_COMMIT?=
 =?utf-8?q?=5FUNIVERSAL_for_overlay/cursor_planes?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1047509082=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1047509082==
Content-Type: multipart/alternative;
 boundary="===============3310244754150277757=="

--===============3310244754150277757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_rmfb: Use COMMIT_UNIVERSAL for overlay/cursor planes
URL   : https://patchwork.freedesktop.org/series/87318/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9798 -> IGTPW_5548
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/index.html

Known issues
------------

  Here are the changes found in IGTPW_5548 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_tiled_blits@basic:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9798/fi-tgl-y/igt@gem_tiled_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/fi-tgl-y/igt@gem_tiled_blits@basic.html

  
#### Possible fixes ####

  * igt@i915_hangman@error-state-basic:
    - fi-tgl-y:           [DMESG-WARN][3] ([i915#402]) -> [PASS][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9798/fi-tgl-y/igt@i915_hangman@error-state-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/fi-tgl-y/igt@i915_hangman@error-state-basic.html

  
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (45 -> 36)
------------------------------

  Missing    (9): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-cfl-guc fi-kbl-7500u fi-dg1-1 fi-bdw-samus fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6013 -> IGTPW_5548

  CI-20190529: 20190529
  CI_DRM_9798: 70e2e79cd772b97799f4cecd823539f452063562 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5548: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/index.html
  IGT_6013: a6c7181747850161377dae5161d33c0675ab273e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/index.html

--===============3310244754150277757==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_rmfb: Use COMMIT_UNIVERSAL for overlay/cursor planes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87318/">https://patchwork.freedesktop.org/series/87318/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9798 -&gt; IGTPW_5548</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5548 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_tiled_blits@basic:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9798/fi-tgl-y/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/fi-tgl-y/igt@gem_tiled_blits@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_hangman@error-state-basic:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9798/fi-tgl-y/igt@i915_hangman@error-state-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/fi-tgl-y/igt@i915_hangman@error-state-basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (45 -&gt; 36)</h2>
<p>Missing    (9): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-cfl-guc fi-kbl-7500u fi-dg1-1 fi-bdw-samus fi-kbl-r </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6013 -&gt; IGTPW_5548</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9798: 70e2e79cd772b97799f4cecd823539f452063562 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5548: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5548/index.html<br />
  IGT_6013: a6c7181747850161377dae5161d33c0675ab273e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3310244754150277757==--

--===============1047509082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1047509082==--
