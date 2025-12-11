Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F269BD41C09
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 09:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741B010E6FD;
	Thu, 11 Dec 2025 09:25:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362AA10E285;
 Thu, 11 Dec 2025 09:25:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6849499014563885813=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_kms=5Fflip=5Ftiling_test_?=
 =?utf-8?q?run_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Dec 2025 09:25:03 -0000
Message-ID: <176544510319.76574.1798591094032835802@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251211071100.17632-1-tursulin@igalia.com>
In-Reply-To: <20251211071100.17632-1-tursulin@igalia.com>
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

--===============6849499014563885813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_flip_tiling test run (rev4)
URL   : https://patchwork.freedesktop.org/series/158788/
State : success

== Summary ==

CI Bug Log - changes from IGT_8664 -> IGTPW_14190
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-bsw-n3050 bat-adls-6 

New tests
---------

  New tests have been introduced between IGT_8664 and IGTPW_14190:

### New IGT tests (695) ###

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.41] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.16, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.17, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.47] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-linear-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-x-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-y:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-y:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.32] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.32] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.33] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.35] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.33, 0.35] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.38] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.19, 0.35] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.11, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.10, 0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-y:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.33] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.35] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.32] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.33] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.40] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.33] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.52] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.33] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.35] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.26] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.41] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.35] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.13, 0.16] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.15, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.26] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.60] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-linear-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-x-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-y:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-y:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.26] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.32] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.33] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.52, 1.37] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-y:
    - Statuses : 6 pass(s)
    - Exec time: [0.08, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.32] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.35] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.85] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-y-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-yf-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-linear-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-linear-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-linear-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-linear-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-linear-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-x-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-x-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-x-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-x-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-x-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.34] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-yf-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-yf-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-yf-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-yf-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.59] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-linear-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-x-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-y:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.22] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-y:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-yf:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.40] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.11, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.53, 1.41] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-linear:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-x:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-y:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.10, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-linear:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-x:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-y:
    - Statuses : 6 pass(s)
    - Exec time: [0.09, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-y-mc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-y-rc-ccs:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-y-rc-ccs-cc:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-yf:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-yf:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 1.41] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-yf:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-yf:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-to-y-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-to-yf-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-vga-1-linear-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-vga-1-linear-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-vga-1-x-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.08] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-vga-1-x-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.24] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-linear-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-linear-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-linear-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-linear-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-x-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-x-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-x-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-x-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.36] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-linear-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-x-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 1.32] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-y-mc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-linear-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-linear-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-linear-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-linear-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-x-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-x-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-x-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-x-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.33] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-linear:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-x:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-y:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-y-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-y-rc-ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.17] s

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-y-rc-ccs-cc:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  

Known issues
------------

  Here are the changes found in IGTPW_14190 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip_tiling@flip-change-tiling:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/fi-kbl-8809g/igt@kms_flip_tiling@flip-change-tiling.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/fi-bsw-nick/igt@kms_flip_tiling@flip-change-tiling.html
    - bat-adlp-11:        NOTRUN -> [SKIP][3] ([i915#3555])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/bat-adlp-11/igt@kms_flip_tiling@flip-change-tiling.html
    - bat-dg1-6:          NOTRUN -> [SKIP][4] ([i915#12311] / [i915#3555])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/bat-dg1-6/igt@kms_flip_tiling@flip-change-tiling.html
    - bat-kbl-2:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/bat-kbl-2/igt@kms_flip_tiling@flip-change-tiling.html
    - bat-arlh-2:         NOTRUN -> [SKIP][6] ([i915#11346])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/bat-arlh-2/igt@kms_flip_tiling@flip-change-tiling.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][7] ([i915#3555])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/fi-rkl-11600/igt@kms_flip_tiling@flip-change-tiling.html
    - bat-atsm-1:         NOTRUN -> [SKIP][8] ([i915#1836])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/bat-atsm-1/igt@kms_flip_tiling@flip-change-tiling.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/fi-kbl-x1275/igt@kms_flip_tiling@flip-change-tiling.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8664 -> IGTPW_14190

  CI-20190529: 20190529
  CI_DRM_17659: 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14190: 390760e209e3fa866d11410076f8cb6f21c40e43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/index.html

--===============6849499014563885813==
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
<tr><td><b>Series:</b></td><td>kms_flip_tiling test run (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158788/">https://patchwork.freedesktop.org/series/158788/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8664 -&gt; IGTPW_14190</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-bsw-n3050 bat-adls-6 </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8664 and IGTPW_14190:</p>
<h3>New IGT tests (695)</h3>
<ul>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-linear-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-x-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.16, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.17, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-y-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-1-yf-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-linear-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-x-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-3-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-y:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-y:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.33, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.19, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.11, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.10, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-y:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-y-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-yf-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-2-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-linear-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-x-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.13, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.15, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-y-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-1-yf-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-2-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-linear-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-x-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-dp-3-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-y:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-linear-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-y:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-x-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.52, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-y:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.08, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-y-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-y-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-yf-to-yf-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-2-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-linear-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-linear-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-x-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-x-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-y-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-yf-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-yf-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-yf-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-1-yf-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-2-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-linear-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-x-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-3-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-y:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-linear-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-y:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.11, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.53, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.10, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-linear:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-x:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-y:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.09, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-y-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-yf:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-yf-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-linear-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-yf:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-ccs-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-to-y-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-yf-to-yf-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-2-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-vga-1-linear-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-vga-1-linear-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-vga-1-x-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-vga-1-x-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-linear-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-x-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-1-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-2-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-linear-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-x-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-dp-3-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-edp-1-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-linear-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-linear-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-x-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-x-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-mc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-linear:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-y:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-y-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-2-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14190 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip_tiling@flip-change-tiling:<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/fi-kbl-8809g/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a></li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/fi-bsw-nick/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/bat-adlp-11/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/bat-dg1-6/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/bat-kbl-2/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a></li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/bat-arlh-2/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/fi-rkl-11600/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/bat-atsm-1/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>)</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14190/fi-kbl-x1275/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8664 -&gt; IGTPW_14190</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17659: 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14190: 390760e209e3fa866d11410076f8cb6f21c40e43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6849499014563885813==--
