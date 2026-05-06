Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285DECD3436
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 11:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45BE10E06E;
	Wed,  6 May 2026 11:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAS9qNOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5EA10E06E
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 11:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778067663; x=1809603663;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lw2r2tdOi7/d4jrGOfgBZ3y8fqheJ6h0LUELxrVv6Fk=;
 b=aAS9qNOAbXTX27hHBUiBtnUOwbfrjBBAMqRI+tYWV8UoOrcNRf8h07XR
 um4VAg76DyftCrTwGmLizLGT7tIHN+vHRSE8OWw9PXZWGJAHfUiYOESix
 X0zGoOWWvdvzQleCuOm3JemMMI/ThHGBK0fMRprMn9iyFkRa4d7Picol8
 +ljoV5y4eykYr5ezvKVNtm/UdbOpD9dFh+SWxdWYS3pZSqHeyH2OGYteq
 N5PWccIT2wfyCpDNmHhHpxR6iqnB8kwSc+LbZh2vIa9KQuJzPsYLu2z7w
 IrS3smpDkYzHx2xDUagiK1wiqibSNbY7+seEFptSBt6L5eDg+knCEp4Vo Q==;
X-CSE-ConnectionGUID: vK1CiRO0RNKZix0hPOVbfg==
X-CSE-MsgGUID: 7ejeFQIkRiKUjQ9v9/a18Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66523882"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="66523882"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:41:01 -0700
X-CSE-ConnectionGUID: xrThqKXHTWKhjnHywAW5aw==
X-CSE-MsgGUID: pdv5XvbfQRG/8/n0m/WrXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="233463519"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:41:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 04:41:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 04:41:00 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 04:41:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bp4MWlmvpdpOojWOMN9++0zcxL8s8pC96TocxvA4YTa07YhWa36e61nw/9QZuULOJbax7PyZa0II1fiRLgxqcwkXlMZSoTnZOWnYnqitoA5qNCZVooDNU80cHdDqWG++xkXk4huvCx3nXxbxa4U9QJUsTHOEHzTnS8RlJaq+KKSt/HEZm5LHfcvWAIpQQgEmvMrpfVxq+MmZ2CDN4IYAGN5s3qVVGJMHzUitUaj+KuDoA52qVeZrJtl3Gyo2uqSOJIeR3VUziHcRFTuMlvCBVE9L4zINjJv9C5hTM8shyuxtZaWxxWbJxsp+Do6zsTCfYfg9IvmWh6KAMaFD6O8+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSrE2HcHjdUhYI7eQv8r0EjyBx97weXLQdMFvJYHOEc=;
 b=Y0MZn2KiXzAw9WnyVRgRpBqRFJ75i9E4xwwnlnePDa9hlZSUE5bcEV/sgdx0LHhcmNDRfMapPR5tMF2HpBDb2aRjQRn8FDxppDx2ymUqsJR7cZG2Bkr/q2hauOxQvt1A5mU35xJabjQ4giLdOHcE8BCU+XnchRNw9FE7K0231noYADupXc4un9yGwbpTG7m2Yd9gXQaHXTz7wDgoQlqlVLpf9k33GZ6EzYSL2x2peHOvW3B57h+GcOQldBX6DU3XPzMk3dBuKRexJVwjJHARuU6NKu3yJRUvnzMxg2YvJb3tdI1OD7CqpSNzeNcTA4YX5pD1+IUQRMXmDT11hjVKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 11:40:56 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 11:40:56 +0000
Message-ID: <fdb79c2f-b20b-492d-9cd8-0ea89418ec89@intel.com>
Date: Wed, 6 May 2026 17:10:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_atomic_transition: Add newline to assert
 message
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260506090426.62298-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260506090426.62298-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::15) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SA0PR11MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c56e43-5f33-45b0-256c-08deab645619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: OuYFdD/rY0bCGjFDUf2DL1KnnIszT07onwXFRZdCiyUS2MSGsKlwkdl6bHDwtWdoyJL4ay1GBDsP8cR4xjBFXzKWM65Qro/RzVlFr0ZZ9VfjF5qkhggS7+mDrW6m8528TgpaG152yHVl5Dj6MOVRy065kzuxWIC6t6uyBC2p/PBbIvgnTznVsTQLJ2qOVKUG1GX0jVXI5xlR9u+zF64HTbTYn4tEmWKLhyhNaRMKELI4nEf2oaR3YPdj0PrQ6rP16Cmv6++/XpK13mWsb/3yycUluP13YIFN0g6YlYLp/CMvR1zqRBqXH/XmDkOrbGeZ5PnZN28te0cCp9jbDveP9uMBbqYA2JSxAu1wnEnuO7TBoc/IOqHhKXXV0TbvSkz8lxmlky26fwtowXG69Warj4ftZYID2W1dByZVNIcSmCPNcJ8ZwikZqQ2qWODlblsqeNsdIqiJmFvGe1NpQUeed4FUNRbsANj9jTi5RI9LlwXlV+fqUVqVJ8BA359UBiGW1CcrvN2+nYNkG5OMTPatZnl1lxHBre8IwJYP888eu3FUlCsZsKxfyHS4Efni4HF1qf5fdOr/vd20TyS7ZLtm+xykh0LOI3ldDCCPLVS5P/JEtr/kg8HNjesZ1AaAgf0H2i+nTQSa67dP/7zgy+ehT1rxp9xyvsjyoEEVvQQEF+Qi25B0hJ628mQgPQORPwNx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlWeWlQTm5XZzJRdVVvaHcwVC9DRWVlRzA2eHhzYXI2WGorVzlUeGRsTVdU?=
 =?utf-8?B?MGUrM0xsbGZsRitaN3pQaFNXU0R2R1VuQ0FCdTY4RG5OM2dGUUM0ZTNZcHRa?=
 =?utf-8?B?V3ZLd0dyNmt5b1ZjaTA4U3VkbENha3dEcUVqVTJUNFhsa2NiRXNaUzkybGRi?=
 =?utf-8?B?U04xWjhLaWtIMm5LOU1FRlNuWUpRemlOZ1p5bkIxcG51ck5JaW9CamxHOHFC?=
 =?utf-8?B?bjR2UWRWUUFMNkEzN01EZ3F1ZWQrdUF6Q0hOcFA4YXI3Y21lR21yRnJDcjRC?=
 =?utf-8?B?STZzd1cwL3Q5T3daMDk3Z2RMZ0loZU9FNEQ1V2YyOHUwaXQrYW5sOHB3NHhn?=
 =?utf-8?B?YmRKWUx5Q2xrQ0U3RlRMN2tEcC95MHh4dm1ISGo1Y2tPeGRWSm4vUm1FclFr?=
 =?utf-8?B?c3B6RW1QbjZJckNITzdHdnQ5YjM5aDhzMW5UQUJ0UjhoY2lDaXdtVFhoZWJ5?=
 =?utf-8?B?K3ZLU1c2ek90R1JmMHk5NW5UbjlXUWtURTgxdWJJcFVwWGQ2M0kybTFrL1lE?=
 =?utf-8?B?MEVhOHo5NUc5aitpQ083Y1pVeExBaFdUZ0F4b0E0TEtUcTFORzl4NnZvSFVO?=
 =?utf-8?B?TTNGV3BsSGtxQkR0eU1ZYUEySnlMNk02OFlPQUt4QnRtQVVCNEY2QkEvd1hQ?=
 =?utf-8?B?am5VN1Z5UHE5SEtjZ3VmMWdyVExPNmFmaU1FMkVKbGphOS8zS2ZJYzZzQ1Vs?=
 =?utf-8?B?VzR2Q0ZCMTdRM0liVFl1YjhucUptWVFtZmpNaEduMjBhVjR6Mkc2NHBMVDFn?=
 =?utf-8?B?NUVpajdoY0M2MHhYVUkramZoK3dhNytZTWZ1eEVrcis2c3h4dHZCZGtXMWEr?=
 =?utf-8?B?Qlk2Wk1qUDFkMXg4QzlHYWt1WDRhbm9CR0RGeHlNb1dNRmtNUkJkb3dlVXVh?=
 =?utf-8?B?YjQ2UEZ2OU4yeGc4OExOdHZjV1M2akFoZ1BZb0krK0pTYWpRaXZzT1JnZ1Bk?=
 =?utf-8?B?MWJVaDJ0UnBUTVJyWUcyUCtDbEN6Smk5Q0VFVjNtQXhaNEpGaFRwempGRzUv?=
 =?utf-8?B?WEhjNUExY21aVjlkNlRndHRkaGxoeklHek1pV01CWHJVUlJSN1psQUMrdDJV?=
 =?utf-8?B?dEdIbURUSmZGNzBnbkwzVzFLbGs4Y3B0VWNrSVdzRHVHb3Y5cmtseVYzT0FQ?=
 =?utf-8?B?ZVJ5Y0pPQ0Q4WWdQRXhsbURjUGtSTWxWNUVnL1ZES0tuakU3SHh1SjlRcmFy?=
 =?utf-8?B?OVZRYkgrN0tESmJ4T1JYbXhjMEt2OVNhOFVCTDhpclBVYzVoQk5JNk83NEJC?=
 =?utf-8?B?SUo5Y1lOVXpuMXEzQzFrMmVRemV6Yi8rR0xwZ21xUzVyRGJUTmJONnpDOVFK?=
 =?utf-8?B?SFg4TXUvNTlHNUpyMitOenRWbnBDSXF1TWRyc0N0eURYWHhQSWszb3kvcEQ2?=
 =?utf-8?B?ak5acGlOak1LUkVUaTNEMG91a0ZybEZrQ1J1YXBpTnQ5c0hiUG9ZWHErNUVv?=
 =?utf-8?B?QUltZUcxUVpCNlFZVGlrOHo1UHJWdHhmK3V4MU9lbUx4emlXalMzSmVSM25I?=
 =?utf-8?B?aGhhZndYTGs2cFhyUmdwMjZNdUFwank1ajNROUNpczRvWUw1QjRDKzJXM1Zk?=
 =?utf-8?B?SlVaRENJbWdLVFh0SDIzNWh2ZEttV1FVVVFjY1dlMXhLdWRYckdycHYxNFla?=
 =?utf-8?B?Z1pvMS9IWndZbUtZNFZtMmFHOWZFc3c2UkpUVTRXc0ZZdDk5Y2VodmI0K1JD?=
 =?utf-8?B?SGhkYnMyOEFpSVI1RUdnTzVhaVVva1kvQWMwS3pXYUdWRVFHS1U4eVRiRCtC?=
 =?utf-8?B?QlN2VTNUcFJJcEhHMWkzR3RsWVJLZGJ1WFQxZEUra25lenNvQ0UxdGxheHZN?=
 =?utf-8?B?ZkhWT2p2MUR4ZElWQ1FweHNHQnYzbEpQSm01VkFYMU8rRlBlSFNoUmNIQzNl?=
 =?utf-8?B?bUhlZCthVTdVTGV2cFdpKzBYMUF2RitscnRSMkphbDNFeHhmVm1xdEtlLzN5?=
 =?utf-8?B?UXFKamxxOTd3ZEdNS3V2R21qSGhCeWhJek1zdktUaFByNGpJVlovcVpDMU1l?=
 =?utf-8?B?c3FQMnAzeGFqWk9wM3JaeHJ4Sk9sOVVlREppYUpmNm9pR1R4T3NuMHB2cFM2?=
 =?utf-8?B?dlNMQlNlQm9vR2RscXZLKzFuNllTbnp3MU1OOTdaVG00ajAvVjNOSWRPK1Y1?=
 =?utf-8?B?akYxanRZU2RsQWkwV2xBUzNCQ0RyMXNQODRhY1czNm1IOFMwVVBMTWlGWWlq?=
 =?utf-8?B?aEJWZC9ndWdvaEwySlZJVXBTN2IyNkEydmYvYmtYVWZUOEtZZW40YnJnc01s?=
 =?utf-8?B?RXRTYllYZmZiSElKblJsMFFRTHJjZ3FOMXVQYTNlL25yVGRteHRIWHJWb1dG?=
 =?utf-8?B?Zi9FaGdyeWxKZzBDVWVydWdVL25SOTBza281MlJ6QWQ5N3YvMFBrSGtCVW4x?=
 =?utf-8?Q?d2IZe+wesxkSo+6E=3D?=
X-Exchange-RoutingPolicyChecked: iNUT3sXVphHVjfsEpPY0pLTaUgRZZCg6+BEs9eAAcojnumeThdiZ/gG4JaPehmWvrCfVIYmQjS5SGupvq3oxVN1CeWdM6zFzntXf28S6XP2K4M8fXQKqukA5HrwZPzuzHRx58ZgHY3YufONtwN9G+bVKjDrvVfdW3B+72Ji6YmDzjiG7Hcf3+ASGYiKpsPF050MnmLXjh+HYGQcfm1a8JIDeDDS1Pg+hcEBeAogrCa3JIX0+5nu8ufs+THP25JOoiXiaKhLyEovc0M1jvKmV9VVaAFFtfHQfA3YgFGhvXUdYVuK363JXybkitgCMsuNf29MxWYZRdbUQx1wZWpxfag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c56e43-5f33-45b0-256c-08deab645619
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:40:56.5771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+XotmurLFR5x9dd6FZu3izvj8ZPyynYTYOMuQJ4FB+rb72azoal4Xh1C/C6i1IF3S1MkNzRVfPBgAHZA9eXJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
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


On 06-05-2026 02:34 pm, Pranay Samala wrote:
> Add missing trailing newline to igt_assert_f() error message.
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_atomic_transition.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 431508a83..58cadc560 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -439,7 +439,7 @@ static void setup_parms(data_t *data, igt_crtc_t *crtc,
>   		if (cursor_width == sprite_width &&
>   		    cursor_height == sprite_height) {
>   			igt_plane_t *removed_plane = NULL;
> -			igt_assert_f(n_planes >= 3, "No planes left to proceed with!");
> +			igt_assert_f(n_planes >= 3, "No planes left to proceed with!\n");
>   			if (n_overlays > 0) {
>   				uint32_t plane_to_remove = hars_petruska_f54_1_random_unsafe_max(n_overlays);
>   				removed_plane = &crtc->planes[overlays[plane_to_remove]];
