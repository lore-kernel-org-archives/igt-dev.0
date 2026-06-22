Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47915CDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 08:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13FC10E2CC;
	Mon, 22 Jun 2026 08:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W1wyOBPy";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9064610E2CC
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 08:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgIVzP1311xnuBvJHKMER5UhBKDhbU/I+s/W4XTtHUkM8W6OePJ64tgiGdHKIqtm0GIy1vhVEN/HVRQFRV+0MVU/DeCgRfmN79i/8DBrBsihPpTwwEMZIfKKeV+AfoZu6NvbiuNaZPTDjqBGTb+CFxXrtJGjZCQuIFz5/0vb9UoA/41vaQw3clZrlaGswLFykZpExTzKSSTFFvsw6eoJjt9MSx2EHLxZvmGdAbfZF5ez3pF75/o2mu/My4WyMp1vm3/pOvAJ13DQqN7oV2gdNIkXXvyR37Gm5DiNebOLq0BqIXgtbgmSKtiFF39NWvryadCt+rSRz/VOLTBgJYgBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03ObKH8Vch8v6qPMceJz7x89mJjXRZrXskd8hCepRb0=;
 b=vZoQKteJppomQtiUUYkLme/AK47wKQhI8UOsrQe+05/+8vXqbsOllLhs44Tm5sjWBxLi34yfm0/DZmEC8aH5CT22ewCF/fejGa51Ce0Z4484Wmaau6YbODBBzjxkW3SSOtzpPQHL5RItGax/UNZGC7ensQJK5dU2LibRUIAuCHv2oz6lAJJqm3awdXvcYJ3N+aWLMq7Dj3ylN0Ih5enMQDriZjWvDaRCn69NYS30ht5ireb7MXof82MVGERzPWyovpMC2ZLHKZpSrb9jvQSPs1sujvGHiFmEqqE2ChVgcR5UicfK9N4Bs0heVRsihEWW2nbL0IrhvAW1CauZ/Gg6Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03ObKH8Vch8v6qPMceJz7x89mJjXRZrXskd8hCepRb0=;
 b=W1wyOBPyViHKZTaP4ofZ6MWHJ9mfOtPJQrbltZYDH4zgGuOaqhf5Pw7OwO6NDSQ5ogmZHySl42LfbBhM4fsJOtwinl18r3BWqP8CfD1l1KR4iTLy0xGz6pS436sBtuXEH7sQ/8iyxqlu+Do+IQ4nmQENC2Cl7LbItACZZ0XbGug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS2PR12MB9566.namprd12.prod.outlook.com (2603:10b6:8:279::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 08:39:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0113.015; Mon, 22 Jun 2026
 08:39:26 +0000
Message-ID: <32325265-fda4-42eb-a27f-d8785287c728@amd.com>
Date: Mon, 22 Jun 2026 10:39:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu/amd_security: Skip secure bounce test for
 APUs
To: "Ramalingeswara Reddy, Kanala" <Kanala.RamalingeswaraReddy@amd.com>,
 igt-dev@lists.freedesktop.org, Vitaly.Prosyak@amd.com,
 Pratik.Vishwakarma@amd.com
References: <20260622040418.454076-1-Kanala.RamalingeswaraReddy@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260622040418.454076-1-Kanala.RamalingeswaraReddy@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS2PR12MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e02a796-c927-4e51-5aa1-08ded039c458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: /eIPLp0E3n+f/XSecuSguLFlCInTSxJwAgLN2V00+iMbsdfc0DrAkz3HRfSdvr1qpuJkQIskqwYMLWz04i4oORWj3X5SjnbstFpj3GDPja8KW9kvihtLU5DvoibFvvpILJJrV/g222MgO4QXFd/xpes7YwieNUdnAh700N1Ip1wyM94c0ggF3Af4Mjr0OhZg3PMJ9hEwj1Op09SymSIOwBIh/OjbyQCZKU4kATgwsCjL/6GK+opmVKfCkCcISmZQLM20H62vnl8/sRQjlMSg38jBif/SS9XZPc0FIwC3onQbC+q9tr1XoFMqTzIrPovYgbLq1OpjzW7j286SUN5RMlv8UX3hucXDIAeAFDqqiXzbWEXbOtdRQlsMOxXmlXYKfTreZhTMq4Ba8iuEuGRjIZjn0qyqboj+0c7R+JfJBAfvzo7Dz6glvuU4oyil90YPBnnU7liUl0U8BFycd0iDVQFudYDUQ+6RPqj51/9wjNoD8OPexJ8hPsGBwFFeJH7yas0pcrRQEcRSFzqLnYCJzTEhkGZQq4Za+34YcMrmAsWQ0X1x1YJ+8J7dtaZ5gebP1wG04lr3LzszFdv1k/TUBJlLDImXPT33/dAOT2dgOYIqo3Rtd3ZTfmd2tcw0HtFlQ5jm4rZji4gqmgQVEf/LsImTh+B1JlEqxRVtVrxPzLU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3Y3Mk85NkMrOE1nTVBVZFlUWjVnMHlwSHhIWFlNMzR4b2VTWHBEMnA4ejlx?=
 =?utf-8?B?VEhHVHc1U2RZVHAyYS83ZWNqdjdITWJEOUx6Z1dzMHltOUdaaS9mZjNtdkFO?=
 =?utf-8?B?TU51dFJ1ZzIweFoyZkdJWHVtYkFqa1VPSVhOaUdTTmJhQXBGR2lBS3lnNDdm?=
 =?utf-8?B?TE1iakhVRHE0QVYwY0o4L2pRZFl6ZDhYQ3BkQ3M0SmtNU1pQL0JPc3VnUmp0?=
 =?utf-8?B?Mm9Gbk5kS25lU0JqemtRMUVoREFVOGx6Z2ZJcDM4RitIUnBCMGJVZkU0R2Mr?=
 =?utf-8?B?VWlYRTlhYVUrRGxyQWR6RldhVy9ZS1RZd3N6dnM3Y1lmQ01CZVhXT2M1MzRG?=
 =?utf-8?B?TkUyZlBFUm8rRjRZc2g3My9pd2hSc1VJcFBMYU1NMXI5aXczRmxNMGZKZUNP?=
 =?utf-8?B?eTFKOEdabTZaekdKcktob29ESW53alRvOHBkK094TFFNWEd4MGh6cXZicm1x?=
 =?utf-8?B?YjlIemVDbGIvTS9ZVC9HY3QrWm5mWkZWbUdtVmJjRExzRVZ2ckdjaGw4Umcx?=
 =?utf-8?B?WnVMeDgvam1wRDU1Mng2VTNPUjhFK1JVZnI3Y0t5Vmhmd2xjWFRCaEJ3eXNI?=
 =?utf-8?B?bWpwSEZDR2NwZGhtNVBoNy9TQkw3OHlMa2ZqR1lWZjRTRHpCRjQyUUVvNGhu?=
 =?utf-8?B?djlvZXNkRGtPTkR4cmlWNUlLWUQ1ODhkSjJXSlVtRW1rSjg5L2tJdHdxaFVj?=
 =?utf-8?B?Wnl6NWMyZE1aN3dVaW9YeEd0bTZsNlJIMHNMdEtWMDhlWlY1WnN1RkNON3V0?=
 =?utf-8?B?anJwQ0R3MzgrREtocTFCcXhoUGdxdFZJSlRJdGo2MUtxL2RqMGc3QTEvVm0v?=
 =?utf-8?B?eDJlUFB0ejZGY0YzWCtYdFhZNEZQbGRDb0lXM0ZMSWR4YXZPNlhaN2E3SlFF?=
 =?utf-8?B?MXRRdFJhQnkrS3MwcSs4VHg2QkVQcitpVmIvejZGSUJlNUV0V1B2c0xkZzhB?=
 =?utf-8?B?QVh2d0VtK0lydmw0UnVtR1RiRzR5bDAzRTBIV05vL09LL3JLVjgzRHUvZ2R3?=
 =?utf-8?B?alRFZTczWCt6aGc0TTh3UUk0aU0zWVB1RlA0WFNKc1NzcGtOSkFJbzRxTjFZ?=
 =?utf-8?B?U0FwQUF3RzBtM3BFdlczM05iN3JWUmZQS1l2My9EbFJaSzJtQ2MxWDF0TTVY?=
 =?utf-8?B?ZStiMDZnNzVjR2xPMUg2SXlDeWx6eGFzZVE5QzdmRDRMcUlTTFFNSjNUUkdU?=
 =?utf-8?B?TXpQdC9KdkFVNk9RVlNRZW1WNjZWRHUraTRwSFdZTC9WMHd2cFMvd0hmMWda?=
 =?utf-8?B?VjB0L1luSGl1RldFWHZTNGVjZlFaSXhHVVNaZzRHUm5HL2RQM2UydFBaTVlY?=
 =?utf-8?B?Ui9xR2M5ZW1iVTRFNmREcE81TjAvblRBS0Y1b2hLaS9JUzBZWmJVSWtSQ0RR?=
 =?utf-8?B?WFdNQXo2TUpDYlJad3liNnhONmlkOS9xa3VLOGFkYVhjS0tQZ2ErYUMwZy84?=
 =?utf-8?B?SHMrWUdZQTZ2WHhMTUFxRU5ZMisyOXdtR29hM2RJTW5tNHN1Y0xaL2N5UFZB?=
 =?utf-8?B?VUdEMEZWVExHdVhMRi83TGtuZHBMSm82cmVwbU1tbGxjb0hFRDJaR3hFYmxt?=
 =?utf-8?B?MU5SdXNlU2ZRdWZheVFzbk5la090aVJyWkt5L2dSamVOMFNUNHdtR1FldkZj?=
 =?utf-8?B?dUl5bzB0TkQ3ZkpDRmFaYU9FZDFJaTlLYmVia3BBU3BLUXBTTVFZcVU2ZnRu?=
 =?utf-8?B?OE51RWZBbXo1aU8zT0VvMzNwNWYyRmk4aGNZdkFtQlRzTWdIN2JBNmhORG1G?=
 =?utf-8?B?UE4ySTFybndrUThlQThUSTVrbkxwajQxUjdQYXA3TC9WN2hIdm11Z1gzL3U0?=
 =?utf-8?B?ajNSdFdsam1XUWROM2NBWW9TcTRNMGF3MHkxaW0zb2Qzdk5Uejh3SEVZbTBP?=
 =?utf-8?B?SkhhSHkzck54SW82NTlQVHQ4bG5PdkhLK01jcjJDcWRob21BVC81dkVua1J2?=
 =?utf-8?B?c3IvOW84bnphQURRUUt6M1FMRkpBcnhJRkhKSVdBNWwyL0xBNVd6Nkwvd0VE?=
 =?utf-8?B?WmhSMHZJZmltMjdVQ2pEWmVhQ0h0aW5yK0ZadUcxQ2w1ZElRUFo2c1BSWHVG?=
 =?utf-8?B?ZC9NNXNiSmNrbmY2NWJtbzZaQ0ROWXh3OXRTZlk0M1NmZS9YZ0JiKzRTbUFT?=
 =?utf-8?B?WlArRlNCZVVhUVVPeCsrMFJjR2Q1UVdDb3J2LzZYU1FlUVhkdUNYeVFXTi90?=
 =?utf-8?B?U2FkRFFXQVZIdXBQanlGUFRkVjRRd2k4MlJpZzRtL1pXSDVpaDlORU5JRFFG?=
 =?utf-8?B?NmNtRUJzUmhValNmLytJNlpjVUI1WlM3bk9LRTNodm5oRUg4QVNBWmpKVVAw?=
 =?utf-8?Q?6uMxenFORvojQoGMmA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e02a796-c927-4e51-5aa1-08ded039c458
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:39:26.1947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9w8reFB72IpdaP1xUjgBEimavWucXX+liA+tsF1V1GzyVyh3aR0LJUlugaZGynz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9566
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

On 6/22/26 06:04, Ramalingeswara Reddy, Kanala wrote:
> Secure bounce test is not supported for APUs.
> 
> On dGPUs, TMZ works only on VRAM (local memory) but not on
> GTT (system memory) due to HW limitations, so this test validates bounce
> operation from VRAM to GTT and back to VRAM works on dGPUs.
> 
> Since APUs do not support this functionality, skip the test for APUs.
> 
> Signed-off-by: Ramalingeswara Reddy, Kanala <Kanala.RamalingeswaraReddy@amd.com>

@Vitaly I suggested this change but I'm not familiar enough with the IGT code to review this.

I'm not 100% sure what igt_skip_on_f() does but it looks a bit fishy to me.

Thanks,
Christian.

> ---
>  tests/amdgpu/amd_security.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index 9ebb3fa83..2a8ae4a23 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -360,8 +360,12 @@ int igt_main()
>  	/* dynamic test based on sdma_info.available rings */
>  	igt_describe("amdgpu secure bounce");
>  	igt_subtest("amdgpu-secure-bounce")
> -	amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
> -			AMDGPU_HW_IP_DMA), is_secure);
> +	{
> +		igt_skip_on_f(is_apu(&gpu_info) == 1,
> +				"Secure bounce test is not supported in APU's.\n");
> +		amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
> +				AMDGPU_HW_IP_DMA), is_secure);
> +	}
>  
>  #ifdef AMDGPU_USERQ_ENABLED
>  	igt_describe("amdgpu gfx command submission write linear helper with user queue");

