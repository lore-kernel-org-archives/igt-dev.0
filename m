Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587E7EDEC15
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 06:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF4F10E239;
	Wed,  4 Mar 2026 06:40:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBF410E115;
 Wed,  4 Mar 2026 06:40:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0848659622879779392=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/core=5Fhotunplug=3A_O?=
 =?utf-8?q?pen_render_capable_DRM_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Mar 2026 06:40:11 -0000
Message-ID: <177260641146.313803.10466783331158950536@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <9e4d3126426686f9fde73011753ca1e85a32dd0d.1772578021.git.jagmeet.randhawa@intel.com>
In-Reply-To: <9e4d3126426686f9fde73011753ca1e85a32dd0d.1772578021.git.jagmeet.randhawa@intel.com>
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

--===============0848659622879779392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_hotunplug: Open render capable DRM device
URL   : https://patchwork.freedesktop.org/series/162532/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8777_BAT -> XEIGTPW_14659_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14659_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-bmg-2:          [DMESG-WARN][1] ([Intel XE#7433]) -> [PASS][2] +3 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8777/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14659/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-1:          [DMESG-WARN][3] ([Intel XE#7433]) -> [PASS][4] +3 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8777/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14659/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_module_load@load:
    - bat-bmg-3:          [DMESG-WARN][5] ([Intel XE#7433]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8777/bat-bmg-3/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14659/bat-bmg-3/igt@xe_module_load@load.html

  
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433


Build changes
-------------

  * IGT: IGT_8777 -> IGTPW_14659
  * Linux: xe-4645-3fe1f7a93adf8e03fb044eb57b63394afe6e139c -> xe-4655-cfc20c776480fda8c1b0517b187bb71ec0781cd4

  IGTPW_14659: 1895177636dc5b470251b5b7c515052dd5f4bfd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4645-3fe1f7a93adf8e03fb044eb57b63394afe6e139c: 3fe1f7a93adf8e03fb044eb57b63394afe6e139c
  xe-4655-cfc20c776480fda8c1b0517b187bb71ec0781cd4: cfc20c776480fda8c1b0517b187bb71ec0781cd4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14659/index.html

--===============0848659622879779392==
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
<tr><td><b>Series:</b></td><td>tests/core_hotunplug: Open render capable DRM device</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162532/">https://patchwork.freedesktop.org/series/162532/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14659/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14659/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8777_BAT -&gt; XEIGTPW_14659_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14659_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8777/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14659/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> +3 other tests pass</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8777/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14659/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8777/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14659/bat-bmg-3/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8777 -&gt; IGTPW_14659</li>
<li>Linux: xe-4645-3fe1f7a93adf8e03fb044eb57b63394afe6e139c -&gt; xe-4655-cfc20c776480fda8c1b0517b187bb71ec0781cd4</li>
</ul>
<p>IGTPW_14659: 1895177636dc5b470251b5b7c515052dd5f4bfd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4645-3fe1f7a93adf8e03fb044eb57b63394afe6e139c: 3fe1f7a93adf8e03fb044eb57b63394afe6e139c<br />
  xe-4655-cfc20c776480fda8c1b0517b187bb71ec0781cd4: cfc20c776480fda8c1b0517b187bb71ec0781cd4</p>

</body>
</html>

--===============0848659622879779392==--
