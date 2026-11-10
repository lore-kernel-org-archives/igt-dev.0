Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9142B6075033
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 09:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435AA10E4D4;
	Tue, 10 Nov 2026 09:27:27 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12FF10E90B;
 Tue, 10 Nov 2026 09:26:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0336068110572639978=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpsr2=5F?=
 =?utf-8?q?sf=3A_Skip_PSR2_subtests_when_PSR2_isn=27t_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Nov 2026 09:26:30 -0000
Message-ID: <179430279084.2180.4966062260781656380@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261110082622.3473582-1-mika.kahola@intel.com>
In-Reply-To: <20261110082622.3473582-1-mika.kahola@intel.com>
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

--===============0336068110572639978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_psr2_sf: Skip PSR2 subtests when PSR2 isn't enabled
URL   : https://patchwork.freedesktop.org/series/178162/
State : success

== Summary ==

CI Bug Log - changes from IGT_9182 -> IGTPW_16123
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16123/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16123 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@vma:
    - bat-mtlp-9:         [INCOMPLETE][1] ([i915#16229]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9182/bat-mtlp-9/igt@i915_selftest@live@vma.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16123/bat-mtlp-9/igt@i915_selftest@live@vma.html

  
  [i915#16229]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9182 -> IGTPW_16123
  * Linux: CI_DRM_19475 -> CI_DRM_19479

  CI-20190529: 20190529
  CI_DRM_19475: d72707a042b6aff601449a9cf87e5fe55decbc5c @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19479: 867329f98eb3be3973842ba354968fcce947d2b0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16123: 16123
  IGT_9182: 9182

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16123/index.html

--===============0336068110572639978==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_psr2_sf: Skip PSR2 subtests when PSR2 isn&#x27;t enabled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178162/">https://patchwork.freedesktop.org/series/178162/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16123/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16123/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9182 -&gt; IGTPW_16123</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16123/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16123 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@vma:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9182/bat-mtlp-9/igt@i915_selftest@live@vma.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229">i915#16229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16123/bat-mtlp-9/igt@i915_selftest@live@vma.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9182 -&gt; IGTPW_16123</li>
<li>Linux: CI_DRM_19475 -&gt; CI_DRM_19479</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19475: d72707a042b6aff601449a9cf87e5fe55decbc5c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19479: 867329f98eb3be3973842ba354968fcce947d2b0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16123: 16123<br />
  IGT_9182: 9182</p>

</body>
</html>

--===============0336068110572639978==--
