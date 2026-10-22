Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4651C606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 15:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EA3112724;
	Thu, 22 Oct 2026 15:02:18 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4D21126EF;
 Thu, 22 Oct 2026 15:01:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7764594357245597421=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdirtyfb?=
 =?utf-8?q?=3A_Use_a_smaller_fb_on_simulation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Samala, Pranay" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Oct 2026 15:01:29 -0000
Message-ID: <179268128930.58288.18217658038015068166@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016052243.633897-1-pranay.samala@intel.com>
In-Reply-To: <20261016052243.633897-1-pranay.samala@intel.com>
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

--===============7764594357245597421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dirtyfb: Use a smaller fb on simulation (rev2)
URL   : https://patchwork.freedesktop.org/series/176261/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9158_BAT -> XEIGTPW_16036_BAT
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

  Here are the changes found in XEIGTPW_16036_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#9657])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-lnl-2:          NOTRUN -> [SKIP][2] ([Intel XE#9657])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-wcl-2:          NOTRUN -> [SKIP][3] ([Intel XE#9657])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-wcl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-nvls-1:         NOTRUN -> [SKIP][4] ([Intel XE#9657])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-nvls-2:         NOTRUN -> [SKIP][5] ([Intel XE#9657])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-2:          NOTRUN -> [SKIP][6] ([Intel XE#9657])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-ptl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-wcl-1:          NOTRUN -> [SKIP][7] ([Intel XE#9657])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-1:          NOTRUN -> [SKIP][8] ([Intel XE#9657])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-ptl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][9] ([Intel XE#9657])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-lnl-1:          NOTRUN -> [SKIP][10] ([Intel XE#9657])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  
  [Intel XE#9657]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657


Build changes
-------------

  * IGT: IGT_9158 -> IGTPW_16036
  * Linux: xe-5997-dccfdbc40b10720efe537dfc63de84eed983fc8f -> xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856

  IGTPW_16036: 16036
  IGT_9158: c06ac65c584387323e8322c258d74cea1ce07b18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5997-dccfdbc40b10720efe537dfc63de84eed983fc8f: dccfdbc40b10720efe537dfc63de84eed983fc8f
  xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856: b2af5f9ef576a3026836cca5ec8757cc045a1856

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/index.html

--===============7764594357245597421==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dirtyfb: Use a smaller fb on simulation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176261/">https://patchwork.freedesktop.org/series/176261/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9158_BAT -&gt; XEIGTPW_16036_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16036_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-wcl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-ptl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-ptl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16036/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9158 -&gt; IGTPW_16036</li>
<li>Linux: xe-5997-dccfdbc40b10720efe537dfc63de84eed983fc8f -&gt; xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856</li>
</ul>
<p>IGTPW_16036: 16036<br />
  IGT_9158: c06ac65c584387323e8322c258d74cea1ce07b18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5997-dccfdbc40b10720efe537dfc63de84eed983fc8f: dccfdbc40b10720efe537dfc63de84eed983fc8f<br />
  xe-5999-b2af5f9ef576a3026836cca5ec8757cc045a1856: b2af5f9ef576a3026836cca5ec8757cc045a1856</p>

</body>
</html>

--===============7764594357245597421==--
