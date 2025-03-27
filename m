Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45619C36013
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 21:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2A510E184;
	Thu, 27 Mar 2025 21:02:47 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5422210E184;
 Thu, 27 Mar 2025 21:02:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7602039389008463447=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Ffb=3A_simulate_i9?=
 =?utf-8?q?15_linear_fb_behavior_on_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 27 Mar 2025 21:02:46 -0000
Message-ID: <174310936633.12748.18405265337033873039@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327161323.2330254-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250327161323.2330254-1-juhapekka.heikkila@gmail.com>
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

--===============7602039389008463447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_fb: simulate i915 linear fb behavior on xe
URL   : https://patchwork.freedesktop.org/series/146882/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8290_BAT -> XEIGTPW_12860_BAT
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

  Here are the changes found in XEIGTPW_12860_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#2464]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12860/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_intel_bb@bb-with-allocator:
    - bat-adlp-vf:        NOTRUN -> [ABORT][2] ([Intel XE#3970])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12860/bat-adlp-vf/igt@xe_intel_bb@bb-with-allocator.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [ABORT][3] ([Intel XE#3970]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12860/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8290 -> IGTPW_12860
  * Linux: xe-2860-a538fdef11bc12778532b0365d7a9e4c52bd366a -> xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d

  IGTPW_12860: 12860
  IGT_8290: 8290
  xe-2860-a538fdef11bc12778532b0365d7a9e4c52bd366a: a538fdef11bc12778532b0365d7a9e4c52bd366a
  xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d: 4911aeaaf32d8b81a25969ca7f4eef3904e7a75d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12860/index.html

--===============7602039389008463447==
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
<tr><td><b>Series:</b></td><td>lib/igt_fb: simulate i915 linear fb behavior on xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146882/">https://patchwork.freedesktop.org/series/146882/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12860/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12860/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8290_BAT -&gt; XEIGTPW_12860_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12860_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12860/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@bb-with-allocator:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12860/bat-adlp-vf/igt@xe_intel_bb@bb-with-allocator.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8290/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12860/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8290 -&gt; IGTPW_12860</li>
<li>Linux: xe-2860-a538fdef11bc12778532b0365d7a9e4c52bd366a -&gt; xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d</li>
</ul>
<p>IGTPW_12860: 12860<br />
  IGT_8290: 8290<br />
  xe-2860-a538fdef11bc12778532b0365d7a9e4c52bd366a: a538fdef11bc12778532b0365d7a9e4c52bd366a<br />
  xe-2862-4911aeaaf32d8b81a25969ca7f4eef3904e7a75d: 4911aeaaf32d8b81a25969ca7f4eef3904e7a75d</p>

</body>
</html>

--===============7602039389008463447==--
