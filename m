Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FF8C3601B
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 09:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7266710E973;
	Thu,  3 Apr 2025 09:49:15 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4751F10E973;
 Thu,  3 Apr 2025 09:49:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0898426348589162692=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fallocator=3A_pr?=
 =?utf-8?q?otect_binding_for_multithreaded_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 03 Apr 2025 09:49:14 -0000
Message-ID: <174367375428.32001.181823837407653210@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403083438.132035-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250403083438.132035-1-zbigniew.kempczynski@intel.com>
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

--===============0898426348589162692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_allocator: protect binding for multithreaded tests
URL   : https://patchwork.freedesktop.org/series/147185/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8302_BAT -> XEIGTPW_12910_BAT
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

  Here are the changes found in XEIGTPW_12910_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8302/bat-adlp-vf/igt@xe_exec_compute_mode@twice-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12910/bat-adlp-vf/igt@xe_exec_compute_mode@twice-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8302 -> IGTPW_12910
  * Linux: xe-2899-8f917568adaeea8b649e337e7d0e03bd03332253 -> xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded

  IGTPW_12910: e001e81ad34c35b8ce7af3a1a9cee26ec10a414c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8302: e2f972e6e21cd7bae732a649889325d2175bd1a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2899-8f917568adaeea8b649e337e7d0e03bd03332253: 8f917568adaeea8b649e337e7d0e03bd03332253
  xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded: 135e2838ed7d44d880e7e19971b1234e6ae04ded

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12910/index.html

--===============0898426348589162692==
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
<tr><td><b>Series:</b></td><td>lib/intel_allocator: protect binding for multithreaded tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147185/">https://patchwork.freedesktop.org/series/147185/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12910/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12910/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8302_BAT -&gt; XEIGTPW_12910_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12910_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8302/bat-adlp-vf/igt@xe_exec_compute_mode@twice-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12910/bat-adlp-vf/igt@xe_exec_compute_mode@twice-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8302 -&gt; IGTPW_12910</li>
<li>Linux: xe-2899-8f917568adaeea8b649e337e7d0e03bd03332253 -&gt; xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded</li>
</ul>
<p>IGTPW_12910: e001e81ad34c35b8ce7af3a1a9cee26ec10a414c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8302: e2f972e6e21cd7bae732a649889325d2175bd1a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2899-8f917568adaeea8b649e337e7d0e03bd03332253: 8f917568adaeea8b649e337e7d0e03bd03332253<br />
  xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded: 135e2838ed7d44d880e7e19971b1234e6ae04ded</p>

</body>
</html>

--===============0898426348589162692==--
