Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA63D12D5D
	for <igt-dev@archiver.kernel.org>; Mon, 11 Nov 2024 00:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2E910E0B4;
	Mon, 11 Nov 2024 00:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="czT0U8va";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B02210E0B4
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Nov 2024 00:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsnCqlnEPxauJZFXbpEwSKPg86YIZKmmDjn//dtwezitq1H2pPCa+7oE+u+nI/NW9NxsfdnE6c+iafZX3WtpnF2GYvPu+QyyAvPeeuAdZKT6+nUqYQcp66gaD0b6+mlI2iaMAbZgI3QSrvramQKqQhoIpZZfR/fwqF9abmdPXihjv2vVVugPD7B7/rJxoDKnRMI0RVwOhoGLiG+1lzkvCF9ZdVp28ap2czHNKtBk6UbpIsqgpju8TTA7m2sDOcJJhGjMOKF8zmth6pA4qD+qgQyVYYezA2vSSwBm3jtF7MOMp8Sid8whv7bflFjDtvnMHYj6mXGrGpiY6/K7ZM3/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZ/dj7UPI3GrN+FZoSSPawCO1e6lJM82hC/XC2TdjBU=;
 b=ndqrqm9U+smSVcEi2WOVsloxztQV9Qurck9Unl/MGhPUKW/9qlJFHuDbQ6HhqAgOL3b+WUsoUahoabH/Mi/I+gMrZSXbyIRjpMX8fPeplE1w+44xcMCkhlf8z32qNSsSb4Y5fLVVWD1IqL3QJ5L0JAkiniVMaJf3G2SvXPS+eQrZ8gWSb/umXdQ5Bpj5Co+6ajRwNRoSG95gpJBEHgr3NssUl6/aEV2+rj2c7HogLZPBZJp2N+Fn+f1/anDaz9OLlI2bP4nACl4LYXjAydOg2U6apcsDbbkJz3walgTrEwwjZe1KP4F9X+f9A/ptVnkbV42SS/TnrZru0pIV/WySkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ/dj7UPI3GrN+FZoSSPawCO1e6lJM82hC/XC2TdjBU=;
 b=czT0U8vae9cPDiRwGQPxt6wgWKfybDbbKm4QCIiedzjWafMbx5+TPOkFY83lYTNikAjdWLPUjCnsopuYehSYIatBU/CdL0HRcaiII7CCOCZsaw9HMuMX6cWtGrLpGY9ADHoy6g5T9UN2ZX2aSfgkloUAosMim2VFAHR8V7MFQ3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ2PR12MB7800.namprd12.prod.outlook.com (2603:10b6:a03:4c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 00:44:22 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 00:44:21 +0000
Message-ID: <f20a778e-74fc-41c1-a699-60eb5bb00765@amd.com>
Date: Sun, 10 Nov 2024 19:44:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/amd_dispatch: add the filter for amd
 dispatch
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20241107020510.350132-1-jesse.zhang@amd.com>
 <20241107020510.350132-4-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20241107020510.350132-4-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0170.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::13) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ2PR12MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ef3977-35ad-446e-61fa-08dd01e9fb06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0pwUzk1T1BwbmJnOXQvakdjdHhmeDVXSzMxUnNsbU96aFRXMU02a0podFNS?=
 =?utf-8?B?ZmtSeFZvZzgrNDU2M2ttVDhoMVZFVXliZXIvMzBxWFF5SGczUDNORmdMblBB?=
 =?utf-8?B?TVpjS1krd1liOU5VK3N6cG51NTUyWCt5Vnd4OUc2K01iNXU3UWlYdURJNUhG?=
 =?utf-8?B?RXF6ZjFHbG1LeEVML3BSbUl0VzVXc2VzUjQ1R2x4cVJseXd0cHRuTDlZbm8y?=
 =?utf-8?B?cjkvVzVzWlB5ckRrNlF5d2x1SllpQW51SHlrTHVERk41aU9MeElTRFA0cWZH?=
 =?utf-8?B?K0VaQ1NvNEtRVjc4UWZmWVg3c3kwTXV6dEhEVDVSWFhyWFRETXd3NXdBNXZ0?=
 =?utf-8?B?R2FGaWRmYnNPZmIyQ2tpU0VxQTFpSldGb29Mc0VKMEQybE9GZCt5SVh1UU1Y?=
 =?utf-8?B?S29xYWIzRjlZakFXTW1IMXZCNU1Vb2NCSlFsSG9iWEprQTdqTDB0MlB2Nnlr?=
 =?utf-8?B?c3RKYmZTM0owbFdmUUl5OHJEbjdzaUJBYWdUZW5GOHRxbHV1TjVyeEVJY2dt?=
 =?utf-8?B?VmVKbHQ0eXRPano0bEQxdFJnQ2VySUdkUis1MEgydG9ONzZpWmdNRW5OUzdu?=
 =?utf-8?B?aTFrVXBxcmNZQUFMVlVvNjFnYUpuckorbXVKYS9NaUZVRlhQZi9yMFJHZ3Rr?=
 =?utf-8?B?clUvZW1uL1dFRTJnUzBiRXVPVUIyV0J3NjdkeWRWRnEyWExTK00vMzBoVkRa?=
 =?utf-8?B?TjR2L1g0SXNtMFVCam1obDNYOXpDcmNkaWlLRVpRMVZXdnZTZnd4UFhTZHJL?=
 =?utf-8?B?VjNaUXV2L29JdnBoS1hiZkpMbXpzcFJwZFBseENuNExpZFJpL2N6Mzk0T0I4?=
 =?utf-8?B?ZE1lRzNYamRlR2xDVVNHSWtwdE1qbW9vemltMDJEOHlpWUlMVWZGSEFoRkNO?=
 =?utf-8?B?YWpwbGJjNW43dUJzbitSTkxJSkJwSXo3T3RlNjNUcVA0N1J6cDBSOE1TbGxh?=
 =?utf-8?B?NEoyazFJd1cyT3kvbld3cS9ROUkySlN6MzZNWHh5aWdIWkgybU91a1hRODBl?=
 =?utf-8?B?NGdXQ2dpOFpha1pTckxDayszTzBGVEk5ZHBBQkVZMGtPd3VGeWlwR2IxOXBG?=
 =?utf-8?B?bWtqRW9FYkxLWjV3QjFxa3dMelVVNWhhNTZiUXhnUDFJUUhuUHJwV3NDbkpp?=
 =?utf-8?B?T3NZSmFXck10bWo2YlJOcUxJd3kxYXRZRm1NQTR4Y2xnS0xOa2RmYTZGV0g2?=
 =?utf-8?B?cEhKcGsyZ25yQnluUThpU0ROc082d0NhWmNpdC9KVWZaODJxSmpvTjgyWHli?=
 =?utf-8?B?RkNKQm52MDFBUlkyOEg3ZnVqenFiN1llb0QyR3BnV2ZSSU45cnFka1lOQy9N?=
 =?utf-8?B?WDFJaUZaQ1Zib3BCZWU0OHJPOFJtVlo5UHZlR2MvY0lxdDNPbWsvbU4vL29y?=
 =?utf-8?B?RVpiSXRhZkhZaG1jTThIK0lrOTFZL0hlYSszZnlBdXdXS2lUQ2g5T05qc09D?=
 =?utf-8?B?aWxJRlRpMHJuRDFIc1VQSHljTllqQ2xoQTN3dWxCUUpIOFA4WXg1SXZPY3I3?=
 =?utf-8?B?akp6SmZDRVhIQWVFb0JZaFljVnR1L2VZc092MGJpOGh5dy8yY0RBSDRwTHBz?=
 =?utf-8?B?Qk5paWVHL21aRjd3WWE5UEY3Z1NBSEZpY3BQMnVxTlZnTTBCL3NMTUFLZkNy?=
 =?utf-8?B?QkFsRTU4RmpJZURpT0JNaXRWZ3ZxMW0zcGppWEppaUtrVmE1QzlBZ1lCbGF4?=
 =?utf-8?B?T0RHQTBaUDdEZUdpQ3REaHhCZHBZdUJzUjVyUThkNy9vZUJ1UDZ3R1R2cEtL?=
 =?utf-8?Q?/nMCj8ZGYwd6j6kE88KTX1A9rSy0TCdQQEadC3U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3hlaFpGVGw5azBScklpOEZqd2dnZmRIeXYrTzdPaGVSL284b2w5SCtMcjF0?=
 =?utf-8?B?U3NkaUt1cVpMa1A2clUydDJjSXd5enc3cURraEpQaUhSVGwzYkROUG5Reldw?=
 =?utf-8?B?UUhrNjYrVDlJa2JyZk9ZYlRsaEtpQ1Y2Qzh6elRVL2paWmJRZnFNWmRzZ3RE?=
 =?utf-8?B?czg4Zkg2MnBDcDdIZ2Z0WGtjd2wyd01jTmE5WWtsZ1ZBU29BdXpqazdyQXBx?=
 =?utf-8?B?OGZuWWtNd1RZQW0zUXN4QjhzcHBobFM2WkFvQk8yOFZrU2NvaU1XcUYvS09t?=
 =?utf-8?B?V3lwTlZQWUNSVkR3WlcySXJIM1ZpK1RxWDFBQ21zTlRITCs1bUVWQ2dtOUFE?=
 =?utf-8?B?VlZpNWNla1J4dW4vc3Vrb2JIME9aVVJqTEh5ZFVLdmlVam92UHRDaWJDNVFH?=
 =?utf-8?B?QzRLN3VQdGhrTjVyQXZvUW5oVm40MHZlOE5kWVVJa1pTS1ZYRXFQMC9Gbyt0?=
 =?utf-8?B?RGRkMEJYdVNMRVF3QzdmaDJjS1hxUlhPTEd1QmlWZjZhdytKYTRJajhaM1RZ?=
 =?utf-8?B?NlRLR1prcDh4TzcrUVRtZllOdFRYR09VMW5LQk5pTTRYQXh4bFRiNjVrVFZm?=
 =?utf-8?B?SHAvdVFaYk9HeFFmN3MzNDlwUXBQcDM0K2plKzNpTDJSTFRYM2RIalA1d0dK?=
 =?utf-8?B?Y2dpbVpiQmNRdVFPMW9rckNSejFMVjgyc2NWSXV3cllBcWZuaDl3bE9qc1px?=
 =?utf-8?B?ZGk4ajZKYWhyc1UzQ3hheUpNS3hrOVo0bW5TeUtGdGZXRWl1TG9jaXJ5Vy9Q?=
 =?utf-8?B?RFVkUFYxaHFlajY5cFl3SUpzK0VIRmNPMkY1eHBWRlp1UU14U2gvdkZETnVH?=
 =?utf-8?B?ZzlEc1dhd3hMZURtQW1tbUJUMlIvdWp6MUw3Rm10SnAxb1RwY0svOTVKTUtv?=
 =?utf-8?B?TTY2VTR5cER6ZUd2NitsREJCbzg3TytWZU9zSzVCUGZKcGZTU3lyb2xWeGJi?=
 =?utf-8?B?MkVZRlhIdXRWY3ZaQ3k5bGl3RlFPQWlhQzB1Ny9vQ2NCcEw2OVFqTm54L0ZI?=
 =?utf-8?B?WkRMaDU1bWs3UStvK3J4VWU2NnNVdzZ2NVU3b3AxTU5LOXF3OTB5bWJTYkRW?=
 =?utf-8?B?K2tIWjFNU085cDAvNHVVMTZaL1lEeWNQZmRXVi9LT09WbEczUkltQnNSZTZx?=
 =?utf-8?B?TS9KZjN1cHg0UlFhc0R3M3NLeUJFMlNZL2tZWk53a3pBajhCUmF2bWZYTmlP?=
 =?utf-8?B?cW10NXkzQjE0V3hVaGU5NmJ5bzN1L3RkVnBoakd0cmNnakFNMlk4QWk5cm5R?=
 =?utf-8?B?T3RESnZKTWx4cXNLbk5PS251ckUxdVkybmJaZCtlaDFsQlRPQ1ZFOCs5WXNY?=
 =?utf-8?B?YmdaeC9ucUhyeW9TaUg5Tkc5VXNMV2pYb0RhRnBUaWxDSHVqR0h0dEJpREZj?=
 =?utf-8?B?elJXYmpXSjBBK3BNWVpLcWZ2WVBvRy9vMHB0MmxJTWtXRDFLT3NEcnUwRFpo?=
 =?utf-8?B?V3Iyd2VEdUY5ekc2S1ErQVdUNVc1S1c1KzJINXhuN3NodmdIQ2VmTmlJR3FL?=
 =?utf-8?B?VlRFODBOY3VSNlcvNmFSb2F4Ukhpa3lMRHhFNEJRc2Fva0VMazVsOTZKQnJU?=
 =?utf-8?B?MHhjck9YKzV1bTJ5WFBqODNRa2FwLzdJYnJMUVd0S2VXWkRBY2x4RHhMS1Zh?=
 =?utf-8?B?bTEvSG5BYXlyQWhOQy9MMWJYemtuajRIU1FWdmRFZWl5YlBrOWVsRmVydG9a?=
 =?utf-8?B?WVVnMDdFN0JhaEdWYUFMWkRaTjJDZU1YMFJmTUpPR2NZOW9nWjlTVzhGbmJZ?=
 =?utf-8?B?QlJaMlA3RHhnSlZVZmYxVXg4UE9xS0R2UFluZGtLNk1ZL3dJamZDZmxkRDhi?=
 =?utf-8?B?cENmNU9Tdkt4QVRBS2lnREFOL2hWdGNmWWRkV1RFMDYwQVJLY3F4d0xpUVVC?=
 =?utf-8?B?TEhQbEJweWNBMUhGVkYrVDZDUGRSR1BvaDNGQ08rZXZRYzJVNUluOU5UT0xP?=
 =?utf-8?B?NGZNckxZQ1dwRThuazRjMFVzZ3BFMjFsUFUxZkE1RlEyazhEV0g2SUZoS0Nt?=
 =?utf-8?B?cXNHTnFUWks3R2JwSmZvWFBuMkNIa3hBSDZKWDQyQjFIVkZuUVlFVkdVUHFi?=
 =?utf-8?B?Tzg3SkUrWEtEYWhDVEJsWFM4UmIwV3hZUjkxQUVFRVhEeG9yanZ5U0hDcGgv?=
 =?utf-8?Q?/qebkRJhuGmUMuRngcT7EGm9H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ef3977-35ad-446e-61fa-08dd01e9fb06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 00:44:20.9972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viWqM3SMjAD5L9QrucmHyVT+Q3fLzvOxSKo/RVc+ixq4GQoKVyUVqy9lC/N0pdBe+ELgeNz7T9WN5IUfrXV/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7800
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

these 4 patches looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-11-06 21:05, Jesse.zhang@amd.com wrote:
> From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>
>
> Check sysfs reset mask before enabling certain subtests.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_dispatch.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
> index 76b62128d..23d07561c 100644
> --- a/tests/amdgpu/amd_dispatch.c
> +++ b/tests/amdgpu/amd_dispatch.c
> @@ -116,7 +116,8 @@ igt_main
>  
>  	igt_describe("Test GPU reset using a binary shader to hang the job on gfx ring");
>  	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX") {
> -		if (arr_cap[AMD_IP_GFX]) {
> +		if (arr_cap[AMD_IP_GFX] &&
> +			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
>  			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
>  		}
> @@ -124,7 +125,8 @@ igt_main
>  
>  	igt_describe("Test GPU reset using a binary shader to hang the job on compute ring");
>  	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
> -		if (arr_cap[AMD_IP_COMPUTE]) {
> +		if (arr_cap[AMD_IP_COMPUTE] &&
> +			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
>  			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
>  		}
> @@ -132,7 +134,8 @@ igt_main
>  
>  	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
>  	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE") {
> -		if (arr_cap[AMD_IP_COMPUTE]) {
> +		if (arr_cap[AMD_IP_COMPUTE] &&
> +			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute")
>  			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR);
>  		}
> @@ -140,7 +143,8 @@ igt_main
>  
>  	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
>  	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE") {
> -		if (arr_cap[AMD_IP_COMPUTE]) {
> +		if (arr_cap[AMD_IP_COMPUTE] &&
> +			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute")
>  			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING);
>  		}
> @@ -148,7 +152,8 @@ igt_main
>  
>  	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
>  	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE") {
> -		if (arr_cap[AMD_IP_COMPUTE]) {
> +		if (arr_cap[AMD_IP_COMPUTE] &&
> +			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
>  			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute")
>  			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA);
>  		}
