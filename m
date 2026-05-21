Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C444CD343F
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 06:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF52510E164;
	Thu, 21 May 2026 06:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwJ2+nea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70A310E164
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 06:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779343202; x=1810879202;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WEqwCYoUC3+u6inIisOyKCCdYReP36Dn/893m3xGU1E=;
 b=RwJ2+nea6OMc97vGyNAAKwmYIIzHpEHLncPCivzck6IZaGHH9qXb9vln
 /A3IB9bFBx3jrFFAgINl24iQu+c2Mx86QidJ5wMlG6m/pW0OWKNg1hY8S
 +hyGaNmr/TxTxNs2mkbMYFqDlbcRsP8QneY5c12Y/xgHBof3N2J/s5++z
 ywdmLn4nGO+kZe8kGoUvC2lpjoGz4YedsGXHxMkC6Lqot8dWTKKIO/Jx5
 QTblfRYKyLs6RClZFNbgkUnlwokWEJcxWkrV6MczXUtDhjrJsLhd4WmZ9
 I0MHlMcvOps1iEP4b+kqLTA/qQ6QLWBPhi7Hgr5qsBCeY5t566i2QL1vT Q==;
X-CSE-ConnectionGUID: QDgAkW2AQJWV9FKCWDvVMg==
X-CSE-MsgGUID: MIv4+yQxQR2R2KnkqzM7xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91647695"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="91647695"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:00:02 -0700
X-CSE-ConnectionGUID: XzEEDbHLS4ic3k+FSpIjIw==
X-CSE-MsgGUID: a5QCOF/gSjGSmDJstQosJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="237408305"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:00:01 -0700
Date: Thu, 21 May 2026 07:59:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib/intel_compute: Improve executing
 large-buffer compute on pre-Xe
Message-ID: <dyape5ygtb2kaalzghwlchgwztlow34vry3xvhzgkecmuy5nw6@xqd7loy476nm>
References: <20260520090034.463367-4-zbigniew.kempczynski@intel.com>
 <20260520090034.463367-6-zbigniew.kempczynski@intel.com>
 <ag3aeztTvOOxk-MF@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag3aeztTvOOxk-MF@fdugast-desk>
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

On Wed, May 20, 2026 at 05:59:55PM +0200, Francois Dugast wrote:

<cut>

> > @@ -706,7 +719,8 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  				       uint64_t addr_surface_state_base,
> >  				       uint64_t addr_dynamic_state_base,
> >  				       uint64_t addr_indirect_object_base,
> > -				       uint64_t offset_indirect_data_start)
> > +				       uint64_t offset_indirect_data_start,
> > +				       uint32_t work_size)
> >  {
> >  	int b = 0;
> >  
> > @@ -714,6 +728,8 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = 0x00002580;
> >  	addr_bo_buffer_batch[b++] = 0x00060002;
> >  	addr_bo_buffer_batch[b++] = PIPELINE_SELECT;
> > +	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE;
> > +	addr_bo_buffer_batch[b++] = 0x00180010;
> >  	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
> >  	addr_bo_buffer_batch[b++] = 0x00007034;
> >  	addr_bo_buffer_batch[b++] = 0x60000321;
> > @@ -735,9 +751,9 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  	addr_bo_buffer_batch[b++] = MEDIA_VFE_STATE | (9 - 2);
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > -	addr_bo_buffer_batch[b++] = 0x00A70100;
> > +	addr_bo_buffer_batch[b++] = 0x02FF0100;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> > -	addr_bo_buffer_batch[b++] = 0x07820000;
> > +	addr_bo_buffer_batch[b++] = 0x04000000;
> 
> What are those changes?

0x2ff - max number of threads, 0x400 - curbe entry alloc size.

Taken from compute dump on ADLP. Curbe alloc size is likely safe, but
I didn't check max threads on TGL (I'm going to do this today).  Neo has
code which establishes runtime settings according to device underneath,
but in IGT we just pick some safe values and hardcode them.

--
Zbigniew
