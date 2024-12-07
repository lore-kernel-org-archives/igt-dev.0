Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9C1E77173
	for <igt-dev@archiver.kernel.org>; Sat,  7 Dec 2024 00:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1559610E1FD;
	Sat,  7 Dec 2024 00:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjT3vSdx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478BC10E1FD
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Dec 2024 00:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733531336; x=1765067336;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+bCG64lx/iEa2ZnZcJ1hInx17fq07oYlEVOnCF5PMk8=;
 b=WjT3vSdxHDW3HBiz+h/CzvZzxIJE8QMtLzmxFrPyI0HRcnoSDqrQuYb2
 xgZMVePuvVqGMEVU/e++Ds8Zi9xjMxdT19matX7nKCfd5eYHfSdQPqwJL
 NB8NGH5a39FMRYKZrtxqYId0gpTJQMZzJ6t3hfUhG8utT+iWv1iYLhOoh
 UqfERTdAUC1PTq9RLiLNrN1rIDxM/T9KMjHp12XR0PntBVByKZWFsXBOv
 i8BfVcxvTjUNwOnGwzhMUbMrkTW0N6do9xHDO7vs+UM2Tt20lHvExANcm
 mUZrF71E8vAuqqYlUyDl5tCl9H+VAJwk6E7+tcnGW2kpDbCU4bboUALhT w==;
X-CSE-ConnectionGUID: foY5v5lBSMCdQ6hd7NxZLw==
X-CSE-MsgGUID: ZDQ1KCVRTL+047tL/HrOYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33780538"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="33780538"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 16:28:56 -0800
X-CSE-ConnectionGUID: Cuqni6sOSf2lgWtrtgljXQ==
X-CSE-MsgGUID: W548GsSKTN+wcMeoOlhQZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="95029381"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 16:28:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 16:28:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 16:28:55 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 16:28:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiwiXhpzfUpu0STWeF4mdkf9C/DE4MmVX3rYivdZFQtN8HNkifEJ1DUmxjBR0d5stN7mqUurI0MeIINMZkZbU4WbbYHi/BwFaFwlJyW1M1sBRx+Kcy+wFfBXEXzzZ8+/sYn53F3lvrPZShB521bYxNP2xFuIt/NUqDkbPe060RTKKBIdVaqkdiOtSO3sqV7nIybrh8VnZPaYddFOLZdA0jL+yRY+a50T6uJtB89jA39f++wl4d/B36lLyC8XN/Qv0go6g+gYe7n3bIfTnyYoCjlTmbpsPzMSBi7QZCxGfcLXQYEghlcX+MNIQQ0Ub24krgDng4tYx9/VQPqBO+VO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqyf9lNewQhZiAJpz/UJUBjGVEoB3qtX3/HcK2B0S00=;
 b=VgbJiUwxQyEVDxWrxPvJb+SqVzIefhVR4bniPySGhfkcRFhdSQxGWuD+gayhyyZ57MPhScTWYn3tuC9Ir2dHTY4qFzxG0yffj/POYlfD2epu5pgmFSqoVaWTcWbQ9rmszJ9uV7tv8qEA1VuNLqsv0vWrZ5Lrgch1lICNA95S4thDPcx+x4Sb8Zu4/bOF3WY0iAPIkpP8b7bAr/O+WeYj4ylpAmKcriAZ4bWeqBsrXzmposHdnBs4ngC1FfaXcq0I02j1ONrM+QkjJkjwPSECmfP+SIGvL7LmB4kA4V5oU2StwcK6nofD2tohEVGattr/C9nI8rbiyH7GJLz19xVhYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Sat, 7 Dec
 2024 00:28:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Sat, 7 Dec 2024
 00:28:51 +0000
Date: Fri, 6 Dec 2024 16:28:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Clint Taylor <clinton.a.taylor@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 8/8] XE3: tests/intel/kms_frontbuffer_tracking:
 platform based handling of x-tile cases
Message-ID: <20241207002849.GP3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
 <20241206212748.2101217-9-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206212748.2101217-9-clinton.a.taylor@intel.com>
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 9680daa4-8eb1-46bb-e84a-08dd16561ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GYykr0bsnOdk7mNrSr5RTVyrHRzVPmGbe+HNHQjC9Jk+/Tk+RCI3E4QLSGNW?=
 =?us-ascii?Q?D+Nn4qFcuMIaXsCJrcL1GzeuBXfZb37z0sFsj/2RmWcbaBEuirjEQSz80uAS?=
 =?us-ascii?Q?UlB0LpwD2LvoGTvVBoESLR4sYr880m6hN9G4bc+//XsokACHhrLg+4Tx9B4+?=
 =?us-ascii?Q?XgOF3DY11xqiewEI2I+Htl9gMdDnnnfzdI5sC7c/PnrZhyWRt+fflFC61hpv?=
 =?us-ascii?Q?aQUBUmQsBEK17oNZH9Fl5jXy/BDfRGaIp+GAxUhBUrPTfOEsK1yKHomivJTf?=
 =?us-ascii?Q?Fr339fS+Cw3LzLcHkxHmbvftL9Qp4/c25qVLYyuEX+hkO6iRPI+rWPhUi7kx?=
 =?us-ascii?Q?upbSnbnwTiP9FHU6QMV9cd+WWYBDbv6OlieQ6TOvpTU8aJ/lgRe8rnrr4Sbd?=
 =?us-ascii?Q?ZN4LCu2uZT41iMy/0BPfSa8Dc4RV6RyvjvFpCdpjTL4TQPjMbM948ZyC/ZvG?=
 =?us-ascii?Q?XK/+qsaZap4an1Q5dR8S1Q/odkDtNefEG/B3+/KIRM2j9NrV7daLUgIF/4Eb?=
 =?us-ascii?Q?PDSZdGUCZ9105MHBch2jy9j/B+Gydat5PQm4r59zyClL/WDqfvM8iXB5YHRa?=
 =?us-ascii?Q?nxBUagNFHEHsut1FnLcyLnxW+OSDtXCQnss/RDzg5jzVFhA0FHds06CT/WVB?=
 =?us-ascii?Q?gUH2EWwBdjAsHSJm8Ot1xPuE7THiuafzrA1Jo97j44HjmCpEfrdtaeSIOypG?=
 =?us-ascii?Q?OHNkrHJVyCks+7oiC+1lZdMX/1fhDWi1flrPYUfobzhtvgobdIkwzDzHrRQF?=
 =?us-ascii?Q?xmXDt1f09fTkdTMKd+pPZxKthDErC7g6LcstIfeAL/v1Mi2rHHh5nFg1RKtM?=
 =?us-ascii?Q?Yosqh0eQ67iTdFFsoLlXklgT6C7vHXfJFPXSt+2mq1U6ZQZdABEWMV00mQ8R?=
 =?us-ascii?Q?Gh/kvg8Dr2o51JMHK1gxdbI+7E+OOcyjaQ2lQlQH8qWJ+YDIRBh0prTOm+2I?=
 =?us-ascii?Q?NofX8f9HvdqMbTra2E0ksOkVzc5pvNvOoFhlIYTSH05WQS/AvG8VYnsBrWNg?=
 =?us-ascii?Q?yC8m6LBVC4ZO+ekU9fOUzhTqDhRMIk3LlPCLRgwUzdAkF4cd8szyAGnjjzDt?=
 =?us-ascii?Q?qSckx+qzBsvE9Sq/10zacJ78tE5NMkCNROUsVgJ9SpnDq52oVmAVdCo11LLS?=
 =?us-ascii?Q?vbW80oE13GX900MvojwDUfb4WSfB7ELcO2rVcqr/nYZX+Kx7qJemF519Sjjt?=
 =?us-ascii?Q?tZFdkFenw2VtGWzt8r5cxo8pOyoMLWRtYuhEivf4n2z9C2xhsHTiDpE1/CgK?=
 =?us-ascii?Q?G7CD6R8BENCNRKXm5zPlQOBeescVLH8xiLLi5Mg/wyhVDAsR58zxs3S0NqLN?=
 =?us-ascii?Q?qrXXADO9mQq8nSKw19V7V7Pfdsf5pI/xTq2++qxzzVeeTg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M7A7ujCnlO3rRTMZEugv7rfdO6WUolYoqq0PKOs16b1A2rp8RXVozuTD1a53?=
 =?us-ascii?Q?ET2rTW2JqhpZYu/dxYhkrGNo0hCBx7Zo8PNBlktyhS6tYa2yIvm75zDY6Rfp?=
 =?us-ascii?Q?yOP/ApC6ir3ybsHJEnMQ/1h8QisAPPOcTHt52Dhf2F8tpp4J+CgdIwrSZnC7?=
 =?us-ascii?Q?5zY0An0PP1CVBBF2oDzvFOz3zs75VD6mlNaTTlg5Att6TQPUeBbVrdr00yeY?=
 =?us-ascii?Q?pj8M4uibUpyl3FdY3pC6qHzf9/TN0dAssyAug0U5UWw9tVHt8fByC2coNrSZ?=
 =?us-ascii?Q?r49jxJr083mSZW1+yybCYh9ng3wgrVugOuEq7RcM9GezxN0bEEi6Ud2y7HKl?=
 =?us-ascii?Q?sYaIHB5Pb0BMf5Ab2Yn6zeGKkRl2sHr48PTIRQy8Eirj0Vz/1CVxqOrh80kd?=
 =?us-ascii?Q?W4Xadtr5pg0Rtv9vtjXjLsM58eUX2eI0EV7uup2T7nomE+RP/Rx9IBtWW01V?=
 =?us-ascii?Q?E+swjgjcD31e0ZAWPZnpZurgEPFzrbFQeUKJfF9EAwITbxpzh/NIKIBLw978?=
 =?us-ascii?Q?TPuxL/tJldKtLWWmCaFVgz5B6+zAre0Td/AMwJfb6A+oQhxvT+28T3dW/DQU?=
 =?us-ascii?Q?AwtFW7StBl+Wa8efEoOUkXG5xZQTpdX1dOvGRUmXGUVno78/uvtbc5fCoGvz?=
 =?us-ascii?Q?bJf4EtblXKm46zklMpbKkkpXLoj5CNQwI25MRuzjYegRt0ucMS/DKgFVu2rn?=
 =?us-ascii?Q?MU2loi0oIXNfllD13maJECCF7Nl/xz2D+/zQ+etOsATM1lYCvHG7rRHX4cjo?=
 =?us-ascii?Q?mo/HO4hvrTsv0aO9vaUzguk8xh5OBYEmK1W567t1fRKrhw8sRDU9VGqzncyd?=
 =?us-ascii?Q?I6brbQc9RVu3QAXwVgwroswIe8j2Rdrokj1wnGPhvDB/hMI+r+wKKbDrQuPP?=
 =?us-ascii?Q?b7ESwr4XGH3cnt7eo1ojZ/Mz15+1LtVn1Gc+lDIci3es8Iqt1JSLXTan2m8h?=
 =?us-ascii?Q?vGUvujqeucFUHp/aj4Fu7CWdeb+F7Pq9xi7gMleI8rQG8tw/yCdJqFqLGj8t?=
 =?us-ascii?Q?nkdmmrsiJt/O7SBdMfd5cTja4OwacTCaXymaT1J90N5/S8/hddgC41HbuOyi?=
 =?us-ascii?Q?emtFhXqkadWA8Doz90hA7JLfdZr5jxk7OPtZ7TpPbKXgDWqkBA/PeeW1t0X4?=
 =?us-ascii?Q?g/OPJu92TPOIpiWy0bTDoWseXRIP9qnOGQrdOZA9hPXhbdm+Jz06MhH6DHj4?=
 =?us-ascii?Q?yEFpSTcF60qvRdWT/aedIJNtZHNEKz3hZFR+Hr9awqq7uVkdL12LW/YNuM4Z?=
 =?us-ascii?Q?JVl7kQh38AgGmlSexP40lrbgoaJyn4veIe6XevKo/6kzQSqe43VnpySiTEUz?=
 =?us-ascii?Q?cfc8rxHI9u18+1mRAyRdD9+ULExCC8ySLbd4/EFvNSI+o+ZqrDT0igrOHvAP?=
 =?us-ascii?Q?wZSKdPK4wiSXwXZL0bgI3ierguXoNAEByRgYCnDIkTB7DtKpVxy8flhUZgBy?=
 =?us-ascii?Q?R5j0nWsRrBLOXciz89Sbc4kIiBrovdF/NXdIXiUHfsvS+q11kZCgBvK7GPxw?=
 =?us-ascii?Q?cWfJMqPXPuJUh0KZSuf2ymo/HtG5sukzu8JxBVbUpMYBEPcnecLsfdjllygg?=
 =?us-ascii?Q?c+FCb+7sOoGj/Kxa6baJdQeFuvPvqHY6MBn/krLpByMa5/aZ/6ZwJfI9duWt?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9680daa4-8eb1-46bb-e84a-08dd16561ff7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 00:28:51.7241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xy35UrncYLQd2st5SvEauPBXqRX7MhqEh87osH6Hk7NJ5yiNRGvNOeoSY2vU8E5kYndOs6VjD0SLhcB1QR8lkbVqM4mws9ex0vtgjxDtL3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
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

On Fri, Dec 06, 2024 at 01:27:48PM -0800, Clint Taylor wrote:
> From: Vinod Govindapillai <vinod.govindapillai@intel.com>
> 
> x-tile is not supported from xe3 onwards. Handle this conclusively
> in all the kms_frontbuffer_tracking subtest options.

This patch is undoing a bunch of the changes from the previous patch.
These need to be combined.

> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 29 +++++++++++---------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index c5b3fd46f..ba564fafa 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1031,7 +1031,7 @@ struct test_mode {
>  		TILING_Y,
>  		TILING_4,
>  		TILING_COUNT,
> -		TILING_DEFAULT = TILING_X,
> +		TILING_AUTOSELECT,
>  	} tiling;
>  
>  	enum igt_draw_method method;
> @@ -1154,7 +1154,7 @@ struct {
>  	.only_pipes = PIPE_COUNT,
>  	.shared_fb_x_offset = 248,
>  	.shared_fb_y_offset = 500,
> -	.tiling = TILING_DEFAULT,
> +	.tiling = TILING_AUTOSELECT,
>  };
>  
>  struct modeset_params {
> @@ -2182,11 +2182,7 @@ static void setup_modeset(void)
>  	offscreen_fb.w = 1024;
>  	offscreen_fb.h = 1024;
>  
> -	/* Xe3 remove x-tile from display + */
> -	if (drm.display_ver < 30)
> -		create_fbs(FORMAT_DEFAULT, opt.tiling);
> -	else
> -		create_fbs(FORMAT_DEFAULT, TILING_4);
> +	create_fbs(FORMAT_DEFAULT, opt.tiling);
>  }
>  
>  static void teardown_modeset(void)
> @@ -4234,6 +4230,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		setup_drm();
>  		drm.devid = intel_get_drm_devid(drm.fd);
>  		drm.display_ver = intel_display_ver(drm.devid);
> +
> +		/* TILING_X is not supported from Xe3 onwards. If the tiling
> +		 * is not set explicitly using the commandline parameter,
> +		 * handle the default tiling based on the platform.
> +		 */
> +		if (opt.tiling == TILING_AUTOSELECT)
> +			opt.tiling = drm.display_ver >= 30 ? TILING_4 : TILING_X;

As noted on the previous patch, I think we should try to avoid looking
at display_ver (since this isn't proper userspace behavior).  Instead we
should have a list of tiling formats (x-tile, 4-tile, y-tile, linear,
etc.) and we should just walk down that list and test each one with
igt_display_has_format_mod() until we find one the device supports; that
first match can be the 'autoselect' value.


Matt

> +
>  		setup_environment();
>  	}
>  
> @@ -4543,10 +4547,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  					if (t.tiling == TILING_4)
>  						igt_require(intel_get_device_info(drm.devid)->has_4tile);
>  
> -					/* Xe3 remove x-tile from display + */
> -					if (t.tiling == TILING_X) {
> -						igt_require(drm.display_ver < 30);
> -					}
>  
>  					if (tiling_is_valid(t.feature, t.tiling))
>  						draw_subtest(&t);
> @@ -4579,12 +4579,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	t.format = FORMAT_DEFAULT;
>  	t.flip = FLIP_PAGEFLIP;
>  	t.method = IGT_DRAW_BLT;
> -
> -	/* Xe3 remove x-tile from display + */
> -	if (drm.display_ver < 30)
> -		t.tiling = opt.tiling;
> -	else
> -		t.tiling = TILING_4;
> +	t.tiling = opt.tiling;
>  
>  	igt_subtest("basic") {
>  		if (!is_xe_device(drm.fd))
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
