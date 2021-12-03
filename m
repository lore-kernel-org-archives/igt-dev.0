Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5243122582877621109=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Dec 2021 16:52:11 -0000
Message-ID: <163855033175.5406.17306837365455732204@emeril.freedesktop.org>
References: <20211203162853.14262-1-jeevan.b@intel.com>
In-Reply-To: <20211203162853.14262-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IGtt?=
 =?utf-8?q?s=5Fpsr2=5Fsf_test_and_add_new_test_for_FB=5FDAMAGE=5FCLIPS_pla?=
 =?utf-8?q?ne_property_=28rev5=29?=
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

--===============5243122582877621109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix kms_psr2_sf test and add new test for FB_DAMAGE_CLIPS plane property (rev5)
URL   : https://patchwork.freedesktop.org/series/94883/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10961 -> IGTPW_6465
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/index.html

Participating hosts (42 -> 34)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (9): fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus bat-jsl-2 bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_6465 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-rkl-guc:         NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bsw-nick:        NOTRUN -> [SKIP][2] ([fdo#109271]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@sync-fork-gfx0:
    - fi-skl-6600u:       NOTRUN -> [SKIP][3] ([fdo#109271]) +18 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-skl-6600u/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([fdo#109271]) +57 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_engines:
    - fi-rkl-guc:         [INCOMPLETE][5] ([i915#4432]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10961/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-nick:        [DMESG-FAIL][7] ([i915#2927] / [i915#3428]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10961/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [INCOMPLETE][9] ([i915#198] / [i915#4547]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10961/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#198]: https://gitlab.freedesktop.org/drm/intel/issues/198
  [i915#2927]: https://gitlab.freedesktop.org/drm/intel/issues/2927
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#4432]: https://gitlab.freedesktop.org/drm/intel/issues/4432
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6299 -> IGTPW_6465

  CI-20190529: 20190529
  CI_DRM_10961: e7bbdc541b4748718cd6ce8b839f3db335f3a0fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6465: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/index.html
  IGT_6299: 0933b7ccdb2bb054b6a8154171e35315d84299b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/index.html

--===============5243122582877621109==
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
<tr><td><b>Series:</b></td><td>Fix kms_psr2_sf test and add new test for FB_DAMAGE_CLIPS plane property (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94883/">https://patchwork.freedesktop.org/series/94883/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10961 -&gt; IGTPW_6465</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/index.html</p>
<h2>Participating hosts (42 -&gt; 34)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (9): fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus bat-jsl-2 bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6465 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-gfx0:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-skl-6600u/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10961/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4432">i915#4432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10961/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2927">i915#2927</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10961/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/198">i915#198</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6299 -&gt; IGTPW_6465</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10961: e7bbdc541b4748718cd6ce8b839f3db335f3a0fc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6465: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6465/index.html<br />
  IGT_6299: 0933b7ccdb2bb054b6a8154171e35315d84299b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============5243122582877621109==--
