Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2293209284375658568=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Thu, 05 Oct 2023 14:29:03 -0000
Message-ID: <169651614323.7513.9818097819403686980@emeril.freedesktop.org>
References: <20231005103244.3262419-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231005103244.3262419-1-daniele.ceraolospurio@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?xe=5Fhuc=5Fcopy=3A_Handle_multiple_GTs?=
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

--===============2293209284375658568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_huc_copy: Handle multiple GTs
URL   : https://patchwork.freedesktop.org/series/124654/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13717 -> IGTPW_9924
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/index.html

Participating hosts (41 -> 37)
------------------------------

  Missing    (4): fi-kbl-soraka fi-hsw-4770 bat-dg2-9 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9924 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms@d-dp1:
    - bat-adlp-9:         [PASS][1] -> [FAIL][2] ([i915#7655])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@d-dp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@d-dp1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        NOTRUN -> [ABORT][3] ([i915#8668] / [i915#9451])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-dg2-11:         [INCOMPLETE][4] ([i915#9253]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-dg2-11/igt@i915_selftest@live@gt_mocs.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-dg2-11/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [DMESG-FAIL][6] ([i915#7913]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][8] ([i915#7952]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5:
    - bat-adlp-11:        [DMESG-FAIL][10] ([i915#6868]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6:
    - bat-adlp-11:        [ABORT][12] ([i915#8668]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7655]: https://gitlab.freedesktop.org/drm/intel/issues/7655
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9253]: https://gitlab.freedesktop.org/drm/intel/issues/9253
  [i915#9451]: https://gitlab.freedesktop.org/drm/intel/issues/9451


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7516 -> IGTPW_9924

  CI-20190529: 20190529
  CI_DRM_13717: ba043ea3baa7d6cd98262e865f903bf9016a8a5e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9924: 9924
  IGT_7516: 40b5a184f6da0a3295ee429947696d254522bb22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/index.html

--===============2293209284375658568==
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
<tr><td><b>Series:</b></td><td>tests/xe_huc_copy: Handle multiple GTs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124654/">https://patchwork.freedesktop.org/series/124654/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13717 -&gt; IGTPW_9924</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/index.html</p>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): fi-kbl-soraka fi-hsw-4770 bat-dg2-9 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9924 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp1:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@d-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-adlp-9/igt@kms_flip@basic-flip-vs-dpms@d-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7655">i915#7655</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9451">i915#9451</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-dg2-11/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9253">i915#9253</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-dg2-11/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13717/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9924/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7516 -&gt; IGTPW_9924</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13717: ba043ea3baa7d6cd98262e865f903bf9016a8a5e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9924: 9924<br />
  IGT_7516: 40b5a184f6da0a3295ee429947696d254522bb22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2293209284375658568==--
