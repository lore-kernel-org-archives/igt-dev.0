Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F4DC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 08:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D23D10F357;
	Tue, 16 Apr 2024 08:22:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5530710F357;
 Tue, 16 Apr 2024 08:22:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1607636057295478392=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/kunit=3A_Read_results_from?=
 =?utf-8?q?_debugfs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 16 Apr 2024 08:22:06 -0000
Message-ID: <171325572634.1424598.1892254293869268790@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415173405.120137-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240415173405.120137-2-janusz.krzysztofik@linux.intel.com>
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

--===============1607636057295478392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kunit: Read results from debugfs (rev3)
URL   : https://patchwork.freedesktop.org/series/131686/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7807_BAT -> XEIGTPW_11024_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11024_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - {bat-lnl-1}:        [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7807/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11024/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11024_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [PASS][3] -> [TIMEOUT][4] ([Intel XE#1259] / [Intel XE#1473])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7807/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11024/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473


Build changes
-------------

  * IGT: IGT_7807 -> IGTPW_11024

  IGTPW_11024: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/index.html
  IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 5f7597e990bea547bd1261170497e7476fb781bb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11024/index.html

--===============1607636057295478392==
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
<tr><td><b>Series:</b></td><td>lib/kunit: Read results from debugfs (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131686/">https://patchwork.freedesktop.org/series/131686/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11024/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11024/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7807_BAT -&gt; XEIGTPW_11024_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11024_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7807/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11024/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11024_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7807/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11024/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7807 -&gt; IGTPW_11024</li>
</ul>
<p>IGTPW_11024: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/index.html<br />
  IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 5f7597e990bea547bd1261170497e7476fb781bb</p>

</body>
</html>

--===============1607636057295478392==--
