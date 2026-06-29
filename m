Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2845C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 21:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D4910E10B;
	Mon, 29 Jun 2026 21:55:22 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F66B10E10B;
 Mon, 29 Jun 2026 21:54:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0832938752162892190=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_pipe=5Fcrc=5Fbasic=3A_lim?=
 =?utf-8?q?it_suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Jun 2026 21:54:54 -0000
Message-ID: <178277009464.130542.11992523402073502810@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260629091350.2706610-1-michal.grzelak@intel.com>
In-Reply-To: <20260629091350.2706610-1-michal.grzelak@intel.com>
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

--===============0832938752162892190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: pipe_crc_basic: limit suspend
URL   : https://patchwork.freedesktop.org/series/169414/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8988 -> IGTPW_15447
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15447 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15447, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-adlp-9 fi-snb-2520m bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15447:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/bat-arlh-3/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/bat-arlh-3/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_15447 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_debugfs@read-all-entries:
    - bat-adlp-6:         [PASS][3] -> [DMESG-WARN][4] ([i915#15673])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/bat-adlp-6/igt@core_debugfs@read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/bat-adlp-6/igt@core_debugfs@read-all-entries.html

  * igt@dmabuf@all-tests:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/fi-kbl-8809g/igt@dmabuf@all-tests.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - bat-adlp-6:         [DMESG-WARN][7] ([i915#15673]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/bat-adlp-6/igt@core_auth@basic-auth.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/bat-adlp-6/igt@core_auth@basic-auth.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-kbl-8809g:       [ABORT][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8988 -> IGTPW_15447
  * Linux: CI_DRM_18724 -> CI_DRM_18726

  CI-20190529: 20190529
  CI_DRM_18724: b9aebfff5a3c5049500a7bd4573815090a425f34 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18726: 03288b34f48c3fe60055353c30da4aacab572cdc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15447: 15447
  IGT_8988: 8988

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/index.html

--===============0832938752162892190==
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
<tr><td><b>Series:</b></td><td>pipe_crc_basic: limit suspend</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169414/">https://patchwork.freedesktop.org/series/169414/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8988 -&gt; IGTPW_15447</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15447 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15447, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-adlp-9 fi-snb-2520m bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15447:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15447 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_debugfs@read-all-entries:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/bat-adlp-6/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/bat-adlp-6/igt@core_debugfs@read-all-entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/fi-kbl-8809g/igt@dmabuf@all-tests.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/bat-adlp-6/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/bat-adlp-6/igt@core_auth@basic-auth.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15447/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8988 -&gt; IGTPW_15447</li>
<li>Linux: CI_DRM_18724 -&gt; CI_DRM_18726</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18724: b9aebfff5a3c5049500a7bd4573815090a425f34 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18726: 03288b34f48c3fe60055353c30da4aacab572cdc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15447: 15447<br />
  IGT_8988: 8988</p>

</body>
</html>

--===============0832938752162892190==--
