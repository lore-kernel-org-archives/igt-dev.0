Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09702C021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 06:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A930C10E31A;
	Mon, 17 Feb 2025 06:36:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1657A10E31A;
 Mon, 17 Feb 2025 06:36:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4873121033850607572=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fcap?=
 =?utf-8?q?ture=3A_Enhance_test_to_check_with_DUMPABLE_flag_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 17 Feb 2025 06:36:15 -0000
Message-ID: <173977417508.3181658.16167675015119164665@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217053732.1164759-1-pravalika.gurram@intel.com>
In-Reply-To: <20250217053732.1164759-1-pravalika.gurram@intel.com>
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

--===============4873121033850607572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_capture: Enhance test to check with DUMPABLE flag (rev4)
URL   : https://patchwork.freedesktop.org/series/144379/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8231_BAT -> XEIGTPW_12609_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12609_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@render@render-linear-256:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8231/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12609/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html

  
#### Possible fixes ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3970]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8231/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12609/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8231 -> IGTPW_12609
  * Linux: xe-2671-27f464a14e8d7d6c1e86e821a1f5ece6c0540e18 -> xe-2672-ca8276ef262034fd12b15dd0a5bbd797bab8539a

  IGTPW_12609: 12609
  IGT_8231: 8231
  xe-2671-27f464a14e8d7d6c1e86e821a1f5ece6c0540e18: 27f464a14e8d7d6c1e86e821a1f5ece6c0540e18
  xe-2672-ca8276ef262034fd12b15dd0a5bbd797bab8539a: ca8276ef262034fd12b15dd0a5bbd797bab8539a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12609/index.html

--===============4873121033850607572==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_capture: Enhance test to check with DUMPABLE flag (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144379/">https://patchwork.freedesktop.org/series/144379/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12609/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12609/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8231_BAT -&gt; XEIGTPW_12609_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12609_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@render@render-linear-256:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8231/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12609/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8231/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12609/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8231 -&gt; IGTPW_12609</li>
<li>Linux: xe-2671-27f464a14e8d7d6c1e86e821a1f5ece6c0540e18 -&gt; xe-2672-ca8276ef262034fd12b15dd0a5bbd797bab8539a</li>
</ul>
<p>IGTPW_12609: 12609<br />
  IGT_8231: 8231<br />
  xe-2671-27f464a14e8d7d6c1e86e821a1f5ece6c0540e18: 27f464a14e8d7d6c1e86e821a1f5ece6c0540e18<br />
  xe-2672-ca8276ef262034fd12b15dd0a5bbd797bab8539a: ca8276ef262034fd12b15dd0a5bbd797bab8539a</p>

</body>
</html>

--===============4873121033850607572==--
