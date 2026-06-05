Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A120CD6E7B
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 17:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C94B10FCB0;
	Fri,  5 Jun 2026 17:45:41 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57ED10FBC0;
 Fri,  5 Jun 2026 17:45:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7516012454408148043=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Enable_multi-format_testin?=
 =?utf-8?q?g_for_pipe_color_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Jun 2026 17:45:18 -0000
Message-ID: <178068151891.49281.1797913932613028809@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605064103.855630-1-pranay.samala@intel.com>
In-Reply-To: <20260605064103.855630-1-pranay.samala@intel.com>
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

--===============7516012454408148043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable multi-format testing for pipe color tests (rev2)
URL   : https://patchwork.freedesktop.org/series/167634/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8949_FULL -> XEIGTPW_15307_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15307_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15307_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15307_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010 (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][1] +220 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010.html

  * igt@kms_color@ctm-0-75:
    - shard-bmg:          [PASS][2] -> [FAIL][3] +9 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-6/igt@kms_color@ctm-0-75.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_color@ctm-0-75.html

  * igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][4] +89 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv.html

  * igt@kms_color@degamma:
    - shard-lnl:          [PASS][5] -> [FAIL][6] +10 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-7/igt@kms_color@degamma.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_color@degamma.html

  
New tests
---------

  New tests have been introduced between XEIGT_8949_FULL and XEIGTPW_15307_FULL:

### New IGT tests (588) ###

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.80] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.15] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.05] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.72] s

  * igt@kms_color@ctm-0-25@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.26] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.12] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.55] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [8.01] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.13] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.27] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.65] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.98] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [14.97] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.98] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.77] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.13] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.07] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.16] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.14] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.62] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [7.89] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [5.03] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.21] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.62] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.96] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [14.96] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.99] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.74] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.02] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.06] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.13] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.98] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.52] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [7.87] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.63] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.17] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.66] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.98] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [14.98] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.14] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.84] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.11] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.05] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-0-25@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.17] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.63] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.96] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [14.98] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.98] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.79] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.11] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.05] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.28] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.28] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.54] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [7.81] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.17] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.05] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.60] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.96] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [14.97] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.02] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.78] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.05] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.03] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.24] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [8.24] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.60] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [8.09] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.88] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [8.33] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.64] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.22] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [14.99] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.03] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.78] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.10] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.06] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.15] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [7.98] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [8.42] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [7.89] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [4.67] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [7.97] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.62] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.91] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [14.97] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.25] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.76] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.08] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [15.05] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-0-50@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.17] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.63] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [4.96] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [14.98] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.07] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.29] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.15] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.02] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.35] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [6.01] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.56] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [11.96] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [5.67] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.38] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.12] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.91] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.67] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.26] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.28] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.01] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.96] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.52] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [12.02] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.68] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [6.41] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.56] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.10] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.99] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.64] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.31] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.14] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.92] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [11.09] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [11.86] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [6.24] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [11.19] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.09] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.92] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.76] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.34] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [7.11] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.02] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.02] s

  * igt@kms_color@ctm-0-75@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.86] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [5.11] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [6.95] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [5.71] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.72] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.56] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.72] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.08] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.18] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-green-to-red@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.90] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.68] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.33] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-green-to-red@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.27] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.74] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.97] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.71] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.00] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.03] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.18] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-green-to-red@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_color@ctm-green-to-red@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.09] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.54] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-green-to-red@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.66] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.07] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.08] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_color@ctm-max@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.74] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.72] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-max@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.72] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.03] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.02] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-max@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.78] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.71] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-max@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.03] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.02] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-max@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.64] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.68] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@ctm-max@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.03] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-max@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.08] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-negative@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.59] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.70] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.00] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb8888:
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
    - Exec time: [1.04] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-negative@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.75] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.57] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.01] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-negative@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.72] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.61] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.03] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.02] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-negative@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.96] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.05] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.92] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.62] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.75] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.61] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.69] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.33] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.18] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.03] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.66] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.89] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.40] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.05] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.17] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.73] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.59] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.24] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.0] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.15] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.82] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.92] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.03] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.02] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.83] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [3.13] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.58] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.05] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.22] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_color@ctm-signed@pipe-a-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.54] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.82] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.20] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.41] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.85] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.38] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.95] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.15] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.39] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.65] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.05] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.21] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.48] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.96] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.16] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.28] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_color@ctm-signed@pipe-b-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.83] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.15] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.96] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.97] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.40] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.63] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.06] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.04] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.08] s

  * igt@kms_color@ctm-signed@pipe-c-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.46] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [4.83] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [5.12] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.18] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [4.83] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.16] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.96] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.98] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.01] s

  * igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.45] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.95] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [3.08] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [10.21] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_color@ctm-signed@pipe-d-dp-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.48] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [3.92] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.94] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [9.97] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.44] s

  * igt@kms_color@degamma@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@degamma@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.08] s

  * igt@kms_color@degamma@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.00] s

  * igt@kms_color@degamma@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_color@degamma@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_color@degamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.73] s

  * igt@kms_color@degamma@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.65] s

  * igt@kms_color@degamma@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.67] s

  * igt@kms_color@degamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_color@degamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.97] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_color@degamma@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@degamma@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.01] s

  * igt@kms_color@degamma@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.00] s

  * igt@kms_color@degamma@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@degamma@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_color@degamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.50] s

  * igt@kms_color@degamma@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.77] s

  * igt@kms_color@degamma@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_color@degamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@degamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.97] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_color@degamma@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@degamma@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@degamma@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.00] s

  * igt@kms_color@degamma@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@degamma@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_color@degamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.59] s

  * igt@kms_color@degamma@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.74] s

  * igt@kms_color@degamma@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.69] s

  * igt@kms_color@degamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_color@degamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.98] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.97] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_color@degamma@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@degamma@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.01] s

  * igt@kms_color@degamma@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.00] s

  * igt@kms_color@degamma@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@degamma@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.71] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.97] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@gamma@pipe-a-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.74] s

  * igt@kms_color@gamma@pipe-a-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.03] s

  * igt@kms_color@gamma@pipe-a-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_color@gamma@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_color@gamma@pipe-a-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.87] s

  * igt@kms_color@gamma@pipe-a-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.55] s

  * igt@kms_color@gamma@pipe-a-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.71] s

  * igt@kms_color@gamma@pipe-a-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_color@gamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_color@gamma@pipe-a-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.85] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.96] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [2.23] s

  * igt@kms_color@gamma@pipe-b-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.73] s

  * igt@kms_color@gamma@pipe-b-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.99] s

  * igt@kms_color@gamma@pipe-b-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_color@gamma@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@gamma@pipe-b-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@gamma@pipe-b-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.56] s

  * igt@kms_color@gamma@pipe-b-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [2.46] s

  * igt@kms_color@gamma@pipe-b-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_color@gamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_color@gamma@pipe-b-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.58] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.35] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.95] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.11] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.79] s

  * igt@kms_color@gamma@pipe-c-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@gamma@pipe-c-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.00] s

  * igt@kms_color@gamma@pipe-c-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_color@gamma@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@gamma@pipe-c-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_color@gamma@pipe-c-edp-1-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [1.56] s

  * igt@kms_color@gamma@pipe-c-edp-1-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.63] s

  * igt@kms_color@gamma@pipe-c-edp-1-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_color@gamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_color@gamma@pipe-c-edp-1-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [2.24] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [5.11] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.80] s

  * igt@kms_color@gamma@pipe-d-dp-2-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.76] s

  * igt@kms_color@gamma@pipe-d-dp-2-p010:
    - Statuses : 1 fail(s)
    - Exec time: [1.0] s

  * igt@kms_color@gamma@pipe-d-dp-2-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.98] s

  * igt@kms_color@gamma@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@gamma@pipe-d-dp-2-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.82] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-nv12:
    - Statuses : 1 fail(s)
    - Exec time: [0.84] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-p010:
    - Statuses : 1 fail(s)
    - Exec time: [0.97] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [4.95] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@gamma@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.77] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma@pipe-a-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@legacy-gamma@pipe-b-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_color@legacy-gamma@pipe-b-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_color@legacy-gamma@pipe-c-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_color@legacy-gamma@pipe-c-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@legacy-gamma@pipe-d-dp-2-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@legacy-gamma@pipe-d-hdmi-a-3-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15307_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#3718] / [Intel XE#6078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#6078])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3658] / [Intel XE#7360])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652]) +17 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2325] / [Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#373]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6974])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7642]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2321] / [Intel XE#7355])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1424]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#7571])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1508])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#4354] / [Intel XE#7450])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2244])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2244])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-9/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4156] / [Intel XE#7425])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1421]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#301])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7178] / [Intel XE#7351])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7178] / [Intel XE#7349])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2311]) +27 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4141]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#656] / [Intel XE#7905]) +18 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1469] / [Intel XE#7399])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2352] / [Intel XE#7399])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6312] / [Intel XE#651]) +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#6312]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7399])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7905]) +21 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7061]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7061]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2313]) +26 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7865]) +8 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#6911] / [Intel XE#7466])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7283]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7283]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#599])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#3307])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7339])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7794])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#7340])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#4608])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#4608] / [Intel XE#7304])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1489]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2387] / [Intel XE#7429])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1406]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1406] / [Intel XE#7345])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#4609])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#3904] / [Intel XE#7342])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1499])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1499])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#7636]) +8 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#7636]) +7 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-9/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_evict@evict-beng-small:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#6540] / [Intel XE#688]) +5 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-8/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-cm-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#7140]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@xe_evict@evict-cm-threads-small-multi-queue.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][88] -> [INCOMPLETE][89] ([Intel XE#6321])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#7482]) +8 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1392]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#7136]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#7136]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#6874]) +13 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#6874]) +14 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_reset@cm-multi-queue-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#7866])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-close-fd.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][98] ([Intel XE#7098] / [Intel XE#8159])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#7138]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#7138]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2833])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#6964]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#6964]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html

  * igt@xe_non_msix@walker-interrupt-notification-non-msix:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#7622])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@xe_non_msix@walker-interrupt-notification-non-msix.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#7622])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@xe_non_msix@walker-interrupt-notification-non-msix.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#7793])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#7590] / [Intel XE#977])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2236] / [Intel XE#7590])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#7590] / [Intel XE#7772])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#5694] / [Intel XE#7370])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_pm@d3cold-i2c.html
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#5694] / [Intel XE#7370])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3hot-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#7271])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4733] / [Intel XE#7417])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#944])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#944])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:
    - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#7992]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-10/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#4130] / [Intel XE#7366])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [PASS][121] -> [FAIL][122] ([Intel XE#6569])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_vram@vf-access-after-resize-down:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_sriov_vram@vf-access-after-resize-down.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][124] ([Intel XE#7571]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][126] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][128] ([Intel XE#301]) -> [PASS][129] +2 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][130] ([Intel XE#1503]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][132] ([Intel XE#7922]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][134] ([Intel XE#7915]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-8/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-4/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][136] ([Intel XE#6321]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [ABORT][138] ([Intel XE#8007]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][140] ([Intel XE#6569]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][142] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-4/igt@xe_survivability@runtime-survivability.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-lnl:          [SKIP][144] ([Intel XE#1421]) -> [ABORT][145] ([Intel XE#8007])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][146] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][147] ([Intel XE#301])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7339
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8949 -> IGTPW_15307
  * Linux: xe-5207-ed1c8c8922a428dd31ab24a6654ab61b97939bd5 -> xe-5208-e3821511385af9b3b404fe878418937eec48de9f

  IGTPW_15307: 15307
  IGT_8949: 8949
  xe-5207-ed1c8c8922a428dd31ab24a6654ab61b97939bd5: ed1c8c8922a428dd31ab24a6654ab61b97939bd5
  xe-5208-e3821511385af9b3b404fe878418937eec48de9f: e3821511385af9b3b404fe878418937eec48de9f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/index.html

--===============7516012454408148043==
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
<tr><td><b>Series:</b></td><td>Enable multi-format testing for pipe color tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167634/">https://patchwork.freedesktop.org/series/167634/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8949_FULL -&gt; XEIGTPW_15307_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15307_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15307_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15307_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010 (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010.html">FAIL</a> +220 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-6/igt@kms_color@ctm-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_color@ctm-0-75.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv.html">FAIL</a> +89 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-7/igt@kms_color@degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_color@degamma.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8949_FULL and XEIGTPW_15307_FULL:</p>
<h3>New IGT tests (588)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.98] s</li>
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
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
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
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.60] s</li>
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
<li>Exec time: [4.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
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
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [8.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.97] s</li>
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
<li>Exec time: [4.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [14.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.07] s</li>
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
<p>igt@kms_color@ctm-0-75@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [12.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [11.19] s</li>
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
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.02] s</li>
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
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [6.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.71] s</li>
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
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
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
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.90] s</li>
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
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
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
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
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
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.54] s</li>
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
<p>igt@kms_color@ctm-green-to-red@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.17] s</li>
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
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
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
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
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
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
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
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
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
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
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
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
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
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
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
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
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
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
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
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-3-xrgb8888:</p>
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
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-2-xrgb8888:</p>
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
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.57] s</li>
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
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
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
<li>Exec time: [1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.61] s</li>
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
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
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
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.92] s</li>
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
<li>Exec time: [1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
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
<li>Exec time: [4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
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
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
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
<li>Exec time: [2.50] s</li>
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
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
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
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
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
<p>igt@kms_color@degamma@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
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
<p>igt@kms_color@degamma@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
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
<p>igt@kms_color@gamma@pipe-a-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.55] s</li>
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
<p>igt@kms_color@gamma@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
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
<p>igt@kms_color@gamma@pipe-b-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-edp-1-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-dp-2-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-nv12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-p010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-dp-2-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-hdmi-a-3-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15307_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450">Intel XE#7450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-9/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7339">Intel XE#7339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-9/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-8/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-5/igt@xe_evict@evict-cm-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_non_msix@walker-interrupt-notification-non-msix:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-1/igt@xe_non_msix@walker-interrupt-notification-non-msix.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622">Intel XE#7622</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@xe_non_msix@walker-interrupt-notification-non-msix.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7622">Intel XE#7622</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772">Intel XE#7772</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@xe_pm_residency@aspm_link_residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271">Intel XE#7271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-10/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-down:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-6/igt@xe_sriov_vram@vf-access-after-resize-down.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-8/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-4/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-bmg-4/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-bmg-10/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8949/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15307/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8949 -&gt; IGTPW_15307</li>
<li>Linux: xe-5207-ed1c8c8922a428dd31ab24a6654ab61b97939bd5 -&gt; xe-5208-e3821511385af9b3b404fe878418937eec48de9f</li>
</ul>
<p>IGTPW_15307: 15307<br />
  IGT_8949: 8949<br />
  xe-5207-ed1c8c8922a428dd31ab24a6654ab61b97939bd5: ed1c8c8922a428dd31ab24a6654ab61b97939bd5<br />
  xe-5208-e3821511385af9b3b404fe878418937eec48de9f: e3821511385af9b3b404fe878418937eec48de9f</p>

</body>
</html>

--===============7516012454408148043==--
