Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10BAE8305D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 07:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6891410E535;
	Tue,  3 Feb 2026 07:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAeZwoE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C163D10E535
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770105480; x=1801641480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vAcepsi+IVhk9cGhsl0LZ+YG/M7xTi/3f7yVbkDlHqM=;
 b=eAeZwoE0CoSfFIL96c+uG3Cg6HoaA/mN8NBYFDjcpFOiLQH2kAsQkeWk
 jaqK1iWwqJ44EU8NiqoYRSjZMJsF9PNeLa+nqpKM/+whFB1BRlJlGgpIF
 DW80q1hGfQnNheoNs7g3iE1NJKBpu2WdNx5SwKHLFeY/GwPqtU/0TNUji
 oiNvkFFqJSIxEr4tXH3zyoZGCh7AZx80MeYdm8isVOfvJXGvA2NtkiXoN
 JW7ZpsKIijTrOcXHAirr9qB3Jw7qyIttx5uU8ykzkq/8QVXbhZ2/HgRCx
 o2F/m4AS0eKlq6NczPU2WJr27ncIEzeF864JQe4scuMeQMaNydYl5PETf w==;
X-CSE-ConnectionGUID: vY9jJq+lQNOKfHYl+XaebQ==
X-CSE-MsgGUID: +raq1T9WS1Wc1NLVA4KvrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71432891"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71432891"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 23:58:00 -0800
X-CSE-ConnectionGUID: pw5inQ0LRuuu3B6c3096ZA==
X-CSE-MsgGUID: Mm93vNcWSgK7nTUpPw1zPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="247381382"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 23:57:59 -0800
Date: Tue, 3 Feb 2026 08:57:56 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t] lib/intel_compute: Wait for compute walker before
 returning to ring
Message-ID: <qpbdm4jnjgoeygdnrbdjvbqx2arrp64cuze62izvzvp5v6xbaw@76hvvll2vrzb>
References: <20260122104528.980532-2-zbigniew.kempczynski@intel.com>
 <aYCxngV3yoXnYQaR@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYCxngV3yoXnYQaR@fdugast-desk>
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

On Mon, Feb 02, 2026 at 03:15:58PM +0100, Francois Dugast wrote:
> On Thu, Jan 22, 2026 at 11:45:29AM +0100, Zbigniew Kempczyński wrote:
> > Most compute tests don't need to synchronize at the batch level as
> > kmd executes pipe-control at some point. Last xe driver proposal (link
> > below) causes turning off preemption before pipe-control preventing
> > entering to SIP and finish the WMTP test properly.
> > 
> > Change adds pipe-control at batch level causing sync wait on
> > compute-walker and preventing disabling the preemption prematurely.
> 
> This looks right and does solve the issue when applying the referenced KMD
> change, so it would be necessary going forward.
> 
> For maintainability, can we please replace the 8 occurrences of 0x00100000
> with a define, maybe in a preparation patch?

Maybe emit_pipe_control() function similar to xe_ring_ops.c  would be better?

--
Zbigniew

> 
> Francois
> 
> > 
> > Link: https://patchwork.freedesktop.org/series/160113/
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/intel_compute.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index 00ef280e8f..8578b6e402 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -1694,6 +1694,13 @@ static void xe2lpg_compute_exec_compute(int fd,
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  	addr_bo_buffer_batch[b++] = 0x00000000;
> >  
> > +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> > +	addr_bo_buffer_batch[b++] = 0x00100000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +
> >  	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> >  }
> >  
> > @@ -2032,6 +2039,13 @@ static void xe3p_compute_exec_compute(int fd,
> >  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw62 */
> >  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw63 */
> >  
> > +	addr_bo_buffer_batch[b++] = PIPE_CONTROL;
> > +	addr_bo_buffer_batch[b++] = 0x00100000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +	addr_bo_buffer_batch[b++] = 0x00000000;
> > +
> >  	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> >  }
> >  
> > -- 
> > 2.43.0
> > 
