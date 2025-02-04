Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9BCC02192
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 01:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F3410E590;
	Tue,  4 Feb 2025 01:32:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5A910E118;
 Tue,  4 Feb 2025 01:32:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8576707897139747078=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Use_LR_mode_for_compute?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 04 Feb 2025 01:32:09 -0000
Message-ID: <173863272903.590587.1113077642594472961@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250203133916.843931-1-francois.dugast@intel.com>
In-Reply-To: <20250203133916.843931-1-francois.dugast@intel.com>
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

--===============8576707897139747078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use LR mode for compute
URL   : https://patchwork.freedesktop.org/series/144254/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8221_BAT -> XEIGTPW_12535_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12535_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-adlp-vf:        [PASS][1] -> [SKIP][2] ([Intel XE#1192])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8221/bat-adlp-vf/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/bat-adlp-vf/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3970] / [Intel XE#4078]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8221/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][5] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][6] ([Intel XE#1192])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8221/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [DMESG-FAIL][7] ([Intel XE#4078]) -> [SKIP][8] ([Intel XE#1192])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8221/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8221 -> IGTPW_12535
  * Linux: xe-2587-e4653d321048b16b1373c8ddf0657590963c5897 -> xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db

  IGTPW_12535: 354b5b707cc8dd56d902670b274f2d137e5a4a94 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8221: ad1f57286d15d083b08c94f3d93600db85f9945b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2587-e4653d321048b16b1373c8ddf0657590963c5897: e4653d321048b16b1373c8ddf0657590963c5897
  xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db: e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/index.html

--===============8576707897139747078==
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
<tr><td><b>Series:</b></td><td>Use LR mode for compute</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144254/">https://patchwork.freedesktop.org/series/144254/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8221_BAT -&gt; XEIGTPW_12535_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12535_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8221/bat-adlp-vf/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/bat-adlp-vf/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8221/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8221/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8221/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12535/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8221 -&gt; IGTPW_12535</li>
<li>Linux: xe-2587-e4653d321048b16b1373c8ddf0657590963c5897 -&gt; xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db</li>
</ul>
<p>IGTPW_12535: 354b5b707cc8dd56d902670b274f2d137e5a4a94 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8221: ad1f57286d15d083b08c94f3d93600db85f9945b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2587-e4653d321048b16b1373c8ddf0657590963c5897: e4653d321048b16b1373c8ddf0657590963c5897<br />
  xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db: e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db</p>

</body>
</html>

--===============8576707897139747078==--
