Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4525579421412548975=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Wed, 30 Aug 2023 16:47:58 -0000
Message-ID: <169341407847.15233.8417561298423762137@emeril.freedesktop.org>
References: <20230830145548.50904-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230830145548.50904-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_add_sync_object_tests_=28rev5=29?=
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

--===============4525579421412548975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: add sync object tests (rev5)
URL   : https://patchwork.freedesktop.org/series/119304/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13577 -> IGTPW_9682
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9682 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - bat-adlp-11:        NOTRUN -> [ABORT][1] ([i915#8668])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - fi-rkl-11600:       [PASS][2] -> [FAIL][3] ([fdo#103375])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13577/fi-rkl-11600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/fi-rkl-11600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_psr@cursor_plane_move:
    - bat-rplp-1:         NOTRUN -> [ABORT][4] ([i915#8469] / [i915#8668] / [i915#9243])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-rplp-1/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - bat-rplp-1:         NOTRUN -> [SKIP][5] ([i915#1072])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-rplp-1/igt@kms_psr@primary_page_flip.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-5:
    - bat-adlp-11:        [DMESG-FAIL][6] ([i915#6868]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13577/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-5.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-5.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        [FAIL][8] ([i915#9047]) -> [PASS][9] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13577/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-5.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][10] ([i915#8442] / [i915#8668]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13577/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9047]: https://gitlab.freedesktop.org/drm/intel/issues/9047
  [i915#9243]: https://gitlab.freedesktop.org/drm/intel/issues/9243


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7459 -> IGTPW_9682

  CI-20190529: 20190529
  CI_DRM_13577: bb585492db95d4cc7fe3797523ed2bbf5c621d37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9682: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/index.html
  IGT_7459: 7459


Testlist changes
----------------

-igt@xe_exec_invalid_va@invalid-va
-igt@xe_exec_invalid_va@invalid-va-fault
-igt@xe_exec_invalid_va@invalid-va-fault-scratch
-igt@xe_exec_invalid_va@invalid-va-scratch

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/index.html

--===============4525579421412548975==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: add sync object tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119304/">https://patchwork.freedesktop.org/series/119304/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13577 -&gt; IGTPW_9682</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9682 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13577/fi-rkl-11600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/fi-rkl-11600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-rplp-1/igt@kms_psr@cursor_plane_move.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8469">i915#8469</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9243">i915#9243</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-rplp-1/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13577/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13577/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9047">i915#9047</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-5.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13577/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7459 -&gt; IGTPW_9682</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13577: bb585492db95d4cc7fe3797523ed2bbf5c621d37 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9682: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9682/index.html<br />
  IGT_7459: 7459</p>
<h2>Testlist changes</h2>
<p>-igt@xe_exec_invalid_va@invalid-va<br />
-igt@xe_exec_invalid_va@invalid-va-fault<br />
-igt@xe_exec_invalid_va@invalid-va-fault-scratch<br />
-igt@xe_exec_invalid_va@invalid-va-scratch</p>

</body>
</html>

--===============4525579421412548975==--
