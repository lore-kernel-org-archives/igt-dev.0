Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B72C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 10:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE63389664;
	Fri,  3 Jul 2026 10:20:12 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A46A10F76C;
 Fri,  3 Jul 2026 10:19:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6689557769764265933=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Enable_multi-format_testin?=
 =?utf-8?q?g_for_pipe_color_tests_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Jul 2026 10:19:44 -0000
Message-ID: <178307398435.147660.7187331151519660563@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260702082323.3398022-1-pranay.samala@intel.com>
In-Reply-To: <20260702082323.3398022-1-pranay.samala@intel.com>
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

--===============6689557769764265933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable multi-format testing for pipe color tests (rev4)
URL   : https://patchwork.freedesktop.org/series/167634/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8990_FULL -> XEIGTPW_15460_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15460_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15460_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15460_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][1] +199 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv.html

  * igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][2] +89 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-6/igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv.html

  * igt@kms_color@degamma:
    - shard-lnl:          [PASS][3] -> [FAIL][4] +10 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-lnl-7/igt@kms_color@degamma.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-3/igt@kms_color@degamma.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +10 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html

  
New tests
---------

  New tests have been introduced between XEIGT_8990_FULL and XEIGTPW_15460_FULL:

### New IGT tests (658) ###

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.83] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.20] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.10] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.31] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.14] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.60] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [8.05] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.31] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.36] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.68] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.01] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.15] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.85] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.11] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.22] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.19] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.54] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [7.98] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.85] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.37] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.67] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.04] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.01] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.10] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.79] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.12] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.09] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.30] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.01] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.55] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [7.77] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.72] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.09] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.67] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.02] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.04] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.12] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.79] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.14] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.11] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.21] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.66] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.03] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.10] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.32] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.71] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [8.12] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.14] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.43] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.38] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.54] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [8.09] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.31] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.97] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.65] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [7.72] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.66] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.03] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.62] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [11.95] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.68] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [5.72] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.67] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.68] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [11.82] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.66] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [6.53] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.71] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.03] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [12.01] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [6.23] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.29] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.03] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.72] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.15] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.23] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.74] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.87] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.71] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.09] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.22] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.91] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.23] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.18] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.14] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.09] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.22] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.93] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.20] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.18] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.95] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.10] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.24] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.82] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.07] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.22] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.93] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.20] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.15] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.24] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.88] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.71] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.73] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.18] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.29] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.22] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.68] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.92] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.19] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.35] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.14] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.23] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.86] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.18] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.07] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.04] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.11] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.24] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.23] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.19] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.95] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.19] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.07] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.71] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.09] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.06] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.13] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.08] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.71] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.08] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.09] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.08] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.07] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.07] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.00] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.11] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.08] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.03] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.08] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.08] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.74] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.71] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.04] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.70] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.07] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.04] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.08] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.07] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.04] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.05] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.32] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.15] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.22] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.84] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.75] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.30] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.19] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.37] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.09] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.23] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.81] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.21] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.16] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.88] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.59] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.21] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.72] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.56] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.09] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.19] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.46] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.11] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.21] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.84] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.38] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.19] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.08] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.69] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.79] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.04] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.21] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.25] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.00] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.03] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.48] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.32] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.12] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.27] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.57] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.77] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.37] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [3.24] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.90] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.75] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.25] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.00] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.03] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.51] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.33] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.11] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.07] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.10] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.61] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.75] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.20] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.16] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [3.07] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.86] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.22] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.05] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.04] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.46] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.82] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.35] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.14] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.09] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.58] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.46] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.01] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.22] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.49] s

  * igt@kms_color@degamma@pipe-a-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_color@degamma@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@degamma@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.13] s

  * igt@kms_color@degamma@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.06] s

  * igt@kms_color@degamma@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_color@degamma@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_color@degamma@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@degamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.68] s

  * igt@kms_color@degamma@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.77] s

  * igt@kms_color@degamma@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_color@degamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_color@degamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.78] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.03] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_color@degamma@pipe-b-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.83] s

  * igt@kms_color@degamma@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@degamma@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.08] s

  * igt@kms_color@degamma@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_color@degamma@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@degamma@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_color@degamma@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_color@degamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.68] s

  * igt@kms_color@degamma@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.77] s

  * igt@kms_color@degamma@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_color@degamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_color@degamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.01] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_color@degamma@pipe-c-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@degamma@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@degamma@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.07] s

  * igt@kms_color@degamma@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_color@degamma@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@degamma@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_color@degamma@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_color@degamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@degamma@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.75] s

  * igt@kms_color@degamma@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_color@degamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  * igt@kms_color@degamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.07] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.06] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_color@degamma@pipe-d-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@degamma@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@degamma@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.12] s

  * igt@kms_color@degamma@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.06] s

  * igt@kms_color@degamma@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_color@degamma@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.07] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.03] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_color@gamma@pipe-a-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [2.03] s

  * igt@kms_color@gamma@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@gamma@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.12] s

  * igt@kms_color@gamma@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.04] s

  * igt@kms_color@gamma@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_color@gamma@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_color@gamma@pipe-a-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_color@gamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.72] s

  * igt@kms_color@gamma@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.74] s

  * igt@kms_color@gamma@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_color@gamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_color@gamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [1.79] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.10] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.02] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.17] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@gamma@pipe-b-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@gamma@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@gamma@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.04] s

  * igt@kms_color@gamma@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.05] s

  * igt@kms_color@gamma@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@gamma@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_color@gamma@pipe-b-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.80] s

  * igt@kms_color@gamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.70] s

  * igt@kms_color@gamma@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.75] s

  * igt@kms_color@gamma@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_color@gamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_color@gamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [1.76] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.59] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.18] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.92] s

  * igt@kms_color@gamma@pipe-c-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_color@gamma@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@gamma@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.08] s

  * igt@kms_color@gamma@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.06] s

  * igt@kms_color@gamma@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@gamma@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_color@gamma@pipe-c-edp-1-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@gamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@gamma@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@gamma@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_color@gamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_color@gamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.51] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [1.79] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.87] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.16] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@gamma@pipe-d-dp-2-fp16:
    - Statuses : 1 pass(s)
    - Exec time: [1.79] s

  * igt@kms_color@gamma@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@gamma@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.06] s

  * igt@kms_color@gamma@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.03] s

  * igt@kms_color@gamma@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@gamma@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-fp16:
    - Statuses : 1 fail(s)
    - Exec time: [1.78] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.52] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.03] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.16] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.68] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15460_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#7445])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-8/igt@intel_hwmon@hwmon-write.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#607] / [Intel XE#7361])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7679])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          [PASS][14] -> [INCOMPLETE][15] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#3432])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2252])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-4/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6507])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2390] / [Intel XE#6974])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#4354] / [Intel XE#7386])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-5/igt@kms_dp_link_training@uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4354] / [Intel XE#7386])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#8265])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][27] -> [FAIL][28] ([Intel XE#3321]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1421])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-3/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1397] / [Intel XE#7385])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6312] / [Intel XE#651])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#656] / [Intel XE#7905]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#6312])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4141]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2311]) +14 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2313]) +12 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7905]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7061])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6901])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#6901])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2486])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7283])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#4608])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#4608] / [Intel XE#7304])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1489]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-9/igt@kms_psr@psr-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [PASS][51] -> [SKIP][52] ([Intel XE#8361])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-lnl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#3904] / [Intel XE#7342])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7636]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-9/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7636]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#6540] / [Intel XE#688])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-5/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][58] -> [INCOMPLETE][59] ([Intel XE#6321] / [Intel XE#8355])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#7482]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-6/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1392]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#8374])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-2/igt@xe_exec_fault_mode@many-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8374]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#8364]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#8364]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-6/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-media:
    - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#7850])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#8369])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-5/igt@xe_exec_reset@multi-queue-close-execqueues.html
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#8369])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-7/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_system_allocator@threads-many-mmap-file-mlock:
    - shard-lnl:          [PASS][71] -> [ABORT][72] ([Intel XE#8007])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-mmap-file-mlock.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-6/igt@xe_exec_system_allocator@threads-many-mmap-file-mlock.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#8378]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-bmg:          [PASS][74] -> [ABORT][75] ([Intel XE#8007]) +2 other tests abort
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#6964]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#7590])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@xe_pat@xa-app-transient-media-on.html
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7590] / [Intel XE#7772])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-8/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#944]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7174])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-8/igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#7992])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_vm@overcommit-nonfault-vram-no-lr:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#7892])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-4/igt@xe_vm@overcommit-nonfault-vram-no-lr.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][84] ([Intel XE#7571]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][86] ([Intel XE#301]) -> [PASS][87] +2 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@xe_exec_system_allocator@twice-large-free-race:
    - shard-lnl:          [ABORT][88] ([Intel XE#8007]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-lnl-1/igt@xe_exec_system_allocator@twice-large-free-race.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-4/igt@xe_exec_system_allocator@twice-large-free-race.html

  * igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:
    - shard-bmg:          [ABORT][90] ([Intel XE#8007]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][92] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][93] ([Intel XE#3544])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][94] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][95] ([Intel XE#2426] / [Intel XE#5848])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8990 -> IGTPW_15460
  * Linux: xe-5331-4343c63c6acc14ed4d48dddaa56057663651d9e3 -> xe-5332-6c22844c120534560afc258f95a774245b4ef7e3

  IGTPW_15460: 64165c674d05378af8132bcd518534fbc43fd05f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8990: 8990
  xe-5331-4343c63c6acc14ed4d48dddaa56057663651d9e3: 4343c63c6acc14ed4d48dddaa56057663651d9e3
  xe-5332-6c22844c120534560afc258f95a774245b4ef7e3: 6c22844c120534560afc258f95a774245b4ef7e3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/index.html

--===============6689557769764265933==
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
<tr><td><b>Series:</b></td><td>Enable multi-format testing for pipe color tests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167634/">https://patchwork.freedesktop.org/series/167634/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8990_FULL -&gt; XEIGTPW_15460_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15460_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15460_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15460_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv.html">FAIL</a> +199 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-6/igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv.html">FAIL</a> +89 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-lnl-7/igt@kms_color@degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-3/igt@kms_color@degamma.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8990_FULL and XEIGTPW_15460_FULL:</p>
<h3>New IGT tests (658)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [12.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
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
<p>igt@kms_color@ctm-max@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
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
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
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
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.46] s</li>
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
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb8888:</p>
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
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-fp16:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-fp16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15460_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-4/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-3/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-9/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-lnl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361">Intel XE#8361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-10/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-9/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-1/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-5/igt@xe_evict@evict-beng-cm-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-6/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-2/igt@xe_exec_fault_mode@many-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-6/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-media:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-5/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-7/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-file-mlock:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-mmap-file-mlock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-6/igt@xe_exec_system_allocator@threads-many-mmap-file-mlock.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-8/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772">Intel XE#7772</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-8/igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-no-lr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-4/igt@xe_vm@overcommit-nonfault-vram-no-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-free-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-lnl-1/igt@xe_exec_system_allocator@twice-large-free-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-lnl-4/igt@xe_exec_system_allocator@twice-large-free-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8990/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15460/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8990 -&gt; IGTPW_15460</li>
<li>Linux: xe-5331-4343c63c6acc14ed4d48dddaa56057663651d9e3 -&gt; xe-5332-6c22844c120534560afc258f95a774245b4ef7e3</li>
</ul>
<p>IGTPW_15460: 64165c674d05378af8132bcd518534fbc43fd05f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8990: 8990<br />
  xe-5331-4343c63c6acc14ed4d48dddaa56057663651d9e3: 4343c63c6acc14ed4d48dddaa56057663651d9e3<br />
  xe-5332-6c22844c120534560afc258f95a774245b4ef7e3: 6c22844c120534560afc258f95a774245b4ef7e3</p>

</body>
</html>

--===============6689557769764265933==--
