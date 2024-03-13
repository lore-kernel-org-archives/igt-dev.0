Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C949C54E66
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 22:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF4410F0C3;
	Wed, 13 Mar 2024 22:30:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BC610F1A0;
 Wed, 13 Mar 2024 22:30:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5391145404634815212=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_introduce_Xe_multigpu_and_othe?=
 =?utf-8?q?r_multi-GPU_helpers_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Mar 2024 22:30:31 -0000
Message-ID: <171036903136.732599.9890454456958081850@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313192945.171395-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240313192945.171395-1-kamil.konieczny@linux.intel.com>
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

--===============5391145404634815212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: introduce Xe multigpu and other multi-GPU helpers (rev12)
URL   : https://patchwork.freedesktop.org/series/129101/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7760_BAT -> XEIGTPW_10827_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in XEIGTPW_10827_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo:
    - bat-dg2-oem2:       [SKIP][1] -> [PASS][2] +2 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7760/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10827/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
    - bat-atsm-2:         [SKIP][3] -> [PASS][4] +2 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7760/bat-atsm-2/igt@xe_live_ktest@xe_bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10827/bat-atsm-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [SKIP][5] -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7760/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10827/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  


Build changes
-------------

  * IGT: IGT_7760 -> IGTPW_10827
  * Linux: xe-936-ca050304d54e3a0f96bf148053f738d6b62de43a -> xe-937-790a1d4e546a1d7f1cc5316c77f21379a4083250

  IGTPW_10827: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10827/index.html
  IGT_7760: 7760
  xe-936-ca050304d54e3a0f96bf148053f738d6b62de43a: ca050304d54e3a0f96bf148053f738d6b62de43a
  xe-937-790a1d4e546a1d7f1cc5316c77f21379a4083250: 790a1d4e546a1d7f1cc5316c77f21379a4083250

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10827/index.html

--===============5391145404634815212==
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
<tr><td><b>Series:</b></td><td>introduce Xe multigpu and other multi-GPU helpers (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129101/">https://patchwork.freedesktop.org/series/129101/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10827/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10827/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7760_BAT -&gt; XEIGTPW_10827_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10827_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7760/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10827/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7760/bat-atsm-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10827/bat-atsm-2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7760/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10827/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7760 -&gt; IGTPW_10827</li>
<li>Linux: xe-936-ca050304d54e3a0f96bf148053f738d6b62de43a -&gt; xe-937-790a1d4e546a1d7f1cc5316c77f21379a4083250</li>
</ul>
<p>IGTPW_10827: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10827/index.html<br />
  IGT_7760: 7760<br />
  xe-936-ca050304d54e3a0f96bf148053f738d6b62de43a: ca050304d54e3a0f96bf148053f738d6b62de43a<br />
  xe-937-790a1d4e546a1d7f1cc5316c77f21379a4083250: 790a1d4e546a1d7f1cc5316c77f21379a4083250</p>

</body>
</html>

--===============5391145404634815212==--
