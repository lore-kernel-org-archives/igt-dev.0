Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10B8606A327
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 23:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D2E10E002;
	Wed, 25 Nov 2026 23:16:28 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF3F10E002;
 Wed, 25 Nov 2026 23:15:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3046535053845526343=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2Cv2=2C1/2=5D_tests/kms=5Fsetmode=3A_Fix_previous_crtc_mode_?=
 =?utf-8?q?lookup_in_joiner_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 25 Nov 2026 23:15:28 -0000
Message-ID: <179564852818.87977.6601693874895279006@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261125102352.1905996-1-karthik.b.s@intel.com>
In-Reply-To: <20261125102352.1905996-1-karthik.b.s@intel.com>
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

--===============3046535053845526343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/kms_setmode: Fix previous crtc mode lookup in joiner check
URL   : https://patchwork.freedesktop.org/series/179626/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9204 -> IGTPW_16216
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16216 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16216, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16216:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@active:
    - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9204/bat-arlh-2/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/bat-arlh-2/igt@i915_selftest@live@active.html

  
Known issues
------------

  Here are the changes found in IGTPW_16216 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - fi-bsw-n3050:       [PASS][3] -> [ABORT][4] ([i915#17765] / [i915#17881]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9204/fi-bsw-n3050/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/fi-bsw-n3050/igt@i915_selftest@live.html
    - bat-arlh-2:         [PASS][5] -> [INCOMPLETE][6] ([i915#16547])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9204/bat-arlh-2/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/bat-arlh-2/igt@i915_selftest@live.html

  
#### Possible fixes ####

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [DMESG-WARN][7] ([i915#13400]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9204/bat-rpls-4/igt@vgem_basic@unload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/bat-rpls-4/igt@vgem_basic@unload.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#16547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547
  [i915#17765]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17765
  [i915#17881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17881


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9204 -> IGTPW_16216
  * Linux: CI_DRM_19607 -> CI_DRM_19611

  CI-20190529: 20190529
  CI_DRM_19607: ad6614dbc84cd68a4bff21a5d166f2894db7ae2b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19611: 01f73ffa8189526c8c33d591371ea89803fa6e2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16216: 16216
  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/index.html

--===============3046535053845526343==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/kms_setmode: Fix previous crtc mode lookup in joiner check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179626/">https://patchwork.freedesktop.org/series/179626/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9204 -&gt; IGTPW_16216</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16216 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_16216, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_16216:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@active:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9204/bat-arlh-2/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/bat-arlh-2/igt@i915_selftest@live@active.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16216 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9204/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/fi-bsw-n3050/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17765">i915#17765</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17881">i915#17881</a>) +1 other test abort</li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9204/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16547">i915#16547</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@vgem_basic@unload:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9204/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16216/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9204 -&gt; IGTPW_16216</li>
<li>Linux: CI_DRM_19607 -&gt; CI_DRM_19611</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19607: ad6614dbc84cd68a4bff21a5d166f2894db7ae2b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19611: 01f73ffa8189526c8c33d591371ea89803fa6e2e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16216: 16216<br />
  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3046535053845526343==--
