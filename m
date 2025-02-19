Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B01C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 11:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D8710E2A0;
	Wed, 19 Feb 2025 11:06:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AFF10E29E;
 Wed, 19 Feb 2025 11:05:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0787405456657757981=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_intel=5Freg=3A_add_support_?=
 =?utf-8?q?to_reading_reg_with_debugfs_ioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Feb 2025 11:05:59 -0000
Message-ID: <173996315986.3912390.10528584733149142670@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218090122.245662-1-dafna.hirschfeld@intel.com>
In-Reply-To: <20250218090122.245662-1-dafna.hirschfeld@intel.com>
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

--===============0787405456657757981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel_reg: add support to reading reg with debugfs ioctl
URL   : https://patchwork.freedesktop.org/series/145064/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8238_BAT -> XEIGTPW_12633_BAT
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

  Here are the changes found in XEIGTPW_12633_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#3890]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12633/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#3890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3890


Build changes
-------------

  * IGT: IGT_8238 -> IGTPW_12633

  IGTPW_12633: 12633
  IGT_8238: 7df82badac410a7ce2505df6064d44f0e094650c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f: 3d2fe90eb7c12b62ea0b181d227de9f9381c173f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12633/index.html

--===============0787405456657757981==
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
<tr><td><b>Series:</b></td><td>intel_reg: add support to reading reg with debugfs ioctl</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145064/">https://patchwork.freedesktop.org/series/145064/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12633/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12633/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8238_BAT -&gt; XEIGTPW_12633_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12633_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8238/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12633/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3890">Intel XE#3890</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8238 -&gt; IGTPW_12633</li>
</ul>
<p>IGTPW_12633: 12633<br />
  IGT_8238: 7df82badac410a7ce2505df6064d44f0e094650c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f: 3d2fe90eb7c12b62ea0b181d227de9f9381c173f</p>

</body>
</html>

--===============0787405456657757981==--
