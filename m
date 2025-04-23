Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA131C369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 21:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F0410E26E;
	Wed, 23 Apr 2025 21:43:22 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8812410E26E;
 Wed, 23 Apr 2025 21:43:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0210169162132087812=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/i915/pm=5Frc6=5Fresid?=
 =?utf-8?q?ency=3A_Use_sysfs_to_achieve_peak_frequency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 23 Apr 2025 21:43:20 -0000
Message-ID: <174544460056.2583.9506668110482954779@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250422063135.2502377-1-sk.anirban@intel.com>
In-Reply-To: <20250422063135.2502377-1-sk.anirban@intel.com>
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

--===============0210169162132087812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
URL   : https://patchwork.freedesktop.org/series/148054/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8330_BAT -> XEIGTPW_13017_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13017_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4829]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8330/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13017/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
  [Intel XE#4829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829


Build changes
-------------

  * IGT: IGT_8330 -> IGTPW_13017
  * Linux: xe-2980-ea9f9455f18d0eb18b81cf146b527d577cb6192d -> xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191

  IGTPW_13017: 9cdc93196255097fd9e4f4b01488fa1ee8cba58e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8330: 3ce68222e02fcfb1e12827e49e774bc58f69c9ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2980-ea9f9455f18d0eb18b81cf146b527d577cb6192d: ea9f9455f18d0eb18b81cf146b527d577cb6192d
  xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191: 97cf1c266145ae8b2bb3f78168d795930a3f5191

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13017/index.html

--===============0210169162132087812==
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
<tr><td><b>Series:</b></td><td>tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148054/">https://patchwork.freedesktop.org/series/148054/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13017/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13017/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8330_BAT -&gt; XEIGTPW_13017_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13017_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8330/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13017/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4829">Intel XE#4829</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8330 -&gt; IGTPW_13017</li>
<li>Linux: xe-2980-ea9f9455f18d0eb18b81cf146b527d577cb6192d -&gt; xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191</li>
</ul>
<p>IGTPW_13017: 9cdc93196255097fd9e4f4b01488fa1ee8cba58e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8330: 3ce68222e02fcfb1e12827e49e774bc58f69c9ec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2980-ea9f9455f18d0eb18b81cf146b527d577cb6192d: ea9f9455f18d0eb18b81cf146b527d577cb6192d<br />
  xe-2981-97cf1c266145ae8b2bb3f78168d795930a3f5191: 97cf1c266145ae8b2bb3f78168d795930a3f5191</p>

</body>
</html>

--===============0210169162132087812==--
