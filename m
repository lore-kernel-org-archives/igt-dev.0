Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A78C54E69
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 08:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2572E10E2CC;
	Fri, 15 Mar 2024 08:58:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2B710E16F;
 Fri, 15 Mar 2024 08:58:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_More_improvements_to_scri?=
 =?utf-8?q?pts/xls=5Fto=5Fdoc=2Epy_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 15 Mar 2024 08:58:21 -0000
Message-ID: <171049310158.795503.12786002259960137428@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
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

Series: More improvements to scripts/xls_to_doc.py (rev2)
URL   : https://patchwork.freedesktop.org/series/131130/
State : failure

== Summary ==

Applying: scripts/xls_to_doc.py: make the message about wildcards clearer
Applying: scripts/xls_to_doc.py: don't ignore the last column
Applying: scripts/xls_to_doc.py: be clearer when ignoring a value in verbose mode
Applying: scripts/xls_to_doc.py: detect field removal
Applying: scripts/xls_to_doc.py: improve the addition logic
Applying: scripts/xls_to_doc.py: preserve line for found fields
Applying: scripts/xls_to_doc.py: don't duplicate a common field
Applying: scripts/xls_to_doc.py: reduce verbosity for writing message
Applying: scripts/xls_to_doc.py: better handle common attributes
Applying: scripts/xls_to_doc.py: make pylint happy
Using index info to reconstruct a base tree...
M	scripts/xls_to_doc.py
Falling back to patching base and 3-way merge...
Auto-merging scripts/xls_to_doc.py
CONFLICT (content): Merge conflict in scripts/xls_to_doc.py
Patch failed at 0010 scripts/xls_to_doc.py: make pylint happy
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


