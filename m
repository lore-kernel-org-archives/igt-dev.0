Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6F7C2BD09
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 00:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DB510E66A;
	Wed, 10 Jul 2024 00:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ny4Zbqga";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3B410E66A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 00:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAEA3S0CkbMY/AFMU7CXssRQccO2nmb7kPtsRlsD2AdUnoMQLR7POZDecXUuUPZ3V3jzCpllpIu1olGpDLjhyctCp/O8tJLmFFBF3DijQ4atY0j6fm/S/mW9ysFQWrYs+krCYwgsQpB7SbCP7G1YSsgfTdcN6vV2qof/LnaBYwfrBi26niATDhXgVGBw2Nyc8NKp3+UUK+fNzC3Hpnn/Vx5xYJoGZK+zFvkJTbgCm88q+F8EPN0iYeQsJE0g1LB0ILmY0fVpJc65p36DI5aRqEBHyPBpmjgETqpoogPyDHDAWW8+gEdT5PO4d7S+m+86t6FPsxEvfYGfnmNIBy+wNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ngMAeDauA5fdGboIyTqc7Bp7lYFYek9jtOr6QZSipU=;
 b=Pk1sDc7WA4Q59t7JeRKczduEX8iKyZKgEkJDMKq2vUvhJiCY58grtEfKwwjWK9fbnECG9EB0Yt3B4yR9j15rzIRBbSFTJlTjQp7ZbgfxpX+Npa0pLpR1X6bY/CQZqmEvtaYaAgOY8Ctcq3Dgb+yAbivrEqHvpKJInkp2jvoMXT5hrhSLmjEmPL2dcTHyDSKPFUYFBBK6c4FDeGFBNyzhm75UU7FCeIamnZTYdlGArF7X4Of+FBpjKSZnaC99B0xiIlG5mJt8hmb1owNU/mEfHT6ptq2BAXJtPM80o+AeW+C2NuTHQE3xFCiBIh7AqYVif9ZRTxdISE5zYdwxfduksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ngMAeDauA5fdGboIyTqc7Bp7lYFYek9jtOr6QZSipU=;
 b=Ny4Zbqgaza+w/Vgt5/KzT3HQGV8TawFBJOVv0PVbDMHY/0VMVPL0YAAtXVS/5EXxLovwjmbtRvnPuvbiFxQrs7sxCYC1muqVIZLB1gJ+cpxtMNDBnseqDYHBK2kK6knU/sd93KSc3CywqomUkTWq/Ne9lrR8qiG0KyRJujIX5UQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB5709.namprd12.prod.outlook.com (2603:10b6:510:1e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.33; Wed, 10 Jul
 2024 00:38:19 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 00:38:18 +0000
Message-ID: <baf81abb-6bce-479b-a157-07f12bcb1e1d@amd.com>
Date: Tue, 9 Jul 2024 20:38:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: fix amd dispatch issue
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240709082322.1873739-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240709082322.1873739-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::14) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB5709:EE_
X-MS-Office365-Filtering-Correlation-Id: 42bec004-97ca-4d4e-b8a8-08dca07897f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDkvOWRWZmpQL2orMnhJaGd5U2Z6ZkpkaHNFSk0xSXgxUHBOaWl2c2pUWlp3?=
 =?utf-8?B?ejVWU2JKcWV2djlRbjBybjBFVm5lY294cXhVWk9PenV2dzdPNkpRRXhMS0tx?=
 =?utf-8?B?NS9mSWdDUElXOXdmTkkvY0MyTGRLY0hrUUM5ZzQ4Nm9zN0c0UWdoTmxzTm8z?=
 =?utf-8?B?SnVseUt3U050eTh5eEFXVm9PSG5uclNpWnJpMG8xVVZoaXozUDRwamMrU3Nt?=
 =?utf-8?B?cE9WNytqay9JY0c3S3R3UlVtTnBDRjF5NUtRSGdTN09FRmZiaW5jd0IwTHNp?=
 =?utf-8?B?RW10UmUvc0o0WXV1WW9zaG1iQ2hNSHFLaE9QazhoU0lrMXA5RndNVlR1cFlz?=
 =?utf-8?B?QUpUUmZraUdqdCttMVJweDBLZFVzNkc3RGRKRDhZbnZqOFpwdjl3WWsvdStj?=
 =?utf-8?B?Yk03VU1zTTZ2MFh4cHE0eUVKK2V5TWtpbWJVbnE1a0FxOXZZYXFTSVFpUDFU?=
 =?utf-8?B?VXFaOXRJUUppc2doWXpKZ3RNMHJKSEptZXlFRWl3ZU03aTg1STZDSWFEL0FT?=
 =?utf-8?B?SWdDK1ZSc1F4cTBjM3lYanVZcEJLaG02b1NIZzZicVNlMVdtUjZ1THd4VHB1?=
 =?utf-8?B?TWQ0VTBPU1UzZjhzV2JCUUF3Y01QRFVvVWFzUnZIMzlvTkRpOTdKYkNpYXlO?=
 =?utf-8?B?M0Q4aEhYQ1E4MmhPZVhieFFkUHZkU2xXd0RaMXpTSnBhYkdlenVMUURUZ2Ey?=
 =?utf-8?B?QkNOYURYV2JuOEpjTUhRTUg0Sitzc3piUmN3aTc4Y0kyRzNGZFY1NXYybnVS?=
 =?utf-8?B?ZzVtdzJja0N3aHM3MDZrK0lOTTJUWXJ0em5hdFNSTEpOQTRoK2ZiOGpIcEVH?=
 =?utf-8?B?S2ZaRm4wRXQ5UVUreTN0ZytRWkVFeW9KSWNIY0xmbWRqSjNkSnZyeUJCUmZn?=
 =?utf-8?B?RndkcmJheUxMVVFJQ21lREVhZ281MDZXdWViV1p3NDZXZVpycFF2eTVPZXFQ?=
 =?utf-8?B?V1ZNd1NhNHJtekVWSjFqOG56Q0pHYmFSRWh4SWFQcDZqNXJScndMaVlONFNQ?=
 =?utf-8?B?NGNGcENRSGhQSjd1cnNlRG5PeVFHOWFJaGdnTGR3WDZoLzk5WGw1MWpZWjkw?=
 =?utf-8?B?dWtxa3hoSkdHODRxOVNPbmFyV0FZeVI3NHNyZGhRQTZNRWZoRVJrUkJEUWFj?=
 =?utf-8?B?TWkyTXYrRmY1bFFlbTJSL04yeFFFQmZTbGlWUG9zQVJ3eS8wOXhlTHorNXVx?=
 =?utf-8?B?ZzdqamdpTEtQZlQzbTZHZ1poWkJiWFlBR3pVbVNmL2VnRk9WbWdzZ1dwOUgx?=
 =?utf-8?B?WEJpd1Y3WDBNOWs3MC8ybTU0aW5Sbjh0bXN3WGk0ckRrODlSMmNObWkyc3lv?=
 =?utf-8?B?bVhPUXF4YitvTDJ3bVRlTnhWODl3RUJ3aVE0S3BnR084eDk1ZmJFTHF4ZmlF?=
 =?utf-8?B?SlU0Q01ZdWZuZWJLaEVLcTJKUzNjNEgyS0Jic1JYYUVuU2ZWbnZLYTM1Z0k4?=
 =?utf-8?B?MzFaeFJZZ1AzRDZ3bXQzNHgxcjVuL1RxRXpTVkIvS2tjdEl6SGtlZTlwZG5a?=
 =?utf-8?B?NE5nVFUvd204VDNtRnlocjF3ZEtQWmR4RG9LUVRNMXBYVzljN0gzWXd6SGRp?=
 =?utf-8?B?THdDSkpEM3dSV05xSGZIRndaa1VKSGFNKzlNdHorN01ueGt2WGtVUnNIS3F4?=
 =?utf-8?B?cnd3U3o1eUxibmRPa2Zvek5FdUtFdHdSdUo4aWYyYnptVE9UeFl3S1czYmpt?=
 =?utf-8?B?aEJsWEVSelphRFF4WktNT093bCsxN2RsZW1GbWVrSmJDeDNIR09NZStoeUoz?=
 =?utf-8?B?d0l2bmQ5SHRxTHdWcW10ait5OW9CSHI1cm0raUlpWE15WWgvdFcvRTZNYlFX?=
 =?utf-8?B?bTBpaHhORllSM0RpTVVlQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b044U0ZDOGxUUkZhNWVHOVRCaVhZQ2c2N1dBdVYvSDNHT0c0MFVpVlRLSWg2?=
 =?utf-8?B?UjB3dTY4SXB0cVVkcE9PMXZ5aGZnZzRJQThiOW12RU51UGpEZTA3QlZGWU5h?=
 =?utf-8?B?OW90TTBROWRIVktnbEN1UXRzS3lQR0Y0R0Rsd2E4VFZwa2ZHOTY4b0ZBM01W?=
 =?utf-8?B?VUltWkZrR3IyTEFFcWM4UlhRRHVSMGxFNitFMlVDK0xVSTdHd1pvL09pOVlP?=
 =?utf-8?B?b0JWMUN3b0srUUZiV00zbHd0VnBGb0srdlhTWjJicWd4KzBXNk85U3VuS1c0?=
 =?utf-8?B?dlF0MTFieDdQM1RKdGJ1MnB2QXlDVjZpbnB3UGpZWjJGZVlQTWhEcGh4NUUx?=
 =?utf-8?B?RzE3bVVSZUdveTdXdlo2bzBMVUtVams0NDNHS20xaE4wdks1anJNL0Q3NnU4?=
 =?utf-8?B?YjJpcVJJcjFOdUwwN3ZxQ0x2RXM2bEN5bm03cGVvbCsrUUJHaFhNb0pGUTRh?=
 =?utf-8?B?eFN2a29OLzM5L0hYM0xEaU1XdUMxSzZaWTR5eXFzWTlTNGt1d2xvbG9zOXh3?=
 =?utf-8?B?VnAvaTBOYW5mRXhwSzVRTlVYTm9NM3Qycy8xdjZjNlduYjdCaVlaN2RadGs0?=
 =?utf-8?B?c3U2V1dRT25EOWJ6WDF5UlJrV2ttR0lZaUhGUkViOHNTN1A1TXQ0dXJjamFk?=
 =?utf-8?B?bGhPNk92ZWRQNDhkaWtGb2Eyb3RNU25XL295SWxJRk1DYjFkTFpuQWFQaDBG?=
 =?utf-8?B?VUtQVUVBQ3pwWWRqN3orZUx5eUtib0NZdUQwVTFROFlkMTRINk9uOXdRenZ5?=
 =?utf-8?B?ZGZDSVcwQ0hRL1Y1MW05QUk2OHBaT3loRnFLcnUzanl5c0tZL0xLTXdUSzBQ?=
 =?utf-8?B?S29OU3JEaEYrOVdQZ3h6dldnczRCZjlOUUJSUy8wcENNNzlWelY2S1liUUUx?=
 =?utf-8?B?U1RXT1cxU0I4ZEVEVS9yNGx3MzlxaUlOUlNGaUhtUTQxaFdpbUd4K2VvOTI5?=
 =?utf-8?B?RU5wZGRxTUZzd3hHWGNYT2tOR0tFcDBydDRiUVMwUVVZTWZhYmNRdE54QnVN?=
 =?utf-8?B?ZEMwOTZyOTIwT0tQRGJjYnRDcUxTWkxDZWs3dUc1UVhnVXBhWUxSeGZ5NGlY?=
 =?utf-8?B?TlFLRzB6TVBNWjhXbVB6dXJPeW1qa1lKZTB2dzlQRmVpdkRYN0lORWpEMlFy?=
 =?utf-8?B?b3REdjNkN3M1OHhsRWNZSVh5U0JDMGNWazBEV1RsRDdpQk5UazArakJVVUdz?=
 =?utf-8?B?enN2SmxnMVBIWmRndjZIVjRxeGs2S3NPQVE4NmhvTVBlWUl3R0F6QkFvYUQ5?=
 =?utf-8?B?VStUcWpWVXdGZTkvUjdKYXRPRlF4SW9RdU5vOWxpbmY5dUlWbUMrbFBRSnVv?=
 =?utf-8?B?b2R0R1VSd2RQT2dCQ2JYTGRaWHZFVCszTXpvazJHV3JLYml3Vnhjd3pZV3dm?=
 =?utf-8?B?TjlhcEgzcEcyZDJhdlVCdHFKTWl5NVVEUEwrTWN0NE9RNTlHQ2J1Y3A2UzFF?=
 =?utf-8?B?Mko0QkhGcHRFNkhINkdQT1k2Zm1ZQ0o1WU5oRUgzY1lRU29VWUNhenhzeXpN?=
 =?utf-8?B?TS9EWFA1VUp6VVM5aTVOU25GS0dxRHNyTzk4a05uNzNueUQ4UkRJeTRNc1BC?=
 =?utf-8?B?dng0Y3RNWHBwbVVMbnAvTS9aeVMrU0c1TVYxWWNFNFJIL3JuWVhEUmFKYkFP?=
 =?utf-8?B?Z0RRZ1ZaMHk0WGpqMEJwa09FRWlCK2Ztb3RaS3VkZnRYZnZyTVlVTyt1eTBr?=
 =?utf-8?B?U29BbURVZVRWaE53ZTNydzltdXJQbXVTaDAzaUpaNnR2RGIxcDlDb28vZjVt?=
 =?utf-8?B?K3prOHVTMXMrVHJ2M2pDYWVOd1pQUWorUCt0QTNKZU1iVEJxaUl6L2hkd2lo?=
 =?utf-8?B?WEVoWWdBczhnMjBnNGxJYitFWFRmeXNPb2JhdXVKSEJScHZwdGtxOG1vYXhu?=
 =?utf-8?B?SE1vZk1WWldVSWp6eERPbjBJRmUvWm5icDRyRGV5NXR2WitONDM4SFNuaS9k?=
 =?utf-8?B?dXVhMzMzUEZlUkQwUjUzYjdNNCtSRzc3QWpYWlM5b2tZUEVpWDQ4eGpBcGli?=
 =?utf-8?B?b0hiS3lNSFlWRFlTRTV6WjNuTG45bDRkSm1QeFE4UitEZHdNMW1UVU5VVU1m?=
 =?utf-8?B?cU5SZHlYN25lTTJya0VDaXJGaWJHS3RycEJ1S1kxck9jazFLTGwwT0UyWkdJ?=
 =?utf-8?Q?s/uSEEzquQTq1XTuF/JlUfMqE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bec004-97ca-4d4e-b8a8-08dca07897f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 00:38:18.8218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkeIOEjy6zezD6YC4R5SZ66tnUhclHhryhnCykddQsIV2qbCgkB68ZnE1kxpBpCClSrDsaPr8OXER8LINIwwDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5709
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

The change looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-07-09 04:23, Jesse Zhang wrote:
> 1. Fixed failure of querying ip info on gfx
>    when only compute ring is enabled
> 2. Set different invalid addresses for multiple rings
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_dispatch.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
> index 12ef7874c..8b97ca269 100644
> --- a/lib/amdgpu/amd_dispatch.c
> +++ b/lib/amdgpu/amd_dispatch.c
> @@ -233,7 +233,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
>  	base_cmd->emit(base_cmd, 0x240);
>  	if (hang == BACKEND_SE_GC_SHADER_INVALID_USER_DATA) {
> -		base_cmd->emit(base_cmd, mc_address_src);
> +		base_cmd->emit(base_cmd, mc_address_src + ring * 0x1000);
>  		base_cmd->emit(base_cmd, 0);
>  	} else {
>  		base_cmd->emit(base_cmd, mc_address_src);
> @@ -254,11 +254,11 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
>  	base_cmd->emit(base_cmd, 0x244);
>  	if (hang == BACKEND_SE_GC_SHADER_INVALID_USER_DATA) {
> -		base_cmd->emit(base_cmd, mc_address_src);
> +		base_cmd->emit(base_cmd, mc_address_dst + ring * 0x1000);
>  		base_cmd->emit(base_cmd, 0);
>  	} else {
> -		base_cmd->emit(base_cmd, mc_address_src);
> -		base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
> +		base_cmd->emit(base_cmd, mc_address_dst);
> +		base_cmd->emit(base_cmd, (mc_address_dst >> 32) | 0x100000);
>  	}
>  	base_cmd->emit(base_cmd, 0x400);
>  	if (version == 9)
> @@ -553,7 +553,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
>  	struct drm_amdgpu_info_hw_ip info;
>  	uint32_t ring_id, version;
>  
> -	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_GFX, 0, &info);
> +	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
>  	igt_assert_eq(r, 0);
>  	if (!info.available_rings)
>  		igt_info("SKIP ... as there's no graphics ring\n");
