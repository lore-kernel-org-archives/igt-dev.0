Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7949466649043521456=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Dec 2021 09:11:51 -0000
Message-ID: <164085551158.9666.3594977257664729742@emeril.freedesktop.org>
References: <20211230081422.11703-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211230081422.11703-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIHN0?=
 =?utf-8?q?art_offset_and_alignment_detection_=28rev3=29?=
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

--===============7949466649043521456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add start offset and alignment detection (rev3)
URL   : https://patchwork.freedesktop.org/series/98402/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11040 -> IGTPW_6525
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html

Participating hosts (39 -> 33)
------------------------------

  Missing    (6): bat-dg1-6 bat-adlp-4 bat-adlp-6 bat-rpls-1 bat-jsl-2 fi-bdw-samus 

New tests
---------

  New tests have been introduced between CI_DRM_11040 and IGTPW_6525:

### New IGT tests (1) ###

  * igt@gem_softpin@safe-alignment:
    - Statuses : 30 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  

Known issues
------------

  Here are the changes found in IGTPW_6525 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/fi-kbl-soraka/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       NOTRUN -> [INCOMPLETE][2] ([i915#4547])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  * {igt@gem_softpin@safe-alignment} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][3] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/fi-bwr-2160/igt@gem_softpin@safe-alignment.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - fi-kbl-8809g:       [DMESG-WARN][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/fi-kbl-8809g/igt@gem_exec_suspend@basic-s0@smem.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/fi-kbl-8809g/igt@gem_exec_suspend@basic-s0@smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6321 -> IGTPW_6525

  CI-20190529: 20190529
  CI_DRM_11040: 9517c3b9b5d466a61cd97d451dd916c63c6baeed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6525: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html
  IGT_6321: 85a5938090cd3da34e4fba8f541fbe240210b47d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_softpin@safe-alignment

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html

--===============7949466649043521456==
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
<tr><td><b>Series:</b></td><td>Add start offset and alignment detection (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98402/">https://patchwork.freedesktop.org/series/98402/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11040 -&gt; IGTPW_6525</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html</p>
<h2>Participating hosts (39 -&gt; 33)</h2>
<p>Missing    (6): bat-dg1-6 bat-adlp-4 bat-adlp-6 bat-rpls-1 bat-jsl-2 fi-bdw-samus </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11040 and IGTPW_6525:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_softpin@safe-alignment:<ul>
<li>Statuses : 30 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6525 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/fi-kbl-soraka/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@safe-alignment} (NEW):</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/fi-bwr-2160/igt@gem_softpin@safe-alignment.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0@smem:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/fi-kbl-8809g/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/fi-kbl-8809g/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6321 -&gt; IGTPW_6525</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11040: 9517c3b9b5d466a61cd97d451dd916c63c6baeed @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6525: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html<br />
  IGT_6321: 85a5938090cd3da34e4fba8f541fbe240210b47d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_softpin@safe-alignment</p>

</body>
</html>

--===============7949466649043521456==--
