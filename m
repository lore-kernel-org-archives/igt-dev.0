Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDDDFC6171
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 19:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA70010ED80;
	Fri, 13 Sep 2024 19:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fp0zIQVt";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7375610ED80
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 19:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG/kZvJEtws8bZdTWO5K1cXkILx8QyR3D5BribbLoHZjU3y2TWVgify5Wjj4b+DEJ3rN2gYNRyQGFNMeSPygGg4DuFUTHalTn+z87oN8x31hNNnKTOLflLynyaBcB6PXSlINaw/9Dz7WQdRdDw0c2la9JWXnYS9+mbrEszSPrCGkhC2PJMZFIwL2Aw/esmgflOaSh8TVlwAdnF2rBoCpp1bEtrO5vo24tgCQCc8wfHry/yaXEujBeUp/XZnnOANxuCaLGWdoCtPQCgz6wU5ZV1n2pHXcUigxxUOXqoJjAlAb1HUNOjYVKPLikRWmdqyDz6rylZyHf1D6N7V3Trf+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyHk+8O2g8jjmeGKHq7XPbiWes009tvKrK/oilR0EiI=;
 b=MNJ4mWTz7g+xYu8U0Wlmhni70YAM4Bey8bxE0nH4kWc4JMxbkuXCLdnuI3r9hGPtJ07h2AXPNV0e56sdT/lXuqFrPEzvWASVLGSkOglJ4Jr3wOFomD8j1G1ASqEz+pStBAfPryvS3h7SoqdicxySwTa0ja/u9Lvd8jLKkm65VUGKuspGxuk1fs/bfBd8iXTN64TWhiuAETZYrOFcsywvVcqKYdK30rzMr769mHrWodOvSJ3msrrDiIbDp2p3bXYYYIvfI9NTFjpJzPdZwkRncF/4r5ZJIZdg3ImEQau0+M6B4WrwjQAPk3nRzmRAwGc1/dZVPw5KFaN1G5zlGd/Vkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyHk+8O2g8jjmeGKHq7XPbiWes009tvKrK/oilR0EiI=;
 b=fp0zIQVtHUeKS0ERjTKqefrnybc9pE8oGP2A6r1WXcbLOC9vOGtSQnfb1ZoZGjjIbgwqOT4ctn9KsRVO8YevFudZJqxBQBO8T0ayEsqLd3brtLhD+O7K5M/Aa9AKX++E7ApASVfH2iFpib8eA2exORLFme0TdIpUV4/r9GdOkH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ2PR12MB8691.namprd12.prod.outlook.com (2603:10b6:a03:541::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.21; Fri, 13 Sep
 2024 19:19:29 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 19:19:29 +0000
Message-ID: <7e28cbdf-5c00-4275-a9f8-8433509ce177@amd.com>
Date: Fri, 13 Sep 2024 15:19:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: print expect error information
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240913100732.2271010-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240913100732.2271010-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::34) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ2PR12MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab5c13e-650c-408c-072a-08dcd428fcc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk5FcnZBek1JVGxWV1RHYjk4WUVUOUVBSlBVblQ5anhoeGJaWWp4OXA2L3Z2?=
 =?utf-8?B?SHExZ0RlRzdpUXJnM3B2YnVJNkQ5ZEE2dThzZ2UyZnVGUHY2ZlhabUtuSXAy?=
 =?utf-8?B?dVA4MkFySjhYaW56bXRGRFY2SWhubUFBN1p1OEk1R3JWanZWZ3lJN01qeW1j?=
 =?utf-8?B?cGhaUlh3SGxTMkxna1BmN2lYTnllcWJaallOWWZ2Nk5oUjF5Z3BoRnJHWVN5?=
 =?utf-8?B?OVliVjYyNVJBSVhta1RTbmNHR09lb09ZRUZGelZxd2VtZXhHZGJrOUtsUmt2?=
 =?utf-8?B?UFJWQjlVNlJDemlmREpHM0lScjRuNENaMmxXaUw4UkpwcCt5WVpxU0dZbVJI?=
 =?utf-8?B?MFMvRVdTUlgzZGRzNnIvbHRQZXpHa1l2OFlsNWlEUExuK1hnVWY3bkc2bTVs?=
 =?utf-8?B?M2NWQUF2aG90aWJtUW1xd2owemx2TWhlVHh4Y1c4WmJXenVRVXQxVnVDMnpD?=
 =?utf-8?B?UWJCaE9xaCs2N1dLN2w4VDJFVDJpVFRZNWgyUGhkMUh0NXQzR2x1Vy9nc0hE?=
 =?utf-8?B?TkV2dG1JZkc4STFyVEF0MzRYZVRCUmExVVhTbnI4eUhCTTU0TURMVk9LTXN0?=
 =?utf-8?B?ZG1GRSsxUHZSaEZ2VHhmR0lRb20rUll5cnI3TGRud0xhSGR3NjZKVkQyMTUz?=
 =?utf-8?B?eDVNTmVLU1o5MXJPazVxa3pQRW5WWXhnb0dDT0F1WTJCdmhTSzJiMEZsbmh0?=
 =?utf-8?B?RHhPUUU0SFpHVVc5bFdOZ2JneFo3UGN3SEtTeGZ5MWNxWUJEdVpjTFJJcElC?=
 =?utf-8?B?aXpZa2gzczMzMEpqdkRNQXlaMTBlNTdIMVdZY3NmdWVaSVVTN2YwWUJWcDhq?=
 =?utf-8?B?ZGNqRkdCbzdzU2pNb1Vod2ZGRk4xK1Z1OUFKZksrcG5CSU1BaWNVMGxsQVI1?=
 =?utf-8?B?Vk4vYXZLalpyOC9GUlRyNVVYOG9YOTlubXhpZGpKNHhtT2Z3ajN3Q2g3Zklr?=
 =?utf-8?B?dXJ3M1RxemlidURJSGJjQktla0lzclJhcjl0V0FIa2FiYmNGeXhUa3ZDQnFG?=
 =?utf-8?B?OEw3SWExMy9Lam5MNXBZN0wwU2w2enNPSmxXOEhzbktYL3d5NkdQZGQza1Jo?=
 =?utf-8?B?TlZmQWRlU3BSYnFjdDM2R1dSVmowckxaZUIyTytpNGh6TUtteHRBc1Bob2Fx?=
 =?utf-8?B?bWpGR3pQK04zUXRLNVR6VVVYTkxWSEFTNytLQlYyS285cVAxNGFMeUYzK3Zl?=
 =?utf-8?B?dkkrTGxpa3dRRkl2T0cwMStuVzgySHBBZ0ZxT20ydjJFOXByYjgreTRkOEox?=
 =?utf-8?B?dTZ6c1M3ZldLaFR1UmpqUkJqcW8xelYyNVhQcStCdTJ0cnpDbXZWNGNPaTZy?=
 =?utf-8?B?amJqbkhwRFpPRllmVnl5cm5NcFowYm4zZU1qRnB6ZE5Qd1pnVFZFUmg3WDJR?=
 =?utf-8?B?WVBhbHdkMHIwcDFmTUtiT3RuYk5kOXNyWktMR0lXd1NCaERMY2VzTFZMYy9r?=
 =?utf-8?B?U0FVRTB5WmpqVUdmcXFIdmNlU0YxRGdGS042dDRSeUt2dm1YcU9pcGVySGVD?=
 =?utf-8?B?bFlPTkFrOUFqK2dHd3pTVjFIYlZOM2NSNDk5bW1LWVJXT2tWeVNYWHhzK1g3?=
 =?utf-8?B?aU96ZkVKNElrNmxtRlNid0V4amFOaTVDRW9jWGJXaWNnZUM1OGVFamx4bnNQ?=
 =?utf-8?B?WUtOeXQ4aFFqZnUyQkRac1ZDN0tqdVlkMzRlM0hlcXlYdWNKNXk5emRJK2xW?=
 =?utf-8?B?MUtQbjFVb3ZvUDB4eTl5WnlvTmg3bnlPY2k2SXFJS20rd3l4czJwM205WG1x?=
 =?utf-8?B?Y2N0U0V4WmhDNktLaG1xMnRXV1JtNDluQ2grZVhlclAwcUZlTDlhQXVVcTJl?=
 =?utf-8?B?cHluK243eG01YTVmL0FjQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejNUaEVrKzJKWitGRjc5T2UyWGJxS29hTXhyMllsck55dzE0V0c4YmZiZ1U4?=
 =?utf-8?B?ZlhCRVJSL0lCclFRS0lkU1BzUnZCVXhjVE1EYjA5Ly9LOFZ1OXNZWHFzNjV4?=
 =?utf-8?B?ZktJbHVPQlJmdGZXTEVDQmtwV09NRnp5Q1JBcEVOaWtCSkJUQ3Q2cE5aVDhW?=
 =?utf-8?B?TkFSWitFd3BnVDBaejNhdE9GSkpOQU9GcVlQZkI4TnFEUVl1LytaTmhraVVF?=
 =?utf-8?B?cmlVVXR1d29tYk1oZEdPdHR3bXMvT1YvS1V0RldzTzFsNlBhcDVPczQ5eWFU?=
 =?utf-8?B?dHBBZ2RBZFFTNzYyUTJSMTZDU05raFUyZ3V1OEhoOFIzeGZDdFR6Ty83SzNz?=
 =?utf-8?B?MXlBOGJiOExIcFcxRUlpR3J3YU1jV0tEUzNMaXZwbU9ZL0s1V2t0KzdOempv?=
 =?utf-8?B?clR5NTFLTHFwUzh1ZmpWbTVHck5KVmtQS2R5aUt2QUlSVkVlcnFIQUxxMFBL?=
 =?utf-8?B?L0doOW5FVlJ2NE1LWGZQaXdlNkdlY3UxcUhiNXRyVzZVTDAzS0srTFZyTmlN?=
 =?utf-8?B?R1pmdTEyM1pZSThETVFONmdDKzJvRVNpZFk5bXNIN25PRGNqcC9peXZsWXly?=
 =?utf-8?B?SDJ1M2Vwd2UwTHN5MEs1NHljN1o1SGdFcmlmR1RmS0RrR0tJUlZGQytQRnJD?=
 =?utf-8?B?aXRWZjlnTE1hWjc5aFZyZkxKR0dVVlVuWks3cGZ0TVV0V08xbkd1UWJWQzVq?=
 =?utf-8?B?TjBkbEI4alFJb0JWbXE3M29TZEhvMCt2b1I1WS80aGtlVVVjbGc1M2FTWUpj?=
 =?utf-8?B?dy9WYlFWUWZ1Qk8xUDQ0OTdsbXN2TjlFR0VvUmtEUThiNUNwWEtBUC8xM2Z6?=
 =?utf-8?B?ejZEajFNL3F5aU8vdjQ1alhvaFA3dzYyakk5b21QVnBNM29VRVFwaERQYlZP?=
 =?utf-8?B?MDlCakpoV0NzS1VocFZ4ZGJqMXk3TFptTm0rZitrVjdhZUN1dDFGcjR3QmFC?=
 =?utf-8?B?S0tEVjA0TkdXbTBpdXFwWHBQNFJOSlpIa2o3Tk9OVm43eXk5bUpxVmluUGpi?=
 =?utf-8?B?cW5XRkJxcnVQUWNQaGczWEgzdDV4SEpLd0tHV1czNG80U1o2ZTNPeXJ0cEl5?=
 =?utf-8?B?b2FiZ3VRdldYdXVvSTNleTloTERWNVdaSTBFMnVmTGJtVThIZkVLZmdxai9M?=
 =?utf-8?B?U2ozRndBdndVSUYvd3JtV3crZ1dTYzNlMmJVZU1nOXErek9GVGhXUVJwYWxt?=
 =?utf-8?B?Wi9OdENhbkdjTlBCQlNQb0VFdnJBazRjTGdYYTZtejFyM29KdlRvTCs3Um1I?=
 =?utf-8?B?SktKZG5NZWdjK3VLdXVFVnh2WnFiWU5SS0FGU0xlSDhraWVmZWJDMHpaeWl6?=
 =?utf-8?B?elJCVk1KSlREWlJObGk4cENkSWFUMnRObzZTZ1pLQ3ExS1FqTURidGNVM01t?=
 =?utf-8?B?WVdPZEFlTCt6ck5YYjBFZkdBWW5GZzhFamFCMkdUNGdSRmlxajB4b1VKVHRI?=
 =?utf-8?B?VW9TSWxzWWsxRjB3OGZLNWdpNlZtVFdGWC9NbC9wSXNYNHFQaFB5WkxBVnBM?=
 =?utf-8?B?RWV2eUdWVVFFUU1IOVhOamZsVDNlWStkQ0xTSnBBY2krWE5WUkxaRXJQdW1S?=
 =?utf-8?B?b0dGV0x6SUJlcGZ5c3UrVGFDcGJHWVViQXMvSFN6a3RLWUUwWHFEcDJxZ2JK?=
 =?utf-8?B?Zm8xVGFkYkRNRXU2TElTWUFWanVsVmlJSUwxMFI1YjhKZ2dYTUxDTHVzc0N1?=
 =?utf-8?B?a3RNSzA4cWJkeUp6a0pocWdiWk12U0FSUWgza2tEOWJ1Nkd6MGV2T1JsSzU5?=
 =?utf-8?B?L2NjR29tZFFwMzBVOVJvRzJVaWJLQ2FNZGZ4endPNWkybDh6VWpNbjZjM3Fp?=
 =?utf-8?B?bDBCSnBucG0zbzNpQ3cwRTV0andXcVlXVTVjRkVwTVVsaUE2S3N0UTFYbWQ1?=
 =?utf-8?B?bWJVOTZSLzdKaGFIT05JZjROR09meVpJYmV0b1dieDNKZzlWbmhzZWVMOWxj?=
 =?utf-8?B?MUQyM1N4RXZMTzVybjVsTVlJaVZZRUE5SzRrL0xnZU5CL3h0dldqbENBTlFk?=
 =?utf-8?B?MjRsblNzeDBkYm5nYW5oZklZR3BacSsvRzltQSt6U2ZDZVFxZ0xUQ3ZqQTVR?=
 =?utf-8?B?bk96dWxkMHlrWUxNc3dHYitnb3A0S2tTQTZRdGNJZmg5eXBhY2d4enlEVWs5?=
 =?utf-8?Q?6lywTX1xKTC8ajg78RxaEUw0m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab5c13e-650c-408c-072a-08dcd428fcc0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 19:19:28.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPg36we7ECuAd2sRc3zhcIAewX4EHa+0S/RSe3LakkzvKyTsob3M75NsojAOKQ7C4Dlp682O9I+kr+HFvsGvmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8691
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

Thanks, the change looks good !

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-09-13 06:07, Jesse.zhang@amd.com wrote:
> Because they are negative tests, some errors are expected.
> Print the expected errors for each test.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_queue_reset.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index 68575d496..bd0deb271 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -1090,6 +1090,7 @@ igt_main
>  	unsigned int ring_id_bad;
>  	unsigned int ring_id_job_good;
>  	unsigned int ring_id_job_bad;
> +	int expect_error;
>  
>  	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
>  	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
> @@ -1146,7 +1147,6 @@ igt_main
>  
>  		r = is_run_device_parameter_found(argc, argv);
>  		snprintf(shm_name,sizeof(shm_name),"/queue_reset_shm_%d",r);
> -
>  		fd = drm_open_driver(DRIVER_AMDGPU);
>  
>  		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> @@ -1186,6 +1186,17 @@ igt_main
>  			process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
>  			&monitor_child, &test_child);
>  	}
> +	//print expect error table for each test
> +	if(!argc)  {// --list-subtests arg is 0
> +		for (int i = 0; i < ARRAY_SIZE(ip_tests); i++)
> +			for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
> +				expect_error = ip_tests[i] == AMD_IP_COMPUTE ?
> +						it->result.compute_reset_result : it->result.gfx_reset_result;
> +				printf("test ip: %s,  test: %s,  expected error:%d \n",
> +					ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX", it->name, expect_error);
> +			}
> +	}
> +
>  	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
>  		reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
>  		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
