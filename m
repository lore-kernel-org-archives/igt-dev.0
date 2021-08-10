Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8049843087902418175=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Aug 2021 06:10:49 -0000
Message-ID: <162857584945.29683.17107768748388120963@emeril.freedesktop.org>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIGFs?=
 =?utf-8?q?locator_support_in_IGT?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8049843087902418175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add allocator support in IGT
URL   : https://patchwork.freedesktop.org/series/93536/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10462 -> IGTPW_6105
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6105 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6105, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6105:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-u2:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10462/fi-icl-u2/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/fi-icl-u2/igt@i915_selftest@live@hangcheck.html

  
Known issues
------------

  Here are the changes found in IGTPW_6105 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +48 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@userptr:
    - fi-pnv-d510:        [INCOMPLETE][4] ([i915#299]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10462/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html

  * igt@i915_selftest@live@workarounds:
    - fi-rkl-guc:         [DMESG-WARN][6] -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10462/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/fi-rkl-guc/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:
    - {fi-dg1-1}:         [FAIL][8] ([i915#3717]) -> [PASS][9] +63 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10462/fi-dg1-1/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/fi-dg1-1/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717


Participating hosts (37 -> 33)
------------------------------

  Missing    (4): fi-kbl-soraka fi-bdw-samus fi-bsw-cyan bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6163 -> IGTPW_6105

  CI-20190529: 20190529
  CI_DRM_10462: 1ab8dc433360478c35eba12661f1dd9327588830 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6105: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/index.html
  IGT_6163: 9f9d82df8c8e68c304e84aba717a9937b65e10e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_softpin@allocator-evict
+igt@gem_softpin@allocator-evict-all-engines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/index.html

--===============8049843087902418175==
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
<tr><td><b>Series:</b></td><td>Add allocator support in IGT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93536/">https://patchwork.freedesktop.org/series/93536/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10462 -&gt; IGTPW_6105</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6105 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6105, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6105:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10462/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6105 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@prime_vgem@basic-userptr:<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +48 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10462/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10462/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:</p>
<ul>
<li>{fi-dg1-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10462/fi-dg1-1/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/fi-dg1-1/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2.html">PASS</a> +63 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (37 -&gt; 33)</h2>
<p>Missing    (4): fi-kbl-soraka fi-bdw-samus fi-bsw-cyan bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6163 -&gt; IGTPW_6105</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10462: 1ab8dc433360478c35eba12661f1dd9327588830 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6105: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6105/index.html<br />
  IGT_6163: 9f9d82df8c8e68c304e84aba717a9937b65e10e6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_softpin@allocator-evict<br />
+igt@gem_softpin@allocator-evict-all-engines</p>

</body>
</html>

--===============8049843087902418175==--
