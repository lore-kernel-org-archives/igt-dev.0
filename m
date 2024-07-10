Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F68C3DA41
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 16:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB2310E83A;
	Wed, 10 Jul 2024 16:39:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA0210E838;
 Wed, 10 Jul 2024 16:39:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4869137786224427158=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_=2Egitlab-ci=3A_Add_explain?=
 =?utf-8?q?ation_to_run_CI_locally?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Jul 2024 16:39:50 -0000
Message-ID: <172062959010.106000.1084446769305997970@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240710-gitlab-ci-local-v1-1-9c8d1dabeeeb@bootlin.com>
In-Reply-To: <20240710-gitlab-ci-local-v1-1-9c8d1dabeeeb@bootlin.com>
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

--===============4869137786224427158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: .gitlab-ci: Add explaination to run CI locally
URL   : https://patchwork.freedesktop.org/series/135941/
State : success

== Summary ==

CI Bug Log - changes from IGT_7922 -> IGTPW_11393
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): fi-glk-j4005 bat-dg2-11 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_11393 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-dg2-9:          [DMESG-WARN][1] ([i915#11548]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7922/bat-dg2-9/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/bat-dg2-9/igt@i915_module_load@load.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-apl-1:          [DMESG-WARN][3] ([i915#180] / [i915#1982]) -> [DMESG-WARN][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7922/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/bat-apl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@reload:
    - bat-apl-1:          [DMESG-WARN][5] ([i915#180]) -> [DMESG-WARN][6] ([i915#180] / [i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7922/bat-apl-1/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/bat-apl-1/igt@i915_module_load@reload.html

  
  [i915#11548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11548
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7922 -> IGTPW_11393

  CI-20190529: 20190529
  CI_DRM_15058: 28c3b18581a110660a7c42bb988a12a3b1f6d402 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11393: 11393
  IGT_7922: 325d4f4efbf869f93d3b4479046713d0ce7220e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/index.html

--===============4869137786224427158==
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
<tr><td><b>Series:</b></td><td>.gitlab-ci: Add explaination to run CI locally</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135941/">https://patchwork.freedesktop.org/series/135941/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7922 -&gt; IGTPW_11393</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): fi-glk-j4005 bat-dg2-11 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11393 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7922/bat-dg2-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11548">i915#11548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/bat-dg2-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7922/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/bat-apl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7922/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11393/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7922 -&gt; IGTPW_11393</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15058: 28c3b18581a110660a7c42bb988a12a3b1f6d402 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11393: 11393<br />
  IGT_7922: 325d4f4efbf869f93d3b4479046713d0ce7220e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4869137786224427158==--
