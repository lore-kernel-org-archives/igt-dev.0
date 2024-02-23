Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C29C54798
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 23:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B78F88647;
	Fri, 23 Feb 2024 23:46:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869D088647;
 Fri, 23 Feb 2024 23:46:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7753248171526059784=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/xe=5Fspin=5Fbatch=3A_Mis?=
 =?utf-8?q?cellaneous_preempter_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Feb 2024 23:46:05 -0000
Message-ID: <170873196555.264276.13423463408826613@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
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

--===============7753248171526059784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_spin_batch: Miscellaneous preempter fixes
URL   : https://patchwork.freedesktop.org/series/130341/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7729_BAT -> XEIGTPW_10731_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10731_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_exec_queue_property@invalid-property}:
    - bat-pvc-2:          [FAIL][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-dg2-oem2:       [FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
    - bat-atsm-2:         [FAIL][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-7:         [FAIL][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7729 -> IGTPW_10731
  * Linux: xe-835-115d0ed85f58e87d2d7a057426350fec5b217cc9 -> xe-840-7291e2e67dff0ff573900266382c9c9248a7dea5

  IGTPW_10731: 10731
  IGT_7729: 7729
  xe-835-115d0ed85f58e87d2d7a057426350fec5b217cc9: 115d0ed85f58e87d2d7a057426350fec5b217cc9
  xe-840-7291e2e67dff0ff573900266382c9c9248a7dea5: 7291e2e67dff0ff573900266382c9c9248a7dea5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/index.html

--===============7753248171526059784==
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
<tr><td><b>Series:</b></td><td>tests/xe_spin_batch: Miscellaneous preempter fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130341/">https://patchwork.freedesktop.org/series/130341/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7729_BAT -&gt; XEIGTPW_10731_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10731_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_exec_queue_property@invalid-property}:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10731/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7729 -&gt; IGTPW_10731</li>
<li>Linux: xe-835-115d0ed85f58e87d2d7a057426350fec5b217cc9 -&gt; xe-840-7291e2e67dff0ff573900266382c9c9248a7dea5</li>
</ul>
<p>IGTPW_10731: 10731<br />
  IGT_7729: 7729<br />
  xe-835-115d0ed85f58e87d2d7a057426350fec5b217cc9: 115d0ed85f58e87d2d7a057426350fec5b217cc9<br />
  xe-840-7291e2e67dff0ff573900266382c9c9248a7dea5: 7291e2e67dff0ff573900266382c9c9248a7dea5</p>

</body>
</html>

--===============7753248171526059784==--
