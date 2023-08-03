Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6345144233528540016=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Thu, 03 Aug 2023 06:09:33 -0000
Message-ID: <169104297312.5268.15162833082029939179@emeril.freedesktop.org>
References: <20230803050609.2835714-1-riana.tauro@intel.com>
In-Reply-To: <20230803050609.2835714-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUkZDIE1v?=
 =?utf-8?q?dify_igt=5Fpm_functions_and_add_GT_C6_freeze_test?=
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

--===============6345144233528540016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC Modify igt_pm functions and add GT C6 freeze test
URL   : https://patchwork.freedesktop.org/series/121921/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13463 -> IGTPW_9500
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/index.html

Participating hosts (42 -> 15)
------------------------------

  Missing    (27): fi-kbl-soraka fi-rkl-11600 bat-adls-5 bat-dg1-5 fi-snb-2520m fi-apl-guc fi-pnv-d510 fi-blb-e6850 bat-rpls-2 fi-skl-6600u bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-ilk-650 bat-adln-1 fi-ivb-3770 fi-kbl-7567u bat-adlp-9 fi-glk-j4005 bat-jsl-1 bat-mtlp-6 bat-mtlp-8 bat-adlp-11 fi-tgl-1115g4 fi-kbl-guc fi-kbl-x1275 bat-dg2-14 

Known issues
------------

  Here are the changes found in IGTPW_9500 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][1] -> [FAIL][2] ([i915#7940]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@dmabuf:
    - fi-bsw-nick:        [PASS][3] -> [DMESG-FAIL][4] ([i915#7562] / [i915#7913])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html

  * igt@kms_psr@cursor_plane_move:
    - bat-rplp-1:         NOTRUN -> [SKIP][5] ([i915#1072])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/bat-rplp-1/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rplp-1:         NOTRUN -> [ABORT][6] ([i915#8442] / [i915#8668] / [i915#8712])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-cfl-8700k:       [FAIL][7] ([i915#7940]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8700k/igt@i915_pm_rpm@basic-rte.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/fi-cfl-8700k/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@guc:
    - bat-rpls-1:         [DMESG-WARN][9] ([i915#7852]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-1/igt@i915_selftest@live@guc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/bat-rpls-1/igt@i915_selftest@live@guc.html

  
#### Warnings ####

  * igt@kms_psr@primary_page_flip:
    - bat-rplp-1:         [ABORT][11] ([i915#8860]) -> [SKIP][12] ([i915#1072])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rplp-1/igt@kms_psr@primary_page_flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/bat-rplp-1/igt@kms_psr@primary_page_flip.html

  
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#7562]: https://gitlab.freedesktop.org/drm/intel/issues/7562
  [i915#7852]: https://gitlab.freedesktop.org/drm/intel/issues/7852
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8712]: https://gitlab.freedesktop.org/drm/intel/issues/8712
  [i915#8860]: https://gitlab.freedesktop.org/drm/intel/issues/8860


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7412 -> IGTPW_9500

  CI-20190529: 20190529
  CI_DRM_13463: 20610a111d61d6945d578360942dc5c7bd828eb5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9500: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/index.html
  IGT_7412: 7412


Testlist changes
----------------

+igt@xe_pm_residency@gt-c6-freeze
-igt@msm_submitoverhead@submitbench-10-bos
-igt@msm_submitoverhead@submitbench-10-bos-no-implicit-sync
-igt@msm_submitoverhead@submitbench-100-bos
-igt@msm_submitoverhead@submitbench-100-bos-no-implicit-sync
-igt@msm_submitoverhead@submitbench-250-bos
-igt@msm_submitoverhead@submitbench-250-bos-no-implicit-sync
-igt@msm_submitoverhead@submitbench-500-bos
-igt@msm_submitoverhead@submitbench-500-bos-no-implicit-sync
-igt@msm_submitoverhead@submitbench-1000-bos
-igt@msm_submitoverhead@submitbench-1000-bos-no-implicit-sync

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/index.html

--===============6345144233528540016==
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
<tr><td><b>Series:</b></td><td>RFC Modify igt_pm functions and add GT C6 freeze test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121921/">https://patchwork.freedesktop.org/series/121921/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13463 -&gt; IGTPW_9500</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/index.html</p>
<h2>Participating hosts (42 -&gt; 15)</h2>
<p>Missing    (27): fi-kbl-soraka fi-rkl-11600 bat-adls-5 bat-dg1-5 fi-snb-2520m fi-apl-guc fi-pnv-d510 fi-blb-e6850 bat-rpls-2 fi-skl-6600u bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-ilk-650 bat-adln-1 fi-ivb-3770 fi-kbl-7567u bat-adlp-9 fi-glk-j4005 bat-jsl-1 bat-mtlp-6 bat-mtlp-8 bat-adlp-11 fi-tgl-1115g4 fi-kbl-guc fi-kbl-x1275 bat-dg2-14 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9500 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7562">i915#7562</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8712">i915#8712</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/fi-cfl-8700k/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/fi-cfl-8700k/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rpls-1/igt@i915_selftest@live@guc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7852">i915#7852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/bat-rpls-1/igt@i915_selftest@live@guc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@primary_page_flip:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13463/bat-rplp-1/igt@kms_psr@primary_page_flip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8860">i915#8860</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/bat-rplp-1/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7412 -&gt; IGTPW_9500</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13463: 20610a111d61d6945d578360942dc5c7bd828eb5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9500: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9500/index.html<br />
  IGT_7412: 7412</p>
<h2>Testlist changes</h2>
<p>+igt@xe_pm_residency@gt-c6-freeze<br />
-igt@msm_submitoverhead@submitbench-10-bos<br />
-igt@msm_submitoverhead@submitbench-10-bos-no-implicit-sync<br />
-igt@msm_submitoverhead@submitbench-100-bos<br />
-igt@msm_submitoverhead@submitbench-100-bos-no-implicit-sync<br />
-igt@msm_submitoverhead@submitbench-250-bos<br />
-igt@msm_submitoverhead@submitbench-250-bos-no-implicit-sync<br />
-igt@msm_submitoverhead@submitbench-500-bos<br />
-igt@msm_submitoverhead@submitbench-500-bos-no-implicit-sync<br />
-igt@msm_submitoverhead@submitbench-1000-bos<br />
-igt@msm_submitoverhead@submitbench-1000-bos-no-implicit-sync</p>

</body>
</html>

--===============6345144233528540016==--
