Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D75C44501
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 19:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF58210E0CC;
	Thu,  9 Jul 2026 19:05:01 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED588926F;
 Thu,  9 Jul 2026 19:04:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2165626451796098248=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fvm=3A_Fix_?=
 =?utf-8?q?igt=5Fassert=5Ff_condition_in_test=5Foom?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 Jul 2026 19:04:32 -0000
Message-ID: <178362387284.171959.10985121412362637865@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260709055753.2081956-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20260709055753.2081956-2-priyanka.dandamudi@intel.com>
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

--===============2165626451796098248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Fix igt_assert_f condition in test_oom
URL   : https://patchwork.freedesktop.org/series/170054/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8996_BAT -> XEIGTPW_15498_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15498_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15498_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15498_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-wcl-1:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8996/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15498/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  


Build changes
-------------

  * IGT: IGT_8996 -> IGTPW_15498
  * Linux: xe-5377-02380f41438b80a4b0cb83f407faa5005bc67668 -> xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa

  IGTPW_15498: 15498
  IGT_8996: 8996
  xe-5377-02380f41438b80a4b0cb83f407faa5005bc67668: 02380f41438b80a4b0cb83f407faa5005bc67668
  xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa: e5af800f48075d6b249b979cc8bf210c051d86aa

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15498/index.html

--===============2165626451796098248==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Fix igt_assert_f condition in test_oom</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170054/">https://patchwork.freedesktop.org/series/170054/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15498/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15498/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8996_BAT -&gt; XEIGTPW_15498_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15498_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15498_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15498_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8996/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15498/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8996 -&gt; IGTPW_15498</li>
<li>Linux: xe-5377-02380f41438b80a4b0cb83f407faa5005bc67668 -&gt; xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa</li>
</ul>
<p>IGTPW_15498: 15498<br />
  IGT_8996: 8996<br />
  xe-5377-02380f41438b80a4b0cb83f407faa5005bc67668: 02380f41438b80a4b0cb83f407faa5005bc67668<br />
  xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa: e5af800f48075d6b249b979cc8bf210c051d86aa</p>

</body>
</html>

--===============2165626451796098248==--
