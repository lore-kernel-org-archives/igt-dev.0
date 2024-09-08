Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72441ECE577
	for <igt-dev@archiver.kernel.org>; Sun,  8 Sep 2024 01:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36B310E237;
	Sun,  8 Sep 2024 01:48:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DD010E206;
 Sun,  8 Sep 2024 01:48:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5480910905516017215=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeFULL=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv3=2C1/2=5D_tests/intel/kms=5Fpsr2=5Fsf=3A_Modify_kms=5Fpsr2?=
 =?utf-8?q?=5Fsf_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 08 Sep 2024 01:48:56 -0000
Message-ID: <172576013685.971860.8304430583459448499@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905134259.1155164-1-pranay.samala@intel.com>
In-Reply-To: <20240905134259.1155164-1-pranay.samala@intel.com>
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

--===============5480910905516017215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf test
URL   : https://patchwork.freedesktop.org/series/138264/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8006_full -> XEIGTPW_11705_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11705_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] +7 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * {igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][2] +24 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * {igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf} (NEW):
    - {shard-bmg}:        NOTRUN -> [SKIP][3] +49 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - {shard-bmg}:        [DMESG-WARN][4] ([Intel XE#877]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  
New tests
---------

  New tests have been introduced between XEIGT_8006_full and XEIGTPW_11705_full:

### New IGT tests (97) ###

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 34.39] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.18] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.20] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 33.42] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [16.67] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [16.74] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 32.48] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [16.25] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [16.23] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 7.07] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 50.91] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [25.43] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [25.47] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 35.30] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.65] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.65] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 19.35] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [9.71] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [9.63] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.61] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.32] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 18.39] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.09] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.30] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 17.14] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.94] s

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.19] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 12.97] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.49] s

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.47] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.65] s

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.65] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 34.46] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.26] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.19] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 33.53] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [16.73] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [16.79] s

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.29] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 50.91] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [25.46] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [25.43] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 35.53] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.78] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.74] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 19.37] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [9.66] s

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [9.70] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.59] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 19.38] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.02] s

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [11.35] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 16.07] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.97] s

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.10] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 16.84] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.55] s

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [10.29] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 16.43] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 32.59] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [14.67] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [17.92] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [7.91] s

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [8.51] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11705_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][6] ([Intel XE#911]) +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#1426]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1659]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1467])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#346])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1399]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#306])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#307]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1424])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-4/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#309]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1421]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1401] / [Intel XE#1745])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1401])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#651]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#656]) +10 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][29] -> [DMESG-FAIL][30] ([Intel XE#324]) +3 other tests dmesg-fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-8/igt@kms_plane@plane-position-covered.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-4/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-3:
    - shard-lnl:          [PASS][31] -> [DMESG-WARN][32] ([Intel XE#324]) +1 other test dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#599])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][34] -> [FAIL][35] ([Intel XE#361])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#498]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html

  * {igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf} (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201]) +41 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1128])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1406])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-6/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-lnl:          [PASS][40] -> [INCOMPLETE][41] ([Intel XE#2712]) +1 other test incomplete
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][42] -> [FAIL][43] ([Intel XE#1600])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][44] -> [TIMEOUT][45] ([Intel XE#1473] / [Intel XE#402])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#1000])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][48] -> [TIMEOUT][49] ([Intel XE#1473])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#688])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1392]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#1069])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][54] -> [TIMEOUT][55] ([Intel XE#2105])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#2249]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@xe_oa@mmio-triggered-reports.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1061])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-1/igt@xe_peer2peer@write.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][59] -> [DMESG-WARN][60] ([Intel XE#1551] / [Intel XE#569])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#584])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-7/igt@xe_pm@s3-basic-exec.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [FAIL][62] ([Intel XE#1659]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2:
    - {shard-bmg}:        [FAIL][64] ([Intel XE#2436]) -> [PASS][65] +2 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-lnl:          [DMESG-WARN][66] ([Intel XE#877]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-7/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][68] ([Intel XE#877]) -> [PASS][69] +6 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - {shard-bmg}:        [DMESG-WARN][70] -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][72] ([Intel XE#1503]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][74] ([Intel XE#324]) -> [PASS][75] +2 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - {shard-bmg}:        [INCOMPLETE][76] -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-4/igt@kms_rotation_crc@multiplane-rotation.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-8/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [FAIL][78] ([Intel XE#2443]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_evict@evict-beng-threads-large:
    - {shard-bmg}:        [TIMEOUT][80] ([Intel XE#1473]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_compute_mode@many-basic:
    - shard-dg2-set2:     [INCOMPLETE][82] ([Intel XE#1195]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@xe_exec_compute_mode@many-basic.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@xe_exec_compute_mode@many-basic.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [FAIL][84] ([Intel XE#2514]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - {shard-bmg}:        [FAIL][86] ([Intel XE#2514]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][88] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - {shard-bmg}:        [SKIP][90] ([Intel XE#1130]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1130]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][95] ([Intel XE#801]) +23 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#316]) -> [SKIP][97] ([Intel XE#1201] / [Intel XE#316])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][99] ([Intel XE#316]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#610]) -> [SKIP][101] ([Intel XE#1201] / [Intel XE#610])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][103] ([Intel XE#1124]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1124]) -> [SKIP][105] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][107] ([Intel XE#610])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][109] ([Intel XE#346]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#2191]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#2191])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#367]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][115] ([Intel XE#367]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][117] ([Intel XE#787]) +90 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#787]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1252]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][125] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#314]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#314])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#306]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#306])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][131] ([Intel XE#306])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#373]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_chamelium_edid@vga-edid-read.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][135] ([Intel XE#373]) +8 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][137] ([Intel XE#307])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#307]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#307])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#308]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#308])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#455]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#455]) +15 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#323]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#323])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][147] ([Intel XE#323]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#776]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#776])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][151] ([Intel XE#703])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][153] ([Intel XE#455]) +12 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][155] ([Intel XE#651]) +28 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#651]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#651]) +26 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#658]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#658])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#653]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#653]) +25 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][163] ([Intel XE#653]) +24 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-WARN][164] ([Intel XE#324]) -> [DMESG-FAIL][165] ([Intel XE#324])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_plane@plane-position-hole.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][167] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][169] ([Intel XE#498]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#2318]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][175] ([Intel XE#2318]) +5 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][177] ([Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][179] ([Intel XE#870]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@kms_pm_backlight@fade.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#870]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#870])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][182] ([Intel XE#736]) -> [SKIP][183] ([Intel XE#1909])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][185] ([Intel XE#1122]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][187] ([Intel XE#929]) +10 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-433/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#929]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#327]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#327])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][193] ([Intel XE#1127])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][195] ([Intel XE#327]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][197] ([Intel XE#1500])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#2168]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#2168])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_vrr@lobf.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][201] ([Intel XE#756])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#756]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][205] ([Intel XE#1123])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1123]) -> [SKIP][207] ([Intel XE#1123] / [Intel XE#1201])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1126]) -> [SKIP][209] ([Intel XE#1126] / [Intel XE#1201])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][210] ([Intel XE#1473]) -> [FAIL][211] ([Intel XE#1000])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][213] ([Intel XE#288]) +21 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#288]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#288]) +20 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][217] ([Intel XE#2360])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][219] ([Intel XE#255])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_huc_copy@huc_copy.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#378]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#378])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_module_load@force-load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][223] ([Intel XE#378])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2541]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][227] ([Intel XE#2541]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][229] ([Intel XE#977])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][233] ([Intel XE#2284] / [Intel XE#366])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_pm@s3-d3cold-basic-exec.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][235] ([Intel XE#944]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#944]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2712
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8006 -> IGTPW_11705
  * Linux: xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581 -> xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d

  IGTPW_11705: 539b0fdc2a085a40bdd202a2e61553f0149550f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581: 883d811c2bfc8544bc5b00bbee84e6b83e20a581
  xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/index.html

--===============5480910905516017215==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138264/">https://patchwork.freedesktop.org/series/138264/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8006_full -&gt; XEIGTPW_11705_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11705_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf} (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8006_full and XEIGTPW_11705_full:</p>
<h3>New IGT tests (97)</h3>
<ul>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 34.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 33.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 32.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 7.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 50.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [25.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [25.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 35.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 19.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 18.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 17.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 12.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 8.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 34.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 33.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [16.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 50.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [25.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [25.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 35.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 19.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 4.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 19.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [11.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 16.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 16.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 16.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 32.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.51] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11705_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-4/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-8/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-4/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf} (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-6/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2712">Intel XE#2712</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-1/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-7/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-7/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-4/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-8/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-2/igt@kms_vrr@flip-basic-fastset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@xe_exec_compute_mode@many-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@xe_exec_compute_mode@many-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-5/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-3/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909">Intel XE#1909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-433/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-463/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-435/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8006/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11705/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8006 -&gt; IGTPW_11705</li>
<li>Linux: xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581 -&gt; xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d</li>
</ul>
<p>IGTPW_11705: 539b0fdc2a085a40bdd202a2e61553f0149550f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8006: ae7f2bc0b99801a7ae369d4b5fda5c6b1c386eb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1897-883d811c2bfc8544bc5b00bbee84e6b83e20a581: 883d811c2bfc8544bc5b00bbee84e6b83e20a581<br />
  xe-1901-7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d</p>

</body>
</html>

--===============5480910905516017215==--
