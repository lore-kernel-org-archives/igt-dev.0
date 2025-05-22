Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22B1C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 16:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426DD10E5AD;
	Thu, 22 May 2025 16:34:21 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C62D10E5AD;
 Thu, 22 May 2025 16:34:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Add_per-device_engine_act?=
 =?utf-8?q?ivity_stats_in_GPUTOP_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 May 2025 16:34:20 -0000
Message-ID: <174793166004.14856.2105786083081065013@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522154447.496407-1-soham.purkait@intel.com>
In-Reply-To: <20250522154447.496407-1-soham.purkait@intel.com>
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

Series: Add per-device engine activity stats in GPUTOP (rev7)
URL   : https://patchwork.freedesktop.org/series/146756/
State : failure

== Summary ==

Applying: lib/igt_device_scan: Add support for the device filter
Applying: lib/igt_device_scan: Enable finding all matched IGT devices
Applying: tools/gputop/utils: Add gputop utility functions common to all drivers
Applying: tools/gputop/xe_gputop: Add gputop support for xe specific devices
Applying: tools/gputop/gputop: Enable support for multiple GPUs and instances
Using index info to reconstruct a base tree...
M	tools/gputop.c
Falling back to patching base and 3-way merge...
Auto-merging tools/gputop/gputop.c
CONFLICT (content): Merge conflict in tools/gputop/gputop.c
Patch failed at 0005 tools/gputop/gputop: Enable support for multiple GPUs and instances
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


