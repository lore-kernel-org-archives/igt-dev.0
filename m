Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAD5C71135
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 23:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB1D10E74A;
	Wed, 11 Jun 2025 23:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H4oOr98i";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7B410E74A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 23:02:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrkQDgyRr+S1Y4ve/QnnGjQ5bKhbgZ868u4/WW7T80jr3p3x4G5/W0bYicUEoAkykzkRS8LhnJBK3swVed/3GKC0BbM70Xl/A/pAO510753sLDHunk1qKXzOEuprrhi4lXhfX3S0emcxRoJRbUvGzojoj/e9LmQWze2FjrKmgC6Av7iUwBTgaktyktiQkjUvIeQXIHZwmVL0Jb8FBYh8gdPQqFwgu39WqCbYUZej46TsAsMSSRyWJL0DUgd2hkjHio+WbjxRUJl8tjQkaGQVOZl3wuAQsaZ1H3J6KdX4kGvFcktRMtmaUugKTmzSjm6QKRXnojgRQuW3F2qswzqEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qieqHgr6euMZoP+4nze+fNIll0UmlLYtkCi96rlffSY=;
 b=p+2zo+3Sll8cWoLUGQ3VqKH2dJyx9eNM0Oerh44UPnMvN5MBOTgCA+HiZh8zwi4GFBZaS0LE+7H9VW3frjFTgDzPy1xklf7GQ54qjHiHsIH6Qdw1VZh1t7PvGURFUz6n0lrnUlnlVMUZaMHpsIlovMkM+63QLgwlWNx/3/hyTIXwdtlXvyUNLU7n/u0FFaAvs2woCEBEP6oZRnMnsZ2aukALXjUdimKFuC5oTiKLAgOhyiokXS7WCa1GnqWObKQAnXUtTnYJS5o53Tifs5oNi0hLo7EPUOFQgufhbMFvoRMPBLEHO/PMf7+eU+duDtUEah9tlDF7QmWu8yHjezo2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qieqHgr6euMZoP+4nze+fNIll0UmlLYtkCi96rlffSY=;
 b=H4oOr98iOOtyvLAYIkl4DjFhAP2Cn/oY9eebA45DHNQNEwa0a3k2xxarf5jBd/IFZXEh7mILQCA0kvxscWJF64whf/xC+aiBzubKKOsHxrjiq6sPQkw7jw5yvkKpPf1Lvx6Aet6Q1UL1BcGPzXKVzm39eg4DxIvAWHmAwuov7dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SA1PR12MB7175.namprd12.prod.outlook.com (2603:10b6:806:2b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Wed, 11 Jun
 2025 23:02:34 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8792.039; Wed, 11 Jun 2025
 23:02:33 +0000
Message-ID: <e62158f8-c6ae-4fdc-94d4-b6ee760a63bf@amd.com>
Date: Wed, 11 Jun 2025 19:02:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/amdgpu: Fix compilation warnings for USERQ
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250611212500.1940399-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250611212500.1940399-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0163.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SA1PR12MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: b052a807-0b51-4a66-bcb1-08dda93c0cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGFQaEpTWEJzdUJ6QjZMMDluZno3ZUQ5VVIyc1cxZCtMYytlajdIblVNUUN6?=
 =?utf-8?B?NHlSWWdpRFE5eW40SXFIZTVDNnVpRUNtdU1FNU5MTWxYdHVnUjhJSlhES2Nj?=
 =?utf-8?B?YzBrcnBJT3lKNEZid3VwRWNid1dqUk8rZnRSVklJODMyME9hbHcwSWtFWWVz?=
 =?utf-8?B?WWlYdnJHeWtCcWJ3Yjd5d3BscUFTOVA3UEJPTkl3YWtJRzM2djNGU2xYbm1l?=
 =?utf-8?B?UWlVTXkxSnhoSExYZTJiNC83QjFkUjljQU1WZFlVeEh5Q2VXb3NHYTFzZWJz?=
 =?utf-8?B?VFAwS1NleXRsL0JvVzlOb1IrNmFyQmtZaHR1ZkZud0dRY1FIQWJXTVFKNVVJ?=
 =?utf-8?B?ckFmajNHSzUvTWlhcG5McDBoQTlZV1hoRFNQVUt3WTlhVS84c1NMSGpEMXVy?=
 =?utf-8?B?UWcwOE9PSUMwb0trV3hSekNnT3R2ZDJ1ZmhyWGRkNlk4aTFKK1dhcXB5cEZr?=
 =?utf-8?B?b1k0UGJHRldwQ1QzWVJwZVhKTjNDemFOTTAzajhaVGVUVEY5elRzVTUyL1lV?=
 =?utf-8?B?aEhUaXh1OHNUSnRrbmJyUGZvNUxGeDZGd2Q4R0xBU2Q4QTBId0FuV2w1OXM0?=
 =?utf-8?B?VEJzR1JoY1craVpCSUdIZnN6b1Z6R1J3YnBweS9RN3VwS0ZBNTM4WW40Ukhk?=
 =?utf-8?B?V3VOSWNiVDZUTDI1NlFTWDJnQUFlSnRHc2tJT0VUT0N6WU5vQk8zWlZzYzBP?=
 =?utf-8?B?MHExWUJHU3lFaTZ5RlRBZjZMdXZZZmZqNklGQ2RVby91NGRTNWNLZlRpdzJE?=
 =?utf-8?B?eDdFY3o4YWRacDVVVkVlWU5yVjF0ZmVyZm5iWW96NndKNm55WGo5L3NwMkY4?=
 =?utf-8?B?SkhPa3V4ZEVxZ1loZ1R5N0krRERzdEZUNmxWRS9XdUJOUlFoZHM2cGcyTmJM?=
 =?utf-8?B?OFpkRStubGFIYTU3a1hCbDhlK3QzSklqQ1NhUTdRUHZIVU1NQnExZlMySFFH?=
 =?utf-8?B?VUpDWjdZdEZTMW80UnlOWFMxMXdzQXV0Y0VKRmo1eVN3T1IzYVBjTjB5ejls?=
 =?utf-8?B?STBvcVFONjhmQkJrWWpoZE95cnY5S1Y1SWsvSUV6SHJHWWdseXdpUDROVUE5?=
 =?utf-8?B?bGFkUmhwREszN3g0SnRLMlFHZ1FPc1IvRjFuUGl5RkhvMGNOWjBub014azA2?=
 =?utf-8?B?YUYrV2ZuUjJKUzltKy9VTmJrVGhWd1lKY3dlbm5EeC8zUTM3QlVvYVRHeGI4?=
 =?utf-8?B?SHZ6Nk9NYjFJT3BFSzE2YWZ3WHJCbTkzNXRVYUNCUjU5c2xRbVBacjh4WVBS?=
 =?utf-8?B?cjFubC9GcGhpdHJxSDJOeCtNV1o1UmQ3R3dhWndCZm4zYUg4MlY3Z0h0b1Br?=
 =?utf-8?B?RjNZUGtTcGU0by9peXVXVFhnNWFGc0FRZEtmbXdVQ3BvL3ZabkE2TjZ5RTlZ?=
 =?utf-8?B?WThKWTVqM1hZaEI0NFF6M0tLaXliTkF1SmxOcGV4akN3STd3TTA2QzhCNEdF?=
 =?utf-8?B?Q3pSclBUalR4UVMwd0VXb0FiNVZnd2RFRUwzZnU2Z3V4bkJBZzhQbVlvdEg4?=
 =?utf-8?B?THBuNE1YT0gwL3d3RVptNUEwZWVvNmtqV2lsSjBrZWNTRU5FbzUyQVZQYlA1?=
 =?utf-8?B?YUhEN2gzNHdtay8wR0lGdUtFUlVuaWw4c0w3OVBFeEU1UlBhTGFXMzZROHVs?=
 =?utf-8?B?Z2xDTk9NdjhMeHlLbW12SmNtaW1JNDliZGJMRUlqZ1JYblZ0ZG1iYUlPcWlI?=
 =?utf-8?B?MmtCcy85Qk1IWVJkVW9mNVFkSGRRQ3I4SStVbExuVUZMUUszODEyb21PVDk2?=
 =?utf-8?B?ZGNpd1crY2ZhUVNsWlFFTE9yMEJFTHNNaENjYThGWnF5MUNKT1crc2xFOWN1?=
 =?utf-8?B?OXNTT2J2U0E5ZURLYU5qbmY4QlVVTXR3TlNuZ3RYTmxyMDgzRDN0K2JSK0pz?=
 =?utf-8?B?ZUo5OXVBVE1XdExmdDRURXIreXM3WENkUFA2NDRnMGp2NEs0bzJLTndWZ3g4?=
 =?utf-8?Q?f8Vg0NzOfz0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2lmMHlmWHpQMTh5UkJvd2RseWdlRlptaFhBZ05BQWw5RitkaXUwTUoxSk9B?=
 =?utf-8?B?bVRHTnZuZHJ3OEVVcE9VbjZjNnloZjhpRHUxMlhodEU4aTBUUGFOdEVGWHJj?=
 =?utf-8?B?b0FRSENVR0cxbjMvcnNiVjk3SkFCL3VRbjRsV0U4YytCbUtoN1kyQlpCRm5a?=
 =?utf-8?B?bzU2ZmQ0QjQrMHhOam0zNHlONE1EUXh1VzU1dCt0UW5WYnRtdVprSE12RXdH?=
 =?utf-8?B?em5rMFJlY2VRYitZVFhLTWhHVEhBaStwTUNRdldtR1JCeEpOZ1I2ZTA1Q1pH?=
 =?utf-8?B?QWlJRWNuVUxBRDFESGY1OXZSd0YzSlVPVUlJNVdmOHZxaGlmZFRFR1hidG9p?=
 =?utf-8?B?YXVCU1czTXlFZXlYdENLbi9INHRleUlMM1dPN3pHQXFhVm5ncnRFRUdGWmk5?=
 =?utf-8?B?aEtwNlhNZFFEcHJxajRZV0NFUVYyQmhXOFVnbkFkc3pXbkVtZlhIMUdmWnVs?=
 =?utf-8?B?U21yRW5Kdk84ZXdhcmNjMUFzRkM3UFZSYWNVdmxQakFhL3ZDbjNWNlduWW9I?=
 =?utf-8?B?ZmVBcEZxbTlVRGx2NDMrL1F4ejNHL2FDeXg2bnNkOFJPVnhmVWM1VnJDNWp0?=
 =?utf-8?B?a2hOWFAzWG1lRFFuVDZ5eHBGSXNnTG1KeWdQUHhWWUdWc2FMNlFhOUZBNGpP?=
 =?utf-8?B?Q1d5K2JNYkx0YWVJbEhXMlBHVmptMkR1OEkreVlqbE03Vk5sTjArOWpmdi9v?=
 =?utf-8?B?T2pENzFkYVpCOFYzVTBXL3dvWVJtd0hjZzVSQWRsZmZSWGY3WnBWaS9hbzE5?=
 =?utf-8?B?cmN2OVlRMDJhTE45Z1hZZnBDNlNYb1NnMlYvTE5SMXJRWFJZYjgxM2NaMzdE?=
 =?utf-8?B?QTRJNU40SG4yeUdWbE1iVUpDZkZpTGdxYVdTc1MrSVZMdXVBenphVlI0WTBj?=
 =?utf-8?B?QTBjNWE1WnBTeG1ZcG05UVg3MjBqbUxNeitLTlhqczBqdUlMNXVqdDcva09H?=
 =?utf-8?B?TlIyK1NUWENLWFRENlVjcHppVy82NTVhMGpxOUhRYWwrSmg3S01QaldDRE5L?=
 =?utf-8?B?QVZHTWJ0MXJVMXhqWVhnOUd2SVorRk5YMHpsQVozd2JMVm1NN1BXK3plNmxO?=
 =?utf-8?B?TExQMVdBa2hOMGxncG5FU3ZxN0R5MTB4VGs3ODRTelhVQkNSRWRUVHVNcG45?=
 =?utf-8?B?OTUyUUJnTUhPTVYzSjdDMzRlRzZ0M3gySlY1N1lZeUJIWHViOTZJQW90WkhK?=
 =?utf-8?B?eUlIVVRoYUc5UVJmeUE0bjBqd1hOakpLVUt3elFCOUhFem9nTWlRd2lXUjBW?=
 =?utf-8?B?aTYxdEVHUW1nZ0J5SGNFSHY4MFM2UWE2MnhGVmRFL1l4SlpBdnZXTnNEbDJU?=
 =?utf-8?B?WlRPWkhTUjFSQ2VScTJOVjVhc2dvaE1zNmpyMUltUmVhc1JjTlliNnBweVRi?=
 =?utf-8?B?aXNUNUpWdU9LQkZ3aXVIbmdqSTBkeHU5MDVLZzdSQ3dHb2RhYTVhNHhPL2ky?=
 =?utf-8?B?L3plRXJ1blI0VnBFZWZQVjhlSVZwK0Q4dTJ3UkZ1Wk14OXdLRmlweTJJMFJP?=
 =?utf-8?B?RlFhL2xMR1M4bmF2ZDNBUWREQUF1TktvWDU4a1ZGcjVneld0U2pnTms5V3la?=
 =?utf-8?B?U3l1SXhEVVhpcThrdmFUZGFNeTBLMnA4T0ZPUjJybDloLzliUlhoQzVuM2M1?=
 =?utf-8?B?RVhXcWRiSCt5bWFTTk1TaWgzT0Q1MUxlcW10cUFXbkxKMGsyU3VlWXJRM1BU?=
 =?utf-8?B?VGVKMDlGSmVGcmZQZTdoVFl2Wnl2Sk9zOGc1bWFlN0lvbmo2SnNNa2tmdnJu?=
 =?utf-8?B?UFBNbkNmeDVyM1RlTDg0L0ttZkJUU0wxbit5TEdVdXo2NnR2aGJqbnE5K0hu?=
 =?utf-8?B?cEtyMmpQYkJwRjhwbThEem55aUllZHBGWENvTytsY0FPdHM1ZWlPQXM3YzFY?=
 =?utf-8?B?Z1FhbDN0dTNWc0RFTHhBZ0pGa2pxK1JEKytGN3VnVGhVTXNIWFl4S1lIcE9H?=
 =?utf-8?B?WnpBSDRsZVVyWUVjaWxMSEhqNlNyTzRWZXJ4NytFY0dELy94dWx6R3pJU1BD?=
 =?utf-8?B?SzhPWlBiS2VpakxEK2Zwd2RlZEh3SlVUNkVuWStybmxWd2dEcnNRVUxRbnB1?=
 =?utf-8?B?NDZLaEI4RCtwTWtnRkVoNytVSE5YcU1wQzBTNEpUN0FKajZSMndwNGcrMXov?=
 =?utf-8?Q?OQaQEgjp1BGVoexfSAS89FfhM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b052a807-0b51-4a66-bcb1-08dda93c0cc3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 23:02:33.6524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwMzlsePlkgZ0gxdkSwh0X5tj6rzZ0Tw/F5GhBcQ5rq9QgmtLNYx7Mtr7zDMTyKLdByjbxRqL2hJyvgpiup4kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7175
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

Hi Kamil,


Sorry I missed those warnings and accidentally merged them — my mistake.
Your change looks great to me. Thanks for taking care of it!

I hope Sunil will also agree with your proposal. I’m planning to merge it tomorrow — unless you’d prefer to do it yourself?

Reviewed-by Vitaly Prosyak ,vitaly.prosyak@amd.com>

On 2025-06-11 17:25, Kamil Konieczny wrote:
> Recent change brings compilation warnings when
> AMDGPU_USERQ_ENABLED was not defined, for example:
>
> ../tests/amdgpu/amd_security.c: In function '__igt_unique____real_main311':
> ../tests/amdgpu/amd_security.c:319:14: warning: variable 'enable_test' set but not used [-Wunused-but-set-variable]
>   319 |         bool enable_test = false;
>
> Fix this.
>
> v2: removed additional vars and prints (Sunil)
> v3: correcting description, moved var setting back (Kamil)
>
> Cc: Sunil Khatri <sunil.khatri@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Fixes: dad4b2bb9e5a ("tests/amdgpu: add environment variable to enable tests")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/amdgpu/amd_cs_nop.c   | 2 ++
>  tests/amdgpu/amd_deadlock.c | 2 ++
>  tests/amdgpu/amd_security.c | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> index 644016d5d..c406f2fc5 100644
> --- a/tests/amdgpu/amd_cs_nop.c
> +++ b/tests/amdgpu/amd_cs_nop.c
> @@ -171,10 +171,12 @@ igt_main
>  	int fd = -1;
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +#ifdef AMDGPU_USERQ_ENABLED
>  	bool enable_test;
>  	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
>  
>  	enable_test = env && atoi(env);
> +#endif
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 45a864feb..2330b2955 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -43,10 +43,12 @@ igt_main
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
>  	struct pci_addr pci;
> +#ifdef AMDGPU_USERQ_ENABLED
>  	bool enable_test = false;
>  	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
>  
>  	enable_test = env && atoi(env);
> +#endif
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index 45bd7e771..4f38ee04e 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -316,10 +316,12 @@ igt_main
>  	int r, fd = -1;
>  	bool is_secure = true;
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +#ifdef AMDGPU_USERQ_ENABLED
>  	bool enable_test = false;
>  	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
>  
>  	enable_test = env && atoi(env);
> +#endif
>  
>  	igt_fixture {
>  		uint32_t major, minor;
