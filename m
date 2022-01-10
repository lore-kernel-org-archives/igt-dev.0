Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1116577823033593118=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 Jan 2022 07:20:49 -0000
Message-ID: <164179924935.28738.7295694892954012792@emeril.freedesktop.org>
References: <20220110061141.1655017-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20220110061141.1655017-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU2hhcmVk?=
 =?utf-8?q?_reset_domain_=28rev2=29?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1116577823033593118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Shared reset domain (rev2)
URL   : https://patchwork.freedesktop.org/series/98612/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11057 -> IGTPW_6546
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/index.html

Participating hosts (43 -> 35)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (9): bat-dg1-6 bat-dg1-5 fi-bsw-cyan bat-adlp-6 bat-adlp-4 bat-rpls-1 fi-bdw-samus bat-jsl-2 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6546:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@requests:
    - {fi-jsl-1}:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11057/fi-jsl-1/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-jsl-1/igt@i915_selftest@live@requests.html

  
Known issues
------------

  Here are the changes found in IGTPW_6546 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-gfx0:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][3] ([fdo#109271]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-bsw-n3050/igt@amdgpu/amd_cs_nop@sync-gfx0.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][4] -> [INCOMPLETE][5] ([i915#3303])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11057/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [PASS][6] -> [INCOMPLETE][7] ([i915#3921])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11057/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][8] ([fdo#109271]) +57 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][9] ([fdo#109271] / [i915#1436] / [i915#4312])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-n3050:       [DMESG-FAIL][10] ([i915#2927] / [i915#3428]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11057/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][12] ([i915#4269]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11057/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2927]: https://gitlab.freedesktop.org/drm/intel/issues/2927
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6325 -> IGTPW_6546

  CI-20190529: 20190529
  CI_DRM_11057: 735aae7386b257cb5701f61f263df9402e3cbafc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6546: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/index.html
  IGT_6325: ac29e097d4ff0f2e269a955ca86c5eb23908467a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/index.html

--===============1116577823033593118==
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
<tr><td><b>Series:</b></td><td>Shared reset domain (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98612/">https://patchwork.freedesktop.org/series/98612/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11057 -&gt; IGTPW_6546</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/index.html</p>
<h2>Participating hosts (43 -&gt; 35)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (9): bat-dg1-6 bat-dg1-5 fi-bsw-cyan bat-adlp-6 bat-adlp-4 bat-rpls-1 fi-bdw-samus bat-jsl-2 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6546:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11057/fi-jsl-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-jsl-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6546 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-gfx0:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-bsw-n3050/igt@amdgpu/amd_cs_nop@sync-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11057/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11057/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11057/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2927">i915#2927</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11057/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6325 -&gt; IGTPW_6546</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11057: 735aae7386b257cb5701f61f263df9402e3cbafc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6546: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6546/index.html<br />
  IGT_6325: ac29e097d4ff0f2e269a955ca86c5eb23908467a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1116577823033593118==--
