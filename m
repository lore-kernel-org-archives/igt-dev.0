Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C984FCD128A
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 21:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BDA10F57C;
	Mon,  1 Apr 2024 21:35:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477A810F57C;
 Mon,  1 Apr 2024 21:35:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3504299581750991378=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIENJLnhlQkFUOiBzdWNjZXNzIGZvciBsaWIveGU6IFVwZGF0ZSBfX3hlX2V4?=
 =?utf-8?b?ZWNfcXVldWVfY3JlYXRlKCkgKHJldjMp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 01 Apr 2024 21:35:18 -0000
Message-ID: <171200731828.1136018.5099879160310956578@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240401202520.17572-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240401202520.17572-1-niranjana.vishwanathapura@intel.com>
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

--===============3504299581750991378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe: Update __xe_exec_queue_create() (rev3)
URL   : https://patchwork.freedesktop.org/series/131723/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7793_BAT -> XEIGTPW_10961_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10961_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#616]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7793/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10961/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - {bat-lnl-1}:        [FAIL][3] ([Intel XE#1414]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7793/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10961/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * IGT: IGT_7793 -> IGTPW_10961
  * Linux: xe-1021-a585b19932157f2c96293bf00288968ada86d435 -> xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d

  IGTPW_10961: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10961/index.html
  IGT_7793: d6485199d0e6400dc357e3c1da9df45e8188713c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1021-a585b19932157f2c96293bf00288968ada86d435: a585b19932157f2c96293bf00288968ada86d435
  xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d: 21a087f3d1d62518feb57cea8caf101cd4a81b5d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10961/index.html

--===============3504299581750991378==
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
<tr><td><b>Series:</b></td><td>lib/xe: Update __xe_exec_queue_create() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131723/">https://patchwork.freedesktop.org/series/131723/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10961/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10961/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7793_BAT -&gt; XEIGTPW_10961_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10961_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7793/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10961/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7793/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414">Intel XE#1414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10961/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7793 -&gt; IGTPW_10961</li>
<li>Linux: xe-1021-a585b19932157f2c96293bf00288968ada86d435 -&gt; xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d</li>
</ul>
<p>IGTPW_10961: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10961/index.html<br />
  IGT_7793: d6485199d0e6400dc357e3c1da9df45e8188713c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1021-a585b19932157f2c96293bf00288968ada86d435: a585b19932157f2c96293bf00288968ada86d435<br />
  xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d: 21a087f3d1d62518feb57cea8caf101cd4a81b5d</p>

</body>
</html>

--===============3504299581750991378==--
