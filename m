Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCD5C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 13:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB721134D2;
	Wed, 17 Apr 2024 13:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RofGa9vS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE031134D2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713359052; x=1744895052;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bJMjss4LFSNxkD7FPzilaEQabVeqQQnfzDijSMCVCOM=;
 b=RofGa9vSpDhdol5uzdR8vUU36ViqeFLzvAeGmNAYY1Et4l7gOpVmvP2b
 ws/NsTYRPdRA1h3ZfM4TXOxxnw45Snh+uwUH4qcPQDp5Xg3MTMOy/kDCK
 GHFf/WO2UF+8uojwbVqiyca0NMFxxn3LcpUrBZ7r9jJMRVzRs3PnKKZm4
 0aW8wfZ+S3xECDrZYqeLKrCzTRDOV6esJEtBMIbN/pe9jzRHPlnt7p/Ud
 ADV3oZ4mkAYkoCJKLj1d73b96YyKtJgeUcb2VRzgp0udNeJQZq+BnDBmH
 px+skjziyMDr1by31xKhcceGKOy3JIEAOVUP3XcsPCML9e98Uq/qETVN0 A==;
X-CSE-ConnectionGUID: 0b2zBOe1S36e3IRzRCnYdQ==
X-CSE-MsgGUID: Ow5lq5bCQjCW/sNSU5Pd+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19995839"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="19995839"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:04:12 -0700
X-CSE-ConnectionGUID: Gri38PnhQgW0ehJZ6phViQ==
X-CSE-MsgGUID: Vca4p78rRJyEtm1YNNRErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="45918260"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 06:04:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 06:04:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 06:04:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 06:04:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 06:04:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQPUxSRkssJXzoBRlVF7kr9dKy3oCa1KDkT0gdCLWLvJUYA5iHAeGNlKKjGbtkqJITbZLqO5uoaRZQr/u1tyyk4LW1y96XjwFaQAlwUTlbCzcUFUX5MfdanKpeyRmgeA4Rx5CY/WsLjwSbCo4AEuP71i+uzpAwsIstVvpQOnWVM0wVkpL5SJybrNwyR4fjzySLshQ/R7AfpG2K4CL4OQDXAsiggwOVhaxRRIfUSPUkChQUtneH67vl4ARqKSOEOE2CUDCjEhv4TN/oDTzGi7vE6IHu5m2u3wTr6Azyx/NjEInP3wV9FoeFuPfEB/RLXE9WQsOnXhZ1kbOVB9t7YFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7BFlS0MTEF+jIhxdddOXGfx6nRq4mExZIDo1E6Lm/s=;
 b=kHDoFIbI0WxCW0B2quOCIcGTGBRrweuI51srTMh357XUhJC1R9TQBhJiLDxAzP53bs/xWCRtmm0CSXcGCXHu4hjq5MgUXxYxCMIu2gPaBrrRqBoR/nAAw34cQ/If4wb9DhlN/YLdDVa7W0uKhegvLACiBmatGKaP3OAdZskTIZoSpBiPVyIgbqbseu5BcWSqgjlQQtjkwnRXGSV4VHk8uZl4hC1kPPH2qRg/HWbayk0XHLd4MEZ0Oq5Ka/Kqka8HfP2MhRBLb3AdH8tP3dbNpsYCA9WI0vQAbEZag5bgKe1bnM0sAEtfZCKoBViyX05O1tbuPkkxYhLKVcpbbnyBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 IA1PR11MB7810.namprd11.prod.outlook.com (2603:10b6:208:3f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Wed, 17 Apr
 2024 13:04:07 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 13:04:03 +0000
Message-ID: <0eb36290-2212-4703-9875-4ddbecb118d2@intel.com>
Date: Wed, 17 Apr 2024 18:33:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] lib/igt_kms: add support for forcing bigjoiner
 on particular connector
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240417114326.2245087-1-kunal1.joshi@intel.com>
 <20240417114326.2245087-4-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240417114326.2245087-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::6) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|IA1PR11MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d920cd-d5ab-47ac-c8ef-08dc5ededb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2FvvHwxjJrhCJ3x/3zUj50fR2odWGhq8KpCg8MYCiPuWCSXUm7OSqL310vMx0j0a5JEdkl+4KbhcOgCgT2p3/+ZKGDjZ44i9bD6RxO0SfoX2JhxorWULed+ZulyNslyO2VwvBBNdWh2tSvE+v1/2nQrxRUZzZaBw1bezM5IZdgvtYGX1+znRXAT7QPT5XAZDAXYk2cnV70b7Co4yk9t5JZpHVFiFE6zczEYwbDRZ1aWAGg5JLqAXTDBS9D/rCv7mMBk6u0XFm6aU7SDQYO6GL4E9PzdA9qUcBBY2fMELnNXZHvqg/gejfupYvyL693X0aBUnx4FIc8f8FCKGRZt0QoOMn6ZksT0jBQorvg2KPcQXhIiNCEdrG7rPaMtLD+zkvVtx9thrE+X24QCDDKLrUdHKwbU59cN0lDw4Fmn76AU9FlmaOU8EGn15yrdfyF+6Av5t2WelPgWPeqz586vwIR7vXYI6gWVjPpN6+6DCTio3K8he6cf2leaeBM8D3ljv5qz3PF24KKVU2DuG62QTQBAdImKE51LkOIk1j14XHUnaaA+ZiOjULI56xnoF5zM/wvz1qjZconv9xWdWj2WGKCVkO8Ka42L29cZjca0I7OCPSZnUJ69BldW+lyeJS7XeIRQaq430FHFPu94mOx7irRh9chkbokjqHQK4YTT7H8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3VOYVcvYXM0bGFaSDZ1bEgwK1p1QXo1dEtzNFN3T1p0bXpNV1hGNkJuejVP?=
 =?utf-8?B?MVYwak5rMWJpaDVPNXo5TWZKZyt5YitpWUdJdFJ5YnZwTkwwWDlXNTJ5RmU4?=
 =?utf-8?B?b01ZcHp1dGE3NTVpMkJwVUNxN28xQVFaNy9vTjFCRTEyQmZWUUY3bUpTZXhF?=
 =?utf-8?B?WVVGV0x1L3dZT3MzeWRveWNSWnJIOXRhUGFxUWx0clNaSWNJenpMTjRzWFli?=
 =?utf-8?B?SGN6bERFVVlRdlRnWU8zbkliSW0zWDh2QmpQa3VlVndQS3RNNUpvZnc3WTVS?=
 =?utf-8?B?cFEyT1cvVDFPRUtFU3Q1RU1zVVNsZkRIUXhIRWFCR09nZ2VlczF2NW5KVGkv?=
 =?utf-8?B?LzZyamcxdHE2MmllUHMvNFZRakdRVmt2eUZGMHVXd3BFT1Y4ZzMzTVNvQWQy?=
 =?utf-8?B?c3RrbktwSVFnMGNva0R0S2pZc2FUVFQ0dUNPbVZFWFlDT3g1QUY3ZlJraHZr?=
 =?utf-8?B?dG1Vejg1elg4eFh1WDdkQmNwSmFhUHVVcFpMMk0vQlBaZWZBTVJJMDk5OUpj?=
 =?utf-8?B?QWJuUjZ1bmJYY1RYTVA5V3NnbFhmMjBtcGF1cFpUWWphMXdGd0N5bzVHTnp3?=
 =?utf-8?B?RDlqUFJCdktzM2hDTUVqbGpWMkNYM0UrREtYSWI3M3lOY0haOXdmcVM4VitG?=
 =?utf-8?B?a2lWOTlBTHVmbDFrSHZSazF3T000SUtTQlIwd1lycndRem4yTnJzdU1xZ0xy?=
 =?utf-8?B?ZGZpbXR2N2tNODk1ZGw1RjFDUlpvWE5jbUxDaGFJY1RmNk13SnlMSU4zUnpa?=
 =?utf-8?B?V1lLdC8xV0hyTUhwWmIvTVVKSDhkMFVQQy9rOUdkS1hMR2puanZZbmxhT2F6?=
 =?utf-8?B?YnZrd20yZlNpU0l1S0FZR0lGQmZBazMya2wzRldkUTcyQWVWUWljbHgydnh4?=
 =?utf-8?B?NitOR3lJd2ZMU25YZkFGRmlhZ2IyV2VscWNLYkJYQVEzeEZHVWszTFJXWUJ6?=
 =?utf-8?B?N0NWVnlDbUtuOVJLUFMzd3dRMFYzWnp6Q2NLMk1GcWhDUXI1ZE5KSlExV1hW?=
 =?utf-8?B?eWF2VjFzTUgwdklRVkRiT0h1VTE3Ymp3TnJmSTdzdXE0THgwZS8yQm9IVE85?=
 =?utf-8?B?Lzk0SE42aHhZcUl4M0tvOWl2TjEyb0ZRV2hzdEoxVEJjWDFvRkF2T1F3dlNT?=
 =?utf-8?B?eHZTVkRFSmRub21KeS9IZHd2c0tmN3FqNjVsRkFZb2JPY25JeUw3VTZCOHRy?=
 =?utf-8?B?VU9sd2RmQ1NubzNvQmROWWZ3cTNHR3ZBWGtFdjVWT2JtQnhLNi9NLzlyVlZW?=
 =?utf-8?B?MHd1SGlQUlhPd01IOW4vZlIwOEVrRVNpWHNMcFY2WGh4TkMxM2cwNFVOUnBj?=
 =?utf-8?B?amFKMURxVHZlSHRPYnNWakxja09YOGQxYmRxODJ2NXhpTFpFYW5sZEhsbzJL?=
 =?utf-8?B?dXBoSDVqcG5hTStaU1QwSExLWk0yWWZkclMyVzlvYlgwMmdQT1k3cVFrNFIw?=
 =?utf-8?B?cjNmQWlGcnU2Y21zcXZGa3IrQ2dpMDJmczFCSWEvQkZuNFk4eVMwcVQ4Nkd3?=
 =?utf-8?B?S2dka0NhZmVwV0V2VDQ4dFcwM0RsNXNEOERuQ2dQTllyQktOa2h0VktyMEVB?=
 =?utf-8?B?TStyMzllNmtCL2lPYXBnR3ZRdmp4Nmxqa08vUC9pTXBLRk5YMjl2MmdDeTFz?=
 =?utf-8?B?djFaK3orM2VZc1FBdDAwaU1IUXBiWEdvNXF2RkFpRWpZQW5KTTdyOVdnR2Nr?=
 =?utf-8?B?elg1eGJZa2U5am51aXorelpRd3pWWFkwU2FpeW54U3hNcDJsVmgybWpBWTBO?=
 =?utf-8?B?a2VyNjhtcW4wUEM4OGlOeGFtVmlWaldLTmxUWHIvNjk1bWVlUzJiWVEybGd4?=
 =?utf-8?B?KzhFdjhsOUZta2xXeUFxKzUwZUsvdnBnbll3Qy92dmJOalZBblhMdlVPWHVp?=
 =?utf-8?B?c1RwZVNCMVJicFFzYnlUakhIbzh4MFdJcjhDbGZ3NnRsWDF2Wk5RV0FVUXZr?=
 =?utf-8?B?OTkyZDFzQXdQMGtBa2E0dkZrTUFqR3QwZ1hhckdzbkpXN21wUUFIVENtTUti?=
 =?utf-8?B?ZlV5S1ZyY3NaamhjQmNrMWVidzVNdDJieVVSbmxjZUZFcTlyWFVzMnhQYVd4?=
 =?utf-8?B?NkNmVVdrUW53THU3RkdaOGVHMFhhWlUrUTRaZUQ5WVFsZmQ4eVZvSUpSVm5j?=
 =?utf-8?B?cUNpSUVreVM2YlFmUzYreVJTVEFkN2ErRnJ6SlZIalIzU0tkU2liT1ZxYVJ5?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d920cd-d5ab-47ac-c8ef-08dc5ededb40
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 13:04:03.6549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JYEbtVCYR6ZYxoMGLMn/SQCp+b7Bn2cpAryNW3lMKvS9Wbq7JNUSRC6G5I4U0WbqE/BM1e4V6hLeWRWloSSGNtZCcfXb0YupQk9wPXcI1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7810
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

Hi Kunal,

On 17-04-2024 05:13 pm, Kunal Joshi wrote:
> add kmstest_force_connector_bigjoiner function which
> force bigjoiner on provided connector as well as resets on exit.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 89 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 3216fe7e4..5332a7a9a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1458,6 +1458,11 @@ static void reset_connectors_at_exit(int sig)
>   	igt_reset_connectors();
>   }
>   
> +static void reset_force_joiner_state_at_exit(int sig)
> +{
> +	igt_reset_force_joiner_state();
> +}
> +
>   static char *kmstest_connector_dirname(int idx,
>   				       uint32_t connector_type,
>   				       uint32_t connector_type_id,
> @@ -1607,6 +1612,30 @@ static bool connector_attr_set_sysfs(int drm_fd,
>   	return true;
>   }
>   
> +static bool connector_attr_set_debugfs(int drm_fd,
> +				     drmModeConnector *connector,
> +				     const char *attr, const char *value,
> +				     const char *reset_value)
> +{
> +	char name[80];
> +	int idx, dir;
> +
> +	snprintf(name, sizeof(name), "%s-%d",
> +			 kmstest_connector_type_str(connector->connector_type),
> +			 connector->connector_type_id);
> +	dir = igt_debugfs_connector_dir(drm_fd, name, O_DIRECTORY);
> +	if (dir < 0)
> +		return false;
> +
> +	if (!connector_attr_set(idx, connector, dir,
> +				igt_sysfs_set, attr, value, reset_value))
> +		return false;
> +
> +	igt_debug("Connector %s/%s is now %s\n", name, attr, value);
> +
> +	return true;
> +}
> +
>   static void dump_connector_attrs(void)
>   {
>   	char name[80];
> @@ -1690,6 +1719,49 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
>   	return true;
>   }
>   
> +static bool force_connector_bigjoiner(int drm_fd,
> +			    drmModeConnector *connector,
> +			    const char *value)
> +{
> +	return connector_attr_set_debugfs(drm_fd, connector,
> +					"i915_bigjoiner_force_enable", value, "0");
> +}
> +
> +/**
> + * kmstest_force_connector_bigjoiner:
> + * @fd: drm file descriptor
> + * @connector: connector
> + *
> + * Enable force bigjoiner state on the specified connector
> + * and install exit handler for resetting
> + *
> + * Returns: True on success
> + */
> +bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector)
> +{
> +	const char *value;
> +	drmModeConnector *temp;
> +
> +	if (!is_intel_device(drm_fd))
> +		return false;
> +
> +	value = "1";
> +
> +	if (!force_connector_bigjoiner(drm_fd, connector, value))
> +		return false;
> +
> +	dump_connector_attrs();
> +
> +	igt_install_exit_handler(reset_force_joiner_state_at_exit);
> +
> +	/* To allow callers to always use GetConnectorCurrent we need to force a
> +	 * redetection here. */
> +	temp = drmModeGetConnector(drm_fd, connector->connector_id);
> +	drmModeFreeConnector(temp);
> +
> +	return true;
> +}
> +
>   /**
>    * kmstest_force_edid:
>    * @drm_fd: drm file descriptor
> @@ -5367,6 +5439,21 @@ void igt_reset_connectors(void)
>   	}
>   }
>   
> +void igt_reset_force_joiner_state(void)

This function is redundant. igt_reset_connectors() will do the job for us.

- Bhanu

> +{
> +	/*
> +	 * reset force joiner state on the connectors stored in
> +	 * i915_bigjoiner_force_enable debugfs attr of the forced connectors
> +	 */
> +	for (int i = 0; i < ARRAY_SIZE(connector_attrs); i++) {
> +		struct igt_connector_attr *c = &connector_attrs[i];
> +
> +		if (!c->attr)
> +			continue;
> +		c->set(c->dir, c->attr, c->reset_value);
> +	}
> +}
> +
>   /**
>    * igt_watch_uevents:
>    *
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 6d13e5851..8951fccfd 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -262,6 +262,7 @@ struct edid;
>   
>   bool kmstest_force_connector(int fd, drmModeConnector *connector,
>   			     enum kmstest_force_connector_state state);
> +bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
>   void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
>   			const struct edid *edid);
>   
> @@ -1083,6 +1084,7 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
>   
>   void igt_enable_connectors(int drm_fd);
>   void igt_reset_connectors(void);
> +void igt_reset_force_joiner_state(void);
>   
>   uint32_t kmstest_get_vbl_flag(int crtc_offset);
>   
