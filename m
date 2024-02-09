Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73C9C4829B
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 12:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F3410EC4A;
	Fri,  9 Feb 2024 12:06:50 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B8210EE80;
 Fri,  9 Feb 2024 12:06:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Fix_several_issues_when_p?=
 =?utf-8?q?roducing_Intel_CI_testlists_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 Feb 2024 12:06:48 -0000
Message-ID: <170748040892.1129210.2983050244138493069@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240209115101.285319-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240209115101.285319-1-mauro.chehab@linux.intel.com>
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

Series: Fix several issues when producing Intel CI testlists (rev2)
URL   : https://patchwork.freedesktop.org/series/129708/
State : failure

== Summary ==

Applying: scripts/test_list.py: fix a typo on default-if-not-excluded
Applying: scripts/igt_doc.py: better handle issues with empty testlists
Applying: scripts/igt_doc.py: handle empty run_type
Applying: scripts/igt_doc.py: only create dict if subtest will be added
Applying: scripts/igt_doc.py: better handle default gpu
Applying: scripts/igt_doc.py: remove some unused logic
Applying: scripts/igt_doc.py: use an ancillary function to simplify the code
Patch failed at 0007 scripts/igt_doc.py: use an ancillary function to simplify the code
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


