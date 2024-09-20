Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC6CCF9C5E
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 17:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8949C10E069;
	Fri, 20 Sep 2024 17:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jjhb01ix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB51610E069
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726852637; x=1758388637;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q16JAyhig4Qm8uHfG3JnnSPvZTefIUStF04lE/khM8A=;
 b=Jjhb01ix87an+K/5MfzmpcEcmXY2ArwKC0EGXAaEpk+SrEMsPhQ8iETq
 ZQta3jz4OYIQXvTbDcgR3VzXm4MRZegBteIuxC5864IZwNZBBS/AIEbaT
 93MGLq7HQu6QcrNkitd8qvZpx2nn8BnGIhJPCQoka1t6kg10GckxWZzwc
 XWbyQcQmZpDMVofTGaUPqdrqVfSLxF6UyW3yV0x/StEWXAafSe6LBD3VB
 T8oKcGVhUNI6U8u3x0A67nd1S95RjAwVBx4kaLrgqWPoqGnoI6dFi75Bw
 Wj2rx/sDRQBFuBGLUKef3yBoP6FrYc/sZgOkE/v9L9iQTe9flyDDF17ix g==;
X-CSE-ConnectionGUID: ThMrDlw9R6e2XqjHIb4eOw==
X-CSE-MsgGUID: jlCJnzNdRN6NVNunjYYCnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="36454888"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="36454888"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:17:17 -0700
X-CSE-ConnectionGUID: BPb5G/9gRU2tu52/wVp5TQ==
X-CSE-MsgGUID: /zMhPcybQmaYkAcai9vuog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="75138991"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 10:17:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 10:17:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 10:17:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 10:17:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 10:17:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 10:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGVoExqqh2ouziPiIZ52iZ8sz0tII/INZFwymxN/eFYKAJVQLTGTIXmDZwkObpkhmwckd9cGOEbXCQw2D+P+0JucuSYBgjXJ2XCHB9D8uatZ61YOHVWgJ0ILcukfWiGHGNzqT6kUFoSfNmjq2na+/qX6W6Qz7BsWArlw7ZtNzNUAwFRnuMFOWPbCHrGzDt1mGplrWWcMyQjlUiOy8+qWvrOlTNLluFr5towjTbpl5A10tURlOA6lDvv92KXWQg7GLiKBIXoi7WUa6b6MYAjnYxD0gm43Y1qBMJxEQjQ7/A2GCsyx/dK9CehUM+u34BmEbSKCcz5zCgHQBhJH+6elRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kg83fVUZoiNkMvsaiE4XsSFWvG2D6xLhKVjjBYrHgtk=;
 b=QANBe1dk+jeyz2PHrdHKKSC1XxpAOl5By4WGgpyyLNHUH/SyEoyNv1D2X5MQPwCRkMbRKslmkzfPoYow447gaAN2U9BazL5EOTVpf4H9xT+LA/wQNkpAahu9NHvLLcE7/3SKsRHivABy3+xgy8PPvKZsVoBEXCAWe7yFaKiG/CqddVIN1Ib6lOqBN98+A7Rcppcm/YjgGLXBI9jEpE0TP4YqzJIrtwESZQIXKdvVGu56Mf2LEO7KxnL110s97CqZhp8HAagrFHTDhgGEl3uThokDEuL99bKNuBkb5LIIV+qG4psCLHNRcaRweFEJFqdcyqWrx5ixyNRyreP0gAkj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DM4PR11MB7255.namprd11.prod.outlook.com (2603:10b6:8:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Fri, 20 Sep
 2024 17:17:13 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 17:17:13 +0000
Date: Fri, 20 Sep 2024 10:17:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/6] lib/igt_gt: Make igt_open_forcewake_handle()
 xe-compatible
Message-ID: <20240920171710.GO5774@mdroper-desk1.amr.corp.intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
 <20240918163629.1186314-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240918163629.1186314-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:a03:54::33) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DM4PR11MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8d3be6-9eda-46ad-f695-08dcd9981151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tKTQLbmYPwn/y1U/MnsYWKXRjYrOu9ZwF6FTYXnYOnMKzPitf03zeu+y5Kzq?=
 =?us-ascii?Q?XgVwic2PhFw5VPnGNVMm0jcQR7deSbxO9b2d5mIio9m3fVHruuPleZ4wqoWh?=
 =?us-ascii?Q?EvG2OAIVgj9POij+qWyDVOyOzGEuXbqtwmmnK1YyoGJlwt4XwPlhTEjwZAli?=
 =?us-ascii?Q?OAFHDxRhsNckai/5jTrj9HSAFAmrNhalRJX66oREfvGkdEDelC0D4jeuPBmP?=
 =?us-ascii?Q?Ed8Nki6oUF5PZWpQcJuM1DX7mQAYd1fHE/yOFRlIi3A/lZu4hty2KFGyln1H?=
 =?us-ascii?Q?TRdPnZ7TJ/YcD4v28sZgy6l+DQbhVguaObERLCQAK5NRRGTPGCf6Gf0Sw8EZ?=
 =?us-ascii?Q?vLM10aAKtn9+Y3Sk8svhMwFiY98xOtTUt5TIbEOy6jcGme6JKqUBcxTfvMZl?=
 =?us-ascii?Q?A7DhUy9ypH51MA7bsd/aeBRBkKSu3Um188JEEZwkip/1lSagt8GHtv+oNFsH?=
 =?us-ascii?Q?5uRuY7LTelrvlXwVeoxqO6BjNVZ/gxLPbuUoiARoUpGfZDsTcSIZVlWFR4As?=
 =?us-ascii?Q?RbKUHlzT4Y1POs8LNhSgXQ1zPOmzsFxCmoA41AHcA7gBVNc0tUdeODhUfUdn?=
 =?us-ascii?Q?Kyj5EeYsJga3bCDXPqSFqmpaCNWLi2at5VBqOc8YGyv4oQiXHQhnXjud8yda?=
 =?us-ascii?Q?oHcfmnccbOSRGFg3NAO0qtGX3Y/IVZN1BWqFjJfRxNmlTKqW6BifypaGmHQU?=
 =?us-ascii?Q?dPHYfF5Ry5gj/t1PkQLUsGP4p8M/9xvF5uUy0hT+Kd2Sj+W1YKr1Panfbprh?=
 =?us-ascii?Q?208wIWuAwDlnXpU5DOBkN0v/+Km/DYw0znvN2t8LvXXeW1jxi8NjEgWhZcQl?=
 =?us-ascii?Q?gDhkZIDoSbCm1mNgS81roswn6gBAA7UhqLkVTLANd2+YVNPr3k+WF5DZHvAd?=
 =?us-ascii?Q?YQm3jM00dC+KDIiAQShylIWHkQZZ1eIqIXnU72VjYEX1O9M3dVTz+CoA5D5s?=
 =?us-ascii?Q?cU9yj1K7vkvymKezNPgEx9KfELstOV5KjSzwDEO4KNoZPt6T7gi+NxHdGx52?=
 =?us-ascii?Q?+3d3ikHTkGsn/iKPMeYX+KTD46RXU+bW6mLp8FnB8DtMdoDuBk2XmYHpO3Iz?=
 =?us-ascii?Q?l3lINOb5nRiWgCjwGCb3+DbmGXVJc3jYD+JV9QaaP5aKEp18NZaenojacL9w?=
 =?us-ascii?Q?jQadEShXzBXbCSOOfTxxRJ0909KmfXntukCKmuHvqBzyCQvW1bBam4nuSUPM?=
 =?us-ascii?Q?8Cck70++03+n47bZNNNbI8a2pIAIZOOVNK0BD99XmiOoQdObA5xMSMFbbg4D?=
 =?us-ascii?Q?Mo+92FVFwGMBb4ue39Kmd3QEf6m6ISh8psT42+WUeA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PODN1ouA1SY3AX5v5eDmted9nOs7Kd3tyYdTj8q8MZulygit71i9Yn78we8J?=
 =?us-ascii?Q?wnAp0QbqgsyZhb/hnx0JZ+lhvk6DZYKNGonupyzQBX9DCC4+cu/fA+UxgaLN?=
 =?us-ascii?Q?P5nWhHGRX7/xzx1tGzQBUVFPUnRSuXJo8Wrblf8wUVX1di0RUlDY72qgsYRP?=
 =?us-ascii?Q?MSsu8EBx/CNA8OUzlefLFA+o0RUpZSJoB3AyaZ+8lfuni1Cr0kiXHbe6Vvvv?=
 =?us-ascii?Q?ShmD3HoapoZIt45kj6HAJayf8NTBQhJCu+BiVBKnXn5EBIYm+kNW+/wlRJD0?=
 =?us-ascii?Q?qFVTcc0ISXPF2H/TEoi8UoivN+YbRSsAB6vRyLQvHW/ZSiQauM+UZo+5Nzwn?=
 =?us-ascii?Q?4c7cx85SgQKPRk1dAHWGScGHNvOz/o5AZb9XZF6U1cMrNarN5HomBIVe+GFt?=
 =?us-ascii?Q?+sDgbGRiobKG5oIcYfjgVAQ3kk48m7CY9Px5uY4dMbbQo6HJYhJu6bfcCCzm?=
 =?us-ascii?Q?YsF20k22TlcTdvlCt398w1gSIPG9go0M1rma9YFvKTo+RG1hoQAjyrotJjKg?=
 =?us-ascii?Q?jJM/ZtEpriyFMfZ8NjiwOwkg7h9gPX9S/e25mlE+t67XgYmeowW/E1yt43cn?=
 =?us-ascii?Q?U1/kKIP8ZGyv1Knyuk8/aYdh8yjFvkOMdc/qZvaC6TEQb2zgoANnjhTNFB2Q?=
 =?us-ascii?Q?pWCDgijt1IIGeE82EzIGqSjzNt7JI1B0UshKOUWeB8AeORkmf56/bm6yZAlf?=
 =?us-ascii?Q?WiQu9cIBIcSuo8STQowJeft1pZlupbIHB9WX9yRcOQ/XWbAyrlMPndD7PvT3?=
 =?us-ascii?Q?OQ7kP96eNI1tKF1KjapQk1kzXNuoI9OpeC7h4yHUiGDkwkEqmElom/NRYfF9?=
 =?us-ascii?Q?fOOcU0IKMmm3aT5y36g5XY/Fq6+tOVYSqSrO8tnAsaw1F4BSjHTxGwiuA9b2?=
 =?us-ascii?Q?zLcr+WRWNnUGwo3iIrPdRlCaBPJOdN8ZBB82I6zmkUhdm/PPUX+9dUtOAEbB?=
 =?us-ascii?Q?h1ryBvQrQwRukiL1jza8G5NhV42NKusR0LPO4vJXNwqdw/f9fbV2aE4s3Oci?=
 =?us-ascii?Q?W3pOs7K+5bXP/L5wVVgfMBVNj+cao+PGrwyxDNMbtmmmVsbQh7O175OGSGki?=
 =?us-ascii?Q?YTN4dmdlnor9+L19UWxGe5j44wqym8Tmnmxkcl3mjBNKkCHae/dnsHGxIi1G?=
 =?us-ascii?Q?dzK/MNPSd6t+HzMx2sq6g9QRwNKqYxXBYuLf/Nq7C++Jm1oxFPcjHr6mWi2j?=
 =?us-ascii?Q?2q/b+fHropg7I6KLmdEP0+6PmI4ZBNwC4qpvoBNc75pF+Ay8SDDTXpbIBwM1?=
 =?us-ascii?Q?RJVWkBPEQ9U8vA4f9xdiT7SofmNNBg2YyYaXhFh+MH6YJZ/R3OzqOT4Ynyxg?=
 =?us-ascii?Q?zeOUMeveE3umEIdQWf6gnl6kScuykF1LiMkwqZd/BuwOdvhZWhTsxmrvb9oi?=
 =?us-ascii?Q?yCkEFEwOxupAdXZFB166jH/wBe2f2thINE3VVQGfNH2kq6+LASJklidostHj?=
 =?us-ascii?Q?i19++RSmFC+jb98MnsMZYzU1hjWGT/E6ndZ3ZanTSapu5DGb7HbNLyBOm+0D?=
 =?us-ascii?Q?w+CeyvVQvSDPNp0DeKqcg1bpKWvfXGiflMKecoN1cDPjGbS84IsMhPmtJ5jn?=
 =?us-ascii?Q?2s1RsZai31+xm32HNM4rXtSp4HnBlIIhCdxhpOJDwBGmV3trAulzTtUecit2?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8d3be6-9eda-46ad-f695-08dcd9981151
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 17:17:12.9722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jL6cWDszQ9laOqoSl18rwvKX2yfvT49FeNiZdcW/52FHMpEpncP9Tnb7zy7A4ldnxAIlMrmlYhB/tozWonHyPw6QM2QEqIqtOrhmK0AkqrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
X-OriginatorOrg: intel.com
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

On Wed, Sep 18, 2024 at 09:36:26AM -0700, Lucas De Marchi wrote:
> xe uses a different file to hold forcewake. Make
> igt_open_forcewake_handle() compatible.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Matches the name defined in the kernel.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/igt_gt.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index d831d2448..c84368fbd 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -502,9 +502,17 @@ void igt_stop_hang_helper(void)
>   */
>  int igt_open_forcewake_handle(int fd)
>  {
> +	const char *fn;
> +
>  	if (getenv("IGT_NO_FORCEWAKE"))
>  		return -1;
> -	return igt_debugfs_open(fd, "i915_forcewake_user", O_RDONLY);
> +
> +	if (is_xe_device(fd))
> +		fn = "forcewake_all";
> +	else
> +		fn = "i915_forcewake_user";
> +
> +	return igt_debugfs_open(fd, fn, O_RDONLY);
>  }
>  
>  #if defined(__x86_64__) || defined(__i386__)
> -- 
> 2.46.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
