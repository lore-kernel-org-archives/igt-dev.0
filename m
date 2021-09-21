Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3715588460725056134=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Sep 2021 09:01:59 -0000
Message-ID: <163221491961.15888.18287071826299309625@emeril.freedesktop.org>
References: <20210921075749.13049-1-jeevan.b@intel.com>
In-Reply-To: <20210921075749.13049-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IGtt?=
 =?utf-8?q?s=5Fpsr2=5Fsf_test_and_add_new_test_for_FB=5FDAMAGE=5FCLIPS_pla?=
 =?utf-8?q?ne_property?=
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

--===============3715588460725056134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix kms_psr2_sf test and add new test for FB_DAMAGE_CLIPS plane property
URL   : https://patchwork.freedesktop.org/series/94883/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10616 -> IGTPW_6242
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/index.html

New tests
---------

  New tests have been introduced between CI_DRM_10616 and IGTPW_6242:

### New IGT tests (1) ###

  * igt@core_hotunplug@unbind-rebind:
    - Statuses : 4 incomplete(s) 22 pass(s) 2 warn(s)
    - Exec time: [0.0, 6.43] s

  

Known issues
------------

  Here are the changes found in IGTPW_6242 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bsw-nick:        NOTRUN -> [SKIP][2] ([fdo#109271]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_basic@userptr:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][3] ([fdo#109271]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bxt-dsi/igt@amdgpu/amd_basic@userptr.html

  * igt@amdgpu/amd_cs_nop@sync-fork-gfx0:
    - fi-skl-6600u:       NOTRUN -> [SKIP][4] ([fdo#109271]) +17 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-skl-6600u/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html

  * igt@core_hotunplug@unbind-rebind (NEW):
    - fi-rkl-guc:         [PASS][5] -> [INCOMPLETE][6] ([i915#4130] / [i915#4136])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-icl-u2:          [INCOMPLETE][7] ([i915#4130]) -> [INCOMPLETE][8] ([i915#4130] / [i915#4136])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-7500u:       [PASS][9] -> [INCOMPLETE][10] ([i915#4130] / [i915#4136])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-7567u:       [PASS][11] -> [INCOMPLETE][12] ([i915#4130])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       NOTRUN -> [INCOMPLETE][13] ([i915#4136])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-cfl-8109u/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-snb-2600:        NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-snb-2600/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        NOTRUN -> [INCOMPLETE][15] ([i915#3921])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][16] -> [DMESG-WARN][17] ([i915#2868])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind (NEW):
    - fi-bxt-dsi:         [INCOMPLETE][18] ([i915#4130]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-bxt-dsi/igt@core_hotunplug@unbind-rebind.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bxt-dsi/igt@core_hotunplug@unbind-rebind.html
    - fi-cfl-8109u:       [INCOMPLETE][20] ([i915#4130]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@reload:
    - fi-skl-6600u:       [INCOMPLETE][22] ([i915#4130]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-skl-6600u/igt@i915_module_load@reload.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-skl-6600u/igt@i915_module_load@reload.html
    - fi-bsw-kefka:       [INCOMPLETE][24] ([i915#4179]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-bsw-kefka/igt@i915_module_load@reload.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bsw-kefka/igt@i915_module_load@reload.html
    - fi-snb-2600:        [INCOMPLETE][26] ([i915#4179]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-snb-2600/igt@i915_module_load@reload.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-snb-2600/igt@i915_module_load@reload.html
    - fi-icl-y:           [TIMEOUT][28] ([i915#4136]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-icl-y/igt@i915_module_load@reload.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-icl-y/igt@i915_module_load@reload.html
    - fi-bsw-nick:        [INCOMPLETE][30] ([i915#4179]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-bsw-nick/igt@i915_module_load@reload.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bsw-nick/igt@i915_module_load@reload.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-cml-u2:          [INCOMPLETE][32] ([i915#4130]) -> [INCOMPLETE][33] ([i915#4130] / [i915#4136])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-cml-u2/igt@i915_module_load@reload.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-cml-u2/igt@i915_module_load@reload.html
    - fi-kbl-soraka:      [INCOMPLETE][34] ([i915#4130]) -> [INCOMPLETE][35] ([i915#4136])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-kbl-soraka/igt@i915_module_load@reload.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-kbl-soraka/igt@i915_module_load@reload.html
    - fi-glk-dsi:         [INCOMPLETE][36] ([i915#4130]) -> [INCOMPLETE][37] ([i915#4130] / [i915#4136])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-glk-dsi/igt@i915_module_load@reload.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-glk-dsi/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4130]: https://gitlab.freedesktop.org/drm/intel/issues/4130
  [i915#4136]: https://gitlab.freedesktop.org/drm/intel/issues/4136
  [i915#4179]: https://gitlab.freedesktop.org/drm/intel/issues/4179


Participating hosts (35 -> 30)
------------------------------

  Missing    (5): fi-rkl-11600 bat-dg1-6 fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6213 -> IGTPW_6242

  CI-20190529: 20190529
  CI_DRM_10616: fd5d67615e07f5c10424ca704cb0c0243ea77643 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6242: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/index.html
  IGT_6213: e9ae59cb8b4f1e7bc61a9261f33fc7e52ae06c65 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/index.html

--===============3715588460725056134==
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
<tr><td><b>Series:</b></td><td>Fix kms_psr2_sf test and add new test for FB_DAMAGE_CLIPS plane property</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94883/">https://patchwork.freedesktop.org/series/94883/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10616 -&gt; IGTPW_6242</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10616 and IGTPW_6242:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>Statuses : 4 incomplete(s) 22 pass(s) 2 warn(s)</li>
<li>Exec time: [0.0, 6.43] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6242 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@userptr:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bxt-dsi/igt@amdgpu/amd_basic@userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-gfx0:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-skl-6600u/igt@amdgpu/amd_cs_nop@sync-fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind (NEW):</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-cfl-8109u/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-snb-2600/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind (NEW):</p>
<ul>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-bxt-dsi/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bxt-dsi/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-skl-6600u/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-skl-6600u/igt@i915_module_load@reload.html">PASS</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-bsw-kefka/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4179">i915#4179</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bsw-kefka/igt@i915_module_load@reload.html">PASS</a></p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-snb-2600/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4179">i915#4179</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-snb-2600/igt@i915_module_load@reload.html">PASS</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-icl-y/igt@i915_module_load@reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-icl-y/igt@i915_module_load@reload.html">PASS</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-bsw-nick/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4179">i915#4179</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-bsw-nick/igt@i915_module_load@reload.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-cml-u2/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-cml-u2/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-kbl-soraka/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-kbl-soraka/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10616/fi-glk-dsi/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/fi-glk-dsi/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (35 -&gt; 30)</h2>
<p>Missing    (5): fi-rkl-11600 bat-dg1-6 fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6213 -&gt; IGTPW_6242</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10616: fd5d67615e07f5c10424ca704cb0c0243ea77643 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6242: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6242/index.html<br />
  IGT_6213: e9ae59cb8b4f1e7bc61a9261f33fc7e52ae06c65 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============3715588460725056134==--
