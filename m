Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EB2E77170
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 00:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D1910E02D;
	Fri,  6 Dec 2024 00:47:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BAB10E02D;
 Fri,  6 Dec 2024 00:47:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_prevent_consecutive_unpl?=
 =?utf-8?q?ug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 00:47:29 -0000
Message-ID: <173344604927.3157285.3113376507850075027@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205094052.1259373-1-kunal1.joshi@intel.com>
In-Reply-To: <20241205094052.1259373-1-kunal1.joshi@intel.com>
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

== Series Details ==

Series: prevent consecutive unplug
URL   : https://patchwork.freedesktop.org/series/142152/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8139_full -> IGTPW_12252_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12252_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12252_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12252_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs (NEW):
    - {shard-dg2-9}:      NOTRUN -> [SKIP][1] +11 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][2] +7 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-mc-ccs (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][4] +12 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][5] +7 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs.html

  
New tests
---------

  New tests have been introduced between IGT_8139_full and IGTPW_12252_full:

### New IGT tests (96) ###

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.38] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.29] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.30] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.73] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.63] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.62] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-linear:
    - Statuses : 1 dmesg-warn(s) 1 skip(s)
    - Exec time: [0.16, 2.07] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-x:
    - Statuses : 2 pass(s)
    - Exec time: [2.07, 2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.12, 2.58] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.63] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-2-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.67] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.36] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.28] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.75] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.62] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.65] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-linear:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.17, 2.03] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-x:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [2.05, 2.13] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y:
    - Statuses : 2 pass(s)
    - Exec time: [2.10, 2.53] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.63] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-yf-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.65] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-4-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.23] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.41] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.28] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-dp-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.74] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-linear:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.55] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-yf:
    - Statuses : 1 pass(s)
    - Exec time: [2.66] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-4-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.24] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.35] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.28] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-dp-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.78] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.14] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-edp-1-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.15] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-4-linear:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-4-x:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-4-y:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.25] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.17] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.21] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2-cursor-mmap-gtt@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  

Known issues
------------

  Here are the changes found in IGTPW_12252_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#8414]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-7/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8414]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-3/igt@drm_fdinfo@virtual-busy-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8414]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@gem_create@create-clear:
    - shard-rkl:          [PASS][10] -> [DMESG-WARN][11] ([i915#12964]) +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/shard-rkl-7/igt@gem_create@create-clear.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-1/igt@gem_create@create-clear.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#6335])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#6335])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#6335])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8562])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-3/igt@gem_create@create-ext-set-pat.html
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#8562])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-7/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8562])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#8562])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][19] ([i915#1099]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-snb1/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#8555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@gem_ctx_persistence@hang.html
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@gem_ctx_persistence@hang.html

  * igt@gem_eio@kms:
    - shard-dg2:          NOTRUN -> [FAIL][22] ([i915#5784])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-2/igt@gem_eio@kms.html
    - shard-dg1:          NOTRUN -> [FAIL][23] ([i915#5784])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu-1:       NOTRUN -> [SKIP][24] ([i915#4525])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][25] ([i915#11965]) +4 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-6/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#3539] / [i915#4852])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-before-default.html
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#3539] / [i915#4852])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#3281]) +9 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#3281]) +10 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#3281]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-14/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#3281]) +10 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][32] ([i915#7975] / [i915#8213]) +1 other test abort
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-4/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-rkl:          NOTRUN -> [ABORT][33] ([i915#7975] / [i915#8213]) +2 other tests abort
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          NOTRUN -> [ABORT][34] ([i915#7975] / [i915#8213]) +1 other test abort
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4860]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4860]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4860]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#4613]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-9/igt@gem_lmem_swapping@heavy-random.html
    - shard-glk:          NOTRUN -> [SKIP][39] ([i915#4613]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk5/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4613]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@massive:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4613]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-2/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#12193])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4565])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4083]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@gem_mmap@big-bo.html
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4083]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4077]) +9 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#4083])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-14/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3282]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-12/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3282]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3282]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][51] ([i915#2658])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-9/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][52] ([i915#2658])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk5/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][53] ([i915#12917] / [i915#12964]) +1 other test timeout
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-on.html
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4270]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-on.html
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4270])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#3282]) +9 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-4/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#5190] / [i915#8428]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#8428]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-2/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4079])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-7/igt@gem_set_tiling_vs_pwrite.html
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4079])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-3/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4885])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4077]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3297]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3297]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3297] / [i915#4880])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3297] / [i915#4880])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@relocations:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#3281] / [i915#3297])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-8/igt@gem_userptr_blits@relocations.html
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3281] / [i915#3297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-10/igt@gem_userptr_blits@relocations.html
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3281] / [i915#3297])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-1/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3281] / [i915#3297])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-14/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3297] / [i915#4958])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3297]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3297]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#3297]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#2527]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-3/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#2527])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@gen9_exec_parse@bb-oversize.html
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#2527] / [i915#2856]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-6/igt@gen9_exec_parse@bb-oversize.html
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#2856]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-5/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2856]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-6/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#7091])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#8436])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-glk:          NOTRUN -> [ABORT][82] ([i915#13218]) +24 other tests abort
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@fence-order:
    - shard-dg1:          NOTRUN -> [ABORT][83] ([i915#13218]) +20 other tests abort
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@i915_pm_rps@fence-order.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#11681])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-5/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#11681])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-8/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#11681]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-13/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][87] ([i915#8346]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-8/igt@i915_pm_rps@waitboost.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#4387])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-3/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#8437])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         NOTRUN -> [ABORT][90] ([i915#12061]) +1 other test abort
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-2/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][91] ([i915#4817])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk8/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#4212])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-7/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4212]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-8/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4212])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-12/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][95] ([i915#12964]) +7 other tests dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#5286])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#5286]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4538] / [i915#5286]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#5286]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][100] +20 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-4/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#3638]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3638]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#5190]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#6187]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4538] / [i915#5190]) +8 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4538]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#6095]) +18 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#6095]) +39 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#10307] / [i915#6095]) +34 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][110] +201 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#12313])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#12313])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#12313]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#12313]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#6095]) +24 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#12313])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#6095]) +15 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][119] +12 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-8/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#7828]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#7828]) +8 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#7828]) +6 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#7828]) +5 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#7828]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-9/igt@kms_content_protection@legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#6944] / [i915#9424])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@kms_content_protection@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#7118] / [i915#9424])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_content_protection@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#7118] / [i915#9424])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#9424])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-4/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#9433])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#8814]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#13049])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#3555]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#3555]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#3555]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#3555] / [i915#8814]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#13049]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#13049])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#13049])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#13049])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#5354]) +24 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#4103])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4103] / [i915#4213])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][144] +19 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#9809]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [PASS][146] -> [FAIL][147] ([i915#2346])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#9723])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#3840])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#3555] / [i915#3840])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-12/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#3555] / [i915#3840])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3555] / [i915#3840]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3555] / [i915#3840]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#3555] / [i915#3840])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-9/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#3637]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#9934]) +5 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-10/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#3637])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#9934]) +4 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#3637]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#9934]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-snb:          NOTRUN -> [ABORT][161] ([i915#13242]) +9 other tests abort
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [FAIL][162] ([i915#11989] / [i915#12840])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-mtlp:         NOTRUN -> [FAIL][163] ([i915#11989]) +1 other test fail
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][164] ([i915#11989]) +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#3555] / [i915#8810] / [i915#8813])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#2672] / [i915#3555])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#2672] / [i915#3555])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#8810])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#2672])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#2587] / [i915#2672])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#2672] / [i915#3555] / [i915#5190])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#2672])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#2672] / [i915#3555]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#2587] / [i915#2672]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          [PASS][175] -> [FAIL][176] ([i915#6880])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#8708]) +11 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#8708]) +6 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] +4 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#1825]) +26 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][181] +26 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#8708]) +11 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#9766])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#9766])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#9766])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#9766])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][187] +60 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3458]) +12 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3023]) +16 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#3458]) +11 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#1825]) +19 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#6118])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#3555] / [i915#8228]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-9/igt@kms_hdr@bpc-switch.html
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3555] / [i915#8228])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_hdr@bpc-switch.html
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#3555] / [i915#8228])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#3555] / [i915#8228])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#10656])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-3/igt@kms_joiner@basic-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#10656])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#10656])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-6/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#10656])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-5/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#10656])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-11/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#6301])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-3/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#6301])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-7/igt@kms_panel_fitting@legacy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#6301])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-tglu:         NOTRUN -> [ABORT][205] ([i915#10159] / [i915#13218]) +1 other test abort
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][206] ([i915#13026]) +1 other test incomplete
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][207] ([i915#12169])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk9/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][208] ([i915#10647]) +3 other tests fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk9/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][209] ([i915#12177])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#3555]) +5 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-6/igt@kms_plane_lowres@tiling-4.html
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#10226] / [i915#11614] / [i915#3555] / [i915#8821])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-5/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#11614] / [i915#3582]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-5/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#12247] / [i915#6953] / [i915#9423])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#12247] / [i915#6953])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#12247] / [i915#6953])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#12247]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#12247]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#12247] / [i915#3555])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#12247] / [i915#3555])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#12247] / [i915#3555])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#12247] / [i915#3555] / [i915#9423])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#12247] / [i915#3555])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#12247]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#12247]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#12247]) +7 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#9812])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-9/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-mtlp:         NOTRUN -> [ABORT][227] ([i915#10159] / [i915#13218]) +4 other tests abort
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#5354])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#9685])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#9685])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#9685])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-12/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#9685])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-10/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#9292])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#9519])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#4077]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#9519]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#9519])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#9519])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#6524] / [i915#6805]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#6524]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-7/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#6524])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#6524]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-6/igt@kms_prime@basic-modeset-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#6524])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][244] ([i915#11520]) +12 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#11520]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#11520]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#12316]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][248] ([i915#11520]) +3 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#11520]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-11/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#11520]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#9688]) +17 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-7/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#1072] / [i915#9732]) +19 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-3/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#4077] / [i915#9688]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#1072] / [i915#9732]) +18 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-2/igt@kms_psr@psr2-cursor-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#1072] / [i915#9732]) +13 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-14/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#9732]) +21 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-9/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#12755]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#12755] / [i915#5190])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#5289])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#5289])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#12755])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][262] ([i915#5465]) +2 other tests fail
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#3555] / [i915#8809])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][264] ([IGT#160])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-11/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][265] ([IGT#160] / [i915#6493])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#8623])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][267] ([i915#10959])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk9/igt@kms_tiled_display@basic-test-pattern.html
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#8623])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#9906]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-3/igt@kms_vrr@flip-basic-fastset.html
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#8808] / [i915#9906]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#9906])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-17/igt@kms_vrr@max-min.html
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#9906])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-11/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#9906])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-3/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#2437] / [i915#9412])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#2437] / [i915#9412])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#2437] / [i915#9412])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-9/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][277] ([i915#2437])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#2437] / [i915#9412])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@stress-open-close:
    - shard-dg2:          NOTRUN -> [ABORT][279] ([i915#13218]) +21 other tests abort
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-3/igt@perf@stress-open-close.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][280] +439 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-snb4/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-accuracy-98@rcs0:
    - shard-tglu:         NOTRUN -> [ABORT][281] ([i915#13218]) +23 other tests abort
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-10/igt@perf_pmu@busy-accuracy-98@rcs0.html

  * igt@perf_pmu@event-wait:
    - shard-mtlp:         NOTRUN -> [SKIP][282] ([i915#8807])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8807])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@frequency@gt0:
    - shard-mtlp:         NOTRUN -> [ABORT][284] ([i915#13218]) +26 other tests abort
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-4/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-tglu-1:       NOTRUN -> [ABORT][285] ([i915#13218]) +3 other tests abort
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-tglu-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@multi-client@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][286] ([i915#13218]) +11 other tests abort
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-snb1/igt@perf_pmu@multi-client@rcs0.html

  * igt@perf_pmu@semaphore-wait:
    - shard-rkl:          NOTRUN -> [ABORT][287] ([i915#13218]) +23 other tests abort
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-4/igt@perf_pmu@semaphore-wait.html

  * igt@prime_vgem@fence-write-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#3708])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-mtlp-3/igt@prime_vgem@fence-write-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#3708])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@prime_vgem@fence-write-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#3708])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-5/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#9917])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg1-13/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#9917])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-4/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][293] ([i915#2346]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          [DMESG-WARN][295] ([i915#12964]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-rkl-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-dg2:          [FAIL][297] ([i915#11989]) -> [PASS][298] +3 other tests pass
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/shard-dg2-7/igt@kms_flip@plain-flip-ts-check.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-dg2-7/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          [DMESG-WARN][299] ([i915#118] / [i915#1982]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/shard-glk5/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled:
    - shard-glk:          [INCOMPLETE][301] -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8139/shard-glk5/igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/shard-glk9/igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#160]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/160
  [i915#10159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12840
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#13242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13242
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6118
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6493
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7091]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7091
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8436
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8139 -> IGTPW_12252

  CI-20190529: 20190529
  CI_DRM_15796: 1b7746f770882ce40dacae683e8e65657c40c2b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12252: 12252
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12252/index.html
