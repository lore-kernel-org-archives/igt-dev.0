Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0131C54E41
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 16:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A30A10E53A;
	Thu, 29 Feb 2024 16:34:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFC210E53A;
 Thu, 29 Feb 2024 16:34:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_IGT_documentation_refacto?=
 =?utf-8?q?ring?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Katarzyna Piecielska" <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Feb 2024 16:34:07 -0000
Message-ID: <170922444758.397243.6288955826600388738@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240229111909.588400-1-katarzyna.piecielska@intel.com>
In-Reply-To: <20240229111909.588400-1-katarzyna.piecielska@intel.com>
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

Series: IGT documentation refactoring
URL   : https://patchwork.freedesktop.org/series/130555/
State : failure

== Summary ==

Applying: Documentation refactoring part 1
Using index info to reconstruct a base tree...
M	tests/device_reset.c
M	tests/intel/api_intel_bb.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/api_intel_bb.c
Auto-merging tests/device_reset.c
CONFLICT (content): Merge conflict in tests/device_reset.c
Patch failed at 0001 Documentation refactoring part 1
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


