Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBB1CCFA05
	for <igt-dev@archiver.kernel.org>; Sat,  8 Nov 2025 04:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA9910E078;
	Sat,  8 Nov 2025 04:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yNIy7h0X";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA5B10E078
 for <igt-dev@lists.freedesktop.org>; Sat,  8 Nov 2025 04:08:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDQJVGlTIjKmznv+ODdhST1WXOvTmat6CRYT0OmNYFuv/DYBhnoXk3yKyduZxgiTjs/14SqUac3eJL97qXgGB8OuuhYVWfm+z4kLhoox4iQUgRs1IebS6VSWZ2+7jA/SVUlrFJnNXBdZXSKnBsfWJOMeCKS2hM4XdGjhbn6GedI12iDSzDKrgOLd0BfMLvjo3RlSmHCaIVlZEeqGNU5YhS57rGEaaNk8xvD/Ec+E/COPm/fgWXGYVmKLA4Z3uXfLYCJtjM9fOD7h2Z2atInKiY7I83xfjnHIxQzHBBMgDBCc4YCFC4FFzJf51NAITRJBhphMHF6Nfooct1Ck7bvcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLhOIrOJ7p8USeIQkkemSG6QUl6qGm1xiZGwVKF6km4=;
 b=T5R2uWC9cCuyfFsmNi9rS3yWpMDitZapYc313g43yz7rCEbHHbn2Cx0dyiZUoDSh93E6I074qJ5JJyzr+DN4PwrTrVYgQxPkyinFI19w/4LR84+B8C7kVfXmocJYXb5loX8CxokT+SLH1Ukn4o05TUGi806Y59P+5YlEmsiWXsQwL+Cvjz5CcqpfUrIaZlZPFWvdLZLVqna1ulZFtaRY3w7tD7IPM1+W5X0CrkdonEaCpAJeIRfs+siP12unmG+giipjNJ+bQ8uHLFrGwW1C+c53M/aUglFnxunVRJOF7rhvBDRgfPO9qn634W+Gc0rAitv0jv7hWtAK1VEEIDUzlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLhOIrOJ7p8USeIQkkemSG6QUl6qGm1xiZGwVKF6km4=;
 b=yNIy7h0XO3fKGlz+cxbj946rxLt/GLgWqjrSEZSJUxhF133HOFA7GfnT57CJ2mLCQQde56MmO4CiWU/Esi56f4nggsJgz7YqZpb3Th2CcYNoH6u9gNJpOWDTk22fUVvy5pSW3m4xSzqa9sp2j7uBj+OUF34XrrEInyJwslmvSXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ2PR12MB8181.namprd12.prod.outlook.com (2603:10b6:a03:4f6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 04:08:43 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 04:08:37 +0000
Message-ID: <7b9a8aec-8612-4ee6-96a7-7c8d48631cb2@amd.com>
Date: Fri, 7 Nov 2025 23:08:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] lib/amdgpu: support negative testing for user
 queue submission
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20251104083208.3700055-1-Jesse.Zhang@amd.com>
 <20251104083208.3700055-3-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20251104083208.3700055-3-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0185.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::15) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ2PR12MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 8377fbdd-4680-44fb-9cc6-08de1e7c7dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDhoQURXRGVTRHI4SUVCNEYvMHltRjdrNmxxdUVpNmxtdHJIZVNPbTVKdVI4?=
 =?utf-8?B?WjgzRmh1N3lrVXJVcW1NbnlYMURIeU5ubHE2ZzJuQW9lQWdLUlN1NTJ4QXZs?=
 =?utf-8?B?RDJyWmVBWWZESVcvZkluZ2QwMDB2eHRMVitzQXA4d1h2WWVEb1NNRDYxWnZF?=
 =?utf-8?B?VU5MZ1F3Ti9ER21lM3A1UU5RSk05U2NUN3FaQUZrNmloYUtOWEVEeDNNYzZ3?=
 =?utf-8?B?dGZVL1pmeUJ6d3d2bXlPUk5iV2JBaHZLbk45WlZyUjNnQkJTeDB2L2Fyc1Vr?=
 =?utf-8?B?enhaOXBRRTJjYVc0SmgydlMrQnAzU0QyUWhGYzBNdkQ1akllcnlaTTJ3Ykxi?=
 =?utf-8?B?N1JscjRFSW1mRnhLSGYvT3dObHhzT0hwTjgvUDUrUDdTVEpYS2lIK0Z3VGF3?=
 =?utf-8?B?aTBqanNUMlFDQ0VFTFVLS01JSFNIcmZldTR5ZHEvdzVzNEtaZ1FnZ1dlNElj?=
 =?utf-8?B?c0lMT3hhVXVEZXYwZ1JQMHM1d2xReHFhNVowaW9hc2JPQkNWQlkvRnVwZlp5?=
 =?utf-8?B?ODZMQnNEdHpCa3FmYllZM0FidzZmcklxVWdTTUJsOCtjV3BJR0hONktnRGVu?=
 =?utf-8?B?Q0d2QTZZZ01lTlBoR2NlR2s2NHlsM0didHQwT0tkU2UrVnUzdG85TTdCYnhD?=
 =?utf-8?B?ZkR6Y2ZzYzFzR3lreUdPdm5Ec1QwcVdMSnJ3dEJ3Z2RBOEhCaUZXSDVPd1J6?=
 =?utf-8?B?YmJTcGp4TUwwZzlhOW5EQXgxU2pIVWNwMmdTNkVhOTFFU3YvQVJaR0pqWFlS?=
 =?utf-8?B?ZWp1OXBGY1NFUFQ3RUpXcWZmVTF6RXhxRlFGTW5TSmxvOHR2eGp3YklwTndh?=
 =?utf-8?B?M2QvMkdJNWZIZTcrTkk2Si9sZ3BYMkdaalhreU5lajFCZGNrL3RwWUhvUlNI?=
 =?utf-8?B?MElXZkhZZVE0eDJFMG11V1hKRGh2dkRDNGhaOTY4N3EzOHpWdHU3QVRjeDhn?=
 =?utf-8?B?ZGdjYm4rUmtZeHNHMWhkNUQxb1RSendzcXZLOStKQUtJRGEzdlE4WGFYYkdv?=
 =?utf-8?B?VzFQQUhwc1JwNkhsVUNlVXhaR3d1KzlJSDNXNXRpazZJVFNmVXZubmNnL0RQ?=
 =?utf-8?B?VVVENVlGaXk3aHRVQTRPY3RrblFoWmdiS2ZRbzlZZWpBN01vY2xYUnpGUW15?=
 =?utf-8?B?OVlYQmxaSWV4MDZIY1lmQmxoenBOb1g0cWdQdENkT2lMaVhEaHpGNEkzRkNn?=
 =?utf-8?B?aVh3NDBvVDhnR2t1NStZTTI5enhMcXlHcVZ0UThXaWJlTjQ3YTJjZHduejc4?=
 =?utf-8?B?ZDgwR2Vza05tUnZqYjRTajdzOWdGU2FwMGZ6TndLZXpiVG5tb3ZsS2swaHor?=
 =?utf-8?B?TkJNRHVXRXVpMSsvbGNXa3M5TlFkWkNUMnlDaUwzdmpneDJteUJBSlZlQnJL?=
 =?utf-8?B?RVFPRkxhaHJHdnFtZXZPaisxdEhQNDE5M01ZeTR4RjhGcFBDTFBNdmRKZU1h?=
 =?utf-8?B?VHcxM25IMXI4NVB2YmJucGdsb0dPa2ExVzZXbU1qV3RtUVVUcWdZTkg2VHAr?=
 =?utf-8?B?cGlhWmthSG5uSTJBa1VhMHFFUkxHbldkbE5GM1FUVlIrdnBSWXFTMklxaEEz?=
 =?utf-8?B?ckJ6N0oweUIzZlQxVlRRaWQyU0NRN2JmOTlzT01jR0FVTE5lNjB1eWNBRXRi?=
 =?utf-8?B?MHp0V1FSS1JHQUEveXBlWVRCZ0hMQTQ0RGR3RGdSVi80MUJMTi9WS1NvM1Rw?=
 =?utf-8?B?OTY3blhFVFVjZEg5bm52N1VkSXBSZVQzTkVGbE11SkdkQTcwS2lVVXBYRmRR?=
 =?utf-8?B?K2hCd3VYbTdBVWZjSjFGVWZMNGNIbzZWMWRFZDN3OHc2VThIOThuUVplZE1H?=
 =?utf-8?B?ZmN3MzJYR01Gay9SZ2s5c3VtTlVrK0Q2R0tjVjFXUlpoVGI3b3VRYU1QekpE?=
 =?utf-8?B?QndQUkJhc1VIV1AyUlVOSnhrYzhrUnAyaDNESEV5TDlIVkNPM2d2cURPN2xK?=
 =?utf-8?Q?+/6V1dziscWyiXBhOJEN8P5hq2AxknYJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nzkxa3JFQXhIc25JNXh6L2lId3pwU1dCYkxEalp4VFF2c21ZenJPOVJQTVoy?=
 =?utf-8?B?Y0c2eEJ1a0kramF2YTFHWEhJaHV4Tjd6NzV1bFJ2VVc4QUtHUEhNcUVyb0tS?=
 =?utf-8?B?ZElKSFRzUHRJamtEWEdrTmFrQWRXOXJpaVQ5TDh1aVZSYlZ2Q2VkR0RxcWNG?=
 =?utf-8?B?T09LMjhpYkhkcXIwSDhLZUJoalJQcHBEczVIbjZhakFWVVYvTDFkdjFZQ2xL?=
 =?utf-8?B?RmpXVlNMSHMwUW1yOEhpZXRpSWlDMmgxQ0dRN3dPNUZtUWJDTm1ld0hGems0?=
 =?utf-8?B?ZW1WTjd6em1TeGsyWUxHSzU5ODl6RXBZdlhXTWdvUzlyR3dleEU4TGk5ajNE?=
 =?utf-8?B?ZW5lYTFPZDlnVk5iUTNhTjZWNnhCNjNuTTdIbnlySzNkb1NTSkdMOXdHSXFN?=
 =?utf-8?B?ZEZKbE95UWZzeWlQTTJuVnVMbHkxZ3o1RnRpME92QlZEU3ZySmVaTFV6L0dC?=
 =?utf-8?B?UFE1MDRvYk1SbEwwbnplNDBuNGZySHpjRjRZTTd5OG53UnkyNFcwWkZNd2Jx?=
 =?utf-8?B?M2NxNGtpOXNDRDdzcGMyYzNSTmFoVUwzakUzcGpWZmxwdzA1NUZNejloYWhH?=
 =?utf-8?B?MmdZaklHbHIwYlFRdlZoRHltUGJKTW81MWVwbW95dGtzYjFrMENMSzJ5U3ll?=
 =?utf-8?B?STVZRWNrb3dRb285SGhSelVlcVYwR0VlTEs5TjdHQkEySHRkRFF2SlJ0UVps?=
 =?utf-8?B?V09jTC9ORXN1dTV5U1pNUHcwNk9jQ2l6VWtOam84Y0VLMXIyS3B3bXpGWE5O?=
 =?utf-8?B?N3VUVHh2bllJaVM3c250L3BpN1QxbmJjZFJyRVhBbVhNTCs1VzdRbGp0cmhZ?=
 =?utf-8?B?eEExR2VRa3pjYUxubnY0cnpROUtLMUpZb3ZDdlg4NFNyUE5QeHk3MWVwWVZ0?=
 =?utf-8?B?aEJiK1p4ZlRiUTllK282MVNVYUt2QndJWFRQUmdzaFArZVFtaTdEWGU1ZUNO?=
 =?utf-8?B?ZFVzeXZyOGdrb3o3eVRQeGJzZ3ppcXEyMlJhNExoQXFVeHBzMUMrYjM1WFI3?=
 =?utf-8?B?eTVYbDc3RHRsOVhXTk56SU1YaHFBMnUwYm9RSDZpcUt5UmJJeEFneVc0U0xO?=
 =?utf-8?B?dkJkOTBxN3FpN0g4Z25tQVBPZzR6Q1NkVWxaYkxYajRYdHhsdGVuYjFrRW1o?=
 =?utf-8?B?TG1IOUFuYWVKcWZ6aGJwZUE5WXV1bnY3dFpzUjIzaTRRcHB3SlhwM2ZmRDRO?=
 =?utf-8?B?ZFBWdjBjajNzcmNxMzNjZkdZMmJBcEE1TmRIdWhTaXBEaGl2MEsyUmxtbURi?=
 =?utf-8?B?YWlBUVJNaWxIc0szUHJhWDNjQmFJSy9kTzA1d0tmR3Y1RXF2Znh2U0tucTYw?=
 =?utf-8?B?dHdxSHkrOHZaRjhUOFRjUE9raDdHRkJjcHpQQzA5Vm1XQ240V3lNdjBhZmhl?=
 =?utf-8?B?L3FEeCtKdy9nWFM0MFpTOGJmL01wVFZyVnFuWUhwWHBrckFwRzJvMStaQ0dj?=
 =?utf-8?B?aEk1UXVvTkIwTzBBTEU0akpBVTk2OWw3Rm03MUkrbEthRnJKOUVrUE5hOUha?=
 =?utf-8?B?WnJLTEptR2tRT29yc25pWGVmWVZqcHlNN2ZjNGhLNHdLUHg4R0MwUThqRi9r?=
 =?utf-8?B?RXBaSit1bzlVWU9SOHZxaUpDaEUreG9EeHBCTEtBU0NaOFFKci9XQjNOVFVO?=
 =?utf-8?B?MjNwRG51czZRSkJnL2R3aEt1amJTeDJRcW1FeVVHVEg1ZzAyNlRhbXZKWG96?=
 =?utf-8?B?SmNmRWVQUmpqQmtIcUxmN1FGamk1WVhrcTVvSHVBM2xwOG9oUTlWMTh5d3JF?=
 =?utf-8?B?WkkxUkhJR0ZRcVVjWENCaDJPOW54aXQvc0lacU8vQUVaZjh1ckVOQi9Ic1VY?=
 =?utf-8?B?dUhxUjlZMmlTRXc1WnRkUjNBRk5UQ296YXc3Unk1M3k5Y25vV2NFQWQwZEwy?=
 =?utf-8?B?NCs3ZmxtV1ExS1U2cjBIanNsTnJBZVFkT1Y2eXdaQzFkbmZnQU9oRUF4V1FM?=
 =?utf-8?B?cmdJenJVYTRQckl4Rk1qVllhemxobkFCQzN5Q3lYaE42aHFwTFArSXV4T0Fx?=
 =?utf-8?B?ZzhUdTd1MzNtbHk0WkV2bjdZV2hKazZnVzhFS1FEMHFLWG9meGpYVzRSaXZZ?=
 =?utf-8?B?ZU5rc2MvbmxCQmhEdkRaYVhPdStJWFpBS0ZuUW1xaE9EczV2enVnMk8rbzRW?=
 =?utf-8?Q?ZSOxWmLSkv/w2uQQ7QJJckJFV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8377fbdd-4680-44fb-9cc6-08de1e7c7dcf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 04:08:37.2105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTJCy7M1kNdhqeUsw96XO4aScwHKjcTCc5mAQwWBWlpg0GuSdGX5kstVfiSKOnRfZvGyfnI3gRi1UKm/uL9L8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8181
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

All the 3 patches look good to me.
I made a small fix in the following function:
static int user_queue_submit(amdgpu_device_handle device,
                 struct amdgpu_ring_context *ring_context,
                 unsigned int ip_type, uint64_t mc_address)
{
    return 0;
}
The explicit return 0; was added since a new return code was introduced, and omitting it generated a compiler warning that caused the build to fail.

Fix and Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com

On 2025-11-04 03:31, Jesse.Zhang wrote:
> Modify user queue submission to return error codes instead of asserting,
> enabling proper negative testing scenarios where submission failures are
> expected.
>
> Key changes:
> - Change userq_submit function signature to return int instead of void
> - Return syncobj wait result from userq_submit instead of asserting
> - Check return value in test execution helper and only assert when
>   failure is not expected
> - Update function prototypes in header file accordingly
>
> This allows tests to validate error handling paths by expecting specific
> failure conditions during user queue submission, such as invalid
> parameters or resource exhaustion scenarios.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c | 8 +++++---
>  lib/amdgpu/amd_ip_blocks.c          | 8 ++++----
>  lib/amdgpu/amd_ip_blocks.h          | 2 +-
>  3 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 64568ded1..4b59cdab0 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -69,9 +69,11 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
>  	ring_ptr = ib_result_cpu;
>  	memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*ring_context->pm4));
>  
> -	if (user_queue)
> -		ip_block->funcs->userq_submit(device, ring_context, ip_type, ib_result_mc_address);
> -	else {
> +	if (user_queue) {
> +		r = ip_block->funcs->userq_submit(device, ring_context, ip_type, ib_result_mc_address);
> +		if (!expect_failure)
> +			igt_assert_eq(r, 0);
> +	} else {
>  		ring_context->ib_info.ib_mc_address = ib_result_mc_address;
>  		ring_context->ib_info.size = ring_context->pm4_dw;
>  		if (ring_context->secure)
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 71b1c5c2b..58a67a7b2 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -582,7 +582,7 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
>  	return r;
>  }
>  
> -static void
> +static int
>  user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
>  			      unsigned int ip_type, uint64_t mc_address)
>  {
> @@ -653,8 +653,8 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  	igt_assert_eq(r, 0);
>  
>  	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
> -				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
> -	igt_assert_eq(r, 0);
> +				DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
> +	return r;
>  }
>  
>  static void
> @@ -932,7 +932,7 @@ amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
>  	return 0;
>  }
>  
> -static void
> +static int
>  user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
>  	unsigned int ip_type, uint64_t mc_address)
>  {
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 66c2789d5..67891ded6 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -230,7 +230,7 @@ struct amdgpu_ip_funcs {
>  
>  	/* userq functions */
>  	void (*userq_create)(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt, unsigned int type);
> -	void (*userq_submit)(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context, unsigned int ip_type, uint64_t mc_address);
> +	int (*userq_submit)(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context, unsigned int ip_type, uint64_t mc_address);
>  	void (*userq_destroy)(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt, unsigned int type);
>  
>  	/* program minimal compute pipeline for a raw PM4 launch */
