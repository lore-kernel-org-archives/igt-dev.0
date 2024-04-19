Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F80C04FF6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 10:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA3710F609;
	Fri, 19 Apr 2024 10:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVRAQ8J0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8635710F609
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713522752; x=1745058752;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jYkfcNtXCxVn+xoLoA69WkPbSqIpPO5k/LWdHpfYT+g=;
 b=BVRAQ8J0GiEa0SW+0NMlUi3ggqwQXNu3iiBGbwfA0XD18CDYyG8L7PRQ
 izlR3bm7v2ttQDRFYcDZyWvrPIy7uGQpHUq4al/THLddZ7UEq/htVxfSV
 jpM6fLW7GpJgHbJiaDdorBuukAnfigg+bvb8/hvvzekmCd1R1xTERDX5M
 jx/K9AmBC1fgvM30OgMB9L+upcumhBuSpTZq+anjuIGUJdGw8w48aabMA
 1iamntDimPZY3Qyb7jgVeoGnqz3VnmeT5O+deZyTwJvu90csb38/s1k6D
 UIOypmtEzmpTIYTMFTCuq4oTBia3zvSzAoSLFKFZ22GZvy5vZ2nM9jWn2 g==;
X-CSE-ConnectionGUID: YyO10mfCR9KWV2Nc2KnIuQ==
X-CSE-MsgGUID: 2C/zHYvjRdiwNfxIXhNbNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19727282"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="19727282"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 03:32:31 -0700
X-CSE-ConnectionGUID: kiMZLaM5Qx+RzmSe23zs1w==
X-CSE-MsgGUID: jIFzujBuQcuoSznAj9KT3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23277519"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 03:32:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 03:32:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 03:32:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 03:32:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 03:32:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jto6ipSzqTNyuyO4P9ZrH2H4byPJ8VE+q5cz+gyZ29oMBIVfVhqB0Lb+uOsc/Vaa74wBp0rFAEZMHWOiTpZ7VVDVfpOqHb9VKtsa4D2vbJQNJWJ0Lr/UYPJGQrR0K3Fuu+4MGgJjv+wWdRfd/f+IzXlCUs434lJvK234oKAMKs6gF/Se3yvFU0kIG5xxNM4aJiTUVShsgYvtpTFyB5A4DXaXyVaJoazBVTrYiSjyfn+DjwVGuR9vo8DIRxJVE1o/BFMCGGPTPSSWs9nfYflEX7ZBVKtjaiKYjp/GlcvRje1ZfryOY+9nGT5mB916jJ9UlvPa8eSm1H4MAQjgAhcqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ouxJuZ4aYZ8GmkDi8e0bVlqx+epPg59l4lNxQzMghY=;
 b=CQwZCqUERKrFtz3ICPS1vH0Dfz8bv396OwbVgXluR8Ju5yVNpBpFyUHp7kzIQHyQf3QVhwIB/T5c1PTO8pkUnvcEEZ8MzsaGUCeWYjfpTag0WSgGyWHbyibndD3aqzamyWVKJvTYl27/rtfeD2qyrb0kuLjGOM3ilsAqKKCz52NOmtF52/89F/CqlVabAiEWX346bNY9W4Fyd3jrerzpBYG4IKIqi+oJnL46wxLOEBgZteNQbkbvH4U6B/ks5PTaqiuhYVRwYc6QAvc7vUB6JiGOkItIumYUI85M/ooevZpyUCF9buPrCShMqe8pW1IF3m1HQoaESBkXaQJiL21YeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.14; Fri, 19 Apr 2024 10:32:27 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 10:32:27 +0000
Message-ID: <f0f4ad9e-d778-4876-9d7d-ce35831266af@intel.com>
Date: Fri, 19 Apr 2024 16:02:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/7] lib/igt_kms: remove unused
 igt_force_and_check_bigjoiner_status
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Ankit
 Nautiyal" <ankit.k.nautiyal@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
 <20240419064001.2401850-7-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240419064001.2401850-7-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::15) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB4976:EE_
X-MS-Office365-Filtering-Correlation-Id: 501c850d-ca4b-4b41-8705-08dc605c0220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: RWf5rKdT1Fr4FHKygweMyG+3cPMUJzx6rcNGLkzjk+n7pdiIykY2WY76dD8+wQxpor5/nxVbPhW5AnEwY5Zj1rrDWXFfUyOxkjJcZKX6QuS7eTCgPG5v4cH+LHw1/6mkdik7icPzvdrCwZSDu/8x4NoBTRdAuX7BCgWXcC0wD7OowSV5wgix9+MNEq6T4Rf2pECKJNI00DrrR5TLp0t4J+fIA3pHRtkEO32ifbu24sqV8S5oMmIp+BJk9QkrP2ikZP5pzWC2E0gTD6ZFyd0ysgDA2zQ+biP2h8VUe5PcCYevyXuAgkLbtt+siXbDcCwjAKy6Z1aGK/Q5N5x8RLw+l8CqBR5DFNJ6J7DCJCz1xaQPurnXTMZX89vQmjg0bJ9656LnwLRbOjH8MlyV6FwMB5xoKpW8YaJy9T8f65J1BaIUj1KRcZCP+9oE6XvoyIEqBkKMylF5aKzYldWomVbpKFg6PTyyXS84924BR5ui1hEjaaFqwSvkoT7ncIfps4K3ahlfQ70uxLTteQN6dF1jEh7CBGpgGNM1H128ppCvL8Z/kzJEhtf3MT2VDTuh4o0sHrWbyHt+eq0esaYIr3EbEd2vBoXylbJ5iVyVMLIZGeqqocXTmYZdAz9Y/x6YN9Lo4TgYyZR96vDTaJKNu75QfhOCuvhy3FvG2BK96Ao3y3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWZPUGtCbVQvc0Q2KytaNmsrWklzV3NqVEVWRDhmcExFL3NGMGptVnBJcGZl?=
 =?utf-8?B?Q3E4R3JRc25mcTgzM1Raa3pXbTJIdElqdG4wMjR0T2JpVTVXMWF0UWJXdC9G?=
 =?utf-8?B?bzM4UENWM3lIS0N6U2lqcXFWbTJiK2NYZVlxUkFoSmYwQ0VRRjRFeTI3WmdQ?=
 =?utf-8?B?TlhwSjkzOXpiYlBtTEQ2NkJBOCtJNGJDdWNSVThqOXR6cUNpcVJ4eFBZUXVp?=
 =?utf-8?B?UVZsaEhkV01WbWZwSGhpeU1Mb2FGMVE4OXBRNWVLUGkvQVdWQjk0cFBEUkZX?=
 =?utf-8?B?UnJsckp4UGxMR1YwaW5xWHVFcExRb3RIeG5adzVvY0NYZys5UmRrdVRGRHhU?=
 =?utf-8?B?MWJWRGx2L3NJK1QxTXBQdmhxbXRWVjE4a0xJSTl1RFYxNEljZEdMTTZhVWYr?=
 =?utf-8?B?SFkxNEgyekZtUTA0ek1mdjZmOFIwTVQ0Y1lScmdMNEFMOUdUVWxvV3pEMTdX?=
 =?utf-8?B?NXZOb29aVk5PTkFlZU0ySVZ3dW54K1VqTFZFOXJTRlNjQkQ3VUFORDBCcEpD?=
 =?utf-8?B?SWhRNnRiWm1wVlppWGo2MVgzR3JrSDAxTnNsN3Jxd01YRFRzS3IrdFVxTjNv?=
 =?utf-8?B?NmI4S2R2ZW5qR0RXVmU3K0tQUFVZM0F3bm15QnhBMG5uUWplVlVRY0s4cGV5?=
 =?utf-8?B?YllBWUtNbk5DR2xkOUNETS9QT3pzenBhK1FZeGVuMGRtTm5YSDlmaUZRUXR4?=
 =?utf-8?B?b1NXTFVIemtuZCtEMFo3Wng2YUFCaGRra2R2d2EyVTE4em5QNVQzcWVJQ2Vj?=
 =?utf-8?B?WGc3VFVWYWhuR010OGI0MytxNXhKbDNxSm9sbHlYNVBGRmozeFpRZWc5WVQv?=
 =?utf-8?B?dlcyRXZuSm00V2oweWZ4bndCanFyM1dnbVhEWFBnaDMvSlhGS2IvNzJtSE04?=
 =?utf-8?B?eGRpYXVveGtHWW9tN0JYems0V0dWREdqQnFYOTVOZjhWM29oOHpOb0VaRVJI?=
 =?utf-8?B?Qy93cEVSVHNEd3FVcVYvN1dUdzNUcEZzQS9WYnVLNUdKWUxCeWhiWGtEU3dN?=
 =?utf-8?B?S08yOVc2RlRGRzJTZ3lXVDRmTjJXM2o5b085dkM0Wm1DUkVlZUVXbzlzQ1lF?=
 =?utf-8?B?L0o3VVFnSmpNcndWQll1Mi9xbVZEZHRPV1JZbG4ra2V3Um5pV29HTExqVHRV?=
 =?utf-8?B?SDBROFdxWEthSW1HQXA0amlSWjBMVS9WVzhQOG5oRzN5Y0Q3WjV3SEdqSG51?=
 =?utf-8?B?cm1rZGVFOU84eFJFRXBURmNZNHA1anVZdmJnMk8yb0VvbjNUbS8xUmRLTUsy?=
 =?utf-8?B?bXNwNVhJRHVhWS9rT0hwMFBNc1ZYK3BmTXdLQWVUYkEyREFpYVJxMkVKSGF0?=
 =?utf-8?B?WmYyTWZiekZVc1I0TEo0RnpBT2xoVFRUeGFhdXU5V0NhVW1PZmN3S3lVcVJV?=
 =?utf-8?B?MFFNS1BLUlIwUitaRVJHM3FJWjNYem5JdGtBWVVvUzlDaE5ZN0YxYWlnNzd0?=
 =?utf-8?B?cWxiZ09CdHphUUNFMU51NmNsOWxOaHNlQUFDRCtQam1md2toek9zUVFjbWhE?=
 =?utf-8?B?TTlEaGR6UG5qM2ZKbTJLT0ZwY3FOanFIOFJoM21Fa2lXWDRpcVBsOVFhQ01S?=
 =?utf-8?B?NmlmSEF4UGhZbEdWeERLWUNpN09pZVFZbzl4VGttbGJxaXVwMG9QVEpVMC96?=
 =?utf-8?B?NFQ3dUhvZDdoL2dIZkt2MWpxUzFWSjRuZW9jOHlmcVVoVVZnaGhRWDdzRTNL?=
 =?utf-8?B?N1poVW1IWFpkUDB3d0xlYUNxWnNTVkZCV2RMWjVoVVZ2dU1EeWhEWm93cnps?=
 =?utf-8?B?L1Uyek5RbWpON1ZNVVIwL0drTml2eUxPVlJCWnFQMDA4cmtMS2J4NGVaMkxl?=
 =?utf-8?B?YTRRNnNKLzNlemRMRzdGRURJV0pyZndVa2hwNVJVL0lkMWg4cWhzMmNrNUNi?=
 =?utf-8?B?WC9BK0VpaGQ1b2pqSzNaNG5ZQ0hEOHdCOXBGTWV4TWNXRWtjK0xxcFJ2TmFx?=
 =?utf-8?B?MWYwSHdTTkFXYTQ4YS9MK2E2R3pRRCt5cGYrZ1JJUjB4eFF0SjBSaVlCRmxa?=
 =?utf-8?B?TVdic3dtd1Vrd2dyYWdPbzQxc0hUd3ZyTDBVUDQrTlBpVDdlbkRNL3pyVjg3?=
 =?utf-8?B?MEhKMXRQVEZpTHRxRVFGbDhZTFJReDBMWlhRNllnckpmT00zK2ZydzdGSUl2?=
 =?utf-8?B?dDJoZ0txSk9Jd1FpM1AxcGV4MHNxdFhBV3hJUVJxU3ZTNGZXSjhPTnZqSGNk?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 501c850d-ca4b-4b41-8705-08dc605c0220
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 10:32:27.2109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vy2E1Dh2xoxphyCYH9zQ9gq1nCyCCRQAOu/aV2xSW762ruaqFrn52PTltPFSIIgQRFcdtR/f8Mnu8l6+547X27Yra8CtIKXl2cfNRHiVfYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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


On 19-04-2024 12:10 pm, Kunal Joshi wrote:
> remove unused igt_force_and_check_bigjoiner_status
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_kms.c | 28 ----------------------------
>   lib/igt_kms.h |  1 -
>   2 files changed, 29 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 324b0527f..35e2a0bb0 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6332,34 +6332,6 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
>   	return ret >= 0;
>   }
>   
> -/**
> - * Forces the enable/disable state of big joiner for a specific connector.
> - *
> - * @drmfd The file descriptor of the DRM device.
> - * @connector_name The name of the connector.
> - * @enable The desired state of big joiner (true for enable, false for disable).
> - * Returns:
> - *  true if writing the debugfs was successful
> - *  and the state was set as requested, false otherwise.
> - */
> -bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable)
> -{
> -	int debugfs_fd, ret;
> -	char buf[512];
> -
> -	igt_assert_f(connector_name, "Connector name cannot be NULL\n");
> -	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
> -	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
> -	ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", enable ? "1" : "0", 1);
> -	igt_assert_f(ret > 0, "Could not write i915_bigjoiner_force_enable for connector %s\n", connector_name);
> -	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> -	close(debugfs_fd);
> -	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
> -
> -	return enable ? strstr(buf, "Y") :
> -			strstr(buf, "N");
> -}
> -
>   /**
>    * igt_check_bigjoiner_support:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0abf450c1..01604dac9 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1216,7 +1216,6 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output);
> -bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool intel_pipe_output_combo_valid(igt_display_t *display);
