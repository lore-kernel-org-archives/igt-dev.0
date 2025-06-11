Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187E9C678DC
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 13:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C167110E351;
	Wed, 11 Jun 2025 13:44:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118D210E664;
 Wed, 11 Jun 2025 13:44:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3167427802398894046=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5F*=3A_Use_N?=
 =?utf-8?q?EEDS=5FVISIBLE=5FVRAM_flag_where_it=27s_missing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Jun 2025 13:44:27 -0000
Message-ID: <174964946708.67578.12632524608177192843@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611095711.14864-1-lukasz.laguna@intel.com>
In-Reply-To: <20250611095711.14864-1-lukasz.laguna@intel.com>
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

--===============3167427802398894046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM flag where it's missing
URL   : https://patchwork.freedesktop.org/series/150085/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8404_BAT -> XEIGTPW_13271_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13271_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@runner@aborted:
    - bat-bmg-2:          [FAIL][1] ([Intel XE#5080]) -> [FAIL][2] ([Intel XE#5234])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8404/bat-bmg-2/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13271/bat-bmg-2/igt@runner@aborted.html
    - bat-bmg-1:          [FAIL][3] ([Intel XE#5080]) -> [FAIL][4] ([Intel XE#5234])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8404/bat-bmg-1/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13271/bat-bmg-1/igt@runner@aborted.html

  
  [Intel XE#5080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5080
  [Intel XE#5234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5234


Build changes
-------------

  * IGT: IGT_8404 -> IGTPW_13271
  * Linux: xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60 -> xe-3228-75a3db419dd3fe2571233423d5ca01c34d7ee75a

  IGTPW_13271: 24980994f399003bda891f4a1f9b24e954d51c47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60: 7bc153635620254b73cfe8714ce42768b2bf6d60
  xe-3228-75a3db419dd3fe2571233423d5ca01c34d7ee75a: 75a3db419dd3fe2571233423d5ca01c34d7ee75a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13271/index.html

--===============3167427802398894046==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM flag where it&#x27;s missing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150085/">https://patchwork.freedesktop.org/series/150085/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13271/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13271/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8404_BAT -&gt; XEIGTPW_13271_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13271_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8404/bat-bmg-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5080">Intel XE#5080</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13271/bat-bmg-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5234">Intel XE#5234</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8404/bat-bmg-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5080">Intel XE#5080</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13271/bat-bmg-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5234">Intel XE#5234</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8404 -&gt; IGTPW_13271</li>
<li>Linux: xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60 -&gt; xe-3228-75a3db419dd3fe2571233423d5ca01c34d7ee75a</li>
</ul>
<p>IGTPW_13271: 24980994f399003bda891f4a1f9b24e954d51c47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60: 7bc153635620254b73cfe8714ce42768b2bf6d60<br />
  xe-3228-75a3db419dd3fe2571233423d5ca01c34d7ee75a: 75a3db419dd3fe2571233423d5ca01c34d7ee75a</p>

</body>
</html>

--===============3167427802398894046==--
