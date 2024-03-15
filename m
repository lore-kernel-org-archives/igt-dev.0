Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FED2C54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 04:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAED10E8D7;
	Fri, 15 Mar 2024 04:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQMuUuCl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B2F10E992
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 04:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710475863; x=1742011863;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YH8qgwFTywgDxpDE4ZTE3+xt7b6eLPqgaqhBYKvNTXA=;
 b=WQMuUuClPSAPg79ePisgxAhGdXTKPxY+ZJx4P487Ud5eUbFkVHT201n+
 HynP3Ptg/B19U8yoeB49ZhwMrr71yaRaannhBjn45TJsFWEub9d4TZbXX
 uQ8tkwDMGJT5I16ZyTYpbmQIX7AbcfTzZjVU4S/+g3dzWXPVVv7zSDHEp
 YnzAnnw3o3xQu12xLENwKthaMluIFzNnZOuYb1i/DOBd3Vu64A7uMjrby
 2okirhcQL/OpiJry24wp0yv0BJSOAmnlC6mwkFh9H9PGE4bbeF7SrY53o
 ROyLDioZ/r5ru6FS+nMcnqcTJWjlmW0AXhV/HRhXVrUSyLQ65k/1fzynv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="8267129"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="8267129"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 21:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="43432094"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 21:10:59 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 21:10:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 21:10:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 21:10:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNBbRTt/+IDzHnSA+tO62yOjEAcuU4lmfjH+KBxDsXGuXtR+uH/WLj04OKYiUWknW6i8Esm3XJ59KKwHMX8SanZbhDmPl58micdpq2M9C06a3ZA6DkH0yAuDt0Xb8bH7APPZs5dJ5V4g50vmN9rWL60x2pWa2aQWmRQpmjE7fKBmUbeKLeyD9ybO34RQxOaWFLCtRk16oabAFPe632x1CW/IgVYe0Pc1CVZ2cK84NML5F1Rynsx/s0q1vrwf8Gy4x1dl0flQUPfaMfiRf3XsAtbL9J/Qzxoz+0i9/C6yze2qwyxftcRIu4wzTnxERgXrXDmMk0wtbKrb9yuHakLrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWLdd67iOJJeYIjz0iB/5AmMQGRLy4Oos2AFZJME1aU=;
 b=m5WfkoCLxiDy6VP/hS42tK8IHantmMCGDTMdtMIGEuqSd7YmdfJUk/L06CMVQMyhLyugJ/k0j347dKi5JdV3aisWeo8MBdv9yf2n9vdDPUMOtkOxcq4LLwgxNv0qkloWrR/imERCxfPBO1J4qsFWlWMVSi9oBdvkBX2lgtgUfR23DBUDQSI/xcPe+hQy27GlO+g5HCMffpk8O/oLLd5TlgAgCVZjmI0SynJv33wj3otBQs1C9QjmYA0YnXSkPposMbjwjZvwvAup2TxShoqG/40VrCjtPXE6KcTckRiryoLa7LqF235FPoARcO+ekan90uKweLjfR7Ejh2Ufeqt9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 04:10:57 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 04:10:57 +0000
Message-ID: <0507ad7b-4f1f-4c66-9109-5d6903f93634@intel.com>
Date: Fri, 15 Mar 2024 09:40:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/igt_kms: move bigjoiner_mode_found to lib
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
 <20240310142721.874315-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240310142721.874315-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 849d3efb-a472-46ad-739b-08dc44a5ea1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1zqxYMaony41YZ1w4WfWoEQuOKaEbeMbwBvuDk2qcmPkOGjzkuFQqdR/Pa5MR0QIE3HgKm+70SE/HdnvMlfjF0sKhXOYFn2YQ1KuDPS/AKZlvBhQGte+ad4v6ASSaxPS5MA5wi4cKpovjVyXCDIPZLzhCUJndrrKXl6NCgAx+XZfK7qzc+iIpVduiK3FtReNDboD5DxwPblsp4BFtIh6R+O2OuCsjeNKLx0/ndel4cgVU+PQ2IzCw0cwasFYurhoTrv5278ehq90o9CEUn9rH/GMf6Cy6tKVnciEmU4A5WM7EFRF3RXXeFaGgjPDHrPpVAU40PP5Ac+KAwc8kPUmkMUL0g11XcZRkSFvuAxaSFlDYMI48Sr6fjHGZ8zlSqV3IkRLoiMmWUKUJdZzh5Lc8djJfIiYwbLlm8v2li4M75EdGwGPVd2KuH49uPrGoHx+u9NWemsJOIBri9yXf/ZedawAZ6riPvnVT7MTMCDS2X22gwcvYVZ3XhFaqLdcaVt7RONHR+k2Jzd6JrKLX0UIXZsKTY57Q7mfLZcSOTC2n3UAGJXPEoeuDIOrNhb8N3mtlbNJzf8VpZ/xougt9EjUdqx6wMRj3Q+jdT8hiDZhWfisYQm17veNTAx9JaM23cpk7g4Z3qNtcAvEUlBZImSScczzBWZLwGKo75MP9305NZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjJVRkxrVmtDeFY2enNqUHA2VjZ2VDdTSk0wYUNBcDVGK2Jvb3F4TXJWdUhN?=
 =?utf-8?B?R2VtNHlVcWJybEF5UHlVbmFJUm5zMURoKzZ0NE5LK0sycloyeE1DN2hEd2ht?=
 =?utf-8?B?MXVGcUFqVFpwblNmSzBydmI2TU5HcXZMTzV2VHJJNXprWWE3TDl1TXdvbDRO?=
 =?utf-8?B?Y1QvbGphV0kycUlJazNVWG81bUZGRDJEU3VTVzZPRzFNeHN5L3VDNXc1akNz?=
 =?utf-8?B?cWhBcWhmQnhWOGFjM2c0Tjc3NVFFRjFMKzkyZDFkSW9adVFHa2ZWeU5oZUZE?=
 =?utf-8?B?MzQvRVU0a3lza21aY2RJSnE1MW5XS29rRTRGeXp4U0wwRCt1YVZNSXFGaHNu?=
 =?utf-8?B?SndTejl6ZUNyS08wQ2tCZWIwS3RDQnhrd21oQU15R0VUcXdNdFhFdlUwT0dx?=
 =?utf-8?B?UWRBYnNxUC9adkNMUU5Qais1L0RXMHVQOTFobkZQb0xtQUYxQ3JoeHZkbHhk?=
 =?utf-8?B?bExFRHU5Z1BPN0VGQUY2WmZxWUpWNmQ5OGFKREg3dSs1OTNzZzlTL2d6eEJz?=
 =?utf-8?B?emU0NXJyUGNUbi9JaWJrY3dnTEJjOWlsVG9LMVVtMkN2MVlwOVVzejcxMWkz?=
 =?utf-8?B?a0t5T1pqeVRod0pRb29UQ2RsK2laZTZIYSttc09uL1ZkVDdlZFpDOFNrQU5B?=
 =?utf-8?B?aVNRSHFPUUxzQmlmdHh0MmR6TUxMK3hYMUpTaUZxY2tEUXBXYjM1RWc5dnRs?=
 =?utf-8?B?Smc5RGxzWm5kbWpuQ0hvTWFMbTNvcXVHYUhHNFBRZnFCcVplSFAyM0loZkRS?=
 =?utf-8?B?V3QzZ1BsT0czWFZlM0J2L1I3NlJHTTJ1MEJsS0tRem1Ka3A2YkdydmlYV3JW?=
 =?utf-8?B?emozbzlXNFhpM0hvQVV0ck5uS3hVeWozOE9na2UxL0RaSllaaTJxWm1YY1BB?=
 =?utf-8?B?SURpQjBCVlFIcWNRbkxkNlBvcXBRdEM2enBTaUw0ZUdmVXlERENMa1BDZGQ1?=
 =?utf-8?B?WUM5MXJnQ2cxZWFhbmlVNVZZenJyZm91c2VxTzBhVjFxL2lVTDNMUXA1aUhP?=
 =?utf-8?B?cWI1R1UrNDY2RUVQUWc3cTN1cHdpa1U2UFlBcUdab3hwUzNSU0tIN25HUzNw?=
 =?utf-8?B?WC9qNm4vMEQxMGQ3Tk5mTHFDR056c1RnZlBiaWhLNW9Hb3Z5TGE3QXpJSzFY?=
 =?utf-8?B?MnRWTWRJMVFkTTZyaS9sNHhjK3FnK3pFakd0akVQYWtlaS96aCt6b3JPY2pL?=
 =?utf-8?B?TDRCc1NmbFlna0w0byttL0U0NWN3N05ETnA3SGtQMUlCWEhWQWhtWlhteUk0?=
 =?utf-8?B?dEhuYXZ5R3l6VTRQM2xhSEdXcEU0L1ZscDJpVmxYVVFrWkJzTW1IeHgwRXdl?=
 =?utf-8?B?Y2xVTmJDVEtSb2QwNGFLK09GOFZOQytFMUlKNE1yTVJCRzZpanJyVFBLc3pw?=
 =?utf-8?B?RFlaU20vK0t2S0o3SGtOekpqaThyM2lEczV1WTFySFJNa3l4TTVxNStTbmpi?=
 =?utf-8?B?d1N3d3ZyaitRam1hT1BrenlhUHdzZDBZN0k3ZFhDaFhNM09seVRhTm5oeU9P?=
 =?utf-8?B?SFBlNWRKMWpwZE4vaXNEWE1VbWV6ODc1M2t5WTVGenFmcUZoTEVERUQ2SHFY?=
 =?utf-8?B?b3Yya1BwNmVDdjBLU1A5eHFLcjlVNzhOSmZOM2xEQVBwNVo3enlQbWFMc2E5?=
 =?utf-8?B?WWZVeTZ5TzhvbjZSQnRRbWF5cC9tdXN4UDEyRjg1WW5oOUNKQk1oWWZ4VXRD?=
 =?utf-8?B?OTR2Z2hPVzRRRXZKc0pJZndoVmtUN2Zpdm1SYmlNMzh3WlBsTkdTbWNZNzJH?=
 =?utf-8?B?ZnpiWGIyUEdlNEx5S0ZrSld5WkZrSEVuMXgyS3NPczQ3ZXNUcmFxcE5hYkd1?=
 =?utf-8?B?Ujh3Z2FLWDdycTZtUUM4dzdzdXgxWEpVdnRpMXVPR2lEU3dwcm04V3Azd3hW?=
 =?utf-8?B?MkN0MDRKNStPWmF3a3J4c215SWdFVVFFblVGeGd2SDRsMHBXeEZwbGlQT0o3?=
 =?utf-8?B?cGNnaHRQNmhyUFFwZzVZbWh3QVRlOXlURGtJY1NYbE9UTnV5WFc3b0NxUnZo?=
 =?utf-8?B?eThqcUovWm1wNkJiZTdMNGxSVjN0aHlOOUl0TWFLNktieXVPR3FSdDJDZWI4?=
 =?utf-8?B?MFlPcFpzazFXaUpYeDlzVXI3QUVvWERrQ0RSU2puajBLNkQvZk82bnpTRDFi?=
 =?utf-8?B?Y3ZjazFiOGFXNTc3eWxJaVRzcnZzUkdHSXN4QWx5N0p0ckZZTDBHYjRocTM0?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 849d3efb-a472-46ad-739b-08dc44a5ea1e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 04:10:57.1472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsTqIW8tVg2AhHhC/7y4nRRXueCGrkVtzi7+TUGG1h1K5zNkk7cpc101F3LZHKsuinVdrJ0ndIihqymr4O3MdcCD9i9VsjG8Skp9HMIuads=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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


On 3/10/2024 7:57 PM, Kunal Joshi wrote:
> move bigjoiner_mode_found to lib
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c                | 25 +++++++++++++++++++++++++
>   lib/igt_kms.h                |  2 ++
>   tests/intel/kms_big_joiner.c | 14 +-------------
>   3 files changed, 28 insertions(+), 13 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e18f6fe59..63c8045c7 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6143,6 +6143,31 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>   		mode->clock > max_dotclock);
>   }
>   
> +/**
> + * bigjoiner_mode_found:
> + * @connector: libdrm connector
> + * @sort_method: comparator method
> + * @mode: libdrm mode
> + *

This is incorrect.


> + * Bigjoiner will come in to the picture when the
> + * resolution > 5K or clock > max-dot-clock.
> + *
> + * Returns: True if big joiner found in connector modes
> + */
> +bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			  int max_dotclock)
> +{
> +	bool found = false;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +	if (!found) {
> +		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> +		found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +	}
> +	return found;
> +}
> +
>   /**
>    * igt_check_bigjoiner_support:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b3882808b..bab8487d3 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1212,6 +1212,8 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			  int max_dotclock);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool intel_pipe_output_combo_valid(igt_display_t *display);
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index aba2adfbe..28678b958 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -199,16 +199,6 @@ static void test_dual_display(data_t *data)
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
> -static bool bigjoiner_mode_found(drmModeConnector *connector,
> -				 int (*sort_method)(const void *, const void*),
> -				 drmModeModeInfo *mode)
> -{
> -	igt_sort_connector_modes(connector, sort_method);
> -	*mode = connector->modes[0];
> -
> -	return igt_bigjoiner_possible(mode, max_dotclock);
> -}
> -
>   igt_main
>   {
>   	data_t data;
> @@ -235,9 +225,7 @@ igt_main
>   			 * Bigjoiner will come in to the picture when the
>   			 * resolution > 5K or clock > max-dot-clock.
>   			 */
> -			found = (bigjoiner_mode_found(connector, sort_drm_modes_by_res_dsc, &mode) ||
> -				 bigjoiner_mode_found(connector, sort_drm_modes_by_clk_dsc, &mode)) ?
> -					true : false;
> +			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);


How does this work? Earlier mode was filled by the bigjoiner_mode_found().

Now mode is not getting filled at all.

Regards,

Ankit

>   
>   			if (found) {
>   				data.output[count].output_id = output->id;
