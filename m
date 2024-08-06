Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C453C52D6D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 07:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A07A10E2FE;
	Tue,  6 Aug 2024 07:48:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15F610E2FB;
 Tue,  6 Aug 2024 07:48:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1709986176990037770=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/amd=5Fdeadlock=3A_add_ba?=
 =?utf-8?q?d_memory_test_for_compute?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 06 Aug 2024 07:48:08 -0000
Message-ID: <172293048885.542517.10443101815756976113@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806070634.2444558-1-jesse.zhang@amd.com>
In-Reply-To: <20240806070634.2444558-1-jesse.zhang@amd.com>
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

--===============1709986176990037770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amd_deadlock: add bad memory test for compute
URL   : https://patchwork.freedesktop.org/series/136913/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7957_BAT -> XEIGTPW_11533_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11533_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11533_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11533_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdmi_inject@inject-audio:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7957/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11533/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html

  


Build changes
-------------

  * IGT: IGT_7957 -> IGTPW_11533
  * Linux: xe-1716-9e05740a01c348338498296b934a7652efff6aef -> xe-1718-28edc41db567c4c555fff23119c10d39689131c2

  IGTPW_11533: 11533
  IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1716-9e05740a01c348338498296b934a7652efff6aef: 9e05740a01c348338498296b934a7652efff6aef
  xe-1718-28edc41db567c4c555fff23119c10d39689131c2: 28edc41db567c4c555fff23119c10d39689131c2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11533/index.html

--===============1709986176990037770==
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
<tr><td><b>Series:</b></td><td>tests/amd_deadlock: add bad memory test for compute</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136913/">https://patchwork.freedesktop.org/series/136913/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11533/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11533/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7957_BAT -&gt; XEIGTPW_11533_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11533_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11533_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11533_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7957/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11533/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7957 -&gt; IGTPW_11533</li>
<li>Linux: xe-1716-9e05740a01c348338498296b934a7652efff6aef -&gt; xe-1718-28edc41db567c4c555fff23119c10d39689131c2</li>
</ul>
<p>IGTPW_11533: 11533<br />
  IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1716-9e05740a01c348338498296b934a7652efff6aef: 9e05740a01c348338498296b934a7652efff6aef<br />
  xe-1718-28edc41db567c4c555fff23119c10d39689131c2: 28edc41db567c4c555fff23119c10d39689131c2</p>

</body>
</html>

--===============1709986176990037770==--
