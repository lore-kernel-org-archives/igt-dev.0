Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B20D74958
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 13:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0E510E011;
	Thu, 31 Oct 2024 13:10:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C25F10E011;
 Thu, 31 Oct 2024 13:10:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7573793738716809452=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/xe/xe=5Feudebug=3A_Deny_un?=
 =?utf-8?q?used_triggers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 31 Oct 2024 13:10:11 -0000
Message-ID: <173038021115.1365305.2084708479420401200@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031111958.524160-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20241031111958.524160-1-mika.kuoppala@linux.intel.com>
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

--===============7573793738716809452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/xe_eudebug: Deny unused triggers
URL   : https://patchwork.freedesktop.org/series/140763/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8091_BAT -> XEIGTPW_12013_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12013_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2] ([Intel XE#2874]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12013/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#2496]) -> [PASS][4] +31 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12013/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  
  [Intel XE#2496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874


Build changes
-------------

  * IGT: IGT_8091 -> IGTPW_12013
  * Linux: xe-2149-54ceaf112b111612f3a7430132b2395fcce62414 -> xe-2151-fa53c85519aa642bf10aa1692a1b99d1930d2809

  IGTPW_12013: 6fa0e3c9df675d8f050bf38ba8f1ea7b5ce27787 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8091: 8091
  xe-2149-54ceaf112b111612f3a7430132b2395fcce62414: 54ceaf112b111612f3a7430132b2395fcce62414
  xe-2151-fa53c85519aa642bf10aa1692a1b99d1930d2809: fa53c85519aa642bf10aa1692a1b99d1930d2809

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12013/index.html

--===============7573793738716809452==
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
<tr><td><b>Series:</b></td><td>lib/xe/xe_eudebug: Deny unused triggers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140763/">https://patchwork.freedesktop.org/series/140763/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12013/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12013/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8091_BAT -&gt; XEIGTPW_12013_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12013_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12013/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_addfb_basic@bad-pitch-0:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8091/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496">Intel XE#2496</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12013/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8091 -&gt; IGTPW_12013</li>
<li>Linux: xe-2149-54ceaf112b111612f3a7430132b2395fcce62414 -&gt; xe-2151-fa53c85519aa642bf10aa1692a1b99d1930d2809</li>
</ul>
<p>IGTPW_12013: 6fa0e3c9df675d8f050bf38ba8f1ea7b5ce27787 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8091: 8091<br />
  xe-2149-54ceaf112b111612f3a7430132b2395fcce62414: 54ceaf112b111612f3a7430132b2395fcce62414<br />
  xe-2151-fa53c85519aa642bf10aa1692a1b99d1930d2809: fa53c85519aa642bf10aa1692a1b99d1930d2809</p>

</body>
</html>

--===============7573793738716809452==--
