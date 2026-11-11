Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B9C606A331
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 15:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA91010EA7B;
	Wed, 11 Nov 2026 15:43:01 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C886310EA5C;
 Wed, 11 Nov 2026 15:41:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6605257434187263228=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/i915=5Fpm=5Frpm?=
 =?utf-8?q?=3A_Print_reason_for_skipping_PC8_subtest_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hiresh Kumar Yadav" <hiresh.kumar.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Nov 2026 15:41:56 -0000
Message-ID: <179441171681.10309.5242756881268069293@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111100742.1983913-1-hiresh.kumar.yadav@intel.com>
In-Reply-To: <20261111100742.1983913-1-hiresh.kumar.yadav@intel.com>
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
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6605257434187263228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_pm_rpm: Print reason for skipping PC8 subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/177832/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9186_BAT -> XEIGTPW_16134_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_16134_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9186/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16134/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9186 -> IGTPW_16134
  * Linux: xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232 -> xe-6113-1434742f20cf3d14b493e40c453536b5414b9762

  IGTPW_16134: 50e6445e73fd7050afd90c18ac26d57f8d0838e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9186: 9186
  xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232: c8d0fb6110b86aa64eb59502df08b529e221f232
  xe-6113-1434742f20cf3d14b493e40c453536b5414b9762: 1434742f20cf3d14b493e40c453536b5414b9762

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16134/index.html

--===============6605257434187263228==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_pm_rpm: Print reason for skipping PC8 subtest (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177832/">https://patchwork.freedesktop.org/series/177832/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16134/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16134/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9186_BAT -&gt; XEIGTPW_16134_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16134_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9186/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16134/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9186 -&gt; IGTPW_16134</li>
<li>Linux: xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232 -&gt; xe-6113-1434742f20cf3d14b493e40c453536b5414b9762</li>
</ul>
<p>IGTPW_16134: 50e6445e73fd7050afd90c18ac26d57f8d0838e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9186: 9186<br />
  xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232: c8d0fb6110b86aa64eb59502df08b529e221f232<br />
  xe-6113-1434742f20cf3d14b493e40c453536b5414b9762: 1434742f20cf3d14b493e40c453536b5414b9762</p>

</body>
</html>

--===============6605257434187263228==--
