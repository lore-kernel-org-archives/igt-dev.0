Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A46CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 14:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B32510E82B;
	Wed,  8 Oct 2025 14:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M34IWEc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19B510E82B
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 14:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759932272; x=1791468272;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OTg8WRBwA0EPFI2zUX+NScwC1UlEJGmJ8vBUyBAZhdY=;
 b=M34IWEc+bhU66OjzIXylZ53N6lC43ebT7H1AGC69lmFoe29vQJwbVmke
 sq0QXPivDB9qvGbfgtzWB9B5zJjSrWxRynaXeKq4+sDqYvDUwrixLc/RV
 2d7FOSh3QgweBnvz2kBf/tC/mGajxx4KIlqQf071XSHsfKZkTirh8Uzga
 UY4L3MXl8TVf4q8o2XEiSrbMZNKT5YmtP/hjvJsZ54BjXGoryah3tOn8x
 /6f78aeuCErbdLszSrtntvpxuGX/yJAJwDFbLXKe1j+HsBhMYRnZsTsRj
 92ZlfyPX7hMlEfDBEPAQflf163WCJMeY4gC8YQWS82cLoIIT0wrtsO8cl A==;
X-CSE-ConnectionGUID: 4DneSxPKQ7S70HCLzCcj2Q==
X-CSE-MsgGUID: Oxlbo4fQSf6IxRhlO+fqug==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="72387427"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="72387427"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:04:31 -0700
X-CSE-ConnectionGUID: fahlpmxTRICLk1FQ4piyAA==
X-CSE-MsgGUID: 23GtIgGkTref7Wsx9Sae9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="179583780"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:04:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 07:04:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 07:04:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 07:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfDyY+4Ea1vcCzJYo4tsA1krddEEWQnhwGKMeDZqLUFkmY6smvl0RxWl5Clqcu4XSIT07QMfT9IJlrLs0inYvW+gXDj3lp/U7JoACHXTZVrz+kE6Z6cuJPhmgWy/14YqbiuywyI2hYWAohcMvmiqgP67la3ldHCKowhLqdY3COHvN+/nrSn8H09loGRGTbP+DTbIlVwUucf89zIybhyBeWoKel3ZcEexIBldEraV5L2YGwZ7R+KMpUtgs21nKawpxnbNUbYmHwXt/UonhbQpO1hi7wzGdvxVwEkut7xZoU0ZOoFWx44E1Xb2LrMV3y/j9Y3vLUPJ6H49nC6WfElhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGCpheQ6Xx71Oo9KWCDvIm91dUm+VqvJeEP+TzhNkl4=;
 b=E6OFkXBw4gY9/dg4g4aP1qJS5N2i1I8pNRbN9zQf0KsKlaMsB3tgTdeCMEgDBE1R1uI+1YxU8RcxUf/XsoYS4MwvwGxuSu8IUSOt1OMefEJvIazRRWXP0rUh2eaIosw7Z1N78LFT2C0M/0YLneyYe7t6aTuPf2UH/KJLPwSdG7WazUXUIqKFeZIUzGKuR7725yJniCvcQM5YHR0aoiClniM5hdkHitmjWVtg6a9VA2BQn5UXur57jOOw9XFfopglBE+j0EkF160LddVxSv9biRqCdXAR1nEHY+/wmg1G8ntmRkrFdOfEr5m8QFsh9fVOrDXY5jML9gVLTEGaluo5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ1PR11MB6273.namprd11.prod.outlook.com (2603:10b6:a03:458::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 14:04:20 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 14:04:20 +0000
Message-ID: <7c0acc0b-0c0d-4155-80b5-677a4f1e99b8@intel.com>
Date: Wed, 8 Oct 2025 19:34:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] test/intel/xe_pm_residency: Add support for ASPM
 Link state residency
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>, <sk.anirban@intel.com>
References: <20250925153346.1028542-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250925153346.1028542-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0045.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ1PR11MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 333f3da5-0f6b-4af6-4c13-08de06739388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVdIa1A3Y0d0ZVpMNTZWOVlJR2JxZlNzZm1maDVZS0xGdjhMOHExNk1SWWk1?=
 =?utf-8?B?Tmt2T2RrSC9xR2JqeTZOM1RoVzlZRDcwY1NVam9zSElFYjhlcktsbWFsM2ht?=
 =?utf-8?B?TUhZNHlBZE9lck1VS0I5LzFaN2s3RVRrSHMrUWlkanFtVUF6dEVQMm1yU1Yv?=
 =?utf-8?B?QVUzeXBNeFFkTDlDV3JQMXhvU1QvN3VKeE1xK3FUbXp4MWV2SXVlUFE0Q1FB?=
 =?utf-8?B?S3B1RE53OFhQMTdCck5ORHFEVnl0QUY5MXpTeTRSb0pRRmRhbUFkN1dtSGVT?=
 =?utf-8?B?ZnpZTGU1T2hMdVhQYU1yOEFhYVVZY3ZRSkVkVmJuS0o3SHhJMlVQN1dvczVp?=
 =?utf-8?B?N1NPUkMzSm1tTndXYVAwV2RiVGhYekk2cmgvK294WmxRaWNJN2cvZTlkeUU4?=
 =?utf-8?B?SjNpb3dPUVA0RE4yTnVVNThSakZlamU5bUhTRWVJV0Q2d2RNUUVpNFQ3WnJw?=
 =?utf-8?B?d0YxU0NJOUVPcWxBYVg5Q3FOK2NRYXVVMEFhM2Yzd2pBMThwVEkwemdpcldx?=
 =?utf-8?B?M2M4ZWVPQTIvazNjZ3FoclFTU094RzVpWXIvQ3prS3BIQ0I4WVgwWkVtWThJ?=
 =?utf-8?B?YUdwRmlhc2tVVnpCWVR2Uk5hNVBGbjJzNHJyTEpFcGFXQXdaMklKYmVEblVX?=
 =?utf-8?B?WXEwL0pEQVN4cGJ4T20zZzlxZnVvQWk1MFBUY1dEcUVjQ3JKVldwM3NSdVlP?=
 =?utf-8?B?U3NWQjNkdjliZVRVeStUbDRjRmpUbHFDbDNkeVZxRC9Tc0dhNitGN0Y3M2Vv?=
 =?utf-8?B?YVRMRHVFeFBzS1ZNOWhnWlVqUU9xelFDaDlNZHVESWhUVmNxb3JLV1ppaDh2?=
 =?utf-8?B?dXpxMGZSR2p1cjhCLyttbHd6MUNNendaMnZKY0RhRWliM2pZalZ1UFpZMDB6?=
 =?utf-8?B?ZmNDMTY1MG4xUlUzZE04MkErVFlhMi9PSkhlTTBQcnRxanc1Mmg1VWZoM2dw?=
 =?utf-8?B?VElYUkFubWVjSDhTMXdkUkprTEJzcjQ5elVheHROaU1tZmI0RlhwcFpmQjlX?=
 =?utf-8?B?UTE2T3lVOXljemJVcjZVbGdMMzVpeWg1OVVZSE1xZUVpV012OTZCSU4wUFNX?=
 =?utf-8?B?a2ZBY2J2N2Evd3lmb0tjVmF4VzB5dmU0S0wxTTNGOU16NTdOT2d6Q2tWRlJZ?=
 =?utf-8?B?MlZ2S3N0dFpWZXBEZ3NJNVA1bDZVUmg0VTA3MTQweTZxZU14TDhDUGI2dm1B?=
 =?utf-8?B?Mnd0OUc2aTNXRytkeWFWdVpSWmIvUzJ6MzAzOXQzYjJEWENUQVovaGxvK3Nn?=
 =?utf-8?B?eTdBRVU1cjhtUzRCNjVIS0c4YW05Umoyak9SOTh0TnFnOXFmTzZMd0xVUUN0?=
 =?utf-8?B?VXRnNWxwWVV0SHdPb3ZJWEpwNXBBb0xRRTA5TVJlWlFMN2VqeEFTQnczY2I5?=
 =?utf-8?B?RzloT28zN2NpRzBFQkFWeUNNb2JpYklnc2pNODR0N05tUWNjTG9ZdjMxUjVn?=
 =?utf-8?B?REo0R2pDU1FvcXJsMDRobTRkWDZxNHZhVUVIVUpOdXh3ay8vNHFqaGIydjNW?=
 =?utf-8?B?SnBFemR6WHlKN1N4M0NXc2hoSURnZm1aWm8rT3U0TG9iQysvRkZJUmtsSGpp?=
 =?utf-8?B?UDYzK2tOVEpWWDMxNUJjY0hYMEozRnhocEF1R3RTa0ZEaXZLM3I0UDJWNWdB?=
 =?utf-8?B?c1pBWnQxWkswRGRyeFRqUmZyd25jTWlCQXFRZm85eUM2a0JLV2RlRGRpdGVP?=
 =?utf-8?B?YS9iSkRmbkxRVi95U01QTWVZUmJVTVRFaW5GRk03aGtnb3VxMk9xMDVEZ1JG?=
 =?utf-8?B?Ni84dFNzMXNKQXpQdVdhbVhMNXZrT0FFUzJlU2x4Z0pSMy9hMkFEMGd6ODVp?=
 =?utf-8?B?RWFrS1FaWGRlQXdWMFZnazRpeC9KSjlNcVJQZjAweUx5VVU5eUthSTJnUElJ?=
 =?utf-8?B?d2Rid0JENmJ1em8zckc2TlU3cDlDeU8yTWtld285Wnd1QnIrbFVSaFdzOGdV?=
 =?utf-8?Q?CzvVkkw5+iv6nKVtACiRNyIscw3eRmwC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVJRZjhlV3AwS1l2SW1vaXRKa2NWUGNmdHJURHg4SVRKZ1FhbkVvclR1VHNm?=
 =?utf-8?B?Wnc3YTQ1TzBPVEtMSzcvZDQ2a0pKbTF3TGFZUjBtdDNnRDBQdkNDZGVmTU4y?=
 =?utf-8?B?UWd3TDRsM2JvNSt4VmFUaDVweDlxNDdzQVpGZmFlWXJlSElTVTBMYWpzWGdo?=
 =?utf-8?B?T1psZmZKVENiOEVoTXpmbG8xYk5vNlNiYXU4bFM2S2VpZVE5T25xSjdrSWNE?=
 =?utf-8?B?dlFzQkExZll3UGtLOUZtZUpSd21yTVVhM1BDdk9MTUEwOURRRDE1M2VrUVZH?=
 =?utf-8?B?a1U4RDRTQWFnNTRUSkR0b1p6Y0NtVzFFR2VOWFQ2UW41STBsOXA1NTdRMXlH?=
 =?utf-8?B?aVJ1K1dVVFNqVUN3WjY4aGkxdG1zZ3hqRHA2enlKTW9QOEgvTThkUnV2M28r?=
 =?utf-8?B?b0VOVCtFMkFqYi93amRNK3Z4SDl5aUtIQmZqNitEVzcyZkg2KzJqSkk4ZmNk?=
 =?utf-8?B?QUJqblQvVmFEL2ZtN2dJTjA2cUV2Ym1GTjJRY2FlSE0zTE1DeTFCUTNmZE52?=
 =?utf-8?B?ZU03N0tXZ1JYa0FJeGQ1eVVoaXRFaWxLbFhJd0FVWDJXWDR2OXZleXMzRmdx?=
 =?utf-8?B?Tkl3RXoyVWNFSXdleU5UM3BzQThET2VudnU2TERwYzNhSVZ5MlppbHVLL2Vr?=
 =?utf-8?B?NTNKSGwzT0w5aTExUTg0TFQwdmV6WUtFY3V0ajVPNDhpMFVjZ2V4MDhndVlS?=
 =?utf-8?B?ZU5QcEQ5VFEwQlM5WmlIbjY4blBaMHRIbEMwZWNVZnZ4VWljNFhDYTVGeFpP?=
 =?utf-8?B?bFdPRUVRSm00SUxFUjZPOXpMUTU5TUFHc3lpVnV3WkJQdm5nallGdmhKdzc2?=
 =?utf-8?B?b0dVc2ZBQ21Scjk2S3NQNUFrcGhHU1Jya0lYYytFb0swTzlaZkhTdDBzbW9L?=
 =?utf-8?B?bkZsMzRsWkZMV1F6bnVPeVNPOGJDR2VqSEZQRi9yS2NsK3VPM1d4Um1RTzN6?=
 =?utf-8?B?VE9sNDlweXRGL1Q1NnpkU3R1bjVTR2xVNU9vQTlWTGFBcnFkT2taTW1kRExR?=
 =?utf-8?B?Um5GZmU3ZU4yd2N6dHF2YjdjQmVBMG05YjJGTDhWSUFUNWNiWXFOZ3ZvdVZq?=
 =?utf-8?B?YUhIVE1rTDhDMWFGaDZhakNWYXVlbC9zQ0pBRXZiRW9XWXBzNDFXQjVvVWRU?=
 =?utf-8?B?UmFOc2plZXFpTHlIMmZmcXpFY0k2aVFvbXB4eUlBaDNXbFBWWTE2c0NmSy8w?=
 =?utf-8?B?WDE3MUlncGdQYnJPblU4RlpJbkFuWEV4TnowZU15ZW84SUtiTzREZVk4RHc1?=
 =?utf-8?B?UlhEU0hrRmVVK3ZkQ0tvZlphY2Zvb1lXMDNLS3NMQzhHRjEvRHNzdlFMUlBk?=
 =?utf-8?B?SnhBOXZOSmthMVVXV1BsVFd4alBFZjI4dkc5N2ZBb0xweGFDSi9jOUJuRCtm?=
 =?utf-8?B?V1Y3VlozRVE0TnZFMjNqSHRDQXIvNUZTV0thK1QxQmQ2MDBKSVIwakNtbzBL?=
 =?utf-8?B?bU45L043aUVPc3lUNiswTmdJR1I5d0pDS2ZnZVhDMWwySVpWWTZVZlArVG1D?=
 =?utf-8?B?cGxQM2FSNDFoc3dmQlFJNmZWdVJpZEdqMUpJaHJxTHUxYm1FNUJva3lObm00?=
 =?utf-8?B?UGN2cldoaS84bkd4L1N5bUFSOWlUQ0dlU1ZmSW1vU1B3RmczTGVsa28ybkVj?=
 =?utf-8?B?ZEZ0azRVc2g4OGdERWJGMkVmNFZtdG1laTFKemxzaittbFV0WVpTVFZFMnY3?=
 =?utf-8?B?L3lDRGI0VXpDWlo3ZVZUT3RZN3Z4OFBOUkREUytaVDVQSHJ2clRTM3dFQ0xB?=
 =?utf-8?B?WGJrNURSYmkvSzV4U09HVWkrRW1PaDd4eHdza1Y5dkpPOVpza1Z3RmtaQzdG?=
 =?utf-8?B?TE1TVDVRZW82MXlQRE1GQjR2N01Sb2NUdUZvQStZYm53T1pNSE1NN1Y0UE5n?=
 =?utf-8?B?UWhYWkpwY250SU1lRVNpK0JBTUVhd05sb1hFWUFRdUlqWXFrYkJSTjR5MnJZ?=
 =?utf-8?B?UC9kRjhKd3VVWmh4a0xVM0g1akdtMmY5UFRiaFZvSEkwZFdmNFp3RzlSUkJR?=
 =?utf-8?B?RHI5ci93bytINXNBZzlKLzhpZ2o2Um1kY1RrQjl5MmdkdGExem1lajdYSURI?=
 =?utf-8?B?NG9wMnpkQW5ueFhiRWNuT2dVN1ppczJNd1c5WFUzaXFKR1VtK1lDaGdwRVZv?=
 =?utf-8?Q?sPJkkL3j6cfbfQ0MxrmcMd4po?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 333f3da5-0f6b-4af6-4c13-08de06739388
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 14:04:20.3215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHwTobJWgHFdd9F3dK8rZXH05siadsJ5d0zp/oHUDAWdCQEfeSzsUUzRsZPAfD+F7LxELX9cIweVbWUPRgYVIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6273
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


On 25-09-2025 21:03, Karthik Poosa wrote:
> Add support to check ASPM Link state residency entry using
> counters from PMT Telemetry.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 108 ++++++++++++++++++++++++++++++++++
>   1 file changed, 108 insertions(+)
>   mode change 100644 => 100755 tests/intel/xe_pm_residency.c
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> old mode 100644
> new mode 100755
> index 1749d6467..38b013ef1
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -37,6 +37,27 @@ enum test_type {
>   	TEST_IDLE,
>   };
>   
> +enum link_state_index {
> +	LINK_STATE_ASPM,
> +	LINK_STATE_ASPM_L1_1,
> +	LINK_STATE_ASPM_L1_2,
> +	LINK_STATE_PCIPM_L1_1,
> +	LINK_STATE_PCIPM_L1_2,
> +	MAX_LINK_STATES,
> +};
> +
> +struct link_state_info {
> +	const char* filename;
> +	char state;
> +	const char* parse_str;
> +} link_state_sysfs [] = {
> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
> +	{ "l1_1_aspm", 0, "NULL"},
> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
> +	{ "l1_1_pcipm", 0, NULL},
> +	{ "l1_2_pcipm", 0, NULL},
> +};
> +
>   /**
>    * SUBTEST: gt-c6-on-idle
>    * Description: Validate GT C6 state on idle
> @@ -64,6 +85,9 @@ enum test_type {
>    * SUBTEST: cpg-gt-toggle
>    * Description: Toggle GT coarse power gating states by acquiring/releasing
>    *		forcewake.
> + *
> + * SUBTEST: aspm_link_residency
> + * Description: Check if ASPM link states entry while device is in D0.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -370,6 +394,85 @@ static void cpg_gt_toggle(int fd)
>   		powergate_status(fd, gt, "down");
>   }
>   
> +static void test_aspm_link_residency(int fd_xe, uint8_t aspm_link_state)
> +{
> +	struct pci_device *pci_dev;
> +	int fd_pci_usp = 0, fd_debugfs_dir = 0;
> +	char name[PATH_MAX], *ptr;
> +	int ret = 0;
> +	char path[256] = {0}, buf[1024] = {0};
> +	uint64_t residency_pre = 0, residency_post = 0;
> +
> +	/* Get upstream port pci_dev */
> +	pci_dev = igt_device_get_pci_device(fd_xe);
> +	pci_dev = pci_device_get_parent_bridge(pci_dev);
> +	pci_dev = pci_device_get_parent_bridge(pci_dev);
> +	igt_debug("USP BDF: %04x:%02x:%02x.%01x\n", pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
Refactor this into a dedicated function igt_device_get_pci_usp() and 
maintain it under lib/igt_device.c
> +
> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	fd_pci_usp = open(name, O_DIRECTORY);
> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n", name, fd_pci_usp);
> +
> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
> +	igt_assert(igt_setup_runtime_pm(fd_xe));
> +	igt_disable_runtime_pm();
Add an igt_require check here to verify whether aspm_link_state is 
supported and its residency can be read.
> +
> +	/* Save current state of all link sysfs entries and enable only the one needed. */
> +	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);
Drop igt_require_f from here and continue if entry doesn't exist.
> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
> +
> +		if(i == aspm_link_state) {
> +			igt_debug("Enabling %s\n", link_state_sysfs[i].filename);
> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
> +		}
> +		else {
> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
> +		}
> +
> +		igt_assert_lt(0, ret);
> +	}
> +
> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
> +	igt_assert(fd_debugfs_dir >= 0);
> +
> +	/* Read ASPM link residencies from Xe debugfs "dgfx_pcie_link_residencies". */
> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "cannot read pre dgfx_pcie_link_residencies.\n");
> +	ptr = strstr(buf, link_state_sysfs[aspm_link_state].parse_str);
> +	igt_assert_f((ptr != NULL), "cannot find residency string %s\n", link_state_sysfs[aspm_link_state].parse_str);
> +	if (ptr != NULL) {
> +		sprintf(path, "%s%%lu", link_state_sysfs[aspm_link_state].parse_str);
> +		igt_debug("searching for-%s\n", path);
> +		sscanf(ptr, path, &residency_pre);
> +		igt_info("Waiting to enter ASPM....\n");
> +		sleep(5);
> +		ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf, sizeof(buf));
> +		igt_assert_f(ret >= 0, "cannot read post dgfx_pcie_link_residencies.\n");
> +		sscanf(ptr, path, &residency_post);
> +	}

To improve readability consider adding function 
igt_get_link_state_residency().

Regards,
Badal

> +
> +	igt_info("Link residency before %"PRIu64", after %"PRIu64"\n", residency_pre, residency_post);
> +
> +	/* Restore all states of L1 sysfs entries. */
> +	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
> +		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
> +	}
> +
> +	igt_assert_f((residency_post > residency_pre) , "Link idle entry didn't happen\n");
> +	igt_restore_runtime_pm();
> +	close(fd_debugfs_dir);
> +	close(fd_pci_usp);
> +	close(fd_xe);
> +}
> +
>   igt_main
>   {
>   	uint32_t d3cold_allowed;
> @@ -444,6 +547,11 @@ igt_main
>   		cpg_gt_toggle(fd);
>   	}
>   
> +	igt_describe("ASPM Link residency validation");
> +	igt_subtest("aspm_link_residency") {
> +               test_aspm_link_residency(fd, LINK_STATE_ASPM);
> +	}
> +
>   	igt_fixture {
>   		close(fd);
>   	}
