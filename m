Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E00C48BEB
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 16:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFE810E139;
	Wed, 21 Feb 2024 16:51:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B305810E139;
 Wed, 21 Feb 2024 16:51:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8134772832787709536=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_drm-uapi/xe=3A_Remove_unuse?=
 =?utf-8?q?d_flags_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Feb 2024 16:51:24 -0000
Message-ID: <170853428473.196549.13779529487223296481@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221160816.7-1-francois.dugast@intel.com>
In-Reply-To: <20240221160816.7-1-francois.dugast@intel.com>
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

--===============8134772832787709536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi/xe: Remove unused flags (rev2)
URL   : https://patchwork.freedesktop.org/series/130005/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14309 -> IGTPW_10713
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10713/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7719 -> IGTPW_10713

  CI-20190529: 20190529
  CI_DRM_14309: d528e13ba6b7bd7ed6ea2f973a70341ee93063af @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10713: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10713/index.html
  IGT_7719: 7719


Testlist changes
----------------

+igt@xe_exec_queue_property@invalid-property
+igt@xe_vm@bind-flag-invalid
-igt@xe_access_counter@invalid-param
-igt@xe_exec_fault_mode@many-basic-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm
-igt@xe_exec_fault_mode@many-execqueues-basic-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm
-igt@xe_exec_fault_mode@many-execqueues-rebind-imm
-igt@xe_exec_fault_mode@many-execqueues-userptr-imm
-igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm
-igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm
-igt@xe_exec_fault_mode@many-rebind-imm
-igt@xe_exec_fault_mode@many-userptr-imm
-igt@xe_exec_fault_mode@many-userptr-invalidate-imm
-igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@many-userptr-rebind-imm
-igt@xe_exec_fault_mode@once-basic-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm
-igt@xe_exec_fault_mode@once-rebind-imm
-igt@xe_exec_fault_mode@once-userptr-imm
-igt@xe_exec_fault_mode@once-userptr-invalidate-imm
-igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@once-userptr-rebind-imm
-igt@xe_exec_fault_mode@twice-basic-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm
-igt@xe_exec_fault_mode@twice-rebind-imm
-igt@xe_exec_fault_mode@twice-userptr-imm
-igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
-igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@twice-userptr-rebind-imm
-igt@xe_exec_queue_property@job_timeout_ms-property-min-max
-igt@xe_exec_queue_property@preempt_timeout_us-property-min-max
-igt@xe_exec_reset@cancel
-igt@xe_exec_reset@cm-execqueue-reset
-igt@xe_exec_reset@execqueue-reset
-igt@xe_exec_reset@parallel-cancel
-igt@xe_exec_reset@parallel-execqueue-reset
-igt@xe_exec_reset@virtual-cancel
-igt@xe_exec_reset@virtual-execqueue-reset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10713/index.html

--===============8134772832787709536==
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
<tr><td><b>Series:</b></td><td>drm-uapi/xe: Remove unused flags (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130005/">https://patchwork.freedesktop.org/series/130005/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10713/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10713/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14309 -&gt; IGTPW_10713</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10713/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7719 -&gt; IGTPW_10713</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14309: d528e13ba6b7bd7ed6ea2f973a70341ee93063af @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10713: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10713/index.html<br />
  IGT_7719: 7719</p>
<h2>Testlist changes</h2>
<p>+igt@xe_exec_queue_property@invalid-property<br />
+igt@xe_vm@bind-flag-invalid<br />
-igt@xe_access_counter@invalid-param<br />
-igt@xe_exec_fault_mode@many-basic-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-basic-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-rebind-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-userptr-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@many-rebind-imm<br />
-igt@xe_exec_fault_mode@many-userptr-imm<br />
-igt@xe_exec_fault_mode@many-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@many-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@once-basic-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@once-rebind-imm<br />
-igt@xe_exec_fault_mode@once-userptr-imm<br />
-igt@xe_exec_fault_mode@once-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@once-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@twice-basic-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@twice-rebind-imm<br />
-igt@xe_exec_fault_mode@twice-userptr-imm<br />
-igt@xe_exec_fault_mode@twice-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@twice-userptr-rebind-imm<br />
-igt@xe_exec_queue_property@job_timeout_ms-property-min-max<br />
-igt@xe_exec_queue_property@preempt_timeout_us-property-min-max<br />
-igt@xe_exec_reset@cancel<br />
-igt@xe_exec_reset@cm-execqueue-reset<br />
-igt@xe_exec_reset@execqueue-reset<br />
-igt@xe_exec_reset@parallel-cancel<br />
-igt@xe_exec_reset@parallel-execqueue-reset<br />
-igt@xe_exec_reset@virtual-cancel<br />
-igt@xe_exec_reset@virtual-execqueue-reset</p>

</body>
</html>

--===============8134772832787709536==--
