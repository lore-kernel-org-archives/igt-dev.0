Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1313EC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 06:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA24910EE82;
	Thu, 25 Jan 2024 06:06:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA28B10F7EB
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 06:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706162772; x=1737698772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uP2TL0LUYKsAcySoy1vUe4b0qS2mIdefxXC44NXKHNI=;
 b=IdPas6X9NQsO1Vm69Un5CVHscHtWLmtUy3pwqQ09A2CpBsW6DKW2TVVB
 GHt38cDNUeVM6fDO+Iclp8GEDkPICjMXaCfkoVsTqKRxrhhfsYGZmAYYm
 5D9r+6DYRwbwi6wGUD6p/kgnvaGOt1S6fg79Mhb2jSLp2ncHUj0y8dqGV
 7lq2ceiDrpvjewDJbhHFYDZ4DN0pnGixaMxclrXtCSaWVa/TE7YW5yaeE
 /FHOiPMN+ciuCN4myeydDNrMsDmhWVCB0WEHTuhJKAANrG79AqrBR57x9
 Y1peebu+msaHXmtx5GcnBy1qPjc1NtRxeOo1iuiOuXlSWq2puGwEXRJkb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8832247"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8832247"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909898188"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="909898188"
Received: from unknown (HELO localhost) ([10.246.28.142])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:06:09 -0800
Date: Thu, 25 Jan 2024 07:06:06 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 1/5] lib/xe/ioctl: introduce xe_bb_size() helper
Message-ID: <20240125060606.tv5ytvi4kwhjwlbo@zkempczy-mobl2>
References: <20240124180713.268843-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124180713.268843-1-matthew.auld@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 06:07:09PM +0000, Matthew Auld wrote:
> We have a number of tests open coding this, plus some tests lacking any
> handling for the prefetch size, leading to CAT errors due to overfetch
> hitting an invalid page. End goal is to fix all the tests that are
> missing the overfetch handling first, using the new helper, and then
> convert all the places that were open coding this.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 6 ++++++
>  lib/xe/xe_ioctl.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index d3f9905ee..da2a7af51 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -51,6 +51,12 @@ uint32_t xe_cs_prefetch_size(int fd)
>  	return 4096;
>  }
>  
> +uint64_t xe_bb_size(int fd, uint64_t reqsize)
> +{
> +	return ALIGN(reqsize + xe_cs_prefetch_size(fd),
> +	             xe_get_default_alignment(fd));
> +}
> +
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
>  {
>  	struct drm_xe_vm_create create = {
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 03932561d..2b30f1d98 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -18,6 +18,7 @@
>  #define DRM_XE_UFENCE_WAIT_MASK_U64    0xffffffffffffffffu
>  
>  uint32_t xe_cs_prefetch_size(int fd);
> +uint64_t xe_bb_size(int fd, uint64_t reqsize);
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
>  int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> -- 
> 2.43.0
> 

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
