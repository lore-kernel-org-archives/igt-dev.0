Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8723188899921985816=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 13 Oct 2021 17:53:04 -0000
Message-ID: <163414758477.10252.16512471476680281141@emeril.freedesktop.org>
References: <20211013171051.26287-1-jeevan.b@intel.com>
In-Reply-To: <20211013171051.26287-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IGtt?=
 =?utf-8?q?s=5Fpsr2=5Fsf_test_and_add_new_test_for_FB=5FDAMAGE=5FCLIPS_pla?=
 =?utf-8?q?ne_property_=28rev2=29?=
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
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8723188899921985816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix kms_psr2_sf test and add new test for FB_DAMAGE_CLIPS plane property (rev2)
URL   : https://patchwork.freedesktop.org/series/94883/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10732 -> IGTPW_6316
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/index.html

Known issues
------------

  Here are the changes found in IGTPW_6316 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-apl-guc:         NOTRUN -> [SKIP][1] ([fdo#109271]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-apl-guc/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-1115g4:      [PASS][2] -> [FAIL][3] ([i915#1888])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10732/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_hangman@error-state-basic:
    - fi-apl-guc:         NOTRUN -> [DMESG-WARN][4] ([i915#1610])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-apl-guc/igt@i915_hangman@error-state-basic.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-skl-6600u:       [PASS][5] -> [FAIL][6] ([i915#3049])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10732/fi-skl-6600u/igt@i915_pm_rpm@basic-rte.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-skl-6600u/igt@i915_pm_rpm@basic-rte.html

  * igt@runner@aborted:
    - fi-apl-guc:         NOTRUN -> [FAIL][7] ([i915#2426] / [i915#3363])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-apl-guc/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - {fi-hsw-gt1}:       [DMESG-WARN][8] ([i915#3303]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10732/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-kbl-7500u:       [FAIL][10] ([i915#1161]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10732/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][12] ([i915#4269]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10732/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#3049]: https://gitlab.freedesktop.org/drm/intel/issues/3049
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269


Participating hosts (41 -> 38)
------------------------------

  Additional (1): fi-apl-guc 
  Missing    (4): fi-kbl-soraka fi-jsl-1 fi-bsw-cyan fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6243 -> IGTPW_6316

  CI-20190529: 20190529
  CI_DRM_10732: 3fdfa1de4774903b9cb4fb308102b5a2d762d829 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6316: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/index.html
  IGT_6243: 438788b5dbd23085745fdd3da5a237f3577945df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_atomic@atomic_plane_damage
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area
+igt@kms_psr2_sf@plane-move-sf-dmg-area
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5
-igt@kms_psr2_sf@plane-move-sf-dmg-area-0
-igt@kms_psr2_sf@plane-move-sf-dmg-area-1
-igt@kms_psr2_sf@plane-move-sf-dmg-area-2
-igt@kms_psr2_sf@plane-move-sf-dmg-area-3
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/index.html

--===============8723188899921985816==
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
<tr><td><b>Series:</b></td><td>Fix kms_psr2_sf test and add new test for FB_DAMAGE_CLIPS plane property (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94883/">https://patchwork.freedesktop.org/series/94883/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10732 -&gt; IGTPW_6316</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6316 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-apl-guc/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10732/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-apl-guc/igt@i915_hangman@error-state-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10732/fi-skl-6600u/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-skl-6600u/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3049">i915#3049</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-apl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10732/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10732/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-kbl-7500u/igt@kms_chamelium@hdmi-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10732/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Additional (1): fi-apl-guc <br />
  Missing    (4): fi-kbl-soraka fi-jsl-1 fi-bsw-cyan fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6243 -&gt; IGTPW_6316</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10732: 3fdfa1de4774903b9cb4fb308102b5a2d762d829 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6316: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6316/index.html<br />
  IGT_6243: 438788b5dbd23085745fdd3da5a237f3577945df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_atomic@atomic_plane_damage<br />
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area<br />
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area<br />
+igt@kms_psr2_sf@plane-move-sf-dmg-area<br />
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area<br />
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1<br />
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2<br />
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3<br />
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4<br />
-igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5<br />
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1<br />
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2<br />
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3<br />
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4<br />
-igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5<br />
-igt@kms_psr2_sf@plane-move-sf-dmg-area-0<br />
-igt@kms_psr2_sf@plane-move-sf-dmg-area-1<br />
-igt@kms_psr2_sf@plane-move-sf-dmg-area-2<br />
-igt@kms_psr2_sf@plane-move-sf-dmg-area-3<br />
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1<br />
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2<br />
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3<br />
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4<br />
-igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5</p>

</body>
</html>

--===============8723188899921985816==--
