Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043FCC4452B
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 00:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DF310E2F8;
	Wed, 22 Jul 2026 00:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Tws6yWrV";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012066.outbound.protection.outlook.com [52.101.43.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB6E10E2F8
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 00:14:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8Oqtq5K4oRgiupHiWtCoZE2TWUdXcy1+5jsNG0Ogk7FPXjmeb1XKB6sFfRAbM7mKwKwBvi6SM88mrLtzFpLHoQaRATTp7K1BicYwrN/oDYpsYzsOKlYAzBz5fuYdVbR7kb2OcqVd1aLG9nU1M2eQI8FoJj/ZF8tccm0oJXNCw28n4HbIQ+7VVJynr7uSELDXy+09vGDUBMMR3KvE9EzT689+j7qvvcMCE1hY7ftEm2fOvXrYkyDhmGS+9OiJ0M7yOeFGwmzplJ+m7P+LL1SCXdYyntM1/twBjrsdLBHDB+Ibp4xIKPnTZvqQ1SmECkVBbqqYvj35hv8QF7JcM+hbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+xDKfXSvwSpMyBd3g3UJdt7xyooV5pA1szVJrhBf38=;
 b=tkRowAH10XiqPwAlGPVsPK08N6CuM0VYq8FpZBjN+R9q1BBxAV1nUaIbAKIT0eyc8I/jhZJjuQpTtoZf0pTLBxFuH9VZBe9Xzx/fzuUiIXpDhSSyM0aUjLmeeKPmsnaayXVYmI5j93ymcuOO9CZH+NNERUdq6tX7okvHkWts1wG+ZjW3XMnognrt9vDtZ8ngfIaZcAhuRnGivP3JnmvscDueG4fkO1tDNjMEwBqhDXpe0rFmnDLK0rg5UtZB3VshcPoztokw2HpjQj0qgTdg3Dtz5cne1Pn5OooPvNOgIPr0Ee2BVf2QqJTAGbya9vH74xltw2BUnvAGxJ0ISsjeqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+xDKfXSvwSpMyBd3g3UJdt7xyooV5pA1szVJrhBf38=;
 b=Tws6yWrVacligNAvJbYxKkVd+7L9V6cbJzuZ24p7RdlJB8x3q5kQHfZ8GkbHjsB1uRrtZ0It4+/1H9IE1d/5YfisMqk0RI7wHy+ADt6y3RUeASSSSvlRFHPdV14CTgw3N4m36k0ncdg1kioAQu0y/2QbjbcTuzeKcK7ehbyxOxo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB6907.namprd12.prod.outlook.com (2603:10b6:510:1b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 00:14:34 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 00:14:34 +0000
Message-ID: <979aad04-7755-40e0-a6be-f0051afbb23c@amd.com>
Date: Tue, 21 Jul 2026 18:14:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/amd_hdmi_compliance: Fix for HDMI Compliance
 Automation
To: Fangzhi Zuo <jerry.zuo@amd.com>, igt-dev@lists.freedesktop.org
Cc: Mark Broadworth <Mark.Broadworth@amd.com>
References: <20260721195612.25545-1-jerry.zuo@amd.com>
 <20260721195612.25545-2-jerry.zuo@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260721195612.25545-2-jerry.zuo@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0091.namprd07.prod.outlook.com
 (2603:10b6:5:337::24) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c6d313-4afa-4773-1e79-08dee7863554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: eHjXDPaC+OCQaBdsDrk4n6CIkfC+NxZhE2U/olFpUhxjc4dAgHDYM0Qi+Z0hF3v0QXhzn6hJGPxmB+g5lSWm41+RKV6QrgRHpeU8H2UxxJE9++NB++73lwlUqKIudq9eJ9ji0uSCj1A6wz/TrvmEi7IpZTusk2RhFpBLQrQYCG/Vp9QndRUZ2TcsxU5MrfO/J1O+xSSYTtI3KvKinldTr5HIbJLpQ6NX1u7/yBr3CXPNi+KUrANBs+/gfb5nvAo07Wm6rtx1nVhEFdoFhO8WYJcrHq3OHX3koiFYZF6d0kQRq/5dJ/R2ulti7uLmgURpUIk6anbQ2DjvZ/3+CAF7Agf1WwDQXjnIwNMO69unvakxpyym9JSQEmfr86NiUz5BsrSjjCih8726nL/Sw4HV5ip6sJYrYf7m+0jaJlTKhj+ocuAGFtfoDWi3GFgDd3ehVG04crgUDXVgn/u/YiE8cfu75ry1kCYrWRHJ+zcpnOcu4hgzltWTm4ykeBJx7Gev8ImiucXO7vi25MglyQUl06mszMprVJrsNW6ba37i1y8qb4/GS0rdb6ManghETEJRHoH2TjlBOyaFsUiHXB6snW04ELEg2YNz+7pp4AIs5EUZU0rtKKHJ9szjvO8TRQrJINAvpp42Z7LlRcIEzo8KdWaBC0Y1egZTxqCC0/RwjVo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2pVY1J6N2hCdEZ5cUJ6QktEY0VuQXJRR2NnMlJ1aUhLM1ZJMHN5T1U3YStI?=
 =?utf-8?B?R005MVNIR3NpSG1QU2hrT0ZIZVN5RGpCbkh5N1QraUh4ZGhKZmoxbG5GQXht?=
 =?utf-8?B?bFNtQXJKYnZLYVBjWDdGY1dtTlBySG4rTGNaVjVDTTZ5TTl3ODdzYnRSK2ZB?=
 =?utf-8?B?dU1YUEJFUXBkcmsxUzMweU01aTBuQncvdFpJaVRrU3lJbkZRYzFTL2NhekNK?=
 =?utf-8?B?R3dtdGVCUkhaOGtzTFo3bDBoSDYzS3pZK25ERGZqVU9jV2NScU9nbGEyMVl3?=
 =?utf-8?B?VXFscTVWNURPa3VQQVdoUWlXWU9tZFhTS0ZZQ3hwSlRTbnFEblUyQyt5TTNv?=
 =?utf-8?B?UHdvYXNQV0gySVRwRkZXdC9BNXdMYzdGcGp0TjdaeDhRczY3K1U5UjlTbU9x?=
 =?utf-8?B?bWhDdHFoc0poekhLN2J1Wk9NZ256bEZzOU9kQVlhS0NnZ1hrd05uK0x5bndD?=
 =?utf-8?B?b0JQVS9Zd0xRemtLbjBPVEx1enR2ejgvT1BGdzZKRzVJc292SU4zaGN4UFlh?=
 =?utf-8?B?UlJjRXZSMmZQTXBVWjNqdVlVSDd3amtCRmx1OGxWakx5clBrZ0hrRFVEb0Fv?=
 =?utf-8?B?TndsMU5RcW9NRVNSK1lWVTkzakVXUXRQWEY2MTNGcUFramJCYjhCRENDUmZo?=
 =?utf-8?B?QVVXRE1QM3BaN0VoanVDSHVkU3dIT0R1RlFreEVuMEcyK0lZNjQyNXorK2Fv?=
 =?utf-8?B?MGNOWHhVOC9nZnZsNnFhRUZnMGZ0NUtTWXZ3Sm5wMXBOUlV6NXBTL1drOStB?=
 =?utf-8?B?V213RDlqL1V2djVJaFQwN1BnT1h4Qnh1Wk80bUNvajVmMmNLNUp3TC9NZlJk?=
 =?utf-8?B?TmthcEw4Y1Z5VlI2U1c5OXlON0g4WEJnNm5OaEVpQVJ5UUFqOHcvY0wyald5?=
 =?utf-8?B?WkdrNU91eUVQNmJtNUlUV3VGVVRNUkF1aXRrZ1kxei9GZ0JPSFFUUzh5bjJu?=
 =?utf-8?B?R1gwOVRwMUI2V0UrZUNlcytJVVRESUxCbVNDVG9QblZ3eVBWOUM3dTZ5b1h6?=
 =?utf-8?B?b21mRWhsdXd0b1JVeEZraDhiMVlJVFFGYVJNeS9WaTJZV25tR3V4QWI1eHdH?=
 =?utf-8?B?SkJ0UU5Sa0VDVE95eVVJZ3Q2ckt5V2hHYXcrbFEvR1dsSW95TjQ0dW5tTFRk?=
 =?utf-8?B?SjlDeHI5eWJVdVFpd0sxb3pvYWZoOXYzb21CT2plNlYvdUVLVzFzMm5rRXNs?=
 =?utf-8?B?WUJMdUdyaWZRTlZUWWRidW5MQUV4L3BvQlNhOUR0VE5aSytWM1RBYU9uMVRU?=
 =?utf-8?B?WEdpeW5mUDI3NDhjeVA2UkVXeVZUL1BiRGdERzlJSjUyNnRqL1oxUFhtZjZw?=
 =?utf-8?B?MisvRGVYNjVPdmROYWl1b2RzR05PdFpNVVdrTzFqa3BnTkh1NjlDQzF2cklC?=
 =?utf-8?B?L0JuUHpuejZzWjRhMFVxbGhKVk1HalpxR25QSEI4NHN0eVlCNnk3Vy9TbXBC?=
 =?utf-8?B?QUFNKy8wVmdHNFI4MlovaUJ2Q21PWGs4VUp2cnYyaVJHL04zbTdjZDhJa3Fl?=
 =?utf-8?B?RUtYS3ozb3RwelFscnhPQk5mRUt4eldncFJVZ3U5RWM0RzlhM1M1ZU0zbzVw?=
 =?utf-8?B?RzNSdnJXV2ZWckVFK3hWOEZ4RzNhSVBrd01aemFienRXZmhpY1psaVUxRWNt?=
 =?utf-8?B?RTFtcGgrWWVUdkxPUk5IMGVkVE5JdEF3eWdvL0NXS2xYb3g2cXhWaExwWlJW?=
 =?utf-8?B?N2o3T2NBQmpRNzFzK3lpT0duTmZCbTFmWGFtemVUYW1XbW5wZjhkL0ErM3Ba?=
 =?utf-8?B?TmtmdTNadE1KdmZSY25NSTRrOXgxYndsbDF1Smwya2IxSkN1aHhqc2FvcmRY?=
 =?utf-8?B?T1BWZ2NCanJVYnJudEpLRGVRaVBpWVVBZWdnWDgzaUc5bVYvMjFpZXJjb2lq?=
 =?utf-8?B?QUFQNVBaSkxVc2twN25LVEp6ak81ZFNMWnJPRVdVY3plOU81alVkazNJQkJK?=
 =?utf-8?B?eFdhQzVrN3YyU3E3Z2JUOGpsUGZhNDU3czROY3ltZU9oWlJ0aGJJeklOQUJN?=
 =?utf-8?B?UXRtQkVxR0hia28wdjg0elBRMUplbW1Sd0hNallhb29tU05KK3d4RDdUbEk1?=
 =?utf-8?B?aFJtd1RpcXg4TzNETm55cXZEZVFlandieDRiNGtObjVJaXA0cWpKL3RGQkxi?=
 =?utf-8?B?YURUckJtMHB1VEExNWdhaFFGd2trTnRMQXhLdFdjcm1jcE9SNkgzYlp6R3hU?=
 =?utf-8?B?YlNPdEdkSGtiWE5MMy9Qa1pvNzFrM2ZZZ0dFQ2VGMEYvRkRkSDUxTnlFc1Jv?=
 =?utf-8?B?TTREY01HbmpzOFkvbWdiam5EM0diQ2dBOXF1SzBNVE03SmROVW5rY1Zoc1R1?=
 =?utf-8?Q?Ho7HZQBBvyO/mypCxl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c6d313-4afa-4773-1e79-08dee7863554
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 00:14:34.1105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfvO6YPqvlmcQlxiIMg/o1Lo5PA8rcw/3phIq6s6e/81eeoZZTHg19znC2jJr1RuIQtZXqbaAeIESbpwoIq/5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6907
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 7/21/26 13:56, Fangzhi Zuo wrote:
> From: Mark Broadworth <Mark.Broadworth@amd.com>
> 
> It is to fix hand shaking issue between DUT and the box.
> Need to block until SIGNALRM triggered.
> 
> Signed-off-by: Mark Broadworth <Mark.Broadworth@amd.com>
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Tested-by: Mark Broadworth <Mark.Broadworth@amd.com>
> ---
>   tools/amd_hdmi_compliance.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index a60176c0e..2861b440e 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -903,8 +903,12 @@ static void test_vic_mode(data_t *data, int vic, int conn_id)
>   	igt_plane_set_fb(data->primary, &afb);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
> -	igt_info("Press [Enter] to finish\n");
> -	wait_for_keypress();
> +	if (data->timeout_seconds > 0)
> +		pause(); /* block until SIGALRM fires (works when detached) */
> +	else {
> +		igt_info("Press [Enter] to finish\n");
> +		wait_for_keypress();
> +	}
>   
>   	test_fini(data);
>   }

