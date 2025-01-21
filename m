Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09312C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 11:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BD310E580;
	Tue, 21 Jan 2025 11:29:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1A810E57C;
 Tue, 21 Jan 2025 11:29:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2794226786096072754=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_tests/intel/kms=5Ffrontbuffer=5Ftracking=3A_Skip_fbc-*?=
 =?utf-8?q?_tests_on_BMG_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jan 2025 11:29:06 -0000
Message-ID: <173745894668.2570706.3730078365939658800@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109055652.405793-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250109055652.405793-1-mohammed.thasleem@intel.com>
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

--===============2794226786096072754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v4,1/2] tests/intel/kms_frontbuffer_tracking: Skip fbc-* tests on BMG (rev2)
URL   : https://patchwork.freedesktop.org/series/143304/
State : success

== Summary ==

CI Bug Log - changes from IGT_8198 -> IGTPW_12459
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/index.html

Participating hosts (44 -> 40)
------------------------------

  Missing    (4): bat-apl-1 fi-kbl-guc fi-glk-j4005 fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8198 and IGTPW_12459:

### New IGT tests (103) ###

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-cpu:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-gtt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-pwrite:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@meta_test@fail-result:
    - Statuses : 2 fail(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_12459 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - fi-cfl-guc:         [PASS][1] -> [ABORT][2] ([i915#13551]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/fi-cfl-guc/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-cfl-guc/igt@i915_selftest@live.html
    - fi-cfl-8700k:       [PASS][3] -> [ABORT][4] ([i915#13551]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/fi-cfl-8700k/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-cfl-8700k/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - bat-arlh-2:         NOTRUN -> [SKIP][7] ([i915#11346]) +719 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-arlh-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][8] +719 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-kbl-x1275/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - bat-dg1-6:          NOTRUN -> [SKIP][9] ([i915#12311]) +79 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-dg1-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - fi-ilk-650:         NOTRUN -> [SKIP][10] +170 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-ilk-650/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][11] +138 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - bat-kbl-2:          NOTRUN -> [SKIP][12] +104 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-kbl-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - fi-ivb-3770:        NOTRUN -> [SKIP][13] +197 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-ivb-3770/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][14] ([i915#13534]) +34 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][15] ([i915#11560]) +183 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - fi-hsw-4770:        NOTRUN -> [SKIP][16] +10 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][17] ([i915#9766])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - bat-dg1-6:          NOTRUN -> [SKIP][18] ([i915#12311] / [i915#4342])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-dg1-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][19] ([i915#10070])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - fi-ilk-650:         NOTRUN -> [INCOMPLETE][20] ([i915#13531])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-ilk-650/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@meta_test@fail-result (NEW):
    - bat-arlh-2:         NOTRUN -> [FAIL][21] ([i915#13555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-arlh-2/igt@meta_test@fail-result.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][22] ([i915#13555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-kbl-x1275/igt@meta_test@fail-result.html

  * igt@xe_module_load@load:
    - fi-ivb-3770:        NOTRUN -> [FAIL][23] ([i915#13552])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-ivb-3770/igt@xe_module_load@load.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][24] ([i915#13552])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-hsw-4770/igt@xe_module_load@load.html
    - fi-ilk-650:         NOTRUN -> [FAIL][25] ([i915#13552])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-ilk-650/igt@xe_module_load@load.html
    - bat-mtlp-6:         NOTRUN -> [ABORT][26] ([i915#13553])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-mtlp-6/igt@xe_module_load@load.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][27] ([i915#13552])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-kbl-x1275/igt@xe_module_load@load.html
    - bat-kbl-2:          NOTRUN -> [FAIL][28] ([i915#13552])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-kbl-2/igt@xe_module_load@load.html
    - bat-dg1-6:          NOTRUN -> [DMESG-WARN][29] ([i915#13554])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-dg1-6/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - bat-atsm-1:         [ABORT][30] ([i915#13292]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-atsm-1/igt@i915_module_load@reload.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-atsm-1/igt@i915_module_load@reload.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - bat-arlh-2:         [SKIP][32] ([i915#10200] / [i915#11346] / [i915#11666]) -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html
    - bat-dg1-6:          [SKIP][34] ([i915#12311] / [i915#4212]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-dg1-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-dg1-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-arlh-2:         [SKIP][36] ([i915#10200] / [i915#11346] / [i915#11666] / [i915#12203]) -> [SKIP][37] ([i915#11346] / [i915#12203])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10070
  [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11560]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11560
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#13292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13292
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13531
  [i915#13534]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13534
  [i915#13551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13551
  [i915#13552]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13552
  [i915#13553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13553
  [i915#13554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13554
  [i915#13555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13555
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8198 -> IGTPW_12459
  * Linux: CI_DRM_15978 -> CI_DRM_15982

  CI-20190529: 20190529
  CI_DRM_15978: db09bf4e722f65089b91798e6d490d21b8dd8143 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15982: aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12459: c33d54be70c2115e82190804df90d1bb83939b5d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/index.html

--===============2794226786096072754==
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
<tr><td><b>Series:</b></td><td>series starting with [v4,1/2] tests/intel/kms_frontbuffer_tracking: Skip fbc-* tests on BMG (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143304/">https://patchwork.freedesktop.org/series/143304/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8198 -&gt; IGTPW_12459</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/index.html</p>
<h2>Participating hosts (44 -&gt; 40)</h2>
<p>Missing    (4): bat-apl-1 fi-kbl-guc fi-glk-j4005 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8198 and IGTPW_12459:</p>
<h3>New IGT tests (103)</h3>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-pwrite:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12459 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/fi-cfl-guc/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-cfl-guc/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13551">i915#13551</a>) +1 other test abort</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/fi-cfl-8700k/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-cfl-8700k/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13551">i915#13551</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-arlh-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +719 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-kbl-x1275/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> +719 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-dg1-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-ilk-650/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> +170 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> +138 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-kbl-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-ivb-3770/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +197 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13534">i915#13534</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11560">i915#11560</a>) +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-dg1-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10070">i915#10070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-ilk-650/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13531">i915#13531</a>)</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-arlh-2/igt@meta_test@fail-result.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13555">i915#13555</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-kbl-x1275/igt@meta_test@fail-result.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13555">i915#13555</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-ivb-3770/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13552">i915#13552</a>)</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-hsw-4770/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13552">i915#13552</a>)</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-ilk-650/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13552">i915#13552</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-mtlp-6/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13553">i915#13553</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/fi-kbl-x1275/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13552">i915#13552</a>)</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-kbl-2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13552">i915#13552</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-dg1-6/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13554">i915#13554</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-atsm-1/igt@i915_module_load@reload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13292">i915#13292</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-atsm-1/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">PASS</a> +1 other test pass</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-dg1-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-dg1-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8198/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12459/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8198 -&gt; IGTPW_12459</li>
<li>Linux: CI_DRM_15978 -&gt; CI_DRM_15982</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15978: db09bf4e722f65089b91798e6d490d21b8dd8143 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15982: aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12459: c33d54be70c2115e82190804df90d1bb83939b5d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2794226786096072754==--
