Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99434C5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 19:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AF810E7C2;
	Mon, 26 Feb 2024 19:42:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBD810E7C9;
 Mon, 26 Feb 2024 19:42:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3506302179785511859=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/rendercopy=3A_Fix_Xe2_pixe?=
 =?utf-8?q?l_shader_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Feb 2024 19:42:51 -0000
Message-ID: <170897657111.299097.6470280152815659540@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226114511.51753-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240226114511.51753-1-zbigniew.kempczynski@intel.com>
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

--===============3506302179785511859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/rendercopy: Fix Xe2 pixel shader (rev2)
URL   : https://patchwork.freedesktop.org/series/130379/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7731_BAT -> XEIGTPW_10735_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10735_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [DMESG-WARN][1] ([Intel XE#1009]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10735/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_threads@threads-basic:
    - bat-dg2-oem2:       [DMESG-WARN][3] ([Intel XE#1232]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10735/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#1192]) -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10735/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1232]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232


Build changes
-------------

  * IGT: IGT_7731 -> IGTPW_10735
  * Linux: xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5 -> xe-853-f1086cb1e2afe822e402ae390bedfdc734a9eea6

  IGTPW_10735: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10735/index.html
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5: 3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5
  xe-853-f1086cb1e2afe822e402ae390bedfdc734a9eea6: f1086cb1e2afe822e402ae390bedfdc734a9eea6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10735/index.html

--===============3506302179785511859==
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
<tr><td><b>Series:</b></td><td>lib/rendercopy: Fix Xe2 pixel shader (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130379/">https://patchwork.freedesktop.org/series/130379/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10735/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10735/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7731_BAT -&gt; XEIGTPW_10735_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10735_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009">Intel XE#1009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10735/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232">Intel XE#1232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10735/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10735/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7731 -&gt; IGTPW_10735</li>
<li>Linux: xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5 -&gt; xe-853-f1086cb1e2afe822e402ae390bedfdc734a9eea6</li>
</ul>
<p>IGTPW_10735: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10735/index.html<br />
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5: 3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5<br />
  xe-853-f1086cb1e2afe822e402ae390bedfdc734a9eea6: f1086cb1e2afe822e402ae390bedfdc734a9eea6</p>

</body>
</html>

--===============3506302179785511859==--
