Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EB1FF8864
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 02:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A3610E9FC;
	Tue, 28 Apr 2026 02:26:32 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF61E10E9FD;
 Tue, 28 Apr 2026 02:26:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5567182390844185475=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_test_coverage_for_multi?=
 =?utf-8?q?_queue_reset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 Apr 2026 02:26:18 -0000
Message-ID: <177734317871.16746.4953414507810050609@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260427212034.18486-1-stuart.summers@intel.com>
In-Reply-To: <20260427212034.18486-1-stuart.summers@intel.com>
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

--===============5567182390844185475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add test coverage for multi queue reset (rev2)
URL   : https://patchwork.freedesktop.org/series/164653/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8874_BAT -> XEIGTPW_15066_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15066_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15066_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15066_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@reltime:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8874/bat-atsm-2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15066/bat-atsm-2/igt@xe_waitfence@reltime.html

  


Build changes
-------------

  * IGT: IGT_8874 -> IGTPW_15066
  * Linux: xe-4940-b6f6b69b2dffa9ad1c43b2149786b4630d41acbf -> xe-4944-aea2c496abcf55b647c14fe720bfc4ea555aac6a

  IGTPW_15066: 6194ba6711d4d4f06685e11ccd8a4f25a7224ed9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8874: 4568b2c141ab630c34f8eb2b9afab8cbf8f3ce9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4940-b6f6b69b2dffa9ad1c43b2149786b4630d41acbf: b6f6b69b2dffa9ad1c43b2149786b4630d41acbf
  xe-4944-aea2c496abcf55b647c14fe720bfc4ea555aac6a: aea2c496abcf55b647c14fe720bfc4ea555aac6a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15066/index.html

--===============5567182390844185475==
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
<tr><td><b>Series:</b></td><td>Add test coverage for multi queue reset (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164653/">https://patchwork.freedesktop.org/series/164653/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15066/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15066/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8874_BAT -&gt; XEIGTPW_15066_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15066_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15066_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15066_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8874/bat-atsm-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15066/bat-atsm-2/igt@xe_waitfence@reltime.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8874 -&gt; IGTPW_15066</li>
<li>Linux: xe-4940-b6f6b69b2dffa9ad1c43b2149786b4630d41acbf -&gt; xe-4944-aea2c496abcf55b647c14fe720bfc4ea555aac6a</li>
</ul>
<p>IGTPW_15066: 6194ba6711d4d4f06685e11ccd8a4f25a7224ed9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8874: 4568b2c141ab630c34f8eb2b9afab8cbf8f3ce9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4940-b6f6b69b2dffa9ad1c43b2149786b4630d41acbf: b6f6b69b2dffa9ad1c43b2149786b4630d41acbf<br />
  xe-4944-aea2c496abcf55b647c14fe720bfc4ea555aac6a: aea2c496abcf55b647c14fe720bfc4ea555aac6a</p>

</body>
</html>

--===============5567182390844185475==--
