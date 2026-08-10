Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD044C5AD7B
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 20:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413B810E257;
	Mon, 10 Aug 2026 20:37:52 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628AB10E257;
 Mon, 10 Aug 2026 20:37:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0222456753347437426=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpsr2=5F?=
 =?utf-8?q?sf=3A_Restrict_ET_validation_to_eDP_only_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 10 Aug 2026 20:37:18 -0000
Message-ID: <178639423839.36095.16161940812311468457@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
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

--===============0222456753347437426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_psr2_sf: Restrict ET validation to eDP only (rev3)
URL   : https://patchwork.freedesktop.org/series/168234/
State : success

== Summary ==

CI Bug Log - changes from IGT_9049 -> IGTPW_15652
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15652/index.html

Participating hosts (37 -> 35)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15652 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@ring_submission:
    - fi-cfl-8109u:       [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +80 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9049/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15652/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-WARN][4] ([i915#13735] / [i915#15673]) +49 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9049/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15652/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9049 -> IGTPW_15652
  * Linux: CI_DRM_18974 -> CI_DRM_18975

  CI-20190529: 20190529
  CI_DRM_18974: 3cfddba17e303f0af0f4f49885f1586dd126b093 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18975: d6fed6030d92c5ea118c12464a48ee41db1b6916 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15652: 15652
  IGT_9049: 9049

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15652/index.html

--===============0222456753347437426==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_psr2_sf: Restrict ET validation to eDP only (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168234/">https://patchwork.freedesktop.org/series/168234/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15652/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15652/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9049 -&gt; IGTPW_15652</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15652/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15652 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9049/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15652/fi-cfl-8109u/igt@i915_selftest@live@ring_submission.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +80 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9049/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15652/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) +49 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9049 -&gt; IGTPW_15652</li>
<li>Linux: CI_DRM_18974 -&gt; CI_DRM_18975</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18974: 3cfddba17e303f0af0f4f49885f1586dd126b093 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18975: d6fed6030d92c5ea118c12464a48ee41db1b6916 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15652: 15652<br />
  IGT_9049: 9049</p>

</body>
</html>

--===============0222456753347437426==--
