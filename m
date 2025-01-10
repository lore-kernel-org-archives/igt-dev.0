Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D473FE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 19:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEBD10F17F;
	Fri, 10 Jan 2025 19:08:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935B510F17D;
 Fri, 10 Jan 2025 19:08:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5146929538904496586=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/igt=5Fkms=3A_Helpers_fo?=
 =?utf-8?q?r_connector_managment_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jan 2025 19:08:18 -0000
Message-ID: <173653609859.2039782.291087675025093150@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
In-Reply-To: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
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

--===============5146929538904496586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: Helpers for connector managment (rev4)
URL   : https://patchwork.freedesktop.org/series/137915/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8188_BAT -> XEIGTPW_12428_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12428_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12428_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12428_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8188/bat-lnl-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12428/bat-lnl-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  


Build changes
-------------

  * IGT: IGT_8188 -> IGTPW_12428

  IGTPW_12428: c5b3f9545b9c190b9f3edc82768b7c3c6915d705 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8188: ef0abf7f39a7ef0ecf2f08c62b90b852c435c755 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde: 00f4619246294b1de4bac42742cfef95c1f37fde

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12428/index.html

--===============5146929538904496586==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: Helpers for connector managment (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137915/">https://patchwork.freedesktop.org/series/137915/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12428/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12428/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8188_BAT -&gt; XEIGTPW_12428_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12428_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12428_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12428_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-preempt-fence-early:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8188/bat-lnl-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12428/bat-lnl-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8188 -&gt; IGTPW_12428</li>
</ul>
<p>IGTPW_12428: c5b3f9545b9c190b9f3edc82768b7c3c6915d705 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8188: ef0abf7f39a7ef0ecf2f08c62b90b852c435c755 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde: 00f4619246294b1de4bac42742cfef95c1f37fde</p>

</body>
</html>

--===============5146929538904496586==--
