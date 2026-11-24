Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE73B606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 03:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9DD10E04E;
	Tue, 24 Nov 2026 03:23:53 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4300210E04E;
 Tue, 24 Nov 2026 03:22:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4547912901569085705=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_removed_device_drop_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Avandhica S R" <avandhica.s.r@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 24 Nov 2026 03:22:58 -0000
Message-ID: <179549057826.73657.16337181852247934993@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261123082706.581436-1-avandhica.s.r@intel.com>
In-Reply-To: <20261123082706.581436-1-avandhica.s.r@intel.com>
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

--===============4547912901569085705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix removed device drop (rev2)
URL   : https://patchwork.freedesktop.org/series/179350/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9202_BAT -> XEIGTPW_16201_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-wcl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_16201_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-wcl-1:          NOTRUN -> [SKIP][1] ([Intel XE#7245])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-wcl-1:          NOTRUN -> [SKIP][2] ([Intel XE#8265])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-edid:
    - bat-ptl-1:          [PASS][3] -> [SKIP][4] ([Intel XE#352]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9202/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-ptl-1:          [PASS][5] -> [SKIP][6] ([Intel XE#2853])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9202/bat-ptl-1/igt@kms_hdmi_inject@inject-audio.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-ptl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_evict@evict-small-multi-vm:
    - bat-wcl-1:          NOTRUN -> [SKIP][7] ([Intel XE#7238]) +11 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-wcl-1:          NOTRUN -> [SKIP][8] ([Intel XE#7482]) +17 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_exec_multi_queue@many-queues-priority:
    - bat-wcl-1:          NOTRUN -> [SKIP][9] ([Intel XE#8364]) +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - bat-wcl-1:          NOTRUN -> [SKIP][10] ([Intel XE#9657])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-wcl-1:          NOTRUN -> [SKIP][11] ([Intel XE#7239]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-wcl-1:          NOTRUN -> [SKIP][12] ([Intel XE#7243])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-wcl-1:          NOTRUN -> [SKIP][13] ([Intel XE#7247] / [Intel XE#7590])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-wcl-1:          NOTRUN -> [SKIP][14] ([Intel XE#7242] / [Intel XE#7590])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-wcl-1:          NOTRUN -> [SKIP][15] ([Intel XE#7248] / [Intel XE#7590])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#7238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238
  [Intel XE#7239]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239
  [Intel XE#7242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242
  [Intel XE#7243]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243
  [Intel XE#7245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245
  [Intel XE#7247]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247
  [Intel XE#7248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#9657]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657


Build changes
-------------

  * IGT: IGT_9202 -> IGTPW_16201

  IGTPW_16201: 16201
  IGT_9202: 9202
  xe-6209-1bb2c850125a082e8c33037aa8cc6780cb90e2dd: 1bb2c850125a082e8c33037aa8cc6780cb90e2dd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/index.html

--===============4547912901569085705==
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
<tr><td><b>Series:</b></td><td>Fix removed device drop (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179350/">https://patchwork.freedesktop.org/series/179350/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9202_BAT -&gt; XEIGTPW_16201_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-wcl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16201_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245">Intel XE#7245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9202/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9202/bat-ptl-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-ptl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-priority:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9657">Intel XE#9657</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239">Intel XE#7239</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243">Intel XE#7243</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16201/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9202 -&gt; IGTPW_16201</li>
</ul>
<p>IGTPW_16201: 16201<br />
  IGT_9202: 9202<br />
  xe-6209-1bb2c850125a082e8c33037aa8cc6780cb90e2dd: 1bb2c850125a082e8c33037aa8cc6780cb90e2dd</p>

</body>
</html>

--===============4547912901569085705==--
