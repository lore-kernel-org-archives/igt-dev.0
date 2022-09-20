Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6458175787002348308=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Tue, 20 Sep 2022 14:14:37 -0000
Message-ID: <166368327757.1410.9312336291481996139@emeril.freedesktop.org>
References: <20220920131546.34879-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220920131546.34879-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgYWRkIEk5?=
 =?utf-8?q?15=5FMMAP=5FOFFSET=5FFIXED_tests?=
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

--===============6458175787002348308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add I915_MMAP_OFFSET_FIXED tests
URL   : https://patchwork.freedesktop.org/series/108785/
State : success

== Summary ==

CI Bug Log - changes from IGT_6659 -> IGTPW_7804
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/index.html

Participating hosts (45 -> 35)
------------------------------

  Missing    (10): bat-dg1-5 bat-dg2-8 bat-adlm-1 bat-dg2-9 bat-adlp-6 fi-ctg-p8600 bat-adln-1 bat-rpls-1 bat-dg2-11 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7804 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-u2:          [PASS][1] -> [INCOMPLETE][2] ([i915#4890])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6659/fi-icl-u2/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-icl-u2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#111827])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-elk-e7500:       NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#6836]) +39 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [PASS][5] -> [FAIL][6] ([i915#6298])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6659/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  * igt@runner@aborted:
    - fi-icl-u2:          NOTRUN -> [FAIL][7] ([i915#4312])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-icl-u2/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - fi-elk-e7500:       [INCOMPLETE][8] ([i915#6836]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6659/fi-elk-e7500/igt@debugfs_test@read_all_entries.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-elk-e7500/igt@debugfs_test@read_all_entries.html

  * igt@i915_module_load@reload:
    - {fi-tgl-mst}:       [WARN][10] ([i915#6596]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6659/fi-tgl-mst/igt@i915_module_load@reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-tgl-mst/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4890]: https://gitlab.freedesktop.org/drm/intel/issues/4890
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6596]: https://gitlab.freedesktop.org/drm/intel/issues/6596
  [i915#6836]: https://gitlab.freedesktop.org/drm/intel/issues/6836


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6659 -> IGTPW_7804

  CI-20190529: 20190529
  CI_DRM_12160: 33a5599358a6f7bc7bff21369c758303639b5bab @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7804: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/index.html
  IGT_6659: 1becf700a737a7a98555a0cfbe8566355377afb2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_mmap_offset@perf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/index.html

--===============6458175787002348308==
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
<tr><td><b>Series:</b></td><td>add I915_MMAP_OFFSET_FIXED tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108785/">https://patchwork.freedesktop.org/series/108785/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6659 -&gt; IGTPW_7804</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/index.html</p>
<h2>Participating hosts (45 -&gt; 35)</h2>
<p>Missing    (10): bat-dg1-5 bat-dg2-8 bat-adlm-1 bat-dg2-9 bat-adlp-6 fi-ctg-p8600 bat-adln-1 bat-rpls-1 bat-dg2-11 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7804 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6659/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4890">i915#4890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6836">i915#6836</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6659/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6659/fi-elk-e7500/igt@debugfs_test@read_all_entries.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6836">i915#6836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-elk-e7500/igt@debugfs_test@read_all_entries.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{fi-tgl-mst}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6659/fi-tgl-mst/igt@i915_module_load@reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6596">i915#6596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/fi-tgl-mst/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6659 -&gt; IGTPW_7804</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12160: 33a5599358a6f7bc7bff21369c758303639b5bab @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7804: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7804/index.html<br />
  IGT_6659: 1becf700a737a7a98555a0cfbe8566355377afb2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_mmap_offset@perf</p>

</body>
</html>

--===============6458175787002348308==--
