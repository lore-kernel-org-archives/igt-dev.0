Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B54D44145
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 08:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DA810E5A4;
	Fri, 12 Dec 2025 08:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jyc1HNHw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D93510E5A0
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 08:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765529816; x=1797065816;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wfqc0qtpixhPp99Dx9OzJWBFehSrqOVnX0OW7/1ldQ0=;
 b=Jyc1HNHwJhFDrgBBhaHkpoS2tLeKyoYtdZ7dBXVXWc+ofFBlBku08sG1
 bZN9wrpwzN4r/s9qxh95Mu+XygaiLEWMtw8OA1Vw4R7lndkHgOk++NGb8
 i5b4g1feEVwrZBvF+/PInFOZKUmvJisXg4GlBESXNXtm8OFZw/HwRR+po
 3I5Yqr84HyGgc/sayYaogRouBeFacvPIzPywqW3SUpeYHKAgh75bM9cWI
 COroRpQry64IyYElottBQtEcWwEVu63hJSAY3NSu21jSXSsUzJF+mbqWb
 t/INSQceaLm2ihcG7XuwC5L1UHgB1mm4spJkkF3H/unDfYwNQRxK51gYt Q==;
X-CSE-ConnectionGUID: cFs/3h5FRfSZwYt8RT39uw==
X-CSE-MsgGUID: Dxf9bYwhS8SdWwwR3T/qpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="92995424"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="92995424"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 00:56:55 -0800
X-CSE-ConnectionGUID: ZrT0KLMXRvS69p7A2ktk9g==
X-CSE-MsgGUID: 7UT4ildgTZ2SDkE9rY1Htw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196635079"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 00:56:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 00:56:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 00:56:54 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 00:56:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTgRXRG2vlRQo6yoVK79X0VOQpAgfhl5QB9+xqphOyI16C6QSEY0ddKQT2e1Uy6LC3q4eKhx32YpEDOIs/pr6lHIy5Jz/4csmUnpe7kVvkYXkcTxiEBb4MAMtYRgnOxZW5SwDg03D7cYiUGihTSYAjfL3aYYnfXiHzoZew3cYvIkRi8lpiXvmTU427g4ynK95Cy52gTjY9doLHd5NTrbCKrQqVWyGBiz7cbYSs9lwxrPSEtHzyfsXtnqfOhhfdT7gqfZO9VsbLz3Zw5BGqNTdX+8BO3/iZx6fcLwbpx82pEpOQEeM/2Eoa+GbGnmKxY38PJI1EGnKX+/I5EurSTV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsMcZzBKnyG0c3zAGnthV3xbTmM/+fAslAfsEXa38qo=;
 b=wpYqeAWIcN4xDg5HM5Buis6LZe92R5M5uGY8+TbyznbEEPjHPL4rdJFyUtkJYM8B46w/0jhdXN5lAr0HWh0w3RTDKQyAoHFTgcJ12qMK7qlPgWG8JTA6oh2zIJ52ZYneLlvtRCqy9K0L2g28PDsQpUKqb6++H5csQdQSkROdZWg6Ml5JjmWvnOYXKLxW6nx0eVTupaYZf1UcZifexLsnwbQPie7e8b7vGObO3l+3OBEykhRNEEnBmbaoU5C4cVkTFyKPwyPDRngQJLbJwq3z2uAMFHdZDo94nam105w3WLdrfYm326JlkHFe0cSHIQJkaeXqr5stwdyqTO03xfqo5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH3PR11MB7675.namprd11.prod.outlook.com (2603:10b6:610:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 08:56:52 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 08:56:52 +0000
Message-ID: <69ce06c3-1579-412b-8831-67ebc684469c@intel.com>
Date: Fri, 12 Dec 2025 14:26:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/kms_joiner: Add function for
 pretest checks
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <santhosh.reddy.guddati@intel.com>
References: <20251202084243.2677718-1-karthik.b.s@intel.com>
 <20251202084243.2677718-3-karthik.b.s@intel.com>
 <20251203140224.22xjw4xc4vcdvqob@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251203140224.22xjw4xc4vcdvqob@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH3PR11MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: bd832a7d-d4e2-4d83-fd5e-08de395c6445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|42112799006|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjhNY0VCeXRIRWowNFFIamF2RjFEdzFJN1RUM2lhNDUyZlNUZXZZN2xQQkNK?=
 =?utf-8?B?MFhLYThSS0hqSDc0MHd4dWQ0UkxuOEU1SzZQc0xMaklGRzZ3aEZ1N1NKQ1Ar?=
 =?utf-8?B?WG9IYlNQSDNXVzhpZjFWbTN1d01tVFYwL2Qxb3QwMm5CNGZIYjhnMDNrd1NN?=
 =?utf-8?B?VU92dUZTUFVNOEdKdk1QbkhBTGdmeWhPTGhoNTA0alM1YXZoVy9lWGExdlVu?=
 =?utf-8?B?b1JzaTZlWmhzREZwaFVKSFlRRk9FQ0J3OWYvNTR5TVl3SWYyaEdzWFdKSGFZ?=
 =?utf-8?B?RGptVm83eng3UkNHRW80MXhpTi9pN3hCQUo4ckZvZTFWSVRPRnBCVENqQWdP?=
 =?utf-8?B?Y1JxbnR3Z0kydjZYODZkanVlWHRaNzY4VkhncStGSHVKbkplYlM3eG1MR1R2?=
 =?utf-8?B?dHNEODd1cFk1Q2lVVnlOVnl1SUtBY2lGUzdFOVp5RUVlcjR5UExRK3o4MlZk?=
 =?utf-8?B?SWVVTWEvU1g4VDQvbnA5VWF1djA1V2d0dHptcjd2QjdScmUwaUVCeDFmMUFV?=
 =?utf-8?B?UFNsd3FqeExWVXpQdmFWVDIraWQyeHpRa3lUQjJqZG5XQmM4RlRZWSthWHdo?=
 =?utf-8?B?YTE2QU9iWmp5cWI2K1BDdTZ6aWFQWFNBSkQ4aUg1cGNNYVcrdUROek9JUExM?=
 =?utf-8?B?RzAzaHRUVUJFZmFWS0R4aEhKUkg4eUN6VVUxSndxMGhFWFBTbFFLQklUdkZq?=
 =?utf-8?B?VXRGTEJaRHM4OE5KbGVBZWdTUnZteWFNZkh4cldtSy9tU3VSWnMwT0wydkpr?=
 =?utf-8?B?d2JPbm1mR1hES0QrZzhYQW5vYUNrN0lFMkcwd0ZTTjUwYmd3YVNialVVWC85?=
 =?utf-8?B?QlVGWjR0cXpBeFI3OE1XV3hlUndjTWtDRHFYSDRKV3VReVAwVW9icFQvalJX?=
 =?utf-8?B?QTlDVUZZZzNIWDFFTkt6L2dmU1FEdVpWa1VPYUtHT3pQVzY0a2p3RlFoR004?=
 =?utf-8?B?N1k5SU5jUzVxTFFhNFl4OVpOeVE5TEZpWFJYMy82cDlxZUMyVDlmeDQ5QXJ1?=
 =?utf-8?B?Z2xISU4vVXZwYWxWWlBybm5NTmJiMnV2Q01VdUMrQlpBNkJUNThJNFUrdVB2?=
 =?utf-8?B?SkI0djN1R1BTUUlnN0hDR1J3VEFhUVlROEUvWlg2andJc2hmcjYvRnZQdExu?=
 =?utf-8?B?c1U5UDl4OGFDMXN3MmxwSlFyU3ZNeXJLNFhDWjl2REVPSTk4d3EwUlc5YTl2?=
 =?utf-8?B?Ylp1eG9XRDM3blQwaGplMFNBaEN3NHJvLzZ6Y2I0TlR0WWZ4VXlGOEJMcHF5?=
 =?utf-8?B?VFN1czlmOFdOUzRiWElBSEtuWlk3Q1JjbzVFU0tOMmQyc1ZHaisvWDQrMGpq?=
 =?utf-8?B?bENZeFRxM080TmI4clBiMDNYWmNwTFJ6bEFMdzE2Ym1CekN3ZUcyeGJHeDBU?=
 =?utf-8?B?RCtYcG1peEVlZ1pCRXZDcmJSWmtUQWl1NXJsbXRNbHN0aFNna3RTZ0hQODJW?=
 =?utf-8?B?NlpFNDBSVlhTYW9pWWFXSmEwQm9lZTlYT0RIYUhYZFJZZk5yYXUwcVd3ZGt4?=
 =?utf-8?B?QjJXQ3pBd2ZzcTJ5TGVOc2QySFhobFRGcHc2NmU3WEdHaHdzMllCN1Y4Qnc4?=
 =?utf-8?B?OENFd05IRjBIb1VXdkVXU291MUhmQVRBM2V5SXFYdTk0Nk8wYjRWbzdtaktF?=
 =?utf-8?B?WUxyL28rMW9MRHdiVUZUalJTNkt5VUE2ellMN0U2TTVHTU9sbDVrQVQ4TnFw?=
 =?utf-8?B?bXlQeUtUcDl4MUZuTzRMZSsvYzIzN1M4THFJMTlMTEx5N0Z6S2VmTW1mdlNr?=
 =?utf-8?B?YUZwZGVHYXhHdFN0dkR6RG5ZdmZxZUtvSjBHQnBXSFp2eHdtWFFkdmM1bWw2?=
 =?utf-8?B?a3pKM3hvaEFUMEhtSDF6SFNveEw1OXR2WlJIU3MwYWc1Zm9OV3Vsd0lRNmJh?=
 =?utf-8?B?TE83c0hOL2pINlVJTWxHVzZGL29KSGxOYlc2aE43bWdaR3JVNFJaWWZheklL?=
 =?utf-8?Q?gYB68r35xkN8BmJUwBwXNcHO14C6xK/e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0k5R2Y1WnlpRGl5dVRScWJTd3h6V2NMdHMvN2dQUlIrQzRJR3NpZ1l1RXBk?=
 =?utf-8?B?bVpmdlI4cHBLcEFHQWZPaUlLUHF5QWE5RzEvc2ZNaUVPbmV3RjE5MkRHNmFX?=
 =?utf-8?B?TWV2T2VnazJjODJMR2dlWVZoTC9lY2Q1bXc3MnIvbDZsRk9PNmt5dnRYTW0w?=
 =?utf-8?B?STlQMjQ1elVnM2tYei9mL1F0eFdCT2d6QmZIS2hPYnlJRzEvV0d6cDVEa1Js?=
 =?utf-8?B?TG1jNEJ6RjhhK3hCZFBzK3FnVi9Ga0tqdC9pWVBqNTdtOFNJSTZsckZ1U3lW?=
 =?utf-8?B?cXhvVmhYTnV4T3Q5VU5UTnZNdjg2LzF6S1ZsL0pqMzNrZUJ2YXhzVW1VdzA3?=
 =?utf-8?B?YkVJeWtlN3psVTlzeU8wT2hxYmNBY3Z3WXRldk5pVkNoVTZreGFBbDdlRitv?=
 =?utf-8?B?Vjd2VmR0dmpyWUFPY2JXdkd1SXhhUVJNaWRGRWZHdU1DU3pnZmIreU1STDFj?=
 =?utf-8?B?T0dTWmxOSmhNNTJvckw0UVF0amdzcXoyU0VzeHhQQkFjdlA3SWxTbVhoblFK?=
 =?utf-8?B?Y2hQN2JITUIySFhscm1BVlhLNzViM3QxdHkrK2dCY0Q1VHMyWEEzVktnaEh1?=
 =?utf-8?B?cVlPa3FSZkJSZk5RUUY3Q0E3OWZ1SVZ0UlBKc2hmNHJ1dWJNRWExQXZUUU1B?=
 =?utf-8?B?RnVGVUtBNitpR1MvVjlPQmZRMUJkK0NjbXpxN25ma3d1NGd2R05OR3JRcFdJ?=
 =?utf-8?B?VmNQYlE0L0hsdUpDeWpVa0MwMkVnS0x3M3RSYXpSQU56ZE1XS0ZmMkxxNWhV?=
 =?utf-8?B?eEh3TExtamxFZGRiU1Y4elV1SnUyamttSy95UWtWMFgwYlZ2enFvK0Z3N2gw?=
 =?utf-8?B?a2lFMzJ3ZUhaTEhmb1llc1ZENHJBeGczcTNldnRyT0g3MTZnelJzRjJXb3BG?=
 =?utf-8?B?a0N1NnljQ0VOK2gvbU5yWFJ2amdwWXlEa0JqRDJGNTVQSndoN0ttaFdtT2FH?=
 =?utf-8?B?UkRraHdFNFM2V0gwZ0dDQkw5VnJMU1lhc0tERXdLaiszeFNMdU5mUnVhd3pK?=
 =?utf-8?B?TEQ2cU1SQnBucnE2dUQrZjllR0ZOaEdIejZMKzFiTlF1ZG5sMlZrZ205Uk11?=
 =?utf-8?B?eEIvNGRHeGwyNGthSDlBZTBxN0pDWG9GZlJzOHE5bXZCaEJUT0FRV25OeXNW?=
 =?utf-8?B?WlE3TzdUUjVEU2owMTVlcDVmWDhzMlZsaTcweUt6c2cwSndMZEpTSTgwQjhK?=
 =?utf-8?B?eGJCWTQvQnhIM1hKVENvRTBYdys5Tnhob1RxcGpkd2xPMnRDNnBFd21DSVpG?=
 =?utf-8?B?dHpnMlptV3A3b1JGS0N5SFNIMVNPelVzTXdpZlhSV1ZiTWZKTmVTZnlUc1BD?=
 =?utf-8?B?eFdPNFZ4L2JINUNyTnRqclhpVFFQQ2JnbXd4K0RWQk5zMGd2dUxSejBsSloy?=
 =?utf-8?B?c3VHOUpZa3ZmdFVuWDFtcEg0THpVVXpPVkNYaDE5djF1YTIzaEZyc0VtUEt5?=
 =?utf-8?B?QW4zRlByUlB6NSt1K29QaWxDL3R6M083U3paRDRpZ0ZzYVR6c0ZkWWpJRmF4?=
 =?utf-8?B?RGVqR0U3d3FVMFRRU0ZtSVpNZ3gvc05YWnZEbVZmZ1EvZ08xS1BQZ2R0Uk5L?=
 =?utf-8?B?cUN0LytXbzhic0t1SWh3SmZpWEowYTVKRnp3U3pGdGtsRkJ3RHNScjVFMTNG?=
 =?utf-8?B?UXpyUlRPdjQ0RUpVVlQxUVpEcHdnT3VIdjk3RXFza0luL2p3NnNzMmhaSjMz?=
 =?utf-8?B?QUk3OWJOaUFnZFR1aEZBVlhHTHd2NVFaZGs5dGFFTzRCN253TmNmbzVEOWt5?=
 =?utf-8?B?WDIrWnB1blpEZE8zQmZleEJkOW5XRUl2aEczSGc3cm41VUY1K3JGdFZOMjZ6?=
 =?utf-8?B?SG55VFlwZ0NzN2pxcGpJQ004Y0hkQWxtSzhCeTI0Z1JJWGdDTTV3U0xVZ2xp?=
 =?utf-8?B?WXlZaE5YNWk0dVN3aHBKM3dDbDFOa3AvczBoMFVUT1lzUVhHb1RLRjA0Wnpz?=
 =?utf-8?B?TFNmeDJYRGlSdjVVYi93Q2xlSG54bWprTEtZSWZlYjU3RU1rUStIaWNIeHdV?=
 =?utf-8?B?R2tJSitUa3pJdDFwcU9rQUVIVjQrRDczcGRhSWJhdDhBejIyeUNFempRS3dx?=
 =?utf-8?B?LzVhaHpqaXhJZVhoQXBZV0N3THlJZlZrOVU3Y3BUbWJBTGhUYmM5Rnp1VEV3?=
 =?utf-8?Q?75rnqiuP40T7J01hvAKupvk3k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd832a7d-d4e2-4d83-fd5e-08de395c6445
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 08:56:52.0247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qe60HNIGd07OOeVwMdOLzV5zMMgY7RCcvSjJ/JVj44VR7PG/hLh50YudAqO9IoVRElXLDA/RuD8qcb3ttlrDUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7675
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

Hi Kamil,

On 12/3/2025 7:32 PM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2025-12-02 at 14:12:43 +0530, Karthik B S wrote:
>> Move igt_require checks in individual subtests to a function which is
>> called from all subtests to avoid code duplication.
>>
>> v2: Use enum for various joiner modes (Santhosh)
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_joiner.c | 91 ++++++++++++++++++++++++----------------
>>   1 file changed, 55 insertions(+), 36 deletions(-)
>>
>> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
>> index 55bdef9fa..19c880cf6 100644
>> --- a/tests/intel/kms_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -101,10 +101,18 @@ typedef struct {
>>   	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>>   	igt_display_t display;
>> +	bool ultra_joiner_supported;
>>   } data_t;
>>   
>>   static int max_dotclock;
>>   
>> +enum joiner_mode {
>> +	FORCE_BIG_JOINER,
>> +	FORCE_ULTRA_JOINER,
>> +	BIG_JOINER,
>> +	ULTRA_JOINER
>> +};
> imho better to simplify it into force/non-force:
>
> enum force_mode {
> 	FORCE_NOT_NEEDED = 0,
> 	FORCE_NEEDED
> };
>
> For explanation see below. Btw feel free to change name, for
> example into FORCE_CHECK?
>
>> +
>>   static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>>   {
>>   	bool status;
>> @@ -179,6 +187,37 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
>>   	igt_remove_fb(data->drm_fd, &fb);
>>   }
>>   
>> +static void require_joiners(data_t *data, enum joiner_mode mode)
> imho it will be better to add two functions, one for each type
> of joiner:
>
> static void require_big_joiners(data_t *data, enum force_mode mode)
> static void require_ultra_joiners(data_t *data, enum force_mode mode)
>
>
>> +{
>> +	bool forced = (mode == FORCE_BIG_JOINER ||
>> +		       mode == FORCE_ULTRA_JOINER);
>> +
>> +	switch (mode) {
>> +	case FORCE_ULTRA_JOINER:
>> +		igt_require(data->non_ultra_joiner_output_count > 0);
> Please keep igt_require_f() here and in all places.
>
>> +		/* fallthough */
>> +
>> +	case ULTRA_JOINER:
>> +		igt_require(data->ultra_joiner_supported);
>> +		igt_require(data->n_pipes > 3);
>> +
>> +		if (!forced)
>> +			igt_require(data->ultra_joiner_output_count > 0);
> imho this 'if' makes FORCE above redundand, so you always require it?
> imho sample implementation should look like:
>
> static void require_ultra_joiners(data_t *data, enum force_mode mode)
> {
> 	igt_require_f(data->ultra_joiner_supported,
> 		      "Ultra joiner not supported on this platform\n");
>
> 	igt_require_f(data->ultra_joiner_output_count > 0,
> 		      "No ultra joiner output found\n");
>
> 	if (mode == FORCE_NEEDED)
> 		igt_require_f(data->non_ultra_joiner_output_count > 0,
> 			      "No non ultra joiner output found\n");
>
> 	igt_require_f(data.n_pipes >= 4, "Minimum 4 pipes required\n");
> }

Thank you for your review, have made all the changes mentioned in rev3.

Thanks and Regards,
Karthik.B.S
>
>
> Regards,
> Kamil
>
>> +		break;
>> +
>> +	case FORCE_BIG_JOINER:
>> +		igt_require(data->non_big_joiner_output_count > 0);
>> +		/* fallthough */
>> +
>> +	case BIG_JOINER:
>> +		igt_require(data->n_pipes > 1);
>> +
>> +		if (!forced)
>> +			igt_require(data->big_joiner_output_count > 0);
>> +		break;
>> +	}
>> +}
>> +
>>   static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
>>   {
>>   	drmModeModeInfo bj_mode;
>> @@ -554,7 +593,7 @@ igt_main
>>   	data_t data;
>>   
>>   	igt_fixture {
>> -		ultra_joiner_supported = false;
>> +		data.ultra_joiner_supported = false;
>>   		data.big_joiner_output_count = 0;
>>   		data.ultra_joiner_output_count = 0;
>>   		data.non_big_joiner_output_count = 0;
>> @@ -574,7 +613,7 @@ igt_main
>>   		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>>   		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
>>   		if (is_dgfx && display_ver == 14)
>> -			ultra_joiner_supported = true;
>> +			data.ultra_joiner_supported = true;
>>   
>>   		for_each_connected_output(&data.display, output) {
>>   			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
>> @@ -629,32 +668,25 @@ igt_main
>>   
>>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic-big-joiner") {
>> -			igt_require_f(data.big_joiner_output_count > 0,
>> -				      "No bigjoiner output found\n");
>> -			igt_require_f(data.n_pipes > 1,
>> -				      "Minimum 2 pipes required\n");
>> -			igt_dynamic_f("single-joiner")
>> -				test_single_joiner(&data, data.big_joiner_output_count, false);
>> -			if (data.big_joiner_output_count > 1)
>> -				igt_dynamic_f("multi-joiner")
>> -					test_multi_joiner(&data, data.big_joiner_output_count, false);
>> +		require_joiners(&data, BIG_JOINER);
>> +		igt_dynamic_f("single-joiner")
>> +			test_single_joiner(&data, data.big_joiner_output_count, false);
>> +		if (data.big_joiner_output_count > 1)
>> +			igt_dynamic_f("multi-joiner")
>> +				test_multi_joiner(&data, data.big_joiner_output_count, false);
>>   	}
>>   
>>   	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic-ultra-joiner") {
>> -			igt_require_f(data.ultra_joiner_output_count > 0,
>> -				      "No ultrajoiner output found\n");
>> -			igt_require_f(data.n_pipes > 3,
>> -				      "Minimum 4 pipes required\n");
>> -			igt_dynamic_f("single-joiner")
>> -				test_ultra_joiner(&data, false, false, false);
>> +		require_joiners(&data, ULTRA_JOINER);
>> +		igt_dynamic_f("single-joiner")
>> +			test_ultra_joiner(&data, false, false, false);
>>   	}
>>   
>>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>>   		     "when the pipe is active with a big joiner modeset");
>>   	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>> -		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>> +		require_joiners(&data, BIG_JOINER);
>>   		if (data.big_joiner_output_count >= 1)
>>   			igt_dynamic_f("big_joiner_on_last_pipe")
>>   				test_joiner_on_last_pipe(&data, false);
>> @@ -669,9 +701,7 @@ igt_main
>>   	igt_describe("Verify if the modeset on the other pipes are rejected "
>>   		     "when the pipe A is active with a ultra joiner modeset");
>>   	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
>> -		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
>> -
>> +		require_joiners(&data, ULTRA_JOINER);
>>   		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>>   			test_ultra_joiner(&data, true, false, false);
>>   		if (data.non_ultra_joiner_output_count > 0) {
>> @@ -682,10 +712,7 @@ igt_main
>>   
>>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic-force-big-joiner") {
>> -		igt_require_f(data.non_big_joiner_output_count > 0,
>> -			      "No non big joiner output found\n");
>> -		igt_require_f(data.n_pipes > 1,
>> -			      "Minimum 2 pipes required\n");
>> +		require_joiners(&data, FORCE_BIG_JOINER);
>>   		igt_dynamic_f("single") {
>>   			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>>   			test_single_joiner(&data, data.non_big_joiner_output_count, true);
>> @@ -701,10 +728,7 @@ igt_main
>>   	}
>>   
>>   	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>> -		igt_require_f(data.non_big_joiner_output_count > 0,
>> -			      "Non big joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 1,
>> -			      "Minimum of 2 pipes are required\n");
>> +		require_joiners(&data, FORCE_BIG_JOINER);
>>   		if (data.non_big_joiner_output_count >= 1) {
>>   			igt_dynamic_f("big_joiner_on_last_pipe") {
>>   				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> @@ -723,12 +747,7 @@ igt_main
>>   
>>   	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> -		igt_require_f(ultra_joiner_supported,
>> -			      "Ultra joiner not supported on this platform\n");
>> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -			      "No non ultra joiner output found\n");
>> -		igt_require_f(data.n_pipes > 3,
>> -			      "Minimum 4 pipes required\n");
>> +		require_joiners(&data, FORCE_ULTRA_JOINER);
>>   		igt_dynamic_f("single") {
>>   			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>>   			test_ultra_joiner(&data, false, false, true);
>> -- 
>> 2.43.0
>>
