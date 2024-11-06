Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F750D59F5E
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 18:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDE210E75A;
	Wed,  6 Nov 2024 18:30:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DEA10E75A;
 Wed,  6 Nov 2024 18:30:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7758605339731222477=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/kms=5Fccs=3A_add_?=
 =?utf-8?q?suspend_tests_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 06 Nov 2024 18:30:50 -0000
Message-ID: <173091785008.1418416.16462677689807953128@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105115708.682335-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241105115708.682335-1-juhapekka.heikkila@gmail.com>
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

--===============7758605339731222477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_ccs: add suspend tests (rev4)
URL   : https://patchwork.freedesktop.org/series/140731/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8097_full -> XEIGTPW_12038_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12038_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12038_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12038_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@core_getversion@all-cards.html

  * {igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * {igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][4] +9 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * {igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][5] +14 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-5.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-lnl:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_draw_crc@fill-fb:
    - shard-lnl:          [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-7/igt@kms_draw_crc@fill-fb.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][10] +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  
#### Warnings ####

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#3309]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html

  
New tests
---------

  New tests have been introduced between XEIGT_8097_full and XEIGTPW_12038_full:

### New IGT tests (96) ###

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 43.03] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [5.59] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [5.10] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [5.46] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [5.36] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [5.39] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [5.33] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [5.45] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [5.32] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 26.84] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.80] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.35] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.09] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.42] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.17] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 18.22] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.39] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.50] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.32] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-5:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_flip@2x-flip-vs-modeset@ac-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip@2x-flip-vs-modeset@ad-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_flip@2x-flip-vs-modeset@bc-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_flip@2x-flip-vs-modeset@bd-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip@2x-flip-vs-modeset@cd-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@ad-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.66] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@bd-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-plain-flip-fb-recreate@cd-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.69] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.63] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ad-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.64] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.61] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.65] s

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@cd-hdmi-a6-dp5:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_lease@page-flip-implicit-plane@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_vblank@accuracy-idle@pipe-d-dp-5:
    - Statuses : 1 pass(s)
    - Exec time: [2.24] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12038_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#1885])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@core_hotunplug@unplug-rescan.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][15] -> [FAIL][16] ([Intel XE#3130] / [Intel XE#3249])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@write:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#2134])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@fbdev@write.html

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1465])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#623])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#911]) +3 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#664])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-3/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#1701]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#2423] / [i915#2575]) +126 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#1426]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1407]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2231] / [Intel XE#2890]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#316]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1124]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1124]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#619])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#610])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1428])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2423] / [i915#2575]) +29 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +30 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-dp-5.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#2887]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2887])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * {igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2231] / [Intel XE#2890])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * {igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#787]) +108 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2907])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1152]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#306]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#373])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#373]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1178]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2321])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2320]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#308])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#323])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#309])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#3007]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][58] -> [SKIP][59] ([Intel XE#2423]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_dp_aux_dev.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2244])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#776])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1421]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][63] -> [INCOMPLETE][64] ([Intel XE#1195]) +1 other test incomplete
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a6-dp4.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-463/igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#301]) +5 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#301])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][68] ([Intel XE#886]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#301]) +8 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#886]) +2 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#2890]) +29 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1401] / [Intel XE#1745])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1401])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1397]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2293]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2311]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#651]) +12 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][82] ([Intel XE#2333]) +2 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#2351] / [Intel XE#2890]) +14 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#656]) +9 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#658])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#651]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2351] / [Intel XE#2890]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1469])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#2890]) +30 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2313]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#653]) +15 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][93] ([Intel XE#3312])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [ABORT][94] ([Intel XE#2625])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2925])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][96] -> [FAIL][97] ([Intel XE#616]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_plane_cursor@viewport.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#599])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2763]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#3007])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#2763]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2763]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2938])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1131])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][106] -> [FAIL][107] ([Intel XE#718])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2446])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [PASS][109] -> [SKIP][110] ([Intel XE#2446]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1439] / [Intel XE#3141])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][112] -> [DMESG-WARN][113] ([Intel XE#3184]) +2 other tests dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][114] -> [DMESG-WARN][115] ([Intel XE#2042])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-lnl:          [PASS][116] -> [DMESG-WARN][117] ([Intel XE#2932])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-59.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1489]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][119] -> [FAIL][120] ([Intel XE#2808]) +1 other test fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1406]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1437]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][124] -> [FAIL][125] ([Intel XE#2883]) +6 other tests fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-5/igt@kms_setmode@basic.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          NOTRUN -> [FAIL][126] ([Intel XE#899]) +2 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#2159]) +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#455]) +10 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2168])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#756])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [PASS][132] -> [SKIP][133] ([Intel XE#1130]) +225 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#944])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][136] -> [FAIL][137] ([Intel XE#2667])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2905]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2905]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2905])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#688])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [PASS][142] -> [SKIP][143] ([Intel XE#1130]) +20 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#1130]) +50 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#1392])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2322])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
    - shard-lnl:          NOTRUN -> [FAIL][147] ([Intel XE#1630])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#288]) +7 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-lnl:          [PASS][149] -> [FAIL][150] ([Intel XE#1630]) +2 other tests fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
    - shard-bmg:          [PASS][151] -> [FAIL][152] ([Intel XE#1630]) +2 other tests fail
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#1130])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][154] ([Intel XE#3343])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#512])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@xe_mmap@small-bar.html
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#512])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#378])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@xe_module_load@force-load.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [PASS][158] -> [FAIL][159] ([Intel XE#2249])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html
    - shard-lnl:          [PASS][160] -> [FAIL][161] ([Intel XE#2249])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][162] ([Intel XE#2249])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][163] ([Intel XE#2249])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2248])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#2541]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#2284] / [Intel XE#366])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][167] -> [ABORT][168] ([Intel XE#1794])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][169] -> [ABORT][170] ([Intel XE#1607] / [Intel XE#1794])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][171] -> [ABORT][172] ([Intel XE#1794])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [PASS][173] -> [ABORT][174] ([Intel XE#2625]) +2 other tests abort
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#944])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#2134]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@fbdev@read.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@fbdev@read.html
    - shard-bmg:          [SKIP][178] ([Intel XE#2134]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@fbdev@read.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@fbdev@read.html

  * igt@kms_addfb_basic@unused-modifier:
    - shard-bmg:          [SKIP][180] ([Intel XE#3007]) -> [PASS][181] +18 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_addfb_basic@unused-modifier.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_addfb_basic@unused-modifier.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#2890]) -> [PASS][183] +3 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          [SKIP][184] ([Intel XE#2231] / [Intel XE#2890]) -> [PASS][185] +3 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#2351] / [Intel XE#2890]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][188] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][190] ([Intel XE#3113]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][192] ([Intel XE#1195]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][194] ([Intel XE#3184]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][196] ([Intel XE#301]) -> [PASS][197] +7 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][198] ([Intel XE#2597]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][200] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#2423] / [i915#2575]) -> [PASS][203] +10 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][204] ([Intel XE#886]) -> [PASS][205] +7 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [DMESG-WARN][206] -> [PASS][207] +2 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][208] ([Intel XE#616]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_vblank@query-forked-busy-hang:
    - shard-bmg:          [INCOMPLETE][210] -> [PASS][211] +1 other test pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-6/igt@kms_vblank@query-forked-busy-hang.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-3/igt@kms_vblank@query-forked-busy-hang.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][212] ([Intel XE#1473]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1130]) -> [PASS][215] +18 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][216] ([Intel XE#3160]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-lnl:          [FAIL][218] ([Intel XE#3160]) -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][220] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-2/igt@xe_pm@s4-basic.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][222] ([Intel XE#1794]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_vm@bind-once:
    - shard-bmg:          [SKIP][224] ([Intel XE#1130]) -> [PASS][225] +28 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_vm@bind-once.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@xe_vm@bind-once.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#873]) -> [SKIP][227] ([Intel XE#2423] / [i915#2575])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#316]) -> [SKIP][229] ([Intel XE#2351] / [Intel XE#2890])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#316]) -> [SKIP][231] ([Intel XE#2890]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][232] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][233] ([Intel XE#2327])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2890]) -> [SKIP][235] ([Intel XE#316])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][236] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][237] ([Intel XE#1124]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][239] ([Intel XE#1124])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          [SKIP][240] ([Intel XE#1124]) -> [SKIP][241] ([Intel XE#2231] / [Intel XE#2890])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#607]) -> [SKIP][243] ([Intel XE#2351] / [Intel XE#2890])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#2890]) -> [SKIP][245] ([Intel XE#1124])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1124]) -> [SKIP][247] ([Intel XE#2890]) +12 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1124]) -> [SKIP][249] ([Intel XE#2351] / [Intel XE#2890]) +6 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][250] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][251] ([Intel XE#3007])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2191]) -> [SKIP][253] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#367]) -> [SKIP][255] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#2907]) -> [SKIP][257] ([Intel XE#2890]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][259] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2890]) -> [SKIP][261] ([Intel XE#2907])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [FAIL][262] ([Intel XE#616]) -> [SKIP][263] ([Intel XE#2890])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][265] ([Intel XE#2890]) +12 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][266] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][267] ([Intel XE#2887]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2890]) -> [SKIP][269] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#314]) -> [SKIP][271] ([Intel XE#2351] / [Intel XE#2890])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#306]) -> [SKIP][273] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_chamelium_color@gamma.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-bmg:          [SKIP][274] ([Intel XE#2252]) -> [SKIP][275] ([Intel XE#3007])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          [SKIP][276] ([Intel XE#3007]) -> [SKIP][277] ([Intel XE#2252])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2423] / [i915#2575]) -> [SKIP][279] ([Intel XE#373])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#373]) -> [SKIP][281] ([Intel XE#2423] / [i915#2575]) +13 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][282] ([Intel XE#1178]) -> [SKIP][283] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#307]) -> [SKIP][285] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][286] ([Intel XE#1188]) -> [SKIP][287] ([Intel XE#2423] / [i915#2575])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_content_protection@uevent.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#308]) -> [SKIP][289] ([Intel XE#2423] / [i915#2575])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#2423] / [i915#2575]) -> [SKIP][291] ([Intel XE#455])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_cursor_crc@cursor-random-max-size.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html
    - shard-bmg:          [SKIP][292] ([Intel XE#3007]) -> [SKIP][293] ([Intel XE#2320])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#455]) -> [SKIP][295] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][296] ([Intel XE#877]) -> [INCOMPLETE][297] ([Intel XE#3226])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#455]) -> [SKIP][299] ([Intel XE#2351])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_dsc@dsc-basic.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#455]) -> [SKIP][301] ([Intel XE#2890]) +4 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][302] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][303] ([Intel XE#2244])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][304] ([Intel XE#2372]) -> [SKIP][305] ([Intel XE#3007])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#701]) -> [SKIP][307] ([Intel XE#2423] / [i915#2575])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#703]) -> [SKIP][309] ([Intel XE#2423] / [i915#2575])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_feature_discovery@display-3x.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#1137]) -> [SKIP][311] ([Intel XE#2423] / [i915#2575])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#1135]) -> [SKIP][313] ([Intel XE#2423] / [i915#2575])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_feature_discovery@psr1.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][314] ([Intel XE#1195] / [Intel XE#2049]) -> [SKIP][315] ([Intel XE#2423] / [i915#2575])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][316] ([Intel XE#301]) -> [SKIP][317] ([Intel XE#2423] / [i915#2575])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2890]) -> [SKIP][319] ([Intel XE#455])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#455]) -> [SKIP][321] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][322] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][323] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][324] ([i915#5274]) -> [SKIP][325] ([Intel XE#2423] / [i915#2575])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][326] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][327] ([Intel XE#2311]) +3 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][328] ([Intel XE#2231] / [Intel XE#2890]) -> [FAIL][329] ([Intel XE#2333]) +1 other test fail
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [FAIL][330] ([Intel XE#2333]) -> [SKIP][331] ([Intel XE#2231] / [Intel XE#2890])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][333] ([Intel XE#651])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#651]) -> [SKIP][335] ([Intel XE#2890]) +28 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#651]) -> [SKIP][337] ([Intel XE#2351] / [Intel XE#2890]) +17 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][338] ([Intel XE#2311]) -> [SKIP][339] ([Intel XE#2231] / [Intel XE#2890]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2890]) -> [SKIP][341] ([Intel XE#651]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#653]) -> [SKIP][343] ([Intel XE#2890]) +33 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][344] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][345] ([Intel XE#2313]) +3 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#2890]) -> [SKIP][347] ([Intel XE#653]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#658]) -> [SKIP][349] ([Intel XE#2351] / [Intel XE#2890])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][350] ([Intel XE#2313]) -> [SKIP][351] ([Intel XE#2231] / [Intel XE#2890])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][353] ([Intel XE#653])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#653]) -> [SKIP][355] ([Intel XE#2351] / [Intel XE#2890]) +8 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][356] ([Intel XE#3007]) -> [SKIP][357] ([Intel XE#2502])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_getfb@getfb-reject-ccs.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#346]) -> [SKIP][359] ([Intel XE#2890])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#2927]) -> [SKIP][361] ([Intel XE#2890])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [FAIL][362] ([Intel XE#361]) -> [SKIP][363] ([Intel XE#2423] / [i915#2575])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][365] ([Intel XE#2423] / [i915#2575])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#870]) -> [SKIP][367] ([Intel XE#2890]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_pm_backlight@fade.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#1129]) -> [SKIP][369] ([Intel XE#2351] / [Intel XE#2890])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][370] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][371] ([Intel XE#1489]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][372] ([Intel XE#1489]) -> [SKIP][373] ([Intel XE#2231] / [Intel XE#2890])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2890]) -> [SKIP][375] ([Intel XE#1489])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#1489]) -> [SKIP][377] ([Intel XE#2890]) +12 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#1122]) -> [SKIP][379] ([Intel XE#2890])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][380] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][381] ([Intel XE#2387])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#2890]) -> [SKIP][383] ([Intel XE#1122])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][385] ([Intel XE#2351] / [Intel XE#2890]) +5 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-bmg:          [SKIP][386] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][387] ([Intel XE#2231] / [Intel XE#2890]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][389] ([Intel XE#2890]) +16 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#2890]) -> [SKIP][391] ([Intel XE#2850] / [Intel XE#929])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          [SKIP][392] ([Intel XE#2231] / [Intel XE#2890]) -> [SKIP][393] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_psr@pr-suspend.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#2351] / [Intel XE#2890]) -> [SKIP][395] ([Intel XE#2850] / [Intel XE#929])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_psr@psr-dpms.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#2939]) -> [SKIP][397] ([Intel XE#2351] / [Intel XE#2890])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2939]) -> [SKIP][399] ([Intel XE#2890])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][400] ([Intel XE#3007]) -> [SKIP][401] ([Intel XE#2330])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#327]) -> [SKIP][403] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][404] ([Intel XE#2426]) -> [SKIP][405] ([Intel XE#2509])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#330]) -> [SKIP][407] ([Intel XE#2423] / [i915#2575])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2168]) -> [SKIP][409] ([Intel XE#2423] / [i915#2575])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_vrr@cmrr.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#756]) -> [SKIP][411] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][413] ([Intel XE#1130])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#1123]) -> [SKIP][415] ([Intel XE#1130])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#1126]) -> [SKIP][417] ([Intel XE#1130])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-bmg:          [SKIP][418] ([Intel XE#1130]) -> [SKIP][419] ([Intel XE#2905]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_eudebug_online@interrupt-all.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@xe_eudebug_online@interrupt-all.html
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#1130]) -> [SKIP][421] ([Intel XE#2905])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_eudebug_online@interrupt-all.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#2905]) -> [SKIP][423] ([Intel XE#1130]) +10 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][424] ([Intel XE#1473]) -> [SKIP][425] ([Intel XE#1130]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][426] ([Intel XE#2322]) -> [SKIP][427] ([Intel XE#1130])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-bmg:          [SKIP][428] ([Intel XE#1130]) -> [SKIP][429] ([Intel XE#2322]) +2 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [FAIL][430] ([Intel XE#3160]) -> [FAIL][431] ([Intel XE#1630]) +3 other tests fail
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][432] ([Intel XE#3160]) -> [FAIL][433] ([Intel XE#1630]) +2 other tests fail
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#1130]) -> [SKIP][435] ([Intel XE#288])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#288]) -> [SKIP][437] ([Intel XE#1130]) +38 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#2360]) -> [SKIP][439] ([Intel XE#1130])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#2541]) -> [SKIP][441] ([Intel XE#1130]) +11 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#979]) -> [SKIP][443] ([Intel XE#1130])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][444] ([Intel XE#1173]) -> [SKIP][445] ([Intel XE#1061])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@xe_peer2peer@read.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][446] ([Intel XE#1130]) -> [SKIP][447] ([Intel XE#2284])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_pm@d3cold-mocs.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#1130]) -> [SKIP][449] ([Intel XE#2284])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][451] ([Intel XE#1130]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [ABORT][452] ([Intel XE#1794]) -> [SKIP][453] ([Intel XE#1130])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@xe_pm@s2idle-mocs.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][454] ([Intel XE#1694]) -> [SKIP][455] ([Intel XE#1130])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [ABORT][456] ([Intel XE#1358]) -> [SKIP][457] ([Intel XE#1130]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_pm@s3-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#944]) -> [SKIP][459] ([Intel XE#1130]) +3 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][460] ([Intel XE#2919]) -> [SKIP][461] ([Intel XE#1130])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_wedged@basic-wedged.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8097 -> IGTPW_12038
  * Linux: xe-2160-a4532bcf5eea0cfdb56fbdc3195a2d15d193727b -> xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea

  IGTPW_12038: 763534568f1df53deeb013c282a9d7ef4b8f7326 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2160-a4532bcf5eea0cfdb56fbdc3195a2d15d193727b: a4532bcf5eea0cfdb56fbdc3195a2d15d193727b
  xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea: 0f5cd39d188cbedacf9e764749b65a328d33c8ea

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/index.html

--===============7758605339731222477==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_ccs: add suspend tests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140731/">https://patchwork.freedesktop.org/series/140731/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8097_full -&gt; XEIGTPW_12038_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12038_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12038_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12038_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-5.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-7/igt@kms_draw_crc@fill-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_draw_crc@fill-fb.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_dc@dc5-retention-flops:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8097_full and XEIGTPW_12038_full:</p>
<h3>New IGT tests (96)</h3>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 43.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 26.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 18.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ac-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ad-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@bc-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@bd-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@cd-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ad-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bd-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@cd-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ac-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ad-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@cd-hdmi-a6-dp5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-d-dp-5:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12038_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3130">Intel XE#3130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-3/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +126 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-dp-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +108 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-463/igt@kms_flip@2x-blocking-wf_vblank@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-4.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@kms_pm_rpm@legacy-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808">Intel XE#2808</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-5/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +225 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@fbdev@read.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_addfb_basic@unused-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_addfb_basic@unused-modifier.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">PASS</a> +3 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-6/igt@kms_vblank@query-forked-busy-hang.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-3/igt@kms_vblank@query-forked-busy-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-7/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_vm@bind-once.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@xe_vm@bind-once.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@xe_pm@s2idle-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_pm@s2idle-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-bmg-8/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12038/shard-bmg-8/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8097 -&gt; IGTPW_12038</li>
<li>Linux: xe-2160-a4532bcf5eea0cfdb56fbdc3195a2d15d193727b -&gt; xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea</li>
</ul>
<p>IGTPW_12038: 763534568f1df53deeb013c282a9d7ef4b8f7326 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2160-a4532bcf5eea0cfdb56fbdc3195a2d15d193727b: a4532bcf5eea0cfdb56fbdc3195a2d15d193727b<br />
  xe-2167-0f5cd39d188cbedacf9e764749b65a328d33c8ea: 0f5cd39d188cbedacf9e764749b65a328d33c8ea</p>

</body>
</html>

--===============7758605339731222477==--
