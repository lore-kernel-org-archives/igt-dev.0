Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123DAFF60D8
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 07:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA07010E168;
	Tue, 31 Mar 2026 07:45:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6F610E168;
 Tue, 31 Mar 2026 07:45:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2742582077712032366=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Add_CSC_Fixed-Function_=28?=
 =?utf-8?q?CSC=5FFF=29_colorop_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 31 Mar 2026 07:45:50 -0000
Message-ID: <177494315028.414888.12584695148699714718@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260330115057.963395-1-swati2.sharma@intel.com>
In-Reply-To: <20260330115057.963395-1-swati2.sharma@intel.com>
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

--===============2742582077712032366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add CSC Fixed-Function (CSC_FF) colorop tests
URL   : https://patchwork.freedesktop.org/series/164080/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8836_FULL -> XEIGTPW_14884_FULL
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

  Here are the unknown changes that may have been introduced in XEIGTPW_14884_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-c-plane-1} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][1] +63 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-lnl-8/igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-c-plane-1.html

  
New tests
---------

  New tests have been introduced between XEIGT_8836_FULL and XEIGTPW_14884_FULL:

### New IGT tests (80) ###

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020:
    - Statuses : 1 skip(s)
    - Exec time: [3.20] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-a-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-a-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-b-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-b-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601:
    - Statuses : 1 skip(s)
    - Exec time: [3.20] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-a-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-a-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-b-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-b-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709:
    - Statuses : 1 skip(s)
    - Exec time: [3.09] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-a-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-a-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-b-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-b-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020:
    - Statuses : 1 skip(s)
    - Exec time: [3.08] s

  * igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-a-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-a-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-b-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-b-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020:
    - Statuses : 1 skip(s)
    - Exec time: [3.33] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-a-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-a-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-b-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-b-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601:
    - Statuses : 1 skip(s)
    - Exec time: [3.18] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-a-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-a-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-b-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-b-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709:
    - Statuses : 1 skip(s)
    - Exec time: [3.15] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-a-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-a-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-b-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-b-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020:
    - Statuses : 1 skip(s)
    - Exec time: [3.25] s

  * igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-a-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-a-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-a-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-b-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-b-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-b-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-c-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-c-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-c-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14884_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-c-plane-2} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#7006]) +15 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-lnl-2/igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-c-plane-2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#301]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#7340] / [Intel XE#7504])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][7] -> [SKIP][8] ([Intel XE#4692] / [Intel XE#7508])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
#### Possible fixes ####

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][9] ([Intel XE#4459]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][11] ([Intel XE#2142]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][13], [DMESG-WARN][14], [DMESG-WARN][15], [DMESG-WARN][16], [DMESG-WARN][17], [DMESG-WARN][18], [DMESG-WARN][19], [DMESG-WARN][20], [DMESG-WARN][21], [DMESG-WARN][22], [DMESG-WARN][23], [DMESG-WARN][24], [DMESG-WARN][25], [DMESG-WARN][26], [DMESG-WARN][27], [DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [PASS][37]) ([Intel XE#7433]) -> ([DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51], [DMESG-WARN][52], [DMESG-WARN][53], [DMESG-WARN][54], [DMESG-WARN][55], [DMESG-WARN][56], [DMESG-WARN][57], [DMESG-WARN][58], [DMESG-WARN][59], [DMESG-WARN][60], [DMESG-WARN][61], [DMESG-WARN][62]) ([Intel XE#7433])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-5/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-8/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-8/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-4/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-4/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-10/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-10/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-10/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-1/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-1/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-1/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-7/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-7/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-9/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-9/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-9/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-2/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-2/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-2/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-3/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-3/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-3/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-6/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-6/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-5/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-3/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-3/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-6/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-6/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-6/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-4/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-4/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-8/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-8/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-8/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-10/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-10/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-10/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-1/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-1/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-1/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-7/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-7/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-9/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-9/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-9/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-2/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-2/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-2/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-3/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
  [Intel XE#7508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508


Build changes
-------------

  * IGT: IGT_8836 -> IGTPW_14884
  * Linux: xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb -> xe-4824-8d31b64e763bc1c7b508ae3dc01b4dfcab973729

  IGTPW_14884: e3b0f9b21a2cc1ab4be507643cb8c14e15f93a87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8836: 8836
  xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb: 169e5b6f809026c4a0cb3a736b48378ca8e8fecb
  xe-4824-8d31b64e763bc1c7b508ae3dc01b4dfcab973729: 8d31b64e763bc1c7b508ae3dc01b4dfcab973729

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/index.html

--===============2742582077712032366==
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
<tr><td><b>Series:</b></td><td>Add CSC Fixed-Function (CSC_FF) colorop test=
s</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164080/">https://patchwork.freedesktop.org/series/164080/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14884/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14884/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8836_FULL -&gt; XEIGTPW_14884_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14=
884_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-c-plane-1=
} (NEW):<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14884/shard-lnl-8/igt@kms_color_pipeline@plane-csc-ff-=
lut1d-yuv601-rgb601@pipe-c-plane-1.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8836_FULL and XEIGTPW_14884=
_FULL:</p>
<h3>New IGT tests (80)</h3>
<ul>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-a-plane-0=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-a-plane-1=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-a-plane-2=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-b-plane-0=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-b-plane-1=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-b-plane-2=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-c-plane-0=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-c-plane-1=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv2020-rgb2020@pipe-c-plane-2=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-a-plane-0:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-a-plane-1:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-a-plane-2:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-b-plane-0:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-b-plane-1:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-b-plane-2:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-c-plane-0:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-c-plane-1:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv601-rgb601@pipe-c-plane-2:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-a-plane-0:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-a-plane-1:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-a-plane-2:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-b-plane-0:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-b-plane-1:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-b-plane-2:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-c-plane-0:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-c-plane-1:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-c-plane-2:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-rgb709-rgb2020@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv2020-rgb2020@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv601-rgb601@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [3.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-csc-ff-yuv709-rgb709@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-a-pl=
ane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-a-pl=
ane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-a-pl=
ane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-b-pl=
ane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-b-pl=
ane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-b-pl=
ane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-c-pl=
ane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-c-pl=
ane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-csc-ff-lut1d-rgb709-rgb2020@pipe-c-pl=
ane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14884_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_color_pipeline@plane-csc-ff-lut1d-yuv709-rgb709@pipe-c-plane-2}=
 (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14884/shard-lnl-2/igt@kms_color_pipeline@plane-csc-ff-=
lut1d-yuv709-rgb709@pipe-c-plane-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8836/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14884/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8836/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-lnl-5/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8836/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14884/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4692">Intel XE#4692</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7508">Intel XE#7508</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8836/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#445=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_148=
84/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8836/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14884/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual=
@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8836/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-8/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8836/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg=
-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-4/igt@xe_module_load@load.htm=
l">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
_8836/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-10/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8836/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-=
bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-1/igt@xe_module_load@load.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8836/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-7/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8836/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard=
-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-9/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8836/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-2/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8836/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard=
-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-3/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8836/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-3/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8836/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard=
-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-5/igt@xe_module_load@load=
.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7433">Intel XE#7433</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14884/shard-bmg-3/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884=
/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-6/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14884/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard=
-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-4/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14884/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-8=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-8/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14884/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-10/igt@=
xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14884/shard-bmg-10/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14884/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-1/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14884/shard-bmg-1/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884=
/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-7/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14884/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard=
-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-9/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14884/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-2=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-2/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14884/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14884/shard-bmg-3/igt@x=
e_module_load@load.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8836 -&gt; IGTPW_14884</li>
<li>Linux: xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb -&gt; xe-4824-8=
d31b64e763bc1c7b508ae3dc01b4dfcab973729</li>
</ul>
<p>IGTPW_14884: e3b0f9b21a2cc1ab4be507643cb8c14e15f93a87 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8836: 8836<br />
  xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb: 169e5b6f809026c4a0cb3a7=
36b48378ca8e8fecb<br />
  xe-4824-8d31b64e763bc1c7b508ae3dc01b4dfcab973729: 8d31b64e763bc1c7b508ae3=
dc01b4dfcab973729</p>

</body>
</html>

--===============2742582077712032366==--
