Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE41C98338
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 20:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86BE10E063;
	Sat, 17 Jan 2026 20:20:40 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7AF10E063;
 Sat, 17 Jan 2026 20:20:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7039964201084454128=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Improve_pixel-format_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 17 Jan 2026 20:20:39 -0000
Message-ID: <176868123942.164794.9685967724148217828@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260117184348.38163-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260117184348.38163-1-ramanaidu.naladala@intel.com>
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

--===============7039964201084454128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve pixel-format tests
URL   : https://patchwork.freedesktop.org/series/160237/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8704_FULL -> XEIGTPW_14362_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14362_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-3} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][1] +101 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-3.html

  * {igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][2] +144 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0.html

  
New tests
---------

  New tests have been introduced between XEIGT_8704_FULL and XEIGTPW_14362_FULL:

### New IGT tests (240) ###

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.54, 3.64] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.98] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.38, 1.51] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 1.57] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 pass(s)
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
    - Exec time: [0.37, 1.54] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 1.50] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 pass(s)
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
    - Exec time: [0.38, 1.51] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.48] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 pass(s)
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
    - Exec time: [0.35, 5.06] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [5.20] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.05] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.11] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-3:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [5.16] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [5.23] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.39, 1.48] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 pass(s)
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

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.38, 1.56] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 1.51] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.36, 1.50] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [20.54, 22.69] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [20.09, 21.76] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [6.55, 6.72] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [3.25, 3.43] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [6.55, 6.73] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [3.30, 3.36] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [6.60, 6.76] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [3.35, 3.45] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.33] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [6.58, 6.80] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [3.11, 3.45] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.33] s

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [3.62, 5.11] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 5.17] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.96, 1.07] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.70] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.98, 1.12] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 0.71] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [1.52] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 pass(s)
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
    - Statuses : 1 skip(s)
    - Exec time: [1.46] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 1.49] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [1.57] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 1.55] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.36, 1.52] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 pass(s)
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
    - Statuses : 1 skip(s)
    - Exec time: [1.50] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.36, 1.55] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 1.55] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 pass(s)
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
    - Statuses : 1 skip(s)
    - Exec time: [0.35] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 1.55] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14362_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#6779])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@core_hotunplug@unplug-rescan.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#6815])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@device_reset@unbind-reset-rebind.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#5993]) +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#3658])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1512])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +9 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2669]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#3432]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2724])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2325])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2252]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#373]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#6974])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][28] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_content_protection@legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3278]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2341])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1424])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2321])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2320]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2321]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#309]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1508])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#4354])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#4294])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2244])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#776]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2372])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][42] -> [DMESG-FAIL][43] ([Intel XE#5545]) +1 other test dmesg-fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1421]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1397]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1401]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7064] / [Intel XE#7081])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7064])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2293] / [Intel XE#2380])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7061]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4141]) +8 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#651]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2311]) +22 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#656]) +20 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7061]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2313]) +16 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][59] ([Intel XE#6740]) +2 other tests abort
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][60] -> [ABORT][61] ([Intel XE#6740]) +3 other tests abort
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_hdr@static-toggle-suspend.html

  * {igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping} (NEW):
    - shard-bmg:          NOTRUN -> [INCOMPLETE][62] ([Intel XE#1035])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane_cursor@primary:
    - shard-bmg:          [PASS][63] -> [INCOMPLETE][64] ([Intel XE#6652]) +1 other test incomplete
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@kms_plane_cursor@primary.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_plane_cursor@primary.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2938])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2392])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#3309])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1439] / [Intel XE#836])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1406] / [Intel XE#2893]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#2387])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1128] / [Intel XE#1406])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#1406] / [Intel XE#6703])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1406]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1406] / [Intel XE#4609])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render@edp-1.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_psr@psr-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#2414])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#3414] / [Intel XE#3904])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#3414] / [Intel XE#3904])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1435])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#6503]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2426])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#330])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2450])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#4459]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#4227]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-lnl-1/igt@kms_vrr@flipline.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#2142]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-bmg:          [PASS][93] -> [ABORT][94] ([Intel XE#6740] / [Intel XE#6976])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@testdisplay.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@testdisplay.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#6599])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4837]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@connect-user:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#4837]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_eudebug@connect-user.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#4837] / [Intel XE#6665])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#6665])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#6665])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#4518])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#688]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][104] ([Intel XE#6321])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1392]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2322]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#6874]) +14 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#6874]) +17 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-lnl:          [PASS][109] -> [DMESG-WARN][110] ([Intel XE#7023])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-lnl-1/igt@xe_exec_reset@gt-reset-stress.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@many-large-new-madvise:
    - shard-lnl:          [PASS][111] -> [DMESG-WARN][112] ([Intel XE#7063]) +2 other tests dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-lnl-3/igt@xe_exec_system_allocator@many-large-new-madvise.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@xe_exec_system_allocator@many-large-new-madvise.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap:
    - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#4943]) +13 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#4943]) +16 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#6703]) +79 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [PASS][119] -> [FAIL][120] ([Intel XE#6558]) +2 other tests fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145]) -> ([PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [SKIP][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170]) ([Intel XE#2457])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-7/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-7/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-7/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-3/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-3/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-3/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#6964]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#6964]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#5694])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@xe_pm@d3cold-i2c.html
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#5694])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#2284])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#5742])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#584])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#579])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#4733])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#944])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_sriov_vram@vf-access-after-resize-down:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#6376])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@xe_sriov_vram@vf-access-after-resize-down.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-536870912:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#6703]) +23 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_vm@large-userptr-split-misaligned-binds-536870912.html

  * igt@xe_vm@out-of-memory:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#5745])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@xe_vm@out-of-memory.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][184] ([Intel XE#7084]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][186] ([Intel XE#301]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
    - shard-bmg:          [ABORT][188] ([Intel XE#6740]) -> [PASS][189] +1 other test pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][190] ([Intel XE#718]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          [DMESG-WARN][192] ([Intel XE#4537]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-lnl:          [DMESG-WARN][194] ([Intel XE#7063]) -> [PASS][195] +10 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][196] ([Intel XE#2327]) -> [SKIP][197] ([Intel XE#6703])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][198] ([Intel XE#1124]) -> [SKIP][199] ([Intel XE#6703])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][200] ([Intel XE#2887]) -> [SKIP][201] ([Intel XE#6703]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          [SKIP][202] ([Intel XE#2252]) -> [SKIP][203] ([Intel XE#6703]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][204] ([Intel XE#2320]) -> [SKIP][205] ([Intel XE#6703])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][206] ([Intel XE#2321]) -> [SKIP][207] ([Intel XE#6703])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][208] ([Intel XE#4331]) -> [SKIP][209] ([Intel XE#6703])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][210] ([Intel XE#4156]) -> [SKIP][211] ([Intel XE#6703])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          [SKIP][212] ([Intel XE#7064]) -> [SKIP][213] ([Intel XE#7064] / [Intel XE#7081]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][214] ([Intel XE#4141]) -> [SKIP][215] ([Intel XE#6703]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][216] ([Intel XE#2311]) -> [SKIP][217] ([Intel XE#6703]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][218] ([Intel XE#2313]) -> [SKIP][219] ([Intel XE#6703]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][220] ([Intel XE#7061]) -> [SKIP][221] ([Intel XE#6703])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][222] ([Intel XE#1503]) -> [ABORT][223] ([Intel XE#6740])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][224] ([Intel XE#5021]) -> [SKIP][225] ([Intel XE#6703])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][226] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][227] ([Intel XE#1406] / [Intel XE#6703])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          [SKIP][228] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][229] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][230] ([Intel XE#6503]) -> [SKIP][231] ([Intel XE#6703])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][232] ([Intel XE#4837]) -> [SKIP][233] ([Intel XE#6703]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-bmg:          [SKIP][234] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][235] ([Intel XE#6703]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-7/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][236] ([Intel XE#2322]) -> [SKIP][237] ([Intel XE#6703])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][238] ([Intel XE#6874]) -> [SKIP][239] ([Intel XE#6703]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][240] ([Intel XE#6480]) -> [INCOMPLETE][241] ([Intel XE#7098])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:
    - shard-bmg:          [SKIP][242] ([Intel XE#4943]) -> [SKIP][243] ([Intel XE#6703]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6558
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#6976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6976
  [Intel XE#7023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#7064]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7064
  [Intel XE#7081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7081
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8704 -> IGTPW_14362
  * Linux: xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d -> xe-4402-1956fa9bd80d606f7eb92e877680de38a4f6e8ef

  IGTPW_14362: 14362
  IGT_8704: 8704
  xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d
  xe-4402-1956fa9bd80d606f7eb92e877680de38a4f6e8ef: 1956fa9bd80d606f7eb92e877680de38a4f6e8ef

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/index.html

--===============7039964201084454128==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Improve pixel-format tests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/160237/">https://patchwork.freedesktop.org/series/160237/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14362/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14362/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8704_FULL -&gt; XEIGTPW_14362_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
362_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-=
3} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-=
mtl-mc-ccs_cc-modifier@pipe-a-plane-3.html">SKIP</a> +101 other tests skip<=
/li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0} (NEW):<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@kms_plane@pixel-format-y-tiled-c=
cs-modifier@pipe-a-plane-0.html">SKIP</a> +144 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8704_FULL and XEIGTPW_14362=
_FULL:</p>
<h3>New IGT tests (240)</h3>
<ul>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.54, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
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
<li>Exec time: [0.0, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
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
<li>Exec time: [0.38, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@p=
ipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@p=
ipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@p=
ipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@p=
ipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@p=
ipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@p=
ipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-0:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-3:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-0:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-3:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.37, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-0=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-0=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.38, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@p=
ipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@p=
ipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@p=
ipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@p=
ipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@p=
ipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@p=
ipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-3:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-0:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.35, 5.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe=
-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe=
-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe=
-a-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe=
-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe=
-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe=
-b-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
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
<li>Exec time: [0.0, 1.11] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane=
-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane=
-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane=
-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.39, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@p=
ipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@p=
ipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@p=
ipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@p=
ipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@p=
ipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@p=
ipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-0:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-3:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-0:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-3:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.38, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clampin=
g:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clampin=
g@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clampin=
g@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clampin=
g@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clampin=
g@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clampin=
g@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clampin=
g@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-3=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-5=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-0=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-3=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-5=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.36, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-3:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-0:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-3:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [20.54, 22.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [20.09, 21.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-=
0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.55, 6.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-=
3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.25, 3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-=
5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-=
0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.55, 6.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-=
3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.30, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-=
5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.60, 6.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.35, 3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.58, 6.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.11, 3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.62, 5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane=
-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane=
-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane=
-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane=
-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane=
-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane=
-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.96, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.70] s</li>
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
<li>Exec time: [0.98, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 0.71] s</li>
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
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-p=
lane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-p=
lane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-p=
lane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-p=
lane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-p=
lane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-p=
lane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
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
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-0:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-3:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-5:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-3:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane=
-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane=
-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane=
-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.36, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-0:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-3:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-0:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-3:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane=
-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane=
-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane=
-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane=
-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane=
-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane=
-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.36, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-=
plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-=
plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-=
plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-=
plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-=
plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-=
plane-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
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
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plan=
e-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plan=
e-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plan=
e-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plan=
e-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plan=
e-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plan=
e-5:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14362_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-10/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-b=
mg-2/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@device_reset@unbind-reset-rebind=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6815">Intel XE#6815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14362/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-fli=
p-events-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5993">Intel XE#5993</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4=
-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays=
-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@kms_ccs@crc-primary-basic-y-tile=
d-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@kms_chamelium_hpd@vga-hpd-after-=
hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_content_protection@legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
6">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-10/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14362/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@kms_flip@2x-wf_vblank-ts-check-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#140=
1</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
uv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7064">Intel XE#7064</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7081">Intel XE#70=
81</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
uv-linear-to-32bpp-yuv-linear-reflect-x@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7064">Intel X=
E#7064</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#23=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-ar=
gb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrr=
s-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-=
a-3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6740">Intel XE#6740</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-b=
mg-9/igt@kms_hdr@static-toggle-suspend.html">ABORT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +3 oth=
er tests abort</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_plane@pixel-format-x-tiled-m=
odifier-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-1/igt@kms_plane_cursor@primary.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/=
igt@kms_plane_cursor@primary.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) +1 other te=
st incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Inte=
l XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2387">Intel XE#2387</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-page-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_psr@psr-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Inte=
l XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_sharpness_filter@filter-basi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/330">Intel XE#330</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-1=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@kms_=
vrr@flipline.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4227">Intel XE#4227</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14362/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-2/igt@testdisplay.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@testdispl=
ay.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6740">Intel XE#6740</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6976">Intel XE#6976</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@xe_compute@ccs-mode-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-extende=
d-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_eudebug@connect-user.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837=
">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@xe_eudebug_online@interrupt-all-=
set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_eudebug_online@pagefault-one-=
of-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-7/igt@xe_eudebug_online@pagefault-writ=
e-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_eudebug_online@writes-caching=
-vram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-4/igt@xe_eudebug_sriov@deny-eudebug.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@xe_evict@evict-beng-large-cm.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@xe_evict@evict-mixed-many-thread=
s-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-u=
serptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@xe_exec_multi_queue@many-execs-p=
reempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-=
preempt-mode-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +17 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-lnl-1/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-l=
nl-4/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7023">Intel XE#7023</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-new-madvise:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-lnl-3/igt@xe_exec_system_allocator@many-large-new-madvise.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14362/shard-lnl-8/igt@xe_exec_system_allocator@many-large-new-madvise.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7063">Intel XE#7063</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontu=
nmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-mma=
p-shared-remap-dontunmap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_exec_system_allocato=
r@process-many-stride-mmap-shared-remap-dontunmap.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@xe_exec_system_allocator@threads=
-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +13 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@xe_exec_system_allocator@threads=
-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +16 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-=
malloc-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_exec_system_allocator@threads-sha=
red-vm-many-malloc-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +79 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14362/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6558">Intel XE#6558</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8704/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8704/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8704/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8704/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-10/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_870=
4/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_=
8704/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GT_8704/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8704/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8704/shard-bmg-9/igt@xe_m=
odule_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shar=
d-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4362/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-7/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14362/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bm=
g-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14362/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14362/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shar=
d-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14362/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14362/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bm=
g-10/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@xe_multigpu_svm@mgpu-atomic-op-c=
onflict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-10/igt@xe_multigpu_svm@mgpu-pagefault-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@xe_pm@d3cold-i2c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel=
 XE#5694</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_pm@d3cold-i2c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel=
 XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@xe_pm@d3cold-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Inte=
l XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-3/igt@xe_pm@d3hot-i2c.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel =
XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@xe_pm@s3-exec-after.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Int=
el XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-1/igt@xe_pxp@pxp-stale-queue-post-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@xe_query@multigpu-query-invalid-=
query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-down:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-3/igt@xe_sriov_vram@vf-access-after-re=
size-down.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6376">Intel XE#6376</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-536870912:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_vm@large-userptr-split-misali=
gned-binds-536870912.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@xe_vm@out-of-memory.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745">In=
tel XE#5745</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7084">Intel XE#7084</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14362/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-8/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">I=
ntel XE#6740</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14362/shard-bmg-10/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-=
lnl-3/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-lnl-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4537">Intel XE#4537</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14362/shard-lnl-5/igt@kms_psr2_sf@psr2-cursor-pla=
ne-move-continuous-sf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7063">Intel XE#7063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14362/shard-lnl-2/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-9/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Inte=
l XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14362/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">In=
tel XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14362/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">=
Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/225=
2">Intel XE#2252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14362/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-max-size.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
20">Intel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14362/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-max-size=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-512x512.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2321">Intel XE#2321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331"=
>Intel XE#4331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14362/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#415=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_143=
62/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-2/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-lin=
ear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7064">Intel XE#7064</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-8/igt@kms_flip_scaled_crc@=
flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7064">Intel XE#7064</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7081">Intel XE#=
7081</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-ind=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_frontbuffer_tra=
cking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7061">Intel XE#7061</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-arg=
b161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/sha=
rd-bmg-7/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel=
 XE#5021</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14362/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-plane-m=
ove-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"=
>Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-plane.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6503">Intel XE#6503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14362/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter=
-with-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-8/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Int=
el XE#4837</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14362/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-7/igt@xe_eudebug_online@interrupt-other-debuggable.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_eudebug_online@inter=
rupt-other-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userpt=
r-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_exec_basic@multigp=
u-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault=
-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_exec_multi_q=
ueue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-new-prefetc=
h.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6480">Intel XE#6480</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14362/shard-bmg-9/igt@xe_exec_system_allocator@m=
any-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8704/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-free-=
huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14362/shard-bmg-2/igt@xe_exec_system_alloc=
ator@threads-many-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 o=
ther tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8704 -&gt; IGTPW_14362</li>
<li>Linux: xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d -&gt; xe-4402-1=
956fa9bd80d606f7eb92e877680de38a4f6e8ef</li>
</ul>
<p>IGTPW_14362: 14362<br />
  IGT_8704: 8704<br />
  xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d: 733664f1edf3c01cc68e6dd=
0bbdb135158a98a1d<br />
  xe-4402-1956fa9bd80d606f7eb92e877680de38a4f6e8ef: 1956fa9bd80d606f7eb92e8=
77680de38a4f6e8ef</p>

</body>
</html>

--===============7039964201084454128==--
