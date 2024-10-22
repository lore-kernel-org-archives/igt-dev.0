Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D423D2CE08
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 17:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC74410E6CF;
	Tue, 22 Oct 2024 17:07:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBA910E6CC;
 Tue, 22 Oct 2024 17:07:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_lib/chamelium=3A_Move_cha?=
 =?utf-8?q?meliumv2_support_in_its_own_directory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 22 Oct 2024 17:07:41 -0000
Message-ID: <172961686131.1310805.8376861925833861089@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
In-Reply-To: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
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

Series: lib/chamelium: Move chameliumv2 support in its own directory
URL   : https://patchwork.freedesktop.org/series/140319/
State : failure

== Summary ==

Applying: tests/chamelium: Extract Chamelium v2 tests into a separate directory
Applying: lib/chamelium/v2: Extract chamelium v2 wrapper into its own directory
Using index info to reconstruct a base tree...
M	lib/igt_kms.c
M	lib/monitor_edids/monitor_edids_helper.h
Falling back to patching base and 3-way merge...
Auto-merging lib/monitor_edids/monitor_edids_helper.h
CONFLICT (content): Merge conflict in lib/monitor_edids/monitor_edids_helper.h
Auto-merging lib/igt_kms.c
Patch failed at 0002 lib/chamelium/v2: Extract chamelium v2 wrapper into its own directory
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


