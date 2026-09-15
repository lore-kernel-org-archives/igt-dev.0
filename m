Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69838C88E75
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 14:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B7710F597;
	Tue, 15 Sep 2026 14:48:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB9B10E368;
 Tue, 15 Sep 2026 14:47:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8145547689853245435=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_gitlab-ci=3A_Fix_computin?=
 =?utf-8?q?g_sum_for_debian_image?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 15 Sep 2026 14:47:26 -0000
Message-ID: <178948364656.165669.1071025654577824523@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260915125123.228545-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260915125123.228545-1-kamil.konieczny@linux.intel.com>
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

--===============8145547689853245435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gitlab-ci: Fix computing sum for debian image
URL   : https://patchwork.freedesktop.org/series/174141/
State : success

== Summary ==

CI Bug Log - changes from IGT_9098 -> IGTPW_15847
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15847/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15847 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-apl-1:          [DMESG-WARN][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9098/bat-apl-1/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15847/bat-apl-1/igt@i915_pm_rpm@module-reload.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9098 -> IGTPW_15847

  CI-20190529: 20190529
  CI_DRM_19149: 2bd2887dd30703cc280a0ca64919784240f66e2d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15847: 7581c434a4bf41ea27b506f3d1ef31e52d1de7c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9098: 9098

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15847/index.html

--===============8145547689853245435==
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
<tr><td><b>Series:</b></td><td>gitlab-ci: Fix computing sum for debian image</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174141/">https://patchwork.freedesktop.org/series/174141/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15847/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15847/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9098 -&gt; IGTPW_15847</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15847/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15847 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9098/bat-apl-1/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15847/bat-apl-1/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9098 -&gt; IGTPW_15847</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19149: 2bd2887dd30703cc280a0ca64919784240f66e2d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15847: 7581c434a4bf41ea27b506f3d1ef31e52d1de7c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9098: 9098</p>

</body>
</html>

--===============8145547689853245435==--
