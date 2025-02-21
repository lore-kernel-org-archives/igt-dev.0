Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D54C021B5
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 23:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6736D10E19B;
	Fri, 21 Feb 2025 23:23:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9445D10E19B;
 Fri, 21 Feb 2025 23:23:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0136727130403171485=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/igt=5Fcore=3A_Add_ftr?=
 =?utf-8?q?ace_logs_at_test_boundaries?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 21 Feb 2025 23:23:00 -0000
Message-ID: <174018018060.599210.11971427268214243999@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221222739.2335825-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250221222739.2335825-1-umesh.nerlige.ramappa@intel.com>
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

--===============0136727130403171485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_core: Add ftrace logs at test boundaries
URL   : https://patchwork.freedesktop.org/series/145273/
State : success

== Summary ==

CI Bug Log - changes from IGT_8246 -> IGTPW_12652
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/index.html

Participating hosts (40 -> 40)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between IGT_8246 and IGTPW_12652:

### New IGT tests (14) ###

  * igt@i915_selftest@bad-close:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-auth:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@basic-threads:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@create-close:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@create-fd-close:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@eof:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@info:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@nb-await:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@nullptr:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@read:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@write:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_12652 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@requests:
    - bat-atsm-1:         [PASS][1] -> [INCOMPLETE][2] ([i915#12445])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8246/bat-atsm-1/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/bat-atsm-1/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8246/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8246/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [INCOMPLETE][7] ([i915#12445]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8246/bat-arlh-3/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/bat-arlh-3/igt@i915_selftest@live.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [ABORT][9] ([i915#13679]) -> [INCOMPLETE][10] ([i915#12445])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8246/bat-atsm-1/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/bat-atsm-1/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#13679]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13679


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8246 -> IGTPW_12652
  * Linux: CI_DRM_16168 -> CI_DRM_16169

  CI-20190529: 20190529
  CI_DRM_16168: 3ef8736446933ce5e8ccbec2f85922ca1ed3b706 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16169: f2a2bd676bde0942c9dfe5c55d54eec298260f88 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12652: 92fb15005e652df6ed6dc954687276e27bd91acf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/index.html

--===============0136727130403171485==
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
<tr><td><b>Series:</b></td><td>lib/igt_core: Add ftrace logs at test boundaries</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145273/">https://patchwork.freedesktop.org/series/145273/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8246 -&gt; IGTPW_12652</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/index.html</p>
<h2>Participating hosts (40 -&gt; 40)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8246 and IGTPW_12652:</p>
<h3>New IGT tests (14)</h3>
<ul>
<li>
<p>igt@i915_selftest@bad-close:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-auth:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@basic-threads:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@create-close:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@create-fd-close:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@eof:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@info:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@nb-await:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@nullptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@read:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@write:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12652 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8246/bat-atsm-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/bat-atsm-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8246/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8246/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8246/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8246/bat-atsm-1/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13679">i915#13679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12652/bat-atsm-1/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8246 -&gt; IGTPW_12652</li>
<li>Linux: CI_DRM_16168 -&gt; CI_DRM_16169</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16168: 3ef8736446933ce5e8ccbec2f85922ca1ed3b706 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16169: f2a2bd676bde0942c9dfe5c55d54eec298260f88 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12652: 92fb15005e652df6ed6dc954687276e27bd91acf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0136727130403171485==--
