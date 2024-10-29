Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F84D3A66D
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 16:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BE210E25E;
	Tue, 29 Oct 2024 16:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qR+9TDos";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D2410E25E
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 16:03:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tT0bseCNDhuA2JfbPLrUAkXGsyXtfk4OVVulPm5cRwOulPb15YjEAKSKcVHO25xs7axlC1iknrDulqkc6QDH/Rc1LJnLkBYNw58pKOtaaJa8t1e1Jf9SUfI+L4s1B3/pwpnQKmgzKcuUmDMTBF5yLuwNATbVQQZptWfjXAA9ITJG6uJbEnVKuWc7V8o9yQoNDfRvj/IZr1rJOEiAkINPiDtLDSCGZFgndt+6skfE5bmdZylrUqmyHySY7y/TPfspu1iGWEH5vG/xv2GDzFaE87wv8F62yvUMIfCKP1knlWR3tqqi4U4y5Y0ljLbr0wx9ujtG3BzGUihEpiTF6M37AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAenoV5tIweWbJLmu9iKk0r8jfxodq4BF7Ul7U5CIDk=;
 b=xA6I8IwOasSlJV48qai9eDsl6yru1pahKkCXQVtdE+muVjIOAJsKsJLu1WTPOmNj52eRyidAdJSIKlggAO2CstVIFEwq2t91kkz8Rz8ahUm11uO1gKGYaxM/RN0CAacV/XxhYGGuKgmOmZx5jhELqZ+ZKAS2T7EOsUmb1ae6AilavEbYrNHoiqCsFo3Le6bVF68prI1z2xz3jEwlt6s2dEeOtk1ud8l9358h2k3ixeNFFBixZRFBwV2712s59acylq9J2W7iDtsCekRVfBubOsOD6SKRGroyNjCaD0qD869qbAQIwvKCVOVV/0ZSsp7yVicuke4HY8UH0RMg24GVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAenoV5tIweWbJLmu9iKk0r8jfxodq4BF7Ul7U5CIDk=;
 b=qR+9TDos9tV5kQhXFXTJaj+7qI4I8jdR0qfNS+q4WvKklygtGg0N4c0UQnQnRCog1sgQFp92htZlEz10cbTPfb4hmgODzRcqt91ra+ImnCyByCiL0Lf5BXLqJGCoNOh5Jl67JeYzqCT+TQ2A5atE4mIhWFkI92wuQyUmtwGHlk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by CH2PR12MB4328.namprd12.prod.outlook.com (2603:10b6:610:a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.19; Tue, 29 Oct
 2024 16:03:56 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%4]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 16:03:55 +0000
Message-ID: <b5a5e1e0-304d-41dc-a471-16fa07b562ab@amd.com>
Date: Tue, 29 Oct 2024 10:03:53 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] tools/amd_hdmi_compliance: Fix VIC 0 not working
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, mark.broadworth@amd.com, sunpeng.li@amd.com
References: <20241024210345.511501-1-alex.hung@amd.com>
 <20241024210345.511501-3-alex.hung@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20241024210345.511501-3-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0012.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::25) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|CH2PR12MB4328:EE_
X-MS-Office365-Filtering-Correlation-Id: 505ea9c4-4bb1-479d-46a9-08dcf8334a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXpTTTY4TWhWRER0Zkl0UVJ6MmMydmhkMHBldnhudWgvMUlUL25zb1NCb09j?=
 =?utf-8?B?ejhBRkdyem1icmtIYU4wdmFSZGFnOVlpQnllOWs5V0w2dWIxUXdKS1BHZ1d0?=
 =?utf-8?B?aG80YmRYdkR6QXJMYko1TVJTa0thUU4zSGVhTVdUV1gvNmtnYTdvanNpTHFW?=
 =?utf-8?B?UEZSREhxWTBaSTZnTTFtb093Q21ZS3BZOFJiZXdBeWxYQStrRnE5emtKV2di?=
 =?utf-8?B?OHE5SmIrQ0p4VEtDMkNOME40VkNDdzNBZS93d0pWVVVGOXVMOTBoM2poYVBj?=
 =?utf-8?B?b0hWY1VxWFcwUG45dEN3bXJHbUVDVmtaUE5LNWk2Ym9LZHQ2eHFFTGZLZEVO?=
 =?utf-8?B?TlJLL281dlJFM1hDNDk5WXoxSVJSeDdnNnNDUlluZk9PWiszRTdIbEhOUVpp?=
 =?utf-8?B?bWRndEdVWlM1dHFqR0Z0TENmdWVYeXB1S2V6VXJhbEpQS2N2MStvaHB5S0NR?=
 =?utf-8?B?bTIrQ1JQVG9JNGNTbFIrZ2w4cnhBbUxEdlB3T1YyaVN5VW05QVF6Ti8wdU16?=
 =?utf-8?B?NGhHTW1EYjVoaHEwdFpxYlVydlFNd3FwRlNIakJTOUZWNE9rMVNpcktRWEJi?=
 =?utf-8?B?VGI4cjI5STRvYlVzaVJUYkxmV3dLZFBFZGdsMStJelQ0RGxqOEN4UGFiWFFy?=
 =?utf-8?B?NWNOMnpRZTJKSWpwSE45R1FMbDBSR3MxSXVJUlN0TnU3UVNVOVlyYzgzV25S?=
 =?utf-8?B?M3dQUzN5QndzMzhrS1diVzhxaXhyS0VvUEdhWHU0dUMvUVNvZDNIT0FuU0dX?=
 =?utf-8?B?S0RoV2o3Rzg5czVrZEg2MEd4SjUyb0ROZ2dOUFV6L3ZGSmtWeFRScC9IK3h4?=
 =?utf-8?B?SEpQTzc2MVBhSlErVndSU0hHSWlmb1d3TDRUNlczS1gyUVhqa3Q3OTJpK3lM?=
 =?utf-8?B?U1dYUWIwWmtOUzZrdHRnZHF2OVhTcnp4aG1DN1BsbmxzQVEySGYrTllaemIr?=
 =?utf-8?B?TVhiYzQwMlY4MlFoVWxOTkNzTVQrUVpQazd5MG05OGRtVndwUHJaTzhmZStv?=
 =?utf-8?B?WXJQTytrSmh4am9iQms0bmFJcE1qU2ozNXUxTHJsNFFwci92UHZJMEhKRmRz?=
 =?utf-8?B?UllyRTBVa1BGVjBNR2p3TFhyMFBITlRnRjFpb2FCSVBSbXl2by85NkRlc3Ez?=
 =?utf-8?B?cUJCTjI2ZTBrNTJCRUh6NTJxZU5HUng1K1JmUXErYTNrUXlBNlNyR1o4dFgw?=
 =?utf-8?B?c09mSW1jaWRta3BzM1ZCMHhydUErRVlOQVhXUzA3VkRvc3ROS1Z4T1VPQnMw?=
 =?utf-8?B?SUU3UVZNZ2RtQTh6bUJUWEZMZHVoekZCdUJzUHJNa3ZYenJHczRleWhuMW5S?=
 =?utf-8?B?cGRyQXZORkVKZ21yOGdqMU1NMm5aTVZHcUxOblVnYXN2SFN3RUwwSEUzeHZy?=
 =?utf-8?B?U0ZMSVEwQXlRbXVuMCt0NHlBaE1GSmRCVnkyMHE5SkluK1ZQN2xYRzFlUE1N?=
 =?utf-8?B?KzVyVmJtZkx5YTJJb0lPTys5WXRrS201L1ZPSTUyeTdtYUY0RGpwV2MvaUNq?=
 =?utf-8?B?YStPNWhaUnRjLzFBOTUxTlNjbnlNYWFTOUdXNHdwUENJZTB0ZVJjRkhpaVBJ?=
 =?utf-8?B?T2xESUwvcnRvSE1KMGZXaXVvVkliMFNaQW5VM3NUeDZmTURwYW1RU2F6Nm5R?=
 =?utf-8?B?NTBzTGlTN0xKVzFGYWlwSkVteTBlZVFKWEp2R3ZDcUZqdFpQOCs3QnBhSExn?=
 =?utf-8?B?TWhDQ2t3cnJSeiszQzlDUS90c3d2dGN6NlNxcDJuR1RocVd0b1J3cGEzSjFT?=
 =?utf-8?Q?NkT83PEPByx62ooYF95w6AC3MVDLWDppB8lYaow?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG1kdzJxeUZpM3ZZL2JLaUEwTmtadk1xbmZZQmlTb3RsRnBNeTRIdlZJZjQ0?=
 =?utf-8?B?cWdTaDViN20rMENJRCtXaG9UY2x1dklOOUw4VXR5L25ZWWZEQjFTOUM5WUEv?=
 =?utf-8?B?RlF1SDFFRWU4K1A3UngyeXgwOVcvVEdnMmhScG5ZUytXcm1KWTgvekVwQ1NZ?=
 =?utf-8?B?SjRNNG1rNjhBMm1QZkVNa2VpY2tIMGZScmhKZUtNUXJ2L05TNFIvNmo0ampj?=
 =?utf-8?B?RG11Q0EzWnhscDVUNVBqb1JWZGd0bzI0Y2dBVlovTVF2OGJFejlSUXEwUUc1?=
 =?utf-8?B?TVltQXZXczNNZnFqZjlLZjZCSzY2WndwWGdWQldpYjRDQjNIQlJYcGFaRzVq?=
 =?utf-8?B?cllxSSsza2VMSFVmUjRQKzdBaEw3b3hsNmlhTHJYQWpCY2E0N3I5RkdFN3JC?=
 =?utf-8?B?d0E0M3ZnVnEwc3lKVkwrazl5VTllSGJIWWRiU0RhRmxaMnM3d09QOFNmMnhs?=
 =?utf-8?B?RWZnREFzZU1jNFBYNFVJVlNTWWR6ZldnZEF1eUFTTS92d3dqSDFRbDE4bENR?=
 =?utf-8?B?VVVaQ3VkdDF1emtzZ0p0b3Q3VDZRS21LajI3dGFOMmZVTDIxcjloZ2wvWCt4?=
 =?utf-8?B?NFF2ajZHUzAydTRsUXhNczJGNWMwMTdFK3FYcm1DaDNWcWZvdzVaMjNkVTVo?=
 =?utf-8?B?WFN2a3hCV1cyM014bHlHVE5ialN4ZHNIZU9DTzBybzFmNGpGK1hHVWdGYXlR?=
 =?utf-8?B?T3pNdTMrdVdielpkUzR2cXB4UUw0VVRiTUpBL1MwanZZWHk2SUp4QzhpZk9v?=
 =?utf-8?B?WExkOTNjSjF5VnBxYThjNmc0ZzlHeWUzTDR2Z1lGVWxsMnZNbDFKZlJYczdo?=
 =?utf-8?B?d0FVYWYyZ01Ka1J1aVVpUVJoRm9qblg0Z2NvanZpT2J1MHVoOUtVVi9LTXhi?=
 =?utf-8?B?blBJU2srRGdweksvWU56VkJUQzAwNDFRN3J1elA5NkhQTFRJdi9SdHorRHdq?=
 =?utf-8?B?NXlmNHp3c2FyZnZoRnlra3dMTHIwdmhheXRUbXoyb3pUUmlTYWx1ZTc1bUJz?=
 =?utf-8?B?TEFrTjB2OUJlQ3dvazdSMkFWMUhsTDhqRWZHYklOaURvT2x1OWsvWW9TRHRk?=
 =?utf-8?B?U2pyY3lBbzFpaGRuMHdWRnU1K2tZODBXdEdWcjRXelNvWlVud0VydFR3UnFD?=
 =?utf-8?B?M1FtYzIrTzRPZGl0V040Q01zc1hXWVEva3RFS3B3TnJnbGtBZWs3YnZrcElw?=
 =?utf-8?B?c2VJSUdwTCt1NzgrdlFwNzRqa3A2ZEVSemltR282ZDFkUDByUjJyZThUWU5s?=
 =?utf-8?B?OHFXN2ZGMU5OSnpDMVR2RmRWMXJsQXZUaHI5cDBqcDJMSGRPT1lxWnRhN1BH?=
 =?utf-8?B?VmNncmE4bVY3UUpUVWdyaFU4V0tJUUh6Z3ZSRVYyMXJGY2ZxTUVKK3RqTXVB?=
 =?utf-8?B?YWwzbjVjejl5SnZ3REJvaGp3OWhIWlJad2pkVHBqdEgwb2QxUDBXSXMzajZj?=
 =?utf-8?B?UDY4V2xjQ01nZVRlZ2o3VnhPUFRJcExxSDdxV3VEQmtnM0hXN1IzcGJ0Q0JR?=
 =?utf-8?B?Q1prTTF1SmRQOFZ1SHhnWEdhakNuVy9UUFJTV01wZmFKcXRoMDJXV21KbXYy?=
 =?utf-8?B?QjJGZUU0bEVHempsNVE3ZGN1cXFTenFoYnZ5akkwdEtqUXk5Tm1QMUpkR05B?=
 =?utf-8?B?WmFTODQwUGVDazN2WTJPaU5MVWxqZjdLYktLV1pYdHhXMTBVNEE3TjFidkF3?=
 =?utf-8?B?djFQT1VqMXlDRzF4Z1F0QWJjYWhydlk4U0ZRTjY2a3RCaGZrcXNNVVpuTmpL?=
 =?utf-8?B?YWg2ZFNoQ09mdU5NOTg3ZHUrUzBFVVlmSlU1TysvSjhEcUpSSUI3bG41djhX?=
 =?utf-8?B?Rng3YktQMVhXTlpSTWRBYWJsM1NTVXhoTmlSVXkrb1JDS3JmaEVVWmFpSXp6?=
 =?utf-8?B?RWo3Y25SUndZanc5NDA3Y3RHbFlzYWtnU0N1alFIdVR0VHdrY1FZM08vb1hT?=
 =?utf-8?B?czZHdWVRN3JCdzFJN2R6L0pSa21ObERJQ3p2cWlSc1ZtQ29HQUw2aXppWGtB?=
 =?utf-8?B?LzU5VDlEd2xYTVFrMGFGMWxiMWFqem51dEtsZGxuVWVoaE1mbjRrdmZjVlRS?=
 =?utf-8?B?WC9PcFFxUXlUTUVDZm15Y0FlbVhtenhUR05GTFBXQUpVaVBsMkNpMVk0Nlha?=
 =?utf-8?Q?1x61hHva+w0mu4MGSSn4fdcp4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505ea9c4-4bb1-479d-46a9-08dcf8334a72
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:03:55.8427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoBeCeGcpPhv6iZWWQfTD9ESpGcfyBFj6wRKqw/7pz4DRA4TZpKFXNZEEMYrD/hdt5L2gHvgdDFKo6iXHxptEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4328
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



On 10/24/24 3:03 PM, Alex Hung wrote:
> From: Stylon Wang <stylon.wang@amd.com>
> 
> [WHY]
> VIC 0 is not working with -t option
> 
> [HOW]
> Make 0 pass as a valid VIC
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> ---
>   tools/amd_hdmi_compliance.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index c0a324eb9..f06af72b0 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -527,7 +527,7 @@ int main(int argc, char **argv)
>   	if (max_bpc)
>   		set_max_bpc(&data, max_bpc, conn_id);
>   
> -	if (vic) {
> +	if (vic >= 0) {

Maybe you should squash this commit in the first one.

>   		if (vic > ARRAY_SIZE(test_modes) ||
>   		!test_modes[vic].name[0]) {
>   			igt_warn("VIC %d is not supported\n", vic);

