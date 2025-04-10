Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C40C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 16:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7AA10E367;
	Thu, 10 Apr 2025 16:38:20 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BEB10E134;
 Thu, 10 Apr 2025 16:38:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7234123515902267806=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/i915/pm=5Frc6=5Fresid?=
 =?utf-8?q?ency=3A_Use_sysfs_to_achieve_peak_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Apr 2025 16:38:20 -0000
Message-ID: <174430310036.366.10437120071178238714@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250410062522.715836-1-sk.anirban@intel.com>
In-Reply-To: <20250410062522.715836-1-sk.anirban@intel.com>
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

--===============7234123515902267806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/pm_rc6_residency: Use sysfs to achieve peak (rev2)
URL   : https://patchwork.freedesktop.org/series/147508/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8313_BAT -> XEIGTPW_12958_BAT
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

  Here are the changes found in XEIGTPW_12958_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-userptr-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8313/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12958/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - bat-atsm-2:         [SKIP][3] ([Intel XE#2134]) -> [PASS][4] +4 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8313/bat-atsm-2/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12958/bat-atsm-2/igt@fbdev@info.html

  
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8313 -> IGTPW_12958
  * Linux: xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8 -> xe-2931-457049ad31ee5b64dd86230518144d366c32bc04

  IGTPW_12958: 7b33f1c4e975a3c4d0822c00b170c8b905ca5f83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8313: 8313
  xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8: c54633598106dbdb97f3aa589587b8176009b6d8
  xe-2931-457049ad31ee5b64dd86230518144d366c32bc04: 457049ad31ee5b64dd86230518144d366c32bc04

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12958/index.html

--===============7234123515902267806==
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
<tr><td><b>Series:</b></td><td>tests/i915/pm_rc6_residency: Use sysfs to achieve peak (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147508/">https://patchwork.freedesktop.org/series/147508/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12958/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12958/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8313_BAT -&gt; XEIGTPW_12958_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12958_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8313/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12958/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@fbdev@info:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8313/bat-atsm-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12958/bat-atsm-2/igt@fbdev@info.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8313 -&gt; IGTPW_12958</li>
<li>Linux: xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8 -&gt; xe-2931-457049ad31ee5b64dd86230518144d366c32bc04</li>
</ul>
<p>IGTPW_12958: 7b33f1c4e975a3c4d0822c00b170c8b905ca5f83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8313: 8313<br />
  xe-2928-c54633598106dbdb97f3aa589587b8176009b6d8: c54633598106dbdb97f3aa589587b8176009b6d8<br />
  xe-2931-457049ad31ee5b64dd86230518144d366c32bc04: 457049ad31ee5b64dd86230518144d366c32bc04</p>

</body>
</html>

--===============7234123515902267806==--
