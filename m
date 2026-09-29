Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD40CA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 10:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1C110E81A;
	Tue, 29 Sep 2026 10:14:26 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4F510E81A;
 Tue, 29 Sep 2026 10:13:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4733186790609442872=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_ALPM_Panel_Replay_and?=
 =?utf-8?q?_LOBF_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 29 Sep 2026 10:13:41 -0000
Message-ID: <179067682162.218638.2104692463824430484@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
In-Reply-To: <20260929090454.2796967-1-sowmiya.s@intel.com>
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

--===============4733186790609442872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add ALPM Panel Replay and LOBF subtests
URL   : https://patchwork.freedesktop.org/series/175180/
State : success

== Summary ==

CI Bug Log - changes from IGT_9114 -> IGTPW_15915
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15915/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 bat-jsl-5 

Known issues
------------

  Here are the changes found in IGTPW_15915 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2] ([i915#17095])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9114/fi-bsw-nick/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15915/fi-bsw-nick/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - fi-bsw-nick:        [PASS][3] -> [ABORT][4] ([i915#17068])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9114/fi-bsw-nick/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15915/fi-bsw-nick/igt@i915_selftest@live@hangcheck.html

  
  [i915#17068]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17068
  [i915#17095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17095


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9114 -> IGTPW_15915
  * Linux: CI_DRM_19232 -> CI_DRM_19233

  CI-20190529: 20190529
  CI_DRM_19232: 972eeb850a4ca07aba05ccb805db28a33eab2c9a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19233: ecc5a84be849c400af610cdc613a0274e3b101b2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15915: 020657c9d15ea62e5810df5f167677633b90a698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15915/index.html

--===============4733186790609442872==
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
<tr><td><b>Series:</b></td><td>Add ALPM Panel Replay and LOBF subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175180/">https://patchwork.freedesktop.org/series/175180/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15915/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15915/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9114 -&gt; IGTPW_15915</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15915/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 bat-jsl-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15915 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9114/fi-bsw-nick/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15915/fi-bsw-nick/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17095">i915#17095</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9114/fi-bsw-nick/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15915/fi-bsw-nick/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17068">i915#17068</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9114 -&gt; IGTPW_15915</li>
<li>Linux: CI_DRM_19232 -&gt; CI_DRM_19233</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19232: 972eeb850a4ca07aba05ccb805db28a33eab2c9a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19233: ecc5a84be849c400af610cdc613a0274e3b101b2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15915: 020657c9d15ea62e5810df5f167677633b90a698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4733186790609442872==--
