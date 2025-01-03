Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4240FE77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 13:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00FF10E348;
	Fri,  3 Jan 2025 13:43:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089E710E348;
 Fri,  3 Jan 2025 13:43:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2268312662533501416=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdirtyfb?=
 =?utf-8?q?=3A_Add_skip_condition_for_bmg_platform_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Jan 2025 13:43:03 -0000
Message-ID: <173591178304.2640032.3233078077964895101@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241113174118.158849-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241113174118.158849-1-mohammed.thasleem@intel.com>
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

--===============2268312662533501416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dirtyfb: Add skip condition for bmg platform (rev4)
URL   : https://patchwork.freedesktop.org/series/141312/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8174_BAT -> XEIGTPW_12381_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_12381_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3958])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12381/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][3] -> [SKIP][4] ([Intel XE#1192]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12381/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][5] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][6] ([Intel XE#1192])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12381/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8174 -> IGTPW_12381
  * Linux: xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642 -> xe-2430-901262fb6987b4fa0dbb26979a6c4e25f0ba8fd2

  IGTPW_12381: 074bed11364d33d37b2f359f4a7742697744decb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642: 08bd590935a5258ffd79355c59adffd72fb2c642
  xe-2430-901262fb6987b4fa0dbb26979a6c4e25f0ba8fd2: 901262fb6987b4fa0dbb26979a6c4e25f0ba8fd2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12381/index.html

--===============2268312662533501416==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dirtyfb: Add skip condition for bmg platform (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141312/">https://patchwork.freedesktop.org/series/141312/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12381/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12381/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8174_BAT -&gt; XEIGTPW_12381_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12381_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12381/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12381/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8174/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12381/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8174 -&gt; IGTPW_12381</li>
<li>Linux: xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642 -&gt; xe-2430-901262fb6987b4fa0dbb26979a6c4e25f0ba8fd2</li>
</ul>
<p>IGTPW_12381: 074bed11364d33d37b2f359f4a7742697744decb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2424-08bd590935a5258ffd79355c59adffd72fb2c642: 08bd590935a5258ffd79355c59adffd72fb2c642<br />
  xe-2430-901262fb6987b4fa0dbb26979a6c4e25f0ba8fd2: 901262fb6987b4fa0dbb26979a6c4e25f0ba8fd2</p>

</body>
</html>

--===============2268312662533501416==--
