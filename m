Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533FCC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 13:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D371610EB02;
	Thu, 17 Apr 2025 13:21:26 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7328D10E0D0;
 Thu, 17 Apr 2025 13:21:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3145442455082109484=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/2=5D_drm-uapi/amdgpu=3A_Add_queue_priority_and_secure?=
 =?utf-8?q?_flags_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 17 Apr 2025 13:21:26 -0000
Message-ID: <174489608646.14498.11259437349245956557@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417085247.592557-1-jesse.zhang@amd.com>
In-Reply-To: <20250417085247.592557-1-jesse.zhang@amd.com>
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

--===============3145442455082109484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] drm-uapi/amdgpu: Add queue priority and secure flags definitions
URL   : https://patchwork.freedesktop.org/series/147878/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8326_BAT -> XEIGTPW_12998_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12998_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12998_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12998_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] +56 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12998/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  


Build changes
-------------

  * IGT: IGT_8326 -> IGTPW_12998
  * Linux: xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd -> xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6

  IGTPW_12998: 12998
  IGT_8326: 8326
  xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd: 1afb38d5acb616dc76381ec0d80b081106146bbd
  xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6: 830407db6fa5a871d1a6fcba1e51b42899ff57f6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12998/index.html

--===============3145442455082109484==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] drm-uapi/amdgpu: Add queue priority and secure flags definitions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147878/">https://patchwork.freedesktop.org/series/147878/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12998/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12998/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8326_BAT -&gt; XEIGTPW_12998_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12998_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12998_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12998_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12998/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> +56 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8326 -&gt; IGTPW_12998</li>
<li>Linux: xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd -&gt; xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6</li>
</ul>
<p>IGTPW_12998: 12998<br />
  IGT_8326: 8326<br />
  xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd: 1afb38d5acb616dc76381ec0d80b081106146bbd<br />
  xe-2967-830407db6fa5a871d1a6fcba1e51b42899ff57f6: 830407db6fa5a871d1a6fcba1e51b42899ff57f6</p>

</body>
</html>

--===============3145442455082109484==--
