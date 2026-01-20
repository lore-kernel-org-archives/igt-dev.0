Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7844D2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 10:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DE910E5AD;
	Tue, 20 Jan 2026 10:14:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE5E10E5A8;
 Tue, 20 Jan 2026 10:14:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4419851009612262281=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Improve_pixel-format_tests?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jan 2026 10:14:18 -0000
Message-ID: <176890405855.170966.10233032586091548931@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
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

--===============4419851009612262281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve pixel-format tests (rev2)
URL   : https://patchwork.freedesktop.org/series/160237/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8707_FULL -> XEIGTPW_14376_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14376_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14376_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14376_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +4 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3.html

  * {igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][3] +202 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * {igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][4] +167 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5.html

  * igt@xe_pm_residency@idle-residency@gt0:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@xe_pm_residency@idle-residency@gt0.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-3/igt@xe_pm_residency@idle-residency@gt0.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-lnl:          [FAIL][7] ([Intel XE#6054]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  
New tests
---------

  New tests have been introduced between XEIGT_8707_FULL and XEIGTPW_14376_FULL:

### New IGT tests (246) ###

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.58, 3.69] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.54, 3.57] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.98] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.98] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.97] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.37, 1.47] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.37, 1.49] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.38, 1.52] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.33, 1.51] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.36, 1.54] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.37, 1.57] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.35, 5.08] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.38, 5.07] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.07] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.71] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.02] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.05] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [3.63, 5.20] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [3.42, 5.21] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.92, 1.06] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.70] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.92, 1.11] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.71] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.93, 1.07] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 0.70] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.10] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 0.73] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.38, 1.52] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.35, 1.49] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.36, 1.45] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [1.44] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.34, 1.49] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [19.11, 22.59] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [19.57, 21.99] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [6.58, 6.80] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [3.31, 3.43] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [6.18, 6.81] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [3.03, 3.46] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [5.92, 6.82] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [3.15, 3.48] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.28] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [6.10, 6.78] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [3.08, 3.45] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.28] s

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [3.58, 5.18] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [3.54, 5.13] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.10] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.71] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.95, 1.05] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.71] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.97, 1.08] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 0.70] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 1.10] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.71] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [1.55] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.33, 1.57] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.34, 1.51] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [1.57] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.37, 1.50] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.34, 1.58] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.36, 1.48] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [1.48] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.37, 1.57] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.36, 1.50] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.37, 1.55] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - Statuses : 1 skip(s)
    - Exec time: [1.49] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.37, 1.55] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - Statuses : 2 skip(s)
    - Exec time: [0.34, 1.48] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14376_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-lnl:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#4537] / [Intel XE#7063])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-7/igt@fbdev@read.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@fbdev@read.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#607])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3432]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#306])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2325])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2390] / [Intel XE#6974])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#1178] / [Intel XE#3304]) +3 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#6707]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14.html
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#6973])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-7/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2321])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2286])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4354])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2244])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1421])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#301]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1401]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2293]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#656]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7061]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#651])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4141]) +8 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2311]) +19 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2313]) +14 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#718])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2505])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#2893])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1128] / [Intel XE#1406])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1406] / [Intel XE#2387])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3414] / [Intel XE#3904])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6503])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2168])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#4459]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1499]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-2/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#2142]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eudebug@basic-client:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#4837])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-1/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#4518])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#5793])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][67] -> [INCOMPLETE][68] ([Intel XE#6321])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#688])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2322]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1392]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-8/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#6874]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6874]) +15 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4837]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-4/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-und:
    - shard-lnl:          [PASS][75] -> [DMESG-WARN][76] ([Intel XE#7063]) +8 other tests dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-1/igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-und.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-und.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#5007])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4943]) +16 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#5625])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#4943])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-3/igt@xe_exec_system_allocator@process-many-stride-mmap-huge.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#6964]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2284]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-4/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm_residency@idle-residency@gt1:
    - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#1727]) +1 other test dmesg-warn
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@xe_pm_residency@idle-residency@gt1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-3/igt@xe_pm_residency@idle-residency@gt1.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4733]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#944])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#944])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][89] ([Intel XE#6054]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][91] ([Intel XE#4633]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][93] ([Intel XE#718]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [FAIL][95] ([Intel XE#5099]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@kms_pm_rpm@i2c.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-4/igt@kms_pm_rpm@i2c.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][97] ([Intel XE#6361]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch-shared:
    - shard-lnl:          [DMESG-WARN][99] ([Intel XE#7063]) -> [PASS][100] +5 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch-shared.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch-shared.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [FAIL][101] ([Intel XE#6569]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][103] ([Intel XE#4141]) -> [ABORT][104] ([Intel XE#3970])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][105] ([Intel XE#3544]) -> [SKIP][106] ([Intel XE#3374] / [Intel XE#3544])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][107] ([Intel XE#2509]) -> [SKIP][108] ([Intel XE#2426])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5099
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6973]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8707 -> IGTPW_14376

  IGTPW_14376: 7116fd89a25207f18f699790eb68348973d71469 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8707: 8707
  xe-4410-d5c98420766570dc019dc42dfbbe5a1061c03085: d5c98420766570dc019dc42dfbbe5a1061c03085

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/index.html

--===============4419851009612262281==
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
<tr><td><b>Series:</b></td><td>Improve pixel-format tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160237/">https://patchwork.freedesktop.org/series/160237/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8707_FULL -&gt; XEIGTPW_14376_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14376_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14376_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14376_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a3.html">INCOMPLETE</a> +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> +202 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> +167 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@xe_pm_residency@idle-residency@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-3/igt@xe_pm_residency@idle-residency@gt0.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8707_FULL and XEIGTPW_14376_FULL:</p>
<h3>New IGT tests (246)</h3>
<ul>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.58, 3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.54, 3.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.37, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.37, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.38, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.33, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.36, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.37, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.35, 5.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.38, 5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.63, 5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.42, 5.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.92, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.92, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.93, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.68, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.97, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.38, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.35, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.36, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.34, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [19.11, 22.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [19.57, 21.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.58, 6.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.31, 3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.18, 6.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.03, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.92, 6.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.15, 3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.10, 6.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.08, 3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.58, 5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.54, 5.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.97, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.95, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.97, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.98, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.33, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.34, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.37, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.34, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.36, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.37, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.36, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.37, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.37, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.34, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14376_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-7/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-7/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6973">Intel XE#6973</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-1/igt@xe_eudebug@basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-8/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-4/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-und:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-1/igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-und.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@xe_exec_system_allocator@madvise-preffered-loc-atomic-und.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-3/igt@xe_exec_system_allocator@process-many-stride-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-4/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@xe_pm_residency@idle-residency@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-3/igt@xe_pm_residency@idle-residency@gt1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@kms_pm_rpm@i2c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5099">Intel XE#5099</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-4/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch-shared:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch-shared.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-stride-mmap-prefetch-shared.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8707/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14376/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8707 -&gt; IGTPW_14376</li>
</ul>
<p>IGTPW_14376: 7116fd89a25207f18f699790eb68348973d71469 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8707: 8707<br />
  xe-4410-d5c98420766570dc019dc42dfbbe5a1061c03085: d5c98420766570dc019dc42dfbbe5a1061c03085</p>

</body>
</html>

--===============4419851009612262281==--
