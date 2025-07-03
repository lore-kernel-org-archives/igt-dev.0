Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5392DC83F03
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 21:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1041D10E8ED;
	Thu,  3 Jul 2025 21:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJwJqNTg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B1010E8ED
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 21:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751577077; x=1783113077;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NEKywQKo6lbX7IgylNTRrEDJPOLRCcAF4qRX9JusPO0=;
 b=RJwJqNTgzlnGBbLjDBlxuQVSkA5wL/Nc7B1HxzRzKuJH3hjNKcc0QhHK
 GUibEiktTJoVesYlsTOzD/UA+7S3p5EdbZWBnAWz5zNn6/i+XYVbkyahg
 crSCshpVDSLIxmFHRppKPF1u3FpPKOBiw5uAe50/yu+MkH5bsAqOG7Wfw
 z8QAK0oXqVxRBPtdq/AaNspxj9TM3i9VFP3TRdJbviS51x2xsvAlIERjk
 ZfQ2xk3/xp9EsTOyPo+FBeAR9YPfLtQ43TMh5Q6caE3CFEEUWDMjx2Ds1
 B1tW4eNt/sfHuj+EOBbOLEZityMUqQ1KKrZMI0xVrqpv1jdr7Ep18Y5ro Q==;
X-CSE-ConnectionGUID: gE+rVaRORSiK3YYfPsAQhA==
X-CSE-MsgGUID: CqDnwGD+Rm6wtOcHYRsNag==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53783729"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="53783729"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:11:16 -0700
X-CSE-ConnectionGUID: ITGxKAxDQ9Wd4IC/G13ISQ==
X-CSE-MsgGUID: BVa3tiMgRDWzoheuIUCXTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="158823639"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:11:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:11:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 14:11:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:11:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJHefQTSphydqr1NPDoyTPSkjqt6NwRfX5fPpV39DORMwK7itzwA0G5/z8zJ+X+3Fjlm03N+lzgxNs20iROZAsIfQ4Cjd1nBNwY3HroMdaE3P7QKkcP3fLRh5l2tA9OzM0RcJBuxJjED+rJLbc2OqQaEZ5hscnk7cfOOQZtSNCv+74s6qQ9skIzkQO0BORT38GKpcZ4nKx7Ynh0Go7FvrKq4iPbuaEtTZ1ocFv2cPfIKnI0Fjf8NgLKB20hJcTUIwKIoHlt1RdVapXUNy+d1vfFjFE0jsNLNfVYnOk4wudn4vKUgSy7di2QUVJ6fqIx8baJwOZGiugZs29f4NuCaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8ERzSrEaxMNXGIlW74d+sPH3FA3FyHIVf9FyUZ7ylk=;
 b=PTxwzFbdLKzD70nSPuD79aM+lgWETFd5TB6MM7/OGQ8MbuSIM7i0zpeP/rwLenGTDUgSupjbVoG3tmmaY7/wxHTMEJjCivKKh9CY5kkcPPmMRg7kuZGPDOYf40hLi5pKRBZCjDAFIbxuSYhAA1G1xqpuLN64CHWJAq2nrKtW897lDsSNEMvEtlT5hH/S21rv21KVLTcjAa8PaI5wUy06Zkwf1JXyUIxu+RYM5wcM4ZXkvEK7SL0TRtVYLqEV7xpXKvXhGvXRtm7aiV1grv4qvAGlwOYEKBPuNDp2AZuZquba2GLwa7bHoAPlauC2TzXE5dDk6VF1LWwVhSPkouc9YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by IA4PR11MB9394.namprd11.prod.outlook.com (2603:10b6:208:563::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Thu, 3 Jul
 2025 21:11:00 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 21:10:59 +0000
Message-ID: <e529a364-9ca7-441c-85bd-4952bf14a254@intel.com>
Date: Fri, 4 Jul 2025 02:40:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/5] lib/igt_sysfs: Rename debug level
 APIs/variables to debug mask
To: <igt-dev@lists.freedesktop.org>
References: <20250604053046.1702233-1-pranay.samala@intel.com>
 <20250604053046.1702233-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250604053046.1702233-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|IA4PR11MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 052157f6-a8ba-40f0-b0dc-08ddba761b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3ZBRW93ZUhnT3dNSVg2aW51LzJON0hnbHV0ejlOWHNYbVllRURZaW1aZWs0?=
 =?utf-8?B?a2U1NHE0Y1h6UzNlS0tLR1lGdjRpcEg0dUMwRVNvcm1yNkljeUZKVmRXNmVn?=
 =?utf-8?B?Y0NBdlhCUlpaYzNlblFmQ3BPMkRKV09kd2RuOEttaHZ4ZFd3eTdTVXY0SHF5?=
 =?utf-8?B?WkNva1g5TDY2QVViTTNyQ1o5Vk5DNmx2VThRdnQvdTRaOEo5M2NMczFmajJ2?=
 =?utf-8?B?NDZTVzErc1YzUy9CazhBdUllazJzNjVKVE9PM2FpY3EzMSs0MDZ2a0lWaVFM?=
 =?utf-8?B?VzJFcmRzOERPSVd6VkJQL29kZis2QUdyYkc2bTRWR0x0em9NaXVpK0R1dnBq?=
 =?utf-8?B?bWlndEdyV3dWUTE1MXUzdVRTbVo2RnBsSDgvYXFYa0JxMFZwRUJqWFMrUUI4?=
 =?utf-8?B?V3JLYmZ4allOelNrbmo4ekVSMDcxQlgrZXhYOVRPSGU4VXZhSTN6Y3lxbS8x?=
 =?utf-8?B?N0FRQ2hKV1FPVm1zNDhIL2xCamJkeWp6ZFRvN0pxTitZTUVEdFRuUVpKYlVC?=
 =?utf-8?B?eHljbXJlTmVKMVFlTXZFeVl0SkZ0bWNrUW5Dc3lmTEtLZEE4UmIrUzVEczIy?=
 =?utf-8?B?ZDBjQ1dWSTlwM2ZhaWdwQlBsTGlBSjhtVGg0M2lmdEo0R3hXWHpoaHdIeS9S?=
 =?utf-8?B?UW8wSFRUcWtTTm00VmtrSWpWVVBUM0RCbEMxNUowMW5nMm42bnVBNnJTYkdQ?=
 =?utf-8?B?aStFaHczd0hYNVl1QURkbm1JN0hZQmk0UmZBRHo4Q1J4VGY3NnRIYlkwNStR?=
 =?utf-8?B?NVJYb2hiSnExT29BamJHbUxmdUpXT3RYQ1JPL082MVBFUFU5NlBBK0hDblA4?=
 =?utf-8?B?NlNaaDJtTGp4bGN6NFNaUzB4b01XT1lLRy81WEpwcm5nbmtNc1ZTT3V6SUww?=
 =?utf-8?B?QnBha3NBWW5Cb3RtTThnNGNjbUhXaGIxcEdNSjFUelhhTzRMbmRKWHRIZFhx?=
 =?utf-8?B?VG1xZERtTVpkdml6ZmRiWjc1VGJTT05weFliK3REaGx6ZDZwSXVpdHJ2U1hx?=
 =?utf-8?B?RVpZSE1kMVF4dkwzNUtzekcxRkdOQUlFanhYUVI1V0RCTFVrSWo3aWwzUmF3?=
 =?utf-8?B?aXZPOXBHTXlQNXVVdmpGOEJMU2NIVkNVMnhBeEFhQVppTTduOGVNNnNSenlV?=
 =?utf-8?B?Nnp1L1NrREJXZ0lKVXlnTUVoTEpCMXkvWWNaVklRWlpvbmI5ODA4Qk13aGdL?=
 =?utf-8?B?dVZoZTFzYk5sOGhmdVFseUlDT2dGQ0s2Ukx3RG0reUx2YWw4Wm0rdm45a2tG?=
 =?utf-8?B?OGZpWWNWeTdWdGJDZFJlZWpicUdhRkk3MUVub2dmK2RBZVpSVzhYTUR4bGRu?=
 =?utf-8?B?aG4zWFJGWm9NTzFvVFlCME1VL3E3SHF4dkgzSkdrczJrSGhIcytITnRYaVhX?=
 =?utf-8?B?WnFTYWFiRzU4N3hnNjhLOE11V0NLT2VnMUNPazJCZFJmc0t4cEZqSVB6Vm85?=
 =?utf-8?B?MGZONUVaM05zNWM5aEhYVTdzT3Q4cDNleGkwVENFR3VkRzA2WW5rWXVxUThV?=
 =?utf-8?B?WWwwSGVYOXg0em43UEkvaFZYNHFRSnQrb0YwTmRwcEY4VGhrZ1RYc2FzaDdz?=
 =?utf-8?B?NHhsN3U2VktKRXRjZU5mT29Ka1NvWHpDVU5jSUFzcWYvMjNSbllMVmh4NGhX?=
 =?utf-8?B?MlFjWkE0c3NWT2lSbTZWa2YvWDg3SW9xRjQyQ1ZUUmdNbVdGRkY2QkxqWlQ3?=
 =?utf-8?B?aEkxbEpYZEluZWpxR0UwM2JWK0pUQi8xUm9nUTh6V0FiRFZyVzdTNkRweGhh?=
 =?utf-8?B?WnFvZzQvQUM2ZmhYZ3FuSEtreFNReWJKTTJrNDdPQWJjajRYVGtQSnNETHIw?=
 =?utf-8?B?elJtMVVVc2lDQUtJVnUxbDh6ZUVJVWNSWUlsNjNYOTFySm9TVCt0bEdSb2dy?=
 =?utf-8?B?LzNmRW1yaS9pQzh2SW1uS2FSWE5BdXUzeE00aWtRT0NhbWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU9mdVp5OU9od0dpR3dWb0UxYmhUK2JUVWtZQkpGeWpNQ0ZpYVB2cFIvdm5O?=
 =?utf-8?B?eERPenYzRll2Nkc3WWlRMWxFbGR5Z3c5TEpGZW5kUk1pWWtackFBOWEvWW1w?=
 =?utf-8?B?SXMyNFdwWktRUjVxUzJtNWdDUTBrQ1pjWER5RjVMc05vaTg0WnN0OXNhcEts?=
 =?utf-8?B?SEZhRFVDUHF2NG5icnhUWSsvTHBBeDE2VlY2ZS81dXg1dGh0bDhNVGhBclJr?=
 =?utf-8?B?Y0V1bGJ2S2FrUXRqb21VbTlEaTB5dW5jV2RyUVFLTFNIbkNkWHp5YmJJbTVa?=
 =?utf-8?B?ejlHN05lQWhMU0t2YXh2YmJwZVF4YWV6ZWZaTmVMWUhES3RHUFkrZlBnOE5a?=
 =?utf-8?B?akhaV0xMekxnZmxxY1lxSnpnMGtDWmhwMFM2QmhaaTlQOXhUcWJ4ZlpEeGRw?=
 =?utf-8?B?QnBPVmxWOFdrN1Z4M1krYU1ESm1UZS9QbWtmWGVTTDhkS3lXSXJidFNIYW5y?=
 =?utf-8?B?UWdzTjE5bzFla2xBb2cwbEFGaW9ud295YnlsblQrUEg1b1pZb25ySFROazY4?=
 =?utf-8?B?TjVkb1JjdjI1a0FGdG1la3pIdVd6YVk5TkQ0MnQ2dmxyUm9ZVGM5RXZLY0wr?=
 =?utf-8?B?aTBBQ2JnM0VUUUpwQ2x4YjM4MzZpZGNpOU9tRGxhdkR1REYwMFpYRUJRRmN5?=
 =?utf-8?B?Z2V6ZUtwMlZuaXcrYjhWUXEyYjFnV25mUlc4NWtTU3Y5R25mQXN5ZnorUVI2?=
 =?utf-8?B?VFZHQ0pFbmZWcitHUlRGZ2hZTDdBKzM1dFdNWHdRNGtqMTFxbVkvWGlxZTVj?=
 =?utf-8?B?bElwdzNnMWFEMTlXMmdEbHhHQmtONDhtQm85Q09tU0Z0S2dWR3VFbzdaYTNy?=
 =?utf-8?B?cXdwM1E3d016c2puMHliVnhSK3pTN0dFL1Z2SGRpbVR1SVk4UVNzcmhDdHA0?=
 =?utf-8?B?TkI2Z0JIQXdnUEJpMWtNYWhQNEZlcXhEd0xCRW52YUFGREJqZmpKd1hHNEts?=
 =?utf-8?B?VnhjWTViQjdoalFLV08weGtSTWdFR1JxWURXZjN3REhybDhLbFRZSElPOW5U?=
 =?utf-8?B?T3R2NkxGeDgreld1NWJzUnZHUWFHYzFTUE5WYU5sdXM1WlUzZmxId0xVN3Ax?=
 =?utf-8?B?dUZsKytRazZrV2djaWxMNDE2L0ZDajhUNm9WdzFqeGp0d0ZYdW1MZFErV2l3?=
 =?utf-8?B?SUlTLzNKYzlIZE1hKzRuQloyQktMeXo4RHVvb3N3MEczeUxnMFJBVUVNVWg0?=
 =?utf-8?B?RUZCeWdIaFhKQ0dvbERkcm5rRjZlRFowVWZsLzNNaDRhUEFVcXA3WHBPMDdK?=
 =?utf-8?B?WmR4dGFsVmJ4KzNuYkxDY3ZFZzVYckwvY2pJeE5OR1E3Q29kU1Y3NkJ0L1Fy?=
 =?utf-8?B?emJpVkZRbjl5VVBnQnVsTityZEg4eTREczAzclF5UkVNdWtWVFVoSDdYdFFT?=
 =?utf-8?B?SjVFU0VkVUVXZ1Vja090cDlpVjZnakZYTXJxenNWS2tKVmxYRSs3dUFmeHZ6?=
 =?utf-8?B?MFNpTEFYa0NhMnNJQk5Kd1BTendYTUFQcmRnSkhpYzJ1Y1puOEQrZVhLcEJ5?=
 =?utf-8?B?bHVUbjRreWVjdXY5RVlDcWJPaVpaODJSbENENURYcCtzZ0NDR2NqdmN1dHpu?=
 =?utf-8?B?K0dtVEloaG1PZDlhVUFieDlXQUY4dEZpOXdYMGlwQ3BvSkFmNXZ6RTBWeVlZ?=
 =?utf-8?B?VmMzcXh0T2V4Z2tEZXFDMnhWSFErUk55YVNiZURGcnoxK09RNWJsR3M1Wldm?=
 =?utf-8?B?QW5ZRjhCNEFRb1g3UHRzSFRnaW1PTkYxMkxENW40Qy9DbzVWdU9iSjRDZTlq?=
 =?utf-8?B?eVBEaUJrRVhPYmhVTm9rVStndnVqVGk4Q01VUEFvRHI2alBSSUcwb05JSEdR?=
 =?utf-8?B?T2g5eEp1cGNUV0pnRHpzUGovdmVURGhwWHhYY1R3NHJndUFLOXdwdEpoajhF?=
 =?utf-8?B?ZERZeXdPb1VOU0wzR2tiOXJ3dzRRcmMvYXhWZ0o4WEFITExPdFdra1pBNGNW?=
 =?utf-8?B?Qy83Y3dNcEtxWFkvYi8rRFVkK1YxUnJtUUZmeE1iaFQrdGNnVVJRa1c4VTdC?=
 =?utf-8?B?Ykx0aUJFZ3l4bjRCWnNrN3FIcmZUOSt0ODVxYVo4L0dnV3VodUpPenV2NjA0?=
 =?utf-8?B?VWZXdjl5N3RnNk9oSllOVWFxc0R6anpyT2lxMnoyd28yUWkwUXcvc091S1kz?=
 =?utf-8?B?L3VLVktGSlM1N2VTc3M2QSszQUM1cjRubmZ5ajZhOU1oN2F1UG1MM085ZFBP?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 052157f6-a8ba-40f0-b0dc-08ddba761b9e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 21:10:59.3973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDIlvAv8WY4G7To1WmFaIuYM98cUCbOGxFLXAFJ9dqtO7sRu/YsncfNxscagOZv04vQ6O+rSsgtdAF+vEtUmWgjEtmOqo4x4ik1Wx0zBkB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9394
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


On 6/4/2025 11:00 AM, Pranay Samala wrote:
> The debug log mask is a mask rather than level. Rename each level
> occurance to mask.
>
> v3:
> - Refactored for readability and address logical comment.
>
> v4:
> - Rename debug_level parameter to mask (Kunal)
>
> Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_sysfs.c | 36 ++++++++++++++++++------------------
>   lib/igt_sysfs.h |  6 +++---
>   2 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index b7ca1f2b6..ceb776b8d 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -446,15 +446,15 @@ int igt_sysfs_drm_module_params_open(void)
>   static int saved_drm_debug_mask = -1;
>   
>   /**
> - * igt_drm_debug_level_get:
> + * igt_drm_debug_mask_get:
>    *
> - * This reads the current debug log level of the machine on
> + * This reads the current debug mask of the machine on
>    * which the test is currently executing.
>    *
>    * Returns:
> - * The current log level, or -1 on error.
> + * The current debug mask, or -1 on error.
>    */
> -int igt_drm_debug_level_get(int dir)
> +int igt_drm_debug_mask_get(int dir)
>   {
>   	char buf[20];
>   
> @@ -468,13 +468,13 @@ int igt_drm_debug_level_get(int dir)
>   }
>   
>   /**
> - * igt_drm_debug_level_reset:
> + * igt_drm_debug_mask_reset:
>    *
> - * This modifies the current debug log level of the machine
> + * This modifies the current debug mask of the machine
>    * to the default value post-test.
>    *
>    */
> -void igt_drm_debug_level_reset(void)
> +void igt_drm_debug_mask_reset(void)
>   {
>   	char buf[20];
>   	int dir;
> @@ -486,25 +486,25 @@ void igt_drm_debug_level_reset(void)
>   	if (dir < 0)
>   		return;
>   
> -	igt_debug("Resetting DRM debug level to %d\n", saved_drm_debug_mask);
> +	igt_debug("Resetting DRM debug mask to %d\n", saved_drm_debug_mask);
>   	snprintf(buf, sizeof(buf), "%d", saved_drm_debug_mask);
>   	igt_assert(igt_sysfs_set(dir, "debug", buf));
>   
>   	close(dir);
>   }
>   
> -static void igt_drm_debug_level_reset_exit_handler(int sig)
> +static void igt_drm_debug_mask_reset_exit_handler(int sig)
>   {
> -	igt_drm_debug_level_reset();
> +	igt_drm_debug_mask_reset();
>   }
>   
>   /**
> - * igt_drm_debug_level_update:
> - * @debug_level: new debug level to set
> + * igt_drm_debug_mask_update:
> + * @debug_mask: new debug mask to set
>    *
> - * This modifies the current drm debug log level to the new value.
> + * This modifies the current drm debug mask to the new value.
>    */
> -void igt_drm_debug_level_update(unsigned int new_log_level)
> +void igt_drm_debug_mask_update(unsigned int new_mask)
>   {
>   	char buf[20];
>   	int dir;
> @@ -513,14 +513,14 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
>   	if (dir < 0)
>   		return;
>   
> -	saved_drm_debug_mask = igt_drm_debug_level_get(dir);
> +	saved_drm_debug_mask = igt_drm_debug_mask_get(dir);
>   	if (saved_drm_debug_mask < 0) {
>   		close(dir);
>   		return;
>   	}
>   
> -	igt_debug("Setting DRM debug level to %d\n", new_log_level);
> -	snprintf(buf, sizeof(buf), "%d", new_log_level);
> +	igt_debug("Setting DRM debug mask to %d\n", new_mask);
> +	snprintf(buf, sizeof(buf), "%d", new_mask);
>   	igt_assert(igt_sysfs_set(dir, "debug", buf));
>   
>   	close(dir);
> @@ -529,7 +529,7 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
>   	 * TODO: Check whether multiple exit handlers will get installed,
>   	 * if we call this api multiple times
>   	 */
> -	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);
> +	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>   }
>   
>   /**
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 265f77d4d..892682344 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -143,9 +143,9 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
>   void bind_fbcon(bool enable);
>   void fbcon_blink_enable(bool enable);
>   
> -void igt_drm_debug_level_update(unsigned int new_log_level);
> -void igt_drm_debug_level_reset(void);
> -int igt_drm_debug_level_get(int dir);
> +void igt_drm_debug_mask_update(unsigned int new_log_level);
> +void igt_drm_debug_mask_reset(void);
> +int igt_drm_debug_mask_get(int dir);
>   int igt_sysfs_drm_module_params_open(void);

In this patch update igt_drm_debug_level_get() and 
igt_drm_debug_level_update() function calls in kms_cursor_legacy.c

>   
>   /**
