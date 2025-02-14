Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F345AC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 12:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13D910E03D;
	Fri, 14 Feb 2025 12:56:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF5110E03D;
 Fri, 14 Feb 2025 12:56:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/xe=5Fmulti=5F?=
 =?utf-8?q?tile=3A_Multi-Tile_support_in_IGT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 14 Feb 2025 12:56:06 -0000
Message-ID: <173953776669.2024586.17896882244196869305@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214120336.194806-1-nishit.sharma@intel.com>
In-Reply-To: <20250214120336.194806-1-nishit.sharma@intel.com>
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

Series: tests/intel/xe_multi_tile: Multi-Tile support in IGT (rev2)
URL   : https://patchwork.freedesktop.org/series/144187/
State : failure

== Summary ==

Applying: tests/intel/xe_multi_tile: Multi-Tile support in IGT
Using index info to reconstruct a base tree...
M	include/drm-uapi/xe_drm.h
M	lib/igt_sysfs.c
M	lib/xe/xe_query.h
M	tests/meson.build
Falling back to patching base and 3-way merge...
Auto-merging tests/meson.build
Auto-merging lib/xe/xe_query.h
Auto-merging lib/igt_sysfs.c
Auto-merging include/drm-uapi/xe_drm.h
CONFLICT (content): Merge conflict in include/drm-uapi/xe_drm.h
Patch failed at 0001 tests/intel/xe_multi_tile: Multi-Tile support in IGT
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


