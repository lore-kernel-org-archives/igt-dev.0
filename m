Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1855BD74EC1
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 12:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF98010E27E;
	Fri, 23 Jan 2026 12:54:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0E310E27E;
 Fri, 23 Jan 2026 12:54:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5413424241707954380=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lsgpu=3A_Report_upstream_?=
 =?utf-8?q?port_link_bandwidth_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Jan 2026 12:54:56 -0000
Message-ID: <176917289638.187528.12908123113721095638@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121114656.1970684-9-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20260121114656.1970684-9-janusz.krzysztofik@linux.intel.com>
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

--===============5413424241707954380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lsgpu: Report upstream port link bandwidth (rev4)
URL   : https://patchwork.freedesktop.org/series/160415/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8715 -> IGTPW_14411
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14411 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14411, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14411/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): bat-mtlp-8 fi-snb-2520m bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14411:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8715/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14411/bat-arlh-3/igt@i915_selftest@live.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8715 -> IGTPW_14411
  * Linux: CI_DRM_17875 -> CI_DRM_17877

  CI-20190529: 20190529
  CI_DRM_17875: f20afcc51cabf38938961caf0e634144aa21b6a3 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17877: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14411: 14411
  IGT_8715: 8715

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14411/index.html

--===============5413424241707954380==
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
<tr><td><b>Series:</b></td><td>lsgpu: Report upstream port link bandwidth (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160415/">https://patchwork.freedesktop.org/series/160415/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14411/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14411/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8715 -&gt; IGTPW_14411</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14411 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14411, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14411/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): bat-mtlp-8 fi-snb-2520m bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14411:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8715/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14411/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8715 -&gt; IGTPW_14411</li>
<li>Linux: CI_DRM_17875 -&gt; CI_DRM_17877</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17875: f20afcc51cabf38938961caf0e634144aa21b6a3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17877: ab42b1c3fe4ce1ae5534c51b880d3a97e6bba145 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14411: 14411<br />
  IGT_8715: 8715</p>

</body>
</html>

--===============5413424241707954380==--
