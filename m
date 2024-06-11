Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A457C41513
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 16:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EFB10E6B9;
	Tue, 11 Jun 2024 16:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvWtZIOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5877110E215
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718124085; x=1749660085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bFE9KGVjBGFuU7djOfuLdkhBOKuTenePaQB8nIeHjQA=;
 b=nvWtZIOPfSyea3vCIqilWVUk2rePXCH8xr8Uh7zseTK9Z1ui5LTWViJ9
 sfbip+OFEAvUVQc6ywnE85cIsDlZ1BV1jYrcn9lQkRVQlSNsieE4IqYXa
 gm7THoozZ4VVOEkGKDPLAp4LTSsf0L93hGmoQdOjyzDTTWK76Nmcho3qq
 2iOQA9IDrL3vp54WqkbWJPcQGrWXXw7oDMtFTXeO8eRALCCqCcZTD+A7K
 wIZtTUicXiMTPjLGFMYI/QLFFCTuFlb6A4idN3canFPdv1zUTgQQ3nUgZ
 eiSTIdT9uOkyqRnHaSA9P0hoCQ6SlfSDWIaTP+AFxBGqMJW8LHYzzqNf/ w==;
X-CSE-ConnectionGUID: GZr99hB3TaadP1nu1GegDg==
X-CSE-MsgGUID: LQaUimmzTO+QtoMMILQCow==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14680026"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14680026"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:41:21 -0700
X-CSE-ConnectionGUID: Sm/VuqE9QAKE2mFXwXVmRw==
X-CSE-MsgGUID: a2Y55hMLQ/mt0OGDg0OJCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="43897211"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:41:20 -0700
Date: Tue, 11 Jun 2024 18:41:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t 0/3] IGT cleanup
Message-ID: <20240611164117.jqhxecd3r2vgmnxt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-06-10 at 13:31:46 +0530, Bhanuprakash Modem wrote:
> Move non-Intel tests to new directories and update blocklists.
> 

When sending new patchseries please write new subject (if possible)
so it will not mix-up in older ones.

Regards,
Kamil

> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> Bhanuprakash Modem (3):
>   tests/panfrost: Move Panfrost tests to new dir
>   tests/msm: Move MSM tests to new dir
>   tests/intel-ci: Update blocklists
> 
>  meson.build                               | 16 +++++++++++++++
>  tests/intel-ci/blacklist.txt              | 12 +++++------
>  tests/intel-ci/xe.blocklist.txt           | 12 +++++------
>  tests/meson.build                         | 25 ++++-------------------
>  tests/msm/meson.build                     | 16 +++++++++++++++
>  tests/panfrost/meson.build                | 15 ++++++++++++++
>  tests/{ => panfrost}/panfrost_gem_new.c   |  0
>  tests/{ => panfrost}/panfrost_get_param.c |  0
>  tests/{ => panfrost}/panfrost_prime.c     |  0
>  tests/{ => panfrost}/panfrost_submit.c    |  0
>  10 files changed, 63 insertions(+), 33 deletions(-)
>  create mode 100644 tests/msm/meson.build
>  create mode 100644 tests/panfrost/meson.build
>  rename tests/{ => panfrost}/panfrost_gem_new.c (100%)
>  rename tests/{ => panfrost}/panfrost_get_param.c (100%)
>  rename tests/{ => panfrost}/panfrost_prime.c (100%)
>  rename tests/{ => panfrost}/panfrost_submit.c (100%)
> 
> -- 
> 2.43.2
> 
