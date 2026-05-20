Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C336ECD4F5E
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 20:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D6010E12A;
	Wed, 20 May 2026 20:26:46 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171F110E12A;
 Wed, 20 May 2026 20:26:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1706057199576581627=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Ffrontbu?=
 =?utf-8?q?ffer=5Ftracking=3A_Fix_duplicate_documentation_descriptions_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 20 May 2026 20:26:27 -0000
Message-ID: <177930878708.93166.3729778212979273766@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260520123010.2482801-1-swati2.sharma@intel.com>
In-Reply-To: <20260520123010.2482801-1-swati2.sharma@intel.com>
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

--===============1706057199576581627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_frontbuffer_tracking: Fix duplicate documentation descriptions (rev2)
URL   : https://patchwork.freedesktop.org/series/166630/
State : success

== Summary ==

CI Bug Log - changes from IGT_8925 -> IGTPW_15213
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15213 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-hsw-4770:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/fi-hsw-4770/igt@dmabuf@all-tests.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-hsw-4770:        [INCOMPLETE][2] -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8925/fi-hsw-4770/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/fi-hsw-4770/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-bsw-n3050:       [DMESG-WARN][4] -> [PASS][5] +5 other tests pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8925/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8925 -> IGTPW_15213
  * Linux: CI_DRM_18526 -> CI_DRM_18528

  CI-20190529: 20190529
  CI_DRM_18526: 7d39df83e93eba14a23b1fb6ffff076eb191f27b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18528: b428173ad72a8d0cf25168e8766f0add188aa13a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15213: 361e1951afcb27d0cc422d33926aac1d9019ba36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8925: cae7174cb10736765bb930ad65b82788951f6ee4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/index.html

--===============1706057199576581627==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_frontbuffer_tracking: Fix duplicate documentation descriptions (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166630/">https://patchwork.freedesktop.org/series/166630/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8925 -&gt; IGTPW_15213</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15213 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@dmabuf@all-tests:<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/fi-hsw-4770/igt@dmabuf@all-tests.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8925/fi-hsw-4770/igt@i915_selftest@live.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/fi-hsw-4770/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8925/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15213/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8925 -&gt; IGTPW_15213</li>
<li>Linux: CI_DRM_18526 -&gt; CI_DRM_18528</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18526: 7d39df83e93eba14a23b1fb6ffff076eb191f27b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18528: b428173ad72a8d0cf25168e8766f0add188aa13a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15213: 361e1951afcb27d0cc422d33926aac1d9019ba36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8925: cae7174cb10736765bb930ad65b82788951f6ee4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1706057199576581627==--
