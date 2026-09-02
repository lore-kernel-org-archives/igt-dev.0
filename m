Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66D2C61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 00:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D57D10E076;
	Wed,  2 Sep 2026 00:31:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C59210E076;
 Wed,  2 Sep 2026 00:31:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2898827980290877841=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2C1/5=5D_lib/igt=5Ffb=3A_add_igt=5Fformat=5Fget=5Fsubsamplin?=
 =?utf-8?q?g=28=29_function?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 02 Sep 2026 00:31:11 -0000
Message-ID: <178830907150.109424.4101232227596732052@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901170740.1079715-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260901170740.1079715-1-juhapekka.heikkila@gmail.com>
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

--===============2898827980290877841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/5] lib/igt_fb: add igt_format_get_subsampling() function
URL   : https://patchwork.freedesktop.org/series/173167/
State : success

== Summary ==

CI Bug Log - changes from IGT_9079 -> IGTPW_15768
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15768 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2] ([i915#16562])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9079/fi-bsw-nick/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/fi-bsw-nick/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - fi-bsw-nick:        [PASS][3] -> [ABORT][4] ([i915#16633])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9079/fi-bsw-nick/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/fi-bsw-nick/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-rpls-4:         [DMESG-WARN][5] ([i915#13400]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9079/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#16562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16562
  [i915#16633]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16633


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9079 -> IGTPW_15768
  * Linux: CI_DRM_19066 -> CI_DRM_19069

  CI-20190529: 20190529
  CI_DRM_19066: b8f17b16c0f8638b9df4f090511e3ae97210eb77 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19069: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15768: 29121962da25b93630634282f1a7d0f7a15d1a89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9079: 9079

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/index.html

--===============2898827980290877841==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/5] lib/igt_fb: add igt_format_get_subsampling() function</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173167/">https://patchwork.freedesktop.org/series/173167/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9079 -&gt; IGTPW_15768</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15768 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9079/fi-bsw-nick/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/fi-bsw-nick/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16562">i915#16562</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9079/fi-bsw-nick/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/fi-bsw-nick/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16633">i915#16633</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9079/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15768/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9079 -&gt; IGTPW_15768</li>
<li>Linux: CI_DRM_19066 -&gt; CI_DRM_19069</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19066: b8f17b16c0f8638b9df4f090511e3ae97210eb77 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19069: c53467440a5196138d2d6610e269a43b6b47bf6b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15768: 29121962da25b93630634282f1a7d0f7a15d1a89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9079: 9079</p>

</body>
</html>

--===============2898827980290877841==--
