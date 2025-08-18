Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06B7CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 20:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6341810E032;
	Mon, 18 Aug 2025 20:17:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B953B10E032;
 Mon, 18 Aug 2025 20:17:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2866115018399191337=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fatomic=5Ftransi?=
 =?utf-8?q?tion=3A_Change_debug_mask_for_multi-output_modeset_tests_=28rev4?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Aug 2025 20:17:41 -0000
Message-ID: <175554826170.245182.6667179096004289204@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818161649.2157822-1-pranay.samala@intel.com>
In-Reply-To: <20250818161649.2157822-1-pranay.samala@intel.com>
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

--===============2866115018399191337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_transition: Change debug mask for multi-output modeset tests (rev4)
URL   : https://patchwork.freedesktop.org/series/152517/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8496_BAT -> XEIGTPW_13593_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13593_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8496/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13593/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-2}:        [FAIL][3] ([Intel XE#5783]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8496/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13593/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8496 -> IGTPW_13593
  * Linux: xe-3570-912c10fafebf45522f7f56e33a020284e83c27ab -> xe-3572-c3cf4289245819615518b536cd16ebe6612694f9

  IGTPW_13593: ec5d1c62e73279a4a7bbffb0b60cc3a84bd34e4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8496: acea60af09e5f4b3cb0cd6838c23ef1e92c17323 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3570-912c10fafebf45522f7f56e33a020284e83c27ab: 912c10fafebf45522f7f56e33a020284e83c27ab
  xe-3572-c3cf4289245819615518b536cd16ebe6612694f9: c3cf4289245819615518b536cd16ebe6612694f9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13593/index.html

--===============2866115018399191337==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_transition: Change debug mask for multi-output modeset tests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152517/">https://patchwork.freedesktop.org/series/152517/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13593/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13593/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8496_BAT -&gt; XEIGTPW_13593_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13593_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8496/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13593/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8496/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13593/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8496 -&gt; IGTPW_13593</li>
<li>Linux: xe-3570-912c10fafebf45522f7f56e33a020284e83c27ab -&gt; xe-3572-c3cf4289245819615518b536cd16ebe6612694f9</li>
</ul>
<p>IGTPW_13593: ec5d1c62e73279a4a7bbffb0b60cc3a84bd34e4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8496: acea60af09e5f4b3cb0cd6838c23ef1e92c17323 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3570-912c10fafebf45522f7f56e33a020284e83c27ab: 912c10fafebf45522f7f56e33a020284e83c27ab<br />
  xe-3572-c3cf4289245819615518b536cd16ebe6612694f9: c3cf4289245819615518b536cd16ebe6612694f9</p>

</body>
</html>

--===============2866115018399191337==--
