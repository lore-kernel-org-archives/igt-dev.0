Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93A3FEC11B
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 10:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E06610E1B4;
	Wed, 25 Mar 2026 10:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhycsqJB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE10B10E1B4
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774434978; x=1805970978;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Q8Kzl4tCFNle0eUzAOSIPPr5MukGJCrNr//0gHHv/Bo=;
 b=DhycsqJBIP4PFYzBOhNPXSvq4ZpWfTnC7yM6KbZZrn2DtRso5aoXMh7x
 3gDjqbFPMPOnzVT7p0Nu2+dK7+220VMuLqB1FMrjc8qlghidhxomYfQOr
 OD5iiAk0k6O1uTTy5GJFXmWRxEi3hMp1aTId1Rbp75M6ALOnKTafhE2yq
 PJQTHvEKxLOtRzxcZInoF2UF2uCxXGkiyqwCxVN8WJcEA8Bg3vOqFG95b
 dbi4EuA6jK+QTOK8vBzAMYB3aTh0Ism4nvkkBra4qdN+h2YSqKyF7JbFc
 m5Pzzvj3I+P8Q4nbd8YmT2S05raWsGtehkEALEfcgs5ypSbayh2tuJtGD Q==;
X-CSE-ConnectionGUID: dUY9iZ+VSv+qAGaJB1WfnQ==
X-CSE-MsgGUID: xk3NUunaSeOw0q6cZIbJuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75356251"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="75356251"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 03:36:18 -0700
X-CSE-ConnectionGUID: moviCn8HTm6IjtuPwwbEUA==
X-CSE-MsgGUID: 03rOrWsZTUa8wA1+tGu33w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="223714355"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 03:36:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 03:36:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 03:36:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 03:36:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQ1YoAyn/m+MytTy0O9dQci4BVV6mbmjL6nFNRPy/21IXmb8QzKCqgG3J6PqqdNrENfscFVFvz9qMYijG7fiRFFEpgBi2t3et4wPYDrZJdy/uHyhIYsmHYhU280FbpD8MYY/5NTG1gZGQtf8M6hrpwvw9k+EvZRacZC//1ZUGKQByF+WBQQKZpVq/MtJPMdrxMPhCAqAnABVSLS3dE+prUyoXcmCwaNTrouzhbo2R30Fj5xNOumUMBqw0C5YRgUD+cl36fugth6QfkRcVH/Md7Zrq1LFxriECcBMYEqv+8qZdt/LtBJ7M7SoZjb+SPlW9QdugWm25W+VqQYaTvy3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=on+sUWnobrU1D9AN1Z5HBwrb0gPrgfnDRiGeNjEp5b0=;
 b=ZjVBSAfVN903YgRfaCWBZ847dnDQNMNZHpOXaJLCypjB+tH2/BWXn75ekZK+sPPDgBZzZJIhTyKXdHqkhiTWh83bjxk5stHfQvPznBeH4pIvf/X5u8CKlUqqCcgGeQVH1+PWfErE/Lc4pih3jjWcaFZLSc85Eb+tuTsn2pcR8Ng6uVYERRHFJrqk+KKZeUESyBfpBodENVKgZqg0japd79hDxfOpyWovZo/Z3ysT9DnT5XzNZ9IzpIKXWF0PTsQCgWXnVDVe5ryT0CEzcCRC1ZlKdqBN0iITevjaBvbVvVZ9Bb8XgDT4/Wkm7LCbWnrxnYtcZi7CiZxKtlvm+aaaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB7245.namprd11.prod.outlook.com (2603:10b6:208:42f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:36:15 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 10:36:14 +0000
Message-ID: <b6ae2e35-b7c9-47f8-a105-c728ca6e7f55@intel.com>
Date: Wed, 25 Mar 2026 16:06:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_explicit_fence: Separate feature tag
 block from test description
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260325083947.765016-1-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260325083947.765016-1-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: e98ba0b1-eb37-4955-8d11-08de8a5a56e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: CEVQA4Ff/5lv1UmMrqe8ZJ0zCqKmov48rEoFRYWYeENr2rK9EcVhUxBBOIdiPXgJV3FPaMKFABJJatvySYoIkiTIMzZbtw8wM9mUIER8wZ1NRdqW6S0oeW71Wf6cyb8jiuKuO/zv9GPvlm7puvBLs1a1GrNaMr68OHfWlhjpCwGZqU/8r0EVEgiwAyN2N14WrSYphTacwMq1KJ/zkenXLGJPq89RNPCYn4idbBA8BH0X1+jQXz7hNGY4wOJGYa9VBcZTtcE2IGon/UYBvRdxN9sp4k8JyExmKxUKCZIPoMISYfZvaZ2AGz0Cte5xwppGen2l96Fdor+eUAeAxrcNTvO5dXxeES9C2xRW4ggUf+Y3ApYtEBjWW+hbYnRQm6NcdjmExs1JysBfPHr0XcLShcJkMIFbkxjOnkigcsFWWkB64zU8+1VpHQc2yHWnNqzIuFZqxM0oNmZPIcLFLjLGUYmA8KDmfnSgaci1CPV6incX+nJebhUYBOPTrtz9zX/NWBILiPPgGFlqhLPtprpdDHKx1p53uvsl8h+RPx1QcECJQ8GbDgzjXxoYmdWq+MQUAuZ57mrLQrZkKXUWRayfJG0ypdeQpxUbpP8UsVoS26Ook4XOa665SUNXI/RWHNs/XfM5rzqpVHHDxsWi9HYg2Ayb2eMn3p4GBM8izOir9kQoyKEZauwxZwfymkEKLjRXkm7GG0Vm+F3qVNtN1w/Oamc/zFGWnKfzqQLJ1w5lfNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzBVcGM5WTF2MklSVlRzSkhKSEdyZ3pwNnhWb3BYMFJmOGlyR2FyMlVaVjQ0?=
 =?utf-8?B?bGdZK25hTzlnUU1ycDFYWG16ZXJnMFVwZGcvWnVQM1kxUzQ0WHlCeUMzYjVn?=
 =?utf-8?B?U2E0T2NDSkpBY0NoM2VIc1FQL01XV2tQUHRhYlFIcUlPajRpQUlZRE44bktn?=
 =?utf-8?B?bVgwN2lPVDlBSlhtYnNNb0twT29ZQjlTaXNQRmMzVkpZZU5pVjVTNDliRmV5?=
 =?utf-8?B?SEU4S2UvUWQ1RG1OYUUzcGR1clM0Mi9ZN0FyV3RXemFYQlFvMUVML1NNLzdj?=
 =?utf-8?B?WFFYUC9odys4aGNFRm1UNmVVUTJPV1hsOUVrS2oxbmIwWVZEUXF3ZVBXZjJZ?=
 =?utf-8?B?d1dKOGtsZ295UkhhNk1BdDJTcjVBQVpxRnEzbHRuUXFXc1VSZjE3Vzd6b0p5?=
 =?utf-8?B?c3N6MmxZZVRScWNtUW1NeEhIZlg0ZEJiN2RlajNHMzNtOFFjZU1Vem94bTQv?=
 =?utf-8?B?RUpycGxYSFFqZ0tnaFJCSnVPMWduSFowR3RsUkNEa2RwY1dxQ2tsdWRjMUNq?=
 =?utf-8?B?WmNFN09DbzRwSjNzRXQ4NnBvTnFIWFRsbEdrbDhKQjJ4YVJ4aS8zMkxxRHdx?=
 =?utf-8?B?MnY3MjRCWXdueFpzaDZnMC93SUN2Qkt4aUExYUk2OXlvVWpxNndoakczNzkv?=
 =?utf-8?B?SFZPLzkvdkZQK1VvbzNyZkhQZGtIeHVYSXFHRXI0SzY5UG5lTVdyYkVtbVJr?=
 =?utf-8?B?Z25QTWZwNW4rZTVwWDNmOWhSLzVNNGx1L05YanhGQ2txYng2dWViVTcrUWQy?=
 =?utf-8?B?ZWJ5aGJiTnUzdm9saDRyb2pnWEtTbXU3czQzTWpoanBEN2tGeXNkMWlDeWha?=
 =?utf-8?B?VFpJMXBYSWsvRWk0dFRtekVNV2ZybDFDTWExeEZXR1YwejlZUGI5eDJLMnhZ?=
 =?utf-8?B?ZnBSV0xId01EOTJ3QjlLemZaWHE3eXNDZmJwUFkreWtzU2dqQkYrVXIvRS9a?=
 =?utf-8?B?V3NnVGMwTW9FMGF1M2hhZUpRa0FjWFkzUlRjK1JGeDMrTmpzcllKblBuU0l3?=
 =?utf-8?B?amNPS0ZQejVOT001cGhLd0ZnTTF2RlJDcU10SWFNOUNVckxVU0tKMEJMMjVt?=
 =?utf-8?B?b3BKTnVWdTFpd2R2L25tWWRISEF2RE8vYmhkYURzaTN4V2daZEZLKzJ6dFdG?=
 =?utf-8?B?WXBwY3dNeE93VTBJL0JDZTFBREJZUGxjelBGWkMyYm96T3NSVUpvZE8wVnNm?=
 =?utf-8?B?VnJqZEZkVFFlYitVV3lBYUhDSGlDWUlYUW55R05XSDF4WHUzNmZ2UGR6UXZq?=
 =?utf-8?B?ZXloWm40ZTBhczVjVEwzaHFVV2ZGcjMrcFA0YTJSeWg5N3dFMmJzVmZSUS81?=
 =?utf-8?B?SzZ1UjBMRU1BdXZRR1M2b1d3Y2RPbG1CaHBuZ3dTNHJrYlQwOWh0M3UwbGt0?=
 =?utf-8?B?QnB4M2Y4SzhKUUFDMGtaTkxxRnp1OGc5eU81RWpsbDJQZFRWZjRZemhGd2gv?=
 =?utf-8?B?NVZMbmhuV05GMlFJRFJlNHhDajFsWmRMNi9lWEs3byttd1JNT0d6bnRiZWtY?=
 =?utf-8?B?SHgxOVZvV1ZSRXpUNlJpRitXNDdlV1dHY0xRUUpaUERhUSt0VmdqVWY3cktn?=
 =?utf-8?B?cGxqOU1oVFV0dVdUVDM2eHRLcWJ2cG5qSDhkRi9IbzFLUkI1T0pudEFEKytz?=
 =?utf-8?B?MFpNUE5ySXhwZThNUGpjVVVGZ08zWTV1S1FvS1BybXd0S2RhNWV0RVNBbjYz?=
 =?utf-8?B?dWR1ZUNjSmlDNG1aczF0M3pnMm5nSnBTNWROWFRKb3d6TFF3UXU0emRoNzRB?=
 =?utf-8?B?Z1lFaWtsQnZXQ1g3Z2xYLzB5MTZsNWZnK2pGSjFzbXI2L1ZXeFgwWllBaXJL?=
 =?utf-8?B?VTlzTWxsVlZJSVgreFR3T2dUNHkvMHU2Ri8vYVBQZ2FGcGxBcDR0RUhqZitE?=
 =?utf-8?B?TWJGTjJ0QmE2anRCTVJUMWhEUWQrd3ZzQ3VJbk1VSkg3T1I2blhDcWl5Uk10?=
 =?utf-8?B?Njk4ZFNvTzIrUitrMDFaYzZzWTdOZUhjb0lZWVBHQ1JBUlA0T25OSzFyVnBK?=
 =?utf-8?B?b2JIWDZMNk9wSTZJOEVVVXRFRVNxTk9zYnRzRjYrZkxVWTc2OGZlRmpVVDFa?=
 =?utf-8?B?RFZvcjBlREVKaFhhRGlJUHE4THczeXQwQnVLeTVrOUdHd2Jrd3JYbFdXQXpG?=
 =?utf-8?B?R0h2MmYyaUlkK0Q0UzllMGRMMDZwMWwySnBnM3FrNitPYXQzYzQyZUUrVUs1?=
 =?utf-8?B?OHRsS1Yxc0lFdDUrcHEzejZ2YklOSEJYVW1PQTVTU2pBVVdHbVRHQ2hZNDUy?=
 =?utf-8?B?V0gyWEwyNFhNQStad2JnUUgyejk1R3VQMlJoNFR6QzVnYWIxc0IraUhYY0I3?=
 =?utf-8?B?S2xPZnN4NUd6TVFCdGJ4L2I2Y2xrYTVmRTh3Tmg3cUNDaW02QmNkeVJQVkhO?=
 =?utf-8?Q?YSwb/mD/HoIiP2zw=3D?=
X-Exchange-RoutingPolicyChecked: FIg2s3bT/yYQuhr7+warlq8o9IH/MvrUpHbMPCzagVKfm+ituJLuDmYbb3r0lWtPFsi8r8oyA9mAGBzD0oG0UEDC4GgIKhbjc4BnP7CEXm7ff3sJpAzEwT32kEpYuceQc4BiP8dwh/uBESPHKlUVJW5vAJcJUZu7FpcBc3k+T5qDtC8mpGYkwmWV5kvwG0WoNo6iLyWeTEDs95k92c2Rniw3ztYyQkaGVBzM7p4d/hGOvJW66VjBK46rO2u6D6hCz2HCyt3vABRPzqG1MGIYL5rwhLyMY+gsP4VYoXkeB+IhH9YNkftOn8BgVNkD7e90dp0vGBQjhSyAqPokyzj++A==
X-MS-Exchange-CrossTenant-Network-Message-Id: e98ba0b1-eb37-4955-8d11-08de8a5a56e9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:36:14.6290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dl47kr4lQSS7Lm8ZwbUY/SASAzgqp8hNC9ZPTgbQh70y9gp+8Cl6FtfzOnJqb3r7ILuQoZTkUeF6v4ZyfijOqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7245
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

Hi Sowmiya,

On 25-03-2026 02:09 pm, Sowmiya S wrote:
> Split the comment into two blocks: one for the
> feature tags and one for the long-form explanation
> of the test. This improves readability and ensures
> documentation generators treat the sections separately.
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   tests/kms_explicit_fence.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> index a7d127c93..400fef939 100644
> --- a/tests/kms_explicit_fence.c
> +++ b/tests/kms_explicit_fence.c
> @@ -9,7 +9,9 @@
>    * Description: Test explicit fencing with multiple planes and mixed fence states
>    * Driver requirement: i915, xe
>    * Mega feature: General Display Features
> - *
> + */
> +
> +/**
>    * This test validates correct handling of explicit fences when multiple planes
>    * are updated in a single atomic commit with different fence states. This is
>    * critical for catching fence synchronization bugs where the driver might:
