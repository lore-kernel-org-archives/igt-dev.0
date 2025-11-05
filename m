Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A36CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 09:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2120310E2C1;
	Wed,  5 Nov 2025 09:25:04 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BE710E2C1;
 Wed,  5 Nov 2025 09:25:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7296156290174399585=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/xe=5Fexec=5Fsip=5Feud?=
 =?utf-8?q?ebug=3A_Band-aid_breakpoint-waitsip=28-heavy=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Nov 2025 09:25:02 -0000
Message-ID: <176233470267.19958.7083270036636882658@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251104115418.11917-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20251104115418.11917-1-dominik.karol.piatkowski@intel.com>
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

--===============7296156290174399585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_sip_eudebug: Band-aid breakpoint-waitsip(-heavy)
URL   : https://patchwork.freedesktop.org/series/157003/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8607_BAT -> XEIGTPW_13990_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13990_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13990_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13990_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8607/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13990/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13990_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-modeset@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8607/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13990/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8607 -> IGTPW_13990
  * Linux: xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165 -> xe-4045-957ab9ac657700dee50f42438ed79652dad939a0

  IGTPW_13990: 5ac3db1469157af70120f121c57f2c7df1338866 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8607: 8607
  xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165: 3512eb46a8d42c3deb477856c25d519b19a7d165
  xe-4045-957ab9ac657700dee50f42438ed79652dad939a0: 957ab9ac657700dee50f42438ed79652dad939a0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13990/index.html

--===============7296156290174399585==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_sip_eudebug: Band-aid breakpoint-waitsip(-heavy)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157003/">https://patchwork.freedesktop.org/series/157003/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13990/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13990/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8607_BAT -&gt; XEIGTPW_13990_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13990_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13990_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13990_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8607/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13990/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13990_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8607/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13990/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8607 -&gt; IGTPW_13990</li>
<li>Linux: xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165 -&gt; xe-4045-957ab9ac657700dee50f42438ed79652dad939a0</li>
</ul>
<p>IGTPW_13990: 5ac3db1469157af70120f121c57f2c7df1338866 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8607: 8607<br />
  xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165: 3512eb46a8d42c3deb477856c25d519b19a7d165<br />
  xe-4045-957ab9ac657700dee50f42438ed79652dad939a0: 957ab9ac657700dee50f42438ed79652dad939a0</p>

</body>
</html>

--===============7296156290174399585==--
