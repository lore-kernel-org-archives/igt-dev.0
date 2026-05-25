Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CACD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 20:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A3610E40B;
	Mon, 25 May 2026 20:37:35 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CA610E40B;
 Mon, 25 May 2026 20:37:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Enable_Vebox_engine_copy_?=
 =?utf-8?q?on_Intel_Xe_driver_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 May 2026 20:37:16 -0000
Message-ID: <177974143684.7221.4527023308303170594@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
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

Series: Enable Vebox engine copy on Intel Xe driver (rev12)
URL   : https://patchwork.freedesktop.org/series/161376/
State : failure

== Summary ==

Applying: lib: take out duplicate assert
Applying: lib/intel_batchbuffer: make __intel_bb_create gt aware
Using index info to reconstruct a base tree...
M	lib/intel_batchbuffer.c
M	lib/intel_batchbuffer.h
Falling back to patching base and 3-way merge...
Auto-merging lib/intel_batchbuffer.h
Auto-merging lib/intel_batchbuffer.c
CONFLICT (content): Merge conflict in lib/intel_batchbuffer.c
Patch failed at 0002 lib/intel_batchbuffer: make __intel_bb_create gt aware
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


