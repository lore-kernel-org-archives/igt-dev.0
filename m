Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA955606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 11:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E1A10E3D0;
	Tue, 27 Oct 2026 11:01:45 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B570610E3D0;
 Tue, 27 Oct 2026 11:00:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2797832962324860121=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel=3A_Add_helper?=
 =?utf-8?q?_to_dump_GT_debug_state_on_C6_wait_failures_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anirban, Sk" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 Oct 2026 11:00:49 -0000
Message-ID: <179309884973.75298.1771391421984141201@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023121034.1139234-2-sk.anirban@intel.com>
In-Reply-To: <20261023121034.1139234-2-sk.anirban@intel.com>
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

--===============2797832962324860121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Add helper to dump GT debug state on C6 wait failures (rev3)
URL   : https://patchwork.freedesktop.org/series/174646/
State : success

== Summary ==

CI Bug Log - changes from IGT_9162 -> IGTPW_16041
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16041 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2] ([i915#16547])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/bat-arlh-2/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4] ([i915#17382])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html

  
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547
  [i915#17382]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17382


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9162 -> IGTPW_16041

  CI-20190529: 20190529
  CI_DRM_19391: b255dd13059988fddde9ea187d1dd1017c9a5766 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16041: 16041
  IGT_9162: 9162

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html

--===============2797832962324860121==
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
<tr><td><b>Series:</b></td><td>tests/intel: Add helper to dump GT debug state on C6 wait failures (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174646/">https://patchwork.freedesktop.org/series/174646/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9162 -&gt; IGTPW_16041</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16041 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16041/bat-arlh-2/igt@i915_selftest@live@sanitycheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17382">i915#17382</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9162 -&gt; IGTPW_16041</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19391: b255dd13059988fddde9ea187d1dd1017c9a5766 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16041: 16041<br />
  IGT_9162: 9162</p>

</body>
</html>

--===============2797832962324860121==--
