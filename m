Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F57CC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 07:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35C810EA7F;
	Wed, 19 Jun 2024 07:34:04 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A1A10EA7F;
 Wed, 19 Jun 2024 07:34:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0305944980881634636=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/2=5D_tests/kms=5F3d=3A_=221080p-left=2Epng=22=3A_No_such_f?=
 =?utf-8?q?ile_or_directory_fix_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Jun 2024 07:34:03 -0000
Message-ID: <171878244399.106475.2485062515767539825@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618121638.231181-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240618121638.231181-1-ramanaidu.naladala@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============0305944980881634636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_3d: "1080p-left.png": No such file or directory fix (rev2)
URL   : https://patchwork.freedesktop.org/series/135011/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14967 -> IGTPW_11279
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11279 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11279, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/index.html

Participating hosts (43 -> 40)
------------------------------

  Additional (1): fi-tgl-1115g4 
  Missing    (4): bat-kbl-2 bat-dg2-11 bat-arls-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11279:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_3d:
    - bat-adlp-9:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/bat-adlp-9/igt@kms_3d.html

  
Known issues
------------

  Here are the changes found in IGTPW_11279 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - fi-blb-e6850:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/fi-blb-e6850/igt@kms_3d.html
    - bat-rplp-1:         NOTRUN -> [SKIP][3] ([i915#4369])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/bat-rplp-1/igt@kms_3d.html
    - bat-arlh-2:         NOTRUN -> [SKIP][4] ([i915#11346])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/bat-arlh-2/igt@kms_3d.html
    - bat-atsm-1:         NOTRUN -> [SKIP][5] ([i915#6093])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/bat-atsm-1/igt@kms_3d.html
    - bat-adlp-11:        NOTRUN -> [SKIP][6] ([i915#4369])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/bat-adlp-11/igt@kms_3d.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/fi-pnv-d510/igt@kms_3d.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#4369]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4369
  [i915#6093]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7891 -> IGTPW_11279

  CI-20190529: 20190529
  CI_DRM_14967: fcea62a0d6954dcce241d22785597ba416a18076 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11279: 11279
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/index.html

--===============0305944980881634636==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_3d: &quot;1080p-left.png&quot;: No such file or directory fix (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135011/">https://patchwork.freedesktop.org/series/135011/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14967 -&gt; IGTPW_11279</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11279 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11279, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Additional (1): fi-tgl-1115g4 <br />
  Missing    (4): bat-kbl-2 bat-dg2-11 bat-arls-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11279:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_3d:<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/bat-adlp-9/igt@kms_3d.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11279 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_3d:<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/fi-blb-e6850/igt@kms_3d.html">SKIP</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/bat-rplp-1/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4369">i915#4369</a>)</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/bat-arlh-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/bat-atsm-1/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6093">i915#6093</a>)</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/bat-adlp-11/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4369">i915#4369</a>)</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11279/fi-pnv-d510/igt@kms_3d.html">SKIP</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7891 -&gt; IGTPW_11279</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14967: fcea62a0d6954dcce241d22785597ba416a18076 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11279: 11279<br />
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0305944980881634636==--
