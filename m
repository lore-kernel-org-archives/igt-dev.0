Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7910665175229739672=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 23 Nov 2023 06:06:44 -0000
Message-ID: <170071960430.8135.9283908054725319116@emeril.freedesktop.org>
References: <20231123052807.157210-1-swati2.sharma@intel.com>
In-Reply-To: <20231123052807.157210-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_tests/kms=5Ffeature=5Fdiscover?=
 =?utf-8?q?y=3A_Fix_display_subtest?=
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

--===============7910665175229739672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/kms_feature_discovery: Fix display subtest
URL   : https://patchwork.freedesktop.org/series/126799/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13913 -> IGTPW_10248
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/index.html

Participating hosts (37 -> 37)
------------------------------

  Additional (2): bat-mtlp-6 bat-dg1-5 
  Missing    (2): fi-snb-2520m fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10248:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_feature_discovery@display-1x} (NEW):
    - bat-mtlp-6:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-mtlp-6/igt@kms_feature_discovery@display-1x.html
    - bat-dg1-7:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-dg1-7/igt@kms_feature_discovery@display-1x.html
    - bat-adlm-1:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-adlm-1/igt@kms_feature_discovery@display-1x.html
    - bat-rpls-1:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-rpls-1/igt@kms_feature_discovery@display-1x.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13913 and IGTPW_10248:

### New IGT tests (1) ###

  * igt@kms_feature_discovery@display-1x:
    - Statuses : 28 pass(s) 8 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10248 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_feature_discovery@display-1x} (NEW):
    - bat-kbl-2:          NOTRUN -> [SKIP][5] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-kbl-2/igt@kms_feature_discovery@display-1x.html
    - bat-atsm-1:         NOTRUN -> [SKIP][6] ([i915#6078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-atsm-1/igt@kms_feature_discovery@display-1x.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][7] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/fi-kbl-x1275/igt@kms_feature_discovery@display-1x.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][8] ([fdo#109271])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/fi-kbl-guc/igt@kms_feature_discovery@display-1x.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7597 -> IGTPW_10248

  CI-20190529: 20190529
  CI_DRM_13913: e0a66c36703db267b371d7c26f68c6c9de2ff36a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10248: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/index.html
  IGT_7597: 380983dbd9bb2f7eea5e917e8fed0569bfe8cf9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_feature_discovery@display-1x

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/index.html

--===============7910665175229739672==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/kms_feature_discovery: Fix display subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126799/">https://patchwork.freedesktop.org/series/126799/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13913 -&gt; IGTPW_10248</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/index.html</p>
<h2>Participating hosts (37 -&gt; 37)</h2>
<p>Additional (2): bat-mtlp-6 bat-dg1-5 <br />
  Missing    (2): fi-snb-2520m fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10248:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_feature_discovery@display-1x} (NEW):</p>
<ul>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-mtlp-6/igt@kms_feature_discovery@display-1x.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-dg1-7/igt@kms_feature_discovery@display-1x.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-adlm-1/igt@kms_feature_discovery@display-1x.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-rpls-1/igt@kms_feature_discovery@display-1x.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13913 and IGTPW_10248:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_feature_discovery@display-1x:<ul>
<li>Statuses : 28 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10248 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_feature_discovery@display-1x} (NEW):</p>
<ul>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-kbl-2/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-atsm-1/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/fi-kbl-x1275/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/fi-kbl-guc/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7597 -&gt; IGTPW_10248</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13913: e0a66c36703db267b371d7c26f68c6c9de2ff36a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10248: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/index.html<br />
  IGT_7597: 380983dbd9bb2f7eea5e917e8fed0569bfe8cf9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_feature_discovery@display-1x</p>

</body>
</html>

--===============7910665175229739672==--
