Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A12CD98D2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 23:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD9010E29E;
	Tue, 16 Jun 2026 23:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zCFvzRC4";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2C510E29E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 23:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjd3MdlvpyOD1xfb1NXyJasUKJkVV6lDYf+7KiJnl+/KXliteL0pY5MZR/4Vfz7ICxLBGh4pG2zenDreJ1TbW04KxgyHPAMF2OTmbJaXvlmZJJ7dLBGaP2fUVwFOGO8ejqJhHAUnpYcIXo5VLV1Szpq8T5krnWqpLl9LHxSaj6Vt+z1fEIj0SwKvPIJVj6VJxEZ/y7iq2+05R2DHRUlpqb8PxRazzcy3eDV4CIHZO3xHGe3DOGNOPUpwWJHaXePOCgCFXwYRbMe3b5/ntX+RccCG2x28S5liwLEUNBV4KKQ3i31oxhU8nfmgpkmDeg1meO+7cmorgQZF9PxQJ5QvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUryOfipqUnjO3hgABJBcM3gVjRXMnK+q2IFZ1EAMKk=;
 b=SoZ+4ueBxp5WCROJM6IXuPilMyYQPuhvWY1nfl4a225/GV6gzhS+Kn60n+5WfsAwv1bZhxoe5wX6LN13vyJmU934fE3WpDe9CjUVPIYQAEOitIZiPoL+iLivXoaYNIt8HkQ73xbysa7cSR3Vw9JMxeRmHrZ1oIh1w9NHXHGZ/7x094PlgyhxSKtBwfj7oTH53OSy9V67nOnHk+WN7ysbYCLdV2t8GtVidOPMPtilsWbTaFz/sI1fwdGJh/vPCgoSrxkOIYPZP5nbv/JLP8QgbQnQDcPm2Z/+y7+koj24h5doNPda/yXoLCVVt/LJerPcaGYy3w9vic2h3hQcKBUxuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUryOfipqUnjO3hgABJBcM3gVjRXMnK+q2IFZ1EAMKk=;
 b=zCFvzRC4ssf1KB2pOeCnRNOxDZ0qbeYz9AvvAC2Zaop5jFViGFGZ2iSLQbE9T7Z+XfMrlnxcFEumUvk6kxXEYNpg+bRztqpKG4kzALl0CgOFCN7hgg4VIb2kxcShNPgPXUlKqsc9J1SQ+0RhKf6Sznf34m0KREss/qaNx4Ur4vQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:25:20 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 23:25:20 +0000
Message-ID: <714cc0af-a7c9-4fed-9370-703c185abd0f@amd.com>
Date: Tue, 16 Jun 2026 19:25:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/amdgpu: poll reset state in hang slow test
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260611142058.1010795-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260611142058.1010795-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::26) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: 4275ee53-2b08-4062-416c-08decbfe886e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4LRxz7wiE5WoUFkXaOwZf0jLJvn31v2Jac1b9SbEd9yAzU2xpMFjLLdCesACVKPVHzvdnTpY1ye/OCZuxe3MYY2RJoAq4pUP2sLv/AdEL5VLBXuhVbEhZ3hRzON/VY3xIaOB8Xf3die3D04zxclEG23imSsFUOuMJz45ExqwJHmkRcMB0pXSetsV5nSPwVck0ijiFMIH3QbJyTCee3w/9lwW5UwHYOoD8ZQh2robl9XbIbqxuWLVBNJIgFs5fCIdFtzYOTLOF7+JQ8UXfXYO9M7X17KroBJVeOXtPv+ck1D2hxWd4uSWVTAM4Dzv83Z1yRlHl5HqXNR7rFfFDZ8LR20MkrhiUsegPZK9i7RteBuMFB/u92PEBgnENcbLPxd+p2wxtaGY8iSULguAoI2XMGSJvXwSy6RKmmMZ0D4oHP896R/K64KMEqnxWAjR2PHkj501qQxLpZIHk2X0y33iRv9S4pGGdvj4QBNrerE/XxBfPp9kpGfGz5Ndewh0r3U+ecOPMfbE8GmbEFhcNgzBH3xbMnsQm0aL9tbHut9qKonuptjCUW/iAZ7Hv+inbvJpVCeSINdxotmEtHwrM7yaf9Jd5FHjCUloXHzQRLt6dZmAlQTv3QH005qtLbpAqbQnNi2aSb7RRzmZfn+cFZlhK1Z08wFmi+pEvRjpGBjcfdgvM+Mn+M2mpQNiHZ5GurVQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFVtU0tkek5KL3RYbGYzWlR5dURTYmFUK1B3R0tFelNhYzMycXJ2LzBRRm12?=
 =?utf-8?B?a1ZndlRGR3RHRms2d2tOcC92clhJVUlkaXdhejA5ei8rRHZ0YzNoTEtqek9j?=
 =?utf-8?B?T1VPZ2hrUHlmSTVBZHhFekZyTytGYk1FckNodmJGdHFaejJyQS9vekFrNThm?=
 =?utf-8?B?UGhyUlNDelNiUkRRbUp1ZWpWcisrUitiTElPNmhFajBKSHloS0pVZHZUNXYr?=
 =?utf-8?B?U1gxaFBmcDNyK2dZWEswSU9jR0toTE10aFBtQXM5SDBLeko4c3hERUpoU2Nz?=
 =?utf-8?B?SkhjM2FnU2Z0QTA5WHJJT1UyeE1JaEgycFF2T2Z4ajd0d1FLOGlhVmFWVDlL?=
 =?utf-8?B?Z1loY2lyV3JzdWVCTjRqMGJuWDFmbzNWb08yTmNzYW5NSEw5UDlpbS9sOGFl?=
 =?utf-8?B?NFRPUHNQMWIrU2RMS0d0eHNPajArVUZxYzA3b21ESXd2QTlMU29OS0tZR3hP?=
 =?utf-8?B?aDFHb1kyWEU2Yjl0aWZ2YXkrakFWVVNIOHBRdnUvdXFCaE9DMTlFVCsxY2VX?=
 =?utf-8?B?OUNMK0ZtTWM4ZkxpaVJ1UnVnTmFUUDl1d0NaUGhpb3BheEhCVkFmalBZVStH?=
 =?utf-8?B?VVZyQWl5bXNTaW1EeFMrdWQ4US9nUGxsSEllOGpJSC9DbUtwL1hQRURIUzZW?=
 =?utf-8?B?Sm9YdmhsZ0dFQ3UvU3Z4V3U2QkVWK1N5QzlXY1l1ZmtzdkhCeE52eTJtTHNj?=
 =?utf-8?B?UUM4SDFyaE03b0dhMGVQT00zdjJSZm9Fd1MxZGhxMGFkRlRESGFWaFZ1VzBP?=
 =?utf-8?B?Um1uN3hqNzNFL1NOS2lSekxtWmUxYzVQdWcvNU96MXVLaWN4U0VKZUVMUk5Y?=
 =?utf-8?B?Z0ZPbUtueTh3TzZnV0lESDczK0JjUUJrSnJidHU4a2RLWXlOSVI4dDdHVGJo?=
 =?utf-8?B?TEFOaU1XRUI0Wkw4R3NmLytLVm50cFZUQU5aUTNsOTVVK01Vb3FuSXJ5eFVq?=
 =?utf-8?B?QkI4WWlWVUkxRkFsSmlmZ25FOWRZM1hlc3NjdEhocENUVFJUZkRqZG5WRDJr?=
 =?utf-8?B?cWNBSjhHWFc2WWpDNUdwSVFVcERyN2c4bEdmemFLTXcxdWVPY2o5OUc5VGYw?=
 =?utf-8?B?eTlySGVYVXdDTEl1NjBmL1NLZFM3MEwyWHhFcTArOFZ6SmhTbWt4VzhMVEJQ?=
 =?utf-8?B?QUVMMlk5MFdQMDJLemFlZHBNaGtBSFV3cGJWcGkxdnN6dHZoWTB1S05lQkxs?=
 =?utf-8?B?VnJYWUdPbVBmcEtoUWhyT2pnOWtVaWc2REV5L0M4WXBGVDg4cW04UXRwRkZI?=
 =?utf-8?B?Sjl1dGZUUVFUaC9SMGFKU3VnVlNYWEtCLzEwS3djZEVId04rVjlIV2JVaDg3?=
 =?utf-8?B?RE1TN0ZvTXczMmc2azE2WTRWbk9VVWk4ODNuMy96L0tvTE4wYmR3YjRDQWdV?=
 =?utf-8?B?V3d6c09ZUUZIVjJlOFZqY216aDhPSnVhRksvR05LRkJMb2FlTzI1SmxDTXBB?=
 =?utf-8?B?dVhVcndBMGk1NVYxU0dILzloZzFQKzJXVmRsNU9rbm1EZ1NuZzUrYk9kdUNY?=
 =?utf-8?B?SFh2VEUwSUVHcENtSnc1UitWWEp4YW5LLzVkclZIVHoraTEyaTdzVXJ2eWdG?=
 =?utf-8?B?a3M1L3FvTVFnVU5xbkRmRFJLZ1RCc0RMY1YzbzA4WVNTUUUzODNYcUtSOXk3?=
 =?utf-8?B?N2JNTnM0L0F1NklZUmlSc3lLdnJmWDRhUldtdkgwNklhL3Y0QXpCR2NLU2FX?=
 =?utf-8?B?OEorYm5mdDYrZ01yajRiQ0JpZkJrbUhWRHVPdlZiSE9UOTIwQXdpN3BKWUQv?=
 =?utf-8?B?dFdkZW15bnNzQVpLd1Z2cTdwd2tpZ1lFM1ZiRnQ4dHNFdDNQMjJta0NkQ0N5?=
 =?utf-8?B?aEJ3eDVjWTZIZittTnljUVZxaFlOQ2tTZlk2U0FHVWozMU04YVlwYTd3MjlH?=
 =?utf-8?B?ZUJvam1yOGJ4TkRFNEI1aUdmWSsrMFE1MlltZlBaUTg2MFZET3RWd1AxSzRQ?=
 =?utf-8?B?eE5qc0lXVDVDckU4elZ1cVppVnIwUGhJSzU1U0pxVDZSUUpXUzdWZUNBZGRH?=
 =?utf-8?B?NEVHenNoNnBrMnJyb3M3WWl1M2hnQ0lpV2w0TmtKTnBGb05pRGpHUzdSdzAw?=
 =?utf-8?B?R3VITlNYZk55Mm5mTk9mU3F0MnVSSnJXQ3NJNFR6ZGY4QTYwVHRiYUJkRTRK?=
 =?utf-8?B?eG1SNEwvQmdQKzh1ZnpSSkxHT2g3a3owWEh6emFjZ2dNTFp5bi9RamhJajI1?=
 =?utf-8?B?aWphYm5nKzdHUXo2QVJCVmRKbzQvL1NwSnhwVGtIRytvbE92bVNqenNQeVND?=
 =?utf-8?B?M0d0djNUNklNQmNkVzZCaWRqb1EwMllOVXRXRXZWVkZjd3V3TW5DRXdVRFFJ?=
 =?utf-8?B?blF0MTJFNCt4Q2JqQmt3NWxXTDVDZVRIbnZtbmRKMTJQOXovcnBjdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4275ee53-2b08-4062-416c-08decbfe886e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:25:20.7007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNXFbwLW64mA21Rt59tj4NDX87lZw0gt7gWwdKc3Yxc6dXvi7LJh+WGS6oimSAwZ4aNLgT4B93uLfj+ARf02Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
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

LGTM. The race between fence signaling and the global reset counter bump on per-queue reset is a real issue — polling with a bounded timeout is the right approach.

I squashed your patch with a minor spelling fix: renamed the parameter gpu_reset_status_equel → gpu_reset_status_equal (pre-existing typo in the function signature and its usage).


Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com

On 2026-06-11 10:20, Jesse Zhang wrote:
> amdgpu_memcpy_dispatch_hang_slow_test() asserts the hung context's
> reset status from QUERY_STATE right after the fence wait returns. On a
> per-queue reset the global reset counter that QUERY_STATE derives its
> status from is only bumped after the guilty fence is signalled, so the
> single query can still observe AMDGPU_CTX_NO_RESET and the assert
> fails.
>
> Poll QUERY_STATE until the status reflects the reset before asserting,
> keeping the existing reset-in-progress guard.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/compute_utils/amd_dispatch.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
> index 138222cde..152ea0099 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch.c
> +++ b/lib/amdgpu/compute_utils/amd_dispatch.c
> @@ -679,10 +679,20 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  
>  		if (!(reset_flags == 0 ||
>  			  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
> -			/* If we're in reset and reset hasn't occurred, then check
> -			 * that the hang state is equal to the GPU reset status and
> -			 * assert otherwise.
> +			/*
> +			 * Reset has completed; check the hang state. A per-queue
> +			 * reset bumps the global reset counter only after the
> +			 * guilty fence is signalled, so QUERY_STATE can briefly
> +			 * still read NO_RESET here -- poll until the counter
> +			 * catches up before asserting.
>  			 */
> +			for (int i = 0; i < 100 &&
> +			     hang_state != gpu_reset_status_equel; i++) {
> +				usleep(10000);
> +				r = amdgpu_cs_query_reset_state(context_handle,
> +								&hang_state, &hangs);
> +				igt_assert_eq(r, 0);
> +			}
>  			igt_assert_eq(hang_state, gpu_reset_status_equel);
>  		}
>  
