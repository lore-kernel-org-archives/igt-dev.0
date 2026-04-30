Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F69FF886F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 06:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3B510E038;
	Thu, 30 Apr 2026 06:16:24 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C637D10F20B;
 Thu, 30 Apr 2026 06:16:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6166226700095091683=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Enable_HDR_in_IGT_Frontbuf?=
 =?utf-8?q?fer_Feature_Tests_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Apr 2026 06:16:10 -0000
Message-ID: <177752977078.27379.5295601775616485738@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260429175205.2327206-1-swati2.sharma@intel.com>
In-Reply-To: <20260429175205.2327206-1-swati2.sharma@intel.com>
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

--===============6166226700095091683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable HDR in IGT Frontbuffer Feature Tests (rev5)
URL   : https://patchwork.freedesktop.org/series/158425/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8879_FULL -> XEIGTPW_15083_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15083_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15083_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15083_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-9/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][3] +462 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][4] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  
New tests
---------

  New tests have been introduced between XEIGT_8879_FULL and XEIGTPW_15083_FULL:

### New IGT tests (586) ###

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-pri-indfb-multidraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-1p-rte:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-pri-indfb-multidraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-indfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-indfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-onoff:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-rte:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-indfb-scaledprimary:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@drrshdr-suspend:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-pri-indfb-multidraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-rte:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-pri-indfb-multidraw:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-indfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-indfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-onoff:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-rte:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-indfb-scaledprimary:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-suspend:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-pri-indfb-multidraw:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-msflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.43] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@fbchdr-1p-rte:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-move:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-msflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-rte:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.67] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-move:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.81] s

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.43] s

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.44] s

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@kms_frontbuffer_tracking@fbchdr-shrfb-scaledprimary:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-pri-indfb-multidraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-pri-indfb-multidraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-onoff:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-indfb-scaledprimary:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-modesetfrombusy:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-shrfb-scaledprimary:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-slowdraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.44] s

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-onoff:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-move:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@hdr-1p-rte:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-move:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-onoff:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-msflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.64] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.62] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-move:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-onoff:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@kms_frontbuffer_tracking@hdr-2p-rte:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-move:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.51] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.54] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.62] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.59] s

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.85] s

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.44] s

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-render:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.70] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-1p-rte:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-move:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-plflip-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-fullscreen:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-rte:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-fullscreen:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-move:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-onoff:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-indfb-scaledprimary:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-blt:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-mmap-wc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-shrfb-scaledprimary:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-slowdraw:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@psrhdr-suspend:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15083_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1466])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2370])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7059] / [Intel XE#7085])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1428] / [Intel XE#7387])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +6 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7679]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7676])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2652]) +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2669] / [Intel XE#3433] / [Intel XE#7389]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2724] / [Intel XE#7449])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#306] / [Intel XE#7358])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2252]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#307] / [Intel XE#6974])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2390] / [Intel XE#6974])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7642]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#309] / [Intel XE#7343]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][32] -> [DMESG-WARN][33] ([Intel XE#5354])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#323] / [Intel XE#6035])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4354] / [Intel XE#5882])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4422] / [Intel XE#7442])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4156] / [Intel XE#7425])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#703] / [Intel XE#7448])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1138] / [Intel XE#7344])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][40] -> [FAIL][41] ([Intel XE#3321])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1421]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][43] ([Intel XE#301]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7179])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7179])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7061]) +35 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4141]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7061] / [Intel XE#7356])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#6312] / [Intel XE#651]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2311]) +179 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#6312]) +86 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#656]) +16 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2313]) +177 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7061]) +26 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#6900] / [Intel XE#7362])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7086] / [Intel XE#7390])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2486])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7283]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7283]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#599] / [Intel XE#7382]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2393])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1489]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#2893] / [Intel XE#7304])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#4608]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2387] / [Intel XE#7429])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#7345])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1406] / [Intel XE#4609])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1406]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#6503]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1499])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_vrr@flip-basic.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#7636]) +10 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7636]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][82] -> [INCOMPLETE][83] ([Intel XE#6321])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#7482]) +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1392]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#7136]) +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#7136]) +11 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#6874]) +17 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#6874]) +11 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#7138]) +8 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-rebind-err:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#7138]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-rebind-err.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#6964]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#6964]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-1/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#7793])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@random:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#7793])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-7/igt@xe_page_reclaim@random.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1420] / [Intel XE#7590])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          NOTRUN -> [FAIL][98] ([Intel XE#7695])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2284] / [Intel XE#7370])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#944]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#4130] / [Intel XE#7366])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-bmg:          [PASS][105] -> [FAIL][106] ([Intel XE#5937]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@xe_sriov_vram@vf-access-after-resize-up.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          [DMESG-WARN][108] ([Intel XE#5354]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][110] ([Intel XE#7571]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][112] ([Intel XE#3321]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][114] ([Intel XE#301]) -> [PASS][115] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race-nomemset:
    - shard-bmg:          [DMESG-FAIL][116] ([Intel XE#6652]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race-nomemset.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc:
    - shard-bmg:          [SKIP][118] ([Intel XE#6703]) -> [PASS][119] +7 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][120] ([Intel XE#6569]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][122] ([Intel XE#6703]) -> [SKIP][123] ([Intel XE#2313])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][124] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][125] ([Intel XE#3544])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-bmg:          [SKIP][126] ([Intel XE#6703]) -> [SKIP][127] ([Intel XE#7283])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-bmg:          [SKIP][128] ([Intel XE#6703]) -> [SKIP][129] ([Intel XE#2234] / [Intel XE#2850])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@kms_psr@fbc-pr-sprite-plane-move.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][130] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][131] ([Intel XE#2509] / [Intel XE#7437])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_threads@threads-multi-queue-fd-rebind:
    - shard-bmg:          [SKIP][132] ([Intel XE#6703]) -> [SKIP][133] ([Intel XE#7138])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([ABORT][134], [PASS][135], [PASS][136], [PASS][137], [SKIP][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][158], [PASS][159], [PASS][160], [PASS][161], [SKIP][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180]) ([Intel XE#2457] / [Intel XE#7405])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-5/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-9/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-9/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-9/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-6/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-6/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-7/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-7/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-1/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-1/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-10/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-10/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-3/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-8/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-8/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-8/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-4/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-4/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-6/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@xe_module_load@load.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7676
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8879 -> IGTPW_15083
  * Linux: xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a -> xe-4951-bc5111f7a4ab2ac93db67c73e8766700798cfc14

  IGTPW_15083: 58cfd2becb7c0c977c3198b9530f88e0e277f172 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a: a53aafc879e9c52b2776089762591d2766a27f0a
  xe-4951-bc5111f7a4ab2ac93db67c73e8766700798cfc14: bc5111f7a4ab2ac93db67c73e8766700798cfc14

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/index.html

--===============6166226700095091683==
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
<tr><td><b>Series:</b></td><td>Enable HDR in IGT Frontbuffer Feature Tests =
(rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/158425/">https://patchwork.freedesktop.org/series/158425/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_15083/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15083/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8879_FULL -&gt; XEIGTPW_15083_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15083_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_15083_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15=
083_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-9/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_15083/shard-bmg-2/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-=
2.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc =
(NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr=
-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +462 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-tiling-y.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8879_FULL and XEIGTPW_15083=
_FULL:</p>
<h3>New IGT tests (586)</h3>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-mmap-wc=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-mmap-wc=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-render:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-rte:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-rte:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-modesetfrombusy:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-slowdraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-suspend:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-mmap=
-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-rend=
er:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-mmap=
-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-rend=
er:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-fullscreen=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-rte:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-rte:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-fullscreen=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-suspend:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-rte:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-rte:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-blt:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-=
wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-rende=
r:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-blt:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-render=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-fullscreen:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-blt:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-blt:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-render=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-render=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-blt:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-fullscreen:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-render=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-blt:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-render=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-render=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-blt:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-w=
c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-render=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-fullscreen:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-modesetfrombusy:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-slowdraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-rte:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-rte:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-rte:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-rte:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-indfb-scaledprimary:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-blt:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-shrfb-scaledprimary:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-slowdraw:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-suspend:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15083_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-=
small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1428">Intel XE#1428</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3=
-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4=
-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7676">Intel XE#7676</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-=
target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#738=
9</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-=
yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resol=
ution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@kms_content_protection@legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-7/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
56">Intel XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/703">Intel XE#703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_flip@2x-wf_vblank-ts-check-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
uv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@kms_flip_scaled_crc@flip-p016-l=
inear-to-p016-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr=
-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +35 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-abg=
r161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +179 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt (NE=
W):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs=
hdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +86 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-=
1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +177 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7086">Intel XE#7086</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7390">Intel XE#7390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/248=
6">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_plane_lowres@tiling-none@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE=
#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_psr@fbc-psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@kms_psr@pr-primary-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_rotation_crc@primary-rotatio=
n-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@kms_vrr@flip-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@xe_eudebug_online@single-step.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7636">Intel XE#7636</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-4/igt@xe_eudebug_online@writes-caching=
-sram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@xe_evict@evict-beng-cm-threads-l=
arge-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_15083/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@xe_exec_balancer@twice-cm-virtua=
l-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-n=
ull-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_exec_basic@multigpu-once-null=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-8/igt@xe_exec_fault_mode@once-multi-qu=
eue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-q=
ueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7136">Intel XE#7136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-pr=
eempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +17 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-p=
reempt-mode-fault-dyn-priority.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@xe_exec_threads@threads-multi-qu=
eue-mixed-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind-err:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-2/igt@xe_exec_threads@threads-multi-qu=
eue-rebind-err.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@xe_multigpu_svm@mgpu-coherency-=
fail-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-1/igt@xe_multigpu_svm@mgpu-pagefault-p=
refetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-10/igt@xe_page_reclaim@basic-mixed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-7/igt@xe_page_reclaim@random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793"=
>Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"=
>Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@xe_pat@pat-sw-hw-compare.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/769=
5">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@xe_pm@d3cold-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@xe_pm_residency@cpg-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-exec-post-te=
rmination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@xe_query@multigpu-query-invalid-=
cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@xe_sriov_auto_provisioning@fair-=
allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-basic.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15083/shard-bmg-7/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937=
">Intel XE#5937</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_15083/shard-lnl-6/igt@xe_sriov_vram@vf-access-after-re=
size-up.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6376">Intel XE#6376</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5354">Intel XE#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-fl=
ip-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571=
">Intel XE#7571</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_15083/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-6/igt@kms_flip@2x-flip-v=
s-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_15083/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-rac=
e-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-=
stride-mmap-free-race-nomemset.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/i=
gt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-race-no=
memset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-shared-alloc-many-stride-=
malloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-share=
d-alloc-many-stride-malloc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@xe_exec=
_system_allocator@threads-shared-vm-shared-alloc-many-stride-malloc.html">P=
ASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-9/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE=
#6569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15083/shard-bmg-3/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3=
374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
44">Intel XE#3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_15083/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">In=
tel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_15083/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-ccs-m=
odifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-2/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_15083/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel =
XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@kms_tiled_displa=
y@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8879/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-rebind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-=
fd-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8879/shard-bmg-5/igt@xe_module_load@load.html">ABORT</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGT_8879/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8879/shard-bmg-2/igt@xe_module_load@load.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8879/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-9/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8879/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8879/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8879/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard=
-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-10/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_887=
9/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-3/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
_8879/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8879/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8879/shard-bmg-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8879/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">In=
tel XE#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_15083/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15083/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083=
/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_15083/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_15083/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-10=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_15083/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_15083/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_15083/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bm=
g-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15083=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_15083/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8879 -&gt; IGTPW_15083</li>
<li>Linux: xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a -&gt; xe-4951-b=
c5111f7a4ab2ac93db67c73e8766700798cfc14</li>
</ul>
<p>IGTPW_15083: 58cfd2becb7c0c977c3198b9530f88e0e277f172 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4948-a53aafc879e9c52b2776089762591d2766a27f0a: a53aafc879e9c52b2776089=
762591d2766a27f0a<br />
  xe-4951-bc5111f7a4ab2ac93db67c73e8766700798cfc14: bc5111f7a4ab2ac93db67c7=
3e8766700798cfc14</p>

</body>
</html>

--===============6166226700095091683==--
