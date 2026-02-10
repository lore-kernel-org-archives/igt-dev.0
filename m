Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A320E94625
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 02:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2410E13B;
	Tue, 10 Feb 2026 02:32:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE3110E13B;
 Tue, 10 Feb 2026 02:32:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4150224316242346161=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_kms=5Fflip=3A_limit_number_?=
 =?utf-8?q?of_subtests_run?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Feb 2026 02:32:16 -0000
Message-ID: <177069073688.239534.1836097318507667189@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260210001026.3923885-1-michal.grzelak@intel.com>
In-Reply-To: <20260210001026.3923885-1-michal.grzelak@intel.com>
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

--===============4150224316242346161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_flip: limit number of subtests run
URL   : https://patchwork.freedesktop.org/series/161389/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8746_BAT -> XEIGTPW_14522_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8746_BAT and XEIGTPW_14522_BAT:

### New IGT tests (38) ###

  * igt@fbdev@info:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-0:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-1024:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-128:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-256:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-32:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-63:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-65536:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bad-pitch-999:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@basic:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@bo-too-small:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@invalid-get-prop:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@invalid-get-prop-any:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@invalid-set-prop:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@no-handle:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@size-max:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@small-bo:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@too-high:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@too-wide:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@unused-handle:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@unused-modifier:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@unused-offsets:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_addfb_basic@unused-pitches:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 9.34] s

  * igt@kms_flip@basic-flip-vs-modeset:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 9.48] s

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 8.17] s

  * igt@kms_flip@basic-plain-flip:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 7.11] s

  * igt@kms_flip@basic-plain-flip@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_force_connector_basic@force-connector-state:
    - Statuses : 6 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.80] s

  * igt@kms_force_connector_basic@force-edid:
    - Statuses : 6 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@kms_force_connector_basic@prune-stale-modes:
    - Statuses : 6 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@kms_frontbuffer_tracking@basic:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 29.39] s

  * igt@kms_hdmi_inject@inject-audio:
    - Statuses : 6 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@kms_prop_blob@basic:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14522_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8746/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14522/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8746 -> IGTPW_14522
  * Linux: xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2 -> xe-4532-d2a98b98376b6a16c835a131b12f295848c656db

  IGTPW_14522: 14522
  IGT_8746: 8746
  xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2: 5e0595fbb024e9b7e243a7ca8a028f93a37883f2
  xe-4532-d2a98b98376b6a16c835a131b12f295848c656db: d2a98b98376b6a16c835a131b12f295848c656db

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14522/index.html

--===============4150224316242346161==
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
<tr><td><b>Series:</b></td><td>kms_flip: limit number of subtests run</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161389/">https://patchwork.freedesktop.org/series/161389/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14522/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14522/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8746_BAT -&gt; XEIGTPW_14522_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8746_BAT and XEIGTPW_14522_BAT:</p>
<h3>New IGT tests (38)</h3>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-1024:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-256:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-32:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-65536:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop-any:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@no-handle:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-modifier:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 9.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 9.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 8.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 7.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>Statuses : 6 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>Statuses : 6 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>Statuses : 6 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 29.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>Statuses : 6 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14522_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8746/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14522/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8746 -&gt; IGTPW_14522</li>
<li>Linux: xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2 -&gt; xe-4532-d2a98b98376b6a16c835a131b12f295848c656db</li>
</ul>
<p>IGTPW_14522: 14522<br />
  IGT_8746: 8746<br />
  xe-4529-5e0595fbb024e9b7e243a7ca8a028f93a37883f2: 5e0595fbb024e9b7e243a7ca8a028f93a37883f2<br />
  xe-4532-d2a98b98376b6a16c835a131b12f295848c656db: d2a98b98376b6a16c835a131b12f295848c656db</p>

</body>
</html>

--===============4150224316242346161==--
