Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045C5606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 02:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=P0GcefWZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919A610E029;
	Mon, 16 Nov 2026 02:10:00 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3758710E029
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 02:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+9sebdf6WIsBj/BTJn8j1bqtjJX0yKeX3brswNBm93VSCdsQb8pL7TmMsggF3+01YgXm4e3gQobC3Q+7j/cY1n4ObGIt0ztvmHvR5vaLTAABzeIfzLNxq8/VQrwb1pLjn1gq2VWP/uJ1EYSVc9Jydat/ol4NCz8dDp+4jXT+CuFz2kjJR22kg7m+tYR7wWnsqdBqAp5Jqy+JVq+Idltd4wKmedRxu6b8sWzuY5Bucc/hVLoeG5bcTDXuV5nm3HqssCzrm3c33BYUIHa/17cqKwBb/WwXUvO7qbHmQ/4u05oOxkYEWx8YejmFTcaPPXf7Sx76tmeB+1FVLlClg8c2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSVHoTFyu++ZLyHRRsdJM0Hr+wIdsyM5/UTPn65kzjc=;
 b=hM4B5alBE6YaJrb8VDFfQyGC3cfL4fHwlqVnDC0mvB9MpRk6hXYyk0CEJs8WqzuypeGXSgy42a+PHrxm1RXcKLFiWIxSnysIMkky6Gy+szAbf+D4cOOnDE88xUoV8gqBqlQpSk2PcvoXROlrD1RrtntOB5g+rCcRCxmIXoIqQsVsUecise0PkJjOeKcacH0rah93k6FNRZZoru8teoMEA+SoI35sx80plk6fMHCDm+LSruK/kdn/MR2/LwBQortsUdac6TxWyt72avdGeeEN+sIZr4VcfTea/3FT2NVDqTjS3zSvhhEjEYOqH3dG7l4ahTbA2MPULBIJ0Ho9WshilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSVHoTFyu++ZLyHRRsdJM0Hr+wIdsyM5/UTPn65kzjc=;
 b=P0GcefWZf3NkgA5nT54v469qndrUn7bKH9P9ocQn3r8sfMJBvxnH/mNiTmlB8D6Z6kjJAXPoUTRXh3UKAJ65/SxZD/1nAFm+mZ5CSZS2UXmGW01RP1UedDDtq5Sb7fVF+jHSs8nxsZUgfjmZzis05h8VjOBKTvdyK80cLdpj1/k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CHAPR12MB999225.namprd12.prod.outlook.com
 (2603:10b6:610:2fe::11) by CY8PR12MB7363.namprd12.prod.outlook.com
 (2603:10b6:930:51::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 02:07:53 +0000
Received: from CHAPR12MB999225.namprd12.prod.outlook.com
 ([fe80::a4c2:82c3:da88:c585]) by CHAPR12MB999225.namprd12.prod.outlook.com
 ([fe80::a4c2:82c3:da88:c585%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 02:07:52 +0000
Message-ID: <b62e3279-6c09-4160-b4fe-c2cf88621c88@amd.com>
Date: Mon, 16 Nov 2026 10:07:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_replay: Fix state and sink status
 checks
To: Jani Nikula <jani.nikula@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, sunpeng.li@amd.com, chiahsuan.chung@amd.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20261113052845.3333547-1-ray.wu@amd.com>
 <87585b0c7e851c63d31c6a8ddba95b20eb543d8e@intel.com>
Content-Language: en-US
From: Ray Wu <ray.wu@amd.com>
In-Reply-To: <87585b0c7e851c63d31c6a8ddba95b20eb543d8e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To CHAPR12MB999225.namprd12.prod.outlook.com
 (2603:10b6:610:2fe::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHAPR12MB999225:EE_|CY8PR12MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d25cdee-4942-41dc-0600-08df43866c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|4143699003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: a2A01pWPYv/DH+IQo9NIFSsYOkvPrg87i0kEJY924FV3WezX/oFzHZc+c8RfVo5TWPc7PVoZxEx8rgium815m0lkjdy4e2a+4Xt2Ki3lJllMCHeVA0JNdEo2/bybblzd+OTQ0PrYNg7i7hpJYoKDxAhKeBOnLB2B9UFhHs9bZOF6ArBuEHCzmOdu2c90nFPSiw+6K8GZb1zrxBaMTBes5Q24mmUsigNGp6K9HB8n99BLvPKmXe95VDz79W/e/eRDZrQ62bxD+W6IZOivzdVVaA1Hs76R0Z4Oxs2JrJaDVxGVSt7O61b+F+j6JlS7v+fr+2Sn176XupE2ZCJFvLxqpoB60uWbcpUyP83t482teHqSODc5P3K4oh0NaYAtkcNCudnl6u4wDKbY5wWPuhvYfiMmKrn1IJxOdRZk/oHgW/8bQQX1CSffbwe29QFrzWt5TFZzpFJALOSPHlb1s3qxrjvGp80HVBKImlNt6rB1f3OXAhLcsy62E6lgAb0h0yLPLKYXkIrJ+YMJgQCwKdmgakOVAuGiTaxpXke3WWeM4rNVmsjykS3LxXhzic+Q22qp3/Lo3YkO4p7ukifYLgSmHkpMgGdC/7wXan6lIg8XFLMy9+CVatESfiAmo1CH9hyDwOV4u8cq0t1+iGp84Prvhtw0pd6XHiF+WKKEguoin7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHAPR12MB999225.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmlvMzVGcHNlL0JLN2ZtYkZOVHh6NjNnNThwZG5wT3lpejlLOE01Q2N2ekts?=
 =?utf-8?B?VWNLWXJ3Q0RleXByTis1OVd3VnVmOVVLV1RySDNMTWdtTDMzbkdadDNoRnda?=
 =?utf-8?B?ZU5YSWFvZUNRaVZKUlhkNnlWTHFZVUx5RkZTTE0wdTU1K085dmQ4MUFlKzVa?=
 =?utf-8?B?RHNVL095Q1ZhNTdjMmJ5eE1CQ0tlZWJMU3VYQ2w4aTkxUGlhalRsK1V1WUx1?=
 =?utf-8?B?b1JsN0lkRFM4Ynp1U0R0ajE1YXFkN2Vnc05NcStBcGxidDVhTGxEckpIaC9C?=
 =?utf-8?B?L1l4Qytra1QwUFpuWWtTeU5SZS9EQ01mTW1LczJjcVVZT0NLSThSbGx2djMw?=
 =?utf-8?B?aGt6Y1pYTUp1VDk2dVJwNFNLRHpUVUlGY1Naa1Fvd1AxUitQbGhteGdYWDQ3?=
 =?utf-8?B?RkRsMnFzTDNDSWZSUDRiWlFNaGNGQnNGNjB5bFlndEJaN3pLbGk5RmZyM2Fy?=
 =?utf-8?B?TWY3MEFSbG42bXdDU2tuS2xCN0xXLzN4a2NaM2VnOUZEeUxIblY5MlI0MWJQ?=
 =?utf-8?B?MU1TL0ExTUs0MkdQWlQ1ZFZpRHFBbFNza2ZZTU4xaVczZUpETFFBLzhOWmto?=
 =?utf-8?B?TUdPQXpYc0pYR3RoTmJHZEFHVW1RbHEranZ1Y3RtcjNLSkdjbGdwbGY3cm1q?=
 =?utf-8?B?c29ZcFBxWFQ2Q2JvSFoyV2kvczFVTC9aQ09MaUNiZXRBemdjd2RjM0tqZWww?=
 =?utf-8?B?K0dzd2VwUXF0aTAzTHBCYUFqajBIMmg1VXMzVUJKK3dwSlg2RG5ZNGpTUkVy?=
 =?utf-8?B?aXJTM0VKenFEb2tDalJvYmZ0dG5qcitoRll1ZDFyQnRCNFBnR1Vuc0V1L2Vw?=
 =?utf-8?B?K1dMVFUzaFRyZWZOd0RKM09aVEZnOEo1WEF6Mmwrdm9MZTBQanNFSVk1NDVt?=
 =?utf-8?B?cm4vT2x2aE5ZOEJXM2hqaVBxZ3hGWmErbmMxNGJPUDI5bVJOQWpucVZ2S0tr?=
 =?utf-8?B?cy9sQ3lHRVBrVGRnVDlwcGVrRzBFZVk0cHVVT1JLMGo3a3NVWUY4dW1kSm9h?=
 =?utf-8?B?NlhvMzhhTEZGKzJGemhiTmM5UHdCd1R3QXI0MGxLa0ZRVEYvdndXOEhMVVJB?=
 =?utf-8?B?MHd2a1B0ZTNPN0FwdFkwQ01adFVkZWFDYjRFMm9ZOTNJdTl1TVNQZk5oVHpa?=
 =?utf-8?B?WkZIZG1INUtwcGFhL00xYWh6bXJmZkVtbWZ4R2NTYU5sbWNINXB1d1BXMjRG?=
 =?utf-8?B?VlZSYnBBMzBUZDBYVTFzVXBCak9iS1llV2M0dnVSaVJ2SmIzNi9ldjdRVWsr?=
 =?utf-8?B?TUk4T0lNazRGNUduTVlLREU1cG9UOHMzMllyN3RFS2JOY3llZHR3ZTBBK0lk?=
 =?utf-8?B?ejlMaGJXdkRWa2paV3prMDVxRWxtZ0UxaU45WWN3eVpNdjhubjdZeGFoMEVi?=
 =?utf-8?B?LytzVTcrTE9wUzcwdkdEUU15cXNqVWRpYytrUVFiRHdkRks3cUozYmFxMkhs?=
 =?utf-8?B?alVKc252dHJCNzQwdDU3VkNGZ3JpYmttZFJsT0dTMlB3UHVLWHFLRHh5MWNy?=
 =?utf-8?B?VWRvM0p1MEdXK3pNTzFaRm1CNzl6RzlXRzBSTU1UckFrK0JheEpxZTlXZ3VJ?=
 =?utf-8?B?QmIvblBlUUZRZEV6UTM2Ri9tUm5hTVpwdVd0RVNabno4ZkI5cWVFYkV0US90?=
 =?utf-8?B?TGFnQm41WHFzYzUxWnFsektyN1NVNWpMbGkyYWRXbUlTK2oya1UxaTl2K2x0?=
 =?utf-8?B?TThoOFB6VWs1RjJmMWovcXJTRk12cmxPVkVrUXZSS0VNNDJLVjYwYVo1QUt0?=
 =?utf-8?B?aTlySFJxZmVkNEdCNGNPOStpRzdGN3pSTW56T0lWQW00YUR2aURaRW1nUEo4?=
 =?utf-8?B?d2tpWXpuVUozVTZFbS92Njdmc2s5Ly9sMWVQbFdRSFN1NEVwR2NHU3U0MlZw?=
 =?utf-8?B?Ulc4SEtsR2ZUbXVPRjFnMUVRNWIzOTBzNGhzWUwwcXJVUTdjNGxHNkZkTEJy?=
 =?utf-8?B?Tk9jMllUS0tsTGJ3aFlJaE5XamxqekRTcEJzaEpOSGZXdFBPY01FWFdwdkJH?=
 =?utf-8?B?YktDdFBWekNNRDNRREFXVkRJeEtZL0VObDdIZWVjamE3TVVjM3pTMzBPeU5S?=
 =?utf-8?B?YTFrc1FrNGJVOFNpOTVJTDdOYjM4d01qNms1cnlhZ0dmbWdIVFVndyt3MkZR?=
 =?utf-8?B?WmlnTTl6cC9JNktDcnRRWTFVZEQzcVBTSVJQN2lrWUZWdjl1a0IyY3J2cVdz?=
 =?utf-8?B?TlNzMXNnTEE4NEZIUldSVWpPUDFTZGtNa1BFY3dqa0xBTFJqa25ra3NaenFl?=
 =?utf-8?B?cUxWR2NTM3MxU0MzWnBoT3VjTW1VbTZXQlVVZi9YY1pVVWtVU0QwOWtza0sx?=
 =?utf-8?B?QTZvZ0s5bDRSQWJSZVlZTlNJb1doTG93ZUZBaXF4QjVMNjBzVTFHQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d25cdee-4942-41dc-0600-08df43866c13
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999225.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 02:07:52.8711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THY6vG/rv2Ve/oCeIyCQss5/u42BRFjn1WXDGL/jTFmsl1hYRsJoqdCu9dors5xPnDh4LagrIOPKbXy9GNaygA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7363
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/13/2026 7:02 PM, Jani Nikula wrote:
> On Fri, 13 Nov 2026, Ray Wu <ray.wu@amd.com> wrote:
>> Most checks in amd_replay can never fail:
>> - State range checks use "&&" and are always false.
>> - The live-mode test_mode check misses constant live, and the
>>    static-screen check is always true.
>> - The settle check accepts REPLAY_STATE_2 (entry only).
>> - DPCD 0x378 is only checked for non-zero.
>>
>> Use "||" for the state ranges, fix both test_mode checks and require
>> REPLAY_STATE_3 after settle. Fail on the 0x378 error bits (desync only
>> when enabled in 0x37B) and sink device status 0x7, following the amdgpu
>> DC bit layout.
>>
>> Also read DPCD with pread() so a short read cannot return a byte from
>> the wrong offset, drop the double close of dir_fd, and fail instead of
>> skip on page flip errors.
> This patch just accidentally caught my eye.
>
> Suffice it to say I think it's doing way too much at once. Some of the
> things being fixed are pretty bad, and really should've been caught in
> review two years ago. But please stick to good development practises
> also when fixing past mistakes.
>
>
> BR,
> Jani.

Thanks Jani, agreed. I will split it into one fix per patch and send a
v2 series.

BR,
Ray


