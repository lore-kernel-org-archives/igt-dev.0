Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A591CD98EE
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 09:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD8610EF12;
	Wed, 17 Jun 2026 09:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBtqQvQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F3010EF01
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 09:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781688323; x=1813224323;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DDniuPzbTSlvaw985I/TsdrNW2Cj2D28FiEOm/v1KXU=;
 b=KBtqQvQpalM3NfE8396s3iUIUXlVK6/u+LOkTPFXfdpRFsn/3Dm98b+K
 9Ox5bNoCYDgtL/hadTQW7mvJVs1ZEkFoZ/TQtc/s4D/mujP3JmAKjvCNf
 6yLyNRIb4mLiO19tEnPxGREskyMujHJzKdSAQh/qYygm2Dh5uPCuRcvRA
 73Cl6HIawTwAjUoc12+PbxqXxJ1M9w9MShyEBp4U6jVseLM7hM84Sx+g9
 Lv1ccmKp4FMbzt6WUNeCtDBN27V27Q8xHaHaqnme1zHukLOCKODntqEFe
 2cIF89NE/2y7CTOdSBssyhQASkLxvCVYe7AfilpVY0sekBYAadQSXqukV w==;
X-CSE-ConnectionGUID: Sg7FjlLFQ7KMwIFGPz6waA==
X-CSE-MsgGUID: PFpx3tK5TZSc3LI3kDliBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="70008930"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="70008930"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 02:25:23 -0700
X-CSE-ConnectionGUID: ZJdhUQKhQnq4VnXZ6S7veA==
X-CSE-MsgGUID: Wt9G82+gT2mtP68Qb+/Tog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="249920290"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 02:25:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 02:25:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 02:25:22 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 02:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sU6cNPGRnAtZPaddAWZUGQqAEPv24JgS2IgR3J+9yb/sDiII5qbN3SEliZgMppZslrkAShtag3sPFvB14/PdjGI8t5BSzxsKLw/c9V0u7cPRWiGfmSdVIwFiBSKOky+y5QEVmi7iPqDDg4ETjeKD5PJhbSeQc345os5xFZHoQ3dop2ie5gWcpxdL9lnAwZyUI8Pg7z0B0o7ns6jW++6wAhLNt78JcpLaHCB9SCAcRTxechUWM+pigrsLpXuQLMg4N8fgWaUC/xqO6EqUZlAPbRgrEOhlsyPvkHYzvxeKodaMxiE6tYpy6agaUMgFifn7uPjiunsOMFfI3eLcu4Ai9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/XY5eX/Lo/SRF7H1ywuLUX1oGmZj7AoNazinE6yUqM=;
 b=O/Fi1FSDdCicgOqZDYaLZzotoYcpORgIbfajiVBPS+ujv0laoN8FzKAZwb8GA6NPrB1Mifre6E/Ufvk/kamqU6qxyhebhzWPrKNONv/u3LDXDJ+3vqsLyYoo8B8Kef4HOq0bCByJaWBc0NH61ULE868n9jMd1GxPCdp/oHQl4PyfwUZbWuR42meQrX7+7cm+3EEA9bEvbPqLETmeEkOqJtt8Ot06ZrbKLrcrQH6ecy5RbGlKfCfvijmxCJWojRZNQvxS7PeWZl5o1XFEGy+JbljWv4j9TqT5neDv18nREQ0NqGMb5Xvy6/Uvn3DWkwuObzszmOSlIlvx8QEEFxat8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 09:25:20 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 09:25:20 +0000
Message-ID: <db8f6a58-f56a-4220-9599-599d24de133a@intel.com>
Date: Wed, 17 Jun 2026 14:55:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_content_protection: remove unused
 max_pipe
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260616090610.2106378-1-jani.nikula@intel.com>
 <20260616090610.2106378-3-jani.nikula@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260616090610.2106378-3-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV1PR11MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b3abda-d09f-42cf-7c92-08decc525997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|23010399003|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info: PW6tJJGwkB67wse4JQfpuHKTzDLQS6NlVwwKFMvvaGyB9iWRxNJYkeVAAtyctg9tkkublGq8YJP9MW9bZoAGyr+nkFlODdR0bPkYyW6JnKj9s/fv/0q22UaGnof8yTyDOXjazXzeD/TEmiTIF9uu3+Q5dZAdL8IojZkVmfU32KEBP9erxLSlhmggEt0yefZvwDl3UwTu/S1b5wfUz+SYeSg81nT17Ynb1iTClbZQqq8sH0wa8hpY5S15w+Cybw8b0vT3aheSaj873fZ3+kkNYU42EKxEYBLBQHqrIqE5xBtVee7daLp28tmET9icobc0yl2hEbR59KVoejtrWIrBbbdL0gvt5CI2G1YULeUFUmOuA8Zf8C6bDbS+xPBhwp/szEcnyAH3H+EcCAC1nlxsmff8KPJ4DpZ+CYoSWM8kuS88NfbrtGixsCT0yCRAgOYszlPBiY42FddS0tYdxWYW3NsA3emjfwP9VoF9U5oIL/aRpxnRtSdAylDLqPXKnI5M6t1b/ymBzxlOOD3gZh97hhnSTrvdguZBN8f2F2dPzbu9OyCVr73rOMSHHu3hRmSd51IxriATu/Z9Y7PrwXPZY/0SILL4mF0BuG6OVycvOXoc1RIQbf25+E56x1ydqj5LyOaDC6JYnWIXhNqat3ieKZhj5yjnKt30r32sDFffX/DVGp+yeAnmDv+dqIYxQmSH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(5023799004)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUNEOTBvM25yQWJQcGZIZ2prMlBuWlFjdURVb25xVkE0L3JLNlJDQlJlV3ha?=
 =?utf-8?B?QmZJSVVhSlcrYjJTMitKN2VManE5ekRyemRWQTJ1QmQxWFYrWjBaTGJSYktH?=
 =?utf-8?B?QnV3dUVhZllvbEd2d0M0QWp5cUNkdVN4d3J3SlVXU1I5UXRocmhHUTZUc2pw?=
 =?utf-8?B?TzlRM0FEalV3RFpCanQ3dWEzU05MODBDMW94V1gvK3BaVllmRjNRWW02Nkkv?=
 =?utf-8?B?U1RPaFNuOCtGUWZzYVowcC8wYjZ2SS9RbEhHdDVJbDNqZ2xCREJLemZFZTZM?=
 =?utf-8?B?SzU0WDlZVHFHQWs0aHVxanVYUVdFSTJ6VmJocGhPREkwSTVBWUJzVGdXcW4z?=
 =?utf-8?B?SHU0cHV6dEhPTkdLaGUyTU1laTcyKzRtS2t0dTRlclZxRlRRNkRMamRGSWNx?=
 =?utf-8?B?RFVzbVVFTWE0b0NVb0RYMGRiUThlU0kvR3krV1FhRW9yVUdlYnBGV3lSdDBt?=
 =?utf-8?B?N2o2N2ZURWljMk9aakxSWEFoVDNhdmQ3MVVkajAvalUwTUYvT1M1eVhhZk90?=
 =?utf-8?B?UmZoQ3NUMGN4UEtZSmNqWElqc09YQ2drYkVnQVZkaUsrU0dnemwrVVZVUms4?=
 =?utf-8?B?cGpGNHQzbVA1aFp0Tm8rMUczRnpZNExVRTdVNStncTlyQi9MWFYwYXl5aTVz?=
 =?utf-8?B?aGp3YkJHemh4dGJvUTdFWDlYcHFYRU1yZlVqTFZ6bHQxVmoyNUw1L2xuWEo0?=
 =?utf-8?B?cEhGUmtZbkxBY1VlcWJIRzAxLzFDY291bTc5UHpSZmpqditPU2J6VG9kcEc2?=
 =?utf-8?B?OEplU0hCeHp0bjFTdHNkdTJuMzhnZ3Mra01odW1GdzloRFZPc0h4OHhvZTNS?=
 =?utf-8?B?bGFnYStHTGIrNG9lZnRqSm1zdC9mN2lUZDRGRWJkQUZ0SnlpZ0ptLzIzOXQ3?=
 =?utf-8?B?VnhLNzMrZGlEMDg2N3o5ME82dllmRDdBZ1JBKzBpeW1UYUZ1SExxNWhubnNh?=
 =?utf-8?B?UGJSN2JMQUlXRmRZM2hGcmplUktRbXJBeW9vQ2lJa0hVWCtvMWJTaHNEVGo2?=
 =?utf-8?B?Rm4yTmxocERrNVNlOEYvcGVseXRyMkxKd2l4dnhTbVpRTndiaDBnWjBGZWQw?=
 =?utf-8?B?MjZOdlZiVTdBQXlydXdOSURkNkdnZlFnNzdXR2pVblNXcmZqNlN1RURpSTRt?=
 =?utf-8?B?enh6Tis1OWtCa1VpVXVKaFRFTkRDWlExOUdTd2tGanBGNjN5M1IrVEFZQTVx?=
 =?utf-8?B?dXR6UlM5THU2QkZ0UE5OZmpZR245UVAydFlzRVRjRVA1NFdMTVpGdEtmK0gz?=
 =?utf-8?B?UGZraGVXQW15WVcrV2dPUWYyekllVTlIZm9pMTVTY3BjWG5uYmNOT0YzU29M?=
 =?utf-8?B?R2ZoZGFYUXQ0ajlUY1pVUXdzNkZSUkpnMjREcWViMXdMdk01OVZGcGlTbDZm?=
 =?utf-8?B?V2xNRWt6WXpYK0dXTW9MN1hrOE9uaDZub2VMWnJMTkdRT0gzZkhNNk5QTGpK?=
 =?utf-8?B?bExwOTQ5ZndSNEJ5cHUxWUQvK2tRSStnMncwVlR0aXhobDhiSWErOW9nbFlH?=
 =?utf-8?B?ZzVENndKTWk4M0xQMkdWclhWc24zRmdRK0ZsbDVTc2pNVnU1VjA0aUovdVdV?=
 =?utf-8?B?NjBXNkNnNGg5RHBkTFpBUjNPdWZZR1VaVWI4UVNETDZPbHdMSnFYYXB1TXJu?=
 =?utf-8?B?REt4QmQ2RTBqWTRKRTJET1dwdXoxUG11bEpZRzI2cmFoOWQ4OEpDY0VrbXdK?=
 =?utf-8?B?K1VxWlpPSVFhbGFBV1dNaHVNb3VQNUhmT2J5eUV6OFhMbm51SHExeWJPRmlh?=
 =?utf-8?B?V1F6RnplRVpnaUk4MEhoazVsc0JOYXRMQWM4dklUbkx6YTAxdmtBWlYrYjVI?=
 =?utf-8?B?Z251Tm12OFZxSS9XTXJjNGVoMEVSL0FZUy9TYUpLai9yWEVST21rWVJWYk9V?=
 =?utf-8?B?Z0M4MUM3TVFZdXV5bm9lbmJIRWR2QXFvbFMvOUhmeHR3UGV5TDJ0dEphWW5N?=
 =?utf-8?B?WlJDNmt2RWdRaW5LYklhQXYrNlFzRUFGSUNtZnByNE55M05YSGMvOUFxbEdK?=
 =?utf-8?B?K0NKZmhPS2Vlc0ZpRC8zYk83aHVwenoyMDkrMFFRUnJySk9YclNlZWJhMTQ1?=
 =?utf-8?B?V2E2d2JWMDlyZW8zclhmRmpyanJiZVFmRkZ1V0ZLNi93djJZT2pickJxRE1X?=
 =?utf-8?B?MC9la3RBNWxnUFZXT2x5cWdrd0d2dXN1NkllSlBJbVlXbzRRbVJtYUFKRll2?=
 =?utf-8?B?dEg1ZUU4TzRwQVoxV3VVcWlYbzdHNDVzeUtqTlFiekZnVUhmVElIZ0JmNzZq?=
 =?utf-8?B?MWVFL01sRkU0aWlEZkN2UUtFZ0Z6SHQrT21tRSsyYXZ6ZHYxZUJYN3BRdUVE?=
 =?utf-8?B?amRrU0NMVlNhcXJ1a1R3akQyUlVNQ1pMOWV2WG9Ta0taZGNmTTM1QT09?=
X-Exchange-RoutingPolicyChecked: rlh1tVTDTdQ9JXyQ3iPebpdreZqfY8pZtJvs1EaTuj14BhN9LTB61AH5+5mn6fJzzwi/f7wXWUcoZkWtjoyAqHyERcE2y9ANMsmtVOkRtWypxV5zNvkfCiNO4ShbslquAFjK1tP8LWeODsjtTAkP16RP2NMqmDFu90yqXD5NvLQwqEAaQ/NGUU6kS6uTRIrB43PtG8FpkEoA+e7rPXO5aPwcmdx/wBD7KCtvhPMm+hz7HCl1/nG2i0YPU5vcAj/BpE/zyQMnCat8JFaigN0J3dmjTrIVbA4HNfzgtCxGMzmQnnept+X9Hu38BLtF7LRTMDB17qwjht0R/ur+lndIlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b3abda-d09f-42cf-7c92-08decc525997
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 09:25:20.0909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+49/nRz2HhpeejvPfOJOIPt2k4iSUbBcGozUqmUUKlerOeTBGxGxdcnM42KpvV+tTWFYfACpgqDqJojJyJD+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
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


On 6/16/2026 2:36 PM, Jani Nikula wrote:
> The test is counting the number of CRTCs (which is nowadays available
> direcly with igt_display_n_crtcs()) but it's also not using the result
> for anything. Remove unused max_pipe.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_content_protection.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index d1b7c5863255..d931ce7682be 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -917,14 +917,11 @@ test_content_protection_mst(int content_type)
>   {
>   	igt_display_t *display = &data.display;
>   	igt_output_t *output;
> -	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
> +	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, i;
>   	igt_crtc_t *crtc;
>   	bool pipe_found;
>   	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
>   
> -	for_each_crtc(display, crtc)
> -		max_pipe++;
> -
>   	for_each_connected_output(display, output) {
>   		if (!output_is_dp_mst(output, dp_mst_outputs))
>   			continue;
