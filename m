Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA30CD4F3D
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 04:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB49F10EED4;
	Wed, 20 May 2026 04:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DYtk56N1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428CF10EED4
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 04:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779250179; x=1810786179;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NadcTzk1biIGib212IGoHly/2A0Wg4y2Ipo3cd7pl2o=;
 b=DYtk56N1vih4zTKSXiV1WAOqxsLSd8YP9RLLlD976jWkRa5Pgs4HxxA0
 Lw/Wd+ZqX00zWwqTELYrVWNFoSzPstH274mGXI/FzYiXMXuZv1N3vlOnt
 ggc7qkaqCcuAZhUWrsRspGp8S8CoBLwXjDQHbaHHtjJqkBymVYEy8dPJR
 FdCgUTgiK/aYUi0LcuKyF1841ElpKQ5+jIkfjMEhCUtwOUQ+HxJEnMQfT
 rH40hfOWSyfNhgGU70bb7tT2wdn1uHOrYNubsJrLGpFhHN0YrOeR79yBx
 nGRZPh2so92nGYJdI96OKOr8DusdZO+ynvh66Dga9c5uV/rGHwm0vyuFE w==;
X-CSE-ConnectionGUID: VarTIgJ7RkmqXNuU8Rt1XA==
X-CSE-MsgGUID: sYrz/MTYQsal97/iIViJnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="84022807"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="84022807"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 21:09:38 -0700
X-CSE-ConnectionGUID: sEaJokFlQgq5RA6Mm+mvZw==
X-CSE-MsgGUID: MC9Mw1PUSHC3Xlk1+by4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="235577068"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 21:09:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 21:09:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 21:09:38 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 21:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7zuKha3z3vAw5k3rZpceJhv6ScpH7uZhadGfW++rwYTsFOBCt+9WzgpiN5N4WWtTYstGy8qNwuwSsO0R8VIZ6fscXT/a8EbVO5DynJdbvcmdMd9v25uNoD75twu3+kVSjcNsWOAXONRWqMnOGHoVko1cpgEgVeicbVidJbNjt/c8wBsVlHKFpj0TS7nKE+U8iAuydvZnsJFmRMrk9Z3J1ow6B60SaMZidGTz8MZldMITRO7yF/AtHKAhTCSyTw0KyOB8mTTvsh6zGTEI3OdrCUM1qraskFgiV8No2yKTwtGK3GkPVhUn9rvN+yRfACM1nyUcKN4/cUwv3/JcS0ZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYehiOwEj/oeq3XL8JKo8w20HlKhxvDSz86G2DcQm2k=;
 b=CeIKm5tt//ktnRSuyHplIAdssmk2Mpnapg280xytDse/oCCrmFH9g93DeIwnzNDCdlTk6YqJqvG0qcQKTPpA0Go7fCVcLvwUVAHOW8NN2fArtY4Rd3ylBzK3W71TRZGarzUDEydezecXGSDkXnfTZrtW0HNcb2cv8DInTobQ50RlKEH+PatiuelNphNZPyrnA2oju2q8Uqrsqx6+5cE5Qkgt6qTgq4xdCOjy+EntRcX/QhBdKRGd1jIlNSuLStfDwSCoFcQfvzfjvJkHQgAizVV7HQt1fHtbEstl//eLWihgxrlO//BJ/T965Cws/HHnQLziJDCLx4hkCgp05EFvBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA3PR11MB9039.namprd11.prod.outlook.com (2603:10b6:208:570::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Wed, 20 May
 2026 04:09:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 04:09:35 +0000
Message-ID: <e00a1b14-f0a0-47e1-9e86-b57434fbe500@intel.com>
Date: Wed, 20 May 2026 09:39:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kms: make max bpc query return status
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20260518040353.212734-1-pranay.samala@intel.com>
 <20260518040353.212734-3-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260518040353.212734-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA3PR11MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b82f98d-f8dc-4964-723f-08deb6259a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|3023799007|22082099003|18002099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: JZG6hjeTwGxMsgNF18vaQmcch8OjofIH8ehlA5phP6vQ8ZGbqAngbk1rHt0ewW42+X8AdYRRp73mqCzsGdG6hQQaDq/BQl/aiUs2++A2OTEp1f509h702ykS07bDJCReZ09njntvEAwjtl71MJ7WDrwxp4WkFZ08KnKCftbtALei6rGlfRbnjtE33ACuLsx5nmLMBu0hhBAqJ5mUxUcRexi7xA9cGmrM2kGNgGT9rULmSUFX8nW9SosQc19LGITy7+OXBO/O+hL/hKtbqxwfDxVIKo4Lp8rQYS0HYnVGVaq2ApMJn2Ns8XUCsJ4+OgWInwQTa4ikYj4kUtdlOvk+ueohgPLgJMuWTuAbn7tIMzXftKKk+oRFPz0MymqqAPIrUoDRcrzNZ35UEkrQ3MWx06A1IgtdNk1Czy270dDjm3T+M35F29hnMb9TBtQp6A3IEwVOWwZkPOac4MInwoQMxPtU1vz+3aHAHuY0AOQTsNZv9br04jsYTaxFuQOqVlHCTO7QJ6r9RjbvZ+H3pLboHVJKwDUL1l9kAudV53v8xVCjK04AL8vlr3HCtJrkLabWFiK7ziGoTrszwYg/cNEE+bvhf8EzmTz/sFLVrxOTeAP1oGe9KmnVsSaExK036aOCHOF81XnOej0wPYeXWi0CIZZGMgdB5xbCEMqDLCNrlzC23MVolJFYvP1g9OW6S6ex
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(3023799007)(22082099003)(18002099003)(56012099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1ZGNS9pRENWS3JYSkVKcUxNZ0tCN0dHbERoN010QkRsT1p2Z2lGdG9nZUZ6?=
 =?utf-8?B?dUtYN3BjdDE5S3VSM3FWZ2R5TVRTNmZFTEJSWnlpUjNmWkhtRmZ6OEFpR3FH?=
 =?utf-8?B?UjI5NVdLQndHTXpxb0JpNDJHV2QyR3p6eDl1Zlc4MWo4Y1RQYWVPR0N6dENr?=
 =?utf-8?B?NHZZTEFMMnd1TmpILy9ia212Q3F4Uk4rV3c1cm8zRzFlcGo5a2dINllMdkVq?=
 =?utf-8?B?bGtTQW94a29HbGljQVBKV1JYdmhuSmFWZUFmNXk2cGkrS1hEUmJCSGkyQW5l?=
 =?utf-8?B?bUQ0MEJWenYvME4vcndqaGJwajIybHpiSUFxV2YrYTA2VktoWTJNdG9uYnZ5?=
 =?utf-8?B?RlFMYmp6bkx1cXRiWFNaS3VVWDc2U2N2SlBzRUlQVHdRTXZqL0xOcWZGR1hQ?=
 =?utf-8?B?Mk56NmtUazRpVHQrMi9IaVV4SEFMQXRoY0ZvaVkzaFc5eHphOHliRjNFQlhv?=
 =?utf-8?B?TWhINGNKVXdsTzF0N1pyaVk0ZDZQSG50RlJvU202MzdKM2RiNnhuNmJTQzBR?=
 =?utf-8?B?YUtIOHQ4a0gwRGtmdFhQUW1ZS213Q2FGMmM1RXdJTWdtV0F3dnRxUjRwcGxW?=
 =?utf-8?B?MmgremZGZTJvRE42WjRLNFIxNGR1N25KSWFJSHYvNnhmcTdzTEJLamE0clNS?=
 =?utf-8?B?a1N6RkYvcDRkWEtFOGdmbDZOZHNRaTE5VGorZEFueTBjWkpuQXRJTzlJQno2?=
 =?utf-8?B?bGE5Z2RKeS82ZTNlV2MrRTlKcVVYazFwSTZyOG81WDFlSHE3OEN2Ukx6SC9Y?=
 =?utf-8?B?YjkrbTRtaXpWZThIMElCanNQVjZWcGhpNVhPd0lIdVZFQ3JOTWZlYlNLNHNX?=
 =?utf-8?B?alZSeU9yVENLNmxPYjZWTjJsOERkWTdkeHJWRzFGYk9HaFBWSFY4SkRialQ0?=
 =?utf-8?B?d0VDbmtDWjZWZ1RPMU4rcW9FZjA5MzFiajZFbW4zdDdsSU9ma0tPLzRuWUFv?=
 =?utf-8?B?TmorQ1psdDNVVm5zaXZTcTJaL3pNeGhuZEIxMzhsOWtseE9kYWFXTmUxR3o3?=
 =?utf-8?B?clpUYTFhQVdpbTNnbWE4NndVLzg1bUhxM1dLcjkrMEtsQzNjdWR2SFJHTUlD?=
 =?utf-8?B?Z0RDNWxvdVY1MnFBNS9TOUZZQm5CL0xPZ3NuNGFXZ3B4MS9qMTZSSTNTUEFD?=
 =?utf-8?B?bzdvL2U1WGp2c2krdUxoTFBaM0ozS2lDUitZNUFjdW1HME5IbEtyeitaeWQ1?=
 =?utf-8?B?SlMrbUZlaWNFQzBLajE1c1JERlNhMVM0TGZVYlp3QjBJU2ZMcW1YY3RYWXNr?=
 =?utf-8?B?MEoreldzbVV5N1VhQzQ1V0dlWXd5YlVOQ3haRmpjYkdydVl2d3pRbW11am1H?=
 =?utf-8?B?bWU4L3RjMUptWTh1R3JGTVROK0VsVEYwbjV6cEt0SDlMR2xRWFhUanVvVFpS?=
 =?utf-8?B?anBhWkZncmd4K2t2WEhjTk5WdmQ4Y1c2T01xQmtRbnMrNE0rYUkxTVdtc0tE?=
 =?utf-8?B?aE8yKzZoSVh4bWd4OW95N0hpQTl5MHR4YnlDcmxzU21PT0dPdmRJNUdxTFRS?=
 =?utf-8?B?WUEyRDkrSldHM0lodFZaVWJkNWRCNmQzZWtZelpza1h5U2dCbjE0VytDU0I4?=
 =?utf-8?B?cHRsbDc1OW5Wdmx5ZGdZclIzNUYrRmZhSFo1ZDFOdDhiRmpIUWRyVFFZMW0x?=
 =?utf-8?B?bW1UWTh5YUpDdGFBY2N2MDdtK0FlUnllcmt3U09NQ3BHY1Rsck5VRGpKNFk3?=
 =?utf-8?B?UTJST2ptMmc4bEV5blVmYlJLZmtIMWwrUFppOW51QWhpYVlsekVQd1NuMFNk?=
 =?utf-8?B?WFRvcFp5NGZaMDUrUTNSM0ZwejhZOVVWSWQ3ZVZRQkNkUGF4Z0FtZzFlYSti?=
 =?utf-8?B?NXg0bVo5RmNvSllQTWpEanB4U1ZrREVlQTVDdml0VnBtRE5JS1h4UmY3eW95?=
 =?utf-8?B?V2t1d3NsOHVHcE52NWZtL3V1UWxPU1hOYTBsSmJHWk96bTUweHAvR2xHWmMw?=
 =?utf-8?B?UkNTVmU1TmZGTTFhaUdPMFd2K3dQblVtdmxyU3ViUnY2cFRtZGd5RkhsQzNT?=
 =?utf-8?B?aHUyMGVOQS9UVkdTYmtObllUS0wzQVRibHlvSXhLMHMwemRvbGxGZ0tzc3Qx?=
 =?utf-8?B?RnlBaWVRWkExS25qck9FdUxEalFqNHJVeldWUjU5ZWNSdHJaNFU4ZEZkclhX?=
 =?utf-8?B?NG9DdkdTTTQ5ZUFwL3FYT3pXSXNsSy9GaUVTQ3d4a09SWWxNNTVOOVZZTlNW?=
 =?utf-8?B?REMvV2U3U0s4L2tzbWsva0MveVliNnFkSEEwSWRZTHdnVDB3VkxXVHJpZFZ6?=
 =?utf-8?B?L1FkakRkK1NTaUwydWxUOERFSlVMU0ZndzAydlZaRXp2cWYxSUFLSjN5MTVx?=
 =?utf-8?B?R2J0aG1XcEtMSlZQV2IydHFtMnhDL3Y1bmE0SzNRNmZlQWg0dlIzQT09?=
X-Exchange-RoutingPolicyChecked: JaMnXJvs9ZyRE5vnlfAGHhHR9VTB0d/XJGxIMFLS7hppK0ii9FS0GcYAS4TucEPYoHijMxKUPf7a4yG/NR67D/o3VKyCrctupJIscRe+usgFwd1YUQyz/CEsDMINzEzRjetyPaJKF9c8L+XjrsS6bP4DgHd8H1Kba75lRsCQ9wT5WdhFU24PCsGgvRhwy9/7+N0fY4Y4gz0NMb9Igse96EitWRpUMidstu+HhY1euyxOJX9Eanu+3wP9F05eTv9zj7xc30gbABOoOLkLnz6OVNEw4rvoHYt+sFT0+iwL/X88kLHBU7S04YVrWPggRzRc4cNyBSOz0IW3VwJp9DZrAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b82f98d-f8dc-4964-723f-08deb6259a0d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 04:09:35.1300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDP0SaIQigDBzC8kpr3U90r6rr5THvDCXzk8Xxk//GRDNex6sor6GU0g5VzW3UA1SM6bfupMS4C8jhjC/2Sc9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9039
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

Hi Pranay,

The build will break on this patch as the callers are changed only in 
the next patch. Please combine the changes into one.

Regards,
Karthik.B.S

On 5/18/2026 9:33 AM, Pranay Samala wrote:
> Change igt_get_output_max_bpc() to return bool and fill an
> output parameter instead of asserting/requiring internally.
> This allows callers to handle debugfs read/parse failures
> gracefully.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_kms.c | 38 ++++++++++++++++++++++++++------------
>   lib/igt_kms.h |  2 +-
>   2 files changed, 27 insertions(+), 13 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99fc9fa05..e1dd56aad 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6657,32 +6657,43 @@ bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
>   
>   /**
>    * igt_get_output_max_bpc:
> - * @drmfd: A drm file descriptor
> - * @connector_name: Name of the libdrm connector we're going to use
> + * @output: Output to query.
> + * @maximum: Returned maximum bpc value.
>    *
> - * Returns: The maximum bpc from the connector debugfs.
> + * Returns: true on success, false on failure.
>    */
> -unsigned int igt_get_output_max_bpc(igt_output_t *output)
> +bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum)
>   {
>   	igt_display_t *display = output->display;
>   	int drmfd = display->drm_fd;
>   	char buf[24];
>   	char *start_loc;
>   	int fd, res;
> -	unsigned int maximum;
> +
> +	if (!maximum)
> +		return false;
> +
> +	*maximum = 0;
>   
>   	fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
> -	igt_assert(fd >= 0);
> +	if (fd < 0)
> +		return false;
>   
>   	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
> -	igt_require(res > 0);
> -
>   	close(fd);
> +	if (res <= 0)
> +		return false;
> +
> +	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] = '\0';
> +
> +	start_loc = strstr(buf, "Maximum: ");
> +	if (!start_loc)
> +		return false;
>   
> -	igt_assert(start_loc = strstr(buf, "Maximum: "));
> -	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &maximum), 1);
> +	if (sscanf(start_loc, "Maximum: %u", maximum) != 1)
> +		return false;
>   
> -	return maximum;
> +	return true;
>   }
>   
>   /**
> @@ -6726,9 +6737,12 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
>   static unsigned int get_current_bpc(igt_crtc_t *crtc, igt_output_t *output,
>   				    unsigned int bpc)
>   {
> -	unsigned int maximum = igt_get_output_max_bpc(output);
> +	unsigned int maximum;
>   	unsigned int current = igt_get_crtc_current_bpc(crtc);
>   
> +	igt_require_f(igt_get_output_max_bpc(output, &maximum),
> +		      "Failed to read max bpc for %s\n", igt_output_name(output));
> +
>   	igt_require_f(maximum >= bpc,
>   		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
>   		      maximum);
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a58cb5cd3..cb3640976 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1238,7 +1238,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display);
>   bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
>   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>   bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
> -unsigned int igt_get_output_max_bpc(igt_output_t *output);
> +bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum);
>   unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc);
>   void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
>   				 unsigned int bpc);
