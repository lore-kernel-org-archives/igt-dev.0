Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ADCC87FCA
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 14:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9AA10E8A6;
	Fri,  1 Aug 2025 14:40:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07E910E898;
 Fri,  1 Aug 2025 14:40:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1019392109751493694=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_amdgpu=3A_Expose_and_test_G?=
 =?utf-8?q?PUVM=2C_LDS=2C_and_Scratch_aperture_sizes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Srinivasan Shanmugam" <srinivasan.shanmugam@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 01 Aug 2025 14:40:04 -0000
Message-ID: <175405920484.205465.18021073251156834895@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250801135052.3487752-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20250801135052.3487752-1-srinivasan.shanmugam@amd.com>
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

--===============1019392109751493694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: amdgpu: Expose and test GPUVM, LDS, and Scratch aperture sizes
URL   : https://patchwork.freedesktop.org/series/152423/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8482_BAT -> XEIGTPW_13548_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13548_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8482/bat-adlp-7/igt@kms_flip@basic-plain-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13548/bat-adlp-7/igt@kms_flip@basic-plain-flip.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8482 -> IGTPW_13548
  * Linux: xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888 -> xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f

  IGTPW_13548: 13548
  IGT_8482: 8482
  xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888: d61b45f1c6f1aeb5dd516491cfb7cbc03d024888
  xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f: c4264c7406b75ed3fa043f034cb9d538d210d64f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13548/index.html

--===============1019392109751493694==
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
<tr><td><b>Series:</b></td><td>amdgpu: Expose and test GPUVM, LDS, and Scratch aperture sizes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152423/">https://patchwork.freedesktop.org/series/152423/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13548/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13548/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8482_BAT -&gt; XEIGTPW_13548_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13548_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8482/bat-adlp-7/igt@kms_flip@basic-plain-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13548/bat-adlp-7/igt@kms_flip@basic-plain-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8482 -&gt; IGTPW_13548</li>
<li>Linux: xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888 -&gt; xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f</li>
</ul>
<p>IGTPW_13548: 13548<br />
  IGT_8482: 8482<br />
  xe-3492-d61b45f1c6f1aeb5dd516491cfb7cbc03d024888: d61b45f1c6f1aeb5dd516491cfb7cbc03d024888<br />
  xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f: c4264c7406b75ed3fa043f034cb9d538d210d64f</p>

</body>
</html>

--===============1019392109751493694==--
