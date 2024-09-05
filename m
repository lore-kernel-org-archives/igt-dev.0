Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D92CE7A9F
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 21:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6200910E950;
	Thu,  5 Sep 2024 21:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oLfEbDGT";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42E710E950
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 21:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVxCDHultiTOqZZ1wMuRvt0AgomWQuO5NTC738mW+g7zMfan5h8v5jnJmTpBh+nJMiwMfkFxUb45CcXJ7oQ8+lMrU6dI/h++omAkxqkEilMfL0tXCOfCgLUro4Hxq5kAC76Fl+Mo0bw7ciy6wKMsV5t4Cl3Vy0bs1d44b2kDKoDzlukgT9JDDq3C0zR04H9YeqH8H6ccyH4eNSR0+GEwvO7qtxPad+AzfBifyB2CofXnr65BQ08yWmBJvDIGqktZm57nQUrWEOka+yG1qk/ghmblQOFIWrK9pHfCPkaCJJmQiLOlHaPsiJCItnIb5QtKKDJTbIDxYkzsNFUkvk5MZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUwBFKlVJfvxVNn4jPGm3ON4dBgUClf1huJVnrqqY8w=;
 b=MGCmbgZObfrwwBEAJ1qosp4RhGj1gXvcXs4vzQndHm2xxxO4n/K9mxx8txqJhtq7uDfiZLxkMgjNdKF+j51cNI2r7zopFLrJnoiQLR1oS620w+LpiDY+Xb92MgGv4BfkllDP96LZfaVKT37JO3d48qc5bbpt/Bdwrywk3ek7NmD/8271JgujUKqcvU6JqgK9XZUp9WX/0ROYrulxyO25iXi6ryKZcmRZAH+JNWWIoxuU6YWxV123jBE8JvtPo1azVUvyhDLMZ+24/EITX3x3fSVjby2LhjRJjgEPg/eNinRAGT3kneIPPt8DiYhzx+gtTNAz+4OxeDSbD0ikW2bknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUwBFKlVJfvxVNn4jPGm3ON4dBgUClf1huJVnrqqY8w=;
 b=oLfEbDGTt3GM8L3zGNyAlpJ8yutnsSL1HgN/hlZcWehNjvYHQtNRa+nP1szcq5FLvu3pmVyC4yuzFxr9gOWgSbuYN9mCeqb18p1Z1BVrVoNuoef9g4neXD92erB7He5d1CK8VWyteJqcB++EyVFPUC20IZDKQ3kJc6sqddNtXCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Thu, 5 Sep
 2024 21:20:42 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 21:20:41 +0000
Message-ID: <35bed225-69e0-48d9-9f88-b4154381407d@amd.com>
Date: Thu, 5 Sep 2024 17:20:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: fix a random P-state test failure
To: Tim Huang <tim.huang@amd.com>, igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, alexander.deucher@amd.com, jie1zhan@amd.com
References: <20240905100750.521280-1-tim.huang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240905100750.521280-1-tim.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0158.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::16) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MN2PR12MB4094:EE_
X-MS-Office365-Filtering-Correlation-Id: 51077865-e6ef-4f91-b37d-08dccdf09887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUs2ZkhyRXBNQklJVGVOa0VseU9Yb3JxSzhPR09WSTk0UEl5aVFqemNnSFpI?=
 =?utf-8?B?MnpiaTFUVEk0TlZweUNwS1ozUGN4TUZjLytWYWJBZVMyUC9IOE1rRVZzK3FL?=
 =?utf-8?B?VDIvK3UvMnJGMGZtRi93RE9FK0NsckNrbk1ZeUpFandhSHJLWEQrQWFLa1NS?=
 =?utf-8?B?YkNxWDFBVldYMFVHSDBCbWZFTG5kZUZOUm0rR2NaakJ5SWxUVGR0T0xwTGt0?=
 =?utf-8?B?eEE5aTNSVENESGxOdWZrWTg1ckxOa3JIMm1VSDVjVFgrOXY5NDJUL0VIOTRY?=
 =?utf-8?B?WUZwaDB1K2hvTVpYN1RydkVLVUZ0MG1wM1pMYUE2MmUvOHZYOEN0TjlMa05s?=
 =?utf-8?B?ZWhFaEF0Y2JvSmQxcHZkMnlXNVJUb05ybXJpMmdYRWZPTTRKQTVKdDNzcFZy?=
 =?utf-8?B?QnV6SmlLZDZUVzhlT3orN1BveENIWTRIUTZMbGUyYzJuV285YUFxZG1VaW55?=
 =?utf-8?B?TWpWbEg1MURKZCtzRjBHYkF4QkVhL2wzaCt4bk1CbHIzSkcxUDZtQnFQaC94?=
 =?utf-8?B?V0x5UVBUVVlhaEFtOGpYbVlmeGhUMm8yWnQ0aW9ad2N1bktiVEZkTFhDSXE3?=
 =?utf-8?B?ZThUN2FPTnVkVU1hWEtuWUwyVnEwRHpDMEJ4TEM3MjZkMXhyNlI0RkZ3OEl5?=
 =?utf-8?B?em5lUnBLTVdtRFNBRzlySXhJMk5jdG9zZ210eWdyRG02L3pLY1Q4MVFWSGd5?=
 =?utf-8?B?YldwUjc5eFBCUXNiNjdmNFNYN3Y1MUJIQ1hCYVJsN2FSMVF1eS9vbWU2bnJl?=
 =?utf-8?B?NHBvREROUG40bXQ5a1dBVzhWcDZIeE1GanZHZFUrWmFpZldYK3hSMnJtblZY?=
 =?utf-8?B?dG8yYmcrMDNaUFZrUjFxejJ2ejRLQzBydlkzRHRWaWVXRjFlaDc4dStVNFk4?=
 =?utf-8?B?M05FalRhY3BkNm9jWVRZRlRHY1NaQm1yOG9DYVhNV2JaaDNEeHEvNjZaRWdn?=
 =?utf-8?B?eTZ1SGZ4WUtlemVzbTg3K3JTZ0tSa2c2c0RlYUZka1o3RzMweTl5LzlGcTBt?=
 =?utf-8?B?S015bHEzZDVGT0hDSE5xU0Zya0xTS0FyTmdSTGFEMk9WeEpzSjNxOWwyNS90?=
 =?utf-8?B?RkRyTGFlSEkyNFUyMjk5cnA3NHR3eE1vSFZWaXNoRzNKeEdqQkdPN0gvT05w?=
 =?utf-8?B?Q2ZoWDkzTTlNb2V2N2xQcDUvem1ac0FxTjlxd2w2bTZsZVRaTXVrZ0hDRUpG?=
 =?utf-8?B?WVg4blRoOE4vSGVoOVNGYVdYS1c5SDZBUDgrZ1A1djNZNFlvR3YyREVrMnh4?=
 =?utf-8?B?TW51T2N2WjVVMkZDVVJRRkEzcHRuMjZvVENobHI1Tm9JQWwwNXRQSlZ6SWZi?=
 =?utf-8?B?WjR5OUt3WlNmejFpUDJBTEw0UStFQ1pjTE1neS9DUGJPdXhWU281UEhrbjNn?=
 =?utf-8?B?QU96YnBkdlQ5ejlXRDNiRzB2VWRXYjJXUk9qZ3gwZnNQN2s2YW1vVGZIMEMv?=
 =?utf-8?B?cFRlVmx0aXpBeGVMSmxJSjh2M2lWMUY0ZkxsWGJ5cFJIem9DQkJKY3lHNUpW?=
 =?utf-8?B?SnlQeU9GVWxoMWxQY2JnTWYzY3MwejhVMGlOOXVKdm5UQ1lUbHRhT0hZZHFu?=
 =?utf-8?B?cThIUE51a3ZmUUx6Z0hEZnZQR3dQbDlRNEd6eU9rUTF1NHgyWVJieWFQUWtO?=
 =?utf-8?B?dzlGK1FqQVVEc0NuWXhOTlZVOGNhQUJxTFhUTnUyNUprSjU3Z3hua0lBSjhz?=
 =?utf-8?B?NjJMUnp4dUJxL2JVMGEySVFNbVBxa1pQZWwwakVnVmh1eTc4MFNWQ2RCVG1z?=
 =?utf-8?B?c1oxYk9yVU4xNU15UEdnUUpoVkE3bDBRVmI4RnU2Qnl0VXQvaGNWUFp1Snor?=
 =?utf-8?B?VS8zakdQT2QxSXNQT3J3dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWY1THMxQkdhS2RmOUJleEhTYnRrc0lYaG5pSU1RS2xIRU51T3dKSjZLdENK?=
 =?utf-8?B?V1g5VW9zTm1tcDhMa3I3a0F2QVFTcldNOXZxcWJWV1hDdWZNNmVLUkxyQzlC?=
 =?utf-8?B?Y0w2THVxK0p4NUJ0ZkcvaFMvOGJ4YUlCVXdjZkpjelVWSGNhVVFpNzZKNjRK?=
 =?utf-8?B?WVhUOVV6TGxqWGx6Mld0N1B4R005cWZyMjdldUZIa2kzUkVnL3QvUEhIMDJl?=
 =?utf-8?B?Sk1HZDVhbWNZSHVCamhuaWV1MStNZDlzbThUbjFlKzUyOGpPRktPRTdYVS9C?=
 =?utf-8?B?bkNhM1JPdFdpenNnNVVMVWFYWTBVb3M5SlBhYU52TGFFSVFqQ0dQaDFhWnVi?=
 =?utf-8?B?VnBrakFTUVJlMWpDVVFxc2dxeE9yQWNobnNML0ptc0ZLRjQ0MGJ0MURMa0x3?=
 =?utf-8?B?ZmR5MllZZDljQk1zSFZyWk5xbktPNFAxSmFFSE5Nbmd4SXA1VkVJdUNldExi?=
 =?utf-8?B?NDJ0UkRuUkdnNUwvQ3RUZnhRdEhMOXRXWEovZjBVT1lCZlBaaEU0U3J0K3Yv?=
 =?utf-8?B?ZVlLc1hMUlRsd0d3VDA3K2pHMzJ0dHRwMlNwejcwaExYY2ZieTUxby9QSWY4?=
 =?utf-8?B?UmdjQWpWU3h2a2NocDZzQ09hRHJkKzk4Rkdxc2R4V1hLSzZIdnIvNWdYRXBQ?=
 =?utf-8?B?MkpzaHdMQkl2T3hGL0pyYTVLaXdvN21jQ3Q2WWNxZHVQeFg0ZWN5dHZCdSs3?=
 =?utf-8?B?K2pFbEFjZDVvRTZDVTVzSDJack55ei9uaFR1Nng5bTFLcXp0a2JVazNOWHk2?=
 =?utf-8?B?RzBTTWVLZlBaUXVNeTFtWmFNd0lOUGQydFdoY2Zyb3N3N3p4Nk8rSUJWL1VS?=
 =?utf-8?B?blYvU014UEp3WVkya0RqWEJvY3YwVG4yK2NwbEROd21aTTlxMlZCNjFoQk02?=
 =?utf-8?B?NFpBaE04T2dKL0RLV2NXNjN1UURmVlNSMGQ5TmtVNnRZRGI0SmFqaFA0RERG?=
 =?utf-8?B?TlZibFVITk9GZ1Q2YitUWU40dDQ2TThrRzBUMEFHZjVkaHBab2Jkc0xoek94?=
 =?utf-8?B?ek5GakpiM2t0ejdZdWlWN2VFMnBKckV5Sm5sZVBEL0sxTHhwVGxnTlRBaFJs?=
 =?utf-8?B?N3lpZlNrTVFlUnNyWHorWDkwSTlwVVlWU2JJV0IrVFdzMDMxSFc5QUhmNGpk?=
 =?utf-8?B?RVNsay90TTRONUNSUHVGamI4Z1VpaWQ1RGRpbzF0MVlabnhWRytLQ3lYRllp?=
 =?utf-8?B?OHdIZkFWNGtoYzZSdXBkNU1oSzBuazVzdnhUcmF6VE9MZkhUTk50RDRFVVlo?=
 =?utf-8?B?V2doNTNDV3k0dXJHcUQ1Z0dzYkszdGR5aEJJVk83VFB1Qjgwd2xDZC81L1hl?=
 =?utf-8?B?MzNYN1hVcHVWK2tVN0o5bHowQmpHUXFESkRFbzNpODBuTk5qbTBGUmR5eWpj?=
 =?utf-8?B?c0o2azJ6cDg0OENNTVpHRzZYM05mcDNZdEtYVG5TSkpHVHpPNGV0d0RTSmoz?=
 =?utf-8?B?akY2S2RPbmptNWQraEo3dGNVUVFmTWFiZm8razBhVkd2d29ZOTFXMi9XMm9G?=
 =?utf-8?B?Rmd6NHZINUFtYVF0eXN1TVFRWlBadzdrMjZsd3MvMnhuSTE4RHJ5NHVacDBL?=
 =?utf-8?B?Ly9qazVlK2ZMTmJ3OVE2YUxiaTQ4a3dYUEszOUJOamNUMDZJVjFicGFlSFhP?=
 =?utf-8?B?QVBSekpqYlUvVnoxeE1sMVZ6NDR0NE5hcUFDU1VLZWhRODJYdUlSajVoQUgx?=
 =?utf-8?B?K1gwK2gwdHdZbUpjUGZaWVhNUktHWXJlMmxFb1kzWWN1V1ZSRHhWUTV4VVJP?=
 =?utf-8?B?RFdNTVNiOG10alJxb1RTYnVFME12NHpBbVRKOGE5aXQyTk1GNkgwWmNETjZE?=
 =?utf-8?B?emd4aW1ZMnJVVXpXOGRyeitBbUpUWkJkazFwYnJKUHFqd0xMaEFVcnVRNUpk?=
 =?utf-8?B?L3ZCLzlXbW8vQkluMWhDVVk2ekRwYk5sYk9BWTF0Yy9VMEVVVWdaTzE1amU3?=
 =?utf-8?B?Tkd4WndGTWpLUXY3WFk2bU5TYUlnVnRxMGFRWDBDYTlrRTRmaE1neXNRLzc5?=
 =?utf-8?B?S080VVVJYytwS0V4dEpBWGtlU0g3ZG9PT3FJRnoxMElzSHBqSkVaMU1QMlVv?=
 =?utf-8?B?Ykpya2hsS3JXcExnY2ZkdGdBMzNMZndEL0t2eHh0dVIrOS91ZWxDbEdlU2or?=
 =?utf-8?Q?LjDz/fCdSJo2/ujbae3b/PYqi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51077865-e6ef-4f91-b37d-08dccdf09887
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 21:20:41.6959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZpvc4JCF0HvcP8VISLrLYGJ0/x5KhvokCHdPM594wb9rrKXQuVP1cOBPlzF2MeHtvQDATfs3bR31JsIkWW+Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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

Thanks for fixing this long-standing typo in the code. It’s been around for quite some time!

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-09-05 06:07, Tim Huang wrote:
> We should use the current_pstate to compare
> with the default UMD stable P-state.
>
> Signed-off-by: Tim Huang <tim.huang@amd.com>
> ---
>  tests/amdgpu/amd_pstate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_pstate.c b/tests/amdgpu/amd_pstate.c
> index 9a7873538..2bc794252 100644
> --- a/tests/amdgpu/amd_pstate.c
> +++ b/tests/amdgpu/amd_pstate.c
> @@ -23,7 +23,7 @@ amdgpu_stable_pstate_test(amdgpu_device_handle device_handle)
>  					AMDGPU_CTX_OP_GET_STABLE_PSTATE,
>  					0, &current_pstate);
>  	igt_assert_eq(r, 0);
> -	igt_assert_eq(new_pstate, AMDGPU_CTX_STABLE_PSTATE_NONE);
> +	igt_assert_eq(current_pstate, AMDGPU_CTX_STABLE_PSTATE_NONE);
>  	r = amdgpu_cs_ctx_stable_pstate(context_handle,
>  					AMDGPU_CTX_OP_SET_STABLE_PSTATE,
>  					AMDGPU_CTX_STABLE_PSTATE_PEAK, NULL);
