Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF16E74AC8
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 19:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1111B10EB2F;
	Tue,  3 Dec 2024 19:52:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C86A10EB2F;
 Tue,  3 Dec 2024 19:52:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5645179224816205297=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_hibernate_helpers_and_k?=
 =?utf-8?q?ms=5Fccs_hibernate_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Dec 2024 19:52:17 -0000
Message-ID: <173325553743.2116490.1817907307535523340@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
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

--===============5645179224816205297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add hibernate helpers and kms_ccs hibernate test (rev2)
URL   : https://patchwork.freedesktop.org/series/142035/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8136_BAT -> XEIGTPW_12237_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12237_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12237_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12237_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-adlp-7:         [PASS][1] -> [CRASH][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/bat-adlp-7/igt@xe_intel_bb@intel-bb-blit-y.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/bat-adlp-7/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@reset-bb:
    - bat-adlp-7:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/bat-adlp-7/igt@xe_intel_bb@reset-bb.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/bat-adlp-7/igt@xe_intel_bb@reset-bb.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12237_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][5] -> [SKIP][6] ([Intel XE#455]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-adlp-7:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#3517]) +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/bat-adlp-7/igt@kms_psr@psr-primary-page-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/bat-adlp-7/igt@kms_psr@psr-primary-page-flip.html

  
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8136 -> IGTPW_12237
  * Linux: xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219 -> xe-2311-e46e8fdd83bc0ed3257bcd0230ea7c3272b496cb

  IGTPW_12237: b91faf365831f3aabe0e834e0bd2b2c59f7a5328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8136: 21076ee09438af484c58b308d8179277503922f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219: 5779fb3c12faf12589054127d60b1d36d56ba219
  xe-2311-e46e8fdd83bc0ed3257bcd0230ea7c3272b496cb: e46e8fdd83bc0ed3257bcd0230ea7c3272b496cb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/index.html

--===============5645179224816205297==
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
<tr><td><b>Series:</b></td><td>Add hibernate helpers and kms_ccs hibernate test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142035/">https://patchwork.freedesktop.org/series/142035/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8136_BAT -&gt; XEIGTPW_12237_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12237_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12237_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12237_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/bat-adlp-7/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/bat-adlp-7/igt@xe_intel_bb@intel-bb-blit-y.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@reset-bb:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/bat-adlp-7/igt@xe_intel_bb@reset-bb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/bat-adlp-7/igt@xe_intel_bb@reset-bb.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12237_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8136/bat-adlp-7/igt@kms_psr@psr-primary-page-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12237/bat-adlp-7/igt@kms_psr@psr-primary-page-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8136 -&gt; IGTPW_12237</li>
<li>Linux: xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219 -&gt; xe-2311-e46e8fdd83bc0ed3257bcd0230ea7c3272b496cb</li>
</ul>
<p>IGTPW_12237: b91faf365831f3aabe0e834e0bd2b2c59f7a5328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8136: 21076ee09438af484c58b308d8179277503922f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2310-5779fb3c12faf12589054127d60b1d36d56ba219: 5779fb3c12faf12589054127d60b1d36d56ba219<br />
  xe-2311-e46e8fdd83bc0ed3257bcd0230ea7c3272b496cb: e46e8fdd83bc0ed3257bcd0230ea7c3272b496cb</p>

</body>
</html>

--===============5645179224816205297==--
