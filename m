Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA0BC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 06:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4389610E9A7;
	Fri, 16 May 2025 06:52:09 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97C910E9B0;
 Fri, 16 May 2025 06:52:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2396998553115398804=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fmmap=3A_Ac?=
 =?utf-8?q?quire_rpm_reference_for_pci-membarrier-paraller_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kolanupaka Naveena" <kolanupaka.naveena@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 16 May 2025 06:52:08 -0000
Message-ID: <174737832888.86766.18315394088614686297@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516052429.2780531-1-kolanupaka.naveena@intel.com>
In-Reply-To: <20250516052429.2780531-1-kolanupaka.naveena@intel.com>
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

--===============2396998553115398804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_mmap: Acquire rpm reference for pci-membarrier-paraller test
URL   : https://patchwork.freedesktop.org/series/149092/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8365_BAT -> XEIGTPW_13137_BAT
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

  Here are the changes found in XEIGTPW_13137_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8365/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13137/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8365 -> IGTPW_13137
  * Linux: xe-3093-6485ebaa153e54b03f0027f5d5b122b59868eda8 -> xe-3098-bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28

  IGTPW_13137: 0b5f7ff96a6a8dfd97e8a1a7bcdffac8ab5ec38a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8365: 8365
  xe-3093-6485ebaa153e54b03f0027f5d5b122b59868eda8: 6485ebaa153e54b03f0027f5d5b122b59868eda8
  xe-3098-bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28: bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13137/index.html

--===============2396998553115398804==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_mmap: Acquire rpm reference for pci-membarrier-paraller test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149092/">https://patchwork.freedesktop.org/series/149092/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13137/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13137/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8365_BAT -&gt; XEIGTPW_13137_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13137_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8365/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13137/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8365 -&gt; IGTPW_13137</li>
<li>Linux: xe-3093-6485ebaa153e54b03f0027f5d5b122b59868eda8 -&gt; xe-3098-bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28</li>
</ul>
<p>IGTPW_13137: 0b5f7ff96a6a8dfd97e8a1a7bcdffac8ab5ec38a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8365: 8365<br />
  xe-3093-6485ebaa153e54b03f0027f5d5b122b59868eda8: 6485ebaa153e54b03f0027f5d5b122b59868eda8<br />
  xe-3098-bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28: bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28</p>

</body>
</html>

--===============2396998553115398804==--
