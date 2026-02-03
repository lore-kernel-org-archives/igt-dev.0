Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBF9E83050
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 05:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FE310E51F;
	Tue,  3 Feb 2026 05:07:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33EE10E304;
 Tue,  3 Feb 2026 05:07:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2348586668013614420=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/amdgpu/amd=5Fmmd=5Fshar?=
 =?utf-8?q?ed=3A_Fix_VCN_JPEG_submission_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tessita Thomas" <tessita.thomas@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Feb 2026 05:07:05 -0000
Message-ID: <177009522590.218809.8921043428540245566@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260203022124.542472-1-Tessita.Thomas@amd.com>
In-Reply-To: <20260203022124.542472-1-Tessita.Thomas@amd.com>
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

--===============2348586668013614420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu/amd_mmd_shared: Fix VCN JPEG submission (rev2)
URL   : https://patchwork.freedesktop.org/series/160975/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8729_BAT -> XEIGTPW_14472_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_14472_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14472/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8729 -> IGTPW_14472
  * Linux: xe-4480-88c5cd5324a45f418e99c62974a746596bc81d93 -> xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4

  IGTPW_14472: f061d627afa87282ad657dcfc931d49f638ea76f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8729: 8729
  xe-4480-88c5cd5324a45f418e99c62974a746596bc81d93: 88c5cd5324a45f418e99c62974a746596bc81d93
  xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4: 6e53f6296065672f8a0c7f98b4b6c409dac382b4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14472/index.html

--===============2348586668013614420==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu/amd_mmd_shared: Fix VCN JPEG submission (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160975/">https://patchwork.freedesktop.org/series/160975/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14472/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14472/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8729_BAT -&gt; XEIGTPW_14472_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14472_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8729/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14472/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8729 -&gt; IGTPW_14472</li>
<li>Linux: xe-4480-88c5cd5324a45f418e99c62974a746596bc81d93 -&gt; xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4</li>
</ul>
<p>IGTPW_14472: f061d627afa87282ad657dcfc931d49f638ea76f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8729: 8729<br />
  xe-4480-88c5cd5324a45f418e99c62974a746596bc81d93: 88c5cd5324a45f418e99c62974a746596bc81d93<br />
  xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4: 6e53f6296065672f8a0c7f98b4b6c409dac382b4</p>

</body>
</html>

--===============2348586668013614420==--
