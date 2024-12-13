Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455A3E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 09:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E718F10EF8C;
	Fri, 13 Dec 2024 09:58:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A1D10EF8C;
 Fri, 13 Dec 2024 09:58:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8859052543144169877=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fvm=5Fcreat?=
 =?utf-8?q?e=3A_Check_negative_cases_for_vm=5Fcreate_ioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Dec 2024 09:58:40 -0000
Message-ID: <173408392058.2074938.15017802313261901339@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213075724.641859-1-pravalika.gurram@intel.com>
In-Reply-To: <20241213075724.641859-1-pravalika.gurram@intel.com>
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

--===============8859052543144169877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm_create: Check negative cases for vm_create ioctl
URL   : https://patchwork.freedesktop.org/series/142527/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8154_BAT -> XEIGTPW_12310_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12310_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3729])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12310/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [DMESG-WARN][3] ([Intel XE#3729]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12310/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  
  [Intel XE#3729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729


Build changes
-------------

  * IGT: IGT_8154 -> IGTPW_12310
  * Linux: xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc -> xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3

  IGTPW_12310: 723b9d7786f2ef1fba6b404fc8a3ed7e6831da65 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc: 1833817dea7ab2961cc662bfc451bc232c5d24cc
  xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3: a4502e763bb931b68fa9be46262724a61ae951e3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12310/index.html

--===============8859052543144169877==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm_create: Check negative cases for vm_create ioctl</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142527/">https://patchwork.freedesktop.org/series/142527/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12310/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12310/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8154_BAT -&gt; XEIGTPW_12310_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12310_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12310/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729">Intel XE#3729</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@a-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8154/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729">Intel XE#3729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12310/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8154 -&gt; IGTPW_12310</li>
<li>Linux: xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc -&gt; xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3</li>
</ul>
<p>IGTPW_12310: 723b9d7786f2ef1fba6b404fc8a3ed7e6831da65 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2364-1833817dea7ab2961cc662bfc451bc232c5d24cc: 1833817dea7ab2961cc662bfc451bc232c5d24cc<br />
  xe-2368-a4502e763bb931b68fa9be46262724a61ae951e3: a4502e763bb931b68fa9be46262724a61ae951e3</p>

</body>
</html>

--===============8859052543144169877==--
