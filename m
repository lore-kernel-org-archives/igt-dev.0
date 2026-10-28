Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C30606A323
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 19:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF0B10E15A;
	Wed, 28 Oct 2026 19:49:48 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D15910E15A;
 Wed, 28 Oct 2026 19:48:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1833004380728835851=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fwedged=3A_?=
 =?utf-8?q?Add_cold-reset_wedge_test_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Oct 2026 19:48:56 -0000
Message-ID: <179321693650.84063.2000611682647081483@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028133045.1966466-4-sk.anirban@intel.com>
In-Reply-To: <20261028133045.1966466-4-sk.anirban@intel.com>
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

--===============1833004380728835851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_wedged: Add cold-reset wedge test (rev7)
URL   : https://patchwork.freedesktop.org/series/175755/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9170_BAT -> XEIGTPW_16061_BAT
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

  Here are the changes found in XEIGTPW_16061_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-ptl-2:          NOTRUN -> [SKIP][1] ([Intel XE#5764]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/bat-ptl-2/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_balancer@twice-parallel-userptr:
    - bat-ptl-2:          NOTRUN -> [SKIP][2] ([Intel XE#7482]) +17 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - bat-ptl-2:          NOTRUN -> [ABORT][3] ([Intel XE#9362])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/bat-ptl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  
#### Possible fixes ####

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - bat-ptl-2:          [ABORT][4] ([Intel XE#9362]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9170/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362


Build changes
-------------

  * IGT: IGT_9170 -> IGTPW_16061
  * Linux: xe-6022-f00a1fa90fcfdf84b1600e0aca74c965fb86fe76 -> xe-6023-fbed42265ffde9b162e21ed7ff0cfce070e19aaa

  IGTPW_16061: 16061
  IGT_9170: 9170
  xe-6022-f00a1fa90fcfdf84b1600e0aca74c965fb86fe76: f00a1fa90fcfdf84b1600e0aca74c965fb86fe76
  xe-6023-fbed42265ffde9b162e21ed7ff0cfce070e19aaa: fbed42265ffde9b162e21ed7ff0cfce070e19aaa

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/index.html

--===============1833004380728835851==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_wedged: Add cold-reset wedge test (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175755/">https://patchwork.freedesktop.org/series/175755/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9170_BAT -&gt; XEIGTPW_16061_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16061_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/bat-ptl-2/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/bat-ptl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_compute_preempt@compute-threadgroup-preempt:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9170/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16061/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9170 -&gt; IGTPW_16061</li>
<li>Linux: xe-6022-f00a1fa90fcfdf84b1600e0aca74c965fb86fe76 -&gt; xe-6023-fbed42265ffde9b162e21ed7ff0cfce070e19aaa</li>
</ul>
<p>IGTPW_16061: 16061<br />
  IGT_9170: 9170<br />
  xe-6022-f00a1fa90fcfdf84b1600e0aca74c965fb86fe76: f00a1fa90fcfdf84b1600e0aca74c965fb86fe76<br />
  xe-6023-fbed42265ffde9b162e21ed7ff0cfce070e19aaa: fbed42265ffde9b162e21ed7ff0cfce070e19aaa</p>

</body>
</html>

--===============1833004380728835851==--
