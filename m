Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5374848770129449585=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Add_dsc+bigjoiner_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Fri, 05 Jan 2024 17:41:12 -0000
Message-ID: <170447647275.57116.12088178571584747279@5338d5abeb45>
References: <20240105155951.124374-1-swati2.sharma@intel.com>
In-Reply-To: <20240105155951.124374-1-swati2.sharma@intel.com>
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

--===============5374848770129449585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add dsc+bigjoiner subtest
URL   : https://patchwork.freedesktop.org/series/128266/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7658 -> IGTPW_10480
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10480 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10480, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/index.html

Participating hosts (37 -> 35)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (3): bat-kbl-2 bat-jsl-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10480:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@hangcheck:
    - fi-bsw-n3050:       NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html

  
Known issues
------------

  Here are the changes found in IGTPW_10480 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][2] ([fdo#109271]) +15 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][3] ([i915#9826]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][4] -> [ABORT][5] ([i915#8668] / [i915#9368])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7658/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-2:         [PASS][6] -> [ABORT][7] ([i915#8668] / [i915#9368] / [i915#9897])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7658/bat-rpls-2/igt@kms_pm_rpm@basic-rte.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/bat-rpls-2/igt@kms_pm_rpm@basic-rte.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@guc:
    - bat-jsl-3:          [INCOMPLETE][8] -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7658/bat-jsl-3/igt@i915_selftest@live@guc.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/bat-jsl-3/igt@i915_selftest@live@guc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9368]: https://gitlab.freedesktop.org/drm/intel/issues/9368
  [i915#9826]: https://gitlab.freedesktop.org/drm/intel/issues/9826
  [i915#9897]: https://gitlab.freedesktop.org/drm/intel/issues/9897


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7658 -> IGTPW_10480

  CI-20190529: 20190529
  CI_DRM_14080: d7426b5fc261046501ca418fe0e69ad1d6ba59be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10480: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/index.html
  IGT_7658: 97b342e1e5de7c6bcf7d76edc388392f7a340d62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_dsc@dsc-with-bigjoiner

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/index.html

--===============5374848770129449585==
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
<tr><td><b>Series:</b></td><td>Add dsc+bigjoiner subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128266/">https://patchwork.freedesktop.org/series/128266/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7658 -&gt; IGTPW_10480</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10480 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10480, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Additional (1): fi-bsw-n3050 <br />
  Missing    (3): bat-kbl-2 bat-jsl-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10480:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/fi-bsw-n3050/igt@i915_selftest@live@hangcheck.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10480 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9826">i915#9826</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7658/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9368">i915#9368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7658/bat-rpls-2/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/bat-rpls-2/igt@kms_pm_rpm@basic-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9368">i915#9368</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9897">i915#9897</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@guc:<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7658/bat-jsl-3/igt@i915_selftest@live@guc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/bat-jsl-3/igt@i915_selftest@live@guc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7658 -&gt; IGTPW_10480</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14080: d7426b5fc261046501ca418fe0e69ad1d6ba59be @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10480: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10480/index.html<br />
  IGT_7658: 97b342e1e5de7c6bcf7d76edc388392f7a340d62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_dsc@dsc-with-bigjoiner</p>

</body>
</html>

--===============5374848770129449585==--
