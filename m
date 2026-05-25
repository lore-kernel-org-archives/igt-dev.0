Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EF4CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 18:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148EB10E3AA;
	Mon, 25 May 2026 18:37:49 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B1710E3C1;
 Mon, 25 May 2026 18:37:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7122387642684892790=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tools/igt=5Fpower=3A_Fix_?=
 =?utf-8?q?crash_on_Xe_devices_by_initializing_xe=5Fdevice_cache_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 May 2026 18:37:28 -0000
Message-ID: <177973424893.6791.13656314710786433530@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <2f9a0aa5284bc6fb8275842ea8abd522a982e4ef.1779701555.git.sebastian.brzezinka@intel.com>
In-Reply-To: <2f9a0aa5284bc6fb8275842ea8abd522a982e4ef.1779701555.git.sebastian.brzezinka@intel.com>
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

--===============7122387642684892790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/igt_power: Fix crash on Xe devices by initializing xe_device cache (rev3)
URL   : https://patchwork.freedesktop.org/series/166775/
State : success

== Summary ==

CI Bug Log - changes from IGT_8937 -> IGTPW_15233
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15233 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/fi-bsw-nick/igt@dmabuf@all-tests.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-nick:        [ABORT][2] -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - fi-skl-6600u:       [DMESG-WARN][4] -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-skl-6600u/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/fi-skl-6600u/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8937 -> IGTPW_15233

  CI-20190529: 20190529
  CI_DRM_18548: 04d475020800d0a1033ca89a0d6d5fc638ddc65b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15233: 15233
  IGT_8937: 8937

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/index.html

--===============7122387642684892790==
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
<tr><td><b>Series:</b></td><td>tools/igt_power: Fix crash on Xe devices by initializing xe_device cache (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166775/">https://patchwork.freedesktop.org/series/166775/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8937 -&gt; IGTPW_15233</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15233 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@dmabuf@all-tests:<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/fi-bsw-nick/igt@dmabuf@all-tests.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-skl-6600u/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15233/fi-skl-6600u/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8937 -&gt; IGTPW_15233</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18548: 04d475020800d0a1033ca89a0d6d5fc638ddc65b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15233: 15233<br />
  IGT_8937: 8937</p>

</body>
</html>

--===============7122387642684892790==--
