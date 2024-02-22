Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F155C48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 08:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B056D10E615;
	Thu, 22 Feb 2024 08:39:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B42510E8BF;
 Thu, 22 Feb 2024 08:39:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4994929620740573275=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel=3A_Add_tests_to?=
 =?utf-8?q?_run_suspend_without_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Feb 2024 08:39:07 -0000
Message-ID: <170859114763.216123.1858132317197155956@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222070635.878953-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20240222070635.878953-1-sujaritha.sundaresan@intel.com>
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

--===============4994929620740573275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Add tests to run suspend without display
URL   : https://patchwork.freedesktop.org/series/130239/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14314 -> IGTPW_10716
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10716/index.html

Participating hosts (37 -> 36)
------------------------------

  Additional (1): bat-arls-3 
  Missing    (2): fi-glk-j4005 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10716 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_module_load@reload:
    - {bat-arls-2}:       [INCOMPLETE][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14314/bat-arls-2/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10716/bat-arls-2/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
  [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
  [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
  [i915#10215]: https://gitlab.freedesktop.org/drm/intel/issues/10215
  [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
  [i915#10274]: https://gitlab.freedesktop.org/drm/intel/issues/10274
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7722 -> IGTPW_10716

  CI-20190529: 20190529
  CI_DRM_14314: d6c1b8ab9a4dec3a52c5f53b283436f95dbd3285 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10716: 10716
  IGT_7722: 48196ef379a77675ea6af82a82da62b2ad2d9ded @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_pm@s2idle-without-display
+igt@xe_pm@s3-without-display
+igt@xe_pm@s4-without-display
-igt@xe_gt_freq@freq_fixed_exec
-igt@xe_gt_freq@freq_range_exec

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10716/index.html

--===============4994929620740573275==
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
<tr><td><b>Series:</b></td><td>tests/intel: Add tests to run suspend without display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130239/">https://patchwork.freedesktop.org/series/130239/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10716/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10716/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14314 -&gt; IGTPW_10716</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10716/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Additional (1): bat-arls-3 <br />
  Missing    (2): fi-glk-j4005 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10716 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14314/bat-arls-2/igt@i915_module_load@reload.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10716/bat-arls-2/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7722 -&gt; IGTPW_10716</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14314: d6c1b8ab9a4dec3a52c5f53b283436f95dbd3285 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10716: 10716<br />
  IGT_7722: 48196ef379a77675ea6af82a82da62b2ad2d9ded @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_pm@s2idle-without-display<br />
+igt@xe_pm@s3-without-display<br />
+igt@xe_pm@s4-without-display<br />
-igt@xe_gt_freq@freq_fixed_exec<br />
-igt@xe_gt_freq@freq_range_exec</p>

</body>
</html>

--===============4994929620740573275==--
