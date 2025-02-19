Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B2BC021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 22:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BD810E032;
	Wed, 19 Feb 2025 22:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="11OeRtes";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1437610E032
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 22:53:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8M5X1wEOSA69+HudvQBaxP2f+QxJ6R+fbERX1Wtgvhh+AHEME3Oqbi3b0v/bvG25gyOE6aR1880bY1XdqYrKksWKrMvMqD7C+dbYvu9j8s+bjSm3YAu9QvJw5Ou2Pt9RaIUKLzXXKAee/NH/aILR5/eokfpvf57em3TRcSw59C6E4KnUoEWjnCjY313WIr0ynOL2MSWmx+KbUfMqPg+iDsR8rywGUhTNN+AVC3nhmcLWWExJJNhFxriyXA5hqZIhDOTnEoyhEco8t39qp3ZfH4/I2t9/TICz2LVsrQuBVhHALml8V4YBddMRjRSXa+zqsxZBxhpes3huCIORvebxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCT6HdUnqCNhvPYHhNNo7kavlJ9GPq0+0s5kE8eWxaQ=;
 b=HChoTGIhpe7FAEor3URi3+Mjw/UxYeK7JMrl+b08CwRzFufGjNinIPgekZNSsQ0cHPPNZ335Tam6DLDmgM9KVXwc+H9QhwTno4MvGqbidqJYkKM2jXW5HO6Bucr00YLSsHGGPgzbkOYY7n08Br54/upQS69lr0iULqUfrkhPZR89A1EEIe1zkeDA3lqx5dTKfk4wZZX9+mGLdMl8jV25SinDcv3TXEWiJBcL8G1OXde/bBcu7AQbkrPBzIBgKQ2lSPHAJzX66dOxqHmsbU0jUWIIRELB7Q7RJP1Hnsf4LsR3wTM+jbiqLIFMoVNGvgYFtGnDd//7xGbwonhc7o54EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCT6HdUnqCNhvPYHhNNo7kavlJ9GPq0+0s5kE8eWxaQ=;
 b=11OeRtesrqDsxLrm1OyEYbygMXjiTFT2M354L7XBDLICrQMN9MXpwS9FkuZaMw277+Yg1+4iDGLeTw8dfqR5skTHSiGiG9sZHOrDaUhfr5hBvH61FV8Opjt3xfcZyqShf1ewwENjixA4pzX1dPKVrZr/e76AQMV/Ajd3nW4/dnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 22:53:42 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 22:53:42 +0000
Message-ID: <d242d0d4-a180-48f8-aeab-9da3fb6cd4f6@amd.com>
Date: Wed, 19 Feb 2025 15:53:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3] tests/amdgpu/amd_abm: Disable the ABM after test
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: sunpeng.li@amd.com
References: <20250218110514.8856-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250218110514.8856-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0273.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d10604-10a3-4591-ac7f-08dd513841f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlF0SVRYYWgyOUxPQnA2ZUUzZS9qcGlmY1ViVGZNKzd1Y2FYd0NxSmU1Q2JS?=
 =?utf-8?B?RlBYSUxhZ2V0SndudktsZkZ5SFowUnRBaTFYb2ZLckRBU20wcW9mWkJ0YnJj?=
 =?utf-8?B?WCt0ZmpCU0RHcVRWbW9kY2V0WmxXRE1wc2g1c0U4SDh0VWlIeldvaU5icjRF?=
 =?utf-8?B?dmxzaUF2TXZCYmp0MXBwb3BhY3FyWTFYajMzUmx3bHJaeWdaSVI2K2hVM00x?=
 =?utf-8?B?YWJraWd6TGs5b1ZUMXc0QXYyd2h1UGp5NUovWkF5ZWVBR3ppeFNJNHM3djFL?=
 =?utf-8?B?ZWJkVHg0cC9QMFJ6ZU93TVRxOEZQTUVQV2svQnVLZ2NOdWhHZE9tNFovQW1T?=
 =?utf-8?B?VGtyajFJc1dvYzZLSndpcHpVS3J2Ky90WnpHVjVWeWk3RDRCTmlhcXkxenhv?=
 =?utf-8?B?Ti8xd0w1OEJkYVc0LzZpZ0cxdVMzdzR0K1lUMVBRQnpoYXpLNGVHS0F3UVNK?=
 =?utf-8?B?VURNcTJUTmd2N3NSd2M2QnBqZDRuTWR6cG1qZlZXRmRlbDNicVJvT3J4NkdV?=
 =?utf-8?B?WkZvc05BaHc4UUdTNjhlaWFJYUR0dlVLNGRoV204MGNoWXlDMzh5b3N5NjB5?=
 =?utf-8?B?M2hFUVp0dmM0dkhTK1dRTzkzQjNyQlVwMkJ5SjdiU09XZEd3eFl1QWZ0OVBo?=
 =?utf-8?B?dkFuU3RGbHAzbHpucUw4VUs4eVU0UXVqR0k3YVlwSS9rYXhFb2FDank1a3JV?=
 =?utf-8?B?UlhnWEp2QS9wbFpSSHZxNUp6WHByNnU2a0pGWkN0Q1JGcXArSk55Y3FPdGNH?=
 =?utf-8?B?b0RPbURYUkw4UFhuMExoWnVhZE51dmorUGZIWFFiZ0hSWkR3YTNUSHpDdXc4?=
 =?utf-8?B?bWdQYVY4WnA2U0ZRdnVlMHpZSXQxelNpeDRGclBid2doMDM1N0RlWHYzN3JE?=
 =?utf-8?B?dFhUeFJLRG1USElQbG5nVHorSWhycW1SOGVqSTlWSmlhMTd0QkVFNWl3ZklW?=
 =?utf-8?B?SVZLZVVLd0NtZWZWeW9qb0lVRVAzQlA0dFV4cFo1QURQSllNeU1aTitXV3p1?=
 =?utf-8?B?TmpOdndvRnRJc0RHcVNGamdqYXMwRzRHbngyaHNhUlJKaUJVelk3UEhNbU90?=
 =?utf-8?B?ZHBTTVZDeHFoSUQ3OVZSSDdtVHZaclFReFRBL2JTMW5HZDJYNG0zVHhiZkxU?=
 =?utf-8?B?dDdQQjRQa0FiSG11VmsrREtoQ2I5VUNsdm5CYzY5VXNrSElEamYrL1FiZDNt?=
 =?utf-8?B?b3BqL0J0NnZWdFcyd0oyWS9FY3pybW4wUjRHdlZ1b29xbjZvUG5jL2tEOFpT?=
 =?utf-8?B?TGtuT1dZUFFqOWNGcmpmVVNZRGlmMUVPZlpoZ3RGc2J5aGd1Q0JqRFJBbVBR?=
 =?utf-8?B?K3p2QmhKYm8rS001cXVhc3psYlhBK2RiS2F6YW9qVDRpTmFoaW1iK2VGVllh?=
 =?utf-8?B?Q1NaYTBLaXpTSW9WZGZyeEx4bi9WeFdOb2xrTkZqZXlES2J4c1hUT3BhTEFl?=
 =?utf-8?B?T0lGSnBaa3BPLzhqOGtQRCswSkRiLzUxK1dnZDV5Q1Z5Zk1mdjRGaHlXcUVx?=
 =?utf-8?B?R1pQZ05sQzNzbzNMREM4YUdBcVlDcWZuaTI0VkJQdWVyR2hqSEhaVlNLYXpX?=
 =?utf-8?B?Y0hYK1Q2eDVNOERBbEtzYU0rSXY3azkrZWZ5TEVyMWYxY2plTGU5bDFlTVZv?=
 =?utf-8?B?RDg1U2luUWxHNUNuM0o3cmk0b2oyTEYyTHVXQm01NW5oMkpPSnNsUjlncnJs?=
 =?utf-8?B?NDVLSmFSYmF5T3VXWnJNc2t1RStWUGg3T3VOWFYvMGR2aFhKRHpjVEh3NzV1?=
 =?utf-8?B?d09HbWZXWmh1cmxQN1JkWDJhUkpXbmhKb2VZd2JNMWN2QUxkV0pvMTNYSUVy?=
 =?utf-8?B?dEExYVBuTmEwV0I3Q0FCcldLRWNjV0lZVVdCNDRqUHpmK3pJMituRUUxRys3?=
 =?utf-8?Q?U7pgKBe1A3IKP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFRkakloZGJ4bjNnSmthNGJLTVRVbmlJY3BwcDR6ZVZBVkNWNW1XSTIxRzJZ?=
 =?utf-8?B?TVVZbWJwS3d5cEszZFlrS3JDRFBuT05ndi9SRmZCNGRnS2Exb1JyaVJBcEtm?=
 =?utf-8?B?RmU5WGtNdGNtL0FyY1diT3FVeXAxeUl6T1BpcDE4RXhoMFdEOCtSZGE2NDBl?=
 =?utf-8?B?VjVvZElxOUJZRmVBd05kbmFYaVZSUnMvWE1RaUtwUURBb2w2U3JTK21iOHdI?=
 =?utf-8?B?ZDc4bmgzSFZ3Q0J2VWJiRjFVV3RqU0F1amxWczIvanhPY3lndTlhZkQ5elNK?=
 =?utf-8?B?YlYzOXR1cElZMG9KRFU0R1BVRk1Kd2VxL1ZDQ3ZFVTV0bXJ5SjRmZGg2SUVK?=
 =?utf-8?B?Z3RvU05rdkZqSVphZXlKeFJUbzcrc2ZzTldhTjZsbFVQN0NrYk8zNjYyWEFJ?=
 =?utf-8?B?aUhwWUJkWFU4VVVWbUZnai9DNGROZHFCNFZzRnlpaUpDbnlXU1dqa3BJRFQw?=
 =?utf-8?B?bG1QSDN2TFBkc2dzRkFiaERUTmNEd0hzRDB0QS9iOG94ZE56ZU9pd2hMcWtV?=
 =?utf-8?B?c2FOcHdTZVlHQTV6ZDIxc3duWUF5MWgvTHFKME9MZWJQOEQ2MkV2SWpzZi81?=
 =?utf-8?B?YzBNZm8zMTY5ZHlBSU94UkhyVzBLcXM3RGhtQmZJbVhCU01oUFRxRnJFTTVy?=
 =?utf-8?B?OFI4eFpqaXR1bEpaQUJQd2ZMOSt3VFRpOVF2NW5Lb1pPeTBPSUhBSXBGYUhB?=
 =?utf-8?B?RUNseTVkUWVnQlFPamliMkcrek9xaHQzb1lRZFFsdlNjYVRvZ0h3WFJrZk5G?=
 =?utf-8?B?TjY1VUJkckJmMG1WbHhLUm4ySWEyL1RlSzNxSFBZSWhUcEF0M1MwcDlnbmJS?=
 =?utf-8?B?TXAyQnlNQlFHZ2ltQ3dWRVRuYTRNcW4wNTVRYXZkZmJFN0toYnN6MUNMV3or?=
 =?utf-8?B?RTA0eVZOVlNHclZMWUtORTdNMHhHN2RacTYvUXNNQ3BDbFB2NUYwbWh1VXRl?=
 =?utf-8?B?VFJUSDhkR25vUFNBRlV0dFZiOU95bW1wWEJqQVZMYnpNNm9vNlU5QzZiWWxG?=
 =?utf-8?B?VW5SQStkNFI2djhOOWpTTzkyb3c3L2tZVVZJcFpJOC9UVGpQNHBGVTc0Z0Jm?=
 =?utf-8?B?djdFVmp5VENvYUNLQWhnN29aTUprTUxYd0I1RXpFNXJkRHV2cFU4VjV6Skt1?=
 =?utf-8?B?eGRVVGVpdUdubzgvSnVXTUo0RWNhcnphNUEwUGI2QXp1a1dULzdIUXlvN3Jr?=
 =?utf-8?B?RUx6RGlSbm9zSDd3b1VEeWV1cGNjTU5YMzhnRGRLQjVUWVd4alJ2azlYenRs?=
 =?utf-8?B?SHUrSFRnRUNMcUk0MWVGc1BFbGhCaDZpb2ROT3lEeVp4K3hud05GbFVjWnR3?=
 =?utf-8?B?dEFEWUFYdVRPck9wZ1U2MzlTT3FMNHNMeitXQ0I3ZjU1d0F0bGNudEFrUFBZ?=
 =?utf-8?B?SStjbE9yN2dqaGhJQ0srVjNIY2twc3BTcHJRWlVIVWFid1YwaDZ4SUpoZXZk?=
 =?utf-8?B?bWlOalgxRzM5QnlxYTJDSDZOSUQ4ejkvNno5Q1E5VThqQytNMEE3QlUxSmI4?=
 =?utf-8?B?MWJLZm5hdllld1VxS0dvMUtEcnVQWUQyeU9XVExpNWpoSkVDU0xxbTNwWDl5?=
 =?utf-8?B?U1pXVjZOdWFDa3gzMDlWQk9raUg0NWRySVFETkZoSUdTaGRFYmxscjVjd003?=
 =?utf-8?B?NlFyTHJDZEhNT3dsSmU0dDRLZG5FWU5KN2xrY3FUQ0N3c0dSVnUxNjJFUmdv?=
 =?utf-8?B?cEg4cGR4aXQyN3lYanBwMi9TY2RtOEZBaFgvSDBnUVFZR2VlQkJyL2Q2eWF1?=
 =?utf-8?B?K2UxbXJzNU1PTHdMSUhvakJDQnZJSWZZdUd4ZEI5NkpVeXl0NUJDSmN4ZUJy?=
 =?utf-8?B?RW9rU2VVdmtySGFORlNnQW9qcHo1OFBPYmYxenNkRXFrZFFLOG9CK00zVVov?=
 =?utf-8?B?OXlUQWtxRGF4dkxaMnlnMU0yRDA1VnBDTVJ5UnJPS1pqOEdSZnV3N0VvQk9j?=
 =?utf-8?B?REtCYjBieitmc3luQSs1NjVhcXZGb01tczFoM1NuM012Y2JtVml4M1RWaHd3?=
 =?utf-8?B?VTZPNi9LdFdPeEJCSHZxdXVJaHJoTHpOb1FCQU1zdERvOE9EMUd5cnA5RkdI?=
 =?utf-8?B?a09JQ2tRQTN0NFVNRVBPeHFnc2t1UkhmQ1BWd2tMTnI5aFpNWEpodGN2TFJL?=
 =?utf-8?Q?Qk2FL3nIw1PymmsgQOzZUiMrb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d10604-10a3-4591-ac7f-08dd513841f3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 22:53:42.5091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiDtiIs0b7EUICrpVImuikwI652XOKH/wQ/dRiRbmNWhAAve+CIfgY7wPUg8Fn4JSlBoQnaNwfPcbvbZqu/cow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848
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

On 2/18/25 04:04, Tom Chung wrote:
> [Why]
> After running the ABM IGT test, It may cause some other IGT test
> failed because of the ABM is still enabled.
> 
> [How]
> Disable the ABM after running the test.
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
> v3: Fix the conflict
> 
>   tests/amdgpu/amd_abm.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index e196b6ebc..8f7f489ad 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -49,6 +49,8 @@ typedef struct data {
>   	igt_fb_t ref_fb;
>   } data_t;
>   
> +static void set_abm_level(data_t *data, igt_output_t *output, int level);
> +
>   /* Common test setup. */
>   static void test_init(data_t *data)
>   {
> @@ -101,6 +103,15 @@ static void test_init(data_t *data)
>   static void test_fini(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	/* Disable ABM before exit test */
> +	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +		set_abm_level(data, output, 0);
> +	}
>   
>   	igt_display_reset(display);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);

