Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E0A606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 20:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554E210E103;
	Wed, 28 Oct 2026 20:22:43 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AA610E103;
 Wed, 28 Oct 2026 20:21:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7629104130350948531=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fwedged?=
 =?utf-8?q?=3A_Add_cold-reset_wedge_test_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Oct 2026 20:21:51 -0000
Message-ID: <179321891102.84131.3715873045702635763@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028133045.1966466-4-sk.anirban@intel.com>
In-Reply-To: <20261028133045.1966466-4-sk.anirban@intel.com>
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

--===============7629104130350948531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_wedged: Add cold-reset wedge test (rev7)
URL   : https://patchwork.freedesktop.org/series/175755/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9170 -> IGTPW_16061
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16061 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16061, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16061/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16061:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-hsw-4770:        [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9170/fi-hsw-4770/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16061/fi-hsw-4770/igt@i915_selftest@live.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9170 -> IGTPW_16061

  CI-20190529: 20190529
  CI_DRM_19407: fbed42265ffde9b162e21ed7ff0cfce070e19aaa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16061: 16061
  IGT_9170: 9170

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16061/index.html

--===============7629104130350948531==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_wedged: Add cold-reset wedge test (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175755/">https://patchwork.freedesktop.org/series/175755/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16061/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16061/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9170 -&gt; IGTPW_16061</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16061 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_16061, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16061/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_16061:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9170/fi-hsw-4770/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16061/fi-hsw-4770/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9170 -&gt; IGTPW_16061</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19407: fbed42265ffde9b162e21ed7ff0cfce070e19aaa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16061: 16061<br />
  IGT_9170: 9170</p>

</body>
</html>

--===============7629104130350948531==--
