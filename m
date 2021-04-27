Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 27 Apr 2021 23:12:35 -0000
Message-ID: <161956515568.17487.17130006852825439488@emeril.freedesktop.org>
References: <20210427222548.1778-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210427222548.1778-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=5Fflips=3A_Fix_flip_timestamp_checks?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1523864281=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1523864281==
Content-Type: multipart/alternative;
 boundary="===============8865709001646726319=="

--===============8865709001646726319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Fix flip timestamp checks
URL   : https://patchwork.freedesktop.org/series/89564/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10018 -> IGTPW_5766
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5766 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5766, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5766:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@hugepages:
    - fi-tgl-y:           [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-tgl-y/igt@i915_selftest@live@hugepages.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-tgl-y/igt@i915_selftest@live@hugepages.html

  
Known issues
------------

  Here are the changes found in IGTPW_5766 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@engines@fds:
    - fi-icl-u2:          [PASS][3] -> [INCOMPLETE][4] ([i915#1895])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-icl-u2/igt@gem_exec_parallel@engines@fds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-icl-u2/igt@gem_exec_parallel@engines@fds.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [PASS][5] -> [DMESG-FAIL][6] ([i915#165])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][7] ([i915#1888]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-tgl-y:           [DMESG-FAIL][9] ([i915#541]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html
    - {fi-jsl-1}:         [DMESG-WARN][11] ([i915#1222]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1222]: https://gitlab.freedesktop.org/drm/intel/issues/1222
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1895]: https://gitlab.freedesktop.org/drm/intel/issues/1895
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (47 -> 40)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-icl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6076 -> IGTPW_5766

  CI-20190529: 20190529
  CI_DRM_10018: 929a4fa94d31990066fd8be6a02f1a6c2b9f1d2d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5766: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/index.html
  IGT_6076: 9ab0820dbd07781161c1ace6973ea222fd24e53a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/index.html

--===============8865709001646726319==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Fix flip timestamp checks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89564/">https://patchwork.freedesktop.org/series/89564/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10018 -&gt; IGTPW_5766</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5766 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5766, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5766:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@hugepages:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-tgl-y/igt@i915_selftest@live@hugepages.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-tgl-y/igt@i915_selftest@live@hugepages.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5766 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-icl-u2/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-icl-u2/igt@gem_exec_parallel@engines@fds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1895">i915#1895</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>
<p>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10018/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1222">i915#1222</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (47 -&gt; 40)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-icl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6076 -&gt; IGTPW_5766</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10018: 929a4fa94d31990066fd8be6a02f1a6c2b9f1d2d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5766: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5766/index.html<br />
  IGT_6076: 9ab0820dbd07781161c1ace6973ea222fd24e53a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8865709001646726319==--

--===============1523864281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1523864281==--
