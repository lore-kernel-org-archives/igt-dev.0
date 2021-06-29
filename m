Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 29 Jun 2021 10:12:44 -0000
Message-ID: <162496156418.9056.4243518673709544463@emeril.freedesktop.org>
References: <20210622102454.8922-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210622102454.8922-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/5=5D_tests/kms=5Fdp=5Fdsc=3A_Add_a_?=
 =?utf-8?q?subtest_to_force_DSC_output_BPP_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1664584674=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1664584674==
Content-Type: multipart/alternative;
 boundary="===============4323351400968899081=="

--===============4323351400968899081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/5] tests/kms_dp_dsc: Add a subtest to force DSC output BPP (rev2)
URL   : https://patchwork.freedesktop.org/series/91772/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6121 -> IGTPW_5962
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5962 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5962, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5962:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@coherency:
    - fi-tgl-y:           [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/fi-tgl-y/igt@i915_selftest@live@coherency.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/fi-tgl-y/igt@i915_selftest@live@coherency.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@gt_pm:
    - {fi-jsl-1}:         [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/fi-jsl-1/igt@i915_selftest@live@gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/fi-jsl-1/igt@i915_selftest@live@gt_pm.html

  
Known issues
------------

  Here are the changes found in IGTPW_5962 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - fi-tgl-y:           NOTRUN -> [FAIL][5] ([i915#1436] / [i915#2966])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/fi-tgl-y/igt@runner@aborted.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][6] ([i915#1602] / [i915#2029])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7500u:       [DMESG-WARN][7] ([i915#2868]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2868]: https://gitlab.freedesktop.org/drm/intel/issues/2868
  [i915#2966]: https://gitlab.freedesktop.org/drm/intel/issues/2966
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303


Participating hosts (40 -> 37)
------------------------------

  Missing    (3): fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6121 -> IGTPW_5962

  CI-20190529: 20190529
  CI_DRM_10284: c4cc46175b38e554eab7ac3d1b95a85c79963d4a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5962: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/index.html
  IGT_6121: a63ceb48e6c3e733d04156b32fba3b4f4d5ad794 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_dp_dsc@basic-dsc-enable
+igt@kms_dp_dsc@dsc-8bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-9bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-10bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-11bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-12bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-13bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-14bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-16bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-17bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-18bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-19bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-20bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-21bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-22bpp-compression-xrgb8888
+igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888
-igt@kms_dp_dsc@basic-dsc-enable-dp
-igt@kms_dp_dsc@basic-dsc-enable-edp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/index.html

--===============4323351400968899081==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/5] tests/kms_dp_dsc: Add a subtest to force DSC output BPP (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91772/">https://patchwork.freedesktop.org/series/91772/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6121 -&gt; IGTPW_5962</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5962 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5962, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5962:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@coherency:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/fi-tgl-y/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/fi-tgl-y/igt@i915_selftest@live@coherency.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@gt_pm:<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/fi-jsl-1/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/fi-jsl-1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5962 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/fi-tgl-y/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2966">i915#2966</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium@common-hpd-after-suspend:<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2868">i915#2868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6121 -&gt; IGTPW_5962</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10284: c4cc46175b38e554eab7ac3d1b95a85c79963d4a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5962: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5962/index.html<br />
  IGT_6121: a63ceb48e6c3e733d04156b32fba3b4f4d5ad794 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_dp_dsc@basic-dsc-enable<br />
+igt@kms_dp_dsc@dsc-8bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-9bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-10bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-11bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-12bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-13bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-14bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-16bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-17bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-18bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-19bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-20bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-21bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-22bpp-compression-xrgb8888<br />
+igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888<br />
-igt@kms_dp_dsc@basic-dsc-enable-dp<br />
-igt@kms_dp_dsc@basic-dsc-enable-edp</p>

</body>
</html>

--===============4323351400968899081==--

--===============1664584674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1664584674==--
