Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688F2C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 05:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD9810E036;
	Wed, 16 Sep 2026 05:26:27 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505CF10E036;
 Wed, 16 Sep 2026 05:25:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0078918902475618772=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Expand_kms=5Fdp=5Flink=5F?=
 =?utf-8?q?training_coverage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Sep 2026 05:25:46 -0000
Message-ID: <178953634632.169178.18433384322700977071@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-1-kunal1.joshi@intel.com>
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

--===============0078918902475618772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Expand kms_dp_link_training coverage
URL   : https://patchwork.freedesktop.org/series/174224/
State : success

== Summary ==

CI Bug Log - changes from IGT_9098 -> IGTPW_15849
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15849/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 fi-glk-j4005 

Known issues
------------

  Here are the changes found in IGTPW_15849 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-apl-1:          [DMESG-WARN][1] ([i915#16685]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9098/bat-apl-1/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15849/bat-apl-1/igt@i915_pm_rpm@module-reload.html

  
  [i915#16685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9098 -> IGTPW_15849
  * Linux: CI_DRM_19149 -> CI_DRM_19152

  CI-20190529: 20190529
  CI_DRM_19149: 2bd2887dd30703cc280a0ca64919784240f66e2d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19152: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15849: 15849
  IGT_9098: 9098

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15849/index.html

--===============0078918902475618772==
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
<tr><td><b>Series:</b></td><td>Expand kms_dp_link_training coverage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174224/">https://patchwork.freedesktop.org/series/174224/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15849/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15849/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9098 -&gt; IGTPW_15849</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15849/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15849 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9098/bat-apl-1/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685">i915#16685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15849/bat-apl-1/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9098 -&gt; IGTPW_15849</li>
<li>Linux: CI_DRM_19149 -&gt; CI_DRM_19152</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19149: 2bd2887dd30703cc280a0ca64919784240f66e2d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19152: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15849: 15849<br />
  IGT_9098: 9098</p>

</body>
</html>

--===============0078918902475618772==--
