Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 18 Mar 2021 22:58:01 -0000
Message-ID: <161610828153.12740.1268698920790576631@emeril.freedesktop.org>
References: <20210318222124.970997-1-lyude@redhat.com>
In-Reply-To: <20210318222124.970997-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Test_32x32_cursors?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0578012912=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0578012912==
Content-Type: multipart/alternative;
 boundary="===============8116509346384571161=="

--===============8116509346384571161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Test 32x32 cursors
URL   : https://patchwork.freedesktop.org/series/88144/
State : success

== Summary ==

CI Bug Log - changes from IGT_6038 -> IGTPW_5625
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html

Known issues
------------

  Here are the changes found in IGTPW_5625 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [PASS][1] -> [FAIL][2] ([i915#2203] / [i915#579])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@gem_linear_blits@basic:
    - fi-kbl-8809g:       [TIMEOUT][3] ([i915#2502] / [i915#3145]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/fi-kbl-8809g/igt@gem_linear_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/fi-kbl-8809g/igt@gem_linear_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-kbl-8809g:       [TIMEOUT][5] ([i915#3145]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html

  
#### Warnings ####

  * igt@gem_tiled_blits@basic:
    - fi-kbl-8809g:       [TIMEOUT][7] ([i915#2502] / [i915#3145]) -> [TIMEOUT][8] ([i915#3145])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/fi-kbl-8809g/igt@gem_tiled_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/fi-kbl-8809g/igt@gem_tiled_blits@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1222]: https://gitlab.freedesktop.org/drm/intel/issues/1222
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (44 -> 39)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6038 -> IGTPW_5625

  CI-20190529: 20190529
  CI_DRM_9870: a9a5ed8d2432e5335e6c26118cefb2cfff28ae37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5625: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html
  IGT_6038: e2f0d31702e95837dbc2df66949e643284e29dea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-a-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-a-cursor-32x10-random
+igt@kms_cursor_crc@pipe-a-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-a-cursor-32x32-random
+igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding
+igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-b-cursor-32x10-random
+igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-b-cursor-32x32-random
+igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding
+igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-c-cursor-32x10-random
+igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-c-cursor-32x32-random
+igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding
+igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-d-cursor-32x10-random
+igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-d-cursor-32x32-random
+igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding
+igt@kms_cursor_crc@pipe-e-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-e-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-e-cursor-32x10-random
+igt@kms_cursor_crc@pipe-e-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-e-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-e-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-e-cursor-32x32-random
+igt@kms_cursor_crc@pipe-e-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-e-cursor-32x32-sliding
+igt@kms_cursor_crc@pipe-f-cursor-32x10-offscreen
+igt@kms_cursor_crc@pipe-f-cursor-32x10-onscreen
+igt@kms_cursor_crc@pipe-f-cursor-32x10-random
+igt@kms_cursor_crc@pipe-f-cursor-32x10-sliding
+igt@kms_cursor_crc@pipe-f-cursor-32x32-offscreen
+igt@kms_cursor_crc@pipe-f-cursor-32x32-onscreen
+igt@kms_cursor_crc@pipe-f-cursor-32x32-random
+igt@kms_cursor_crc@pipe-f-cursor-32x32-rapid-movement
+igt@kms_cursor_crc@pipe-f-cursor-32x32-sliding

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html

--===============8116509346384571161==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Test 32x32 cursors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88144/">https://patchwork.freedesktop.org/series/88144/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6038 -&gt; IGTPW_5625</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5625 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/fi-kbl-8809g/igt@gem_linear_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/fi-kbl-8809g/igt@gem_linear_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/fi-kbl-8809g/igt@gem_tiled_fence_blits@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_tiled_blits@basic:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/fi-kbl-8809g/igt@gem_tiled_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/fi-kbl-8809g/igt@gem_tiled_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 39)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6038 -&gt; IGTPW_5625</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9870: a9a5ed8d2432e5335e6c26118cefb2cfff28ae37 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5625: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html<br />
  IGT_6038: e2f0d31702e95837dbc2df66949e643284e29dea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-e-cursor-32x32-sliding<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x10-offscreen<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x10-onscreen<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x10-random<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x10-sliding<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x32-offscreen<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x32-onscreen<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x32-random<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x32-rapid-movement<br />
+igt@kms_cursor_crc@pipe-f-cursor-32x32-sliding</p>

</body>
</html>

--===============8116509346384571161==--

--===============0578012912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0578012912==--
