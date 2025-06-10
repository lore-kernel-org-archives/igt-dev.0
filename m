Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A62C677C4
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 20:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9D810E2EE;
	Tue, 10 Jun 2025 20:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CELRWhv2";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D652410E2EC
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 20:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTIvLwZ1NZuuvjKE0hIEOsEjfcVFWy+8V8dIdEvLqO+8ORuIGbWS4wklAMTVDw7a7PZBdIy5lRdSoHzlK6/yu4gVYga+iEL31QWLzTGpttdtmHrFgCndhaYhxAzvYy2V8UCJSPz9pghzmS/nNuQRCGd6c4GWxu80B2LHInffhczHuHXLidcV4KUKLG8FAAwy4sBLJqcAhCYUDSa4Tt/10xpesKuQ8+lAeOo6A7qY7rV2Ls3KP1Ylmn3JZ+jS8x364QFqzRvk3jwHN2shua84eXb+YLriEV5gh7PV2GE7zm2TKXWPeHYER14U4svKozqna68GgrGzRfciRiWCKqrhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGnHQTiSSMh7Fjn+6eYJIPaOGxOZhxDMtD/EKH7XdUo=;
 b=YJEHuj014Cm8jwXZ81ygjnqXzB8MUXW5J6qy2aNolm91Al3brDaPK5mz15xR6UwOOU7K2RX6W6+ncrq2k8Dj4MnXiLwLYGvWZb6opRd6l5A6Hrg78/lD77hEvDvhta1O2vRGmTyI+VOiMlI1GgFJIoyeUWNw13G/N5RjZXUc145NF3to29xrxwPA1igQmAzIXoDbPV2EGsLkbPt3Mu+hAKiZpw38Ybv3vVMJcSMRXNL5cUyEixVFC/rjWYbftsEVHTpgJOR07ywbpyoFEtgv4w9ad6protwLyckxLAPjJ7qa8fSRHM7nQIZ9wthgbunhkDbb2GKRUhol5KgsEZHTAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGnHQTiSSMh7Fjn+6eYJIPaOGxOZhxDMtD/EKH7XdUo=;
 b=CELRWhv2NMigcVo97OEGS7DkSZkL2ExLgA96nSM94SMXsF6yebUt0SKqcIB9O6jOruKiaYfprRUG4sYA+Xkee/BEsu0mDAUzaIT6cYYnzJ+6tg4sKRbEynR4m/KZVhNhmGhJosmJpsBZ1/jhEDiCboDXPjtbmKoGiGv+xSxNBOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA1PR12MB7639.namprd12.prod.outlook.com (2603:10b6:208:425::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Tue, 10 Jun
 2025 20:54:24 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8792.039; Tue, 10 Jun 2025
 20:54:24 +0000
Message-ID: <d106bb8d-c737-4af7-918e-c7ff0749c1be@amd.com>
Date: Tue, 10 Jun 2025 16:54:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu: add environment variable to enable tests
To: Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250610063729.944980-1-sunil.khatri@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250610063729.944980-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::36) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|IA1PR12MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 277b0f3d-5f50-440e-0195-08dda860fb2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDV5enpHWWd6TFFoQ05RSVBiTEsyYlU2RVRHWWxLL1Z6N1dOeUQ1MmdxRE1X?=
 =?utf-8?B?UkdpNCt2UlpEeUtvbVJHMGJVNjVLOXlmQi9QSzMwOWt1NVhUaktXRlpRWmNw?=
 =?utf-8?B?Uk5nbG53bnRpU2Ywa1pVUExuM285azRwOElRejVPaVV4VlkwYW9MYk55QVBr?=
 =?utf-8?B?M0xPeFlwaUNIbjVlWm1TODMwMTlDR1MyS3R6YkFIT2xsTnhnYTB4cCtNMElR?=
 =?utf-8?B?eC9EOWFRZzM5cFhKc001TE5qV1U2UzRTRUQrMGl3VVhXcHM2Q2VicHZpc0FL?=
 =?utf-8?B?RVBUd0ZhYWZ4WEhyZnJDNXdGU1Vaa2hZK1M3S01nekFqekJzSHpFM1Y2RWYy?=
 =?utf-8?B?NnhsTGxaRVlHR3lHMEd6NHUzUi9LekRlbVBLbjZxb1hpcjc2bXd0RWhEMEI2?=
 =?utf-8?B?SHcwYWJZSzRmdFZJRlFPQzlrb3k0V2s4TUhESjVsRnRHbGw3aGZPbHJTUkZz?=
 =?utf-8?B?SWFvNVFFU3A5eThqMDRwUEhySHBHakVwcjZYTzNjTzVOcVVIK3VCZk1oVjhj?=
 =?utf-8?B?TWwrS3VqT2VodzdMdU9HVndpT3ZTWmdnU0hqUFAxTmtDVHFuOEc4U2VEekxZ?=
 =?utf-8?B?bEFZaTBkT256NE1QSTJES0haeVlTUmt5SlVxay9JM3RobFM3VHVHSnIyZXpO?=
 =?utf-8?B?VnphQTNPM2Q2Zm9mYmhQRnVGSklJdm9NUnhnd1RyS3BWRTh6ODVvL2pqYWpC?=
 =?utf-8?B?L1E1ZUw3S3JKY081V2pDOXlvb0xyMTJYUytnNjM4VzkzcDZVWXA1VlU2Z1JF?=
 =?utf-8?B?U0F0RFduNXVJeXBEWnMyMnhlalRHNDJJa0d4UVNqUTM5S2haWlppQ2NxQmp0?=
 =?utf-8?B?cmM2U2NheWVaSEg1MTdqZGQwSUxFMWkreFJjek1RSGs5Mzc4TStwajRLaHhT?=
 =?utf-8?B?Sk5WMWpQQjdaMzBOd2FpcHN2OUVkQis4b3ZsR1dMQUlVNy8yb2hsdGRkMUFE?=
 =?utf-8?B?eXR1bmY1OU5iNDBLSExnKzl0emtQcWVKZXY4M3A3b0Vxb3AzS3Zadmw2em0r?=
 =?utf-8?B?YWlJN2xSb2hnSmRzRndtZU5sbW14dmV5WHFpdndiaW9UNlFRVS9DQXptN3h3?=
 =?utf-8?B?bExsdUNtY2RhTEU3WEN3WDdWVUk4NDZZUjh4ejJNTnFNUThjL1FJNVcyUG14?=
 =?utf-8?B?WS9pUDZRanpELzY3bmxJR3FCQWczVHFaaUU1dUtLempkZnl5ekt1SytkL0hU?=
 =?utf-8?B?M3doZkZkVUlpYUVCTkRWVm44dWc5R05kUFMrdzhCUzE3NXdta25XOS8xWjRI?=
 =?utf-8?B?Y2FIUER5WXlFSWVFNUoxNnZzdkZXbnMwbXY0Uk9lOTJ4UlhxbFpVSFVoMjg5?=
 =?utf-8?B?enF0RFY2SGdqZVdlWmo3T3I4TjdCVnRaRGRXQzRnczNxZGJEVkkxQW5TUXky?=
 =?utf-8?B?WlpQOEJlMWJRUVJKZ3ZVR3VSRXA3cU5YcVQzTVNKV0wwdHF6dVlYN2dYcVRz?=
 =?utf-8?B?Z3dQVzNYV3ErNjh6eVY1b2UvTkloekNEdE5YOC8xUnpIc1RUNjFIS096TVpF?=
 =?utf-8?B?V3g4Y3dUYnBhVkFwbURwcDVweE03R2Z6NjkxR2NFVG1uUVZRMU5oeENNZ0c2?=
 =?utf-8?B?MmJIMWJoRGdsNFpGSDVOZlFYSTdkSFFzTXBYUVBNN0xLWjU1ZE0yRUZQQTVn?=
 =?utf-8?B?Z3BzU09xOG1ibjE0eWxWa3krUDExYXlwc3hoREg2RmdPSHM1N0dWc0N5UU5B?=
 =?utf-8?B?Wlp1dlpiYnRJVjZseHJjck5KSkFXQkFxeENGcmFsZXhORTZzYkpJa3p1R2la?=
 =?utf-8?B?TDg2Q2IwWE96ajJVNGdMQldrckV3WTdhcVpkTllRL1NmeW8zV0g0dmIzc1E5?=
 =?utf-8?B?NHhQdUpZZC8vSDczbkRCNDQxVjZWdGFpbm1HVVRIUGlQY2dwUFVwbFEyODR3?=
 =?utf-8?B?aVdjWlZSRjB0OTZqWnZtWGZYNDczMFdvVkxwQnhXajFmNXFJNHJtdmlKQTlD?=
 =?utf-8?Q?qG5Pd/vs8EM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFNSWGNvYkQ1MFRRUGZlYldodzUxV1QvN1JCU0duN2ZNYUtVZmtuR0tDNjVK?=
 =?utf-8?B?clMvMVgrNzZjRDY3MmlkR2dmbWFnajVUWlRjS2RMU2x1V1k0aXdtRmd2QWxY?=
 =?utf-8?B?RGQwSUxWRzNDYmM4bUZReHMzUlR2cGwvWHpTTHozaGlaWnhmNjBZV2I5b1FX?=
 =?utf-8?B?cmNKbnIvcS9HUmtDcSt6RVVxK05SVjgvY0FUU2RMYjZ3Vk9xL2REa21zQlAy?=
 =?utf-8?B?Slg0NnRKRmE2NGxKd1JFdkVDeEUwY3l2WTZSdXEwRlpybHJUWmEwdGZlOTNK?=
 =?utf-8?B?SGhhTUhybFBmaHZKQmdycjdhUU9sSlJJeVFNRnVZb1JiNzM5TFM5cmthOWF6?=
 =?utf-8?B?dE42Z0pSdjBQMVcrN0dwM1NmUkY3QVhqY3RKTTJTQUFkdFV2WE8zaEVvQ1dh?=
 =?utf-8?B?MU9CMDJzY2dVbEtRdDZpZlJrODQwVnZnQ3pPTzRrQ1ZyOEl0aVR5MW16NkU2?=
 =?utf-8?B?VVRxNHgvZVJOSnlCS0lsT3Y5RVVua21ETkdIUnBmR1QyZnVObU1FTytiNlVV?=
 =?utf-8?B?ODVQQXpqdldXWWN1VnBRWVVZY3pHNDZzVnBhdFdWV3V3aWlTMDhlSnhXWjR5?=
 =?utf-8?B?UFo2UnpOK0FkL00vdy9obzJZQ3d0dkppeTJPbVAySGY1elFJME80cDA2NUVv?=
 =?utf-8?B?ZVhzZ1dXYm9lRW5MNnVxenJNc3VaRXVMQUR1d2ZQSXY2TlFyQjBaT0FIM3pX?=
 =?utf-8?B?VVpqM0RQc0VuanNVMmdQaUxiOFhDVGdqd2tjSjMwekVsVFRSWDlEcjVLSTht?=
 =?utf-8?B?cEI4UjNiTU53NHFFRUdNd2ZGUUFmcnNCRVBVZlFUcitJbmg1QW5lUUlDaXYy?=
 =?utf-8?B?Sjdac05FRDN2SjQ5eENsRW5uYXc5WXJJc2kzOXhSSHZUUDFIcC8waHp6c2g1?=
 =?utf-8?B?N3oxbkw3MjdReGdwakFyZHdUUFdPNi9DRytMcVJhY2NkNUR5dlM5TnRTMHhz?=
 =?utf-8?B?b3ROTzd5U09ZYkI0aEVSN3BQMExaaHlFTzU1MHlFN096RzRjVVJKQThZc01l?=
 =?utf-8?B?RURqZFcxZVRoTkVtN0xBbHNBQVVMcjh1Vis5dmJXZVJDdGFodHFYc2pSaUw3?=
 =?utf-8?B?UTBHQy9HNWhSY3Jlb0o1STNxelZWR2EzU29qalZBWE40K0JCRXJTRjB2V1RB?=
 =?utf-8?B?OVZUNS8xWm9BZ3NMQ2ViZmpmaHdOSFc4OUJoUlhkYXgwZE5iTUdRRG90OUdy?=
 =?utf-8?B?VnIvb2QrOTFBZU1XVGcyTWVBWVJxVTRna08yOENuREFIL3g2azFrbTdUSnBB?=
 =?utf-8?B?akwxcndTTUg5U2RYZzVQVXI4LzBOSW9GTVo4NUxEN3QyQXphRER3c3NqOTNv?=
 =?utf-8?B?R05CMlE1REhrdXhmQlRpb1JUWkNKbUNCN2prbFpxUG5mVDA0UHJtRHA5bWtP?=
 =?utf-8?B?OGZXTEg1NEowdWFPR3JFelhiVDUvU2xZYjlLNTZHVHI5WUVWbWxQWWhMUHdS?=
 =?utf-8?B?bjZXRXNXeUNQYXRDQ0pJZU5lRjc2R1FyRmFjK2c0M2ZQd3ZNcFVnNFZuaGx2?=
 =?utf-8?B?MWhzeisyTTdORVhHZkthUVdZdDRmNzROZlpQVlZ3N3V2c0wvUnV3V2cxRHVt?=
 =?utf-8?B?NmcrVi9hTllnaXdEZkdVYUlrL3JKaGd3eWgwVTRaSVE3a09mdFBMMC9USE5F?=
 =?utf-8?B?dzlEL1duZ2NsR2pxbU1XQVgycHBzaEQzbGtNNDArQ2lDT3JJTGdodGp6NHl6?=
 =?utf-8?B?VEtkYkVKbi9Xa2xTK1hzaHk5UE1tQndvM2RRWS9NVFhsTmRNdGhlL0t3SDNh?=
 =?utf-8?B?R2t1WFY4ZG9uVU0xZ01HQXFpN3UzYkJwK1BJL3BCdUFkdXovZFcwVEFqTFVV?=
 =?utf-8?B?Q2wxdFFrT2dUVTRtZW5GZXJtZ3ZtK3JSTm1xdG1CRjBqSkYzWkVFdEJ6QTF1?=
 =?utf-8?B?V3NVTWphWHkxNHhxNXNNSk1Ea0lhVlJFcHpKczVZbUtaTHYyYVpYSGs2QUNu?=
 =?utf-8?B?bnZ6MzhpSjQ1N1VlNXRhcmtWcDBBbnltTzBEdWNXMFRtZWpac1o0MzJ3bVhy?=
 =?utf-8?B?K0FrRk5NQ2VST011UUV4RkVYYXE5RzN4Z2lkY2JjdmVPQmlJQWVXR29VM2U4?=
 =?utf-8?B?QVB1bnc4VTFIOXJ2aWEzcnBGK1JnTmtiZEhTZlRqZVBWajErUFZoQ1JKdTgw?=
 =?utf-8?Q?A8z6T0Sr958/8kj6B1GtUuxaA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277b0f3d-5f50-440e-0195-08dda860fb2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 20:54:24.3219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8hhBsX/1hdSalL1IjOGxMiERqviW9onX4GEUzwoG6ZGMdEj682xXWJSoH0GGmkS7uqPq9wvfnadfJpT83kodg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7639
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

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-06-10 02:37, Sunil Khatri wrote:
> Some of the upstream tests are not 100% stable yet
> so keeping them disabled by default and developer
> can run these using the environment variable
> AMDGPU_DISABLE_USERQTEST.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  tests/amdgpu/amd_cs_nop.c   |  9 +++++++--
>  tests/amdgpu/amd_deadlock.c | 22 ++++++++++++++--------
>  tests/amdgpu/amd_security.c | 32 +++++++++++++++++++-------------
>  3 files changed, 40 insertions(+), 23 deletions(-)
>
> diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> index eb07a2823..644016d5d 100644
> --- a/tests/amdgpu/amd_cs_nop.c
> +++ b/tests/amdgpu/amd_cs_nop.c
> @@ -167,9 +167,14 @@ igt_main
>  		{ "gfx", AMDGPU_HW_IP_GFX },
>  		{ },
>  	}, *e;
> +
>  	int fd = -1;
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +	bool enable_test;
> +	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> +
> +	enable_test = env && atoi(env);
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -200,7 +205,7 @@ igt_main
>  	}
>  
>  #ifdef AMDGPU_USERQ_ENABLED
> -#ifdef AMDGPU_DISABLE_USERQTEST
> +if (enable_test) {
>  	for (p = phase; p->name; p++) {
>  		for (e = engines; e->name; e++) {
>  			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context-UMQ");
> @@ -213,7 +218,7 @@ igt_main
>  			}
>  		}
>  	}
> -#endif
> +}
>  #endif
>  
>  	igt_fixture {
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index b5ae1c5c9..45a864feb 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -43,6 +43,10 @@ igt_main
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
>  	struct pci_addr pci;
> +	bool enable_test = false;
> +	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> +
> +	enable_test = env && atoi(env);
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -180,18 +184,20 @@ igt_main
>  		}
>  	}
>  #ifdef AMDGPU_USERQ_ENABLED
> -#ifdef AMDGPU_DISABLE_USERQTEST
> -	igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
> -	igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
> -		if (userq_arr_cap[AMD_IP_GFX] &&
> -			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
> -			igt_dynamic_f("amdgpu-umq-illegal-reg-access")
> -			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
> +	if (enable_test) {
> +		igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
> +		igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
> +			if (userq_arr_cap[AMD_IP_GFX] &&
> +			    is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
> +				igt_dynamic_f("amdgpu-umq-illegal-reg-access")
> +				bad_access_ring_helper(device,
> +					CMD_STREAM_TRANS_BAD_REG_ADDRESS,
>  					AMDGPU_HW_IP_GFX, &pci, true);
> +			}
>  		}
>  	}
>  #endif
> -#endif
> +
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index 79fe0f78e..45bd7e771 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -316,6 +316,10 @@ igt_main
>  	int r, fd = -1;
>  	bool is_secure = true;
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +	bool enable_test = false;
> +	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> +
> +	enable_test = env && atoi(env);
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -357,19 +361,21 @@ igt_main
>  			AMDGPU_HW_IP_DMA), is_secure);
>  
>  #ifdef AMDGPU_USERQ_ENABLED
> -#ifdef AMDGPU_DISABLE_USERQTEST
> -	igt_describe("amdgpu gfx command submission write linear helper with user queue");
> -	igt_subtest("gfx-write-linear-helper-secure-umq")
> -	if (userq_arr_cap[AMD_IP_GFX])
> -		amdgpu_command_submission_write_linear_helper(device,
> -				get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure, true);
> -
> -	igt_describe("amdgpu compute command submission write linear helper with user queue");
> -	igt_subtest("compute-write-linear-helper-secure-umq")
> -	if (userq_arr_cap[AMD_IP_COMPUTE])
> -		amdgpu_command_submission_write_linear_helper(device,
> -				get_ip_block(device, AMDGPU_HW_IP_COMPUTE), is_secure, true);
> -#endif
> +	if (enable_test) {
> +		igt_describe("amdgpu gfx command submission write linear helper with user queue");
> +		igt_subtest("gfx-write-linear-helper-secure-umq")
> +		if (userq_arr_cap[AMD_IP_GFX])
> +			amdgpu_command_submission_write_linear_helper(device,
> +							get_ip_block(device, AMDGPU_HW_IP_GFX),
> +							is_secure, true);
> +
> +		igt_describe("amdgpu compute command submission write linear helper with user queue");
> +		igt_subtest("compute-write-linear-helper-secure-umq")
> +		if (userq_arr_cap[AMD_IP_COMPUTE])
> +			amdgpu_command_submission_write_linear_helper(device,
> +							get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
> +							is_secure, true);
> +	}
>  #endif
>  
>  	igt_fixture {
