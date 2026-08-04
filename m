Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7891C55184
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 14:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6374410EAAF;
	Tue,  4 Aug 2026 14:24:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49BC10EA06;
 Tue,  4 Aug 2026 14:23:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7678448043693585206=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fconfigfs?=
 =?utf-8?q?=3A_reuse_pre-existing_configfs_group?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 04 Aug 2026 14:23:46 -0000
Message-ID: <178585342662.18450.8749808170113947643@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803094954.3087948-2-sk.anirban@intel.com>
In-Reply-To: <20260803094954.3087948-2-sk.anirban@intel.com>
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

--===============7678448043693585206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_configfs: reuse pre-existing configfs group
URL   : https://patchwork.freedesktop.org/series/171501/
State : success

== Summary ==

CI Bug Log - changes from IGT_9036 -> IGTPW_15624
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15624/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15624 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [PASS][1] -> [DMESG-WARN][2] ([i915#15673]) +78 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9036/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15624/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9036 -> IGTPW_15624
  * Linux: CI_DRM_18932 -> CI_DRM_18938

  CI-20190529: 20190529
  CI_DRM_18932: f9ef9f302ee01854066ec6da30550da6ea6cb03a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18938: f8d080b47819f01011c1b9c3c875badbb67ec955 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15624: 19894213279006d4700bf74a4cab8b56e61236de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9036: 9036

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15624/index.html

--===============7678448043693585206==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_configfs: reuse pre-existing configfs group</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171501/">https://patchwork.freedesktop.org/series/171501/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15624/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15624/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9036 -&gt; IGTPW_15624</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15624/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15624 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9036/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15624/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +78 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9036 -&gt; IGTPW_15624</li>
<li>Linux: CI_DRM_18932 -&gt; CI_DRM_18938</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18932: f9ef9f302ee01854066ec6da30550da6ea6cb03a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18938: f8d080b47819f01011c1b9c3c875badbb67ec955 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15624: 19894213279006d4700bf74a4cab8b56e61236de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9036: 9036</p>

</body>
</html>

--===============7678448043693585206==--
