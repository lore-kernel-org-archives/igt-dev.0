Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708D0C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 23:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFB610E0D6;
	Tue,  1 Apr 2025 23:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r05jmc4G";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AED610E0D6
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 23:57:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qipn5FLbW2uBbRvkNi231MWy0gKqiTjfTZ9s+/w57d9AugTz3TUXzBfgb1U28Qx43uyoKvMN5M4DPVys5mAa447fvAAwv5T9iD999X/l0x3XK1Uha+5npSFtHO6YF4NwRmipZR4//8czc52Tc8IzWzhzL68h8U5I86fFGBzQbQ1Q8GKZ3OWudXKFlD2rF9s+i29gjj1N3rAWk5Po4Fg+DGbzAisKsshy1Vg5q37hu5dq76nzInD+kRqC67GQoayxKq50nKIVHnC5sk1Xjxuh/ZQtyZ+yp8F1o9zazDLouyw7RaMBdsH63OQIPd27GfL5V4gBd6dOcjF4ujSEJL4oVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaQwLN5yTJrlndodB0SCA4bUta/mR6c9mCN7pFmFd0g=;
 b=rfKEdJ0OK4xH0PFqCiLXSoGoIgViSCPj1CDYfw5AM6bD8wwwa6pl2mQLW//5NpV/idS/NgDe4RrVH6s5SMjtij/6nbr9An9WGg2Mxm/3MTlkcEh49bcDCG5A/yS0aoBC37cuoASxvvYQuYTEK+xxCJ56MzIrAzsp55pD3EhGfNfAXh3gfvssR+sGSiG0FAvm/bEGxq/GBF3nG3eWFwl339m0Nyk5w8xkXJf5r1/YjAs0lJWfgXVbEccVjI7UDZfexrLsQwbKD4s+XAt2skaAIiB7MJzIuUX6LkXMfsGavzRgQ8dPmPPfOCWNo0s+NaKJPcU0zFLNK7s+0r+615ay4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaQwLN5yTJrlndodB0SCA4bUta/mR6c9mCN7pFmFd0g=;
 b=r05jmc4GZJRj77FdOo1mcKSxV+R87jh2Wk4Ko4dYW4QL/D8NFw+55eyyTGQ46rXLx2MmNeuCAwX2reE3kE69D6Vmn/nBE3wsX2Og8EyUYtnAsHlwGqFnnyh6YKoFpWa5hGyGwSXduhO3ot+o76KklyiVqlNhiWcHQfPiLSf10PY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SN7PR12MB7178.namprd12.prod.outlook.com (2603:10b6:806:2a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Tue, 1 Apr
 2025 23:57:16 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 23:57:16 +0000
Message-ID: <8bbb47b2-70d7-4f9f-b08f-0949fcae17a0@amd.com>
Date: Tue, 1 Apr 2025 19:57:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/19] drm-uapi/amdgpu: sync with drm-next
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
 <20250328082416.1469810-13-sunil.khatri@amd.com>
 <20250401160634.pttztce2lrj2tver@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250401160634.pttztce2lrj2tver@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0291.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::6) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SN7PR12MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: c04bc8e4-61a1-40d4-087f-08dd7178ee26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmp1ZGxWZmJZdWZNZGdLdmJaZmFmd0puclRIR0JhczNwM1BWK3BaNzViSWpM?=
 =?utf-8?B?RU5wMDhweTB3OTBVbEQzOHV2cThiRnBSa0Z6UWZnZVdSMEk0MGtDSnpzSklO?=
 =?utf-8?B?cVpvc3VWdHEva2ZTOE1ZQTRtRnRJV3dPRHdaVGpNK1M2MjZxYmh4VnZDQ2dt?=
 =?utf-8?B?UWtZYmN1U2lTeTRFY2FWVit0WmM0dkpFQUE1NXd5b1M1TnZkYWNHSlgvRHJE?=
 =?utf-8?B?cHg1SUI3cTJ5NFAvMkZUaFUxNTNYaFY1cjJUdWJmWXJRWllmdEM1OGdDZmZx?=
 =?utf-8?B?N2ZWVlkyT0hXK3RTZkNyVDVWcThJTVE3bXk1TGE5bjBrc0N1Z2VLSzMzM2RS?=
 =?utf-8?B?c0ZwblE3T1VHQWtsNStOTFVjbWx2UGduUHBhQXdUMkhrcDdSeFpuVTV4YlRu?=
 =?utf-8?B?NUJJS3JkMUVJRVlSL1hhZGZoT3h1U25wRXNwRUxycVpSVVRvYStoSGZrSG80?=
 =?utf-8?B?QnJ5ME1JaHV3SEsyRFJ1VjhNeUN0OXF4aURYUzhEZmR0cm5zQzRlU0xzNFNz?=
 =?utf-8?B?TUE3clplVGdqNkwrdHROQldEVTh5V1JickliSlR5Y2xLZHN3RGNuSjNPeUJD?=
 =?utf-8?B?eTl3SHhQRDN3OWx1c2R2NTZJVlE0emhvcHhIajMrMG5taXZjV2l4b1grWEVq?=
 =?utf-8?B?UGhlNGs4ZmJ2S2E3MW9YUFNLWHlSUG4rL3hrTEdZVFlVUzRURGV3elJURDRw?=
 =?utf-8?B?cEVOSGpIem5ObUtBTUdxQ0QwMnM1Y3A4andGNi9Sb2JhRXlzM0FrQmplcldn?=
 =?utf-8?B?Y2Q5U3EydlJjMEdlL0F0RHhXVVluUTdxbjhnYU0rUG4vb1ozSHZ4enptTmli?=
 =?utf-8?B?UithUXNHbkYwbjYvL2JKZEpTL2pBSkdUZHdoTUZhbDBHUjlJOTlPb3M0VE5y?=
 =?utf-8?B?U0ViV0s0eHBMY0dIdTF0Zno0TXRKeW5ocWQ3clhkSWNuNzk0bmVNUkQzK1pz?=
 =?utf-8?B?WWIzeTEwZHozYlQ2K3RtZEhFTWlFT1pISDY0NUkwWnJzY002WFh3ZWs4dVBO?=
 =?utf-8?B?WVl5Q2RFWFVIRTVCQlQzSzgvd1FqNnF2RlQ2SDdkNUlnc3B2K3k4RDZmaDd2?=
 =?utf-8?B?QWxJSSs2RFp6c2RHVUJLRVhRSDJ0UHdyb1BiSUVUeVkzZmdsbEU1NmVjdHVO?=
 =?utf-8?B?OWhDSkRncVhZaEl5b0F3SlRzSnhzU1FjeC9tL1pkZ0hXWXkwSW5sQUZqMWhj?=
 =?utf-8?B?UTJLVHhWS09TVEVqVGRvNkc3VGZ3OGo3NTJaWFdwTWNBSmExMGdmYkprUDBq?=
 =?utf-8?B?VmNDMFdhOXA1VlVydFJnY2JuRXhJdVZSR05hTmVKaTRaTXczbTNtZm0zNGJt?=
 =?utf-8?B?WUQzdmJVclpyRUdKbXFBczhDYzdmVmZZTGN5bm8yRGdlZDFMV2FaVXdoRmZk?=
 =?utf-8?B?VmVKMlhmQ3hMLyt3WHRhYVBZWVdGcnRtZ2paTVREeHlWZnBxMnBFWnZpZXJh?=
 =?utf-8?B?RDh4emtacGRZOVdmMnEvckZ2SXhJQUREWmh4aUtQR1pvVUc5QUUvZk0yeXZ6?=
 =?utf-8?B?S3k0bVF0L2ZoKzllVU8zaW1mQllJWkIrZ0VjRnFpU1ZKWDloQXBCaFVrcnc1?=
 =?utf-8?B?cG1LWHVjZ0VrMEJQR016NTFJK1c0Y2xaU3NaZjZMYVFJKyt6RFcrdjMvNzZi?=
 =?utf-8?B?WXZGYlkyMEtoVmpvOTdpYVFuZEx6NkJRNTR6MFFLRmxXOTRhOWhSSmNYSTBY?=
 =?utf-8?B?QUNKVU5JenUvRlIwdnFPeEJ2aVFnTktCVXk0dlB2UkhsdUsvd1RYMkxyazJK?=
 =?utf-8?B?clovb1dkSkdiOVJzL053b0VjRUhUWUFBaHIvTHQ5RGlLYVJyS2hSNDF6c3lP?=
 =?utf-8?B?QVRMSWttOE82RkRHUkpDSjRaazZZY3lJUVJqOUt1Q1lLMzM0NjlhWWI5T0NN?=
 =?utf-8?Q?RPHhAEoV8QWPk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlpkNGgxNTFEbXBwRWR0S1N4cUk2em1zWTlNSGJEQUxoODhZdGhsTE96M25W?=
 =?utf-8?B?by96cFhtQUpPcDRrb1QrZjlmbWVveGJLSmdERy9DUnl2eXlKc3dIQUJOZWJR?=
 =?utf-8?B?WGFBYlI3RE83aTFCRkNJVWFFK05ETTJ6dCtGUHl6TW8vdFhDUTc0S2lqdWpt?=
 =?utf-8?B?enFRZ1dSTFNZeDNicVVRQk0vaFNJRmk0SW5Hc016UENXOVErL0F3aHB6ZmM3?=
 =?utf-8?B?d0dMQzVQWlErZGpOelNCSjgrVjE4bkpwMXZxY3RuaVgrMWdCb0R6OVhURVRK?=
 =?utf-8?B?K3I2NkFSbTF1TC9NcXZWRTZtdFJCdGpoaG5zVHZjZS8vd1ExVSttdy9SVUdo?=
 =?utf-8?B?aHVUN0wydkJ4aUV4bEdEZXkrM1NWc3B3elhUT2tKRWdIbmZEL3B4eUlEczNU?=
 =?utf-8?B?M244RG1vU1dJakZlNFpIVXRIalV6R0syK1cyaDNjNVdrTEM0VTZFN2NwNFU3?=
 =?utf-8?B?N2ZPWVFPT3V4dlA1QlA1ZFNWVVlxMGZOSS9JM2RDRlo2bWh6UHFsZmVDRW9t?=
 =?utf-8?B?Rnl6Zm9hNlVLWVpXUFZoYUFVaVBHZVVDUXhIZnpzYWhNUTV6MS9jbWJySmRC?=
 =?utf-8?B?VTJ5QjljN1AzWWdFSEd2N2NOSWVFT2ZvRnd2MHhacUZSMnZKQmJLeE1oT2tw?=
 =?utf-8?B?NXlhSzFxekhGZFM0QUJEZUVNWjR5bGgzUHhRUlhQTmFZSVBTMXVsc2s3TWc2?=
 =?utf-8?B?eVpGZUdYbmtXTlYyZ0VzZUdGTmJ5bmZUSWp6SDZ3cFBOejBiRWFaTktFK2o4?=
 =?utf-8?B?Wk1EbnhOWEpxNStRajFRd2lNUFN3Ry9qVC9QeGp0WEo2Qms3amFnZVhJVWo4?=
 =?utf-8?B?b1pCdVovZUFIQWgxU1BEemsrMmNTdzZTcjlGN3pCbW9rcnJaM3BkWm85TEhW?=
 =?utf-8?B?QnZ0K3lZMFJyRHdLSnE1WTNRTWhyZ2wrOURrdXc5aURNQ09aeDdiVUxTRWpw?=
 =?utf-8?B?aEROYWp2cU53cmZDbUlZOUFodWZxQjNndG8vUEN1ZDZxc2UvK3dkLzVkUXJM?=
 =?utf-8?B?QmtVdyttazVLVjFDRjQwdDNnYWZDNXlGVVdCQWFlcnRZbUtoNS94M2QxRzh5?=
 =?utf-8?B?YngwNFVrbEZUa21KU2FCY1FRYTBraU94TXZlZDZDR3B0cXdnQWJMMXV1RXpu?=
 =?utf-8?B?b004bkhXWUlDV29wNjk0NGJkMm91TmpXLzlnZnpRZVdaZ0l3ZlJURzdkbS9U?=
 =?utf-8?B?aGYybExYaWlHTFpXbDJQZUpUZlB5empjdWNvQ3I1c0NUQ2JQdzQwdkRsbS82?=
 =?utf-8?B?WXpNWk9hZ1JyS3dLVGxtU1FJY1gvVHJyZUJqNEZXUXhTNUg5ZlhZQy9QTmVx?=
 =?utf-8?B?QytKcW5YVzMxeE01eExVTlM4SzVaQkwwbTJyVjJTWE5mTHNnb3R3akVaVVph?=
 =?utf-8?B?Sy94TnlrVTMvQVJIdXN4b2dQTllhbGlvTlBOditsYUFtSjZIazBCd2ZDSXl6?=
 =?utf-8?B?TnluSnB3c1lDY2tFZXVXL1c0M1R1QjhVWFB4R3lEbnB2WFpOSVpkVGFCWjRN?=
 =?utf-8?B?bzkzMzRwS0pxejF1K2tpVHNjRlNDKzd4MUF4OUdNdW1sOXNSVGpuQjVKclpl?=
 =?utf-8?B?NFlqRW4yR2RwMmxlb1Bqd0JZK2xidlJmWUk5UFVxR1ZYWVYxa1VvamkxVVRH?=
 =?utf-8?B?cHhQZzNacUtENkRwQ1ZOVUgxRm1Id2F5Znh2cnhoRDF2Q2IvYnA0U0ttVVND?=
 =?utf-8?B?VkNkUDY0cUxhR1I0cStRQlRDOFArWGZmcExCd1hoaGFGVkV5WUlQNnFmKy9B?=
 =?utf-8?B?dCswUnY4a3dGMm43ZlNVdkQ5TDNvT3kxMHd3bHRiaG9wK2dETWVyem80WDFZ?=
 =?utf-8?B?bisxN3EweFlaMVdPRWlzc0ZZWWw4cUdkMWhIWHVQVXJTaTVpaU5BdjcyU2p0?=
 =?utf-8?B?TDBIcVdwQ3VENjgxU1FUOTRTTFc5Vm0yTWRBdm9MWjZLUXh2MnJHOHJXbFV5?=
 =?utf-8?B?NmxXa3U4d0xYaFVPSTJ1cmNiR2dCNnRia2pKZnVqdG1zWlVPdGdGTlVlR2Yr?=
 =?utf-8?B?eWFNNmptUjNSejEyeDRVd25ScHNzMVpZdEVnTC9rNDI0UmhuSWR6L2lmL3Np?=
 =?utf-8?B?WnpRU2VaZ0lOWEVtQ3N3S1FtMmVZd3VTRzJWdnJia1A0RTVqWVlZVzl0dDNT?=
 =?utf-8?Q?izdrPeGeEcW8BkMKNT+hyRttW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04bc8e4-61a1-40d4-087f-08dd7178ee26
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 23:57:16.4561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7fpvejiawI7yRDctAIEcahwnxvUWd/bOZ7lfyx9kkseJyGe2uOywwBOyGpvYj6apTSaYw92jSRr+B0Snp40jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7178
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


On 2025-04-01 12:06, Kamil Konieczny wrote:
> Hi Sunil,
> On 2025-03-28 at 13:54:10 +0530, Sunil Khatri wrote:
>> Sync with drm-next commit ("866fc4f7e772c4a397f9459754ed1b1872b3a3c6")
>>
> Thanks Kamil,
>
> I also spotted this strange line and removed it from the commit. While reading your email, I realized it's internal information.
>
> If there are no objections, I'd like to merge without it. I'll wait until tomorrow.
>
Thanks, Vitaly

> I could not find this commit in drm-next nor drm-tip,
> please add also subject to hash, like
>
> Align with kernel commit cd5bbb2532f2 ("drm/xe/uapi: Add a device query to
> get EU stall sampling information").
>
> One more point, you could also consider adding all in one patch
> unless they come from different trees, then please indicate from which
> ones they come.
>
> Regards,
> Kamil
>
>> Adds a new subquery (AMDGPU_INFO_UQ_FW_AREAS) in
>> AMDGPU_INFO_IOCTL to get the size and alignment of shadow
>> and csa objects from the FW setup. This information is
>> required for the userqueue consumers.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>  include/drm-uapi/amdgpu_drm.h | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
>> index fed39c9b4..8108c0c8a 100644
>> --- a/include/drm-uapi/amdgpu_drm.h
>> +++ b/include/drm-uapi/amdgpu_drm.h
>> @@ -1439,6 +1439,27 @@ struct drm_amdgpu_info_hw_ip {
>>  	__u32  ip_discovery_version;
>>  };
>>  
>> +/* GFX metadata BO sizes and alignment info (in bytes) */
>> +struct drm_amdgpu_info_uq_fw_areas_gfx {
>> +	/* shadow area size */
>> +	__u32 shadow_size;
>> +	/* shadow area base virtual mem alignment */
>> +	__u32 shadow_alignment;
>> +	/* context save area size */
>> +	__u32 csa_size;
>> +	/* context save area base virtual mem alignment */
>> +	__u32 csa_alignment;
>> +};
>> +
>> +/* IP specific metadata related information used in the
>> + * subquery AMDGPU_INFO_UQ_FW_AREAS
>> + */
>> +struct drm_amdgpu_info_uq_fw_areas {
>> +	union {
>> +		struct drm_amdgpu_info_uq_fw_areas_gfx gfx;
>> +	};
>> +};
>> +
>>  struct drm_amdgpu_info_num_handles {
>>  	/** Max handles as supported by firmware for UVD */
>>  	__u32  uvd_max_handles;
>> -- 
>> 2.43.0
>>
