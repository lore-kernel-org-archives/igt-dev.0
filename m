Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04315C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 05:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC7B10E1C9;
	Wed,  2 Apr 2025 05:23:55 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E56A10E1C9;
 Wed,  2 Apr 2025 05:23:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3796894641176991738=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fcursor=5Fcrc?=
 =?utf-8?q?=3A_Test_async_changes_midframe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 02 Apr 2025 05:23:54 -0000
Message-ID: <174357143424.25930.13316160407894079205@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402043228.404847-1-shekhar.chauhan@intel.com>
In-Reply-To: <20250402043228.404847-1-shekhar.chauhan@intel.com>
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

--===============3796894641176991738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Test async changes midframe (rev2)
URL   : https://patchwork.freedesktop.org/series/146795/
State : success

== Summary ==

CI Bug Log - changes from IGT_8297 -> IGTPW_12904
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12904/index.html

Participating hosts (42 -> 41)
------------------------------

  Additional (1): bat-jsl-4 
  Missing    (2): bat-arlh-2 fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_12904 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [DMESG-FAIL][1] ([i915#12061]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8297/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12904/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13950]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13950


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8297 -> IGTPW_12904
  * Linux: CI_DRM_16353 -> CI_DRM_16361

  CI-20190529: 20190529
  CI_DRM_16353: 204a9be8ec9dd0940fbdaf9180336b156148e201 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16361: 0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12904: ed7992df24e8ae7cd3c89b1bc6e4489a73963d56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12904/index.html

--===============3796894641176991738==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Test async changes midframe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146795/">https://patchwork.freedesktop.org/series/146795/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12904/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12904/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8297 -&gt; IGTPW_12904</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12904/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Additional (1): bat-jsl-4 <br />
  Missing    (2): bat-arlh-2 fi-pnv-d510 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12904 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8297/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12904/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8297 -&gt; IGTPW_12904</li>
<li>Linux: CI_DRM_16353 -&gt; CI_DRM_16361</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16353: 204a9be8ec9dd0940fbdaf9180336b156148e201 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16361: 0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12904: ed7992df24e8ae7cd3c89b1bc6e4489a73963d56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3796894641176991738==--
