Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E70C3271E
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 14:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3F510EB2F;
	Thu,  4 Jul 2024 14:50:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB39C10EB2B;
 Thu,  4 Jul 2024 14:50:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6227451883665422829=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_drm-uapi/xe=3A_Sync_with_Pe?=
 =?utf-8?q?rf/Observation_layer_uapi_updates_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jul 2024 14:50:06 -0000
Message-ID: <172010460675.29225.1602037823654815998@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240704002425.2604948-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240704002425.2604948-1-ashutosh.dixit@intel.com>
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

--===============6227451883665422829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi/xe: Sync with Perf/Observation layer uapi updates (rev2)
URL   : https://patchwork.freedesktop.org/series/135728/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15032 -> IGTPW_11364
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11364/index.html

Participating hosts (41 -> 35)
------------------------------

  Missing    (6): bat-dg1-7 fi-bsw-n3050 fi-snb-2520m fi-elk-e7500 bat-jsl-3 bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_11364 that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [DMESG-WARN][1] ([i915#180] / [i915#9925]) -> [DMESG-WARN][2] ([i915#180] / [i915#1982] / [i915#9925])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15032/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11364/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#9925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7916 -> IGTPW_11364

  CI-20190529: 20190529
  CI_DRM_15032: 52ee15a4449ee179eb9f0182952f978bae3563a8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11364: 11364
  IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11364/index.html

--===============6227451883665422829==
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
<tr><td><b>Series:</b></td><td>drm-uapi/xe: Sync with Perf/Observation layer uapi updates (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135728/">https://patchwork.freedesktop.org/series/135728/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11364/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11364/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15032 -&gt; IGTPW_11364</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11364/index.html</p>
<h2>Participating hosts (41 -&gt; 35)</h2>
<p>Missing    (6): bat-dg1-7 fi-bsw-n3050 fi-snb-2520m fi-elk-e7500 bat-jsl-3 bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11364 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15032/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11364/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7916 -&gt; IGTPW_11364</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15032: 52ee15a4449ee179eb9f0182952f978bae3563a8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11364: 11364<br />
  IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6227451883665422829==--
