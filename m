Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBC9CAC582
	for <igt-dev@archiver.kernel.org>; Sat, 13 Sep 2025 00:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B01710E16F;
	Sat, 13 Sep 2025 00:06:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2B010E055;
 Sat, 13 Sep 2025 00:06:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Support_post-blend_color_?=
 =?utf-8?q?pipeline_API?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 13 Sep 2025 00:06:45 -0000
Message-ID: <175772200504.331813.571126538710182909@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
In-Reply-To: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
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

Series: Support post-blend color pipeline API
URL   : https://patchwork.freedesktop.org/series/154481/
State : failure

== Summary ==

Applying: include/drm-uapi: Sync with drm-next
Using index info to reconstruct a base tree...
M	include/drm-uapi/drm.h
Falling back to patching base and 3-way merge...
Auto-merging include/drm-uapi/drm.h
CONFLICT (content): Merge conflict in include/drm-uapi/drm.h
Patch failed at 0001 include/drm-uapi: Sync with drm-next
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


