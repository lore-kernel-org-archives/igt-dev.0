Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07A1FA1FD8
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 16:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6455210EEF2;
	Wed, 22 Apr 2026 16:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mzdu5/KU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200E010EEF2
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 16:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776877100; x=1808413100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K1y7bZ8TsJMC1hFY0ntdg9eSjU3tTS7tjMux9NgviXk=;
 b=Mzdu5/KURV2jSjJ6moJf2b4Hlz5f2gcf+8+fl13ZrOLDIVBK5iSoMfbf
 LvNLU3uIGGoVRTklKsK+RP/Z6MevOhAzHPZ3hEVtQMFViY/xEHLziK/f8
 dTfGyk3+hMrQLEy2S+svLf7c4OKGMiC2nEGkIsIbAfdWnvFZPTMpXf+Yi
 hbSAAI8mTEiQjEY3/LSPaLG69RglF4SDsjuqrjAfUDalqNL9ok5tb2rmz
 bqMjbMSqihPuIodez+TyG7CDpRbK33ZNXqp/m+igVa5VV15f51xacdmCw
 9CKOyAz8OQOy1rgC1USFCw05bPg32sn21jtoPhu9yAkbBnCfeGVlYRYt2 g==;
X-CSE-ConnectionGUID: fwszsewaT2qKpP3dBfk2kg==
X-CSE-MsgGUID: wrIzw5zDT/mgfvlo7lEyVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77714580"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="77714580"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:58:20 -0700
X-CSE-ConnectionGUID: xChiRtoeRgCDtxoTShuzhg==
X-CSE-MsgGUID: gWjHZDsqRe2NElBA1qrkrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="237449331"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:58:18 -0700
Date: Wed, 22 Apr 2026 18:58:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: Create proper error report when
 open driver fails
Message-ID: <20260422165802.qbjbna3wqltfvfkp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20260421145950.55091-1-kamil.konieczny@linux.intel.com>
 <sxd77athu3dccaza6poyxj2quzezvkuqel3bwbdxbcg4tklz7g@tokhbcpvqfqg>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sxd77athu3dccaza6poyxj2quzezvkuqel3bwbdxbcg4tklz7g@tokhbcpvqfqg>
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

Hi Zbigniew,
On 2026-04-21 at 17:42:51 +0200, Zbigniew Kempczyński wrote:
> On Tue, Apr 21, 2026 at 04:59:50PM +0200, Kamil Konieczny wrote:
> > When first try for opening driver fails then opening function is
> > searching for next available device. When that also fails
> > reporting is printing last errno which could mislead developer:
> > 
> > $ build/tests/kms_dp_aux_dev
> > IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
> > Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:754:
> > Test requirement: !(fd<0)
> > No known gpu found for chipset flags 0x4294965755 (any)
> > Last errno: 2, No such file or directory
> > SKIP (0.006s)
> > 
> > ls /dev/dri
> > by-path  card1  renderD128
> > 
> > The real problem here is lack of permissions as there was a card
> > but program could not open it. Break looking for a card as soon
> > as an error is different from ENOENT. It will create a proper
> > error report which will print:
> > 
> > Last errno: 13, Permission denied
> > 
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/drmtest.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 4a788ea7a..66982f653 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -443,6 +443,11 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
> >  		fd = __drm_open_device(name, chipset);
> >  		if (fd != -1)
> >  			return fd;
> > +
> > +		if (errno == ENOENT)
> > +			continue;

This 'if' is redundand, ENOENT will be catched before reaching
__drm_open_device, in line with a call to _is_already_opened(),
so here only break is needed. I will float v3 with that and
will keep your r-b. The only thing I am not sure is it will
break flow for any error, not only EPERM.

Regards,
Kamil

> > +
> > +		break;
> 
> LGTM,
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew
> 
> >  	}
> >  
> >  	return -1;
> > -- 
> > 2.53.0
> > 
