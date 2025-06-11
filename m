Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C49BC71135
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 21:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12AB10E73A;
	Wed, 11 Jun 2025 21:36:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4613910E73C;
 Wed, 11 Jun 2025 21:36:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Add_per-device_engine_act?=
 =?utf-8?q?ivity_stats_in_GPUTOP_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Jun 2025 21:36:04 -0000
Message-ID: <174967776428.69074.12806011121248565635@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611152137.1858240-1-soham.purkait@intel.com>
In-Reply-To: <20250611152137.1858240-1-soham.purkait@intel.com>
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

Series: Add per-device engine activity stats in GPUTOP (rev8)
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
M	tools/meson.build
Falling back to patching base and 3-way merge...
Auto-merging tools/meson.build
Auto-merging tools/gputop/gputop.c
CONFLICT (content): Merge conflict in tools/gputop/gputop.c
Patch failed at 0005 tools/gputop/gputop: Enable support for multiple GPUs and instances
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


