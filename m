Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0945C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 17:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFAC10E29A;
	Wed, 16 Jul 2025 17:09:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C04B10E29A;
 Wed, 16 Jul 2025 17:09:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2974904042695155821=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=5Fvm=3A_Report_OOM?=
 =?utf-8?q?_for_vm=5Fbind_ioctl_under_memory_pressure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Jul 2025 17:09:00 -0000
Message-ID: <175268574063.167482.9326580182895144980@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250716115237.3279176-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20250716115237.3279176-1-priyanka.dandamudi@intel.com>
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

--===============2974904042695155821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_vm: Report OOM for vm_bind ioctl under memory pressure
URL   : https://patchwork.freedesktop.org/series/151704/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8461_BAT -> XEIGTPW_13483_BAT
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

  Here are the changes found in XEIGTPW_13483_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8461/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13483/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8461 -> IGTPW_13483
  * Linux: xe-3422-8a27005ec6862de0c21ad3b72db77a9796bb5b70 -> xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776

  IGTPW_13483: 2e20eed191a83b00dd6aacbfa2e06404f12326d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8461: 873912f2353ad861a172f6c787c054f934aee71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3422-8a27005ec6862de0c21ad3b72db77a9796bb5b70: 8a27005ec6862de0c21ad3b72db77a9796bb5b70
  xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776: 3b965bd54a93adbf5520b143254ecb10b9a11776

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13483/index.html

--===============2974904042695155821==
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
<tr><td><b>Series:</b></td><td>tests/xe_vm: Report OOM for vm_bind ioctl under memory pressure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151704/">https://patchwork.freedesktop.org/series/151704/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13483/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13483/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8461_BAT -&gt; XEIGTPW_13483_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13483_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8461/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13483/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8461 -&gt; IGTPW_13483</li>
<li>Linux: xe-3422-8a27005ec6862de0c21ad3b72db77a9796bb5b70 -&gt; xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776</li>
</ul>
<p>IGTPW_13483: 2e20eed191a83b00dd6aacbfa2e06404f12326d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8461: 873912f2353ad861a172f6c787c054f934aee71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3422-8a27005ec6862de0c21ad3b72db77a9796bb5b70: 8a27005ec6862de0c21ad3b72db77a9796bb5b70<br />
  xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776: 3b965bd54a93adbf5520b143254ecb10b9a11776</p>

</body>
</html>

--===============2974904042695155821==--
