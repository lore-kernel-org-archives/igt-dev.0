Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE77C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 06:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB3E10EE50;
	Thu, 25 Jan 2024 06:04:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C0610EE50
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 06:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706162653; x=1737698653;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9sIrAF9v+X8RgHSlIPDxBT1u2p9gY2kANbNg9nrH5MM=;
 b=gfh2YvQbByCdFhACfsTnnFDYNiqfbRHJHTzFm2ZId6kIkDV6C+BHQM+f
 582IL245klKd/A9n1IUG1wmNPUo59ocJcJmk10Rtx+NMRN3Dr0PK3wuv3
 LSvE06k0f994bsltMNIW7hgzmEDHyoKGxpDgje2hU1Cg46p8ImyQOxnQs
 a7zIoLiFW7VCxKkUBY6rVm0TUzAtY9pTNgQ17MZ67zv4mImrWVyUQM0YS
 v1GMkGpxkU3YGsij5fX4K/ToCqzFfpWeE3nCI+rttVY3vHwfImfq7BlRh
 hRq4T1Qidfm4VW73SKQ7Y2a1JMLX+tVlK+5FJjeQgeQpycbiw43novK03 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1944353"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1944353"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:04:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959754650"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="959754650"
Received: from unknown (HELO localhost) ([10.246.28.142])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:04:10 -0800
Date: Thu, 25 Jan 2024 07:04:06 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/intel_blt: use BYTE_COPY mode on xe2
Message-ID: <20240125060406.bph2dokxbuhyeu4h@zkempczy-mobl2>
References: <20240123183323.173424-1-matthew.auld@intel.com>
 <20240123183323.173424-2-matthew.auld@intel.com>
 <20240124045608.5cph37f2evqkdsl2@zkempczy-mobl2>
 <9ff41e6a-de8b-48c6-b341-e665423b9cf2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ff41e6a-de8b-48c6-b341-e665423b9cf2@intel.com>
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

On Wed, Jan 24, 2024 at 08:37:54AM +0000, Matthew Auld wrote:
> On 24/01/2024 04:56, Zbigniew Kempczyński wrote:
> > On Tue, Jan 23, 2024 at 06:33:23PM +0000, Matthew Auld wrote:
> > > Currently we see various CAT errors and timeouts on xe2 when running
> > > xe_copy_basic. If selecting PAGE_COPY mode for MEM_COPY, the page size
> > > is defined as 256B block as xe2. Also the width should be defined in
> > > number of pages, and not bytes, which likely explains the CAT errors.
> > > However the caller in xe_copy_basic is not using a size that is aligned
> > > to 256B, so rather just select the more general BYTE_COPY mode instead,
> > > which should work for any reasonable number of bytes.
> > > 
> > > BSpec: 57561
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > ---
> > >   lib/intel_blt.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > > index e41e261ea..25d251c4f 100644
> > > --- a/lib/intel_blt.c
> > > +++ b/lib/intel_blt.c
> > > @@ -1613,7 +1613,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
> > >   	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
> > >   	i = 0;
> > > -	batch[i++] = MEM_COPY_CMD | (1 << 19) | optype;
> > > +	batch[i++] = MEM_COPY_CMD | optype;
> > >   	batch[i++] = mem->src.width - 1;
> > >   	batch[i++] = mem->src.height - 1;
> > >   	batch[i++] = mem->src.pitch - 1;
> > > -- 
> > > 2.43.0
> > > 
> > 
> > +Sai
> > 
> > At first glance I don't like removing (1 << 19). For M_MATRIX
> > we require BYTE_COPY. I'm not sure Sai is working on such tests
> > but we discussed offline sometime I would like to have such
> > tests here.
> 
> This patch is enabling BYTE_COPY mode. Setting bit 19 turns on the PAGE_COPY
> mode.  Matrix Copy looks to require BYTE_COPY. Also there doesn't seem to be
> a bit 19 on PVC, it seems to only support byte copy.

You're right. I incorrectly read spec and I've thought 1 << 19 enables BYTE_COPY.

From me then:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> > 
> > --
> > Zbigniew
