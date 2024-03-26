Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59657C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 10:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F002010E4CA;
	Tue, 26 Mar 2024 10:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7aoak71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BE010E4CA
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 10:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711447255; x=1742983255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ulHwePwxTYfWOlg3YmsR4AYRxQ+B6ivvlGbBJumRMh8=;
 b=k7aoak71dTThinircNq9sBVCB736sLjX26XCs0OfZj1GYqAu7EYpnGSS
 FzVBzzJ8CejNJGSLbIx4CDSf+fSJu4rWrBB8FjHXSL+xDB9ityBL08kDo
 sqnplSq7x0EafpTh1e1OWv11UFOh5SvPOIzI4adQaxRDaEpaeNDLZjxMu
 6eCiUZo6kIeAas9pVCkaS2OKJhBeuhvEJ4S3zQGSU89Sj7HzxnByfINuf
 TgBuqrvbHlYOyst2xj3kkqhrA3g645wP6FeYwKuUM4fRVVkiFCQS3ww8N
 08AzOHPp1m1gVEwkK//6GQ7TzRd7PvSzQBBHMGEgq+1zLpxNfzwZeiErt A==;
X-CSE-ConnectionGUID: MRVOf0EDSJOscC3+vh856w==
X-CSE-MsgGUID: 5uNVeBq1QFerXYCxK+3rxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17120052"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17120052"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 03:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="15890840"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 03:00:52 -0700
Date: Tue, 26 Mar 2024 11:00:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>, oak.zeng@intel.com,
 jonathan.cavitt@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: Fix WB caching PAT index for
 coherency mode
Message-ID: <20240326100032.nwx64lc7rd4ac4d2@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>, oak.zeng@intel.com,
 jonathan.cavitt@intel.com
References: <20240325212700.127810-1-jagmeet.randhawa@intel.com>
 <20240325212700.127810-2-jagmeet.randhawa@intel.com>
 <da64d666-7cae-4ed8-a298-9b588374aebd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <da64d666-7cae-4ed8-a298-9b588374aebd@intel.com>
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

Hi Matthew,
On 2024-03-26 at 07:51:44 +0000, Matthew Auld wrote:
> On 25/03/2024 21:27, Jagmeet Randhawa wrote:
> > Resolve a coherency conflict by setting the
> > correct PAT index for WB caching with
> > intel_get_pat_idx_wb(fd), addressing the
> > mismatch between the default "XE_COH_NONE"
> > coherency mode and DRM_XE_GEM_CPU_CACHING_WB.
> 
> Could maybe reword to something like:
> 
> "Ensure we set a suitable default pat_index, which is always compatible with
> any CPU caching mode, like intel_get_pat_idx_wb(). For example, currently we
> are blindly selecting pat_index=0 which has COH_NONE on LNL and then
> attempting to use that with CPU caching mode WB, which is not supported by
> the KMD."
> 
> > This conflict occurs for VLK:54352.

Also please no VLK in description, if you need it add that after "---" like:

---
This will solve VLK:54352

so later it will not be merged by git.

Regards,
Kamil

> > 
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >   tests/intel/xe_vm.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index 7c061c497..1f458174d 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -1789,6 +1789,7 @@ static void bind_flag_invalid(int fd)
> >   	bind.bind.range = bo_size;
> >   	bind.bind.addr = addr;
> >   	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
> > +	bind.bind.pat_index = intel_get_pat_idx_wb(fd);
> >   	bind.num_syncs = 1;
> >   	bind.syncs = (uintptr_t)sync;
