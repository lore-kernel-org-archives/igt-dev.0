Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B761CCD1BC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 07:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE3110E89F;
	Thu, 23 Oct 2025 07:37:23 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9D210E8A3;
 Thu, 23 Oct 2025 07:37:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3290702994357361502=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fallocator=2C_te?=
 =?utf-8?q?sts/kms=5Fconcurrent=2C_tests/api=5Fintel=5Fallocator=3A_check_fo?=
 =?utf-8?q?r_sysvipc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebinraj, S" <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 Oct 2025 07:37:22 -0000
Message-ID: <176120504205.45572.13208049231252645780@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251023063113.3485132-1-s.sebinraj@intel.com>
In-Reply-To: <20251023063113.3485132-1-s.sebinraj@intel.com>
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

--===============3290702994357361502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_allocator, tests/kms_concurrent, tests/api_intel_allocator: check for sysvipc
URL   : https://patchwork.freedesktop.org/series/156398/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8595_BAT -> XEIGTPW_13932_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-ptl-vm 

Known issues
------------

  Here are the changes found in XEIGTPW_13932_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13932/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8595 -> IGTPW_13932

  IGTPW_13932: c1a5acc544f233fd6c4b4b992f90f33096db6488 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8595: 8595
  xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd: 71929a54e8bb5da291d41a931d80c6c9160073dd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13932/index.html

--===============3290702994357361502==
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
<tr><td><b>Series:</b></td><td>lib/intel_allocator, tests/kms_concurrent, tests/api_intel_allocator: check for sysvipc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156398/">https://patchwork.freedesktop.org/series/156398/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13932/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13932/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8595_BAT -&gt; XEIGTPW_13932_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13932_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8595/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13932/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8595 -&gt; IGTPW_13932</li>
</ul>
<p>IGTPW_13932: c1a5acc544f233fd6c4b4b992f90f33096db6488 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8595: 8595<br />
  xe-3969-71929a54e8bb5da291d41a931d80c6c9160073dd: 71929a54e8bb5da291d41a931d80c6c9160073dd</p>

</body>
</html>

--===============3290702994357361502==--
