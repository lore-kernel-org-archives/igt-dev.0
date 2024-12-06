Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ACBE7717B
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 04:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D3710E1E1;
	Fri,  6 Dec 2024 04:57:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2DD10E1E1;
 Fri,  6 Dec 2024 04:57:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5243210793532894472=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fcap?=
 =?utf-8?q?ture=3A_Add_xe=5Fexec=5Fcapture_test_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 04:57:01 -0000
Message-ID: <173346102118.3172147.15314687923301417237@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205215735.295314-1-zhanjun.dong@intel.com>
In-Reply-To: <20241205215735.295314-1-zhanjun.dong@intel.com>
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

--===============5243210793532894472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_capture: Add xe_exec_capture test (rev5)
URL   : https://patchwork.freedesktop.org/series/140007/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8139_BAT -> XEIGTPW_12261_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12261_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12261_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12261_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8139/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12261/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12261_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#877]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8139/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12261/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8139 -> IGTPW_12261
  * Linux: xe-2328-1b7746f770882ce40dacae683e8e65657c40c2b7 -> xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422

  IGTPW_12261: eba40584ea93f752dfc8491a10478a6e0e2b807a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2328-1b7746f770882ce40dacae683e8e65657c40c2b7: 1b7746f770882ce40dacae683e8e65657c40c2b7
  xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422: e57b4b7cd137e0ae00d2601b4b55ab7f504da422

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12261/index.html

--===============5243210793532894472==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_capture: Add xe_exec_capture test (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140007/">https://patchwork.freedesktop.org/series/140007/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12261/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12261/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8139_BAT -&gt; XEIGTPW_12261_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12261_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12261_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12261_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@a-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8139/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12261/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12261_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8139/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12261/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8139 -&gt; IGTPW_12261</li>
<li>Linux: xe-2328-1b7746f770882ce40dacae683e8e65657c40c2b7 -&gt; xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422</li>
</ul>
<p>IGTPW_12261: eba40584ea93f752dfc8491a10478a6e0e2b807a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2328-1b7746f770882ce40dacae683e8e65657c40c2b7: 1b7746f770882ce40dacae683e8e65657c40c2b7<br />
  xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422: e57b4b7cd137e0ae00d2601b4b55ab7f504da422</p>

</body>
</html>

--===============5243210793532894472==--
