Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B339F3D31A
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 16:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8CE10EC3E;
	Thu,  5 Mar 2026 16:22:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED41010E2CA;
 Thu,  5 Mar 2026 16:22:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7877263567710869013=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Fcolorop=3A_Up?=
 =?utf-8?q?date_gamma_2=2E2_LUT_names?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Mar 2026 16:22:07 -0000
Message-ID: <177272772794.322779.5689606610760381863@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305061212.4133135-1-alex.hung@amd.com>
In-Reply-To: <20260305061212.4133135-1-alex.hung@amd.com>
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

--===============7877263567710869013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_colorop: Update gamma 2.2 LUT names
URL   : https://patchwork.freedesktop.org/series/162627/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8779 -> IGTPW_14676
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14676 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14676, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/index.html

Participating hosts (42 -> 38)
------------------------------

  Missing    (4): bat-adlp-9 bat-apl-1 fi-snb-2520m bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14676:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-plain-flip@c-hdmi-a2:
    - fi-bsw-n3050:       [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8779/fi-bsw-n3050/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/fi-bsw-n3050/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html

  
Known issues
------------

  Here are the changes found in IGTPW_14676 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arls-5:         [PASS][3] -> [DMESG-FAIL][4] ([i915#15784]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8779/bat-arls-5/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/bat-arls-5/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-bsw-n3050:       [PASS][5] -> [DMESG-WARN][6] ([i915#15674]) +3 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8779/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-dg2-8:          [DMESG-FAIL][7] ([i915#12061]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8779/bat-dg2-8/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/bat-dg2-8/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#15674]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15674
  [i915#15784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15784


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8779 -> IGTPW_14676
  * Linux: CI_DRM_18096 -> CI_DRM_18097

  CI-20190529: 20190529
  CI_DRM_18096: 704ff20b65b8a8037c10332bad4ecabbfeab7cdc @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18097: 9565ad1c312903452467b9f685c59e2f47f512e5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14676: 6c74ac92f474b5074b48e87b1766fbcbba4846f3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8779: 4aff2e43cb4a07d16e9b203d77705e29fa50cb9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/index.html

--===============7877263567710869013==
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
<tr><td><b>Series:</b></td><td>tests/kms_colorop: Update gamma 2.2 LUT names</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162627/">https://patchwork.freedesktop.org/series/162627/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8779 -&gt; IGTPW_14676</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14676 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14676, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): bat-adlp-9 bat-apl-1 fi-snb-2520m bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14676:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-hdmi-a2:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8779/fi-bsw-n3050/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/fi-bsw-n3050/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14676 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8779/bat-arls-5/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/bat-arls-5/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15784">i915#15784</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8779/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15674">i915#15674</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8779/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14676/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8779 -&gt; IGTPW_14676</li>
<li>Linux: CI_DRM_18096 -&gt; CI_DRM_18097</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18096: 704ff20b65b8a8037c10332bad4ecabbfeab7cdc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18097: 9565ad1c312903452467b9f685c59e2f47f512e5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14676: 6c74ac92f474b5074b48e87b1766fbcbba4846f3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8779: 4aff2e43cb4a07d16e9b203d77705e29fa50cb9e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7877263567710869013==--
