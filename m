Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E02606A6A0
	for <igt-dev@archiver.kernel.org>; Sat, 21 Nov 2026 00:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DE610E0AC;
	Sat, 21 Nov 2026 00:09:35 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC5210E0AC;
 Sat, 21 Nov 2026 00:08:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1687595826862582596=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fcolor=5Fpipel?=
 =?utf-8?q?ine=3A_Limit_simulation_to_first/last_planes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 21 Nov 2026 00:08:40 -0000
Message-ID: <179521972023.62612.12634972697646098984@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120192818.1894936-1-swati2.sharma@intel.com>
In-Reply-To: <20261120192818.1894936-1-swati2.sharma@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1687595826862582596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color_pipeline: Limit simulation to first/last planes
URL   : https://patchwork.freedesktop.org/series/179247/
State : success

== Summary ==

CI Bug Log - changes from IGT_9201 -> IGTPW_16195
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16195/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16195 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [INCOMPLETE][1] ([i915#16547]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9201/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16195/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@active:
    - bat-arlh-3:         [INCOMPLETE][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9201/bat-arlh-3/igt@i915_selftest@live@active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16195/bat-arlh-3/igt@i915_selftest@live@active.html

  
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9201 -> IGTPW_16195
  * Linux: CI_DRM_19574 -> CI_DRM_19576

  CI-20190529: 20190529
  CI_DRM_19574: 90b50d97b3af2f55a75116f1ec76e0cf62914418 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19576: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16195: 16195
  IGT_9201: 9201

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16195/index.html

--===============1687595826862582596==
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
<tr><td><b>Series:</b></td><td>tests/kms_color_pipeline: Limit simulation to first/last planes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179247/">https://patchwork.freedesktop.org/series/179247/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16195/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16195/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9201 -&gt; IGTPW_16195</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16195/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16195 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9201/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16195/bat-arlh-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9201/bat-arlh-3/igt@i915_selftest@live@active.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16195/bat-arlh-3/igt@i915_selftest@live@active.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9201 -&gt; IGTPW_16195</li>
<li>Linux: CI_DRM_19574 -&gt; CI_DRM_19576</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19574: 90b50d97b3af2f55a75116f1ec76e0cf62914418 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19576: 3efe9c6d5f3764dd50e91b1721c06d707f5afbf0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16195: 16195<br />
  IGT_9201: 9201</p>

</body>
</html>

--===============1687595826862582596==--
