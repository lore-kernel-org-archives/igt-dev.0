Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89C5C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 18:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778D410E67A;
	Wed, 31 Jul 2024 18:30:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD1C10E162;
 Wed, 31 Jul 2024 18:30:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7004862947926613818=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_New_test_to_validate_link-off_?=
 =?utf-8?q?between_active_regions_=28LOBF=29_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 31 Jul 2024 18:30:23 -0000
Message-ID: <172245062310.468997.13702258125138233873@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731150741.2952335-1-jeevan.b@intel.com>
In-Reply-To: <20240731150741.2952335-1-jeevan.b@intel.com>
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

--===============7004862947926613818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New test to validate link-off between active regions (LOBF) (rev7)
URL   : https://patchwork.freedesktop.org/series/135446/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7947_BAT -> XEIGTPW_11508_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11508_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#2262]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7947/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11508/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html

  
  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262


Build changes
-------------

  * IGT: IGT_7947 -> IGTPW_11508
  * Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -> xe-1697-91efc68883cbff0e7e453d1828c8e84d9959c458

  IGTPW_11508: a0188b4f6ff43f45ce9f39f12d76af3d9aae3e6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7947: 6b46cef93ce2c2f821bfcaa3c3a111e1cf5c76fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338
  xe-1697-91efc68883cbff0e7e453d1828c8e84d9959c458: 91efc68883cbff0e7e453d1828c8e84d9959c458

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11508/index.html

--===============7004862947926613818==
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
<tr><td><b>Series:</b></td><td>New test to validate link-off between active regions (LOBF) (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135446/">https://patchwork.freedesktop.org/series/135446/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11508/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11508/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7947_BAT -&gt; XEIGTPW_11508_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11508_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_gt_freq@freq_fixed_idle:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7947/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11508/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7947 -&gt; IGTPW_11508</li>
<li>Linux: xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338 -&gt; xe-1697-91efc68883cbff0e7e453d1828c8e84d9959c458</li>
</ul>
<p>IGTPW_11508: a0188b4f6ff43f45ce9f39f12d76af3d9aae3e6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7947: 6b46cef93ce2c2f821bfcaa3c3a111e1cf5c76fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338<br />
  xe-1697-91efc68883cbff0e7e453d1828c8e84d9959c458: 91efc68883cbff0e7e453d1828c8e84d9959c458</p>

</body>
</html>

--===============7004862947926613818==--
