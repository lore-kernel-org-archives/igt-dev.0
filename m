Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FB510E5A0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 10:21:51 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 67FD8580E39
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 03:21:50 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qtmdY-000Vbx-09
 for igt-dev@lists.freedesktop.org; Fri, 20 Oct 2023 12:21:48 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 12:20:31 +0200
Message-ID: <20231020102146.121478-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Improve IGT runner dry-run logic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The IGT dry-run logic is currently almost useless, as it doesn't
produce any output with the planned jobs. It also currently requires
root access, but this is not needed.

Mauro Carvalho Chehab (2):
  igt_runner: don't require root for dry_run
  igt_runner: output planned job_list tasks in dry-run mode

 runner/executor.c | 6 ++++++
 runner/settings.c | 1 +
 2 files changed, 7 insertions(+)

-- 
2.41.0
