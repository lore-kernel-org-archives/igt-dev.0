Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 28 Jun 2021 14:44:49 -0000
Message-ID: <162489148938.2572.17363334484927553546@emeril.freedesktop.org>
References: <20210624173525.1526215-1-markyacoub@chromium.org>
In-Reply-To: <20210624173525.1526215-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_vblank?=
 =?utf-8?b?LiAocmV2Nyk=?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1059262792=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1059262792==
Content-Type: multipart/alternative;
 boundary="===============8676458609925458299=="

--===============8676458609925458299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vblank: Turn on hardware before testing invalid vblank. (rev7)
URL   : https://patchwork.freedesktop.org/series/90382/
State : success

== Summary ==

CI Bug Log - changes from IGT_6121 -> IGTPW_5959
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.html

Known issues
------------

  Here are the changes found in IGTPW_5959 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-kbl-soraka:      [PASS][1] -> [FAIL][2] ([i915#2546] / [i915#49])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/fi-kbl-soraka/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/fi-kbl-soraka/igt@kms_frontbuffer_tracking@basic.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][3] ([i915#1602] / [i915#2029])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [DMESG-WARN][4] ([i915#2868]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49


Participating hosts (40 -> 37)
------------------------------

  Missing    (3): fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6121 -> IGTPW_5959

  CI-20190529: 20190529
  CI_DRM_10284: c4cc46175b38e554eab7ac3d1b95a85c79963d4a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5959: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.html
  IGT_6121: a63ceb48e6c3e733d04156b32fba3b4f4d5ad794 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.html

--===============8676458609925458299==
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
<tr><td><b>Series:</b></td><td>tests/kms_vblank: Turn on hardware before testing invalid vblank. (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90382/">https://patchwork.freedesktop.org/series/90382/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6121 -&gt; IGTPW_5959</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5959 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/fi-kbl-soraka/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/fi-kbl-soraka/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium@common-hpd-after-suspend:<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6121 -&gt; IGTPW_5959</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10284: c4cc46175b38e554eab7ac3d1b95a85c79963d4a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5959: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5959/index.html<br />
  IGT_6121: a63ceb48e6c3e733d04156b32fba3b4f4d5ad794 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8676458609925458299==--

--===============1059262792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1059262792==--
