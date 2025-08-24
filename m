Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07034CA0EFC
	for <igt-dev@archiver.kernel.org>; Sun, 24 Aug 2025 20:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC1D10E215;
	Sun, 24 Aug 2025 20:20:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8836310E215;
 Sun, 24 Aug 2025 20:20:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7735280967079607535=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/fbdev=3A_Skip_resolut?=
 =?utf-8?q?ion_mismatch_due_to_KMD_issue_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Aug 2025 20:20:12 -0000
Message-ID: <175606681255.264230.8904070024031328862@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250810182741.1167155-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250810182741.1167155-1-ramanaidu.naladala@intel.com>
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

--===============7735280967079607535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/fbdev: Skip resolution mismatch due to KMD issue (rev2)
URL   : https://patchwork.freedesktop.org/series/152733/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8504_BAT -> XEIGTPW_13624_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13624_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13624/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][3] ([Intel XE#5783]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13624/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html

  
#### Warnings ####

  * igt@fbdev@info:
    - bat-adlp-vm:        [SKIP][5] ([Intel XE#2134] / [Intel XE#5567]) -> [SKIP][6] ([Intel XE#2134]) +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/bat-adlp-vm/igt@fbdev@info.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13624/bat-adlp-vm/igt@fbdev@info.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5567]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5567
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8504 -> IGTPW_13624
  * Linux: xe-3597-cca87ca63e2f5b8a785dc59c23e526987530b27f -> xe-3605-9e33e18c6600384e02ad1d54cdfd939a4dbe3e57

  IGTPW_13624: 13624
  IGT_8504: 8504
  xe-3597-cca87ca63e2f5b8a785dc59c23e526987530b27f: cca87ca63e2f5b8a785dc59c23e526987530b27f
  xe-3605-9e33e18c6600384e02ad1d54cdfd939a4dbe3e57: 9e33e18c6600384e02ad1d54cdfd939a4dbe3e57

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13624/index.html

--===============7735280967079607535==
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
<tr><td><b>Series:</b></td><td>tests/fbdev: Skip resolution mismatch due to KMD issue (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152733/">https://patchwork.freedesktop.org/series/152733/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13624/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13624/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8504_BAT -&gt; XEIGTPW_13624_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13624_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13624/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13624/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@fbdev@info:<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/bat-adlp-vm/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5567">Intel XE#5567</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13624/bat-adlp-vm/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8504 -&gt; IGTPW_13624</li>
<li>Linux: xe-3597-cca87ca63e2f5b8a785dc59c23e526987530b27f -&gt; xe-3605-9e33e18c6600384e02ad1d54cdfd939a4dbe3e57</li>
</ul>
<p>IGTPW_13624: 13624<br />
  IGT_8504: 8504<br />
  xe-3597-cca87ca63e2f5b8a785dc59c23e526987530b27f: cca87ca63e2f5b8a785dc59c23e526987530b27f<br />
  xe-3605-9e33e18c6600384e02ad1d54cdfd939a4dbe3e57: 9e33e18c6600384e02ad1d54cdfd939a4dbe3e57</p>

</body>
</html>

--===============7735280967079607535==--
