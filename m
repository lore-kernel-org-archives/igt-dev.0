Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C16D65C50
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 06:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BEF10E348;
	Thu, 14 Nov 2024 06:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ky5gN35B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA14310E348
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 06:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731567100; x=1763103100;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EFJ1wXLqNsSO9H/clqCdS0d4tRdX1KmllZ8BMUI9sCI=;
 b=ky5gN35Bb3QzT5U81+UhvWUHgy5YbjP9T2kqcsT0iS50ppN1T/dWrDG9
 smumWPCj2cXvSFQ6K5iMorfjRNzYg+WppZFB6wSx6rgb6BoW4BsN6kfhK
 CqTouARtkx8LU+5p2owfndBiCEZ68tVYOGcSgVhT3ZbDrz3dHryarSkuU
 tdGzSdYTPy4UTcHvCB+MhZ4oMmT2Y3g2Wj4qDTUEIeHzNG7hEL/Gd9neX
 eaIW0xgtUtey46woWCjA330x4R2r827ZXd9+4GXPveDg4dYDGZhvNMAD2
 PIeBM6eUWcmdOscT0/nNCT9NIv5rengLKenZ+n2cvyLHq2QoE7+jVtGJe A==;
X-CSE-ConnectionGUID: 2jp6eGkJSByreTBlnk2xAA==
X-CSE-MsgGUID: wcoyk4CnQGapcfy8A+svjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31360139"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31360139"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 22:51:40 -0800
X-CSE-ConnectionGUID: Mu0TahYXSGKa34ju2Lklxg==
X-CSE-MsgGUID: TQznES1UQrmSwWYrxVyFvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88503577"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 22:51:39 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 22:51:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 22:51:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 22:51:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMV2g0xibz4OyKJQM040YPEFEYLof/+o7CMgEfBU97lQ31i/uVG40ojgRQxv4SqcSp8WzVxMmjz+1kx3MlpfbX7Ze3pSck2qwaIb36ifGXAfrkntLwW5KqwKgrQaT2RKtpw7ucIXmJN5p0l6+8cqUEdYlRpABta4YOTipyEJrAjMxWDQ+WHnbdh8GZO5EnRvZ+m+k5qT4I1HKgyaMdCF/EMHVE9yTvucBHswVn7gFuu8mb73Dc3N5+6aeVMOinWULDJ1ZpOEKayLF2EN2iBO/03Ui2MaYb4sXsxI2YlLQxNfYWVSalSjiYuHMgj8elHgU6Qg/DG0bpxMMU2LZDIvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAx6Ejzy+bOuEp6XbaZmBwqj6KNGwfvHuxpmGscJ2uQ=;
 b=bwGUP41YsBiwGU6Jc+7dBUw+XPIldSXwdclKF85SSKf7VXZFmTbMulJmXtpzMyjy44NiGKAqhF1mHJOT/XliCZfpSPNzjIJ3gsk++D1ngg1hT2l2Qlgph8ixFfmAhl252GEPa8oSDR+nuJgv33wXvoGpBWY4UMq2RrRoiYXMBit4wmrzHv8srqHiHji9A9gs2bQyjMV9zkVVBRpEW9iJsF5P6xr+vAz9oEHZLcVvTsbOWEKau+h7mzJWEjEobHlQ2Pk/o3t4D7pnVn15GNi7py6qStENa8KfyFZGwVX4M9hbvrLVVYfTZInvEFAevk1XbJMEC7twbdHmm6LRgTNcyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:51:35 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:51:35 +0000
Message-ID: <5117ea62-81b6-4a5f-9b02-dd869de10f18@intel.com>
Date: Thu, 14 Nov 2024 12:21:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_hdr: Skip brightness on non-internal
 panels
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241113142555.2974018-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241113142555.2974018-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::19) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|BL3PR11MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 89405d21-3774-4d01-2dcc-08dd0478c7c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K21qNXlwbjQ3ZXJrNkNwNHc1N1dsL1ZDUUFuY3VEUlZWV0dLT2hjY1VnOTl3?=
 =?utf-8?B?MmRxYzlQZjRXYitlVFkxTXVIdnJ5ZDVBa2NzRW9hazJHZUY5dVNwelc1aHdH?=
 =?utf-8?B?NEh2ZlJjTTNLMkwwT0FoZmlXb3lpSnljOHJKRUlpUDQ4REpHdjNYOTRYcXIz?=
 =?utf-8?B?Y0p2T241WHZvRlJ5K3RLUFUrNTBPM0NhdVhFSk9WUTVHaWM2Rng2eldoY2pr?=
 =?utf-8?B?K0JlN3h0SDZxYTZKaFh3WVZFSTdSNmI5bjZ3Si82QTY3MU0wM21HSzl3UFda?=
 =?utf-8?B?dENqK3NieEJveS9maXBwWm94SGxjRjhjQW8rZEg2Y2lkNWFJQnRMSzQ4akp0?=
 =?utf-8?B?TlhTRklzVlIwblZXank5YTRreDdTUE5DWjBVeTQ4SjJYc0pPMkxVU2djU3lJ?=
 =?utf-8?B?azRzdzg3NUdDSUVtK0FEUldUWUZIYVdUQWNSYWFEWUhhSVp2WnA1L1RyZFRN?=
 =?utf-8?B?ZHUyczM3MEEvSFFsaEVReFpNR0RpdjVaVktBTUZzM1lUVXdUQ3VNZDFrVFI0?=
 =?utf-8?B?alkxL2hYTGFCRnB4UzZXUTcvR1NXaUJXVFQ0Mk1KMUhiUy9GZ0x5QXlqSWYx?=
 =?utf-8?B?Nis3Y08zNGM0WkpBRFdrazBxeitIRFRPaE91K3FvZXVia2YwdmlPTHp2SExO?=
 =?utf-8?B?SkZNdDRwWjMwU3JaK1cvdTM1TUcxZzQyOUkwL1pUSkJnMEpIQ3ZwYStjVEsw?=
 =?utf-8?B?dUpNUmxvRElyL3VwYUFJbmdHVmRZVFFRMEVia3hud2FNK0hMeXVjQitlcU9u?=
 =?utf-8?B?M2ZvQS8rOGJhZko5UkxJcUtaNGdDdDR4TkJyWlZCU3VrZnkvcU5Fb1dBY1lu?=
 =?utf-8?B?bXBkT2lYTFpabjJ6UlloWWVodEFMV1dHYVFmWTY0N3ZjNTNyZzBjVmNvSmlS?=
 =?utf-8?B?QjI2MW5jdzFVVWdSOVJLeU5mM3crd3ZhLzVtOWpOQXpESjBsUEF2WlA4cnZ4?=
 =?utf-8?B?dmdFZnFTT1k1UjAzTFlpT0Y4bk1sQWxocmo0OEI0bzdDNmRQOEVnVDl2ck5T?=
 =?utf-8?B?Z2lQaHR6dC9XY0NjM29YZDEwOXBaMlRUWVhWc29KajVaRGc0blIyOWt1Y2VV?=
 =?utf-8?B?WUhmQTFMREtzM01vUHpsaGlOR1A1UC9IZ0NPdlMrQzMzSmNYVlJ1ZUppa1Nu?=
 =?utf-8?B?WVo0Q3dyMWVJUk1yZmZtWnRoUjRlYXdZMGJiMU1KUXBXYXVuajVlUE14ckY3?=
 =?utf-8?B?Q2hLam1vazNVa3JyU3NPTVRjY1JYR3kvK0Q1MlBERTdMVFUvTXpUYTNZdm9k?=
 =?utf-8?B?eTZ3MEh6djVlcE9YQnVUT3NLU1R4bDU5b0tBOFNrb3pWbU9lYWQ4MjF3Ymhw?=
 =?utf-8?B?RElYdVVqaWwyN1ZJaDNRM3dYamdQYTNzL2NqbFkvU3NOT0xINkVNb2NvVUVa?=
 =?utf-8?B?UDBtUFdvSUdCVjNjcWVaQ2hRVTE0WmczTVo3TEJDV05qeE9iaGxYR05sRC8v?=
 =?utf-8?B?bDJFbURmZlRkTW81RDl1TkVtbnQ0eVFUajRGUUdkSkpmQTJvZFI4cmZEVkRy?=
 =?utf-8?B?QVpBb3JxTkFrY1JUSEJyTVN2UWprOEJxbGRVY3VneExhUlZhTjhPWjh0WU5Q?=
 =?utf-8?B?VU01QzRFNkxIclhxS2E2OWtLa2tYTGROYmVaZlZPQ09MeG9EZEtQODJhMUtV?=
 =?utf-8?B?VDM1c21TMWwxcjFUdDNLak5qaUNTaHd4eVlSNlNTdVJZMG1zYi9lT2hCK0Zv?=
 =?utf-8?Q?cmJ0HUIXXomB/JphEowi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE1aclBXVmNLaE10Y0hhTTNteHRPYTVGZGJrKzZiMSt1aTBXdlVUSEw3bDI0?=
 =?utf-8?B?R3lCNXpWV3I2ZTZRZk9Qb1FHQUl1ZnJIRDVKQU5FQ2dqaWhqdmlFTThvU0xH?=
 =?utf-8?B?eDlCaHoxUjhVVXZQUzhEdks0dDJqSFZMY2c2TGsveGo4QkFqTkM2R0dabUdt?=
 =?utf-8?B?SEU2RFp5c2dTV0VUNmYrN21ESVpxNEt3NWw5Z29TdU9Sak5wNzR2b3RHcGFL?=
 =?utf-8?B?Rkd5ZDNIRXhON254Q1I4c2x4QXlLZ2NaaTFtd2l3Z205ZUI1eUUyT3puOTdv?=
 =?utf-8?B?RFc5ZWJzeWlvREdRVXdHb1NWd2lYUjdmd3Vsakt2MkgwaDR6aWE1bklBZUhS?=
 =?utf-8?B?NjBnQXZXVCtUZHZId05zcEwrV0F4MGxMTzhkLzJpTTZWdktUZmt6STlhSjhV?=
 =?utf-8?B?RU90KytHalBtVGpoRU42MVFNTFBsWEhhcTZXYzNBMUwrNjcwS2V2b2tmeFpU?=
 =?utf-8?B?bDUwL2RjRituNEpoMzhhVStwSUhJTE5PSUU3ZGpFL2NxcmxmVVV2dkJ4MUxC?=
 =?utf-8?B?bEpxY3A3TW8vV2lWS1M2dFZvb29tRHB2dkJTUlRWZUVHY29VRlRtY2pxVmRV?=
 =?utf-8?B?aXU1d3FXVXh0WWtNeXcvRU4zRDFHYmJ6d1BPT3dmY3lORUxnYjltem45OVg3?=
 =?utf-8?B?UEcwdks1Y0pJMHhxSFcydGp4WVFxR3Y3WE5rSm9heURFSGtxSC9uUDhuNjNQ?=
 =?utf-8?B?eG4yMDVGR2hKVDJqVjZzTm9qR2ZsaFpFdzY0TWdSSHIxa25OSW1XbDEvdWsr?=
 =?utf-8?B?R3d6VlVmdnFSQ3MrNG1sWDdici9LaGVnbmdUc1FXSjdoR3I4UW80d002ZXc2?=
 =?utf-8?B?MHhUNEh2U2tmWmhhV2wwelRMc3hzaE0xN0JQdldPYWpzd3B0Q0Vpdk44TDhs?=
 =?utf-8?B?QW1iamhRdUNOTDVlT2ljS2krQUpvNG8zcmpkMjlxK3lRU1J1cDBYN05sazQ1?=
 =?utf-8?B?N0N3MDdRVUNHWEhzVmZUd3VqQUwrQ0lxQ016NUZYWks2MXlkUW83N2VmSU9F?=
 =?utf-8?B?cFNQSGJMQzBwMnZlNXVlTFptbnMvaENZSVQxNUpxSWJLZlBFL0NoU0VibXBS?=
 =?utf-8?B?OURhUExOUDFXZkU4SmNtclRKbnVHQUZic1V2N0M5UGRMM1hQcVQyTmptSU4z?=
 =?utf-8?B?ZVc4TGdXcEJlYVpCUFNZUkM3NnNlczY2Qmh0dHRDTHNua0Z4OTFZendqUEZs?=
 =?utf-8?B?TVUvS1FGbmlFc005Y3ZmRW4xM1NiNTdTSUJmQ2lnRzU0b2dEeWdJSlZyUnBs?=
 =?utf-8?B?bnlSd0NGenhLSjFKS091THg3bDB2WW5QS3ozT1NNTEtZeHdxNy9LSWFTVjU5?=
 =?utf-8?B?U3MwTUNUZWR3aFllVGxPOHE5citmM2FvNmd2ZmVmQmd3ckl1SmxUcGxRRWly?=
 =?utf-8?B?UC9tKy94SHR2ajBibnZsZnJuRDNSdTlnemZQZUsxcE9kOW9EelpKOHVlQVQy?=
 =?utf-8?B?RmMzSm4vbFJlcHdYUnpEdy9sNThZLzFlQnM2S2p0blQ5TGw0eENHd0p6UFBr?=
 =?utf-8?B?TlM4TGhscUxlaVgzNXJOZnNRNm1CeGp0TTFuRkFjNUxKa1MwKzF4N3cxVVFH?=
 =?utf-8?B?WDRFRkdkOUxicVp1Rnl3cGIyWWUvaU9NSWRXSXhRS1ZySjJWb0ZvS0pjSHVT?=
 =?utf-8?B?S2hNQTFmZmRRSjV1YTNVQjMxTnJ5czBuRmgxMVVVQnlRaFdyUndjeURKWG4z?=
 =?utf-8?B?NkNjQi9YZHE5cytkb2RlL1VFNlhLRFB4ZjVxM0MwT1hlbHAyTTJUL1pHYzZh?=
 =?utf-8?B?VVpNQ2tMTzRQZStNam1Ca3FhcmMyZzhYNTJ1Wk9JQkdpaStIS0pjMGZyc2to?=
 =?utf-8?B?NzBtVWpPVUE1a0pGMjh4VG5jSXNHZjM1cFdlVFNBYThOa2JleHYxQSt3V3U3?=
 =?utf-8?B?YWtDSmVnWEQ4VVYwczNTajA2ZkV4WjlIaHNUMnJ6R3JTOGFWMjNqSXR4V3Aw?=
 =?utf-8?B?TDZsM1B5eFc2WmIrZHdJNFZ0MG1RUlpCZk1NTnNvZXJLdE5hQ0JtcS9YYU1C?=
 =?utf-8?B?ZituUEhtMVpYVFRqOXh0LzQrLzhpQy80L3pOWlRQRzFmd2xXa1JiWnduQnJn?=
 =?utf-8?B?MmJwY1dlaE1rc282TXlqNyswNzN6c0FCYy9rZDJiSlVFem1Vb2E4Zk8yWXpx?=
 =?utf-8?B?V3BmMGxxSjNyZklKMFpvUkhyZHlUVUl5cytHT1Z2VkQrZmZHdlVOSG5vNy9G?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89405d21-3774-4d01-2dcc-08dd0478c7c6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:51:35.3573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6QYvLiZ0yMiUdqBJ+5w5ryt+ofrocVKrw5bInPCF8y69IQ8sGMLxbvLUyErtCvKkgcJPlPD3RuMFgU3DDG0gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
X-OriginatorOrg: intel.com
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

Hi Santosh,

Please add closes tag in the commit

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3312

Rest LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 13-11-2024 07:55 pm, Santhosh Reddy Guddati wrote:

> Skip the brightness test if the output is not an internal panel and log
> the skip message.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_hdr.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index b67902d43..c4c9df3fc 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -696,6 +696,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>   			continue;
>   		}
>   
> +		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
> +			igt_info("%s: Can't run brightness test on non-internal panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_pipe(display, pipe) {
>   			igt_output_set_pipe(output, pipe);
>   			if (!intel_pipe_output_combo_valid(display)) {
