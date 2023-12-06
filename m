Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9080814079049294508=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 06 Dec 2023 12:59:32 -0000
Message-ID: <170186757241.26424.306572401066411818@emeril.freedesktop.org>
References: <20231206121203.270852-1-matthew.auld@intel.com>
In-Reply-To: <20231206121203.270852-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/xe=5Fpat=3A_limit_number_of_dynamic_tests?=
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

--===============9080814079049294508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pat: limit number of dynamic tests
URL   : https://patchwork.freedesktop.org/series/127429/
State : success

== Summary ==

CI Bug Log - changes from IGT_7623 -> IGTPW_10352
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10352 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms@d-dp6:
    - bat-adlp-11:        [PASS][1] -> [DMESG-WARN][2] ([i915#6868])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7623/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [PASS][3] -> [FAIL][4] ([IGT#3])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7623/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-1:
    - bat-dg2-8:          [DMESG-WARN][5] ([i915#1982]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7623/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-1.html

  
  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7623 -> IGTPW_10352

  CI-20190529: 20190529
  CI_DRM_13986: b441e2df33ada84a77c2da0b5619e212e94675bf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10352: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/index.html
  IGT_7623: f42cda2a9ad74846fb59eea436cc98c8789849f9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/index.html

--===============9080814079049294508==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pat: limit number of dynamic tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127429/">https://patchwork.freedesktop.org/series/127429/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7623 -&gt; IGTPW_10352</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10352 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7623/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7623/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-1:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7623/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7623 -&gt; IGTPW_10352</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13986: b441e2df33ada84a77c2da0b5619e212e94675bf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10352: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/index.html<br />
  IGT_7623: f42cda2a9ad74846fb59eea436cc98c8789849f9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============9080814079049294508==--
