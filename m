Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1587D2069A
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 05:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A70210E671;
	Wed, 16 Oct 2024 05:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZoLi6FpV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DAD10E671
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 05:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729055389; x=1760591389;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5MHQVsX2RnGEe2EKbCBaYTWUK8MnQu0S/o+U6Gx1doU=;
 b=ZoLi6FpV8NodBk/DleRx5ys8aeTR5QwgL2feeb13zdMxLTRulCjEPk+w
 VoSVWCaVGKnwpcx+n2UsIm9oah80Vmsrh+TbUkkPLCii0BSKoka1Hkor0
 5/oJbKStv/TvZPmB54OU55kTYuPjv11wCrWViOkmhGVytnQcdMCeXZtz5
 EbShz15sU4uG3fyvG+Lz8xUqV5pAcrbWWIlrln81CyfO+1M2c5dM1DXpN
 nu71SocpGH8N4V7rsfXAltKiGD//iG1ZC1UnFPbuPXlOklg3adWHDCHfA
 G6v4Q422WcB2vrG3NoE4sMbgRQhtW0upT/NyYQtsi82dLCVrgraofcYLL w==;
X-CSE-ConnectionGUID: V+nsOeW9QtegumiifqCvrA==
X-CSE-MsgGUID: 5zoCFOPeTEOnp5/wXSLUTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27923479"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="27923479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 22:09:48 -0700
X-CSE-ConnectionGUID: vuUtAyHcRnG7rRKPIZasAg==
X-CSE-MsgGUID: SaZ36w5UTg6JOk8xOUoffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78179398"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.76])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 22:09:46 -0700
Date: Wed, 16 Oct 2024 07:09:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/gpgpu_shader: Add x_offset parameter for
 gpgpu_shader__write_on_exception
Message-ID: <20241016050943.f6i756jhvooimh65@zkempczy-mobl2>
References: <20240925133003.41959-1-christoph.manszewski@intel.com>
 <20240925133003.41959-2-christoph.manszewski@intel.com>
 <20241001150705.kysozwio55lgypsk@zkempczy-mobl2>
 <a3d7d480-3ef2-489e-89a3-79553dcdfcbb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3d7d480-3ef2-489e-89a3-79553dcdfcbb@intel.com>
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

On Mon, Oct 14, 2024 at 03:49:27PM +0200, Hajda, Andrzej wrote:
> Somehow I missed this.
> 

<cut>

> > >   	// Check if masked exception is equal to provided value and write conditionally \n\
> > > -(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(4):ud		\n\
> > > +(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(5):ud		\n\
> > >   (W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
> > > -(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(5):ud		\n\
> > > +(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(6):ud		\n\
> > Adding argument in the middle of the list makes a lot of noise in ARG(x)
> > changing. What a pity we don't have possibility of making definitions
> > like:
> > 
> > #define x_offset ARG(1)
> > #define y_offset ARG(2)
> > 
> > in the code. Changing definitions would keep code clear.
> 
> Why not:
> 
>        emit_iga64_code(shdr, end_system_routine_step_if_eq, "   \n\
> 
> #define x_offset ARG(1)						\n\
> #define y_offset ARG(2)						\n\
> ...
> 	mov (1|M0)               r30.6<1>:ud    y_offset:ud     \n\
> ...
> 

Great, I forgot this is preprocessed first. So we need to refactor
this, it will be likely quick and easy.

--
Zbigniew

> Regards
> Andrzej
> 
