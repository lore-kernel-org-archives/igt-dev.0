Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3530021112797335245=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 03 Nov 2023 17:03:35 -0000
Message-ID: <169903101589.29107.17072879011216812870@emeril.freedesktop.org>
References: <20231103160148.94811-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231103160148.94811-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtdGVz?=
 =?utf-8?q?t_changes_for_filtering_GPUs_on_multi-gpu_=28rev2=29?=
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

--===============3530021112797335245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drmtest changes for filtering GPUs on multi-gpu (rev2)
URL   : https://patchwork.freedesktop.org/series/125897/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13835 -> IGTPW_10114
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/index.html

Participating hosts (36 -> 35)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (2): fi-hsw-4770 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10114 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][1] ([fdo#109271]) +29 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][2] ([i915#5334]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13835/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-5:
    - bat-adlp-11:        [DMESG-FAIL][4] ([i915#6868]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13835/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-5.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        [FAIL][6] ([i915#9047]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13835/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - bat-adlp-11:        [ABORT][8] ([i915#8668]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13835/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9047]: https://gitlab.freedesktop.org/drm/intel/issues/9047


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7573 -> IGTPW_10114

  CI-20190529: 20190529
  CI_DRM_13835: ca1fcd4faf444fc6d8b3cf88a17e2eb7765c1299 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10114: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/index.html
  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_create@multigpu-create-massive-size

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/index.html

--===============3530021112797335245==
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
<tr><td><b>Series:</b></td><td>drmtest changes for filtering GPUs on multi-gpu (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125897/">https://patchwork.freedesktop.org/series/125897/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13835 -&gt; IGTPW_10114</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/index.html</p>
<h2>Participating hosts (36 -&gt; 35)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (2): fi-hsw-4770 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10114 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_psr@primary_page_flip:<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13835/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13835/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13835/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9047">i915#9047</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13835/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7573 -&gt; IGTPW_10114</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13835: ca1fcd4faf444fc6d8b3cf88a17e2eb7765c1299 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10114: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10114/index.html<br />
  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_create@multigpu-create-massive-size</p>

</body>
</html>

--===============3530021112797335245==--
