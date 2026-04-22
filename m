Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4002FF94CA2
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 01:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0C510EE16;
	Wed, 22 Apr 2026 01:28:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E6910EE16;
 Wed, 22 Apr 2026 01:27:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3157846801230479617=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/kms=5Fcolor=3A_Add_m?=
 =?utf-8?q?ulti-format_coverage_for_pipe_color_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 Apr 2026 01:27:51 -0000
Message-ID: <177682127134.484273.11728101928238661188@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260420162239.3450203-1-pranay.samala@intel.com>
In-Reply-To: <20260420162239.3450203-1-pranay.samala@intel.com>
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

--===============3157846801230479617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Add multi-format coverage for pipe color tests
URL   : https://patchwork.freedesktop.org/series/165178/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8865_FULL -> XEIGTPW_15023_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15023_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15023_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15023_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12} (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][1] +141 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12.html

  * igt@kms_color@ctm-negative:
    - shard-lnl:          [PASS][2] -> [FAIL][3] +9 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-lnl-8/igt@kms_color@ctm-negative.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-lnl-4/igt@kms_color@ctm-negative.html

  * {igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv} (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][4] +57 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-lnl-6/igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv.html

  * igt@kms_color@gamma:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +6 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@kms_color@gamma.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_color@gamma.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][7] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
New tests
---------

  New tests have been introduced between XEIGT_8865_FULL and XEIGTPW_15023_FULL:

### New IGT tests (324) ###

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.68] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.10] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.49] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.88] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.71] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.06] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.51] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.88] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.68] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.04] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.56] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.88] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.71] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.06] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.50] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.92] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.68] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.15] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.10] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [4.13] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.30] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.53] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.89] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.69] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.07] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.26] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [4.74] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.97] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.58] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.94] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.67] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.05] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.95] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [4.67] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.98] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.55] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.90] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.69] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.07] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.50] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.93] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.16] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.76] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.30] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [5.83] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.21] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.97] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.45] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.66] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.19] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [6.43] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.48] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.96] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.44] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.14] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.94] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.64] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.16] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [6.21] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.10] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.97] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.45] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.15] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.95] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.65] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.97] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.47] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.22] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.54] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.13] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.06] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.19] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.93] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.23] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.37] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.02] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.27] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.23] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.70] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.12] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.84] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.30] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.12] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.61] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.87] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.70] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.52] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.51] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.44] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.49] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.72] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.69] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.05] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.47] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.84] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.82] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.54] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.35] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.20] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.45] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.88] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [3.15] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.93] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.55] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.33] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.20] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.42] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.69] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.91] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.90] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.33] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.72] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.45] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.48] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.33] s

  * igt@kms_color@degamma@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@degamma@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_color@degamma@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@degamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@degamma@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_color@degamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.71] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@degamma@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@degamma@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@degamma@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@degamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@degamma@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_color@degamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.71] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@degamma@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@degamma@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@degamma@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@degamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@degamma@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@degamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.61] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.71] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@degamma@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@degamma@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@degamma@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.70] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@gamma@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@gamma@pipe-a-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@gamma@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_color@gamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.54] s

  * igt@kms_color@gamma@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_color@gamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.68] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_color@gamma@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.13] s

  * igt@kms_color@gamma@pipe-b-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@gamma@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.58] s

  * igt@kms_color@gamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.56] s

  * igt@kms_color@gamma@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_color@gamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.63] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.75] s

  * igt@kms_color@gamma@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.02] s

  * igt@kms_color@gamma@pipe-c-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@gamma@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@gamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.49] s

  * igt@kms_color@gamma@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@gamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.03] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@gamma@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.44] s

  * igt@kms_color@gamma@pipe-d-dp-2-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@gamma@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.17] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.56] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-nv12:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-rgb:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15023_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#607] / [Intel XE#7361])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#610] / [Intel XE#7387])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367] / [Intel XE#7354])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#6974])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2320]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2321] / [Intel XE#7355])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1340] / [Intel XE#7435])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4331] / [Intel XE#7227])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2244]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2372] / [Intel XE#7359])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#301]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3:
    - shard-bmg:          [PASS][27] -> [ABORT][28] ([Intel XE#5545] / [Intel XE#6652]) +1 other test abort
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7349])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2311]) +22 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4141]) +15 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2313]) +19 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6911] / [Intel XE#7466])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4090] / [Intel XE#7443])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7283])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#5020] / [Intel XE#7348])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2938] / [Intel XE#7376])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1489]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2387] / [Intel XE#7429])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1435])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6503]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_sharpness_filter@filter-tap.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1499]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_vrr@flip-suspend.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7636]) +14 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@xe_eudebug@vma-ufence.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7140])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7136]) +11 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#6874]) +24 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7138]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6281] / [Intel XE#7426])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75]) -> ([PASS][76], [PASS][77], [DMESG-WARN][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [DMESG-WARN][89], [PASS][90], [PASS][91], [PASS][92], [SKIP][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7725])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-9/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-3/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-3/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-2/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-7/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-2/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-7/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-9/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-6/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-6/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#6964]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_non_msix@walker-interrupt-notification-non-msix:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#7622])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_non_msix@walker-interrupt-notification-non-msix.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2284] / [Intel XE#7370])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#7599])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#944])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][104] -> [FAIL][105] ([Intel XE#6569])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][106] ([Intel XE#5545])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][107] ([Intel XE#7571]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@xe_prime_self_import@export-vs-gem_close-race:
    - shard-bmg:          [DMESG-WARN][109] ([Intel XE#7725]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_prime_self_import@export-vs-gem_close-race.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_prime_self_import@export-vs-gem_close-race.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][111] ([Intel XE#6569]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [INCOMPLETE][113] ([Intel XE#2594] / [Intel XE#5643]) -> [SKIP][114] ([Intel XE#1124])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][115] ([Intel XE#3544]) -> [SKIP][116] ([Intel XE#3374] / [Intel XE#3544])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8865 -> IGTPW_15023
  * Linux: xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469 -> xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169

  IGTPW_15023: d3ebe2af896d7192b07def82e8842bd574a18d82 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8865: 1c23bc1bdf01bf0ded2344cb217d7fe88de3b726 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469: 898b5aa235c5b269d6c745fd84270b296aa75469
  xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169: 33d3b65ec51f2bddafa26a80249e26c78435f169

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/index.html

--===============3157846801230479617==
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
or pipe color tests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/165178/">https://patchwork.freedesktop.org/series/165178/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15023/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15023/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8865_FULL -&gt; XEIGTPW_15023_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15023_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15023_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
023_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_color@ctm-green-to-red@pipe-=
c-dp-2-nv12.html">FAIL</a> +141 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-lnl-8/igt@kms_color@ctm-negative.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-lnl-4/ig=
t@kms_color@ctm-negative.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-lnl-6/igt@kms_color@ctm-signed@pipe-c-edp-=
1-yuyv.html">FAIL</a> +57 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-1/igt@kms_color@gamma.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_c=
olor@gamma.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8865_FULL and XEIGTPW_15023=
_FULL:</p>
<h3>New IGT tests (324)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.68] s</li>
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
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.54] s</li>
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
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
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
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.19] s</li>
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
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
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
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
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
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
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
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
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
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.57] s</li>
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
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
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
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
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
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
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
<p>igt@kms_color@degamma@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
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
<p>igt@kms_color@degamma@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
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
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.61] s</li>
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
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
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
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
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
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-rgb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15023_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-=
offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/607">Intel XE#607</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/610">Intel XE#610</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_bw@linear-tiling-3-displays=
-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_ccs@bad-aux-stride-yf-tiled-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_content_protection@atomic-dp=
ms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other t=
est fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_content_protection@suspend-r=
esume@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) =
+3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_content_protection@uevent.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_cursor_crc@cursor-random-64x=
21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4331">Intel XE#4331</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2372">Intel XE#2372</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_15023/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-10/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
15023/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a3.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">=
Intel XE#5545</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6652">Intel XE#6652</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2=
p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +15 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-ar=
gb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-=
dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2938">Intel XE#2938</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7376">Intel XE#7376</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress-=
no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_psr@fbc-pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@kms_sharpness_filter@filter-tap.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@xe_eudebug@vma-ufence.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">=
Intel XE#7636</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@xe_evict@evict-small-multi-queue=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-qu=
eue-userptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-p=
reempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +24 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@xe_exec_threads@threads-multi-qu=
eue-cm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7138">Intel XE#7138</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@xe_fault_injection@exec-queue-cr=
eate-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8865/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8865/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8865/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8865/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-=
10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGT_8865/shard-bmg-10/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
865/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8865/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8865/shard-bmg-9/igt@xe_module_loa=
d@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15023/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15023/shard-bmg-6/igt@xe_module_load@load.html">DME=
SG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_150=
23/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15023/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/s=
hard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15023/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-6/igt@xe_module=
_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15023/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_15023/shard-bmg-2/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/s=
hard-bmg-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15023/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15023/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#24=
57</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/740=
5">Intel XE#7405</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefault-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_non_msix@walker-interrupt-notification-non-msix:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_non_msix@walker-interrupt-no=
tification-non-msix.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7622">Intel XE#7622</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault=
-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-9/igt@xe_pxp@pxp-termination-key-updat=
e-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_query@multigpu-query-uc-fw-v=
ersion-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-5/ig=
t@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15023/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571=
">Intel XE#7571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15023/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@export-vs-gem_close-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-6/igt@xe_prime_self_import@export-vs-gem_close-race.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7725">Intel XE#7725</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15023/shard-bmg-10/igt@xe_prime_self_import@export-v=
s-gem_close-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel X=
E#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15023/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2594">Intel XE#2594</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15023/shard-bmg-7=
/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8865/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
5023/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8865 -&gt; IGTPW_15023</li>
<li>Linux: xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469 -&gt; xe-4923-3=
3d3b65ec51f2bddafa26a80249e26c78435f169</li>
</ul>
<p>IGTPW_15023: d3ebe2af896d7192b07def82e8842bd574a18d82 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8865: 1c23bc1bdf01bf0ded2344cb217d7fe88de3b726 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4921-898b5aa235c5b269d6c745fd84270b296aa75469: 898b5aa235c5b269d6c745f=
d84270b296aa75469<br />
  xe-4923-33d3b65ec51f2bddafa26a80249e26c78435f169: 33d3b65ec51f2bddafa26a8=
0249e26c78435f169</p>

</body>
</html>

--===============3157846801230479617==--
