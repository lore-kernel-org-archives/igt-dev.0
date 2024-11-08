Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A29D64079
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 19:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BBB10EA2D;
	Fri,  8 Nov 2024 19:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sn4tIHwe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A39910EA2E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 19:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731092998; x=1762628998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b/ujJrh1RxfTWsZhbZCFf+AxgS5FQD3lzd0jqqa+Xsk=;
 b=Sn4tIHwe0D30y9LKSmYQVFucOlkxdYBC0ekSim9XsBMId5HwcezBvFbR
 8tSw/E634D7ou2ByzZ9CtSd6JDC6ZMTHEYhGwhkrY+6d7pVN3fpp80gq7
 OM5zoP3npml0n3O1pxHrt2NvH3tfPevHVIM3NhOuXGvAFI9slu/EYmo2u
 56GVJwD8gij9uIeesrDs6ayjEQkka/BsutkLdiM0A9rbpwbp4TOcjOmiC
 b8MZbn+/NJqTeAF84jGnpIQqfI2eZc5ogaMLURizfRvNbD6Q9FlLSzJx7
 ot6hUkPRR8ypLDae+kOOc1roX8dfShalYT7R7i6LGbuVGsIofnQqYFomY g==;
X-CSE-ConnectionGUID: /VtL8UV0RxyLaUS0fGeHxQ==
X-CSE-MsgGUID: U7aN+MNkQVGp86Susz08cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53551182"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53551182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 11:09:57 -0800
X-CSE-ConnectionGUID: Or9zCMEVRJqhXkC69pattA==
X-CSE-MsgGUID: R2ZyiS09TPC9f7aZ0JJfSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86032976"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 11:09:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 11:09:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 11:09:56 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 11:09:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plAWXw1x20Tmcmo899b9jrNFXJOh1X/7zUJQw7MjIV3cMt7LHlG1fvimu/Q4u8Kt2fFPobqnOLpPNS4b/PZG7lIXhmgnrjyrjWY3gHgkYjYzw5o+fsz1jGGjKO/oyZzLjsq4xoZIEJjHRM5Krtw6oMGNGvO+cVQc41nMecRxcrq7YUd+q3964+Od9F7HCa2/Fn1IiR65k7Y4pxMm08OPO4Z/f3aqWbfj1GO2JF+TGXjni3Arx+p4jGPm6iol8bryL+SglgHAdf/RNjXHGtoqUSoxo83mMJq88gWYCbUaHvgojm1BjvtGKBzvpY5ljS/5JAg4+ZhDmsftqLRDU70gqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnINe8faIIdDMDPvYMzQ32RafkHKApKesqHj2A/uEj4=;
 b=OTkdX5wKhdSo9wj145j4lxGWPL/nIg2OEeQ+b9vu1LkvJqo/NofBFcroYT0jSUDADi82nUMusMYG1CjJkpCH7TeaA3JzCTj0aQIkNpt7cNKcK6KhKs+RGijMB81WixrMZU1Hx2JVrMQ/99LkDc0BOOWfT1ZcH0FEpwnjKW+lk9GoWRiaBga0PhdCoKFuFDWYx1hKPQM2RC8xG2UvV4nWv1PPDYUgmXFp0zxTUYmgZ16hdeHeMu4QGcFf+SNIIoeUGmuGRx8vQv6mm1NFpZus+bLqo/3Lh1O1jJPOk9ZsIMbgSKd0VGMcp5GKDcbEUDihqP3K533/9AhBy/TU1h6ghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 19:09:52 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 19:09:52 +0000
Date: Fri, 8 Nov 2024 14:09:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/5] tests/intel/xe_fault_injection: Use a static
 list of functions
Message-ID: <Zy5h_NzkIGBjyYmP@intel.com>
References: <20241108160021.1202234-1-francois.dugast@intel.com>
 <20241108160021.1202234-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108160021.1202234-2-francois.dugast@intel.com>
X-ClientProxiedBy: MW3PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:303:2a::31) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ2PR11MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: b5986e56-f77c-4b24-3a7f-08dd0028ebef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qCrht9vPzMxl/mJpn6l6u1FFMxPEf0NQUnlnhHYHiijpVFztBHud1kcy065l?=
 =?us-ascii?Q?m3bT6/E58bNVgZCRJ4PoEKrrxd6IlSUX84K/PUHWMeaap4zPRljKLshfpgln?=
 =?us-ascii?Q?mlE+aatiAaXIyNv53rk0Utbh6J6qWVZKRm2oXqYmAnhGCuaTNJrdTzdIjLNt?=
 =?us-ascii?Q?3zpBu/Nk08RCQVwSOuM4busujqv50kOGoSPtkdPbhWnSNHLfKxgjp8ANHI/Y?=
 =?us-ascii?Q?TT9Exjcf+V+kZf+jBYo7pCW0sIOfV0/S3ukSC1rCE+aEG/u+LQ9SMDif4UuS?=
 =?us-ascii?Q?xna3+MuO8XUjEeoCqIDP+oU9Xk8yFCrAmcBY7Br8T5Aujn7m6B46BdQGJ/EH?=
 =?us-ascii?Q?2CdPaUeoUuBfJb99tvXQRfg6YtaT20HYkR5iOgpEL318PM3mylGfkgA8j1oC?=
 =?us-ascii?Q?u7AOHt1c19ULGWfQjsbZZA0ipr/GMIADXEDbBdgz6z+FsWeKIVxKUtDTg7or?=
 =?us-ascii?Q?KIL0Qs5FxNh2bhF50jPkBUAWkn9mnkLJCbqGrFhFQwvIiBWnxYAsXSB0wJ48?=
 =?us-ascii?Q?FxjTboovSdzi7GRrcUT2A1Mz3yC7zxIxeF1t4hGZSF/zuhQfoitIzTcCiv4W?=
 =?us-ascii?Q?C8MfpELbHsSEW5uLBXgEKNtZBQ6295+bwsJvcAnYIe02NJ7uTiXdGQPDsneO?=
 =?us-ascii?Q?JQkud+oISkHgbAp8XZn5YwxzalagH/7ST0IlIdcuxRrhNigyS186oMJw9mv5?=
 =?us-ascii?Q?c392eQiQkDOphxs+djM2osU/gLmuy9RnVqF4N13BJf9MQ5ZGlM2WsZoNMGvJ?=
 =?us-ascii?Q?mm6VSbiD6tsKzPsFJMuXZkiikdQMcJ6fVeBkxmV/kmh7yF0bfvpJ85zSy2Bb?=
 =?us-ascii?Q?WSna8q05ABJ0psI2FsBCrahv6bisQyryaf+enqqhXSABYWV0gps36B2q/cxU?=
 =?us-ascii?Q?khkDmSRDFmAa21wWYNVaEOPP4zWxEVJjaCag+yM7nL7qbpeep+otXBse7+XR?=
 =?us-ascii?Q?KLZA8EVnirhA52D9jKz/cJ8tBnSfewwQLpknTOiPcMuzMycgPm8PHIC3RLDu?=
 =?us-ascii?Q?y92UQknzzy6Xj7WAVEYVHhPaF1/ep7vEOQlNZ6JvvAm5Gpl5+gqtDadBZiWh?=
 =?us-ascii?Q?vODYj5uEu/jSJN2pHQplxrxR4JnRGPNU+giDmc7uEThmn8rUqmAYL+u7AdaP?=
 =?us-ascii?Q?aWqbIMYQj6MQ8MNwB5PmW18NjG/7ZGlNklvBE2GxUycgGmwtsp4ThwtuAhos?=
 =?us-ascii?Q?RFZHmJ703myrSerdAfWEvAQCJdNiziwiaaxh8eliOW93QiSEn7zPr1QldPWM?=
 =?us-ascii?Q?qW5SpcjzBN2de2fHCcrhpFR64YEadKW/r5neHyuW5Zyqd3HT2lfG+7RUOMiU?=
 =?us-ascii?Q?EFtaMNV82MTv3bSStgTnd+De?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JeVj8DpDLOImTdSRohvuddW6ZEhSBaCXeSzsd4tBR6POpsboFtHUvjRT3y7+?=
 =?us-ascii?Q?wp0gh+qKRaj7niJpql5ARPYsWqiqfubI0spSzJw3RbK9JFsUSV0fZrpxYEz3?=
 =?us-ascii?Q?Q+s8tPLQy1EHdAzm1p8qcIW/Zi599fMckfVI+/6e2shV7QQHKgRcR5q7zI3O?=
 =?us-ascii?Q?z9nkzkQFrclVYCP68jy7YnZvujSrjkBC7+oDscH2tD+jaGLUtDgxVKDucJr1?=
 =?us-ascii?Q?XDrq+ukzO2zDRdKm6PYo5wLko3RYPpf8JAMWBoiOB0oB8Lj4Eoz/7eUe5XFH?=
 =?us-ascii?Q?eQUmn/NOmx/GckSzAc3BDQja2WDOv2753wFXuMzmNUeZDXgY65xTQq0yX7bz?=
 =?us-ascii?Q?Y6a/QGuhRMdfcvqlSoFet7Yr2re2CGyDNSdpAtUOah6xS0SBnU3w0cgTMf9v?=
 =?us-ascii?Q?4e3W32ee8NkOvF6TXmpVc313+I97SAW8dXIenOdxEBvzLrbWMktAE0+5Xkej?=
 =?us-ascii?Q?mfUyeLJnB/OfYII9S0ctjt0SXquGQCQzKX5mpWrArYTsh98wDwzBA0KhjGC9?=
 =?us-ascii?Q?GVyUWvhM1zqkxRE3FFLdcftpCFWEiiQieuXEsE7thNzJCDqCUZx2493aDf6D?=
 =?us-ascii?Q?Ve2okqvBLn40sahX1adAurnwboNPF5EaXOnPq3vW55PdNUEXCR9fnour6RRl?=
 =?us-ascii?Q?yzT9derqfGmC7cO+Yz/wI9Kmvo9YqaJyXEh5RLAjmukbrDFhXx/FVSwfEEfX?=
 =?us-ascii?Q?JQ3db/pu4slyQw2y3r6KNsXXbGTFc/pIkNr8LSsNro8oBxlteEPfmntSfjFL?=
 =?us-ascii?Q?vXX2NryAnhqvrcRy8EZJzW8rD4rTGtkNuoHMBGEAHPWtCnl7VfgWGwAAdSmd?=
 =?us-ascii?Q?ntxuIqJs2GSe66hWJ6ovsibfK1IqNQ7WT3ERL8BuWyvcpzh3AxgeQN67PNZm?=
 =?us-ascii?Q?z3q5ZZq+fvpwTwPlc/J5OaoLjJndcsON6YZ3Q8l5cGd0bXUVHiuocqkLvfHo?=
 =?us-ascii?Q?Yj+z85Eg+Dvpvw6zx4vy9g6K0CNYdQGF7NuBDCm6aUWvh97LawWpH0SovnR2?=
 =?us-ascii?Q?o4oRF7mJcbeUjXuGx3+rggCE+YfCXrMExco5aVTV84xwUHEzOhbc+fJ8FRvL?=
 =?us-ascii?Q?F3RATD3VMa78CWN+lq8g0mYgeql0by8ACzZKIrrBRYXSzyUj7oPdVZ0BsO9k?=
 =?us-ascii?Q?ABsT90gfsqrqEsMsBxfc1uaW4i4XlFJ2+iPE0AjA8FTZQYACyzI4A09LPMMk?=
 =?us-ascii?Q?7mQyEa/afuaqsEubqEzijvr4CqvUv7wch5hUzuVdDScZ9+QmGCP2svrGj5lP?=
 =?us-ascii?Q?7dhA7SpkKsAn33my7s88yk9ibQOOXQRXYkAcFV8jqpnjYcDvgsFa1cUpZ6k2?=
 =?us-ascii?Q?xCezsV8CQHvoFN4s28FkWaiXyCChZNhbQv/hDG7s4niwcIcB/PDYOctMGSdD?=
 =?us-ascii?Q?spbYL+X/9iCfzN59Zk6ygFH9yf2iBqluXknZFkXAQyNlgLOYkn6hVpLTubdi?=
 =?us-ascii?Q?etQB3qco3x8JYPRhb78/FQzG0sIDLCFmd10vGb+07obmHp1HsfrNeRUmgSYW?=
 =?us-ascii?Q?AF6DUQdB1UQdsdv7BS1mIqHm3koyNIUfvDc4sXbJzbL2I18ll4ZniFZlFZy5?=
 =?us-ascii?Q?rXAsWU/JP+AKZidI4oq4rxd5/cTTsqyall1CPbKkGC/a9FzHlbMOTc9WGTPw?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5986e56-f77c-4b24-3a7f-08dd0028ebef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 19:09:52.0230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: te3MR9OoapHnrC/qBbBVjc4DziZHkV7GP5cEIGhfBYrmiXAnieDCZxzL7OEorsPSIRQrpJltq43QuS1iTEh6LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
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

On Fri, Nov 08, 2024 at 04:59:29PM +0100, Francois Dugast wrote:
> Until now the list of error injectable functions was determined at
> runtime by reading debugfs. This was convenient as a new function
> added in KMD would automatically be tested in a separate test. This
> worked well as long as all error injectable functions were meant to
> only be tested during probe time, which is a specific scenario. As we
> want to use error injection in other situations, we will not be able
> to automatically determine if this is a case for probe time, so we
> need to make it explicit.

oh, that's sad as it was really convenient...

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 72 ++++++++++++++++++--------------
>  1 file changed, 41 insertions(+), 31 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index d1c8b2530..891b4d70b 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -11,8 +11,6 @@
>   * Test category: fault injection
>   */
>  
> -#include <regex.h>
> -
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_kmod.h"
> @@ -22,7 +20,6 @@
>  #define PATH_FUNCTIONS_INJECTABLE	"/sys/kernel/debug/fail_function/injectable"
>  #define PATH_FUNCTIONS_INJECT		"/sys/kernel/debug/fail_function/inject"
>  #define PATH_FUNCTIONS_RETVAL		"/sys/kernel/debug/fail_function/%s/retval"
> -#define REGEX_XE_FUNCTIONS		"^(.+)\\[xe\\]"
>  #define INJECT_ERRNO			-ENOMEM
>  
>  enum injection_list_action {
> @@ -45,7 +42,7 @@ static bool function_error_injection_enabled(void)
>  	return false;
>  }
>  
> -static void injection_list_do(enum injection_list_action action, char function_name[])
> +static void injection_list_do(enum injection_list_action action, const char function_name[])
>  {
>  	FILE *file_inject;
>  
> @@ -114,7 +111,7 @@ static void cleanup_injection_fault(void)
>  	fclose(file);
>  }
>  
> -static void set_retval(char function_name[], long long retval)
> +static void set_retval(const char function_name[], long long retval)
>  {
>  	FILE *file_retval;
>  	char file_path[MAX_LINE_SIZE];
> @@ -129,12 +126,27 @@ static void set_retval(char function_name[], long long retval)
>  }
>  
>  /**
> - * SUBTEST: inject-fault-probe
> - * Description: inject an error in the injectable function then reprobe driver
> + * SUBTEST: inject-fault-probe-function-%s
> + * Description: inject an error in the injectable function %arg[1] then reprobe driver
>   * Functionality: fault
> + *
> + * arg[1]:
> + * @wait_for_lmem_ready:	wait_for_lmem_ready
> + * @xe_device_create:		xe_device_create
> + * @xe_ggtt_init_early:		xe_ggtt_init_early
> + * @xe_guc_ads_init:		xe_guc_ads_init
> + * @xe_guc_ct_init:		xe_guc_ct_init
> + * @xe_guc_log_init:		xe_guc_log_init
> + * @xe_pm_init_early:		xe_pm_init_early
> + * @xe_tile_init_early:		xe_tile_init_early
> + * @xe_uc_fw_init:		xe_uc_fw_init
> + * @xe_wa_init:			xe_wa_init
> + * @xe_wopcm_init:		xe_wopcm_init
> + * @xe_guc_relay_init:		xe_guc_relay_init
> + * @xe_sriov_init:		xe_sriov_init

why not alphabetical order?
I almost missed the guc_relay because it was not along with the other guc entires...

>   */
>  static void
> -inject_fault_try_bind(int fd, char pci_slot[], char function_name[])
> +inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  {
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>  		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> @@ -149,41 +161,39 @@ inject_fault_try_bind(int fd, char pci_slot[], char function_name[])
>  igt_main
>  {
>  	int fd;
> -	FILE *file_injectable;
> -	char line[MAX_LINE_SIZE];
> -	char function_name[64];
>  	char pci_slot[MAX_LINE_SIZE];
> -	regex_t regex;
> -	regmatch_t pmatch[2];
> +	const struct section {
> +		const char *name;
> +	} probe_function_sections[] = {
> +		{ "wait_for_lmem_ready" },
> +		{ "xe_device_create" },
> +		{ "xe_ggtt_init_early" },
> +		{ "xe_guc_ads_init" },
> +		{ "xe_guc_ct_init" },
> +		{ "xe_guc_log_init" },
> +		{ "xe_pm_init_early" },
> +		{ "xe_tile_init_early" },
> +		{ "xe_uc_fw_init" },
> +		{ "xe_wa_init" },
> +		{ "xe_wopcm_init" },
> +		{ "xe_guc_relay_init" },
> +		{ "xe_sriov_init" },

same comment on the alphabetical sort

but up to you. The content is correct:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> +		{ }
> +	};
>  
>  	igt_fixture {
>  		igt_require(function_error_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_device_get_pci_slot_name(fd, pci_slot);
>  		setup_injection_fault();
> -		file_injectable = fopen(PATH_FUNCTIONS_INJECTABLE, "r");
> -		igt_assert(file_injectable);
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
> -		igt_assert_eq(regcomp(&regex, REGEX_XE_FUNCTIONS, REG_EXTENDED), 0);
>  	}
>  
> -	/*
> -	 * Iterate over each error injectable function of the xe module
> -	 */
> -	igt_subtest_with_dynamic("inject-fault-probe") {
> -		while ((fgets(line, MAX_LINE_SIZE, file_injectable)) != NULL) {
> -			if (regexec(&regex, line, 2, pmatch, 0) == 0) {
> -				strcpy(function_name, line);
> -				function_name[pmatch[1].rm_eo - 1] = '\0';
> -				igt_dynamic_f("function-%s", function_name)
> -					inject_fault_try_bind(fd, pci_slot, function_name);
> -			}
> -		}
> -	}
> +	for (const struct section *s = probe_function_sections; s->name; s++)
> +		igt_subtest_f("inject-fault-probe-function-%s", s->name)
> +			inject_fault_probe(fd, pci_slot, s->name);
>  
>  	igt_fixture {
> -		regfree(&regex);
> -		fclose(file_injectable);
>  		cleanup_injection_fault();
>  		drm_close_driver(fd);
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
> -- 
> 2.43.0
> 
