Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7256BCD4F3D
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 19:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FCA10E63E;
	Thu, 21 May 2026 19:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1h0gtVVe";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010032.outbound.protection.outlook.com [52.101.61.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88ECC10E648
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 19:57:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWV6RRuizwyiXtiI+BtErAuclpTKMiyi2okPilTpxHZE1Y3jDN60d9V4PfLNkilCtVMr0fX5YicnJ0FJq7GX8wpYNqmKihn+QO36tRFVZhWOOu6ixZLGN3tOVW0LXOtnfrS2fsxieTsd8QN4FEiYzgsz5FZokSJ8l5m3z3+Y2DgRk7gv+Ab21Z1FXWjTO75lXm/bzgQBPbFN83r7OSzV1Neecf8eW2MiXUfD9IFw7usI5gkZUsD8AK2fBBDPK80t9iFIM/jq7AcS+RWgep6yQqG1R/Pk40TwUwJ4mwOFKdF97U3xW5zPLaUWxzwar+xRjUo1oeBOJOeDYERHeH5Sig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRfBVQ5E9lONLK33U6mlYem5ZI4KMZYU7I/edbr5mjc=;
 b=CK/x5TChR+Dqb9sdWTLP8QiXUoncohLsFGv89HC6WjLmf/8/PaO4Ycg25CFvCCfLKJMhCL6w+oqh8zUz8XPN2QqLxgtpoPIWVbZ3EaofPXsojLgm6V5w99HllUPUUOHyzIC9qJ9yhmAozsvHXV8n9FcwwAcB5UadceuaB1t998G9WkF9FyCS0nSVOogY1K8iJ0i1jA/n2vr3bwSvArJHMvJp1/PyPSRnd3x+F4W0o0LK63bUXLaakmU7b14VP67nBwA9o0W3Q0+/rAfhK3RP3yZoWYF3AzJ6FXQDjwN1nW1JLLGeTupmv91zAZgeTVe9mNjUzYwm7a3nY/xp4st2Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRfBVQ5E9lONLK33U6mlYem5ZI4KMZYU7I/edbr5mjc=;
 b=1h0gtVVegiL5airmvERdCHEtLiId+VnpUWoehNnGlxPhGCDwfMwg+mTH6HtSf8+ndwlXXIrb5pr3OEWPwOXB3VDZtbAI7cseztQvMYgoClYRvt21y8ngPwnCZ33jd5AYCpXPtwAEMXVsaKzWPuK3SYTQv3x6TPfcYnwPrVFnxPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 19:57:44 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 19:57:44 +0000
Message-ID: <92afde82-497c-4a51-a576-dcd3e5426ea7@amd.com>
Date: Thu, 21 May 2026 13:57:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in test_hdr
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Broadworth, Mark" <Mark.Broadworth@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>
References: <20260519150022.3964921-1-alex.hung@amd.com>
 <a01a54c7-674c-4c5a-84d9-966d51e5cc3f@intel.com>
 <2d9b2896-ca25-4a35-b0a4-af9308383147@amd.com>
 <PH0PR11MB5880AFBCBD630A3241917CC5AF0E2@PH0PR11MB5880.namprd11.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <PH0PR11MB5880AFBCBD630A3241917CC5AF0E2@PH0PR11MB5880.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0278.namprd04.prod.outlook.com
 (2603:10b6:303:89::13) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW4PR12MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 03539be8-1e62-4609-2437-08deb7733950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|11063799006|3023799007|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: 8Tw0xYP/fJOVZAqdalkCoPO1NxgFXardbtiBvVt0qUDmcerBp7Cuyp8Ulajh/nbOIww7JP52tZeXffChADch8ngJHL5M1BBS9I+YAR1YQxa90eRCY0RbDJRjxk6TNgGZRAoCyMvTZENffr5zEhSOzs5PUOgWCaFeKE+NxWilLl3X/zksVQRT54SZLoDD5pADnS3RceXBt2tiFm51ZITR/0U27cAPDhs66+EdyrQW8jruhM1iGSBJXvi6eummrEDuiIb4/dUXOD/bcqLOf2n1lSQYHwx8NcG4TNz7eD8CrvecTaKS16ffd+Gq8ZkfHXznO8BCYcdAR9+G7u2XRj0WFXHloajDRrpIxYYHOUiL4CMK4xEjfQLED1Q/r6UdaGv3QEWxxUiGJ6FV6E9MZonKsRe6I2Lqasue+QYLmqyTVI0Wp0TjiTj4yn71tGxslIQOqja5ubxB3PA5GX12sSkuz5/DXh329p5cDL7mI5bH6K4IXJym97UqPYGPxK0NvhMRR0E7hIfWLllVwY4GiV5oCxWrhxMOzxi5kM6pBYa67yz17PhGkW2b8Ua8IIHHkzLGsNtjHYfWqvXWHGH+rweaGOlimQOJOZMMfpq6jr8btpTbxzh0W6t9GCM/DqEA4RTkDsB71a3iGeIA94tiuJI8wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(11063799006)(3023799007)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWl1OXNVa1BFd01CaTlCc1hMVjNzOWtEZDRSL3N6VXh3ekJmR1Vxa0tsTGND?=
 =?utf-8?B?RE1USW5JY3p5dkJFcXQvM1drVU8yeityWG9mKysrNlY1aXFXdnZLb3U0ZUNI?=
 =?utf-8?B?NE9YM3JoM1BiU2ZIWHNCUUlodTc5bE1ySk9JK1Z6RHI4K1RycG5kd0Z1OU5G?=
 =?utf-8?B?Z0h3WXV1eFl2S3BGQ2lSWVlWbkFOWmZ5azdmbXFzZUViUU1rSVAyUHpKZVJG?=
 =?utf-8?B?UFJLK1A3VVUyZS9hSkFGWkVtZFk5bVJHeWJWTzJaQjZJMFNkVXF3NkRUNy9E?=
 =?utf-8?B?WE5CTWptZitjZGlHa0d3SWlWYnhieXNpNXZIeVladnhQUllEOFdvUG5oYkRx?=
 =?utf-8?B?VHY1WTlYRndWRkdReUw4UklFcjBHNzFvZnRidWovKzJtZlFsQTNBcCtnemlF?=
 =?utf-8?B?ZjVYVTZnL2doN2J1L2pIN1hHWG9VWGZyS0pkR3VwQzRobHBHQmJCRUl1VjF3?=
 =?utf-8?B?STArUktZSi9pdEdJMFRxeFRPME53SDFZVGxRbmd3bnFJeVZGeGVWbVRGT1N6?=
 =?utf-8?B?ZzdUVmNPSDAvblU2SDdRZkFSdjRUeGlPMVVucWJ6K3ZzRGZMQTRCY2MxR2J4?=
 =?utf-8?B?eUNUSDhsdk9Qc3QrcytXeTNVMGNvZzJxTmx6QzhBVTgvMjgxdGNwaTBlVm91?=
 =?utf-8?B?dElxdUE2anBnOUw3cXdLeU1vUXJWV285WXp4d3NkSmFCbUNmZGZSVENFbkVq?=
 =?utf-8?B?Q3hvY2s0SU9hUDd3VmxmMEozamFRSXFhMkh3Z0F5dzEvaXlUdytIVUVsRGJV?=
 =?utf-8?B?MDZ1RFNpNjNtaVBLTkUyMG12N0ZuK0RmLzlMSU1adnQ2a2NIWDJuT0xrdkJK?=
 =?utf-8?B?ZHNEYTVhekpKS0pzSEpLQ25adWNSVFljQmFhVjJkbmxVL0x3YllIOGd1WVhz?=
 =?utf-8?B?endBSEZpaVdsVjFTUjFZU25GMlBaWXV3ZjBXekhpK2JndFY3UHE1bkhkQXhW?=
 =?utf-8?B?RVozK2VOYVl6KzU2TkNaZTJVdnpmOGFlcFRIT1BRY3Y4RVFMRzhCazBaUUkx?=
 =?utf-8?B?QlRLZ3U3MGZtM3dLY29XRU43b2YyamZBVnZHYW9sdW9LeDNPNHRuUnh2Umpm?=
 =?utf-8?B?OVpwZGY0ZDA5QVo5Ni9Sa3FUOGsyWFQ2a1ZkMDloWE1Sem5JWlcrZml1dHRX?=
 =?utf-8?B?bTV0R0FLM0ZMU3B5bmpCV3gvcUROZ05OM2RoWXVsVVlqL3hkb09kdjYraEpK?=
 =?utf-8?B?c2tsY0haVTVxb2hVNkZySFBkdFJqbU0waXlLekR4TGtiTFVSaDRsT2hCdzlQ?=
 =?utf-8?B?bzN5Wnd0RDNxUXNtcFhVK2NDR2hDMzhLSVlkL1hnN2VKQVpNaUp1bXJiRXZS?=
 =?utf-8?B?T25XaitOTWRVZVVVYjh3UHB0THdXRWpBVU1xeW92bXNSdXhjZmhwMTRoTThr?=
 =?utf-8?B?d0xQNFNROXUvcmhzMmROMjAvd1h4T3ducWFNaFRuQ29CYTZLbzdoQ3BjY2ZJ?=
 =?utf-8?B?Q0s5UEZJUGpwMWM1NXU1bHdIWE5Yb0pSUVJNKzJ0Y2ZrMkduL3o3aW4yZTls?=
 =?utf-8?B?M01Bakk2RGNFQ0VLanhWUkdHQlNESzNKcEV3dmV3QXZxcnV0UGdMQnR5R1lp?=
 =?utf-8?B?c0ROVUFERE15UEQrTVp0SnBYemMvR1FCN25xN3NFOHF6a1QxQ1dpckFKalRC?=
 =?utf-8?B?TlFMR3lvNyt0WWhENUNxZHFFWXJRT0NnZ3Q3Rm5RWjBVUGZtUlJUQW8xcks2?=
 =?utf-8?B?U2FBOGdTZFhYUklUb1JXdUJFeVA3MktyKzlmUDBHZW12VHNMVzhvS3JaUDRQ?=
 =?utf-8?B?am4ySUpzR1N5QUxaWGxiSEU4RHNKdytPaGVua29KYmFvTjZLUm8xMnNtQ1hS?=
 =?utf-8?B?RXRrMGFhZDdzUTY4UVlNRmhpdEhLazd2ZE5HSWdueFlzd3ovVXllNzdQRE1x?=
 =?utf-8?B?dlBQRnM4Zm9SamN6V3BDQ0Fza0w0Wkc3OGxaMm83eDNOcGhJamd4TVR2dnhp?=
 =?utf-8?B?Zm4vWkdvOCtIMWVFNGtCSEdNb210VHQ0S08zdHd3NmhnMTkvWGR1YzB0bENK?=
 =?utf-8?B?alpVdGV2VVZPcHZsYktFSFNEbThPQ090QThaRmpBdWd5aW9xeWlpRFVwNXFn?=
 =?utf-8?B?R0FJcmFHNnFHWitscVFyK25tT0RHbHJQY3dsNE5Cem5hbGRIR2N5Q2U5UGpD?=
 =?utf-8?B?NWdGM0thRnZmcGhTYmVPM0xrMjRiTXh6M2pJTloyc0tVUkVtNzVPdUhIUlQx?=
 =?utf-8?B?L2lzTGVzZERUa2NRRFBidjNRSllRUlM3RVRhWGU3QUQzUDhYSzFCZ0hCRWtk?=
 =?utf-8?B?WVUxUEFSQWZFenpCWjR6djN2RFNobUNpazlabFdRdkwvRVh1a0VGeTQ1dU44?=
 =?utf-8?B?eWJDZWo5RmhmaExpQmxndmVHbTRpMmpVeVFVU1ZWTE1aTHZoSTJjUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03539be8-1e62-4609-2437-08deb7733950
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 19:57:44.5550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSJbCSmZTBl1yp9Iljy9WroO6L4i+CNB5o+JcGyryMHeyFiUI+DKPQSSbZo1R6c5MClvsHtic1knyTvABiWLlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825
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



On 5/21/26 13:19, Sharma, Swati2 wrote:
> Hi Alex,
> 
> This test is only for "eDP".
> 
> 
> NOTRUN -> SKIP is not regression, it basically means test was not 
> executed with post-merge CI build, however got skipped with PW build 
> which is expected behaviour on DG2 since we have external panels 
> connected with DG2.

Thanks. I will push the patches.

> 
> 
> Thanks and Regards,
> 
> Swati
> 
> 
> 
> ------------------------------------------------------------------------
> *From:* Alex Hung <alex.hung@amd.com>
> *Sent:* Thursday, May 21, 2026 10:22 PM
> *To:* Sharma, Swati2 <swati2.sharma@intel.com>; igt- 
> dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> *Cc:* Broadworth, Mark <Mark.Broadworth@amd.com>; Prosyak, Vitaly 
> <Vitaly.Prosyak@amd.com>; kamil.konieczny@linux.intel.com 
> <kamil.konieczny@linux.intel.com>; Nikula, Jani <jani.nikula@intel.com>
> *Subject:* Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in 
> test_hdr
> 
> Hi,
> 
> 
> Most of regressions aren't related kms_hdr, but one of possible 
> regression is with kms_hdr on https://patchwork.freedesktop.org/ 
> series/166879/ <https://patchwork.freedesktop.org/series/166879/>
> 
> 
>    igt@kms_hdr@brightness-with-hdr@pipe-a-dp-3-xrgb2101010:
> 
>    shard-dg2: NOTRUN -> SKIP +1 other test skip
> 
> 
> Is this NOTRUN -> SKIP a concern? I do not have DG2 to verify it.
> 
> 
> ------------------------------------------------------------------------
> *From:* Sharma, Swati2 <swati2.sharma@intel.com> 
> <mailto:swati2.sharma@intel.com>
> *Sent:* 20 May 2026 15:07
> *To:* Hung, Alex <Alex.Hung@amd.com> <mailto:Alex.Hung@amd.com>; igt- 
> dev@lists.freedesktop.org <mailto:igt-dev@lists.freedesktop.org> <igt- 
> dev@lists.freedesktop.org> <mailto:igt-dev@lists.freedesktop.org>
> *Cc:* Broadworth, Mark <Mark.Broadworth@amd.com> 
> <mailto:Mark.Broadworth@amd.com>; Prosyak, Vitaly 
> <Vitaly.Prosyak@amd.com> <mailto:Vitaly.Prosyak@amd.com>; 
> kamil.konieczny@linux.intel.com <mailto:kamil.konieczny@linux.intel.com> 
> <kamil.konieczny@linux.intel.com> 
> <mailto:kamil.konieczny@linux.intel.com>; jani.nikula@intel.com 
> <mailto:jani.nikula@intel.com> <jani.nikula@intel.com> 
> <mailto:jani.nikula@intel.com>
> *Subject:* Re: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in 
> test_hdr
> Hi Alex
> 
> On 19-05-2026 08:30 pm, Alex Hung wrote:
>  > Fix the HDR metadata probe that failed with EINVAL because it
>  > attempted to commit metadata without a scanout buffer present.
>  > Create a minimal framebuffer and use DRM_MODE_ATOMIC_TEST_ONLY to
>  > validate the commit without modifying hardware state. The
>  > framebuffer is freed immediately after and the display state is
>  > reset, so the actual subtest starts from the same clean slate as
> Patch LGTM
> 
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com> 
> <mailto:swati2.sharma@intel.com>
>  > before.
>  >
>  > Assisted-by: Copilot:Claude-Opus-4.6
>  > Signed-off-by: Alex Hung <alex.hung@amd.com> <mailto:alex.hung@amd.com>
>  > ---
>  >   tests/kms_hdr.c | 31 ++++++++++++++++++++++---------
>  >   1 file changed, 22 insertions(+), 9 deletions(-)
>  >
>  > diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>  > index d50f87787..d21f1b3f8 100644
>  > --- a/tests/kms_hdr.c
>  > +++ b/tests/kms_hdr.c
>  > @@ -571,16 +571,33 @@ static void test_hdr(data_t *data, uint32_t flags)
>  >                                                              "non- 
> internal panel.\n",
>  >                                                              
> igt_output_name(output));
>  >
>  > -                                     /* Signal HDR requirement via 
> metadata */
>  > +                                     /* Signal HDR requirement via 
> metadata.
>  > +                                      * A framebuffer must be 
> present for the driver to accept
>  > +                                      * a metadata commit. Use 
> TEST_ONLY so hardware state is
>  > +                                      * unchanged.
>  > +                                      */
>  > +                                     igt_create_fb(data->fd,
>  > +                                                   data->w, data->h,
>  > +                                                   hdr_test_formats[i],
>  > +                                                   
> DRM_FORMAT_MOD_LINEAR,
>  > +                                                   &data->afb);
>  > +                                     igt_plane_set_fb(data->primary, 
> &data->afb);
>  > +                                     igt_plane_set_size(data- 
>  >primary, data->w, data->h);
>  > +                                     igt_output_set_prop_value(data- 
>  >output, IGT_CONNECTOR_MAX_BPC, 10);
>  >                                        igt_hdr_fill_st2084(&hdr);
>  >                                        igt_hdr_set_metadata(data- 
>  >output, &hdr);
>  > -                                     igt_require_f(! 
> igt_display_try_commit2(display,
>  > - 
>                                                                              display->is_atomic ?
>  > - 
>                                                                              COMMIT_ATOMIC :
>  > - 
>                                                                              COMMIT_LEGACY),
>  > +                                     igt_require_f(! 
> igt_display_try_commit_atomic(display,
>  > 
> +                                                                                  DRM_MODE_ATOMIC_TEST_ONLY |
>  > 
> +                                                                                  DRM_MODE_ATOMIC_ALLOW_MODESET,
>  > 
> +                                                                                  NULL),
>  >                                                      "%s: Couldn't 
> set HDR metadata\n",
>  >                                                      
> igt_output_name(output));
>  >
>  > +                                     /* Reset IGT display state; 
> hardware was not changed. */
>  > +                                     igt_hdr_set_metadata(data- 
>  >output, NULL);
>  > +                                     igt_plane_set_fb(data->primary, 
> NULL);
>  > +                                     igt_remove_fb(data->fd, &data- 
>  >afb);
>  > +
>  >                                        igt_require_f(! 
> is_intel_device(data->fd) ||
>  >                                                      
> igt_max_bpc_constraint(display, crtc, output, 10),
>  >                                                      "%s: No suitable 
> mode found to use 10 bpc.\n",
>  > @@ -591,10 +608,6 @@ static void test_hdr(data_t *data, uint32_t flags)
>  >                                        else
>  >                                                flags &= ~TEST_NEEDS_DSC;
>  >
>  > -                                     igt_hdr_set_metadata(data- 
>  >output, NULL);
>  > -                                     igt_display_commit2(display, 
> display->is_atomic ?
>  > -                                                         
> COMMIT_ATOMIC : COMMIT_LEGACY);
>  > -
>  >                                        if (flags & (TEST_NONE | 
> TEST_DPMS | TEST_SUSPEND |
>  >                                                     TEST_INVALID_HDR 
> | TEST_BRIGHTNESS))
>  >                                                test_static_toggle(data,
>  > --
>  > 2.43.0
>  >

