Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48CEC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 17:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764D010E1E5;
	Tue, 14 May 2024 17:11:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D7710E134;
 Tue, 14 May 2024 17:11:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8036287134518736873=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/xe/xe=5Fquery=3A_Wait_for_?=
 =?utf-8?q?xe=5Fsupports=5Ffaults?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 14 May 2024 17:11:36 -0000
Message-ID: <171570669633.2115685.8561835989167026520@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240514144122.3778902-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240514144122.3778902-1-jonathan.cavitt@intel.com>
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

--===============8036287134518736873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/xe_query: Wait for xe_supports_faults
URL   : https://patchwork.freedesktop.org/series/133612/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7853_BAT -> XEIGTPW_11142_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_11142_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11142_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11142_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#288]) -> [SKIP][2] +32 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7853/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11142/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][3] ([Intel XE#288]) -> [SKIP][4] +32 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7853/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11142/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][5] ([Intel XE#288]) -> [SKIP][6] +32 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7853/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11142/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * IGT: IGT_7853 -> IGTPW_11142
  * Linux: xe-1284-723adadf19b6bd8a54881b0e7d04ba56c4e8f401 -> xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123

  IGTPW_11142: 11142
  IGT_7853: b6c459b99abc85cad050b0b04faaca9fc3568a69 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1284-723adadf19b6bd8a54881b0e7d04ba56c4e8f401: 723adadf19b6bd8a54881b0e7d04ba56c4e8f401
  xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123: a0c161037de0a89c0a9ea744f60099a4f94cc123

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11142/index.html

--===============8036287134518736873==
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
<tr><td><b>Series:</b></td><td>lib/xe/xe_query: Wait for xe_supports_faults</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133612/">https://patchwork.freedesktop.org/series/133612/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11142/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11142/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7853_BAT -&gt; XEIGTPW_11142_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_11142_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11142_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11142_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7853/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11142/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7853/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11142/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7853/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11142/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7853 -&gt; IGTPW_11142</li>
<li>Linux: xe-1284-723adadf19b6bd8a54881b0e7d04ba56c4e8f401 -&gt; xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123</li>
</ul>
<p>IGTPW_11142: 11142<br />
  IGT_7853: b6c459b99abc85cad050b0b04faaca9fc3568a69 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1284-723adadf19b6bd8a54881b0e7d04ba56c4e8f401: 723adadf19b6bd8a54881b0e7d04ba56c4e8f401<br />
  xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123: a0c161037de0a89c0a9ea744f60099a4f94cc123</p>

</body>
</html>

--===============8036287134518736873==--
