Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C607BC5DF81
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 04:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A9810E112;
	Tue, 25 Aug 2026 04:10:58 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A148610E112;
 Tue, 25 Aug 2026 04:10:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7004004658890674712=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fr?=
 =?utf-8?q?eset=3A_add_GT_reset_fault_injection_stress_coverage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 25 Aug 2026 04:10:22 -0000
Message-ID: <178763102263.80981.14340354767811111410@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260825032520.507695-1-nishit.sharma@intel.com>
In-Reply-To: <20260825032520.507695-1-nishit.sharma@intel.com>
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

--===============7004004658890674712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_reset: add GT reset fault injection stress coverage (rev2)
URL   : https://patchwork.freedesktop.org/series/172441/
State : success

== Summary ==

CI Bug Log - changes from IGT_9071 -> IGTPW_15727
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15727/index.html

Participating hosts (40 -> 36)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9071 -> IGTPW_15727
  * Linux: CI_DRM_19039 -> CI_DRM_19041

  CI-20190529: 20190529
  CI_DRM_19039: b830d7b865d1dcc0c199feef72cbe7bf7b208762 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19041: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15727: 15727
  IGT_9071: 9071

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15727/index.html

--===============7004004658890674712==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_reset: add GT reset fault injection stress coverage (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172441/">https://patchwork.freedesktop.org/series/172441/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15727/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15727/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9071 -&gt; IGTPW_15727</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15727/index.html</p>
<h2>Participating hosts (40 -&gt; 36)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9071 -&gt; IGTPW_15727</li>
<li>Linux: CI_DRM_19039 -&gt; CI_DRM_19041</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19039: b830d7b865d1dcc0c199feef72cbe7bf7b208762 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19041: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15727: 15727<br />
  IGT_9071: 9071</p>

</body>
</html>

--===============7004004658890674712==--
