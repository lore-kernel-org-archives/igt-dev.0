Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53E6C44512
	for <igt-dev@archiver.kernel.org>; Sun, 19 Jul 2026 07:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E55010E02A;
	Sun, 19 Jul 2026 07:58:28 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DD810E02A;
 Sun, 19 Jul 2026 07:57:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3102759425640948949=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdp=5Fli?=
 =?utf-8?q?nktrain=5Ffallback=3A_Add_UHBR-to-HBR_fallback_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 19 Jul 2026 07:57:56 -0000
Message-ID: <178444787678.204868.4843745241484192870@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260719065542.2919930-1-sowmiya.s@intel.com>
In-Reply-To: <20260719065542.2919930-1-sowmiya.s@intel.com>
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

--===============3102759425640948949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest
URL   : https://patchwork.freedesktop.org/series/170685/
State : success

== Summary ==

CI Bug Log - changes from IGT_9014 -> IGTPW_15559
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15559/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15559 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arls-5:         [PASS][1] -> [DMESG-FAIL][2] ([i915#16528]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9014/bat-arls-5/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15559/bat-arls-5/igt@i915_selftest@live.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [DMESG-WARN][3] ([i915#15673]) -> [PASS][4] +78 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9014/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15559/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#16528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16528


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9014 -> IGTPW_15559
  * Linux: CI_DRM_18846 -> CI_DRM_18850

  CI-20190529: 20190529
  CI_DRM_18846: a121e06fe1001f245f99f7fd06716b2e6ba36b5f @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18850: e55c6b9a3522aaf1441a0662d534c1c7bfa9b860 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15559: 15559
  IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15559/index.html

--===============3102759425640948949==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170685/">https://patchwork.freedesktop.org/series/170685/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15559/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15559/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9014 -&gt; IGTPW_15559</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15559/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15559 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9014/bat-arls-5/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15559/bat-arls-5/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16528">i915#16528</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9014/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15559/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9014 -&gt; IGTPW_15559</li>
<li>Linux: CI_DRM_18846 -&gt; CI_DRM_18850</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18846: a121e06fe1001f245f99f7fd06716b2e6ba36b5f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18850: e55c6b9a3522aaf1441a0662d534c1c7bfa9b860 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15559: 15559<br />
  IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3102759425640948949==--
