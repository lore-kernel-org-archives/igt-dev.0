Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 17 Jun 2021 20:01:47 -0000
Message-ID: <162396010714.3753.11990825888092114916@emeril.freedesktop.org>
References: <20210617191256.577244-1-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU3RvcCBk?=
 =?utf-8?q?epending_on_context_mutation_=28rev12=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0355964130=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0355964130==
Content-Type: multipart/alternative;
 boundary="===============1449211273899534223=="

--===============1449211273899534223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Stop depending on context mutation (rev12)
URL   : https://patchwork.freedesktop.org/series/88986/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10238 -> IGTPW_5936
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/index.html

Known issues
------------

  Here are the changes found in IGTPW_5936 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2] ([i915#2782] / [i915#2940])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10238/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][3] ([fdo#109271] / [i915#1436] / [i915#2722])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/fi-bsw-nick/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - {fi-tgl-1115g4}:    [FAIL][4] ([i915#1888]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10238/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][6] ([i915#1372]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10238/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-pnv-d510:        [SKIP][8] ([fdo#109271]) -> [INCOMPLETE][9] ([i915#299])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10238/fi-pnv-d510/igt@i915_pm_rpm@basic-pci-d3-state.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/fi-pnv-d510/igt@i915_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299


Participating hosts (42 -> 33)
------------------------------

  Missing    (9): fi-kbl-soraka fi-ilk-m540 fi-bdw-5557u fi-hsw-4200u fi-bsw-cyan fi-apl-guc fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6112 -> IGTPW_5936

  CI-20190529: 20190529
  CI_DRM_10238: 24817a2a8f6704920e46f13e646d9da0a0c1ba51 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5936: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/index.html
  IGT_6112: a17cc0c5d096fabfd516848c114bc411e11130f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_ctx_param@invalid-get-engines
+igt@gem_ctx_param@invalid-get-no-zeromap
+igt@gem_ctx_param@invalid-get-ringsize
+igt@gem_ctx_param@invalid-set-no-zeromap
+igt@gem_ctx_param@invalid-set-ringsize
-igt@api_intel_bb@bb-with-vm
-igt@gem_ctx_engines@idempotent
-igt@gem_ctx_engines@libapi
-igt@gem_ctx_persistence@clone
-igt@gem_ctx_persistence@close-replace-race
-igt@gem_ctx_persistence@replace
-igt@gem_ctx_persistence@replace-hostile
-igt@gem_exec_balancer@bonded-cork
-igt@gem_exec_balancer@bonded-early
-igt@gem_exec_balancer@bonded-imm
-igt@gem_vm_create@async-destroy
-igt@gem_vm_create@destroy-race

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/index.html

--===============1449211273899534223==
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
<tr><td><b>Series:</b></td><td>Stop depending on context mutation (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88986/">https://patchwork.freedesktop.org/series/88986/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10238 -&gt; IGTPW_5936</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5936 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10238/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>{fi-tgl-1115g4}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10238/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10238/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10238/fi-pnv-d510/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/fi-pnv-d510/igt@i915_pm_rpm@basic-pci-d3-state.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (42 -&gt; 33)</h2>
<p>Missing    (9): fi-kbl-soraka fi-ilk-m540 fi-bdw-5557u fi-hsw-4200u fi-bsw-cyan fi-apl-guc fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6112 -&gt; IGTPW_5936</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10238: 24817a2a8f6704920e46f13e646d9da0a0c1ba51 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5936: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5936/index.html<br />
  IGT_6112: a17cc0c5d096fabfd516848c114bc411e11130f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_ctx_param@invalid-get-engines<br />
+igt@gem_ctx_param@invalid-get-no-zeromap<br />
+igt@gem_ctx_param@invalid-get-ringsize<br />
+igt@gem_ctx_param@invalid-set-no-zeromap<br />
+igt@gem_ctx_param@invalid-set-ringsize<br />
-igt@api_intel_bb@bb-with-vm<br />
-igt@gem_ctx_engines@idempotent<br />
-igt@gem_ctx_engines@libapi<br />
-igt@gem_ctx_persistence@clone<br />
-igt@gem_ctx_persistence@close-replace-race<br />
-igt@gem_ctx_persistence@replace<br />
-igt@gem_ctx_persistence@replace-hostile<br />
-igt@gem_exec_balancer@bonded-cork<br />
-igt@gem_exec_balancer@bonded-early<br />
-igt@gem_exec_balancer@bonded-imm<br />
-igt@gem_vm_create@async-destroy<br />
-igt@gem_vm_create@destroy-race</p>

</body>
</html>

--===============1449211273899534223==--

--===============0355964130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0355964130==--
