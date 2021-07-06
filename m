Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 06 Jul 2021 05:37:17 -0000
Message-ID: <162554983706.25117.6301222247833224443@emeril.freedesktop.org>
References: <20210705141133.10329-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210705141133.10329-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgS2VlcCB0?=
 =?utf-8?q?ests_working_without_relocations_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1728020479=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1728020479==
Content-Type: multipart/alternative;
 boundary="===============2702822126134212484=="

--===============2702822126134212484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Keep tests working without relocations (rev6)
URL   : https://patchwork.freedesktop.org/series/90049/
State : success

== Summary ==

CI Bug Log - changes from IGT_6129 -> IGTPW_5984
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5984:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_parallel@engines@userptr:
    - {fi-jsl-1}:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-jsl-1/igt@gem_exec_parallel@engines@userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-jsl-1/igt@gem_exec_parallel@engines@userptr.html
    - {fi-ehl-2}:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-ehl-2/igt@gem_exec_parallel@engines@userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-ehl-2/igt@gem_exec_parallel@engines@userptr.html

  
Known issues
------------

  Here are the changes found in IGTPW_5984 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][5] ([fdo#109271]) +29 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-skl-6700k2/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-cml-u2:          NOTRUN -> [SKIP][6] ([i915#1208]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-cml-u2/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_parallel@engines@basic:
    - fi-cml-u2:          NOTRUN -> [DMESG-WARN][7] ([i915#1610])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-cml-u2/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-bwr-2160:        NOTRUN -> [SKIP][8] ([fdo#109271]) +60 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-bwr-2160/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#2190])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-skl-6700k2/igt@gem_huc_copy@huc-copy.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#2190])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-glk-dsi/igt@gem_huc_copy@huc-copy.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-kbl-7567u/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-glk-dsi:         NOTRUN -> [SKIP][12] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-glk-dsi/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#533])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-skl-6700k2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-glk-dsi:         NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#533])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-glk-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#533])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][16] ([fdo#109271]) +51 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-kbl-7567u/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  * igt@kms_psr@primary_page_flip:
    - fi-glk-dsi:         NOTRUN -> [SKIP][17] ([fdo#109271]) +25 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-glk-dsi/igt@kms_psr@primary_page_flip.html

  * igt@runner@aborted:
    - fi-ivb-3770:        NOTRUN -> [FAIL][18] ([i915#2426])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-ivb-3770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic:
    - fi-cml-u2:          [DMESG-WARN][19] ([i915#1610]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-cml-u2/igt@gem_ctx_exec@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-cml-u2/igt@gem_ctx_exec@basic.html

  * igt@gem_exec_parallel@engines@basic:
    - fi-skl-6700k2:      [DMESG-WARN][21] ([i915#1610]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_exec_parallel@engines@userptr:
    - fi-glk-dsi:         [DMESG-WARN][23] ([i915#1610]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-glk-dsi/igt@gem_exec_parallel@engines@userptr.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-glk-dsi/igt@gem_exec_parallel@engines@userptr.html

  * igt@gem_exec_store@basic:
    - {fi-dg1-1}:         [FAIL][25] ([i915#3717]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-dg1-1/igt@gem_exec_store@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-dg1-1/igt@gem_exec_store@basic.html

  * igt@i915_selftest@live@gem_contexts:
    - {fi-dg1-1}:         [INCOMPLETE][27] ([i915#3717]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-dg1-1/igt@i915_selftest@live@gem_contexts.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-dg1-1/igt@i915_selftest@live@gem_contexts.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-icl-u2:          [FAIL][29] ([i915#1814] / [i915#3363]) -> [FAIL][30] ([i915#1569] / [i915#2426] / [i915#3363] / [i915#3690] / [k.org#202973])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-icl-u2/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-icl-u2/igt@runner@aborted.html
    - fi-bdw-5557u:       [FAIL][31] ([i915#2426] / [i915#3462]) -> [FAIL][32] ([i915#1602] / [i915#2029])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-bdw-5557u/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-bdw-5557u/igt@runner@aborted.html
    - fi-cml-u2:          [FAIL][33] ([i915#2082] / [i915#2426] / [i915#3363]) -> [FAIL][34] ([i915#2082] / [i915#2426] / [i915#3363] / [i915#3364])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-cml-u2/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-cml-u2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1208]: https://gitlab.freedesktop.org/drm/intel/issues/1208
  [i915#1569]: https://gitlab.freedesktop.org/drm/intel/issues/1569
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2082]: https://gitlab.freedesktop.org/drm/intel/issues/2082
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3364]: https://gitlab.freedesktop.org/drm/intel/issues/3364
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#3690]: https://gitlab.freedesktop.org/drm/intel/issues/3690
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [k.org#202973]: https://bugzilla.kernel.org/show_bug.cgi?id=202973


Participating hosts (31 -> 22)
------------------------------

  Additional (1): fi-bwr-2160 
  Missing    (10): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-cfl-8700k fi-ilk-650 fi-apl-guc fi-ctg-p8600 fi-snb-2520m fi-icl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6129 -> IGTPW_5984

  CI-20190529: 20190529
  CI_DRM_10305: fd899b57cb480c98e60ee842671bddd4759dfca3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5984: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/index.html
  IGT_6129: 687589e76f787d26ee2b539e551a9be06bd41ce3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_softpin@allocator-evict
+igt@gem_softpin@allocator-evict-all-engines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/index.html

--===============2702822126134212484==
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
<tr><td><b>Series:</b></td><td>Keep tests working without relocations (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90049/">https://patchwork.freedesktop.org/series/90049/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6129 -&gt; IGTPW_5984</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5984:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-jsl-1/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-jsl-1/igt@gem_exec_parallel@engines@userptr.html">DMESG-WARN</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-ehl-2/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-ehl-2/igt@gem_exec_parallel@engines@userptr.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5984 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-skl-6700k2/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-cml-u2/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1208">i915#1208</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-cml-u2/igt@gem_exec_parallel@engines@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-bwr-2160/igt@gem_exec_suspend@basic-s3.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +60 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-skl-6700k2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-glk-dsi/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-kbl-7567u/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-glk-dsi/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-skl-6700k2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-glk-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-c:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-kbl-7567u/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-glk-dsi/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-ivb-3770/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-cml-u2/igt@gem_ctx_exec@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-cml-u2/igt@gem_ctx_exec@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-glk-dsi/igt@gem_exec_parallel@engines@userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-glk-dsi/igt@gem_exec_parallel@engines@userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>{fi-dg1-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-dg1-1/igt@gem_exec_store@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-dg1-1/igt@gem_exec_store@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>{fi-dg1-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-dg1-1/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3717">i915#3717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-dg1-1/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1569">i915#1569</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3690">i915#3690</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202973">k.org#202973</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6129/fi-cml-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2082">i915#2082</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/fi-cml-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2082">i915#2082</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3364">i915#3364</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (31 -&gt; 22)</h2>
<p>Additional (1): fi-bwr-2160 <br />
  Missing    (10): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-cfl-8700k fi-ilk-650 fi-apl-guc fi-ctg-p8600 fi-snb-2520m fi-icl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6129 -&gt; IGTPW_5984</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10305: fd899b57cb480c98e60ee842671bddd4759dfca3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5984: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5984/index.html<br />
  IGT_6129: 687589e76f787d26ee2b539e551a9be06bd41ce3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_softpin@allocator-evict<br />
+igt@gem_softpin@allocator-evict-all-engines</p>

</body>
</html>

--===============2702822126134212484==--

--===============1728020479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1728020479==--
