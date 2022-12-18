Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6443206012952116660=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Sun, 18 Dec 2022 22:14:03 -0000
Message-ID: <167140164344.28977.15046828088330849902@emeril.freedesktop.org>
References: <20221216191124.27930-1-mohammed.thasleem@intel.com>
In-Reply-To: <20221216191124.27930-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/i915=5Fpm=5Fdc_=3A_Check_DC5_state_with_externel_active_pa?=
 =?utf-8?q?nel?=
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

--===============6443206012952116660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/i915_pm_dc : Check DC5 state with externel active panel
URL   : https://patchwork.freedesktop.org/series/112025/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12512 -> IGTPW_8243
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): fi-rkl-11600 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8243 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@load:
    - fi-kbl-soraka:      [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-kbl-soraka/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-kbl-soraka/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [PASS][3] -> [DMESG-FAIL][4] ([i915#5334])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-rkl-guc:         NOTRUN -> [SKIP][5] ([fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][6] ([i915#7229]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][8] ([i915#4983]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/bat-rpls-2/igt@i915_selftest@live@reset.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@workarounds:
    - fi-rkl-guc:         [INCOMPLETE][10] ([i915#4983]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-rkl-guc/igt@i915_selftest@live@workarounds.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [FAIL][12] ([i915#6298]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6816]: https://gitlab.freedesktop.org/drm/intel/issues/6816
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7336]: https://gitlab.freedesktop.org/drm/intel/issues/7336


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7096 -> IGTPW_8243

  CI-20190529: 20190529
  CI_DRM_12512: 32c0d1e3ac9cf7e7b64a53dcafeeb7173a2f511b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8243: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/index.html
  IGT_7096: f2f515390fb11554d22c7b78b94e288026545326 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_dc@dc5-dpms-negative
+igt@vc4_create_bo@create-bo-0
+igt@vc4_create_bo@create-bo-4096
+igt@vc4_create_bo@create-bo-zeroed
+igt@vc4_dmabuf_poll@poll-read-waits-until-write-done
+igt@vc4_dmabuf_poll@poll-write-waits-until-write-done
+igt@vc4_label_bo@set-bad-handle
+igt@vc4_label_bo@set-bad-name
+igt@vc4_label_bo@set-kernel-name
+igt@vc4_label_bo@set-label
+igt@vc4_lookup_fail@bad-color-write
+igt@vc4_purgeable_bo@access-purgeable-bo-mem
+igt@vc4_purgeable_bo@access-purged-bo-mem
+igt@vc4_purgeable_bo@free-purged-bo
+igt@vc4_purgeable_bo@mark-purgeable
+igt@vc4_purgeable_bo@mark-purgeable-twice
+igt@vc4_purgeable_bo@mark-unpurgeable-check-retained
+igt@vc4_purgeable_bo@mark-unpurgeable-purged
+igt@vc4_purgeable_bo@mark-unpurgeable-twice
+igt@vc4_purgeable_bo@mark-willneed
+igt@vc4_tiling@get-after-free
+igt@vc4_tiling@get-bad-flags
+igt@vc4_tiling@get-bad-handle
+igt@vc4_tiling@get-bad-modifier
+igt@vc4_tiling@set-bad-flags
+igt@vc4_tiling@set-bad-handle
+igt@vc4_tiling@set-bad-modifier
+igt@vc4_tiling@set-get
+igt@vc4_wait_bo@bad-bo
+igt@vc4_wait_bo@bad-pad
+igt@vc4_wait_bo@unused-bo-0ns
+igt@vc4_wait_bo@unused-bo-1ns
+igt@vc4_wait_bo@used-bo
+igt@vc4_wait_bo@used-bo-0ns
+igt@vc4_wait_bo@used-bo-1ns
+igt@vc4_wait_seqno@bad-seqno-0ns
+igt@vc4_wait_seqno@bad-seqno-1ns
-igt@vc4/vc4_create_bo@create-bo-0
-igt@vc4/vc4_create_bo@create-bo-4096
-igt@vc4/vc4_create_bo@create-bo-zeroed
-igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done
-igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done
-igt@vc4/vc4_label_bo@set-bad-handle
-igt@vc4/vc4_label_bo@set-bad-name
-igt@vc4/vc4_label_bo@set-kernel-name
-igt@vc4/vc4_label_bo@set-label
-igt@vc4/vc4_lookup_fail@bad-color-write
-igt@vc4/vc4_perfmon@create-perfmon-0
-igt@vc4/vc4_perfmon@create-perfmon-exceed
-igt@vc4/vc4_perfmon@create-perfmon-invalid-events
-igt@vc4/vc4_perfmon@create-single-perfmon
-igt@vc4/vc4_perfmon@create-two-perfmon
-igt@vc4/vc4_perfmon@destroy-invalid-perfmon
-igt@vc4/vc4_perfmon@destroy-valid-perfmon
-igt@vc4/vc4_perfmon@get-values-invalid-perfmon
-igt@vc4/vc4_perfmon@get-values-invalid-pointer
-igt@vc4/vc4_perfmon@get-values-valid-perfmon
-igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem
-igt@vc4/vc4_purgeable_bo@access-purged-bo-mem
-igt@vc4/vc4_purgeable_bo@free-purged-bo
-igt@vc4/vc4_purgeable_bo@mark-purgeable
-igt@vc4/vc4_purgeable_bo@mark-purgeable-twice
-igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained
-igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged
-igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice
-igt@vc4/vc4_purgeable_bo@mark-willneed
-igt@vc4/vc4_tiling@get-after-free
-igt@vc4/vc4_tiling@get-bad-flags
-igt@vc4/vc4_tiling@get-bad-handle
-igt@vc4/vc4_tiling@get-bad-modifier
-igt@vc4/vc4_tiling@set-bad-flags
-igt@vc4/vc4_tiling@set-bad-handle
-igt@vc4/vc4_tiling@set-bad-modifier
-igt@vc4/vc4_tiling@set-get
-igt@vc4/vc4_wait_bo@bad-bo
-igt@vc4/vc4_wait_bo@bad-pad
-igt@vc4/vc4_wait_bo@unused-bo-0ns
-igt@vc4/vc4_wait_bo@unused-bo-1ns
-igt@vc4/vc4_wait_bo@used-bo
-igt@vc4/vc4_wait_bo@used-bo-0ns
-igt@vc4/vc4_wait_bo@used-bo-1ns
-igt@vc4/vc4_wait_seqno@bad-seqno-0ns
-igt@vc4/vc4_wait_seqno@bad-seqno-1ns

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/index.html

--===============6443206012952116660==
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
<tr><td><b>Series:</b></td><td>tests/i915/i915_pm_dc : Check DC5 state with externel active panel</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112025/">https://patchwork.freedesktop.org/series/112025/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12512 -&gt; IGTPW_8243</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): fi-rkl-11600 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8243 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-kbl-soraka/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-kbl-soraka/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7096 -&gt; IGTPW_8243</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12512: 32c0d1e3ac9cf7e7b64a53dcafeeb7173a2f511b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8243: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8243/index.html<br />
  IGT_7096: f2f515390fb11554d22c7b78b94e288026545326 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_dc@dc5-dpms-negative<br />
+igt@vc4_create_bo@create-bo-0<br />
+igt@vc4_create_bo@create-bo-4096<br />
+igt@vc4_create_bo@create-bo-zeroed<br />
+igt@vc4_dmabuf_poll@poll-read-waits-until-write-done<br />
+igt@vc4_dmabuf_poll@poll-write-waits-until-write-done<br />
+igt@vc4_label_bo@set-bad-handle<br />
+igt@vc4_label_bo@set-bad-name<br />
+igt@vc4_label_bo@set-kernel-name<br />
+igt@vc4_label_bo@set-label<br />
+igt@vc4_lookup_fail@bad-color-write<br />
+igt@vc4_purgeable_bo@access-purgeable-bo-mem<br />
+igt@vc4_purgeable_bo@access-purged-bo-mem<br />
+igt@vc4_purgeable_bo@free-purged-bo<br />
+igt@vc4_purgeable_bo@mark-purgeable<br />
+igt@vc4_purgeable_bo@mark-purgeable-twice<br />
+igt@vc4_purgeable_bo@mark-unpurgeable-check-retained<br />
+igt@vc4_purgeable_bo@mark-unpurgeable-purged<br />
+igt@vc4_purgeable_bo@mark-unpurgeable-twice<br />
+igt@vc4_purgeable_bo@mark-willneed<br />
+igt@vc4_tiling@get-after-free<br />
+igt@vc4_tiling@get-bad-flags<br />
+igt@vc4_tiling@get-bad-handle<br />
+igt@vc4_tiling@get-bad-modifier<br />
+igt@vc4_tiling@set-bad-flags<br />
+igt@vc4_tiling@set-bad-handle<br />
+igt@vc4_tiling@set-bad-modifier<br />
+igt@vc4_tiling@set-get<br />
+igt@vc4_wait_bo@bad-bo<br />
+igt@vc4_wait_bo@bad-pad<br />
+igt@vc4_wait_bo@unused-bo-0ns<br />
+igt@vc4_wait_bo@unused-bo-1ns<br />
+igt@vc4_wait_bo@used-bo<br />
+igt@vc4_wait_bo@used-bo-0ns<br />
+igt@vc4_wait_bo@used-bo-1ns<br />
+igt@vc4_wait_seqno@bad-seqno-0ns<br />
+igt@vc4_wait_seqno@bad-seqno-1ns<br />
-igt@vc4/vc4_create_bo@create-bo-0<br />
-igt@vc4/vc4_create_bo@create-bo-4096<br />
-igt@vc4/vc4_create_bo@create-bo-zeroed<br />
-igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done<br />
-igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done<br />
-igt@vc4/vc4_label_bo@set-bad-handle<br />
-igt@vc4/vc4_label_bo@set-bad-name<br />
-igt@vc4/vc4_label_bo@set-kernel-name<br />
-igt@vc4/vc4_label_bo@set-label<br />
-igt@vc4/vc4_lookup_fail@bad-color-write<br />
-igt@vc4/vc4_perfmon@create-perfmon-0<br />
-igt@vc4/vc4_perfmon@create-perfmon-exceed<br />
-igt@vc4/vc4_perfmon@create-perfmon-invalid-events<br />
-igt@vc4/vc4_perfmon@create-single-perfmon<br />
-igt@vc4/vc4_perfmon@create-two-perfmon<br />
-igt@vc4/vc4_perfmon@destroy-invalid-perfmon<br />
-igt@vc4/vc4_perfmon@destroy-valid-perfmon<br />
-igt@vc4/vc4_perfmon@get-values-invalid-perfmon<br />
-igt@vc4/vc4_perfmon@get-values-invalid-pointer<br />
-igt@vc4/vc4_perfmon@get-values-valid-perfmon<br />
-igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem<br />
-igt@vc4/vc4_purgeable_bo@access-purged-bo-mem<br />
-igt@vc4/vc4_purgeable_bo@free-purged-bo<br />
-igt@vc4/vc4_purgeable_bo@mark-purgeable<br />
-igt@vc4/vc4_purgeable_bo@mark-purgeable-twice<br />
-igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained<br />
-igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged<br />
-igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice<br />
-igt@vc4/vc4_purgeable_bo@mark-willneed<br />
-igt@vc4/vc4_tiling@get-after-free<br />
-igt@vc4/vc4_tiling@get-bad-flags<br />
-igt@vc4/vc4_tiling@get-bad-handle<br />
-igt@vc4/vc4_tiling@get-bad-modifier<br />
-igt@vc4/vc4_tiling@set-bad-flags<br />
-igt@vc4/vc4_tiling@set-bad-handle<br />
-igt@vc4/vc4_tiling@set-bad-modifier<br />
-igt@vc4/vc4_tiling@set-get<br />
-igt@vc4/vc4_wait_bo@bad-bo<br />
-igt@vc4/vc4_wait_bo@bad-pad<br />
-igt@vc4/vc4_wait_bo@unused-bo-0ns<br />
-igt@vc4/vc4_wait_bo@unused-bo-1ns<br />
-igt@vc4/vc4_wait_bo@used-bo<br />
-igt@vc4/vc4_wait_bo@used-bo-0ns<br />
-igt@vc4/vc4_wait_bo@used-bo-1ns<br />
-igt@vc4/vc4_wait_seqno@bad-seqno-0ns<br />
-igt@vc4/vc4_wait_seqno@bad-seqno-1ns</p>

</body>
</html>

--===============6443206012952116660==--
