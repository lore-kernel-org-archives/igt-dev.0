Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA25C55822
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 08:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB3510ED92;
	Wed,  5 Aug 2026 08:52:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888A110ED90;
 Wed,  5 Aug 2026 08:51:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3158932970681601559=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tools/amd=5Fhdmi=5Fcomplian?=
 =?utf-8?q?ce=3A_Add_ALLM_content_type_toggle_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Fangzhi Zuo" <jerry.zuo@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Aug 2026 08:51:39 -0000
Message-ID: <178591989955.21322.6436876046471702989@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804194735.1577182-1-jerry.zuo@amd.com>
In-Reply-To: <20260804194735.1577182-1-jerry.zuo@amd.com>
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

--===============3158932970681601559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/amd_hdmi_compliance: Add ALLM content type toggle test
URL   : https://patchwork.freedesktop.org/series/171606/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9037_BAT -> XEIGTPW_15631_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_15631_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15631_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-nvls-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15631_BAT:

### IGT changes ###

#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-nvls-1:         [SKIP][1] ([Intel XE#8740]) -> [SKIP][2] +30 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9037/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15631/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
  [Intel XE#8740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740


Build changes
-------------

  * IGT: IGT_9037 -> IGTPW_15631

  IGTPW_15631: 15631
  IGT_9037: 9037
  xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23: c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15631/index.html

--===============3158932970681601559==
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
<tr><td><b>Series:</b></td><td>tools/amd_hdmi_compliance: Add ALLM content type toggle test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171606/">https://patchwork.freedesktop.org/series/171606/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15631/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15631/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9037_BAT -&gt; XEIGTPW_15631_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_15631_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15631_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-nvls-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15631_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9037/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740">Intel XE#8740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15631/bat-nvls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9037 -&gt; IGTPW_15631</li>
</ul>
<p>IGTPW_15631: 15631<br />
  IGT_9037: 9037<br />
  xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23: c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23</p>

</body>
</html>

--===============3158932970681601559==--
