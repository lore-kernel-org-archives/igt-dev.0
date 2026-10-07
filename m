Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179A8CA5FFF
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 06:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7979810E23D;
	Wed,  7 Oct 2026 06:10:38 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B366D10E23D;
 Wed,  7 Oct 2026 06:09:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4647880585926982314=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Revert_=22tests/intel/xe=5F?=
 =?utf-8?q?pm=3A_add_coverage_for_xe=5Fdevice=5Fsysfs=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Oct 2026 06:09:51 -0000
Message-ID: <179135339172.246459.11547857731489390225@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261007051044.6399-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261007051044.6399-1-shivtej.eknath.patil@intel.com>
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

--===============4647880585926982314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "tests/intel/xe_pm: add coverage for xe_device_sysfs"
URL   : https://patchwork.freedesktop.org/series/175641/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9131_BAT -> XEIGTPW_15948_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15948_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9131/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15948/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-nvls-1:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#8762] / [Intel XE#9069])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9131/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15948/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9131 -> IGTPW_15948
  * Linux: xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c -> xe-5899-daeb062fc40f727fafefed080c6d12a5ad1d0d12

  IGTPW_15948: 15948
  IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c: 7db399fbf387d3656d4a43bdc7d9580e3880bc2c
  xe-5899-daeb062fc40f727fafefed080c6d12a5ad1d0d12: daeb062fc40f727fafefed080c6d12a5ad1d0d12

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15948/index.html

--===============4647880585926982314==
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
<tr><td><b>Series:</b></td><td>Revert &quot;tests/intel/xe_pm: add coverage for xe_device_sysfs&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175641/">https://patchwork.freedesktop.org/series/175641/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15948/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15948/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9131_BAT -&gt; XEIGTPW_15948_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15948_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9131/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15948/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9131/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15948/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9131 -&gt; IGTPW_15948</li>
<li>Linux: xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c -&gt; xe-5899-daeb062fc40f727fafefed080c6d12a5ad1d0d12</li>
</ul>
<p>IGTPW_15948: 15948<br />
  IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5895-7db399fbf387d3656d4a43bdc7d9580e3880bc2c: 7db399fbf387d3656d4a43bdc7d9580e3880bc2c<br />
  xe-5899-daeb062fc40f727fafefed080c6d12a5ad1d0d12: daeb062fc40f727fafefed080c6d12a5ad1d0d12</p>

</body>
</html>

--===============4647880585926982314==--
