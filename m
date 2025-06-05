Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F7DC5B543
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 17:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDD010E162;
	Thu,  5 Jun 2025 17:45:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227D410E162;
 Thu,  5 Jun 2025 17:45:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3504895061777523974=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Control_compute-preempt_bo_?=
 =?utf-8?q?allocation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Jun 2025 17:45:01 -0000
Message-ID: <174914550113.52730.13505743789405494758@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605142824.380177-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250605142824.380177-4-zbigniew.kempczynski@intel.com>
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

--===============3504895061777523974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Control compute-preempt bo allocation (rev2)
URL   : https://patchwork.freedesktop.org/series/149833/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8396_BAT -> XEIGTPW_13247_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13247_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13247_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13247_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8396/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13247/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13247_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-lnl-2:          [PASS][3] -> [ABORT][4] ([Intel XE#5003])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8396/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13247/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  
  [Intel XE#5003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5003


Build changes
-------------

  * IGT: IGT_8396 -> IGTPW_13247
  * Linux: xe-3194-573b98ac3ff9ff95c3316789e97980277e4ffe2b -> xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311

  IGTPW_13247: 4fc6586b9a42f8c15d738726beb920921f655a70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8396: 8396
  xe-3194-573b98ac3ff9ff95c3316789e97980277e4ffe2b: 573b98ac3ff9ff95c3316789e97980277e4ffe2b
  xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311: 4a82dcabe4230c77b75d4d4d10829458c6acb311

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13247/index.html

--===============3504895061777523974==
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
<tr><td><b>Series:</b></td><td>Control compute-preempt bo allocation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149833/">https://patchwork.freedesktop.org/series/149833/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13247/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13247/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8396_BAT -&gt; XEIGTPW_13247_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13247_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13247_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13247_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8396/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13247/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13247_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-4-tiled:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8396/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13247/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5003">Intel XE#5003</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8396 -&gt; IGTPW_13247</li>
<li>Linux: xe-3194-573b98ac3ff9ff95c3316789e97980277e4ffe2b -&gt; xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311</li>
</ul>
<p>IGTPW_13247: 4fc6586b9a42f8c15d738726beb920921f655a70 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8396: 8396<br />
  xe-3194-573b98ac3ff9ff95c3316789e97980277e4ffe2b: 573b98ac3ff9ff95c3316789e97980277e4ffe2b<br />
  xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311: 4a82dcabe4230c77b75d4d4d10829458c6acb311</p>

</body>
</html>

--===============3504895061777523974==--
