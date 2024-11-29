Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820FDD729F3
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 18:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1979410E0D2;
	Fri, 29 Nov 2024 18:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0FDXYRS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7FA10E0D2
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 18:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732904141; x=1764440141;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6NyTOV0LC31fvmSNnCl315ViLwje4Z4i6GopJwxDpCk=;
 b=F0FDXYRSYHLlWxCymjkismQfYp6EqaYnI2Od3U5B9i6/sxpNIJP/cAzx
 4i9S6zmDvTBU1V14TlyP9nXoxeRDCcBELOW77Dupbsi5PIzVhP7c8U02J
 bghzEByWl8vuBcKv3mBz5RHxe9VGt/0IgPjxC34etGBuLWmKYVpkzQXzb
 xEXvS6rmL1yZR4EjwVq92JDg1sN9b2rdPMMHyT2w4xr9n9uWPgnuXdyJq
 uoDLlakm/PzCX68e3GSntbmNZICws2X0TX/YLewOeQy4wlJV74aKjFS58
 oJeJ78aPVtB9Za6/CL2a/b4dPOFxCwtD8VrrZq/unlCvjux9h+hpnAgPD A==;
X-CSE-ConnectionGUID: V/YcHukOSWK11O5F3K5vxg==
X-CSE-MsgGUID: U0sngMcgS5CpX+slnzcd4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33271980"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="33271980"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 10:15:40 -0800
X-CSE-ConnectionGUID: qmmqTn38T7qOoFEY5WNEvA==
X-CSE-MsgGUID: 0dxEr65+RYOxEQA1NwLdAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="93015730"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2024 10:15:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 29 Nov 2024 10:15:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 29 Nov 2024 10:15:39 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 29 Nov 2024 10:15:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=US4eg10uUh4r8YfaH6H1wMqr2jSmoWGOUens4wBrX2rBtouwsSAbxzA+CuURfdq4TBsVVtg37Y9T0s4vGckpgRMiZXomOA8478jz9huQtkAEzZr4h93bAT7ANhZ/uDQWxtVvasns1TWaWYy1J3aUT4F1njxgRoQkVrQVABu2zU80cGiBEtjv9jyUlY9xLMIx1qUZii0oqOwjYlG2Y3ZwRacbkD3TMyV9YB8RSGr8NqK1mb58qFTS4K4U+L0+k80NzpSudcyWfKzCP9CIR2KER8w6/2JARsqSPKbvS0yNgNApUCdt7QV6fUxQo5jU6deeSKwLtWHLBeVm4NymxqK5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7e6GvIcuBI5kEFk7SKtqmoCDy3HBazfS6r6C31I0VqM=;
 b=b9SUR6nelvd5xrEfJLQ/wL8v/1R08QbBPXnPXCEzhKe1ETEk7VF9IgCWShfL4WN/YAln5bOw67XgCscswCjFO1hJMo/pRCUnR/KHpmDVSVrxWiBqZXZzQQ7QVEzCY1La8HCDwM17OjxWesgttKO1eH8Vesv+GJCZb/mHduwrp9t//N5UHP5BroAjUF4+NiVQHNaJEKtFvWsG3gpBcp7UeTfNATxgNCgT1YqvAdQE5FlSG+l5Vt0K83ZYYJAHTlknektz/W4+/T9Jc9owLpKGddTbTmYYjijc2vpq5Mwl1gGrkXa9ultQ38dIVZt5TmeDchzY3zNBFezxe/h26UWfTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.27; Fri, 29 Nov 2024 18:15:35 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%7]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 18:15:32 +0000
Date: Fri, 29 Nov 2024 13:15:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matt Atwood
 <matthew.s.atwood@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/pciids: add missing PTL pciid
Message-ID: <Z0oEvgg0oI874sDr@intel.com>
References: <20241129174221.313955-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241129174221.313955-1-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0381.namprd04.prod.outlook.com
 (2603:10b6:303:81::26) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|PH0PR11MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: b55392da-1a28-46db-f0e1-08dd10a1d006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UrkEj9+ATEd/4a3vi1+7D6QZ9E0/9Q9vA1JZ/yi/P0fhg1lRNjuE371xcsj1?=
 =?us-ascii?Q?+RW4vVMYd0EngCvnYbEXy8q8DR5ckuv6UGJMG4/OOv+Lsf32bBMelH0WsO6A?=
 =?us-ascii?Q?v/bbObGkhzYwBmwPBl0EL5MPnKeX/OcNNQaLtSgAKpW966jgBzI03lCR0dKt?=
 =?us-ascii?Q?9AaleSkkJyZmB54vyqVHEE0an8XGZg26nTg2Y/vzThaDsr0HzSNWZjnA/tyI?=
 =?us-ascii?Q?nSwi0hZZA86WPe3+T92wlqD2Owx/7pbNFVkIIJVWCCo5F+tgflDSHiLnmVJe?=
 =?us-ascii?Q?LpVMk5MSDHH1cqGfBKhu4Uimhs8l8foHxtZfOhybT4QJkSEe+T6ki497hXqG?=
 =?us-ascii?Q?iT/AaE04eMUGSdL/XRJDiz1esXrRNsLY4lBYik31q7vuXbyJNXQIwWWiBjs8?=
 =?us-ascii?Q?xfGBUxCMHlGSHLP+m7OxehdUsrwJNjngqihrUlxJ+9LLppZR++2ji7hveIQN?=
 =?us-ascii?Q?nnUhFUx9m6U3eQePk/4uIa8usN9VnwpTtD9BU9Vc8JiXPrw62zsu2mtKpsjP?=
 =?us-ascii?Q?f0ovLZTnkwz9EuYLzxYNjLKz1901XNYmewhEX/MhEzy8cx2cZENYNGzsOAj1?=
 =?us-ascii?Q?IgvMOsSaXB3St/qAkIzgs6FeeIL08mZsJtB/s1D4UsxYqxyc/QmYZCg7bMi9?=
 =?us-ascii?Q?ozzOFRYGE0SvZVZdJAY2zrmxecuLJeKUAWUDqH5eUcqndJ4RF4ZmVL9lE1GM?=
 =?us-ascii?Q?m2NFu+8g0p4k/pgCBCdf3VrbRZel3Te/DhEyXlQqe8lv0aktVgmkQGYd5rtX?=
 =?us-ascii?Q?UmukOfBZVShgINwJBxNY8PhEvsubpaygnCKiq/zSklFU+V9TJgmtMqSlKIwh?=
 =?us-ascii?Q?CuMnjjetwJlmFeiUfRprFy2XIIH+1EZZfrTcv19Dxr76WgbMvu+7590nT7Gk?=
 =?us-ascii?Q?RwLPfQ77RLHkLgztmIgUg18KdamdO0E1B1krs6+tJYSaliY1/rMs7/USfRnH?=
 =?us-ascii?Q?Zoo9cIa6k8heuU/09Cin9UmJ3CxhstNj81/f8VkPPfZt1qG1zec8eT5lIPDQ?=
 =?us-ascii?Q?lvOMHphen04FzIJeiyHnW2tyFkRIlGp5u+P0K9GFabbZhrfWwNDJGeuOxFW/?=
 =?us-ascii?Q?2Q0b2C+5tWr2P2fyclQBSIPT80I6luE6N4ZCfvBXWZ8VhY9qWLu/O3ACDW2i?=
 =?us-ascii?Q?AlyNzsO05IraOxyuEgF4OAZwfXeUyZppmVpZkArj8tqj0Ew635KaVLNofBkZ?=
 =?us-ascii?Q?dJBSP60EJNKgauZVVtd/YuSa55FfP2JzbsMaAULC4azdf2D04djLgCd2prbK?=
 =?us-ascii?Q?bo2cYCCRxZUpxRBlOcowsc0fIQOyKC5UiD7Z4wE0hUJEf9TOySrpuxSOyNsr?=
 =?us-ascii?Q?wBjaeAWfZnYYfsgxupFAHU5JTU9/7Rdar5b/UEMA58KuWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xYrshfSqij4pOflOEjJSk7yXG5//5KSOTaIk9pYKUvUnZ2OcFGpjznky36N+?=
 =?us-ascii?Q?pusAcQJ5uFrwqZ6QG6XSB5FMk0c8mcYuux0jF/BonU5M88bv0JMzgmSsXUkc?=
 =?us-ascii?Q?gSdZxpDUl0JMejXK7Bf/tqTk37P3sTS2K2Ias8VQ1upAneuXXm+nouLunAoN?=
 =?us-ascii?Q?uWkJPxQ3vLILo7YQdpE21GUclzhCvchtei3ZU5I0xVFifB8JunNNbIsXzmAQ?=
 =?us-ascii?Q?JxyNrPQtcryL8Zs4xsHg6MA7IedjGfBi0ROuLvU4bEwMekU/5cQRwKYsbN5F?=
 =?us-ascii?Q?nwh5IaFHlDsxoKW0CgYXt5D7LH3RtjB8ViXaYeKgxC0BhC5UTHp7ih1iJyGh?=
 =?us-ascii?Q?eXy0uPDwA+Y5PZWlIgyqM5uOboj40iF0NxbPu9ToPqLxxSDl/UIYz4tLhOgV?=
 =?us-ascii?Q?QArGZGVnraV48IA0AV7daKcUVTq5CBktgV3hLVxAEMlxvxy4f7l8dgmdB7w8?=
 =?us-ascii?Q?giJo1Pbxev97ZyVaqB/6cyz7jjch2rFJqN7JoA3Kt3nrPLZWpulWFFBLm8jc?=
 =?us-ascii?Q?i5X8+iSvZG0Oih5505ROYVe7Yo2IBV2o2uyPp90L71EBp5zwnHuhlC3X1Qcu?=
 =?us-ascii?Q?q1U9IS8Nu8cKWBKWS9PPQ4FbQ3Wjc+08z87Nowj6y9pLFDmy9KM9AyZAYveQ?=
 =?us-ascii?Q?LJ7+nN7U3dVWWMxBeO9lLlIO4J4JRniPxfEdLDprppmDD4uIpYE9ncilPI7F?=
 =?us-ascii?Q?eNxAkJfM6ARdJAiK+/X7Q4ZS72DuJqua+Ff7COtn/4o8+2Df3mWl8ILyiG5F?=
 =?us-ascii?Q?PpsAVl430Y5wj/Fc65iq7SEaboLW8TYF/TeAMsXBJno1gcw9GOZc7nULUOIV?=
 =?us-ascii?Q?qLvr5p9A3Va/IehSp393c333AYodaj37ggcS/y3rSVWnlL87WX08gHvAQ/w2?=
 =?us-ascii?Q?k8/s8tJIRTzRZQm6FtzkCBUI2RMcl9K68C795j25mkgDLbodHH8cS9cgt76R?=
 =?us-ascii?Q?cMQBid/iFwMALPIPGeQAiuAgkEHui2VoECxxy3WfHs7zntg35bALfWFLjYX5?=
 =?us-ascii?Q?E+AMDSSdHJJ+OPROxAwdCxUOi++c7tKBhE5ssnUWH+i63WGQFcLpinNscMqg?=
 =?us-ascii?Q?kOU9zqgvyl6kBfU0yo5mRpKBBOvPETrgLK5Hnc6dL4cQ+1U5K/6R1Z4UzceD?=
 =?us-ascii?Q?EKh+G0tyxf5tKHg84hEl07D5ofduueJcOfGg/GZ9grSCaS7hipljDqN5fAW+?=
 =?us-ascii?Q?c1LEjHMiay0GS1/5+OgPA4bRqLYNj/40222ewZCwUJp5J6hn6mofTfdHWwxv?=
 =?us-ascii?Q?KAPLCpdWUIUPdvT41ktzuC6IRkltdpY+WcTvRq1ZiM90ifeMJqZ0hd6kmMEI?=
 =?us-ascii?Q?u/s6pn1xLzQhLljKmGvdtdI5DoTVksWtkZRCJ494pz1iYqF8hRaJq2ym2Q1h?=
 =?us-ascii?Q?SqDODcw1BPxcnqaScRb4oLZhxoh/cUS6Y4klUtSuxwCSOW1fF2TmT1PhVApH?=
 =?us-ascii?Q?JLDg+Gd3/4vSAYrCOEQPP+TdKb4DOGms7pZPxe6Ur36J/aqucBjwK0saaYDK?=
 =?us-ascii?Q?gi14FNw/nuWC7JLyajhj6SvS3KMsXDBR9t6Hhg4ongmORc0lurIq1mmhFbtz?=
 =?us-ascii?Q?NFxWczYtmVe5wmAxzlKRDJoaij6WUd14oEUigZTunWZ9yWFg1b/JbeRBrXM2?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b55392da-1a28-46db-f0e1-08dd10a1d006
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 18:15:32.6086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zK1hnp7Ozz+Ahxj9tlDV4qJFNh005K9Vf19Om8Rb1yWoSpiwsunbfm94M/NI8f5OqqwB02qhGH0Wx65h2W1rpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4853
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

On Fri, Nov 29, 2024 at 05:42:21PM +0000, Matthew Auld wrote:
> It's there on KMD side but missing in IGT.

Perhaps a different title and commit message with mention that
it aligns with kernel commit ae78ec0a52c4 ("drm/xe/ptl: Add another PTL PCI ID")

Cc: Matt Atwood <matthew.s.atwood@intel.com>

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  lib/pciids.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 32480b556..7883384ac 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -829,6 +829,7 @@
>  	MACRO__(0xB092, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
>  	MACRO__(0xB0A1, ## __VA_ARGS__), \
> -	MACRO__(0xB0A2, ## __VA_ARGS__)
> +	MACRO__(0xB0A2, ## __VA_ARGS__), \
> +	MACRO__(0xB0B0, ## __VA_ARGS__)
>  
>  #endif /* __PCIIDS_H__ */
> -- 
> 2.47.0
> 
