Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3C7C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 14:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812CA10E1C4;
	Wed, 29 Jan 2025 14:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYAhUQ0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7183C10E1C4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738160971; x=1769696971;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qPxnXvlBWdDYky2D/oVOAmQv0KSrJPRTwS6swQl/NNU=;
 b=QYAhUQ0qGr0gpI7d6VROviMKNUmlfJQCDCScDGDqmxNKaEzkR+ZoueOh
 qoYN6YZMApSnxJdA5tMDE4vIOxD+Br/IASNtwK3Zjf8rUHAPQAOGa7wQx
 ARzyH+A6SkpxT+wsc7Tvd0uVZ53KGH0r0xu4RrYY7IIx+shn0OnqjJZT3
 HTdou9XWo4C2+Qk0wwmKikGan2UEtyEN+rdc6nDBU8ZhcJZtJ4HAjmJdB
 nwZRVcDMqaJOY0F4ZGK2/vwQdbScnjVt85ElSsJlAUX9YoIM4VcLPKzjs
 955zxNyS7/n/WeQRR/H6l03XYJqhxf626nPQTdm3RzOMuXCxOgUu5lgxc g==;
X-CSE-ConnectionGUID: TMAOPY9cTfmeVjDBdJZfwg==
X-CSE-MsgGUID: B8MJhyzrSjS7+3NR1Yu2nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38705729"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="38705729"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 06:26:52 -0800
X-CSE-ConnectionGUID: tGXZoIAAS9OwYOOvAS9Dog==
X-CSE-MsgGUID: bZTbGnWqS7iLOwqjkBs8ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132314438"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 06:26:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 06:26:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 06:26:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 06:26:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojudaRmfLW7m5IUHDTQ8GHwvdlp/VqYRUDdKp0Nl9n246ixn5EBAr2W/DrLK0zfKAl2nXuZOXjj2+xjdV3iHrDFf0uCSQEr4LQtMzhYcwAF3T5655wkA3+zB6qIodOgdoWsAQZSsl7t1nn2yMLw+AgZjZfA0wki3yVUqMdyzrMuooSzkXIzQzOJpuZpqmEZ7EhD0yPb1vB8SrrT10aV+z6TMm0jmQHridWW4wPydiaKYTCHhKG2xvSSI3jPNquACIo0zgKkqrfu8N+f5jr5jL4a0JDKK6DSCiHq9d+/0S5kkQTTjolsy0SGYezims2llKFi1gApgEFnfygeS2R5K5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L35lWxPp62LzXn8jdKyxsaaQTKay6Dvkl/yhu4nwrUU=;
 b=wgX/5UEvBVMi4G4K2/hNBq8YLaiNTJ0fvW20dwzlV9kdbC2oGStfXC2caiCrPGC6Lj0vyo+SPoSYtv6DLAnnjeNI5x2I1r4xMWJBF9DH94dhmkTj4BYpCbYw/1XwGYZFRfEVTuJRx84jc7jCT4W8JqRtb+LQUqza2BW7IV0r56ON7IcsCSu+I5iHlWFOPJm+pS7nkk3yTtvkpy0sJcZp8UJEijNe+apXjyD8rJbKjn9j9fDAUccx0WTtf8RNG8RdVcLa6XwftyB9iU09RGUcwwOZ4APlo1sTsW4H9j160xolo8JvC24gPCv7jX+CyrstuacxxZbf2X5OFS3HJB7Qow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA1PR11MB6822.namprd11.prod.outlook.com (2603:10b6:806:29f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 14:26:49 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 14:26:48 +0000
Date: Wed, 29 Jan 2025 09:26:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t] lib/pciids: sync with kernel
Message-ID: <Z5o6pf5VPssrPQPV@intel.com>
References: <20250129105902.120630-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250129105902.120630-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:303:b6::29) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA1PR11MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: b61884f9-77a4-44b9-cbbf-08dd4070f706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PdS13yquKRbfvtv4ogfYT2ZR9CkQnzaVAuecvRxm34D6JzarVQnDRrePDb/1?=
 =?us-ascii?Q?MSJ9AQNgGvHYA6kKjeqC/zGYmvHJ4Ctviaz39xlznu45QZlEMRPMvpG/bA0H?=
 =?us-ascii?Q?9W8X8WDW3ZVWMIkqCS6cDSzc+9Gr8i/6l1K/MnDOXy766zH0UldIKFHaJ6iU?=
 =?us-ascii?Q?H2JG9oHAepGRICQiHfb3qRQztPdI7CxL3cVPiV6DFHu3ugKZoRQ9gWyIXGRr?=
 =?us-ascii?Q?X+G62HM4dM0kbxAi1VpXUlXk0mfT9krO10G9dTMKpLZ1gGId2l9VZJmvg1oF?=
 =?us-ascii?Q?88lE5/GXdUbAF0tZ3pQPsGDK3axrni11yYKbuv29j9dp4512sJHGy9dlVtxo?=
 =?us-ascii?Q?ocVgQCz0n42uMoSTsfZ10wFk039jbxxVMP7IMZTeHE/7dSJfiNVaG1BON+eq?=
 =?us-ascii?Q?oySza636jGMU0Bp2nxUdLqi73iWZeQJfLRSC6+m3uCSZ8+i0sFHcEbaFFNWf?=
 =?us-ascii?Q?D2lqBuYbaTHhx3wyq5J4rCt98TmMd8jpp/r4eXqWCWfCAxgcYTdrJwgqWLlV?=
 =?us-ascii?Q?1BZ8BFmBAmk88JWvswsSLML4DjKWpQaaeB09uJI3qbw9McFpjQ1rV4/1ofOJ?=
 =?us-ascii?Q?LB1PxRz+jEZH+6PadJeswe75rVNl2H9nCp/eAmxunbhB+qSuWX3oknExpuUR?=
 =?us-ascii?Q?5ExhQh9KKkp9ukP7dxiVnX754tQpkhD3Jmv7tAeY3C6leH0C5nAtGBkkHvax?=
 =?us-ascii?Q?rii5wzIjADN/2YQZCIu56e8JP2OicZUQfK2sYLrG+9nEG7cmpgoDs5cuhDTr?=
 =?us-ascii?Q?GnFk8PTKjU5A3t25siA16ZJXlawrQ1eZ3APrICw08BkhKzGCVLLoOuL/MMjD?=
 =?us-ascii?Q?T+bHoVqedyQd3nzwj4G7DWK2j3qMAMIV5pmE0T+ssZr0i7HcZ2UpVPjTtYIR?=
 =?us-ascii?Q?o9yAlaC4qthBIwVI9iMihQKCUybbo2vFAYlpkdiBihYY/Y4SqMdfEAeb868v?=
 =?us-ascii?Q?aa3G5sq77EKSL4mCxTc9AIY0nuAIjxn6Bug1u+yz5oKzw0SYRbqLSBZj4sB9?=
 =?us-ascii?Q?OMkqML7TzwS8Ige6qLTKbwup0RX2jhBEROIV7e0BiFJNy3ngjOya68pW+EFX?=
 =?us-ascii?Q?m6PVAC+CF6lpTTxP/1qgfJSazS7PZ1bCrPuJNDZE5A54aps8jY/oWFvsrKrj?=
 =?us-ascii?Q?8n3oirajBaiNbglWg9yLGzLOfHKokQzv2HWachqD7wn80ZJL0DRFmega87U3?=
 =?us-ascii?Q?PmH3pK0ha4anDquvdLNNw9pVG9NAGujQUdGtJ7VpG3uihFZ4+ClfzCENv9wD?=
 =?us-ascii?Q?87K9774Y6wYVtRp3MinNHYyFW+vQsXWPiRP4FPOBNjQTvey/+UDntJrP3rUV?=
 =?us-ascii?Q?0dmB2oXryO3Dyy4pl62pxC2662LqXg7F3aqMSJz3oOzfFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E//WZc75in48I6CuW6OpT9sjQ99xWKSHAMcQiEKxxuaMvHP4Zvpc8IBsF6TV?=
 =?us-ascii?Q?chC3dXjex5u1QAoJvluA81uL+I/GFdQ0Kv2RTDt5cTckZDZ1Z3Vp0ELeY237?=
 =?us-ascii?Q?xAvGwAKhIAO5a5KL6ncAPtyVYqbvQXFcVvO7Ktf9Q/CnL0dY87NgdnULR27A?=
 =?us-ascii?Q?8EpPYJFbrrNty37LRMmwrEUMIJDT6fvF454fsowH5pe1E8uTKWmb08ZQMgSK?=
 =?us-ascii?Q?fUJrTrf8OiKyd1cs/eKGqK54SizZBBgs+WKpl2Xl3hFDtAQS0rAuOY+QEQFg?=
 =?us-ascii?Q?TQU68LTYa6ruWAV2pwfNA0urlRZpBqkYtL1LohOlbypyh/LHhud8MZwocqkT?=
 =?us-ascii?Q?i/cXyNKfYjhncxc6lR/UMQuVjBVI7A9gvBbaCxt5xKrBapfNKuvnFP+9ODu/?=
 =?us-ascii?Q?c68XHYKbUOdNAO4/7UolIXK5Irk0sRxSVdqkdQYtgmAS/CEo8TK0wDk4b4ng?=
 =?us-ascii?Q?UazHzFL6Gi/WYlldOndyqZya7O62hK0iTnim/frExi4vBGG1Ii28Haga2MwB?=
 =?us-ascii?Q?KcGZp7K8goZk/B+bxNr3ZIDLWW2qBTbQqEzgmy7qDCKxd0h5KW2Au4E+09Y7?=
 =?us-ascii?Q?H8sV1Yf+VsJ13Q9k7E45GnBtywxtNlfZqARUVEVhlWduLGLOUBHw1FICTh21?=
 =?us-ascii?Q?Si/tUEQ57X5R1jNMGK2yX0TG2P9dDpleAUv4bGtdUZ7qzVxYCn2kf5Wxchp1?=
 =?us-ascii?Q?y97zP0ES2U44OOu+rxnL8Gmay5coentEbf7Th/NNw49YhRmMB/cjP3WHdsk8?=
 =?us-ascii?Q?Cd4EcxSXGJW5qK5X/pjshknqoVhJLU5xNBSr2UyaRgmSCJa39ereH7dNscnL?=
 =?us-ascii?Q?3yTR4OVpowflxDiK3j9GxKbtlA+hDhzX5O0bxoNhKE4x3NSmxuVB/+vUb5iG?=
 =?us-ascii?Q?ZxQbtTWSfD0ZAeOZQQeY49LOvV4zHrCtfTYDCbbCNd3w2g25keOLHfeKFBKo?=
 =?us-ascii?Q?86LyAapTOZqRfeab4Uk2fhl6QFXszVlUMQxSPGV+PR7LE9wQF9l1AxqUiQ6x?=
 =?us-ascii?Q?a62hybY3hDQcH4yHkaJvhmBDo+m2C1zO4Is9o7tpB4GtiFZ6TYr1MF7YQSZX?=
 =?us-ascii?Q?HIXhZjcUgpvgjOm9bsJkZhObkN2lfbqavKwq3x77+P/w07q4mv+5Fu/IiiqU?=
 =?us-ascii?Q?PySbGWV62G7eeJGw7vUADbggAV6kz87LE6R+h6KbFgVS1yYO1sFaQuWxwMWk?=
 =?us-ascii?Q?dLISuf3kUETthM2CCVDPxuFwRm1Wuw/bwIGZNjvG+dnfDTAqPiAeXB5RrzBM?=
 =?us-ascii?Q?VnR82X0HZ+sxxV6mMiotEFNmp0UF+KXC2sjoIo+PL7r4cEHdbeuGOHum4T6v?=
 =?us-ascii?Q?ArlS+YbyKNgmd261cyLfTvsJyRhxUfTE9hz4l/+Zgf+u565M48uUEbstwzVd?=
 =?us-ascii?Q?Hkre3ZJvI/BZH2etvFQACYGNawpdQUuONmZM0gPeNHx66IdfblD6JiFTXXRg?=
 =?us-ascii?Q?FtbmDxI8m1OTI18+LCp+XMIa5h8ERHp5pu5CcQrnSttSOULALYey+ZE5e8Ol?=
 =?us-ascii?Q?Z6kyTpbMVn9lx66wkVpIS+ebW+T81o/EC1YI8yO6YHWWFFjHZE9WJYKaVkZ6?=
 =?us-ascii?Q?MqOLfhxXYUEkEgjB9clXOvDl4hkGoo3qQhB1DIcPKutz5IxWQA96izwZ73QJ?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b61884f9-77a4-44b9-cbbf-08dd4070f706
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 14:26:48.4552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVxXXJA099rPeyKrcL0gMi9/XOtyKxh2Ibp4nLxyF0NFIw8fPt9AXdOQjrdWT7rYoGgfbRxOF3iqvkmu5BsdjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6822
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

On Wed, Jan 29, 2025 at 11:59:02AM +0100, Kamil Konieczny wrote:
> Align with kernel commit 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table").
> 
> It adds PTL pci ids and also brings few BMG from previous commit.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Link: https://lore.kernel.org/intel-xe/20250128175102.45797-1-matthew.s.atwood@intel.com/
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/pciids.h | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 7883384ac..23f349f65 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -817,19 +817,20 @@
>  	MACRO__(0xE20B, ## __VA_ARGS__), \
>  	MACRO__(0xE20C, ## __VA_ARGS__), \
>  	MACRO__(0xE20D, ## __VA_ARGS__), \
> -	MACRO__(0xE212, ## __VA_ARGS__)
> +	MACRO__(0xE210, ## __VA_ARGS__), \
> +	MACRO__(0xE212, ## __VA_ARGS__), \
> +	MACRO__(0xE215, ## __VA_ARGS__), \
> +	MACRO__(0xE216, ## __VA_ARGS__)
>  
>  /* PTL */
>  #define INTEL_PTL_IDS(MACRO__, ...) \
>  	MACRO__(0xB080, ## __VA_ARGS__), \
>  	MACRO__(0xB081, ## __VA_ARGS__), \
>  	MACRO__(0xB082, ## __VA_ARGS__), \
> +	MACRO__(0xB083, ## __VA_ARGS__), \
> +	MACRO__(0xB08F, ## __VA_ARGS__), \
>  	MACRO__(0xB090, ## __VA_ARGS__), \
> -	MACRO__(0xB091, ## __VA_ARGS__), \
> -	MACRO__(0xB092, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> -	MACRO__(0xB0A1, ## __VA_ARGS__), \
> -	MACRO__(0xB0A2, ## __VA_ARGS__), \
>  	MACRO__(0xB0B0, ## __VA_ARGS__)
>  
>  #endif /* __PCIIDS_H__ */
> -- 
> 2.48.1
> 
