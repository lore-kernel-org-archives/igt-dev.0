Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDEDCCF2D6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 12:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201D910EC66;
	Mon, 19 Oct 2026 12:21:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272610EC66
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792412403; x=1823948403;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a0n7agC77hxkeIEsWkU+gSVeuHUOJNC1ssdXQ3WbxWg=;
 b=UVrYqfw71akkPVmpdRnQqh/iPXd517wjf5Kzj33eay/RNUXqdjx6uxbP
 e7D4QEf+f6TIpqQ8wrHa6ACQn9jYMYqToZQvP/d+p1P7ejILE6gCniqGd
 jcHPpA/cB1G4VF3dCqf6UyfvdcBseX8HfkC0NDuPgQs3tNF4fY9Zy8yMs
 KyTEgrV3yElUX+AG1HysHY6LFr2p6yWdABuVk8b5tOlkIsN3TrxocdqeL
 LGSGaBYFCGcgjxHp7tgO639dIQEqFrO1DfLkIb6Wak+rAM6E1kqZq+TxR
 c/eo7jiRdF+10JT2heFELBgnUmEWq1tCc8zif+uiEbx/eN/B3Iv0XUozc Q==;
X-CSE-ConnectionGUID: MGEGiJi8T3ql/uO78V7cPg==
X-CSE-MsgGUID: XE6nmkr9Rai6x1KX1+pAgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1077909"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1077909"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 05:20:03 -0700
X-CSE-ConnectionGUID: jgIylsPmSVC7Tn1nz+gDww==
X-CSE-MsgGUID: 8WHlbgpITUKhFGlIoszq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2458771"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 05:20:01 -0700
Date: Mon, 19 Oct 2026 14:19:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, steven.price@arm.com,
 daniel.almeida@collabora.com
Subject: Re: [PATCH i-g-t v2 2/2] panthor: test dev_query buffer size
 variations
Message-ID: <20261019121958.wenkycq3asuxmch2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, steven.price@arm.com,
 daniel.almeida@collabora.com
References: <20261016-b4-dev_query-v2-0-067661858810@collabora.com>
 <20261016-b4-dev_query-v2-2-067661858810@collabora.com>
 <atXulMD8MjB_Hx3E@e142607>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atXulMD8MjB_Hx3E@e142607>
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

Hi Liviu,
On 2026-10-19 at 11:19:00 +0100, Liviu Dudau wrote:
> On Fri, Oct 16, 2026 at 03:35:46PM -0700, Deborah Brouwer wrote:
> > Add tests to check that the kernel driver will gracefully handle userspace
> > buffers that are smaller or larger than the kernel driver expected.
> > 
> > Also, add a test to ensure that the kernel driver will provide the size
> > when the userpointer is null.
> > 
> > This ensures UAPI compliance for DRM_IOCTL_PANTHOR_DEV_QUERY.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Best regards,
> Liviu
> 

Applied, thanks!

Regards,
Kamil

> > ---
> >  tests/panthor/panthor_query.c | 56 ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 55 insertions(+), 1 deletion(-)
