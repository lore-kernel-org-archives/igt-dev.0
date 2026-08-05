Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAF9C55ABA
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 16:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03A010EF5D;
	Wed,  5 Aug 2026 16:55:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BC110EF63;
 Wed,  5 Aug 2026 16:54:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6461890021941240687=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/intel=5Ffbc=3A_Use_di?=
 =?utf-8?q?splay_version_for_FBC_max_plane_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Aug 2026 16:54:57 -0000
Message-ID: <178594889720.22784.16998479578157256070@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805025453.212016-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260805025453.212016-1-santhosh.reddy.guddati@intel.com>
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

--===============6461890021941240687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_fbc: Use display version for FBC max plane size
URL   : https://patchwork.freedesktop.org/series/171621/
State : success

== Summary ==

CI Bug Log - changes from IGT_9038 -> IGTPW_15633
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/index.html

Participating hosts (41 -> 37)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_15633 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [DMESG-WARN][1] ([i915#15673]) -> [PASS][2] +78 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-adlp-9:         [DMESG-WARN][3] ([i915#16404]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-9/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/bat-adlp-9/igt@i915_selftest@live.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [SKIP][5] ([i915#13030]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#16404]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16404


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9038 -> IGTPW_15633
  * Linux: CI_DRM_18945 -> CI_DRM_18946

  CI-20190529: 20190529
  CI_DRM_18945: 814bd7de7f09446c4b9401eecb8b30c3285af78b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18946: c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15633: 15633
  IGT_9038: 9038

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/index.html

--===============6461890021941240687==
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
<tr><td><b>Series:</b></td><td>lib/intel_fbc: Use display version for FBC max plane size</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171621/">https://patchwork.freedesktop.org/series/171621/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9038 -&gt; IGTPW_15633</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/index.html</p>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15633 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-9/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16404">i915#16404</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/bat-adlp-9/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030">i915#13030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15633/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9038 -&gt; IGTPW_15633</li>
<li>Linux: CI_DRM_18945 -&gt; CI_DRM_18946</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18945: 814bd7de7f09446c4b9401eecb8b30c3285af78b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18946: c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15633: 15633<br />
  IGT_9038: 9038</p>

</body>
</html>

--===============6461890021941240687==--
