Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F94C88E7F
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 18:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B790210E2BD;
	Wed, 16 Sep 2026 18:14:11 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BC510E2BD;
 Wed, 16 Sep 2026 18:13:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3527697338430279206=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Bump_debian_version_to_bo?=
 =?utf-8?q?okworm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Sep 2026 18:13:31 -0000
Message-ID: <178958241129.173806.11081114353701605475@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
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

--===============3527697338430279206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Bump debian version to bookworm (rev2)
URL   : https://patchwork.freedesktop.org/series/174271/
State : success

== Summary ==

CI Bug Log - changes from IGT_9099 -> IGTPW_15852
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15852/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15852 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-adlp-6:         [PASS][1] -> [DMESG-WARN][2] ([i915#17041]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9099/bat-adlp-6/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15852/bat-adlp-6/igt@i915_selftest@live.html

  
  [i915#17041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17041


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9099 -> IGTPW_15852
  * Linux: CI_DRM_19152 -> CI_DRM_19156

  CI-20190529: 20190529
  CI_DRM_19152: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19156: bb38af66c2f21340a7c081afbb7ace249357fbb5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15852: a685485e93f286244352c3bedf02200dc695d3b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9099: 9099

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15852/index.html

--===============3527697338430279206==
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
<tr><td><b>Series:</b></td><td>Bump debian version to bookworm (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174271/">https://patchwork.freedesktop.org/series/174271/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15852/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15852/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9099 -&gt; IGTPW_15852</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15852/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15852 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9099/bat-adlp-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15852/bat-adlp-6/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17041">i915#17041</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9099 -&gt; IGTPW_15852</li>
<li>Linux: CI_DRM_19152 -&gt; CI_DRM_19156</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19152: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19156: bb38af66c2f21340a7c081afbb7ace249357fbb5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15852: a685485e93f286244352c3bedf02200dc695d3b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9099: 9099</p>

</body>
</html>

--===============3527697338430279206==--
