Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E8DC282CD
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 15:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DE210E44A;
	Mon,  3 Mar 2025 15:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vJ5ISmig";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C58E10E475
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 15:04:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ge3p+YUEEcdABG7dYaoELKazex2rzwlfJSm+/izv69fV0G5e0l6pkEb8YWUfYiS9gYgKYsFeyESc5RODZXhTVMVYx4WTal6TBkXFDfe1ep6Ic165Sz7FZTggoQnKuYSDReACI0uGvBDlyg+3TwSGPDaIdxTAThD3837MzFqxZpFs0B4JrudbPVx47liE/dvOqfq7y5J2bINw1/e4/B2MIAKdUKU8iPbqGjTGEkR+1L3VrMrIheQ5ezRqUzR4maSYaLJbqZ64Uw6+vBlb9RZxkbV3aZ+5T6cz+Y9R+RD9fPzWL159/Bnd03qtKhrboW0ryyD2mMTSwo0lUbbOxsKixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjQZxhi+gVkMWO6RsYR/47+PkzPjnGQI4kAZU6uTDtY=;
 b=TVo3xD9q2SEr/hJzfT4NF5KrOoOkldA4XOdRrRoyw6jsctQ5rIMVOFgv/RAIDKWWbXjks44wy+p4EY5jpy3J6LRlohJ/ZqeHkkBgWVQkoJKcqG87Zyig6U+n3ESqs2j6uGQmyYFaQ2gzSHqw6NA+fDisxxDG0aSI2YZqzMCrB6WQoLpsZhc9l9tW0M7bhJoZzLXlyOm19XORamIpEBZLKGVi1sLLVowACBmPhK+VXSP0oy4J41vV549OOtieq4mRW8rWea8oMOq2qXPc6L3S+oGQQ83lXEbh83ECOhJNbD1UX/W/RTkVDugBy7ACTcpPbjRD7auC/AaBriV0E5I3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjQZxhi+gVkMWO6RsYR/47+PkzPjnGQI4kAZU6uTDtY=;
 b=vJ5ISmigOql1VYmvcI5kEzZMSoer/n9Ly4j9Y7Sckz6zTnJZQk/MEKYnv9nLHyCvCbpKBz/rErvz5VAW8+4xJHaNfheLppPc1K/mCEwmt1Hnwa7VeWs7s/O+yiRdMUeI2CSxH4y6hePhO0yVLicWJ69R5rR9HDU+jPXXgGzx+sg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ2PR12MB8848.namprd12.prod.outlook.com (2603:10b6:a03:537::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Mon, 3 Mar
 2025 15:04:23 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 15:04:23 +0000
Message-ID: <8e94eb6e-c19b-419c-b2c2-0f3cf77a0f36@amd.com>
Date: Mon, 3 Mar 2025 08:04:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_replay: Skip test if no DRM DP AUX
 Interface
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: sunpeng.li@amd.com
References: <20250303095635.2874-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250303095635.2874-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::14) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ2PR12MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e41f55-9033-44c8-8533-08dd5a64aef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bCtpM1N5ZnRQVnExek94bHl5SHdrN3M0WGlzNmdPK0I2SE1SUDI4SVFZWk5L?=
 =?utf-8?B?NHYzNVNxVlVBVDJtczZHdGRiMXFtMGVTbEJHRnNuTC9KVnRYa3crSmEzRlNu?=
 =?utf-8?B?M1VSREdpNnVVa0tVUHUvWVh3dmdsRytYS09xd1lPeVd1OGYydDJmcEs1S3hX?=
 =?utf-8?B?NHVxRkpHYWNnVHBaZTd4a3RHYnZVT0RCTjZwd1hmYzgvM0ZSTDFJa1QrNG4y?=
 =?utf-8?B?YzFuV2xOeW44UzVkUlJlQXdoT21hQWROTi95Z1U4bkU4ZGZ2RzJ1bjB0TklX?=
 =?utf-8?B?VmxMNWN5ZUFCbkw3WlI5U1Q3dXBQdk9vODVSNHJkWHFxZ2Z1K1Vod0x6aW42?=
 =?utf-8?B?ckZnOVVxeE00V3phaDhZY2ZPR2VoeU84Q1J3NkMwL1o5cDlDR0hHS1JOSkUz?=
 =?utf-8?B?c2tpc1BaWEc0TjRtUEdjd2dqVmxVVURpRm0wSDVCVE03ZXgxZUVTei9zaGpz?=
 =?utf-8?B?NFRlbHI3TE5BQ09oUEVCQVUwak14RjVDSGo3bWhpRDRlWnRPRG50L2pOZ2p2?=
 =?utf-8?B?S1JJVkZOeVZFODBUVVI4dUtsV3pIQ3M2VDZvWlFLN1JZcjVTcFhMTXQxQk9P?=
 =?utf-8?B?NUNWTFlhaitLdXN1NzdkKzUvTzh4NHI5YUhaZ3hkOVVnZ3B0eXMvb3dBUEp1?=
 =?utf-8?B?UThZajhEdWdnMWhMU2hKclJpYzF6MEwrUEFwOC9mdURXYTR4NnlZZDZuaTdF?=
 =?utf-8?B?MWU4UC9MZ01QUk9nZEFNS0VrTEJHblhaZnQwZWE2TDhXWW5ZOUIyZFkzN3NN?=
 =?utf-8?B?bkREenI4UXpnWWZhMlBlblNpVVg4Vjd2R05UcUpoUHkxZG5VUytTS2tlWnZY?=
 =?utf-8?B?SnExZ1VydTB0UkErVERNbEhCbHNNdHMyQS9mZ3pJb0ZMVXhUNHVIa1NINkt1?=
 =?utf-8?B?djJ3Yi9FdVc3elV1U1R6SEE5WjBNYXVPZkxwZnMvUDRGdU8zRWtPVWlsT00w?=
 =?utf-8?B?SnI2UnM0MGdVZ3dEKzB5K1JGNHhEKzJXY05WaHJkeUZ5Y2J2Rm1ja0hCVzhS?=
 =?utf-8?B?dUphQWt0aitCd2oxelRJZ3NBOUF3bSszZUZuOXpiYUVmNHYzNVhNdHJtdWlo?=
 =?utf-8?B?a2gwbkN0RklSQ3ZHdStSSlJlZjBsSVRnVHljaENoUlFQRzYwR0dQQklKbWE4?=
 =?utf-8?B?dk5FbDY4V0V2UU5KemFEZlozbU1LSkk3VURoN2UzQkYwbHZMbzlGSzFMYTkx?=
 =?utf-8?B?cktkVnpTcE9YSmVJU08yRTVoblNVYVBJUEhrOTFmUHorS1RCTld3c3BraTNV?=
 =?utf-8?B?WVdRNHAyZUhyWkdVRWJuc2w4WUVLQ1JHdTRVQU1ONEs3RkIwUkZSdldQZTJP?=
 =?utf-8?B?S1RiN0RCUG9aMzdMOVRLaCtlRTgyTEtTNVNXTEZEWUo1RW1CRDFRZkR5S0pr?=
 =?utf-8?B?YlBPR29GN05VcGJHL0tVUjYvc1RuSEc4SzVkUUhLZkxDRXJteEQ1VzhGZjZl?=
 =?utf-8?B?ZEc5bVFkSFh3N0lMOVhXbHJXWWNUY2pSRzE2bzFTWDM3WWtUZGs0WmRCNVAz?=
 =?utf-8?B?SEFRTmJDcEQzeStMbUZMbmZROUp6clViMU9CcGw1eFhiK0hkeVhnSU5yaHpM?=
 =?utf-8?B?THNVYTc1MzBMeFVPeGoyeDVtNEpMaERhOG1DYkgwdGduWC9NT3ZobXJJQ3VM?=
 =?utf-8?B?S3VYdTNSUnpOVHc0U0pNWmMyTGQ4VXNZaUk0YzZhWGV4REhIQTI0M2Erc21D?=
 =?utf-8?B?WnpwU1BvK25GVTRRcnFkQ0QvMnJIRzdLb3NTdDdscEtpNWVaWVF5bExEVExk?=
 =?utf-8?B?K1RqUkVxOXZvaUlEVldBMkszWnpYcGVRSUFQd1dvVW8yWDY1VjBNR3B0OWxL?=
 =?utf-8?B?cUl3ZE9tczlyOGdQZVdzZldrK2RaUktHN3dQanR2K1Q2cm40UWs2MlRIcGhl?=
 =?utf-8?Q?1w+DlYuoUuViE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T29hVEVDYXgyUnhWbHQvODd4RW5oSFpNQzk4TmpUTVFaWHFlYVZqWVNBZU4y?=
 =?utf-8?B?MGpGVE5MVWNqamZ5U3ZlK0ZOcHlLck9BWnBTdUFxOHVEN2hXdG5EbEM1WC9T?=
 =?utf-8?B?UDVncW42RXR5b216ZUUxYWZQOU1SOGM0RFNXeDVlbG9CUFcvMjZRendocDZ0?=
 =?utf-8?B?cTIxbVBZcmE3WHUwUlhkamNGZnpWTFU5UWI2THNsRUJDMUlpVjhlZVh5Ly94?=
 =?utf-8?B?ejl5V0J4M0JNeWtadTZEZmM3WXVjRlpUM08wTzlMTWlJRjAxWDQxU3UzVWJF?=
 =?utf-8?B?d0NEQkQ4STlRMTBpUkdhWno1d0dzeW42anFPcXRSSlZtdE9FWEdHQTM5K3Nt?=
 =?utf-8?B?VmxReEV5S01pUWpzNkhSSHh5YkJmU0YrQkZCVDJQZWs1N0FiV0RKOW9tMmw0?=
 =?utf-8?B?UXY2Q05FaDFQZXBscytyYXNJWi9CdDd2TUJiYkJ1N0FSWm13QnRIRlVQTWpW?=
 =?utf-8?B?Tk9RaUs0VmovaU8reU8vemFiZTFrTjR6SzNUY1J6Q1Qydk4zUkpuWWpvZGxs?=
 =?utf-8?B?aEIzM1cySFpsN0tzV2JMWDBZU0FEODNoRm1OYXViUktrbi9rVG1jN293N0lS?=
 =?utf-8?B?T0daTVg5bHNBSis0cXltUnhXY2VKblJNaDQycGNhQWxzZ3U1RFJVVWZZVDVE?=
 =?utf-8?B?Vm5iTElPZzYwT00zb3l2QS92SndaS3htZ3pCMTRnQXN4NS80RkI2OHQ5d2hj?=
 =?utf-8?B?aU1XNzdmUnV6eVNWYjJRcWJDVTdDWUJ3KzlNV2k4LzcybmMwVzdwQy9ZNExu?=
 =?utf-8?B?WXQrWG5Xa0FuczZ1UEF1VkYrWEh2OGRDR05EUVFSendMZlptWFp0QWduVVRi?=
 =?utf-8?B?dGZSYjlrcE41VEpzY2k1djQxVllPVkdwL2MvQ0ZEOVpMTURhWk9VUkxEYzl2?=
 =?utf-8?B?NUt4SmtBZmFIOFh5TkM3VDFXd2x3RWdEWjI3akhqeVdkN3VTOWQrT0ZzblNZ?=
 =?utf-8?B?U20vNmtCVGU3ZFZuWmZ2TTRkU0NLRWxWQkhPQ2RoOU5UazJzSTJKQmVzczcz?=
 =?utf-8?B?VFdqcmp0eUxIRFBiaWhtc3RpMFRMaithRXQrVGg5c0pTMHF5a2NVd2U1V3V0?=
 =?utf-8?B?Z2ZEVXdHTVkwVUo3cHlkU1p1NmhiY1c4Mi9oZjhPSHNQMG12STJleHNYazc3?=
 =?utf-8?B?cG5meUc1SHpSNUxaM1FhY2s3bzlncTVhZ1o2b051RDF2VDhBbUVTWFZkWmVO?=
 =?utf-8?B?VzZtMU11N0lyT1JGdmJqaEpEMWltakFZV0xEblo0Qlh0UTBqOGRvcjdWaEh3?=
 =?utf-8?B?eXBKRHQ4N3piMzhpUnpsRkhMWm5JWVdzb0VlU21wcTF0MzZFOE1xWEd0UnZk?=
 =?utf-8?B?a2pGcThQNWtmNVgxRENVU2NUWXUwaUMvbWRYS1AvUUFqdk9lalN3aVhUb1A0?=
 =?utf-8?B?dys4NStKN0FFVlR3bVIxeHQ5dkYvNjA5ZmxrU0RLNm96SUtodjV2Nk8wNG84?=
 =?utf-8?B?MW1IZTFISmozUG9MWjdEQkdYNlVpWDZjWUtDZ2U5QlZWc0p5dVk5VGpJcTFZ?=
 =?utf-8?B?Z2FYTklFMmhsUjV2cHlTTGVKZlQrMVVmTWZrSUlGQUlSSUI5eTlnYlVzdzA5?=
 =?utf-8?B?ZXlkM3dXd0JLVWVTdG1YcVJJNk5NWTJjdVRJdWNJNlowcmo2djFiSytCUzVh?=
 =?utf-8?B?eHMzTURRbk5ONWpZMUdqTEtTbmhmVkZCdDhIczlXbFdtK3Vic0NVcEVXVW8r?=
 =?utf-8?B?SWdCenlhRFRjQWZsbmdjUXc3Z29zMFFDWXBWWFBvYzRUelpNTGxndlhnWllS?=
 =?utf-8?B?QzBhbGRrWE5vR21VajFodldwZ2VlUForSGNkbVlyem14NHArYUtIdVlqbHEx?=
 =?utf-8?B?UENzZCtSZmtQWTF6VFBrZ3FUM1JPakx3R1NBWGV1bDJYNU9oanFWVHBrbFhE?=
 =?utf-8?B?M0xTdlpwTjRyVk9ia0VTK1cvNEh3UmdoTUEySFNnL3FMN2ZNbnBCb3FDdysr?=
 =?utf-8?B?ZkEyZ0RlVGJ5T2ZXdUI1RS91ZVFTM1QwY1BJeXI0ZDU1ekIwc29ZTzNadzZ3?=
 =?utf-8?B?U2FNeVdnRVpQL0lja200UUVGdVl4blBBMEd4MXM0eDZHTGIxcmdMSm1kSS9N?=
 =?utf-8?B?eGYwRjFlRklieDZpNjlwVlF6QmJsOXFWS1h6Z2FlSHRVU1FQODg1RzNFdXVZ?=
 =?utf-8?Q?kVDhsdJ8CVE1lQz4S6DBqMW6r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e41f55-9033-44c8-8533-08dd5a64aef3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 15:04:23.6736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5K0p+q8LPYsN0cA1y6RMfOM7FuZcUYAHxIGoICediGv6X69Evz/kr9dWpcnZenhTKPp9uVYK2VvpUrVJvm7uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8848
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

On 3/3/25 02:56, Tom Chung wrote:
> [Why]
> The Replay IGT test need to communicate with eDP via drm_dp_aux*
> Currently the test will report FAIL if no DRM DP AUX Interface
> found on the system.
> 
> [How]
> Skip the test if no DRM DP AUX Interface on the system and info
> the tester the DRM DP AUX Interface need to be enabled in kernel
> config to run the test.
> 
> The following setting in kernel config needs to be enabled for
> amd_replay test.
> 
> Linux Kernel Configuration
> └─>Device Drivers
> └─>Graphics support
> └─>Direct Rendering Manager
> └─>DRM DP AUX Interface
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>   tests/amdgpu/amd_replay.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index db2ac2de9..500e8253e 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -212,6 +212,8 @@ static bool dpcd_read_byte(int drm_fd,
>   	closedir(dir);
>   	close(dir_fd);
>   
> +	igt_skip("Missing /dev/drm_dp_aux*, check DRM_DISPLAY_DP_AUX_CHARDEV in kernel config\n");
> +
>   	return false;
>   }
>   

