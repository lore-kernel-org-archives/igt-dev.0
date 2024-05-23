Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874BEC25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 12:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F201210E1EE;
	Thu, 23 May 2024 12:41:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8E910E0E7;
 Thu, 23 May 2024 12:41:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2184832721116447125=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_gputop_support_for_sysfs_p?=
 =?utf-8?q?rofiling_knob?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 May 2024 12:41:53 -0000
Message-ID: <171646811350.2169849.6248831469314296764@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240523114549.447126-1-adrian.larumbe@collabora.com>
In-Reply-To: <20240523114549.447126-1-adrian.larumbe@collabora.com>
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

--===============2184832721116447125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add gputop support for sysfs profiling knob
URL   : https://patchwork.freedesktop.org/series/133959/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7869_BAT -> XEIGTPW_11183_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 2)
------------------------------

  Missing    (2): bat-atsm-2 bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11183_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - {bat-lnl-1}:        [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11183/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11183_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7869 -> IGTPW_11183
  * Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -> xe-1333-7643e429e72c546f3779339624df885f6160124c

  IGTPW_11183: a5fc58b899ac84387965bd9ded9aada2179ceb87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921
  xe-1333-7643e429e72c546f3779339624df885f6160124c: 7643e429e72c546f3779339624df885f6160124c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11183/index.html

--===============2184832721116447125==
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
<tr><td><b>Series:</b></td><td>Add gputop support for sysfs profiling knob</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133959/">https://patchwork.freedesktop.org/series/133959/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11183/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11183/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7869_BAT -&gt; XEIGTPW_11183_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 2)</h2>
<p>Missing    (2): bat-atsm-2 bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11183_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7869/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11183/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11183_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7869 -&gt; IGTPW_11183</li>
<li>Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -&gt; xe-1333-7643e429e72c546f3779339624df885f6160124c</li>
</ul>
<p>IGTPW_11183: a5fc58b899ac84387965bd9ded9aada2179ceb87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921<br />
  xe-1333-7643e429e72c546f3779339624df885f6160124c: 7643e429e72c546f3779339624df885f6160124c</p>

</body>
</html>

--===============2184832721116447125==--
