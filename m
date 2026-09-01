Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07960C61DD6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 20:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C4810E1F8;
	Tue,  1 Sep 2026 20:58:26 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFA110E1F8;
 Tue,  1 Sep 2026 20:57:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5865072194527278404=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/xe=3A_Use_proper_GT_l?=
 =?utf-8?q?ookup_in_xe=5Fgt=5Fget=5Ftile=5Fid=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 01 Sep 2026 20:57:45 -0000
Message-ID: <178829626582.109472.18128019516241079761@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831-gtlookup_noncontig-v1-1-37f22a0cbb6b@intel.com>
In-Reply-To: <20260831-gtlookup_noncontig-v1-1-37f22a0cbb6b@intel.com>
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

--===============5865072194527278404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe: Use proper GT lookup in xe_gt_get_tile_id()
URL   : https://patchwork.freedesktop.org/series/173091/
State : success

== Summary ==

CI Bug Log - changes from IGT_9079 -> IGTPW_15761
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15761/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15761 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-rpls-4:         [DMESG-WARN][1] ([i915#13400]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9079/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15761/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9079 -> IGTPW_15761
  * Linux: CI_DRM_19066 -> CI_DRM_19068

  CI-20190529: 20190529
  CI_DRM_19066: b8f17b16c0f8638b9df4f090511e3ae97210eb77 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19068: 97649417ea562630ab357dbea25f153a654b61c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15761: 3b5b19092278c68e6ba8294c07dbb98a08324a1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9079: 9079

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15761/index.html

--===============5865072194527278404==
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
<tr><td><b>Series:</b></td><td>lib/xe: Use proper GT lookup in xe_gt_get_tile_id()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173091/">https://patchwork.freedesktop.org/series/173091/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15761/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15761/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9079 -&gt; IGTPW_15761</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15761/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15761 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9079/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15761/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9079 -&gt; IGTPW_15761</li>
<li>Linux: CI_DRM_19066 -&gt; CI_DRM_19068</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19066: b8f17b16c0f8638b9df4f090511e3ae97210eb77 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19068: 97649417ea562630ab357dbea25f153a654b61c6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15761: 3b5b19092278c68e6ba8294c07dbb98a08324a1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9079: 9079</p>

</body>
</html>

--===============5865072194527278404==--
