Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6391508753966749819=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 31 Aug 2021 16:53:16 -0000
Message-ID: <163042879659.10659.5155004063474531748@emeril.freedesktop.org>
References: <20210831161716.1400057-1-robdclark@gmail.com>
In-Reply-To: <20210831161716.1400057-1-robdclark@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW5pdGlh?=
 =?utf-8?q?l_igt_tests_for_drm/msm_ioctls_=28rev4=29?=
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
To: Rob Clark <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6391508753966749819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial igt tests for drm/msm ioctls (rev4)
URL   : https://patchwork.freedesktop.org/series/93973/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10540 -> IGTPW_6177
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/index.html

Known issues
------------

  Here are the changes found in IGTPW_6177 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-rkl-guc:         NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bsw-nick:        NOTRUN -> [SKIP][2] ([fdo#109271]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         NOTRUN -> [DMESG-WARN][3] ([i915#3958])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [INCOMPLETE][4] ([i915#2940]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10540/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@workarounds:
    - fi-rkl-guc:         [DMESG-FAIL][6] ([i915#3928]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10540/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/fi-rkl-guc/igt@i915_selftest@live@workarounds.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3928]: https://gitlab.freedesktop.org/drm/intel/issues/3928
  [i915#3958]: https://gitlab.freedesktop.org/drm/intel/issues/3958


Participating hosts (43 -> 35)
------------------------------

  Missing    (8): fi-kbl-soraka fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6193 -> IGTPW_6177

  CI-20190529: 20190529
  CI_DRM_10540: 8eff208fe95db1015e8fe0e4026065e6f0fa7d30 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6177: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/index.html
  IGT_6193: 080869f804cb86b25a38889e5ce9a870571cd8c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@msm_submit@empty-submit
+igt@msm_submit@invalid-cmd-idx-submit
+igt@msm_submit@invalid-cmd-type-submit
+igt@msm_submit@invalid-duplicate-bo-submit
+igt@msm_submit@invalid-flags-submit
+igt@msm_submit@invalid-in-fence-submit
+igt@msm_submit@invalid-queue-submit
+igt@msm_submit@valid-submit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/index.html

--===============6391508753966749819==
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
<tr><td><b>Series:</b></td><td>Initial igt tests for drm/msm ioctls (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93973/">https://patchwork.freedesktop.org/series/93973/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10540 -&gt; IGTPW_6177</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6177 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3958">i915#3958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10540/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10540/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3928">i915#3928</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 35)</h2>
<p>Missing    (8): fi-kbl-soraka fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6193 -&gt; IGTPW_6177</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10540: 8eff208fe95db1015e8fe0e4026065e6f0fa7d30 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6177: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6177/index.html<br />
  IGT_6193: 080869f804cb86b25a38889e5ce9a870571cd8c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@msm_submit@empty-submit<br />
+igt@msm_submit@invalid-cmd-idx-submit<br />
+igt@msm_submit@invalid-cmd-type-submit<br />
+igt@msm_submit@invalid-duplicate-bo-submit<br />
+igt@msm_submit@invalid-flags-submit<br />
+igt@msm_submit@invalid-in-fence-submit<br />
+igt@msm_submit@invalid-queue-submit<br />
+igt@msm_submit@valid-submit</p>

</body>
</html>

--===============6391508753966749819==--
