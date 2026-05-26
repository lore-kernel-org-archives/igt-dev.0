Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40710CD5BB4
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 07:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C3B10E524;
	Tue, 26 May 2026 07:47:12 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF1510E524;
 Tue, 26 May 2026 07:46:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6941698670319491743=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/kms=5Fcolor=3A_Add_m?=
 =?utf-8?q?ulti-format_coverage_for_pipe_color_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 May 2026 07:46:53 -0000
Message-ID: <177978161343.8230.4617040775174231841@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526054909.688792-1-pranay.samala@intel.com>
In-Reply-To: <20260526054909.688792-1-pranay.samala@intel.com>
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

--===============6941698670319491743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Add multi-format coverage for pipe color tests (rev2)
URL   : https://patchwork.freedesktop.org/series/165178/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8937_FULL -> XEIGTPW_15240_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15240_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15240_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15240_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010} (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][1] +223 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010.html

  * igt@kms_color@ctm-negative:
    - shard-lnl:          [PASS][2] -> [FAIL][3] +9 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-2/igt@kms_color@ctm-negative.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_color@ctm-negative.html

  * igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][4] +83 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@extended-mode-basic@pipe-d-hdmi-a-3-pipe-a-dp-2:
    - shard-bmg:          [PASS][7] -> [FAIL][8] +10 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_display_modes@extended-mode-basic@pipe-d-hdmi-a-3-pipe-a-dp-2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_display_modes@extended-mode-basic@pipe-d-hdmi-a-3-pipe-a-dp-2.html

  
New tests
---------

  New tests have been introduced between XEIGT_8937_FULL and XEIGTPW_15240_FULL:

### New IGT tests (484) ###

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.77] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.05] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.20] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.39] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.47] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [5.44] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.23] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.60] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.91] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.21] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.78] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.04] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.13] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.16] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.56] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [5.02] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.26] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.63] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.89] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.01] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.80] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.00] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.17] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.14] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.74] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [4.62] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.04] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.59] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.92] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.00] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.78] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.05] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.18] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.59] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.88] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.03] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.79] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.12] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.22] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.19] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.66] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [4.26] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.41] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.62] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.92] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.02] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.72] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.06] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.17] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.14] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.57] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [4.80] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.39] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.61] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.88] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.03] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.77] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.06] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.20] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.13] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.74] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [4.64] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.38] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.62] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.87] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.02] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.73] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.15] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.65] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.90] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.02] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.29] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.15] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.97] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.36] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [11.86] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [5.68] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.37] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.11] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.89] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.62] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.29] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.10] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [2.03] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.86] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.54] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [11.93] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [6.58] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.53] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.08] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.86] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.60] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.27] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.11] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [2.03] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [6.00] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.24] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [11.84] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [6.24] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.24] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.09] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.92] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.63] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.26] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.15] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [2.03] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.86] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.08] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.91] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.72] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.20] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.24] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.75] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.93] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.14] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.90] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.07] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.16] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.91] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.49] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.17] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.10] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.14] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.93] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.32] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.81] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.69] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.14] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.43] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.23] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.91] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.74] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.54] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.11] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.16] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.69] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.12] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.55] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.18] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.23] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.85] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.91] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.14] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.77] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.83] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.98] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.85] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.91] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.04] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.68] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.22] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.32] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.91] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.70] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.72] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.68] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.71] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.68] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.21] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.37] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.09] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.12] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.33] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.22] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.70] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.04] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.12] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.11] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.14] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.06] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.11] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.11] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.47] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.65] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.26] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.61] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.83] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.11] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.89] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.50] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.97] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.39] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.64] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.22] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.49] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.75] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.11] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [3.24] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.90] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.07] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.13] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.42] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.59] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.20] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.49] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.76] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.09] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [3.09] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.77] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.58] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.02] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.42] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.65] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.17] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.46] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.28] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.05] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.38] s

  * igt@kms_color@degamma@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@degamma@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.10] s

  * igt@kms_color@degamma@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_color@degamma@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_color@degamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.74] s

  * igt@kms_color@degamma@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.68] s

  * igt@kms_color@degamma@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@degamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@degamma@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@degamma@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@degamma@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@degamma@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_color@degamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@degamma@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@degamma@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@degamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.98] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_color@degamma@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@degamma@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@degamma@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@degamma@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_color@degamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@degamma@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.70] s

  * igt@kms_color@degamma@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@degamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.71] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.95] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@degamma@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@degamma@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.01] s

  * igt@kms_color@degamma@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@degamma@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.98] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@gamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.56] s

  * igt@kms_color@gamma@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.71] s

  * igt@kms_color@gamma@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_color@gamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@gamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@gamma@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.68] s

  * igt@kms_color@gamma@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_color@gamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@gamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@gamma@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.75] s

  * igt@kms_color@gamma@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_color@gamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-p010:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.56] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-p010:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15240_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#6779]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7679])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2669] / [Intel XE#3433] / [Intel XE#7389]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#4417] / [Intel XE#5447]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2325] / [Intel XE#7358])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#373]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-fast.html
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6974])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#6974])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7642]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2320]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1424]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#323] / [Intel XE#6035])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2286] / [Intel XE#6035])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic@pipe-d-hdmi-a-3-pipe-b-dp-2:
    - shard-bmg:          [PASS][29] -> [ABORT][30] ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7814])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_display_modes@extended-mode-basic@pipe-d-hdmi-a-3-pipe-b-dp-2.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_display_modes@extended-mode-basic@pipe-d-hdmi-a-3-pipe-b-dp-2.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#2244])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1137] / [Intel XE#2375])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@kms_feature_discovery@dp-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2375])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [PASS][34] -> [DMESG-FAIL][35] ([Intel XE#5545] / [Intel XE#7774]) +1 other test dmesg-fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-9/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#6703]) +235 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          NOTRUN -> [FAIL][38] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4141]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2311]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7905]) +21 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#6312]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7865]) +9 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2313]) +9 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#656] / [Intel XE#7905]) +17 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1503] / [Intel XE#7915])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7915]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#7915]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7086] / [Intel XE#7390])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#6900] / [Intel XE#7362])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7130])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7283])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#4596] / [Intel XE#5854])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#5021] / [Intel XE#7377])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309] / [Intel XE#7343])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2763] / [Intel XE#6886]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#7340] / [Intel XE#7504])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#7340]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@package-g7:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#6813])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1489])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1128] / [Intel XE#7413])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2234] / [Intel XE#2850])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1406])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2330] / [Intel XE#5813])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1127] / [Intel XE#5813])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#6503])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_sharpness_filter@filter-strength.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#1499])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#2142]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#5191] / [Intel XE#7316] / [Intel XE#7346])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#7319] / [Intel XE#7350] / [Intel XE#944])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7636])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7636]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#7482]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#6557] / [Intel XE#6703])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1392]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2322] / [Intel XE#7372])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#7136]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7136]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#6874]) +9 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#6874]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-1/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_system_allocator@once-large-mmap-file-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#6703]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_system_allocator@once-large-mmap-file-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#6557] / [Intel XE#6703]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#7138]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [PASS][95] -> [FAIL][96] ([Intel XE#7736]) +2 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#6964])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#7793])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#584] / [Intel XE#7369])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_sriov_admin@sched-priority-vf-write-denied:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#7174])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_sriov_admin@sched-priority-vf-write-denied.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#4130] / [Intel XE#7366])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [PASS][102] -> [FAIL][103] ([Intel XE#6569])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][104] -> [DMESG-WARN][105] ([Intel XE#6627] / [Intel XE#7419])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-10/igt@xe_survivability@runtime-survivability.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@xe_survivability@runtime-survivability.html

  * igt@xe_vm@large-split-misaligned-binds-2097152:
    - shard-bmg:          [PASS][106] -> [ABORT][107] ([Intel XE#7893])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-3/igt@xe_vm@large-split-misaligned-binds-2097152.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-1/igt@xe_vm@large-split-misaligned-binds-2097152.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][108] -> [ABORT][109] ([Intel XE#8007])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][110] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:
    - shard-bmg:          [FAIL][112] ([Intel XE#6078]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][114] ([Intel XE#7308]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-bmg:          [CRASH][116] -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0:
    - shard-bmg:          [DMESG-FAIL][118] ([Intel XE#7774]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3:
    - shard-bmg:          [FAIL][120] ([Intel XE#7944]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][122] ([Intel XE#7340]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][124] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-3/igt@kms_vrr@flipline.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_vrr@flipline.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:
    - shard-lnl:          [ABORT][126] ([Intel XE#8007]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:
    - shard-bmg:          [SKIP][128] ([Intel XE#6703]) -> [PASS][129] +12 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [SKIP][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-2/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-1/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-7/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-7/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-7/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-8/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-8/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-5/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-5/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-5/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-5/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-1/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-1/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-6/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-4/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-4/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-4/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-2/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-2/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-3/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-3/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_module_load@load.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-bmg:          [SKIP][178] ([Intel XE#8182]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-9/igt@xe_pmu@all-fn-engine-activity-load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-1/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:
    - shard-bmg:          [FAIL][180] ([Intel XE#7992]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-9/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][182] ([Intel XE#6569]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][184] ([Intel XE#2327]) -> [SKIP][185] ([Intel XE#6703])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][186] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][187] ([Intel XE#6703])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][188] ([Intel XE#1124]) -> [SKIP][189] ([Intel XE#6703]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][190] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][191] ([Intel XE#6703])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][192] ([Intel XE#367]) -> [SKIP][193] ([Intel XE#6703])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][194] ([Intel XE#6703]) -> [SKIP][195] ([Intel XE#2887])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][196] ([Intel XE#2887]) -> [SKIP][197] ([Intel XE#6703]) +5 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][198] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][199] ([Intel XE#6703])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-bmg:          [SKIP][200] ([Intel XE#2252]) -> [SKIP][201] ([Intel XE#6703]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][202] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][203] ([Intel XE#6703])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [FAIL][204] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][205] ([Intel XE#6703])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_content_protection@suspend-resume.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][206] ([Intel XE#2320]) -> [SKIP][207] ([Intel XE#6703]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][208] ([Intel XE#1138] / [Intel XE#7344]) -> [SKIP][209] ([Intel XE#6703])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-10/igt@kms_feature_discovery@display-4x.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][210] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][211] ([Intel XE#6703])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
    - shard-bmg:          [SKIP][212] ([Intel XE#2311]) -> [SKIP][213] ([Intel XE#6703]) +18 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][214] ([Intel XE#4141]) -> [SKIP][215] ([Intel XE#6703]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][216] ([Intel XE#4141]) -> [SKIP][217] ([Intel XE#6557] / [Intel XE#6703])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][218] ([Intel XE#2311]) -> [SKIP][219] ([Intel XE#6557] / [Intel XE#6703])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][220] ([Intel XE#7061]) -> [SKIP][221] ([Intel XE#6703]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][222] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][223] ([Intel XE#6703]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][224] ([Intel XE#2313]) -> [SKIP][225] ([Intel XE#6703]) +18 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][226] ([Intel XE#6703]) -> [SKIP][227] ([Intel XE#7061] / [Intel XE#7356])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][228] ([Intel XE#6911] / [Intel XE#7378]) -> [SKIP][229] ([Intel XE#6703])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][230] ([Intel XE#6912] / [Intel XE#7375]) -> [SKIP][231] ([Intel XE#6703])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][232] ([Intel XE#7283]) -> [SKIP][233] ([Intel XE#6703]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][234] ([Intel XE#6703]) -> [SKIP][235] ([Intel XE#2763] / [Intel XE#6886])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][236] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][237] ([Intel XE#6703])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][238] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][239] ([Intel XE#6703])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-8/igt@kms_pm_backlight@fade.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][240] ([Intel XE#6703]) -> [SKIP][241] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][242] ([Intel XE#1489]) -> [SKIP][243] ([Intel XE#6703]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][244] ([Intel XE#6703]) -> [SKIP][245] ([Intel XE#1489])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          [SKIP][246] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][247] ([Intel XE#6703]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][248] ([Intel XE#7795]) -> [SKIP][249] ([Intel XE#6703])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][250] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][251] ([Intel XE#6703])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][252] ([Intel XE#6503]) -> [SKIP][253] ([Intel XE#6703])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][254] ([Intel XE#7636]) -> [SKIP][255] ([Intel XE#6703]) +5 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-6/igt@xe_eudebug_online@single-step.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][256] ([Intel XE#6703]) -> [SKIP][257] ([Intel XE#2322] / [Intel XE#7372])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [SKIP][258] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][259] ([Intel XE#6703])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          [SKIP][260] ([Intel XE#7136]) -> [SKIP][261] ([Intel XE#6703]) +4 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-imm.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_multi_queue@max-queues-close-fd:
    - shard-bmg:          [SKIP][262] ([Intel XE#6874]) -> [SKIP][263] ([Intel XE#6703]) +10 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-close-fd.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          [SKIP][264] ([Intel XE#7138]) -> [SKIP][265] ([Intel XE#6703]) +3 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-rebind.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-bmg:          [SKIP][266] ([Intel XE#7793]) -> [SKIP][267] ([Intel XE#6703])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-8/igt@xe_page_reclaim@binds-large-split.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          [SKIP][268] ([Intel XE#7590]) -> [SKIP][269] ([Intel XE#6703])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-1/igt@xe_pat@xa-app-transient-media-off.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][270] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][271] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-4/igt@xe_peer2peer@read.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_peer2peer@read.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][272] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][273] ([Intel XE#6703])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][274] ([Intel XE#944]) -> [SKIP][275] ([Intel XE#6703])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7346
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7944
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8182]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8182
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8937 -> IGTPW_15240
  * Linux: xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b -> xe-5127-6b6931ea69504481efd3df1cc99765141feb178c

  IGTPW_15240: 15240
  IGT_8937: 8937
  xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b: 04d475020800d0a1033ca89a0d6d5fc638ddc65b
  xe-5127-6b6931ea69504481efd3df1cc99765141feb178c: 6b6931ea69504481efd3df1cc99765141feb178c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/index.html

--===============6941698670319491743==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: Add multi-format coverage f=
or pipe color tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/165178/">https://patchwork.freedesktop.org/series/165178/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15240/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15240/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8937_FULL -&gt; XEIGTPW_15240_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15240_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15240_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
240_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_color@ctm-0-50@pipe-a-hdmi-a=
-3-p010.html">FAIL</a> +223 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-lnl-2/igt@kms_color@ctm-negative.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/ig=
t@kms_color@ctm-negative.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_color@ctm-signed@pipe-c-edp-=
1-yuyv.html">FAIL</a> +83 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240=
/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-d-hdmi-a-3-pipe-a-dp-2:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_display_modes@extended-mode-basic@pipe-d-hdm=
i-a-3-pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_display_modes@extended-mod=
e-basic@pipe-d-hdmi-a-3-pipe-a-dp-2.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8937_FULL and XEIGTPW_15240=
_FULL:</p>
<h3>New IGT tests (484)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15240_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-7/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard=
-bmg-2/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2=
-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_ccs@bad-pixel-format-4-tiled=
-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#738=
9</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_cdclk@mode-transition@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5447">Intel XE#5447</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-3/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)=
</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-d-hdmi-a-3-pipe-b-dp-2:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_display_modes@extended-mode-basic@pipe-d-hdm=
i-a-3-pipe-b-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_display_modes@extended-mod=
e-basic@pipe-d-hdmi-a-3-pipe-b-dp-2.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814"=
>Intel XE#7814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1137">Intel XE#1137</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2375">Intel XE#2375</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-5/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-9/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/sh=
ard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5=
545</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
74">Intel XE#7774</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-=
2/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +235 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-=
interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +21 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +17 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7915">Intel XE#7915</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_hdr@static-swap@pipe-a-edp-1=
-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616=
f.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15240/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb161616=
16f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7086">Intel XE#7086</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7390">Intel XE#7390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-b=
mg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5854">Intel XE#5854</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@kms_plane_scaling@2x-scaler-mult=
i-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>=
) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-9/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>=
) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7340">Intel XE#7340</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_pm_rpm@package-g7.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">=
Intel XE#6813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_psr@fbc-psr-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@kms_psr@pr-sprite-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_sharpness_filter@filter-stre=
ngth.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15240/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_compute_preempt@compute-preem=
pt-many-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5191">Intel XE#5191</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7316">Intel XE#7316</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7346">Intel XE#7346</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_create@multigpu-create-massiv=
e-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7319">Intel XE#7319</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7350">Intel XE#7350</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-=
reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_eudebug@discovery-empty-clien=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_evict@evict-beng-mixed-many-t=
hreads-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_exec_balancer@many-parallel-u=
serptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +8 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_balancer@many-parallel-u=
serptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-n=
ull-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-n=
ull-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-qu=
eue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@xe_exec_fault_mode@twice-multi-q=
ueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7136">Intel XE#7136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_exec_multi_queue@many-queues-=
preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +9 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-1/igt@xe_exec_multi_queue@max-queues-p=
reempt-mode-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-file-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_system_allocator@once-la=
rge-mmap-file-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-pref=
etch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-=
execqueues-mmap-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_system_allocato=
r@threads-shared-vm-many-execqueues-mmap-prefetch.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_exec_threads@threads-multi-qu=
eue-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15240/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7736">Intel XE#7736</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@xe_multigpu_svm@mgpu-migration-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_page_reclaim@basic-mixed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_pm@s3-vm-bind-unbind-all.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@sched-priority-vf-write-denied:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_sriov_admin@sched-priority-vf=
-write-denied.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@xe_sriov_auto_provisioning@resou=
rces-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard=
-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-10/igt@xe_survivability@runtime-survivability.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_152=
40/shard-bmg-9/igt@xe_survivability@runtime-survivability.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">I=
ntel XE#6627</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7419">Intel XE#7419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-2097152:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-3/igt@xe_vm@large-split-misaligned-binds-2097152.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15240/shard-bmg-1/igt@xe_vm@large-split-misaligned-binds-2097152.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893"=
>Intel XE#7893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-ln=
l-3/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3718">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-10/igt@kms_async_flips@al=
ternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic=
@pipe-b-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-10/igt@kms_async_flips@=
alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#=
7308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15240/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.=
html">CRASH</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15240/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@=
pipe-a-plane-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_plane@pix=
el-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@=
pipe-a-plane-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7944">Intel XE#7944</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@kms_plane@pixel-for=
mat-4-tiled-bmg-ccs-modifier@pipe-a-plane-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard=
-lnl-5/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-lnl-3/igt@kms_vrr@flipline.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel X=
E#7397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15240/shard-lnl-8/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemse=
t:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-lnl-3/igt@xe_exec_system_allocator@threads-many-execqueues=
-mmap-shared-nomemset.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@xe_exec_sys=
tem_allocator@threads-many-execqueues-mmap-shared-nomemset.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-no=
memset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-=
execqueues-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-7/igt@xe_exec=
_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html">P=
ASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8937/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8937/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8937/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8937/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8937/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8937/shard-lnl-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-ln=
l-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8937/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard=
-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
937/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8937/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8937/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8937/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15240/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15240/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-ln=
l-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15240/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15240/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
240/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_15240/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15240/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15240/shard-lnl-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-9/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8182">Int=
el XE#8182</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15240/shard-bmg-1/igt@xe_pmu@all-fn-engine-activity-load.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-9/igt@xe_sriov_auto_provisioning@fair-allocation@numvf=
s-random.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7992">Intel XE#7992</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-8/igt@xe_sriov_auto_provisionin=
g@fair-allocation@numvfs-random.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE=
#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15240/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15240/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-h=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_big_fb@line=
ar-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-18=
0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_big_fb@y-tiled-ma=
x-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"=
>Intel XE#610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7387">Intel XE#7387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-target-1920x1080=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-ta=
rget-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15240/shard-bmg-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen=
12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2887">Intel XE#2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-m=
tl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">In=
tel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7358">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#22=
52</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15=
240/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">I=
ntel XE#2390</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6974">Intel XE#6974</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_content_protection@dp-mst-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_content_protection@suspend-resume.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">=
Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_content_prot=
ection@suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">I=
ntel XE#2320</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15240/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x85.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-10/igt@kms_feature_discovery@display-4x.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Inte=
l XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7344">Intel XE#7344</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_feature_discovery@display-4x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@k=
ms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-slowdraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-slowdr=
aw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6703">Intel XE#6703</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shr=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
1">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7061">Intel XE#7061</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@f=
bchdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw=
-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuf=
fer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcps=
r-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15240/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-=
argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911=
">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7378">Intel XE#7378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912=
">Intel XE#6912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7375">Intel XE#7375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8=
888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifi=
er-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_plane@pixel=
-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15240/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-=
factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@k=
ms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">In=
tel XE#7760</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_pm_backlight@fade.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15240/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE=
#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7402">Intel XE#7402</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuo=
us-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1489">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exc=
eed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15240/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-3/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15240/shard-bmg-2/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-9/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7795">Intel XE#7795</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">=
Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_rotation_crc@primary-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-plane.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6503">Intel XE#6503</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_15240/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter=
-with-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-6/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE=
#7636</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15240/shard-bmg-2/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/i=
gt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-inv=
alidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-u=
serptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-imm.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/713=
6">Intel XE#7136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-imm.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-close-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-close-fd.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874=
">Intel XE#6874</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-close-fd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
138">Intel XE#7138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15240/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-reb=
ind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-8/igt@xe_page_reclaim@binds-large-split.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Inte=
l XE#7793</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15240/shard-bmg-2/igt@xe_page_reclaim@binds-large-split.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-1/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Inte=
l XE#7590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15240/shard-bmg-2/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-4/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel =
XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_peer2peer@read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">=
Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7417">Intel XE#7417</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15240/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8937/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">In=
tel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15240/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">=
Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8937 -&gt; IGTPW_15240</li>
<li>Linux: xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b -&gt; xe-5127-6=
b6931ea69504481efd3df1cc99765141feb178c</li>
</ul>
<p>IGTPW_15240: 15240<br />
  IGT_8937: 8937<br />
  xe-5124-04d475020800d0a1033ca89a0d6d5fc638ddc65b: 04d475020800d0a1033ca89=
a0d6d5fc638ddc65b<br />
  xe-5127-6b6931ea69504481efd3df1cc99765141feb178c: 6b6931ea69504481efd3df1=
cc99765141feb178c</p>

</body>
</html>

--===============6941698670319491743==--
