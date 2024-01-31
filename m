Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3D1C47DB3
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 12:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9245610ECDE;
	Wed, 31 Jan 2024 12:18:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6745710F9AF
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706703530; x=1738239530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nkxsnDmdFU+Ur2SwJvvNh2Sh8GCN+HRG/WB84XZxg/w=;
 b=NQTVId0K3yeJs+fkmGO38gKuVyInPl9WCJT8a89vclbpfrkQEv0iPG/s
 ndX+y0ugjs7tPWUicMHJ5X0EgD3koQZA4zOmFay1YTUMcKfUXp2bHK0T9
 78rb3isSm+VmXwITGduS7QoUvufkia+WI6PUNadVLrZ+rOaGQ6bKWFjY0
 abbqOa7lMeIlO41TyhF4WHjmuGrDCrxv7BuRm0V3kPNP5XpDaxq/iWzMA
 7uNmDtR9JhBLgF7nsgDzkSF/PknNr32kD/2Y3bY3T3Dsk5ziobwU+HU3o
 CSaQXMj/VzDWW08VslY2/V3E0CfAAEVaq3Sw1Jy3xmWPDQseKD3kM89Rt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="467821555"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="467821555"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:18:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4141300"
Received: from mmackowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.18.126])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:18:48 -0800
Date: Wed, 31 Jan 2024 13:18:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 1/3] lib/intel_device_info: set has_flatccs on LNL
Message-ID: <20240131121845.aen4sry4xtw2jbos@zkempczy-mobl2>
References: <20240131114305.202871-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240131114305.202871-1-matthew.auld@intel.com>
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
Cc: igt-dev@lists.freedesktop.org,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 11:43:03AM +0000, Matthew Auld wrote:
> Xe2 supports flat CCS based compression, including igpu. Currently
> HAS_FLATCCS() is incorrectly returning false on LNL.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_device_info.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index a669797c3..64b5246b7 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -509,6 +509,7 @@ static const struct intel_device_info intel_lunarlake_info = {
>  	.graphics_rel = 4,
>  	.display_ver = 20,
>  	.has_4tile = true,
> +	.has_flatccs = true,
>  	.is_lunarlake = true,
>  	.codename = "lunarlake",
>  	.cmds_info = &xe2_cmds_info,
> -- 
> 2.43.0
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
