Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F63CC3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 14:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A6110E202;
	Thu,  3 Apr 2025 14:07:14 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C669810E202;
 Thu,  3 Apr 2025 14:07:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2932341085873197792=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel=3A_Remove_debug?=
 =?utf-8?q?fs=5Ftest_and_xe=5Fdebugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 03 Apr 2025 14:07:13 -0000
Message-ID: <174368923380.33499.3258620649318387801@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403102313.181408-1-peter.senna@linux.intel.com>
In-Reply-To: <20250403102313.181408-1-peter.senna@linux.intel.com>
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

--===============2932341085873197792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Remove debugfs_test and xe_debugfs
URL   : https://patchwork.freedesktop.org/series/147202/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8303_BAT -> XEIGTPW_12912_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12912_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries}:
    - bat-adlp-vf:        NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12912/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
    - bat-lnl-2:          NOTRUN -> [DMESG-WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12912/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12912_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624


Build changes
-------------

  * IGT: IGT_8303 -> IGTPW_12912

  IGTPW_12912: 12912
  IGT_8303: 4030608e18806243e34ecd3b0b64494fc7d2f9fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7: 71dac8dae6cc024b633bd6e584f4195c44c0dbc7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12912/index.html

--===============2932341085873197792==
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
<tr><td><b>Series:</b></td><td>tests/intel: Remove debugfs_test and xe_debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147202/">https://patchwork.freedesktop.org/series/147202/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12912/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12912/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8303_BAT -&gt; XEIGTPW_12912_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12912_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries}:<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12912/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a></li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12912/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12912_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8303 -&gt; IGTPW_12912</li>
</ul>
<p>IGTPW_12912: 12912<br />
  IGT_8303: 4030608e18806243e34ecd3b0b64494fc7d2f9fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7: 71dac8dae6cc024b633bd6e584f4195c44c0dbc7</p>

</body>
</html>

--===============2932341085873197792==--
