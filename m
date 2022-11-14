Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8473671308469303554=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 14 Nov 2022 14:09:42 -0000
Message-ID: <166843498257.32747.894600161666438205@emeril.freedesktop.org>
References: <20221114115255.104672-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20221114115255.104672-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvrr=3A_Add_Negative_tests_to_validate_VRR?=
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

--===============8473671308469303554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Add Negative tests to validate VRR
URL   : https://patchwork.freedesktop.org/series/110860/
State : success

== Summary ==

CI Bug Log - changes from IGT_7055 -> IGTPW_8095
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): fi-bdw-samus bat-dg1-5 

Known issues
------------

  Here are the changes found in IGTPW_8095 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][1] -> [INCOMPLETE][2] ([i915#4785])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][3] ([fdo#109271] / [i915#4312] / [i915#5594])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hugepages:
    - {bat-rpls-2}:       [DMESG-WARN][4] ([i915#5278]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/bat-rpls-2/igt@i915_selftest@live@hugepages.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/bat-rpls-2/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@migrate:
    - {bat-adlp-6}:       [INCOMPLETE][6] ([i915#7348]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/bat-adlp-6/igt@i915_selftest@live@migrate.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/bat-adlp-6/igt@i915_selftest@live@migrate.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size:
    - fi-blb-e6850:       [FAIL][8] -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7055 -> IGTPW_8095

  CI-20190529: 20190529
  CI_DRM_12376: ceb77a7b0d107112b1b4197917d8fdec9a3d0ca8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8095: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/index.html
  IGT_7055: f37bbbbce4d34c3220a2bd5492a2e9c2a7390288 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_vrr@negative-basic

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/index.html

--===============8473671308469303554==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Add Negative tests to validate VRR</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110860/">https://patchwork.freedesktop.org/series/110860/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7055 -&gt; IGTPW_8095</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): fi-bdw-samus bat-dg1-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8095 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/bat-rpls-2/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5278">i915#5278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/bat-rpls-2/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/bat-adlp-6/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7348">i915#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/bat-adlp-6/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7055/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7055 -&gt; IGTPW_8095</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12376: ceb77a7b0d107112b1b4197917d8fdec9a3d0ca8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8095: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8095/index.html<br />
  IGT_7055: f37bbbbce4d34c3220a2bd5492a2e9c2a7390288 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_vrr@negative-basic</p>

</body>
</html>

--===============8473671308469303554==--
