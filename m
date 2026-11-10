Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C03606A33D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 18:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891F510E321;
	Tue, 10 Nov 2026 18:27:32 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2049510E321;
 Tue, 10 Nov 2026 18:26:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2675406699281464767=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel=3A_Add_edge_c?=
 =?utf-8?q?ase_and_race_condition_tests_for_GEM=5FCHANGE=5FHANDLE_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Francis" <david.francis@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Nov 2026 18:26:37 -0000
Message-ID: <179433519712.4772.10517030880797703042@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261110153230.583745-1-David.Francis@amd.com>
In-Reply-To: <20261110153230.583745-1-David.Francis@amd.com>
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
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2675406699281464767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Add edge case and race condition tests for GEM_CHANGE_HANDLE (rev5)
URL   : https://patchwork.freedesktop.org/series/175696/
State : success

== Summary ==

CI Bug Log - changes from IGT_9184 -> IGTPW_16127
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16127/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16127 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adls-6:         [FAIL][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9184/bat-adls-6/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16127/bat-adls-6/igt@i915_pm_rpm@module-reload.html

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [DMESG-WARN][3] ([i915#13400]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9184/bat-rpls-4/igt@vgem_basic@unload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16127/bat-rpls-4/igt@vgem_basic@unload.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9184 -> IGTPW_16127

  CI-20190529: 20190529
  CI_DRM_19483: 7b21e496056a6483b471dbc5f858059cb83becc6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16127: 16127
  IGT_9184: 9184

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16127/index.html

--===============2675406699281464767==
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
<tr><td><b>Series:</b></td><td>tests/intel: Add edge case and race condition tests for GEM_CHANGE_HANDLE (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175696/">https://patchwork.freedesktop.org/series/175696/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16127/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16127/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9184 -&gt; IGTPW_16127</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16127/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16127 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9184/bat-adls-6/igt@i915_pm_rpm@module-reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16127/bat-adls-6/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9184/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16127/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9184 -&gt; IGTPW_16127</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19483: 7b21e496056a6483b471dbc5f858059cb83becc6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16127: 16127<br />
  IGT_9184: 9184</p>

</body>
</html>

--===============2675406699281464767==--
