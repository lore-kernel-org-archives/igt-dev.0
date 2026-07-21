Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A75BC4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 20:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F9010E08B;
	Tue, 21 Jul 2026 20:05:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77C110E08B;
 Tue, 21 Jul 2026 20:04:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3420911208679792013=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Ft?=
 =?utf-8?q?hreads=3A_whitelist_expected_multi-queue_hang_dmesg_warns?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jul 2026 20:04:33 -0000
Message-ID: <178466427387.212456.432242119218517938@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260721130405.25573-1-himanshu.girotra@intel.com>
In-Reply-To: <20260721130405.25573-1-himanshu.girotra@intel.com>
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

--===============3420911208679792013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_threads: whitelist expected multi-queue hang dmesg warns
URL   : https://patchwork.freedesktop.org/series/170821/
State : success

== Summary ==

CI Bug Log - changes from IGT_9017 -> IGTPW_15573
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15573/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_15573 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-6:         [PASS][1] -> [DMESG-WARN][2] ([i915#15673])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9017/bat-adlp-6/igt@core_auth@basic-auth.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15573/bat-adlp-6/igt@core_auth@basic-auth.html

  
#### Possible fixes ####

  * igt@core_debugfs@read-all-entries:
    - bat-adlp-6:         [DMESG-WARN][3] ([i915#15673]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9017/bat-adlp-6/igt@core_debugfs@read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15573/bat-adlp-6/igt@core_debugfs@read-all-entries.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9017 -> IGTPW_15573
  * Linux: CI_DRM_18866 -> CI_DRM_18869

  CI-20190529: 20190529
  CI_DRM_18866: 15b41fd8ef085dbf5b64fe5819415f20bd61983e @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18869: 80b509f6e34a01edfccc01a05e3e7062a934bcf9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15573: 15573
  IGT_9017: 9017

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15573/index.html

--===============3420911208679792013==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_threads: whitelist expected multi-queue hang dmesg warns</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170821/">https://patchwork.freedesktop.org/series/170821/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15573/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15573/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9017 -&gt; IGTPW_15573</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15573/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15573 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9017/bat-adlp-6/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15573/bat-adlp-6/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_debugfs@read-all-entries:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9017/bat-adlp-6/igt@core_debugfs@read-all-entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15573/bat-adlp-6/igt@core_debugfs@read-all-entries.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9017 -&gt; IGTPW_15573</li>
<li>Linux: CI_DRM_18866 -&gt; CI_DRM_18869</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18866: 15b41fd8ef085dbf5b64fe5819415f20bd61983e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18869: 80b509f6e34a01edfccc01a05e3e7062a934bcf9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15573: 15573<br />
  IGT_9017: 9017</p>

</body>
</html>

--===============3420911208679792013==--
