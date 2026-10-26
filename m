Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2A9606A31D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 06:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE02910E303;
	Mon, 26 Oct 2026 06:03:25 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A188310EA51;
 Mon, 26 Oct 2026 06:02:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5339697905135928997=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fsys?=
 =?utf-8?q?tem=5Fallocator=3A_Skip_unsupported_PAT_madvise_indices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Oct 2026 06:02:34 -0000
Message-ID: <179299455465.67195.17380206312466802398@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026052051.1472943-1-nishit.sharma@intel.com>
In-Reply-To: <20261026052051.1472943-1-nishit.sharma@intel.com>
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

--===============5339697905135928997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Skip unsupported PAT madvise indices
URL   : https://patchwork.freedesktop.org/series/176802/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9164_BAT -> XEIGTPW_16045_BAT
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

  Here are the changes found in XEIGTPW_16045_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2] ([Intel XE#9663]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9164/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16045/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  
  [Intel XE#9663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9663


Build changes
-------------

  * IGT: IGT_9164 -> IGTPW_16045

  IGTPW_16045: 16045
  IGT_9164: 9164
  xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a: d56ff005f0d16ec136ee31fe3238eb447fefdc1a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16045/index.html

--===============5339697905135928997==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Skip unsupported PAT madvise indices</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176802/">https://patchwork.freedesktop.org/series/176802/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16045/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16045/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9164_BAT -&gt; XEIGTPW_16045_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16045_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9164/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16045/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9663">Intel XE#9663</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9164 -&gt; IGTPW_16045</li>
</ul>
<p>IGTPW_16045: 16045<br />
  IGT_9164: 9164<br />
  xe-6010-d56ff005f0d16ec136ee31fe3238eb447fefdc1a: d56ff005f0d16ec136ee31fe3238eb447fefdc1a</p>

</body>
</html>

--===============5339697905135928997==--
