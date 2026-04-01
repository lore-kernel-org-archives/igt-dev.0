Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33B4107639C
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 17:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458DB10E9C5;
	Wed,  1 Apr 2026 17:43:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A256910E9C5;
 Wed,  1 Apr 2026 17:43:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6686786368543118486=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Finvalid=5Fmode?=
 =?utf-8?q?=3A_Add_igt=5Finfo_when_test_skips?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "sumit kishore" <sumit.kishore@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 01 Apr 2026 17:43:47 -0000
Message-ID: <177506542763.424361.12245474458462232227@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260401101411.408817-1-sumit.kishore@intel.com>
In-Reply-To: <20260401101411.408817-1-sumit.kishore@intel.com>
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

--===============6686786368543118486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_invalid_mode: Add igt_info when test skips
URL   : https://patchwork.freedesktop.org/series/164233/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8840_BAT -> XEIGTPW_14905_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-wcl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_14905_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7483])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8840/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14905/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#7483]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8840/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14905/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * IGT: IGT_8840 -> IGTPW_14905
  * Linux: xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2 -> xe-4834-35dad892ec87d448384f492ba061d0da7e3710a5

  IGTPW_14905: 14905
  IGT_8840: 8840
  xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2: 5d36e6d54e963f0c1137aaf2249d2baa781f08c2
  xe-4834-35dad892ec87d448384f492ba061d0da7e3710a5: 35dad892ec87d448384f492ba061d0da7e3710a5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14905/index.html

--===============6686786368543118486==
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
<tr><td><b>Series:</b></td><td>tests/kms_invalid_mode: Add igt_info when test skips</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164233/">https://patchwork.freedesktop.org/series/164233/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14905/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14905/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8840_BAT -&gt; XEIGTPW_14905_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-wcl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14905_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8840/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14905/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8840/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14905/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8840 -&gt; IGTPW_14905</li>
<li>Linux: xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2 -&gt; xe-4834-35dad892ec87d448384f492ba061d0da7e3710a5</li>
</ul>
<p>IGTPW_14905: 14905<br />
  IGT_8840: 8840<br />
  xe-4833-5d36e6d54e963f0c1137aaf2249d2baa781f08c2: 5d36e6d54e963f0c1137aaf2249d2baa781f08c2<br />
  xe-4834-35dad892ec87d448384f492ba061d0da7e3710a5: 35dad892ec87d448384f492ba061d0da7e3710a5</p>

</body>
</html>

--===============6686786368543118486==--
