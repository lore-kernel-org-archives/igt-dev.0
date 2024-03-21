Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E992C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 09:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B81D10E50A;
	Thu, 21 Mar 2024 09:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mw14m1k0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1885110E501
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711014798; x=1742550798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TfxNp2yy/TpMDvntR+xKIfRJPjekqnUDLD7qzRnFRhU=;
 b=mw14m1k0YHQmewwZ46JSn+ObpdWkVjhApxKVUNJtnqVYEJiEU4O12l3m
 UHFWliVBUsdlYme+HFWtFodJX1RoviA1aOeIwA1MuB14z0Id2Qsp8Dqdt
 fgbwMXiO6QuL8GYFD/qoaYBs0gyZwMXx2ht3gewq1UQDFxiTeOq90MV3W
 7yZe2Gn3ABjuguQXgb00kNM+cIs6zEAIRvGYjmsPXhY4Lpcqb9EwG70RD
 2O/ty9zruFPgYu6TbhuD4WOZyAXgIwCJAWA/M2XnzhBEvmd/F+SJptuTf
 O7qUJ6aA9brd8cG8jOv0v72m0tlDlnMMaYHhbB8BEsv34XQ/f8oYA+iO6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16630904"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="16630904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14349482"
Received: from unknown (HELO localhost) ([10.245.246.249])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:53:16 -0700
Date: Thu, 21 Mar 2024 10:53:13 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] lib/xe/xe_spin: Update xe_spin with exec_sync
Message-ID: <20240321095313.lrnelnfohil4wvxw@zkempczy-mobl2>
References: <20240320155430.11877-1-sai.gowtham.ch@intel.com>
 <20240320155430.11877-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240320155430.11877-2-sai.gowtham.ch@intel.com>
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

On Wed, Mar 20, 2024 at 09:24:28PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> When a spinner is submitted with LR mode, exec_sync can be used
> as GPU address when sync is passed in via exec IOCTL.
> 
> Cc:Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/xe/xe_spin.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index 5c8c45143..87b7c1716 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -38,6 +38,7 @@ struct xe_spin {
>  	uint32_t start;
>  	uint32_t end;
>  	uint32_t ticks_delta;
> +	uint64_t exec_sync;

Agree, you need userfence variable gpu may write into on the completion.
It would be good to add userfence path to xe_spin (via some opts) but
it is not required at the moment. So:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  };
>  
>  igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
> -- 
> 2.39.1
> 
