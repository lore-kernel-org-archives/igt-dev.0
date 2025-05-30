Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230BAC54FB3
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 00:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A675810E25C;
	Fri, 30 May 2025 00:58:09 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000E710E25C;
 Fri, 30 May 2025 00:58:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2025074901330779845=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fvm=3A_Fix_?=
 =?utf-8?q?assertion_of_batch_buffer_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 May 2025 00:58:07 -0000
Message-ID: <174856668796.33574.15626459917021429097@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250530001844.703844-1-shuicheng.lin@intel.com>
In-Reply-To: <20250530001844.703844-1-shuicheng.lin@intel.com>
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

--===============2025074901330779845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Fix assertion of batch buffer size
URL   : https://patchwork.freedesktop.org/series/149674/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8384_BAT -> XEIGTPW_13215_BAT
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

  Here are the changes found in XEIGTPW_13215_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [ABORT][2] ([Intel XE#4624] / [Intel XE#4966])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8384/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13215/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966


Build changes
-------------

  * IGT: IGT_8384 -> IGTPW_13215
  * Linux: xe-3159-fa1643bc73a08623ea7f1497258298b0d16a629f -> xe-3162-d13149a0144b46cf1b3a5fbcbecd8733256166d2

  IGTPW_13215: 13215
  IGT_8384: 8384
  xe-3159-fa1643bc73a08623ea7f1497258298b0d16a629f: fa1643bc73a08623ea7f1497258298b0d16a629f
  xe-3162-d13149a0144b46cf1b3a5fbcbecd8733256166d2: d13149a0144b46cf1b3a5fbcbecd8733256166d2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13215/index.html

--===============2025074901330779845==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Fix assertion of batch buffer size</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149674/">https://patchwork.freedesktop.org/series/149674/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13215/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13215/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8384_BAT -&gt; XEIGTPW_13215_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13215_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8384/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13215/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8384 -&gt; IGTPW_13215</li>
<li>Linux: xe-3159-fa1643bc73a08623ea7f1497258298b0d16a629f -&gt; xe-3162-d13149a0144b46cf1b3a5fbcbecd8733256166d2</li>
</ul>
<p>IGTPW_13215: 13215<br />
  IGT_8384: 8384<br />
  xe-3159-fa1643bc73a08623ea7f1497258298b0d16a629f: fa1643bc73a08623ea7f1497258298b0d16a629f<br />
  xe-3162-d13149a0144b46cf1b3a5fbcbecd8733256166d2: d13149a0144b46cf1b3a5fbcbecd8733256166d2</p>

</body>
</html>

--===============2025074901330779845==--
