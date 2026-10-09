Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87078CA6018
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 11:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A875112083;
	Fri,  9 Oct 2026 11:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyNSh8rE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620F610E4BE
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 11:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791546109; x=1823082109;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2A8C3wHJeuTIDq3d4xQGbtXu/Sf6u7y27kTEQPfk/Vc=;
 b=YyNSh8rEsVOHxwULgS1vMd69d3K9th8Yxin5kJfuM7tQ3FYdkDVCzgR7
 s2vY0UnZfysdrv2M1lHZzmGtZnhQb2V24x85A3hZtT4lKGL/SI5f2XyhV
 rmEOXiYU7gEfAUNC3aqjS2JXz+2SoH8BNcsJ/ivymp2H2JUiZY2Ixra/v
 fzuPVRqUV18GvDb4CCKbfHFqnFC73o4H4xYX7wEZNxkknNfJEoY8AmeEc
 rooEqW5MYegJrcFIMwDGoMtJOMwlcY6nUUOWXQ/9LF04ANGfFWAvaNfOx
 5iTtl00cgSaJ9+ts0CRlYFdX2eZIA/kNzvPScsndb17rQXeaPf1Z1Fh99 Q==;
X-CSE-ConnectionGUID: ABMDfRARRx6hfHdAGe/C/g==
X-CSE-MsgGUID: lIUvHc1TTQmU9hdfgo8bxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="440057"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="440057"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 04:41:49 -0700
X-CSE-ConnectionGUID: ddPCJwBVT3ekPo/6ZeEOFQ==
X-CSE-MsgGUID: 7o25BajKQR+DqvmE9hvQwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="281424"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 04:41:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 04:41:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 04:41:48 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 04:41:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfEyCMLCBCBFmQAa/YNQreT/OzYk//2Tgwjuvo8oXKn1dvZV74jZIuwkZc2jCuAWMhquxvmuG5jcmmflDzk1HkMZL7E8w0ev+dEaKpaBtPAwnr43Gl0LgLJxKa662H7s5UrMP68M5kkJe2D38AGKKCTWdbU23AOp7hR+z3Q9MHE/THBACgtoP1pbcrJkxr+GJmzcSdK+pfWvEwEm7PBqx1bvFzSsgV9rycxXpp1ARL+AZ+FBurqpaJqU4buRcELrn9y9jW5e+ogqp1fn5gTmN6+kglDMlLo7mlAKvmTprdzIAn1vnCG88SscLtN7rbxn6WzIi2x80tPqsptEjtojzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+czsw6qt7yIyTnLJgKZs8bxM9rPWM92z4ragh1cQlOg=;
 b=HUEpeOgmEAUGJyldj5FES2a3yg14FRKtWw9avOYHpMVQ6Ia168dh8MfWU+R1BktaiiEjBiYNiZ6ldDhB6oU+IFNlhGtdHUChElbe19eR+m9soktCIMTi1Wv6OjJUKGfBcM2cszwna10tCkLlfNSwskKqCxyXfID3GeSLgTXwKxgfd+k3P0NtV+l3HaCSVaSyaHicv/3sQz3WwBxCr665lAZBpwTKimbnmVqtdG0iYJvAlMASwW+kP1SCoGrE2nbxphrEwrkj5zQs+cn1az395wNPvLIz+REszc5/YF0hANvyJpqsQU5TuhJr3R6dHcNPoFv9mBXKJ22/vchv4NvdGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 11:41:46 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 11:41:46 +0000
Message-ID: <4c926b6a-eba8-4a8b-bf68-9d8c2cd81d9b@intel.com>
Date: Fri, 9 Oct 2026 17:11:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] lib/igt_drm_netlink: add get_error_threshold
 command support
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-6-ravi.kishore.koppuravuri@intel.com>
 <e59a8aa5-7269-458d-a024-41251dde9ab9@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <e59a8aa5-7269-458d-a024-41251dde9ab9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0214.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::10) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|PH8PR11MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f2e2f5-f7ea-46ef-51d6-08df25fa4c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: HtA3sjsPZNcLEWa0VQa8AZbv2tLshI71negKmd00u3aHKKbOSdpvKZ41RdiAE0fismkNC+laW86acT5oy3jGDNbSdUfyYwcaJbO5DeXMp0HKqToIR7hBrtKKHYKc8vwP9vcANZwezCi5Ba19W4+3YY5cDrKF9GTTlY1TL4MyVWvSOwUhXtV0w+7cv89MOFmFVgsE7iWQba+ITJlDlbR3BIf3q5A8+DMqGEhua+qROxMIhoz7z0wu97wzhY5UN5vxe4myZtK09y9PB8/BQN75oMHdiCH6UM13wCozZtWGnSGzMrb757XdlRNJCrmvReRnKNQNmbsEKMrllR5zr5c7vNoIPX5mAqvUs9cQ0QtiwCQFbDnFlE5KpLwQqmH6k7kDWcgJlg4D1p9tSzzrFzwoRGJDDU1w2Sptx4hx8uNhMQZNHnrAhgOjlvXoVhs2g60qwOh2wnNPv0+tgLe39K44+K9doBoF0+UlOVw8azlyySuOp1kyPT6DMcAUdeyw7dwexTwRUmKrSfzNwiZCOdOS04++LXVNwVS9YozQZlWpTCHg9WcDO40R0VWtmTBaWDwpHzJ03axqWA2JioO99p4qYe820hsf4q+lGkF2QeYlpD1oftUSGQrU6kRwLof9S3sdTO1tsjgn+cA0y7lJniDsn0hbPFUFePgWSkmc1nN3JGI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0REY3RQK1R1aFFqV29JRmdpNGFXSWhyZlA0a3ZWTHBPcnVwNzkxNjNjRzFk?=
 =?utf-8?B?RURmYXN5dlNDbUpxdEMrUHoydDQxeHE4bUZOQmRmS3NWUHMzb3huaHRvcnFh?=
 =?utf-8?B?aC96dk4rM3haZE1iKzVuSGprYzh0NGloRk1ERzlPOFFTNmRFT2Q5NFcwTlNW?=
 =?utf-8?B?L2t3TlR2NlNWMThkNVpZcmVQZ2d1RjE1dmh0bG9BQXYzSjVPOXFhNkNkZmRp?=
 =?utf-8?B?VDhFMmhNVTFVYlJYUldSVDd4Nnl4ZXAwM1Q4Y01JekhidmQrd2dKdmF3Vmto?=
 =?utf-8?B?RjNnR1ZRRThTb01FclJlRVVOS0gvTm5Pb3Z4cks2SXIxZ1JzbmttR2cyVEpZ?=
 =?utf-8?B?OHZGZEQxK0tnSWlkb3VVQzNSVTdaVWwzRjN3ME9TQUZOWU5oQWUyWERyWGFp?=
 =?utf-8?B?dWNLYmdpWG5DTEk2OG9wdlJkRVNHNzc0ZFJ1M1VHbFRXWW0wQ3FMSUpzSDI2?=
 =?utf-8?B?WHhYUjhIcHJsQ1paTVRGTlAzNm1PMnF2cVcrazFHaTB4RCtQRE51ZDg3QmYw?=
 =?utf-8?B?R3N0bFNhZ2N4NnR4eEk1eGorMmZYa3FDTWpoYjJ6UmRtV1MzTzdRa04ydWRD?=
 =?utf-8?B?ZmlSUHhMZzBlUWRJZW41MkFrN1ZabmpVT3NWY2RvRkRJeU02MXc5dnNVRkVE?=
 =?utf-8?B?OW9UNjBNclgva3RZYUtNTVNXTlRvbG4zRU9mQ203ZEVqZEN2T3lvWEVLVy9K?=
 =?utf-8?B?aVk5V0ZYTDBnRmJ0ZU5HZVlSUnk0akdiMElwTXdwNDR4RHQrOEdGdmorQ3Nw?=
 =?utf-8?B?MGxvaWxHS1FQTmh0MitqSTVueEtBZUxqek5zZHU0ME1VNUVjR1d1WnBFN05F?=
 =?utf-8?B?R2VTckcrcTFRRWs2VDNxVmFnV29zWERVWGdkNnhaZUFWZDM0Vkp5R0l2TXBB?=
 =?utf-8?B?UUthek1FRlYyMUxYNHUrL1hPdXR4aEcxMkYzdDlCbkcxZVRPY0tMWjYzWnVB?=
 =?utf-8?B?Z1hJalVwdjc5Q1lscEd3VUUwNU9XTTdkcFRxbWxjSTVUcHJDUWJIR1Y1bCtN?=
 =?utf-8?B?SnZJU3VCR1IySXA1bEkxdi91QmdCbTBwWUpLSWg5MjllWStDVlhLbUhManRW?=
 =?utf-8?B?N3RMczJIQzJIcU5STHZYbU9qTTl2RmhJc09xSmVDM3BZeXRCUGxkbWVNMC82?=
 =?utf-8?B?OS9oeFdBNzd5S20rbXFqMUxWTGJvYWdSWXEzTjU4b2s3cDFrZkp6SS9mSko3?=
 =?utf-8?B?YVRjSlhQTGt2VTkxWG0vaGFhaXQ1ZHRZaGNqWEJxOGZtODROQUkzYmo5dGxL?=
 =?utf-8?B?eGRraXhqZ1k4WnVwYnFTa3liNkxPaUFVTjlaTFRXU0h4KzhzVTlWQkRwOFRL?=
 =?utf-8?B?aElrTGxqM3V4cGJUTTlvclZMRzd1NWhkdGJwRkRuRE44TGN0YVN1d1l2MGtP?=
 =?utf-8?B?SmJFT25oa1BMRElTK1pRYnBSZXNMUmpicXZKUUdTcmhVWEhOTHRZZkhaN1E0?=
 =?utf-8?B?YjJLR3hRQW5abEVEZVVMeEhJQ0dWdVhyYTkxUEUzL1hBOGMrODJhQWN6RFVJ?=
 =?utf-8?B?aVJ4T0t0c3ZUYlc2UC9VK2pnS2w5d1M2b0xqZDRkV1NGYmh5RE9DMERQY0Yw?=
 =?utf-8?B?Qkg1T1BSYnpRZ1oyOWl1N0xIUmljenMvaWhCZ2Z3Rm5oZFdKOUo0OWlXWCth?=
 =?utf-8?B?OUEzdmVGU3UvWEJPdnpVUUFCdXQ0Zy9kcnVGM0puUUFUak5XbTJHT3dDVmVk?=
 =?utf-8?B?bE1TV0Uza2lXSUdtdlgxRkljWVlUSGJtaGNFNTBlUG8xZmgvNExQRUlWc1lI?=
 =?utf-8?B?ckt5QXdjbWk0d2dlN1FzOTZFOEFkdis4K1Izb21USUQxNFRWbU5lK3ZOaG5Q?=
 =?utf-8?B?MEViZ0N3NnB2N21ZVFMxZEdrNFRXdGxtNHR3TE4yTENHd3o0TmVCYUQ1ZW9V?=
 =?utf-8?B?OXF6UXhSRnJ6dHZPM1lMYStSb0VnWXVzYTFTSXJrTUxOdURDdW1WdTFDTnl0?=
 =?utf-8?B?K3ArRGlOSkZxK0tkZU5LK0U4U2VrakZCV0g0NUpCTWlkNVRtTkQ3L3hzWVNI?=
 =?utf-8?B?L3lHWVQreTRmdCtkZmU4cDVoS1lPV3AvdTJoZlBKVkVBR2Q2aE1hVk82WDB3?=
 =?utf-8?B?Z3BObkc5S3VobUxJMVMzZjE2bnZjZVh3aUcreU1vUThWa2daZE55YXVtdGtQ?=
 =?utf-8?B?TGVMRm4wcm9rZGJuSFFQTDFFbnByRG51ZWJQWmtJcUllcFRtZW1CbGJpZHVn?=
 =?utf-8?B?UytBTXJvUHlJZ0srQmcvNjBPQTJKZi9CbENJK2dhNmI4d0k4THlwTE5sYlVl?=
 =?utf-8?B?a2t3ZXE1VjhGSXZqa0xzYmd1ZTFOdzRoaXowWmMxaDE1c25OUyt0Mk4ybzFx?=
 =?utf-8?B?ckJ0cERuVk83OVpqcTF0YlNZQ1FxRXZNT1RJRWNnZlhIYmFnZDFENHp2QXZx?=
 =?utf-8?Q?I0Q9E7uUeOoQm/jB5N1klqtJ0Jmp86UCJ5Tdk?=
X-Exchange-RoutingPolicyChecked: itP1mC3qtZ5shUiubwnIdfI5Z025tBrZjq7kq96R3BCwEDg4UyJkV7au2w/jA+VUipIXiXCZ/VIF5mC5Ik78BmBoggcidio2UG2H5p3fiBbZeBsKKZlC8JGtH51erlrBByJ66RV3pSoD5WBAEKYyotQQNT/rzB0ouT39n7tAY19y+Lq7KH9Y7KRV8RFEMbyJHYPefFeOvY+QEBlaEIRrKo09sVm0RJvoD/N8G4CekddaHWFWzcJla+Hw5oC/lCFel1zUkjhjFY/WnmzPEz7wudPBKfqyWcCoyOGC9Lxi0OBML5p/+7notx1jacaDjUVwgsbjNTkvup1WhCNXY392+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f2e2f5-f7ea-46ef-51d6-08df25fa4c60
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 11:41:46.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mn894hHoo1x/tK2nSQRZknVerLPg/fqhxlAdVNrwPJiyIajyZPtlonDH0WLEmWQkwTbxv98xDuRYsjwGOJ89doOR1n1+oY+eMNiFR3U5WXQ1oLfZgJk9UeX3/X8TbPZD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7022
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

Hi Soham,

On 18-09-2026 19:28, Purkait, Soham wrote:
> Hi Ravi,
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> Add support for GET_ERROR_THRESHOLD to fetch the current value of error
>> threshold
>>
>> Cc: Purkait Soham <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Jadav Raag <raag.jadav@intel.com>
>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v2:Added a check whether error_threshold updated by valid callback or 
>> not
>> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>>     Jani & Kamil)
>> ---
>>   lib/igt_drm_netlink.c | 58 ++++++++++++++++++++++++++++++++++++++++---
>>   lib/igt_drm_netlink.h |  2 ++
>>   2 files changed, 57 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> index b18e3eeb6..1be7d4361 100644
>> --- a/lib/igt_drm_netlink.c
>> +++ b/lib/igt_drm_netlink.c
>> @@ -40,6 +40,21 @@ static int ras_command_cb(struct nl_msg *msg, void 
>> *arg)
>>           ctx->error_value = 
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>>           break;
>>       }
>> +    case DRM_RAS_CMD_GET_ERROR_THRESHOLD: {
>> + struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
> Could this be moved at the start of the function ? e.g:
> struct nlattr *attrs[(DRM_RAS_A_ERROR_EVENT_ATTRS_MAX >
>                   DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX ?
>                   DRM_RAS_A_ERROR_EVENT_ATTRS_MAX :
>                   DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX) + 1];

Will move the common functionality to the beginning.

>> +
>> +        ret = genlmsg_parse(nlh, 0, attrs,
>> +                    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> +        if (ret < 0)
>> +            return NL_SKIP;
>> +
>> +        if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD])
>> +            return NL_SKIP;
>> +
>> +        ctx->error_threshold =
>> + nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
>> +        break;
>> +    }
>>       default:
>>           return NL_SKIP;
>>       }
>> @@ -183,6 +198,7 @@ static int send_command(struct app_context *ctx, 
>> uint8_t cmd)
>>       }
>>         switch (cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>>       case DRM_RAS_CMD_GET_ERROR_COUNTER:
>>           ctx->response_required = true;
>>           ret = nla_put_u32(msg,
>> @@ -233,6 +249,7 @@ static void reset_drm_ras_netlink_context(struct 
>> app_context *ctx)
>>       ctx->reply_received = false;
>>       ctx->ack_received = false;
>>       ctx->response_required = false;
>> +    ctx->error_threshold = 0;
>>       ctx->family_id = -1;
>>   }
>>   @@ -283,10 +300,8 @@ int igt_drm_netlink_init(struct app_context *ctx)
>>       return 0;
>>   }
>>   -int igt_drm_netlink_get_error_counter(struct app_context *ctx)
>> +static int validate_inputs(struct app_context *ctx, uint8_t cmd)
>>   {
>> -    int ret;
>> -
>>       if (!ctx || !ctx->sock || ctx->family_id < 0)
>>           return -EINVAL;
>>   @@ -299,6 +314,17 @@ int igt_drm_netlink_get_error_counter(struct 
>> app_context *ctx)
>>           return -EINVAL;
>>       }
>>   +    return 0;
>> +}
>> +
>> +int igt_drm_netlink_get_error_counter(struct app_context *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> +    if (ret < 0)
>> +        return ret;
>> +
>>       ctx->error_value = UINT32_MAX;
>>         ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> @@ -316,3 +342,29 @@ int igt_drm_netlink_get_error_counter(struct 
>> app_context *ctx)
>>         return 0;
>>   }
>> +
>> +int igt_drm_netlink_get_error_threshold(struct app_context *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ctx->error_threshold = UINT32_MAX;
>
> Could it be initialized with 0 ?
>
> Thanks,
> Soham

To maintain the uniformity, I am initializing it with UINT32_MAX. BTW, 0 
is also not a valid threshold value, so that shall also work fine. As I 
have used UINT32_MAX for initializing other vars, followed the same 
convention here as well. Moreover, If in case, 0 is also brought to the 
valid threshold range in near future, then this initialization to 0 
creates ambiguity.

Thanks,

Ravi Kishore K.

>> +
>> +    ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (ctx->error_threshold == UINT32_MAX) {
>> +        igt_warn("No valid error threshold reply: node_id=%u 
>> error_id=%u kernel_error=%d\n",
>> +             ctx->node_id, ctx->error_id, ctx->last_nl_error);
>> +        return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
>> +    }
>> +
>> +    igt_debug("Retrieved error threshold: node_id=%u error_id=%u 
>> threshold=%u\n",
>> +          ctx->node_id, ctx->error_id, ctx->error_threshold);
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> index 5db7f4ab5..89ef58243 100644
>> --- a/lib/igt_drm_netlink.h
>> +++ b/lib/igt_drm_netlink.h
>> @@ -18,12 +18,14 @@ struct app_context {
>>       bool reply_received;
>>       bool ack_received;
>>       bool response_required;
>> +    uint32_t error_threshold;
>>       int family_id;
>>   };
>>     void igt_drm_netlink_cleanup(struct app_context *ctx);
>>   int igt_drm_netlink_init(struct app_context *ctx);
>>   int igt_drm_netlink_get_error_counter(struct app_context *ctx);
>> +int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
>>     #endif /* IGT_DRM_NETLINK_H */
