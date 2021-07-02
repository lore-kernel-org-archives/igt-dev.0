Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 02 Jul 2021 12:39:49 -0000
Message-ID: <162522958905.22030.16032717093584955667@emeril.freedesktop.org>
References: <20210702115234.6256-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210702115234.6256-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgS2VlcCB0?=
 =?utf-8?q?ests_working_without_relocations_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1198867994=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1198867994==
Content-Type: multipart/alternative;
 boundary="===============5233206581037965091=="

--===============5233206581037965091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Keep tests working without relocations (rev4)
URL   : https://patchwork.freedesktop.org/series/90049/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10302 -> IGTPW_5977
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/index.html

Known issues
------------

  Here are the changes found in IGTPW_5977 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-y:           [PASS][1] -> [INCOMPLETE][2] ([i915#2782])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-icl-y/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/fi-icl-y/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [PASS][3] -> [INCOMPLETE][4] ([i915#2782])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][5] -> [FAIL][6] ([i915#1372])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@runner@aborted:
    - fi-icl-y:           NOTRUN -> [FAIL][7] ([i915#2782])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/fi-icl-y/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_store@basic:
    - {fi-dg1-1}:         [FAIL][8] ([i915#3717]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-dg1-1/igt@gem_exec_store@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/fi-dg1-1/igt@gem_exec_store@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717


Participating hosts (40 -> 35)
------------------------------

  Missing    (5): fi-bsw-cyan bat-adls-4 bat-adls-3 bat-jsl-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6128 -> IGTPW_5977

  CI-20190529: 20190529
  CI_DRM_10302: 403c15e48caac46206e92d703408fe07d83c6bf4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/index.html
  IGT_6128: b24e5949af7e51f0af484d2ce4cb4c5a41ac5358 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_softpin@evict-many-all-engines
+igt@gem_softpin@evict-many-engines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/index.html

--===============5233206581037965091==
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
<tr><td><b>Series:</b></td><td>Keep tests working without relocations (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90049/">https://patchwork.freedesktop.org/series/90049/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10302 -&gt; IGTPW_5977</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5977 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-icl-y/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/fi-icl-y/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/fi-icl-y/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_store@basic:<ul>
<li>{fi-dg1-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10302/fi-dg1-1/igt@gem_exec_store@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/fi-dg1-1/igt@gem_exec_store@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (40 -&gt; 35)</h2>
<p>Missing    (5): fi-bsw-cyan bat-adls-4 bat-adls-3 bat-jsl-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6128 -&gt; IGTPW_5977</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10302: 403c15e48caac46206e92d703408fe07d83c6bf4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5977/index.html<br />
  IGT_6128: b24e5949af7e51f0af484d2ce4cb4c5a41ac5358 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_softpin@evict-many-all-engines<br />
+igt@gem_softpin@evict-many-engines</p>

</body>
</html>

--===============5233206581037965091==--

--===============1198867994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1198867994==--
