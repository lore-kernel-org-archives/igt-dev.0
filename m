Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3E1C5516F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CD210E0FB;
	Fri, 31 Jul 2026 18:53:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF62110E0FB;
 Fri, 31 Jul 2026 18:53:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0020174492343600824=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_YUV_Conversion_Colorop_te?=
 =?utf-8?q?sts_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Jul 2026 18:53:21 -0000
Message-ID: <178552400177.10819.16077384166063342517@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260731180200.668795-1-harry.wentland@amd.com>
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
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

--===============0020174492343600824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: YUV Conversion Colorop tests (rev3)
URL   : https://patchwork.freedesktop.org/series/164103/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9036 -> IGTPW_15619
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15619 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15619, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15619/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15619:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9036/bat-apl-1/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15619/bat-apl-1/igt@i915_pm_rpm@module-reload.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9036 -> IGTPW_15619

  CI-20190529: 20190529
  CI_DRM_18932: f9ef9f302ee01854066ec6da30550da6ea6cb03a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15619: 15619
  IGT_9036: 9036

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15619/index.html

--===============0020174492343600824==
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
<tr><td><b>Series:</b></td><td>YUV Conversion Colorop tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164103/">https://patchwork.freedesktop.org/series/164103/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15619/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15619/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9036 -&gt; IGTPW_15619</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15619 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15619, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15619/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15619:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9036/bat-apl-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15619/bat-apl-1/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9036 -&gt; IGTPW_15619</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18932: f9ef9f302ee01854066ec6da30550da6ea6cb03a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15619: 15619<br />
  IGT_9036: 9036</p>

</body>
</html>

--===============0020174492343600824==--
