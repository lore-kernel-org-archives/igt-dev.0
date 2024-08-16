Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3540C52D7D
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 01:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621DA10E554;
	Fri, 16 Aug 2024 01:53:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E134810E091;
 Fri, 16 Aug 2024 01:53:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7693578120262523608=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amd=5Fqueue=5Freset=3A_R?=
 =?utf-8?q?efactor_ring_sequence_for_job_submissions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 16 Aug 2024 01:53:51 -0000
Message-ID: <172377323188.634935.13621150350626034430@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816011534.532384-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240816011534.532384-1-vitaly.prosyak@amd.com>
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

--===============7693578120262523608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amd_queue_reset: Refactor ring sequence for job submissions
URL   : https://patchwork.freedesktop.org/series/137363/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7972_BAT -> XEIGTPW_11587_BAT
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

  Here are the changes found in XEIGTPW_11587_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#2479])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7972/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11587/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@xe_sysfs_scheduler@timeslice_duration_us-min-max:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#877]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7972/bat-bmg-1/igt@xe_sysfs_scheduler@timeslice_duration_us-min-max.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11587/bat-bmg-1/igt@xe_sysfs_scheduler@timeslice_duration_us-min-max.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-3:
    - {bat-bmg-2}:        [DMESG-WARN][5] ([Intel XE#877]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7972/bat-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11587/bat-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2479
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_7972 -> IGTPW_11587

  IGTPW_11587: 11587
  IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167: f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11587/index.html

--===============7693578120262523608==
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
<tr><td><b>Series:</b></td><td>tests/amd_queue_reset: Refactor ring sequence for job submissions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137363/">https://patchwork.freedesktop.org/series/137363/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11587/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11587/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7972_BAT -&gt; XEIGTPW_11587_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11587_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7972/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11587/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2479">Intel XE#2479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-min-max:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7972/bat-bmg-1/igt@xe_sysfs_scheduler@timeslice_duration_us-min-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11587/bat-bmg-1/igt@xe_sysfs_scheduler@timeslice_duration_us-min-max.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-3:<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7972/bat-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11587/bat-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7972 -&gt; IGTPW_11587</li>
</ul>
<p>IGTPW_11587: 11587<br />
  IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1775-f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167: f0a6824d9e4ba2e1beabab4e3eeb195aa7fea167</p>

</body>
</html>

--===============7693578120262523608==--
