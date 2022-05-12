Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6400103571737292960=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Zhang" <dingchen.zhang@amd.com>
Date: Thu, 12 May 2022 21:00:39 -0000
Message-ID: <165238923905.6461.6193515321595478852@emeril.freedesktop.org>
References: <20220512201626.724930-1-dingchen.zhang@amd.com>
In-Reply-To: <20220512201626.724930-1-dingchen.zhang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu/amd=5Fpsr=3A_add_slice_selective_update_test_case?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============6400103571737292960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_psr: add slice selective update test case
URL   : https://patchwork.freedesktop.org/series/103949/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11644 -> IGTPW_7092
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/index.html

Participating hosts (42 -> 38)
------------------------------

  Additional (1): fi-apl-guc 
  Missing    (5): bat-adlm-1 fi-bsw-cyan bat-dg2-9 fi-hsw-4770 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7092 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-apl-guc:         NOTRUN -> [DMESG-WARN][1] ([i915#5595])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-apl-guc/igt@debugfs_test@read_all_entries.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [PASS][2] -> [INCOMPLETE][3] ([i915#4785])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][4] -> [DMESG-FAIL][5] ([i915#4528])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-4:         [PASS][6] -> [DMESG-WARN][7] ([i915#3576]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/bat-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/bat-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@runner@aborted:
    - fi-apl-guc:         NOTRUN -> [FAIL][8] ([i915#4312])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-apl-guc/igt@runner@aborted.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][9] ([fdo#109271] / [i915#4312])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-hsw-g3258/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-rpls-2}:       [DMESG-WARN][10] ([i915#4391]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live@requests:
    - fi-kbl-soraka:      [INCOMPLETE][12] ([i915#4116]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/fi-kbl-soraka/igt@i915_selftest@live@requests.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-kbl-soraka/igt@i915_selftest@live@requests.html

  * igt@kms_busy@basic@modeset:
    - bat-adlp-4:         [DMESG-WARN][14] ([i915#3576]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/bat-adlp-4/igt@kms_busy@basic@modeset.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/bat-adlp-4/igt@kms_busy@basic@modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4116]: https://gitlab.freedesktop.org/drm/intel/issues/4116
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5595]: https://gitlab.freedesktop.org/drm/intel/issues/5595
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5879]: https://gitlab.freedesktop.org/drm/intel/issues/5879


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6471 -> IGTPW_7092

  CI-20190529: 20190529
  CI_DRM_11644: 90e6a0545613b90072812e79662597eeb13fa0c1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7092: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/index.html
  IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@amdgpu/amd_psr@psr_su_slice_5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/index.html

--===============6400103571737292960==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_psr: add slice selective update test case</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/103949/">https://patchwork.freedesktop.org/series/103949/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11644 -&gt; IGTPW_7092</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Additional (1): fi-apl-guc <br />
  Missing    (5): bat-adlm-1 fi-bsw-cyan bat-dg2-9 fi-hsw-4770 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7092 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-apl-guc/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5595">i915#5595</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/bat-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/bat-adlp-4/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-apl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-hsw-g3258/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/fi-kbl-soraka/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4116">i915#4116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/fi-kbl-soraka/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11644/bat-adlp-4/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/bat-adlp-4/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6471 -&gt; IGTPW_7092</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11644: 90e6a0545613b90072812e79662597eeb13fa0c1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7092: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7092/index.html<br />
  IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@amdgpu/amd_psr@psr_su_slice_5</p>

</body>
</html>

--===============6400103571737292960==--
