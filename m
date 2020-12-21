Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 21 Dec 2020 12:40:02 -0000
Message-ID: <160855440202.420.10229954069606095978@emeril.freedesktop.org>
References: <20201221115855.2451913-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201221115855.2451913-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Ffair=3A_Try_to_spot_unfairness?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0956344122=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0956344122==
Content-Type: multipart/alternative;
 boundary="===============6641989665900766776=="

--===============6641989665900766776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_fair: Try to spot unfairness
URL   : https://patchwork.freedesktop.org/series/85139/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9509 -> IGTPW_5318
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5318 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5318, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5318:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gtt:
    - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-kbl-soraka/igt@i915_selftest@live@gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-kbl-soraka/igt@i915_selftest@live@gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_5318 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@fork-compute0:
    - fi-tgl-u2:          NOTRUN -> [SKIP][3] ([fdo#109315] / [i915#2575]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-tgl-u2/igt@amdgpu/amd_cs_nop@fork-compute0.html

  * igt@i915_module_load@reload:
    - fi-kbl-7500u:       [PASS][4] -> [DMESG-WARN][5] ([i915#2605])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-kbl-7500u/igt@i915_module_load@reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-kbl-7500u/igt@i915_module_load@reload.html

  * igt@prime_self_import@basic-with_two_bos:
    - fi-tgl-y:           [PASS][6] -> [DMESG-WARN][7] ([i915#402]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html

  * igt@runner@aborted:
    - fi-kbl-soraka:      NOTRUN -> [FAIL][8] ([i915#1436] / [i915#2295])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-kbl-soraka/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_tiled_blits@basic:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#402]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-tgl-y/igt@gem_tiled_blits@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-tgl-y/igt@gem_tiled_blits@basic.html

  * igt@i915_selftest@live@hangcheck:
    - fi-tgl-u2:          [INCOMPLETE][11] -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-tgl-u2/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-tgl-u2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [FAIL][13] ([i915#2679]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#2679]: https://gitlab.freedesktop.org/drm/intel/issues/2679
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (42 -> 36)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5913 -> IGTPW_5318

  CI-20190529: 20190529
  CI_DRM_9509: 66ecfb1df07b703dc4e83e8c520b186dffe6d2b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5318: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/index.html
  IGT_5913: b30bdfecaf1ff38b83c0bfbcf5981732a968a464 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_fair@basic-flow
+igt@gem_exec_fair@basic-none
+igt@gem_exec_fair@basic-none-rrul
+igt@gem_exec_fair@basic-none-share
+igt@gem_exec_fair@basic-none-solo
+igt@gem_exec_fair@basic-none-vip
+igt@gem_exec_fair@basic-pace
+igt@gem_exec_fair@basic-pace-share
+igt@gem_exec_fair@basic-pace-solo
+igt@gem_exec_fair@basic-sync
+igt@gem_exec_fair@basic-throttle
+igt@gem_exec_fair@fair-flow
+igt@gem_exec_fair@fair-flow-ping
+igt@gem_exec_fair@fair-flow-share
+igt@gem_exec_fair@fair-flow-solo
+igt@gem_exec_fair@fair-half
+igt@gem_exec_fair@fair-half-solo
+igt@gem_exec_fair@fair-next
+igt@gem_exec_fair@fair-next-ping
+igt@gem_exec_fair@fair-next-share
+igt@gem_exec_fair@fair-next-solo
+igt@gem_exec_fair@fair-none
+igt@gem_exec_fair@fair-none-ping
+igt@gem_exec_fair@fair-none-rrul
+igt@gem_exec_fair@fair-none-share
+igt@gem_exec_fair@fair-none-solo
+igt@gem_exec_fair@fair-none-vip
+igt@gem_exec_fair@fair-pace
+igt@gem_exec_fair@fair-pace-ping
+igt@gem_exec_fair@fair-pace-share
+igt@gem_exec_fair@fair-pace-solo
+igt@gem_exec_fair@fair-spare
+igt@gem_exec_fair@fair-spare-solo
+igt@gem_exec_fair@fair-sync
+igt@gem_exec_fair@fair-sync-solo
+igt@gem_exec_fair@fair-sync-vip
+igt@gem_exec_fair@fair-throttle
+igt@gem_exec_fair@fair-throttle-rrul
+igt@gem_exec_fair@fair-throttle-share
+igt@gem_exec_fair@fair-throttle-solo
+igt@gem_exec_fair@fair-throttle-vip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/index.html

--===============6641989665900766776==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_fair: Try to spot unfairness</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85139/">https://patchwork.freedesktop.org/series/85139/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9509 -&gt; IGTPW_5318</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5318 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5318, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5318:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gtt:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-kbl-soraka/igt@i915_selftest@live@gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-kbl-soraka/igt@i915_selftest@live@gtt.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5318 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-compute0:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-tgl-u2/igt@amdgpu/amd_cs_nop@fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-kbl-7500u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-kbl-7500u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_two_bos:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-tgl-y/igt@gem_tiled_blits@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-tgl-y/igt@gem_tiled_blits@basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-tgl-u2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-tgl-u2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9509/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2679">i915#2679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 36)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-j1900 fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5913 -&gt; IGTPW_5318</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9509: 66ecfb1df07b703dc4e83e8c520b186dffe6d2b3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5318: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5318/index.html<br />
  IGT_5913: b30bdfecaf1ff38b83c0bfbcf5981732a968a464 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_fair@basic-flow<br />
+igt@gem_exec_fair@basic-none<br />
+igt@gem_exec_fair@basic-none-rrul<br />
+igt@gem_exec_fair@basic-none-share<br />
+igt@gem_exec_fair@basic-none-solo<br />
+igt@gem_exec_fair@basic-none-vip<br />
+igt@gem_exec_fair@basic-pace<br />
+igt@gem_exec_fair@basic-pace-share<br />
+igt@gem_exec_fair@basic-pace-solo<br />
+igt@gem_exec_fair@basic-sync<br />
+igt@gem_exec_fair@basic-throttle<br />
+igt@gem_exec_fair@fair-flow<br />
+igt@gem_exec_fair@fair-flow-ping<br />
+igt@gem_exec_fair@fair-flow-share<br />
+igt@gem_exec_fair@fair-flow-solo<br />
+igt@gem_exec_fair@fair-half<br />
+igt@gem_exec_fair@fair-half-solo<br />
+igt@gem_exec_fair@fair-next<br />
+igt@gem_exec_fair@fair-next-ping<br />
+igt@gem_exec_fair@fair-next-share<br />
+igt@gem_exec_fair@fair-next-solo<br />
+igt@gem_exec_fair@fair-none<br />
+igt@gem_exec_fair@fair-none-ping<br />
+igt@gem_exec_fair@fair-none-rrul<br />
+igt@gem_exec_fair@fair-none-share<br />
+igt@gem_exec_fair@fair-none-solo<br />
+igt@gem_exec_fair@fair-none-vip<br />
+igt@gem_exec_fair@fair-pace<br />
+igt@gem_exec_fair@fair-pace-ping<br />
+igt@gem_exec_fair@fair-pace-share<br />
+igt@gem_exec_fair@fair-pace-solo<br />
+igt@gem_exec_fair@fair-spare<br />
+igt@gem_exec_fair@fair-spare-solo<br />
+igt@gem_exec_fair@fair-sync<br />
+igt@gem_exec_fair@fair-sync-solo<br />
+igt@gem_exec_fair@fair-sync-vip<br />
+igt@gem_exec_fair@fair-throttle<br />
+igt@gem_exec_fair@fair-throttle-rrul<br />
+igt@gem_exec_fair@fair-throttle-share<br />
+igt@gem_exec_fair@fair-throttle-solo<br />
+igt@gem_exec_fair@fair-throttle-vip</p>

</body>
</html>

--===============6641989665900766776==--

--===============0956344122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0956344122==--
