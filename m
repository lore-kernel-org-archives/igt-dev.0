Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAB7C982D2
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 01:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA53510E7A0;
	Fri, 18 Sep 2026 01:20:32 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C4610E7A0;
 Fri, 18 Sep 2026 01:19:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1675591007307728711=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Fcolor=3A_Add_?=
 =?utf-8?q?support_for_background_color_testing=2E_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Sep 2026 01:19:45 -0000
Message-ID: <178969438566.178464.9832850613835921785@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917191835.977425-1-swati2.sharma@intel.com>
In-Reply-To: <20260917191835.977425-1-swati2.sharma@intel.com>
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

--===============1675591007307728711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Add support for background color testing. (rev5)
URL   : https://patchwork.freedesktop.org/series/167119/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9100 -> IGTPW_15860
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15860 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15860, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15860:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:
    - fi-skl-6600u:       [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9100/fi-skl-6600u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/fi-skl-6600u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_15860 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] ([i915#13735] / [i915#15673]) +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9100/fi-cfl-8109u/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/fi-cfl-8109u/igt@i915_module_load@reload.html

  * igt@kms_addfb_basic@too-high:
    - fi-cfl-8109u:       [PASS][5] -> [DMESG-WARN][6] ([i915#13735]) +47 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9100/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - fi-cfl-8109u:       [DMESG-WARN][7] ([i915#15673]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9100/fi-cfl-8109u/igt@core_auth@basic-auth.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/fi-cfl-8109u/igt@core_auth@basic-auth.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [DMESG-WARN][9] ([i915#15673]) -> [DMESG-WARN][10] ([i915#13735] / [i915#15673]) +46 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9100/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9100 -> IGTPW_15860

  CI-20190529: 20190529
  CI_DRM_19171: 6b4d0736397bb9f50d808d5659401c1db3d65258 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15860: 9e79cac8859107618484fd17b96d82f809fd9aca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/index.html

--===============1675591007307728711==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: Add support for background color testing. (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167119/">https://patchwork.freedesktop.org/series/167119/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9100 -&gt; IGTPW_15860</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15860 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15860, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15860:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9100/fi-skl-6600u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/fi-skl-6600u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15860 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9100/fi-cfl-8109u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/fi-cfl-8109u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9100/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/fi-cfl-8109u/igt@kms_addfb_basic@too-high.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +47 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9100/fi-cfl-8109u/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/fi-cfl-8109u/igt@core_auth@basic-auth.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc:<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9100/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15860/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +46 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9100 -&gt; IGTPW_15860</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19171: 6b4d0736397bb9f50d808d5659401c1db3d65258 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15860: 9e79cac8859107618484fd17b96d82f809fd9aca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1675591007307728711==--
