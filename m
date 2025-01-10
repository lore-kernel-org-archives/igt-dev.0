Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF0AE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 20:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CAA10E523;
	Fri, 10 Jan 2025 20:02:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC2310E523;
 Fri, 10 Jan 2025 20:02:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_New_sharpness_tool_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jan 2025 20:02:05 -0000
Message-ID: <173653932517.2050889.10464662183711259306@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250110195100.150301-1-swati2.sharma@intel.com>
In-Reply-To: <20250110195100.150301-1-swati2.sharma@intel.com>
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

Series: New sharpness tool (rev2)
URL   : https://patchwork.freedesktop.org/series/138966/
State : failure

== Summary ==

Applying: data: Move PNG images to new data directory
Applying: runner/settings: Constify absolute_path parameter
Applying: runner/settings: Add function to set IGT_RUNNER_DATA environment variable
Applying: lib/igt_core: Enhance __igt_fopen_data to support additional directories
Applying: lib/igt_kms: Add "sharpness strength" as crtc property
Using index info to reconstruct a base tree...
M	lib/igt_kms.c
M	lib/igt_kms.h
Falling back to patching base and 3-way merge...
Auto-merging lib/igt_kms.h
CONFLICT (content): Merge conflict in lib/igt_kms.h
Auto-merging lib/igt_kms.c
CONFLICT (content): Merge conflict in lib/igt_kms.c
Patch failed at 0005 lib/igt_kms: Add "sharpness strength" as crtc property
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


