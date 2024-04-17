Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE24EC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 10:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891A8113374;
	Wed, 17 Apr 2024 10:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FE9Hi+Ey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00DF113374
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 10:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713348599; x=1744884599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7+8ls1pfG2/0veJ2YnVHjOXiVGck4cMKg5II/8U2vZM=;
 b=FE9Hi+EywaoPPBcvIhRJ2UdfoX8xMLY8dVar0mnIZCIStk1c+vIzxUV1
 FS2qixRh7nBBjbsypZbd6EOFpbR7I6YSWl/3rRPsL3NL7z6pH/yU9lvgV
 V1FarNKnkKBemgZ8D1pj3q3X0Cfb+lz17MZMM6P9D8AB1JJfGgAz9mk2T
 TL3pmC8LNkZbY7O3NvjmzfivfJU9X3ZuqYdWUaelQFDenbEVXPGhpBNQk
 cgO9DQ1436Ew1AHJNaQeGMqnsvPCRo0RmMf0St3jQgcpkdC1RSeRDbVml
 /A42K53J2q3jOZ93TxGeZJTbSshc69OBWxcoA07XGGk8tY0M1NHK9Vw62 g==;
X-CSE-ConnectionGUID: e26s05vnQiavODg22DUAWQ==
X-CSE-MsgGUID: cbi3JzfuRmatJ6LnUoUZLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8992181"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8992181"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 03:09:59 -0700
X-CSE-ConnectionGUID: /ozW+WowTvydaNcr6tNjUw==
X-CSE-MsgGUID: NCv9/WNqTAuN4PjaEicm7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="22985524"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 03:09:57 -0700
Date: Wed, 17 Apr 2024 12:09:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTA==?= =?utf-8?Q?=3A?= failure for
 Update for atomics related uAPI changes
Message-ID: <20240417100953.3446xes7m7blo25b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
References: <20240415143528.4107-1-nirmoy.das@intel.com>
 <171332444928.1463550.2146795435740228090@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171332444928.1463550.2146795435740228090@8e613ede5ea5>
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

Hi Nirmoy,

On 2024-04-17 at 03:27:29 -0000, Patchwork wrote:
> == Series Details ==
> 

I noticed some strange name in report, could you look at it?

> Series: Update for atomics related uAPI changes
> URL   : https://patchwork.freedesktop.org/series/132451/
> State : failure

...cut...

> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:
--------------------------------------------- ^^^^^^^^^^^^^^^^^^^^^^^^^^

Should this be just 'render'?

Regards,
Kamil

>     - shard-dg2-set2:     NOTRUN -> [FAIL][1] +15 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11023/shard-dg2-435/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11023_full that come from known issues:

...cut...

