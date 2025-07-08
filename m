Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580A3C83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 21:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9BE10E1C6;
	Tue,  8 Jul 2025 21:45:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B628510E6F2;
 Tue,  8 Jul 2025 21:45:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3138657201391651890=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Replace_intel=5Fsysfs=5Fdeb?=
 =?utf-8?q?ugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Jul 2025 21:45:11 -0000
Message-ID: <175201111173.145764.1722860856252103771@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708144039.53482-1-peter.senna@linux.intel.com>
In-Reply-To: <20250708144039.53482-1-peter.senna@linux.intel.com>
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

--===============3138657201391651890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Replace intel_sysfs_debugfs
URL   : https://patchwork.freedesktop.org/series/151342/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8447_BAT -> XEIGTPW_13432_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8447_BAT and XEIGTPW_13432_BAT:

### New IGT tests (4) ###

  * igt@core_debugfs@read-all-entries:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.12] s

  * igt@core_sysfs@read-all-entries:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_debugfs@xe-base:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_debugfs@xe-forcewake:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_13432_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13432/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8447 -> IGTPW_13432
  * Linux: xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99 -> xe-3374-979c7404b39440741bb47c65938cb260bb76ccf4

  IGTPW_13432: 672763e30f77db7e8e810be28da4bc6df49d2940 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8447: 8447
  xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99: 572882b22b077b1ef991abbe423d8c4bcb9d4a99
  xe-3374-979c7404b39440741bb47c65938cb260bb76ccf4: 979c7404b39440741bb47c65938cb260bb76ccf4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13432/index.html

--===============3138657201391651890==
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
<tr><td><b>Series:</b></td><td>Replace intel_sysfs_debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151342/">https://patchwork.freedesktop.org/series/151342/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13432/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13432/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8447_BAT -&gt; XEIGTPW_13432_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8447_BAT and XEIGTPW_13432_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@core_debugfs@read-all-entries:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@core_sysfs@read-all-entries:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@xe-base:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@xe-forcewake:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13432_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13432/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8447 -&gt; IGTPW_13432</li>
<li>Linux: xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99 -&gt; xe-3374-979c7404b39440741bb47c65938cb260bb76ccf4</li>
</ul>
<p>IGTPW_13432: 672763e30f77db7e8e810be28da4bc6df49d2940 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8447: 8447<br />
  xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99: 572882b22b077b1ef991abbe423d8c4bcb9d4a99<br />
  xe-3374-979c7404b39440741bb47c65938cb260bb76ccf4: 979c7404b39440741bb47c65938cb260bb76ccf4</p>

</body>
</html>

--===============3138657201391651890==--
