Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7319C02183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 07:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B62710E8DE;
	Thu, 16 Jan 2025 07:28:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0CA10E8DB;
 Thu, 16 Jan 2025 07:28:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3241751823752748546=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/kms=5Fdisplay=5Fmodes?=
 =?utf-8?q?=3A_fit_modes_in_mst_bw?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jan 2025 07:28:38 -0000
Message-ID: <173701251825.189358.10782175195257546212@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116061749.2082287-1-kunal1.joshi@intel.com>
In-Reply-To: <20250116061749.2082287-1-kunal1.joshi@intel.com>
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

--===============3241751823752748546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_display_modes: fit modes in mst bw
URL   : https://patchwork.freedesktop.org/series/143585/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8193_BAT -> XEIGTPW_12445_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12445_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12445_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12445_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@twice-userptr-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12445/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12445_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3970]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12445/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8193 -> IGTPW_12445

  IGTPW_12445: 12445
  IGT_8193: 84511e278c1c6e598ccc21287a733cfc83d13e8a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c: 4cea1f90028925afcf1a0f8a0ef301f90349688c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12445/index.html

--===============3241751823752748546==
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
<tr><td><b>Series:</b></td><td>tests/kms_display_modes: fit modes in mst bw</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143585/">https://patchwork.freedesktop.org/series/143585/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12445/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12445/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8193_BAT -&gt; XEIGTPW_12445_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12445_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12445_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12445_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_basic@twice-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12445/bat-adlp-vf/igt@xe_exec_basic@twice-userptr-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12445_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12445/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8193 -&gt; IGTPW_12445</li>
</ul>
<p>IGTPW_12445: 12445<br />
  IGT_8193: 84511e278c1c6e598ccc21287a733cfc83d13e8a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2495-4cea1f90028925afcf1a0f8a0ef301f90349688c: 4cea1f90028925afcf1a0f8a0ef301f90349688c</p>

</body>
</html>

--===============3241751823752748546==--
