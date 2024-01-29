Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AB3C47DB3
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 17:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE8C10E3AF;
	Mon, 29 Jan 2024 17:28:38 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0079610E3AF;
 Mon, 29 Jan 2024 17:28:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0517622550162198368=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_make_display_test_dynamic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Mon, 29 Jan 2024 17:28:36 -0000
Message-ID: <170654931699.806672.11177622352956075177@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129162535.1462795-1-kunal1.joshi@intel.com>
In-Reply-To: <20240129162535.1462795-1-kunal1.joshi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

--===============0517622550162198368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: make display test dynamic
URL   : https://patchwork.freedesktop.org/series/129275/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14191 -> IGTPW_10599
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10599 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10599, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/index.html

Participating hosts (37 -> 35)
------------------------------

  Missing    (2): fi-snb-2520m fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10599:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@reset:
    - bat-adlm-1:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14191/bat-adlm-1/igt@i915_selftest@live@reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/bat-adlm-1/igt@i915_selftest@live@reset.html

  * igt@kms_feature_discovery@display:
    - bat-adlm-1:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/bat-adlm-1/igt@kms_feature_discovery@display.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-tgl-1115g4/igt@kms_feature_discovery@display.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14191 and IGTPW_10599:

### New IGT tests (2) ###

  * igt@kms_feature_discovery@display@-1x:
    - Statuses : 27 pass(s)
    - Exec time: [0.0] s

  * igt@kms_feature_discovery@display@-2x:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10599 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_feature_discovery@display:
    - bat-kbl-2:          NOTRUN -> [SKIP][5] ([fdo#109271])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/bat-kbl-2/igt@kms_feature_discovery@display.html
    - bat-atsm-1:         NOTRUN -> [SKIP][6] ([i915#6078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/bat-atsm-1/igt@kms_feature_discovery@display.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][7] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-kbl-x1275/igt@kms_feature_discovery@display.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][8] ([fdo#109271])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-kbl-guc/igt@kms_feature_discovery@display.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][9] ([i915#9792])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/bat-mtlp-6/igt@kms_feature_discovery@display.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][10] ([i915#9730]) -> [PASS][11] +36 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14191/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - fi-kbl-7567u:       [DMESG-WARN][12] ([i915#8585]) -> [PASS][13] +41 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14191/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][14] ([i915#180] / [i915#8585]) -> [PASS][15] +45 other tests pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14191/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#9730]: https://gitlab.freedesktop.org/drm/intel/issues/9730
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7698 -> IGTPW_10599

  CI-20190529: 20190529
  CI_DRM_14191: 114c7e14fc8f30c4f3e0a39819b7d138ff5ef259 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10599: 10599
  IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@kms_feature_discovery@display-1x
-igt@kms_feature_discovery@display-2x
-igt@kms_feature_discovery@display-3x
-igt@kms_feature_discovery@display-4x

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/index.html

--===============0517622550162198368==
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
<tr><td><b>Series:</b></td><td>make display test dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129275/">https://patchwork.freedesktop.org/series/129275/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14191 -&gt; IGTPW_10599</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10599 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10599, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Missing    (2): fi-snb-2520m fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10599:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14191/bat-adlm-1/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/bat-adlm-1/igt@i915_selftest@live@reset.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/bat-adlm-1/igt@kms_feature_discovery@display.html">SKIP</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-tgl-1115g4/igt@kms_feature_discovery@display.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14191 and IGTPW_10599:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_feature_discovery@display@-1x:</p>
<ul>
<li>Statuses : 27 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display@-2x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10599 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_feature_discovery@display:<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/bat-kbl-2/igt@kms_feature_discovery@display.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/bat-atsm-1/igt@kms_feature_discovery@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-kbl-x1275/igt@kms_feature_discovery@display.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-kbl-guc/igt@kms_feature_discovery@display.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/bat-mtlp-6/igt@kms_feature_discovery@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14191/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9730">i915#9730</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14191/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> +41 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14191/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10599/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +45 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7698 -&gt; IGTPW_10599</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14191: 114c7e14fc8f30c4f3e0a39819b7d138ff5ef259 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10599: 10599<br />
  IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@kms_feature_discovery@display-1x<br />
-igt@kms_feature_discovery@display-2x<br />
-igt@kms_feature_discovery@display-3x<br />
-igt@kms_feature_discovery@display-4x</p>

</body>
</html>

--===============0517622550162198368==--
