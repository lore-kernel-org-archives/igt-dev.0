Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94F7C79FA1
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 22:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E21A10EDD7;
	Tue,  8 Sep 2026 22:32:26 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0D210EDD8;
 Tue,  8 Sep 2026 22:31:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_lib/igt=5Famd=3A_parse_li?=
 =?utf-8?q?nk=5Fsettings_records_by_label_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: roman.li@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Sep 2026 22:31:40 -0000
Message-ID: <178890670084.138035.14385966942901187164@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908205422.686351-1-Roman.Li@amd.com>
In-Reply-To: <20260908205422.686351-1-Roman.Li@amd.com>
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

Series: lib/igt_amd: parse link_settings records by label (rev2)
URL   : https://patchwork.freedesktop.org/series/173095/
State : failure

== Summary ==

Applying: lib/igt_amd: parse link_settings records by label
Using index info to reconstruct a base tree...
M	lib/igt_amd.c
Falling back to patching base and 3-way merge...
Auto-merging lib/igt_amd.c
CONFLICT (content): Merge conflict in lib/igt_amd.c
Patch failed at 0001 lib/igt_amd: parse link_settings records by label
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


