Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D71C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 05:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DA610E104;
	Fri, 16 May 2025 05:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ile+iht3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB4010E104
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 05:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747373725; x=1778909725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8hVkvaDZEIzhXZalUq8U+ae34L4oLR2S907fWWLxXys=;
 b=Ile+iht3rHpjsbae6jml6i8O2IMf3uaEu+KlElfqu7DkD14OZ1a+t59Q
 zgQ/XP74Tz8/iRe28BQLbPFA1rxNknh5OZG6U3zuQNWgS5jQhUneHGkVS
 9YVDVc9sWMAXJXNVCK/a8NVLzsL5qZVex4ixlL/S9eZMo3a0m8hZhDNmv
 gNTYfcFeuWpo5YQXsTeEoGWyBI9eBsqwjkwzFSQzzty8Mun/lWXs/e3+X
 5Xgp7dj9F/fbbNA1dlHUBJ0bJViLQ1xVMooxeZJrVOimYMhcpRQXepZ9Q
 hMYcfxj4BVtj08pKQtcDu1ekjf/lhx0/EHlNZ4bcr+QlEKX/P83jKYp4U Q==;
X-CSE-ConnectionGUID: b4a+ORqySi2D/u1GyLZ9yg==
X-CSE-MsgGUID: jtBWEVjpR8GSkyhnZatpWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53138398"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="53138398"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:35:21 -0700
X-CSE-ConnectionGUID: XsLL5r2hS9K+iXYsdF8pEw==
X-CSE-MsgGUID: A486JijiRWGght7C5iBZng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="143541293"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.80])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:35:17 -0700
Date: Fri, 16 May 2025 07:35:13 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com, 
 himanshu.girotra@intel.com, aditya.chauhan@intel.com,
 pravalika.gurram@intel.com, 
 sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [RFC i-g-t 2/5] lib/igt_dir_explorer: Add function to
 recursively read all files in a directory
Message-ID: <24fpyqygozeuyikkend6ejd2icpeycouab3ztrmoyyyzvqjxja@hhaozcqcheoh>
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
 <20250514175140.115033-3-peter.senna@linux.intel.com>
 <ogha6otctbafhcqe5pokhjszogz6rzm2h7cdpxjssvvpiyf5md@xygjmjrvzcgd>
 <659d25f9-e052-4206-b1f9-15fe6a87728d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <659d25f9-e052-4206-b1f9-15fe6a87728d@linux.intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, May 15, 2025 at 11:04:26AM +0200, Peter Senna Tschudin wrote:
> 
> 
> On 5/15/2025 10:51 AM, Zbigniew Kempczyński wrote:
> > On Wed, May 14, 2025 at 07:51:34PM +0200, Peter Senna Tschudin wrote:
> >> Introduces igt_dir_explorer_read_and_discard_all(), a function that
> >> performs a recursive scan of all files within a directory. Each file is
> >> read, and its content is discarded.
> >>
> >> This functionality is utilized in the following tests:
> >> - core_debugfs
> >> - core_debugfs_display_on_off
> >> - core_sysfs
> >>
> >> This addition enhances the ability to efficiently handle directory
> >> traversal and file processing in tests.
> >>
> >> Cc: marcin.bernatowicz@intel.com
> >> Cc: himanshu.girotra@intel.com
> >> Cc: aditya.chauhan@intel.com
> >> Cc: pravalika.gurram@intel.com
> >> Cc: sai.gowtham.ch@intel.com
> >> Cc: ramadevi.gandi@intel.com
> >> Cc: lucas.demarchi@intel.com
> >> Cc: rodrigo.vivi@intel.com
> >> Cc: kamil.konieczny@linux.intel.com
> >> Cc: katarzyna.piecielska@intel.com
> >> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> >> ---
> >>  lib/igt_dir_explorer.c | 72 ++++++++++++++++++++++++++++++++++++++++++
> >>  lib/igt_dir_explorer.h | 10 ++++++
> >>  lib/meson.build        |  1 +
> >>  3 files changed, 83 insertions(+)
> >>  create mode 100644 lib/igt_dir_explorer.c
> >>  create mode 100644 lib/igt_dir_explorer.h
> >>
> >> diff --git a/lib/igt_dir_explorer.c b/lib/igt_dir_explorer.c
> >> new file mode 100644
> >> index 000000000..d47e08535
> >> --- /dev/null
> >> +++ b/lib/igt_dir_explorer.c
> >> @@ -0,0 +1,72 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright © 2025 Intel Corporation
> >> + */
> >> +
> >> +#include <dirent.h>
> >> +#include <fcntl.h>
> >> +
> >> +#include "igt.h"
> >> +#include "igt_dir_explorer.h"
> >> +
> >> +void igt_dir_explorer_read_and_discard_all(int path_fd, int indent)
> > 
> > Just loose thought - if you're doing recursive directory traversal,
> > wouldn't be better to pass function (kind of callback) which would be
> > called for each file/dir entry? I mean single traversal code, and
> > multiple callbacks for different use cases.
> 
> I like the idea. Can you help me create a spec for it?

I would focus to achieve igt_dir_explorer_read_and_discard_all() using
generic traversal/call(backs) functions. Select only fields necessary
to achieve the goal. I'm against overengineering code on the very
beginning. For example I don't see any value in designing multithreading
support in igt code for traversal.

> There is more than
> just what to do. There are cases where we may want to test only specific
> files, and cases where we do not want to test specific files. Ideas:
>  - Accept a callback that performs the action on each file. Read or write
>    for example

In term of callback I really think about call-handler function which gets
filename and decide what to do with it. So from traversal perspective
it is synchronous call.

>  - Accept specification for which files to read, and which not to read.
>  - Maybe an optional blocking callback? do not proceed to the next file
>    until this one returns. This is useful for an async reset for example.

Described above.

>  - Limits? Depth, number of files, wait between reads?
>  - Concurrency? Try read them all at the same time?
>  - Random order for doing the action on the file?

Depth - yes. And include/exclude pattern - this might be very useful
to avoid calling handler for each traversed file/dir. Other things
are unnecessary and I vote against them.

> 
> Which ones of these make sense, and what else can we customize?

> 
> Would it be ok to delay these improvements to a next iteration? There is
> some urgency in solving the issues I created with intel_sysfs_debugfs.

Write something what is simple and work.

--
Zbigniew
