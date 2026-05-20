Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32140CD5BA4
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 18:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5F310E15D;
	Wed, 20 May 2026 18:27:31 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854AE10E15D;
 Wed, 20 May 2026 18:27:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6628856002781324774=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/intel=5Fbatchbuffer?=
 =?utf-8?q?=3A_intel_bb_copy_data_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 20 May 2026 18:27:12 -0000
Message-ID: <177930163253.92320.4603919530781505257@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
In-Reply-To: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
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

--===============6628856002781324774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_batchbuffer: intel bb copy data improvements
URL   : https://patchwork.freedesktop.org/series/166929/
State : success

== Summary ==

CI Bug Log - changes from IGT_8925 -> IGTPW_15212
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15212 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-hsw-4770:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/fi-hsw-4770/igt@dmabuf@all-tests.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-hsw-4770:        [INCOMPLETE][2] -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8925/fi-hsw-4770/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/fi-hsw-4770/igt@i915_selftest@live.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-bsw-n3050:       [DMESG-WARN][4] -> [PASS][5] +5 other tests pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8925/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8925 -> IGTPW_15212
  * Linux: CI_DRM_18526 -> CI_DRM_18528

  CI-20190529: 20190529
  CI_DRM_18526: 7d39df83e93eba14a23b1fb6ffff076eb191f27b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18528: b428173ad72a8d0cf25168e8766f0add188aa13a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15212: 15212
  IGT_8925: cae7174cb10736765bb930ad65b82788951f6ee4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/index.html

--===============6628856002781324774==
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
<tr><td><b>Series:</b></td><td>lib/intel_batchbuffer: intel bb copy data improvements</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166929/">https://patchwork.freedesktop.org/series/166929/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8925 -&gt; IGTPW_15212</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15212 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@dmabuf@all-tests:<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/fi-hsw-4770/igt@dmabuf@all-tests.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8925/fi-hsw-4770/igt@i915_selftest@live.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/fi-hsw-4770/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8925/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15212/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8925 -&gt; IGTPW_15212</li>
<li>Linux: CI_DRM_18526 -&gt; CI_DRM_18528</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18526: 7d39df83e93eba14a23b1fb6ffff076eb191f27b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18528: b428173ad72a8d0cf25168e8766f0add188aa13a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15212: 15212<br />
  IGT_8925: cae7174cb10736765bb930ad65b82788951f6ee4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6628856002781324774==--
