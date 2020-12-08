Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 08 Dec 2020 19:31:13 -0000
Message-ID: <160745587343.9599.3392888587396897237@emeril.freedesktop.org>
References: <20201208170109.23073-1-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20201208170109.23073-1-pankaj.laxminarayan.bharadiya@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIEZC?=
 =?utf-8?q?=5FDAMAGE=5FCLIPS_prop_and_new_test_for_Selective_fetch?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1008445099=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1008445099==
Content-Type: multipart/alternative;
 boundary="===============8815780374171537813=="

--===============8815780374171537813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add FB_DAMAGE_CLIPS prop and new test for Selective fetch
URL   : https://patchwork.freedesktop.org/series/84696/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9462 -> IGTPW_5262
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/index.html

Known issues
------------

  Here are the changes found in IGTPW_5262 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [PASS][1] -> [SKIP][2] ([fdo#109271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9462/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][3] ([i915#1161] / [i915#262]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9462/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262


Participating hosts (43 -> 38)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-dg1-1 fi-tgl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5885 -> IGTPW_5262

  CI-20190529: 20190529
  CI_DRM_9462: b358df960435469848e291bbebbeb4eca1ff32af @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5262: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/index.html
  IGT_5885: d99f644b1868b9c92435b05ebfafa230721cd677 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_psr2_sf@cursor-plane-update-sf
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5
+igt@kms_psr2_sf@plane-move-sf-dmg-area-0
+igt@kms_psr2_sf@plane-move-sf-dmg-area-1
+igt@kms_psr2_sf@plane-move-sf-dmg-area-2
+igt@kms_psr2_sf@plane-move-sf-dmg-area-3
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/index.html

--===============8815780374171537813==
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
<tr><td><b>Series:</b></td><td>Add FB_DAMAGE_CLIPS prop and new test for Selective fetch</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84696/">https://patchwork.freedesktop.org/series/84696/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9462 -&gt; IGTPW_5262</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5262 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9462/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium@dp-crc-fast:<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9462/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 38)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-dg1-1 fi-tgl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5885 -&gt; IGTPW_5262</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9462: b358df960435469848e291bbebbeb4eca1ff32af @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5262: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5262/index.html<br />
  IGT_5885: d99f644b1868b9c92435b05ebfafa230721cd677 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_psr2_sf@cursor-plane-update-sf<br />
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1<br />
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2<br />
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3<br />
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4<br />
+igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5<br />
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1<br />
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2<br />
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3<br />
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4<br />
+igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5<br />
+igt@kms_psr2_sf@plane-move-sf-dmg-area-0<br />
+igt@kms_psr2_sf@plane-move-sf-dmg-area-1<br />
+igt@kms_psr2_sf@plane-move-sf-dmg-area-2<br />
+igt@kms_psr2_sf@plane-move-sf-dmg-area-3<br />
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1<br />
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2<br />
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3<br />
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4<br />
+igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5</p>

</body>
</html>

--===============8815780374171537813==--

--===============1008445099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1008445099==--
