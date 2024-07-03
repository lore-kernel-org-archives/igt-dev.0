Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631B5C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 17:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1265410E94A;
	Wed,  3 Jul 2024 17:28:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C95B10E94A;
 Wed,  3 Jul 2024 17:28:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/kms=5Fpm=5Fdc?=
 =?utf-8?q?=3A_Modified_the_deep-pkgc_subtest=2E_Changes=3A_1=2E_Added_check?=
 =?utf-8?q?s_to_avoid_connector_failures=2E_2=2E_Added_vblank_wait_to_sync_w?=
 =?utf-8?q?ith_frame_time=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 03 Jul 2024 17:28:54 -0000
Message-ID: <172002773417.24496.3274661955601529560@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240703171339.381480-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240703171339.381480-1-ramanaidu.naladala@intel.com>
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

Series: tests/intel/kms_pm_dc: Modified the deep-pkgc subtest. Changes: 1. Added checks to avoid connector failures. 2. Added vblank wait to sync with frame time.
URL   : https://patchwork.freedesktop.org/series/135715/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
d0d71f374c95a89a3bdcd104c7d8c2043f79e37a tests/intel/xe_intel_bb: Reduce render subtest execution time

Tail of build.log:


