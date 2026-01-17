Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA73C9832A
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 19:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3AA10E111;
	Sat, 17 Jan 2026 19:17:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6204C10E111;
 Sat, 17 Jan 2026 19:17:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3690406552465187075=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Improve_pixel-format_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 17 Jan 2026 19:17:08 -0000
Message-ID: <176867742839.164775.7394044224255729840@a3b018990fe9>
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

--===============3690406552465187075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve pixel-format tests
URL   : https://patchwork.freedesktop.org/series/160237/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8704_BAT -> XEIGTPW_14362_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 10)
------------------------------

  Additional (1): bat-dg2-oem2 
  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14362_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping} (NEW):
    - bat-ptl-1:          NOTRUN -> [SKIP][1] +35 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-ptl-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * {igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][2] +35 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-atsm-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * {igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3} (NEW):
    - bat-bmg-1:          NOTRUN -> [SKIP][3] +159 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-bmg-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3.html

  * {igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][4] +138 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-adlp-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0.html

  * {igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping} (NEW):
    - bat-lnl-2:          NOTRUN -> [SKIP][5] +35 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * {igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0} (NEW):
    - bat-ptl-2:          NOTRUN -> [SKIP][6] +168 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-ptl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0.html

  * {igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping} (NEW):
    - bat-adlp-7:         NOTRUN -> [FAIL][7] +4 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-adlp-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][8] +117 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-dg2-oem2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping} (NEW):
    - bat-bmg-2:          NOTRUN -> [SKIP][9] +35 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * {igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5} (NEW):
    - bat-lnl-1:          NOTRUN -> [SKIP][10] +159 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-lnl-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5.html

  
New tests
---------

  New tests have been introduced between XEIGT_8704_BAT and XEIGTPW_14362_BAT:

### New IGT tests (252) ###

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - Statuses : 1 pass(s) 8 skip(s)
    - Exec time: [0.0, 3.56] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.50] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.93] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.93] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.98] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - Statuses : 1 pass(s) 8 skip(s)
    - Exec time: [0.0, 2.17] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.20] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.62] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - Statuses : 1 pass(s) 8 skip(s)
    - Exec time: [0.0, 1.66] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.74] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - Statuses : 1 pass(s) 8 skip(s)
    - Exec time: [0.0, 1.72] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.68] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.40] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.35] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - Statuses : 2 pass(s) 7 skip(s)
    - Exec time: [0.0, 12.67] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 12.58] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.87] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.92] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.60] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.97] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.92] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-3:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.61] s

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - Statuses : 4 pass(s) 5 skip(s)
    - Exec time: [0.0, 12.70] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 12.78] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.98] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.02] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.60] s

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.99] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-3:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.70] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.91] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-3:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.61] s

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.56] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.55] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 1.55] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 29.17] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 23.77] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 pass(s)
    - Exec time: [5.18, 6.77] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 5 pass(s)
    - Exec time: [2.42, 4.51] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 pass(s)
    - Exec time: [5.05, 6.78] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 5 pass(s)
    - Exec time: [2.42, 4.42] s

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-0:
    - Statuses : 5 pass(s)
    - Exec time: [5.18, 6.87] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-3:
    - Statuses : 5 pass(s)
    - Exec time: [2.42, 4.51] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.22, 2.41] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0:
    - Statuses : 5 pass(s)
    - Exec time: [5.13, 7.01] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-3:
    - Statuses : 5 pass(s)
    - Exec time: [2.48, 4.50] s

  * igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.23, 2.41] s

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - Statuses : 4 pass(s) 5 skip(s)
    - Exec time: [0.0, 5.22] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - Statuses : 1 fail(s) 4 pass(s) 4 skip(s)
    - Exec time: [0.0, 9.00] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.53] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.23] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.45] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.22] s

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.07] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-3:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.12] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-3:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.73] s

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 1.58] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.55] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 1.56] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.56] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 1.57] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - Statuses : 1 pass(s) 8 skip(s)
    - Exec time: [0.0, 4.29] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 4.36] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.85] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.80] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.82] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-0:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.80] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-3:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - Statuses : 9 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - Statuses : 5 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.55] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-3:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14362_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_plane@pixel-format-y-tiled-ccs-modifier} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][11] ([Intel XE#455]) +29 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-adlp-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * {igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][12] ([Intel XE#455]) +23 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-dg2-oem2/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


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

--===============3690406552465187075==
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
<tr><td><b>Series:</b></td><td>Improve pixel-format tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160237/">https://patchwork.freedesktop.org/series/160237/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8704_BAT -&gt; XEIGTPW_14362_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Additional (1): bat-dg2-oem2 <br />
  Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14362_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping} (NEW):</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-ptl-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-atsm-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3} (NEW):</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-bmg-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3.html">SKIP</a> +159 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-adlp-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0.html">SKIP</a> +138 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping} (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0} (NEW):</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-ptl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0.html">SKIP</a> +168 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-adlp-7/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-dg2-oem2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3.html">SKIP</a> +117 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping} (NEW):</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5} (NEW):</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-lnl-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5.html">SKIP</a> +159 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8704_BAT and XEIGTPW_14362_BAT:</p>
<h3>New IGT tests (252)</h3>
<ul>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 3.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>Statuses : 2 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 12.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 12.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>Statuses : 4 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 12.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 12.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs_cc-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 29.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 23.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.18, 6.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.42, 4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.05, 6.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.42, 4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.18, 6.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.42, 4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.22, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.13, 7.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.48, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.23, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>Statuses : 4 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 5.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 9.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 4.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14362_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_plane@pixel-format-y-tiled-ccs-modifier} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-adlp-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14362/bat-dg2-oem2/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +23 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8704 -&gt; IGTPW_14362</li>
<li>Linux: xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d -&gt; xe-4402-1956fa9bd80d606f7eb92e877680de38a4f6e8ef</li>
</ul>
<p>IGTPW_14362: 14362<br />
  IGT_8704: 8704<br />
  xe-4384-733664f1edf3c01cc68e6dd0bbdb135158a98a1d: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d<br />
  xe-4402-1956fa9bd80d606f7eb92e877680de38a4f6e8ef: 1956fa9bd80d606f7eb92e877680de38a4f6e8ef</p>

</body>
</html>

--===============3690406552465187075==--
