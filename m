Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CD2CDD1A9
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 19:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8738310E583;
	Mon, 30 Sep 2024 19:16:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E7610E583;
 Mon, 30 Sep 2024 19:16:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0330181834393248931=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_include/drm-uapi=3A_Update_uap?=
 =?utf-8?q?i_headers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 30 Sep 2024 19:16:52 -0000
Message-ID: <172772381273.1138369.15545807141772478043@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925192354.22814-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240925192354.22814-1-ville.syrjala@linux.intel.com>
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

--===============0330181834393248931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: include/drm-uapi: Update uapi headers (rev2)
URL   : https://patchwork.freedesktop.org/series/139115/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8043_BAT -> XEIGTPW_11837_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11837_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11837_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11837_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-lnl-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11837/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11837_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#1861]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11837/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-lnl-1:          [FAIL][5] ([Intel XE#1649]) -> [PASS][6] +5 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11837/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861


Build changes
-------------

  * IGT: IGT_8043 -> IGTPW_11837
  * Linux: xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f -> xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1

  IGTPW_11837: e4aebcae394e11d1bcacd734c31335e9f358049e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8043: 8043
  xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f: 8a36a5499f143dc694afe235c6a1773421d2bd4f
  xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1: 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11837/index.html

--===============0330181834393248931==
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
<tr><td><b>Series:</b></td><td>include/drm-uapi: Update uapi headers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139115/">https://patchwork.freedesktop.org/series/139115/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11837/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11837/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8043_BAT -&gt; XEIGTPW_11837_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11837_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11837_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11837_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr-invalidate:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11837/bat-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11837_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11837/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11837/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8043 -&gt; IGTPW_11837</li>
<li>Linux: xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f -&gt; xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1</li>
</ul>
<p>IGTPW_11837: e4aebcae394e11d1bcacd734c31335e9f358049e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8043: 8043<br />
  xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f: 8a36a5499f143dc694afe235c6a1773421d2bd4f<br />
  xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1: 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1</p>

</body>
</html>

--===============0330181834393248931==--
