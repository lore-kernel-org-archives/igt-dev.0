Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9866AC3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 19:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5007C10E5E2;
	Tue, 13 May 2025 19:49:25 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A1610E5E2;
 Tue, 13 May 2025 19:49:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6607091485473758161=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/i915/pm=5Frc6=5Fresid?=
 =?utf-8?q?ency=3A_Use_sysfs_to_achieve_peak_frequency_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 May 2025 19:49:24 -0000
Message-ID: <174716576403.76772.13555887508976016269@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513183726.2118105-1-sk.anirban@intel.com>
In-Reply-To: <20250513183726.2118105-1-sk.anirban@intel.com>
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

--===============6607091485473758161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency (rev2)
URL   : https://patchwork.freedesktop.org/series/148054/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8362_BAT -> XEIGTPW_13119_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13119_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@render@render-xmajor-256:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13119/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8362 -> IGTPW_13119
  * Linux: xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c -> xe-3082-d0d3c136f60cbee6ede33f207b4e6d6b2f04779d

  IGTPW_13119: 13119
  IGT_8362: 8362
  xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c: 3db1bb52113808f8bc72a7049e2d36e76acc882c
  xe-3082-d0d3c136f60cbee6ede33f207b4e6d6b2f04779d: d0d3c136f60cbee6ede33f207b4e6d6b2f04779d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13119/index.html

--===============6607091485473758161==
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
<tr><td><b>Series:</b></td><td>tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148054/">https://patchwork.freedesktop.org/series/148054/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13119/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13119/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8362_BAT -&gt; XEIGTPW_13119_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13119_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@render@render-xmajor-256:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13119/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8362 -&gt; IGTPW_13119</li>
<li>Linux: xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c -&gt; xe-3082-d0d3c136f60cbee6ede33f207b4e6d6b2f04779d</li>
</ul>
<p>IGTPW_13119: 13119<br />
  IGT_8362: 8362<br />
  xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c: 3db1bb52113808f8bc72a7049e2d36e76acc882c<br />
  xe-3082-d0d3c136f60cbee6ede33f207b4e6d6b2f04779d: d0d3c136f60cbee6ede33f207b4e6d6b2f04779d</p>

</body>
</html>

--===============6607091485473758161==--
