Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141ACCD6E79
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 00:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A681310E011;
	Tue,  9 Jun 2026 00:09:19 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A41610E010;
 Tue,  9 Jun 2026 00:08:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_docs/reference=3A_Build_g?=
 =?utf-8?q?enerated_XMLs_by_default=2C_depend_on_testlists?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ryszard Knop" <ryszard.knop@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Jun 2026 00:08:52 -0000
Message-ID: <178096373203.56403.4069005931894856332@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608161712.988575-1-ryszard.knop@intel.com>
In-Reply-To: <20260608161712.988575-1-ryszard.knop@intel.com>
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

Series: docs/reference: Build generated XMLs by default, depend on testlists
URL   : https://patchwork.freedesktop.org/series/168105/
State : failure

== Summary ==

Applying: docs/reference: Build generated XMLs by default, depend on testlists
Using index info to reconstruct a base tree...
M	docs/reference/igt-gpu-tools/meson.build
Falling back to patching base and 3-way merge...
Auto-merging docs/reference/igt-gpu-tools/meson.build
CONFLICT (content): Merge conflict in docs/reference/igt-gpu-tools/meson.build
Patch failed at 0001 docs/reference: Build generated XMLs by default, depend on testlists
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


