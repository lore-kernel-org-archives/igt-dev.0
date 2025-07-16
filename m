Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AED4C83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 10:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4372210E6DB;
	Wed, 16 Jul 2025 10:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQpqdiY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF5110E6DB
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752663498; x=1784199498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fswX72TAxqfSgaZksStHVUv2QXtkS3C4L4kfSMJxRyI=;
 b=DQpqdiY4T2T8djQk/e1aEWD85GOZ/8D9PyKGrgzNipupO1qO6f8VZQG2
 N3VnXLBuZ9ukQ2rhvhCwLhLRYk025jJDfdgkc6ABSHL0OAMbLG9OkE0da
 OeLmCIp4X31O362/ffiLBE57Tqu9/tnBBmtmDJSEuY+b8BI7qwD4ezX90
 rmyyc88OFFrcfPvdegWcKwNM8SEwVuu5YIrMoVQrpcRwV+SCmy+sB3qUL
 ITilPvIbOXZXQe/YNuMuCvOiCNCY0PMkKn112QUcCyE2rkxt989DifUBX
 05MdCswVoKMDbPop+VhaZBLpFfjpMIt71YzljuqJLfMeq/1FEXHZw/2tf Q==;
X-CSE-ConnectionGUID: 851kwcTQTXK/c07h81yt7w==
X-CSE-MsgGUID: +A/UgS2vR4KUHwtClwOmPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54759097"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="54759097"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:58:18 -0700
X-CSE-ConnectionGUID: qd2jwrvwTlGsfQZLZlFzMQ==
X-CSE-MsgGUID: 5YmCJCLKQG2NVUUjnyv/vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="194615523"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:58:17 -0700
Date: Wed, 16 Jul 2025 12:58:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] tests/intel/xe_exec_system_allocator: Add prefetch
 sections
Message-ID: <20250716105814.ycrq6qxnf5ujd6cq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Nishit" <nishit.sharma@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
 <20250714170309.2949211-3-matthew.brost@intel.com>
 <1a94f2f5-f993-487a-b7ca-e9354dfbe05f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a94f2f5-f993-487a-b7ca-e9354dfbe05f@intel.com>
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

Hi Sharma,,
On 2025-07-15 at 13:35:58 +0530, Sharma, Nishit wrote:
> 
> On 7/14/2025 10:33 PM, Matthew Brost wrote:
> > Update the test_exec() function with flags to initiate and understand
> > prefetches. Prefetching is tested by verifying that the fault count in
> > the GT stats has not  increased. However, a mismatch does not cause the
> > test to fail—instead, a warning  is printed. This is due to the
> > unreliability of system allocator behavior; the  added sections
> > primarily serve to ensure that the driver remains stable.
> > 
> > That said, if the page fault counts are consistently incorrect, it may
> > indicate a  problem in the KMD.
> > 
> > A prefetch benchmark section has also been added to help profile
> > prefetch behavior  in the KMD.
> > 
> > v2:
> >   - Prefetch initial buffer on SRAM devices (CI)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   tests/intel/xe_exec_system_allocator.c | 121 ++++++++++++++++++++++++-
> >   1 file changed, 116 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 65d281c784..f8d144328e 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -21,6 +21,7 @@
> >   #include "lib/intel_reg.h"
> >   #include "xe_drm.h"
> > +#include "xe/xe_gt.h"
> >   #include "xe/xe_ioctl.h"
> >   #include "xe/xe_query.h"
> >   #include <string.h>
> > @@ -770,6 +771,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >   #define SYNC_EXEC		(0x1 << 19)
> >   #define EVERY_OTHER_CHECK	(0x1 << 20)
> >   #define MULTI_FAULT		(0x1 << 21)
> > +#define PREFETCH		(0x1 << 22)
> > +#define THREADS			(0x1 << 23)
> > +#define PROCESSES		(0x1 << 24)
> > +#define PREFETCH_BENCHMARK	(0x1 << 25)
> >   #define N_MULTI_FAULT		4
> > @@ -878,14 +883,17 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >    * arg[1]:
> >    *
> >    * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
> > + * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
> Length crossing limit of 100 columns

Here and below please allow this as this is already done
in other old lines here, not touched by this patch.
Checkpatch.pl warning is suggestion, here it should be
ignored.

Regards,
Kamil

> >    * @malloc-multi-fault:			malloc single buffer for all execs
> >    * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
> >    * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
> >    * @malloc-mlock:			malloc and mlock single buffer for all execs
> >    * @malloc-race:			malloc single buffer for all execs with race between cpu and gpu access
> > + * @malloc-prefetch-race:		malloc single buffer for all execs, prefetch buffer before each exec, with race between cpu and gpu access
> Length crossing limit of 100 columns
> >    * @malloc-bo-unmap:			malloc single buffer for all execs, bind and unbind a BO to same address before execs
> >    * @malloc-busy:			malloc single buffer for all execs, try to unbind while buffer valid
> >    * @mmap:				mmap single buffer for all execs
> > + * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
> Length crossing limit of 100 columns
> >    * @mmap-remap:				mmap and mremap a buffer for all execs
> >    * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
> >    * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
> > @@ -896,6 +904,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> >    * @mmap-remap-ro-dontunmap-eocheck:	mmap and mremap a read-only buffer with dontunmap flag for all execs, check data every other loop iteration
> >    * @mmap-huge:				mmap huge page single buffer for all execs
> >    * @mmap-shared:			mmap shared single buffer for all execs
> > + * @mmap-prefetch-shared:		mmap shared single buffer for all execs, prefetch buffer before each exec
> Length crossing limit of 100 columns
> >    * @mmap-shared-remap:			mmap shared and mremap a buffer for all execs
> >    * @mmap-shared-remap-dontunmap:	mmap shared and mremap a buffer with dontunmap flag for all execs
> >    * @mmap-shared-remap-eocheck:		mmap shared and mremap a buffer for all execs, check data every other loop iteration

[cut]
