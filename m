Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E3CC44501
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 22:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A959610E1A5;
	Fri, 10 Jul 2026 22:00:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC2B10E1A5;
 Fri, 10 Jul 2026 21:59:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6541117332294921046=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fdefrag?=
 =?utf-8?q?=3A_Exercise_the_Xe_page-defragmentation_worker_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jul 2026 21:59:40 -0000
Message-ID: <178372078050.176614.11700479160178448165@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260710205227.2384198-1-matthew.brost@intel.com>
In-Reply-To: <20260710205227.2384198-1-matthew.brost@intel.com>
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

--===============6541117332294921046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_defrag: Exercise the Xe page-defragmentation worker (rev2)
URL   : https://patchwork.freedesktop.org/series/169723/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9002 -> IGTPW_15513
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15513 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15513, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15513/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15513:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-apl-1:          [PASS][1] -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9002/bat-apl-1/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15513/bat-apl-1/igt@i915_pm_rpm@module-reload.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9002 -> IGTPW_15513
  * Linux: CI_DRM_18802 -> CI_DRM_18804

  CI-20190529: 20190529
  CI_DRM_18802: 08cdb6010efc9b2f58f740fc59dadc8c119f8b55 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18804: 6d76f5afea7406e978db1fc356a9b88d0d8989d1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15513: 15513
  IGT_9002: 9002

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15513/index.html

--===============6541117332294921046==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_defrag: Exercise the Xe page-defragmentation worker (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169723/">https://patchwork.freedesktop.org/series/169723/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15513/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15513/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9002 -&gt; IGTPW_15513</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15513 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15513, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15513/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15513:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9002/bat-apl-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15513/bat-apl-1/igt@i915_pm_rpm@module-reload.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9002 -&gt; IGTPW_15513</li>
<li>Linux: CI_DRM_18802 -&gt; CI_DRM_18804</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18802: 08cdb6010efc9b2f58f740fc59dadc8c119f8b55 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18804: 6d76f5afea7406e978db1fc356a9b88d0d8989d1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15513: 15513<br />
  IGT_9002: 9002</p>

</body>
</html>

--===============6541117332294921046==--
