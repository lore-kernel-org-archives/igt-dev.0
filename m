Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9B6C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 11:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D8C10E571;
	Mon, 14 Apr 2025 11:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deka7Vmf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA83110E571
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 11:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744628541; x=1776164541;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OJVW3pp/7c23CCzrjlMJrpOe0+HMk1An0zGLRSggQF0=;
 b=deka7Vmfa/iFH0KnAyjHxArWzeXJF31TRK8XBbcGJRNwGZIb6AGq+WVH
 D+8+BTc7v2WDyZuN+z65JeQl+zxiComCSs77XZ8PA2goV4l84bRaIMtNv
 u8tZkOEsqBQXjdG2zKEdel7/M2osbY7M+svrzLeo07Wcx8hk4VcIpxdQF
 gVobgRkxzE5INu/1++puRbCmLjy0qYyxPWDzYAKdE8ob8SuuXF7ZbY7/+
 VckSOqLv8SySZYkYQq0PJyow+l10bPJnwQ0xl0w/p3YcSX6HObvUgPsHi
 FHKHcF8J7BK+bSOS+KgwpyGNOo1QTom2r2723PI40Z6M8vPda4R5OZzdl w==;
X-CSE-ConnectionGUID: PBTmGxf5Tu2st8Yp8ydLow==
X-CSE-MsgGUID: qwKMhTT1Ttuwajffy7KgZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56752307"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56752307"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:02:20 -0700
X-CSE-ConnectionGUID: 7hUEpJ89Saen7iuZ+hgasw==
X-CSE-MsgGUID: Ewmcx2tNTSeMY+jIdalddQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="129726582"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:02:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 04:02:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 04:02:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 04:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tgj4+duzPrWJolUv30xwgWdktuViOrJNVqbB2WNw0xTywzSuVZyuJ4AIkQsSAjJZymzgnh6r64qlvVtJJoJ5rbZr3KF3Lh42in5LNH74lUAAnZI0eKFkGSvL1F4SAp+ToxXXkPtzPWQaBaXA8Rf42KIlnGEJc9vnRNgAZRg8zTSoiD4L7JVAt+tAIiucFNlgMNAEs5Yrn/Ow7WuMBOtzsjNWcuDuaHWt7j7b2CA9d0ny/E9zBOGfYci2Lg1xw5zKrPOSUaZJ1AQHtGCJnoy8IPNtvAMCnDGcGhHrdfhN+dy9qmSQCe1cTrknHdUaHhAFLGWkEZA8S7/D8L7CBgyP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRoilYLV53nK1CAevEjD2LVAZD3sMXbCDS3uYkVLhRM=;
 b=O1J08MVcehVxPOKpx8iRZ9jF7S0rEqWK1e7uXi3fpA4CVFMrGQwPFs8VtSn3kgLTStimAGDY8JIbGWhrHlAo2Uzw47N7wzLJhfAuGiTdroDBIFEOGDg2QjanFN46NhWP0+i2JrBWkxanilryTEB0jLFRe1Bp6uQwg3pP/ykBpN9hzpCln4cPar/82wUvznvOOUphZL7ipd3U8cEh4+slHNuP50I3bCiVxnYRcuRPCfWygZJTXzTV0SFrdX155X+tG0dPLaQTBPfE6aeGpvJlTiQu8mIwjAXFDs7CC8cofs9ecy3zLlh1EOXid0+mnj6b7Ei5wjFMhNgBJ+TB+dINeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 11:01:42 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:01:42 +0000
Date: Mon, 14 Apr 2025 13:01:38 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 08/10] tests/intel/xe_fault_injection: Drop
 XE_SYSFS_DRIVER_TRY_BIND usage
Message-ID: <Z_zrEg2JGl9oWl9X@fdugast-desk>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-8-84b1ad0b8075@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250410-lib-kmod-v1-8-84b1ad0b8075@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6e549b-0774-43cd-0913-08dd7b43bd1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6pQZXiK/80+/lqu2Rjup17wkxnr1yAc/frXFSW+1bQeFqIxLq6N05fTSe13Y?=
 =?us-ascii?Q?ChS8mzfMY9SQueBRu4KbvlVkyPRmAsAq3ApPVu09YtEotqtO/QSaWt46XZI5?=
 =?us-ascii?Q?dwkhv7gTUz7+4IVJBV0VqFHqw0Kyjbt5iNN42GFDpCA8AzZe+OykUsyv9tv+?=
 =?us-ascii?Q?59r0xaarH3TVfrnTaEKvrXFJFt4tIcfXUp4v2fdkXOBQ29eQ9LQjpjSLVVNc?=
 =?us-ascii?Q?9hZ/34Ss9q/OOJUUST81MrMyDoJiyNMEXLDe/EJNo8QIcd6ZXoxdusW338w0?=
 =?us-ascii?Q?HJyK5m4nOzr8Ere5dFsI4ZSVe/srEcXa1xSXNf8gDcTcGIKyzyB4ltbYZyCx?=
 =?us-ascii?Q?YYTpWVtmVumpAbHk4yAUd4XFhggClsW+eBXgvdS1Y8foK3kTRujMLH9Pjuw5?=
 =?us-ascii?Q?rJT7OunS54Wmo0z45emZccEZquyXc52/7E8q1XHp2zNgZWwoN5X2YVvP9lfh?=
 =?us-ascii?Q?kggoQ7YWbE4Z+Aoh0yCjkumLgvgsBo2Sjp1EhViM0DArbz7kglRZBzFhekz5?=
 =?us-ascii?Q?jLqPTym39MYrLFLW0W+hkKw4lrBJ8HFb9BRTzM5K7FaqmuE39Y5+MqtlLwoR?=
 =?us-ascii?Q?L0UGA/yKHJLjZxU7Ftj7wBeyLXa3eP1SzpyVZVh+RnvxNqZupO2lPyB/vbI9?=
 =?us-ascii?Q?1MuSRGELRqox7IQLgiTtt87O1wul5r/f9WZWY7nWswbwgZjh7Mvh52uOGMTz?=
 =?us-ascii?Q?kcq7Ig8DoXYjmE8GAC9BNBZTpFvWGUWg9HOmEBONGVt18kRC4aWZMb37J1B0?=
 =?us-ascii?Q?YFqIr5FxPPLIZ3gNziOJh66/YsJs96Xy3jSHoHjQzjE9Xttc+f7JocbokKaq?=
 =?us-ascii?Q?NcUPU33fa/5DA2/JVDgnYiE2TvEkUGD2l84w2fGAaqrthBTO3CAfabjLs4Sx?=
 =?us-ascii?Q?c9mUu/ieYZ5AI7ZU76VkVUC/g58A3ZXZkHFi6n9aRqiw7h0iT8TbBlpk1Ki1?=
 =?us-ascii?Q?W7VGXRn5Bfr6BdMNozFcyYMuZy+5SV5oOLlUgE+Mb9JcI4ktd+FtInKwuzj7?=
 =?us-ascii?Q?8iLoM4h5o+txxFzgecAJVkXxmKro4+L/vohCtEwdsoWjJTIayyeM3ln3OZS9?=
 =?us-ascii?Q?yFs/ZYFJ63aynrqiLpRlQ6ahoNUVjmfZltIgFf8q9sJvdt2zpS6B7RLGMDmy?=
 =?us-ascii?Q?AphMH5HCEhoTEHo3bGboGmusRf/jV8IjucvDABhMDM810oOtqjQIa7iRCJGn?=
 =?us-ascii?Q?i93TJ4PGcLFdfHMSpTSH6mh07fmA834EqIcVzOqanTPHOo5X1B3T6UhC6IMz?=
 =?us-ascii?Q?jj8Y0w0Pn8zNTHOvkVcG7au2SNdSWqSLLzonMgCJPeuvb42WR2XwuhFXG5m2?=
 =?us-ascii?Q?zKRWwgTS/S++tPbMEeSt+KNoj48AHM+xblPzx3pj03XNFi8kFJSwkulp+iku?=
 =?us-ascii?Q?TcbTkRml9oI8zLBEcC+/GvZIPchShxQJBQRdBO1HTcYEvYtDw/qdvJIHkNsK?=
 =?us-ascii?Q?GDIe6SGCjY0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aXTaBz6uKRQDEJVQ2+OLvwlH8+zk6+CExI42brNqUqfBh14HunOW/RMNP2xr?=
 =?us-ascii?Q?9F+lYTX0G7l6zD9OIEypvHKl7HE7S2H4Go4VowcPnh/4aej6BPk46StZsrTI?=
 =?us-ascii?Q?pfDZDN4xosrp89tzNYwV75Quve6vJYmTBtnXyEAfMpFrA8YXwU23M/jzEqx0?=
 =?us-ascii?Q?66JgXtpqydh3mtN0mPYDhitjjmA/M7WumKOrQru8WVFgVIwgycojNkqoHaJk?=
 =?us-ascii?Q?gBQ1zZf7TftzpuAxFa9zK094nqqqpX1kEcz3fbNg/0KK17aPEtx+TN4IKqcX?=
 =?us-ascii?Q?A2nhj9radlnuIZRzxBxivy/MV7N/uQ9K/pSl4TQ5PM9fJ8G8PwJ3aI0gVTnH?=
 =?us-ascii?Q?BRo0ckORXR/Pxu7ssRUNI0oO9QyGD/jkXMLJ5dzDnRceQayQko/94X+Jid9p?=
 =?us-ascii?Q?EWApDRuArv4jQAtXiSG1rb9WzXBR7gYSu+vt0tiInBPEoKoTFMBeQ7qSS5fn?=
 =?us-ascii?Q?Z+AI3zEyzxPZhQUOTFPYLLD3QQCOxUC7J+qH5miYCTwt/mme5EG9J1YA/XFO?=
 =?us-ascii?Q?5PskmtloF95TTVWo3aaAr6rfSmDa7f/pG6emK5vLVCRReF/kyt9vpDIgiIqw?=
 =?us-ascii?Q?iHLpMX5JO7C/w3TPGJ8+Cs31ssoeqiFomnalJDKcJDhS6IHdrW3G3rvVMR0Y?=
 =?us-ascii?Q?V1XCWqB0OH4deMPcYSeSALKnnb6IXRibYaC/SnVS8QdurwCVpAuKURgwgKUg?=
 =?us-ascii?Q?d0bblpEgYM/QzSP3zA87I/g2wk3K/1Yyfk9DVaTguGtaCd8eNMLhcrQQLJ1H?=
 =?us-ascii?Q?kVByNmTG3UYAsPMATTOI70vvVqPAeqC1KaTtv8DZ4blgKCYRTjXfr6UKxOf/?=
 =?us-ascii?Q?XSIa8GS0KhIclm8yHeZgiMNN/SUpRC5RNh3P8iGjQJSTzIKa2/w/WfL6+/BC?=
 =?us-ascii?Q?RWUF49rD+6p8Sw4J+1qdbVuQIxRWRuZR123/Eb9PxZ69nDW19KkyyQG3IFsL?=
 =?us-ascii?Q?8dPodxUfgkkJLufascmP+fKoobdifTwZVKhgiMfNHRHMn9xTyGBfztsbZFde?=
 =?us-ascii?Q?fjw19vK/z/MqPKlUmWfPxW62T0w5tE5WZq3YQTCC+qcsHOrHwsTD39TqmfXw?=
 =?us-ascii?Q?IdBDbNf+IdG1A5jcdiqouNveBMWdH2Qcbt47Fs0VOlA3knSF7Qc26lZGIH29?=
 =?us-ascii?Q?iGo9HfgDmeOmnWcK3ORvgNJArzQiEpC5zSlzDmem4UGgXm6Tf5PI0F4e5Fyw?=
 =?us-ascii?Q?iV9kc7OtT6Djfqz1nEvB+nBy6wI47w0BrvulYU4ZNtWKYlp9FiuL+/erhYKR?=
 =?us-ascii?Q?1y0PcukwhLVdzv4f03aQMYdA2NvsRBv35pPH/pF+IcotKJx+sc7bv/R0PxLm?=
 =?us-ascii?Q?y/6DYTjHH3IVSjHchXROa9oD53280S0Ox5hICrpNnspSzX2KZLKuhJjyt8fN?=
 =?us-ascii?Q?Hb1Jhr1eo1r3KzYKZUGlJ5+SnAwn9KLmP4wyv00h+xHfF9QhFcSiTPYVASeF?=
 =?us-ascii?Q?nPxuHV+UaKMrPrVID/Uxlyh5pJqv5EDjFHXIB4n7jkzdQu3QaGYEHKopWoUv?=
 =?us-ascii?Q?qQIZ1pCyGI4o7vzo5FThYPqiE/9F1zK272JGITajwbJYNBBCr/2L5G2XNnAk?=
 =?us-ascii?Q?Ctn8j524rLAvhVKyuVprHmbn11YgD1i6+DpceAo0bMb2RFQXUtV/zrOQ2PLP?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6e549b-0774-43cd-0913-08dd7b43bd1e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:01:42.4172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PB1FsKnFZBphW4Irubq1RLeJFVkh1hajTtw8294HIaj0us/ebVyS6IsNLy3NYh9zqmacKM723qicoS6GucojxqgFtcxgbblp+v/4op7NPN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

On Thu, Apr 10, 2025 at 03:48:37PM -0700, Lucas De Marchi wrote:
> Use igt_kmod_bind() instead.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 61d5fa872..24d3df572 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -195,7 +195,9 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	ignore_faults_in_dmesg(function_name);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
> -	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
> +
> +	igt_kmod_bind("xe", pci_slot);
> +
>  	igt_assert_eq(-errno, INJECT_ERRNO);
>  	injection_list_remove(function_name);
>  }
> 
> -- 
> 2.49.0
> 
