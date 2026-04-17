Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196D1F8E4A7
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 04:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DD410E106;
	Fri, 17 Apr 2026 04:34:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7C810E106;
 Fri, 17 Apr 2026 04:34:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8143621420817905576=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_FIXED=5FMATRIX_colorop?=
 =?utf-8?q?_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Apr 2026 04:34:09 -0000
Message-ID: <177640044942.471080.3968717830513291023@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416192700.1579042-1-swati2.sharma@intel.com>
In-Reply-To: <20260416192700.1579042-1-swati2.sharma@intel.com>
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

--===============8143621420817905576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add FIXED_MATRIX colorop tests
URL   : https://patchwork.freedesktop.org/series/165021/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8863_FULL -> XEIGTPW_15004_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15004_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15004_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15004_FULL:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-c-plane-1} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][1] +175 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-6/igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-c-plane-1.html

  * {igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-b-plane-2} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][2] +127 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-4/igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-b-plane-2.html

  * igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  
New tests
---------

  New tests have been introduced between XEIGT_8863_FULL and XEIGTPW_15004_FULL:

### New IGT tests (214) ###

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020:
    - Statuses : 2 skip(s)
    - Exec time: [1.24, 3.12] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601:
    - Statuses : 2 skip(s)
    - Exec time: [1.30, 3.26] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709:
    - Statuses : 2 skip(s)
    - Exec time: [1.28, 3.24] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020:
    - Statuses : 2 skip(s)
    - Exec time: [1.26, 3.23] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020:
    - Statuses : 2 skip(s)
    - Exec time: [1.31, 3.17] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601:
    - Statuses : 2 skip(s)
    - Exec time: [1.20, 3.08] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709:
    - Statuses : 2 skip(s)
    - Exec time: [1.31, 3.09] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020:
    - Statuses : 2 skip(s)
    - Exec time: [1.27, 3.07] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full:
    - Statuses : 2 skip(s)
    - Exec time: [1.29, 3.13] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim:
    - Statuses : 2 skip(s)
    - Exec time: [1.26, 3.21] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full:
    - Statuses : 2 skip(s)
    - Exec time: [1.30, 3.27] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim:
    - Statuses : 2 skip(s)
    - Exec time: [1.22, 3.20] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full:
    - Statuses : 2 skip(s)
    - Exec time: [1.28, 3.29] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim:
    - Statuses : 2 skip(s)
    - Exec time: [1.28, 3.23] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full:
    - Statuses : 2 skip(s)
    - Exec time: [1.29, 3.06] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim:
    - Statuses : 2 skip(s)
    - Exec time: [1.27, 3.11] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-a-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-a-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-a-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-b-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-b-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-b-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-c-plane-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-c-plane-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-c-plane-2:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-d-plane-0:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-d-plane-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-d-plane-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15004_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * {igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7006]) +31 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-3/igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601.html

  * {igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-d-plane-2} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7006]) +31 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-7/igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-d-plane-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#6974])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][14] -> [DMESG-WARN][15] ([Intel XE#5354])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#7571])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7178] / [Intel XE#7351])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#1503])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#7340])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2234] / [Intel XE#2850])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1499])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@kms_vrr@flip-dpms.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-dyn-priority:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#6874])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-dyn-priority.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          [PASS][27] -> [FAIL][28] ([Intel XE#5937]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-9/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][29] -> [DMESG-WARN][30] ([Intel XE#6627] / [Intel XE#7419])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@xe_survivability@runtime-survivability.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][31] ([Intel XE#7445]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@intel_hwmon@hwmon-write.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][33] -> [PASS][34] +3 other tests pass
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][35] ([Intel XE#3321]) -> [PASS][36] +1 other test pass
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][37] ([Intel XE#301]) -> [PASS][38] +3 other tests pass
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_universal_plane@disable-primary-vs-flip:
    - shard-bmg:          [DMESG-WARN][39] ([Intel XE#7725]) -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@kms_universal_plane@disable-primary-vs-flip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@kms_universal_plane@disable-primary-vs-flip.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][41] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][42] +1 other test pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-2/igt@kms_vrr@flipline.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][43] ([Intel XE#2142]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][45] ([Intel XE#6321]) -> [PASS][46] +1 other test pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][47] ([Intel XE#5625]) -> [PASS][48] +1 other test pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][49] ([Intel XE#6569]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][51] ([Intel XE#2312]) -> [SKIP][52] ([Intel XE#2311])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][53] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][54] ([Intel XE#3544])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][55] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][56] ([Intel XE#2426] / [Intel XE#5848])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725


Build changes
-------------

  * IGT: IGT_8863 -> IGTPW_15004
  * Linux: xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454 -> xe-4918-2a1c604bebed8cbbe6aea00f761777eed424dc55

  IGTPW_15004: 39a9ad7dda1d2cfab41342a7f09d0d9011dac556 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454: ff84b38d86b994ebb03d940be1c73a63e231f454
  xe-4918-2a1c604bebed8cbbe6aea00f761777eed424dc55: 2a1c604bebed8cbbe6aea00f761777eed424dc55

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/index.html

--===============8143621420817905576==
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
<tr><td><b>Series:</b></td><td>Add FIXED_MATRIX colorop tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165021/">https://patchwork.freedesktop.org/series/165021/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8863_FULL -&gt; XEIGTPW_15004_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15004_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15004_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15004_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-c-plane-1} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-6/igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-c-plane-1.html">SKIP</a> +175 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-b-plane-2} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-4/igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-b-plane-2.html">SKIP</a> +127 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8863_FULL and XEIGTPW_15004_FULL:</p>
<h3>New IGT tests (214)</h3>
<ul>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.24, 3.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv2020-rgb2020@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.30, 3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.28, 3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv709-rgb709@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.26, 3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-rgb709-rgb2020@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.31, 3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv2020-rgb2020@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.20, 3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv601-rgb601@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.31, 3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv709-rgb709@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.27, 3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.29, 3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.26, 3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.30, 3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-full@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.22, 3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.28, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-full@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.28, 3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.29, 3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-full@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.27, 3.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-a-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-a-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-a-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-b-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-b-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-b-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-c-plane-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-c-plane-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-c-plane-2:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-d-plane-0:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-d-plane-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-yuv-range-correct-yuv-lim@pipe-d-plane-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15004_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-3/igt@kms_color_pipeline@plane-fixed-matrix-lut1d-yuv601-rgb601.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-d-plane-2} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-7/igt@kms_color_pipeline@plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-9/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@xe_survivability@runtime-survivability.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-6/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@kms_universal_plane@disable-primary-vs-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@kms_universal_plane@disable-primary-vs-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-2/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8863/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15004/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8863 -&gt; IGTPW_15004</li>
<li>Linux: xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454 -&gt; xe-4918-2a1c604bebed8cbbe6aea00f761777eed424dc55</li>
</ul>
<p>IGTPW_15004: 39a9ad7dda1d2cfab41342a7f09d0d9011dac556 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454: ff84b38d86b994ebb03d940be1c73a63e231f454<br />
  xe-4918-2a1c604bebed8cbbe6aea00f761777eed424dc55: 2a1c604bebed8cbbe6aea00f761777eed424dc55</p>

</body>
</html>

--===============8143621420817905576==--
