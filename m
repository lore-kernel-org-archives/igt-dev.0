Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081F2C3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 11:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BCC10E2C0;
	Fri, 23 May 2025 11:36:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0558B10E2C0;
 Fri, 23 May 2025 11:36:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4180719740158974172=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Improve_mem-copy/mem-set_li?=
 =?utf-8?q?b_and_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 May 2025 11:36:28 -0000
Message-ID: <174800018801.17257.10333647749009133395@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
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

--===============4180719740158974172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve mem-copy/mem-set lib and tests (rev2)
URL   : https://patchwork.freedesktop.org/series/148977/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8377_BAT -> XEIGTPW_13174_BAT
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

  Here are the changes found in XEIGTPW_13174_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#5002])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8377/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13174/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:
    - bat-lnl-2:          [PASS][3] -> [INCOMPLETE][4] ([Intel XE#4966]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8377/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13174/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html

  
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966
  [Intel XE#5002]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5002


Build changes
-------------

  * IGT: IGT_8377 -> IGTPW_13174

  IGTPW_13174: 8fb03fd8fec1b3e78e7892c91b7396b8201fa396 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8377: b8dfaa900e3eadadfdba19f075157983d6dbd5b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848: dad3dc322768427e2ecb1a887cb3b710f8bc6848

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13174/index.html

--===============4180719740158974172==
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
<tr><td><b>Series:</b></td><td>Improve mem-copy/mem-set lib and tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148977/">https://patchwork.freedesktop.org/series/148977/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13174/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13174/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8377_BAT -&gt; XEIGTPW_13174_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13174_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8377/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13174/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5002">Intel XE#5002</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8377/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13174/bat-lnl-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8377 -&gt; IGTPW_13174</li>
</ul>
<p>IGTPW_13174: 8fb03fd8fec1b3e78e7892c91b7396b8201fa396 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8377: b8dfaa900e3eadadfdba19f075157983d6dbd5b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3131-dad3dc322768427e2ecb1a887cb3b710f8bc6848: dad3dc322768427e2ecb1a887cb3b710f8bc6848</p>

</body>
</html>

--===============4180719740158974172==--
