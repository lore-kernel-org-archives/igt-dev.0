Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C34C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 18:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A63A10E021;
	Tue, 18 Feb 2025 18:10:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D6110E021;
 Tue, 18 Feb 2025 18:10:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0675966719475689893=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpmu=3A_Add?=
 =?utf-8?q?_PMU_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 18 Feb 2025 18:10:16 -0000
Message-ID: <173990221681.3636453.10165643009037228829@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218170657.214076-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250218170657.214076-1-vinay.belgaumkar@intel.com>
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

--===============0675966719475689893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pmu: Add PMU tests
URL   : https://patchwork.freedesktop.org/series/145034/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8236_BAT -> XEIGTPW_12626_BAT
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

  Here are the changes found in XEIGTPW_12626_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-none:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8236/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-none.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12626/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-none.html

  
#### Possible fixes ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3970]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8236/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12626/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8236 -> IGTPW_12626
  * Linux: xe-2679-4cc4e3d6ea1543688d62432dbe0fa750780fb262 -> xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074

  IGTPW_12626: 12626
  IGT_8236: 8236
  xe-2679-4cc4e3d6ea1543688d62432dbe0fa750780fb262: 4cc4e3d6ea1543688d62432dbe0fa750780fb262
  xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074: adeeb34d0f0e6463bea93984a56eed4e3ee0f074

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12626/index.html

--===============0675966719475689893==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pmu: Add PMU tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145034/">https://patchwork.freedesktop.org/series/145034/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12626/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12626/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8236_BAT -&gt; XEIGTPW_12626_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12626_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-none:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8236/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12626/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-none.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8236/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12626/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8236 -&gt; IGTPW_12626</li>
<li>Linux: xe-2679-4cc4e3d6ea1543688d62432dbe0fa750780fb262 -&gt; xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074</li>
</ul>
<p>IGTPW_12626: 12626<br />
  IGT_8236: 8236<br />
  xe-2679-4cc4e3d6ea1543688d62432dbe0fa750780fb262: 4cc4e3d6ea1543688d62432dbe0fa750780fb262<br />
  xe-2681-adeeb34d0f0e6463bea93984a56eed4e3ee0f074: adeeb34d0f0e6463bea93984a56eed4e3ee0f074</p>

</body>
</html>

--===============0675966719475689893==--
