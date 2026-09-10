Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1798DC79FB7
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 06:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35E510F2D6;
	Thu, 10 Sep 2026 06:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhIEvAEK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB6010F2D6
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 06:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789021191; x=1820557191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Hu6a5BpVD8oahu8aoJxb+seCAvmvXqGCThUgBDSdIo=;
 b=BhIEvAEKxwE6sSJR8EUFDA1AIRXCuYtMJUSynfsQesrayESGdgkvo/QG
 xvkLRievexxsWY6z49vv54xXz9SBG6/C+WwGz/GIU84fdDEiQ0BzvWwVL
 /9uwR/4RJVg+MH7SnNVZDE20ofsonfl5F3kT+dNyFf+onLlmrZ6vRlsbV
 nQm9Nu92PcdnH8YqEmdj7sRQELkhUeagnCmXCZLVCS3OnEdB7hsH2WP+w
 /46OTgOauUFcj0lP2Mfnz4IclxAc4mpPikn1NrILQpt2asuqBz91f+TWa
 ERaAdfbW6TYlNLRqXGY0xjAdKq2MKpZyIgjc8OQJEuzwnV85VgFf8ph2w Q==;
X-CSE-ConnectionGUID: Ld3wqWhrSduWfSPVYwf9rw==
X-CSE-MsgGUID: JhPSgk4XSAKi4N7BE3/9nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88406696"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="88406696"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 23:19:47 -0700
X-CSE-ConnectionGUID: WVeD9Dv2Q+CbxZoLJ0EPtw==
X-CSE-MsgGUID: e1Jj3aBETKKY+hYRo44HZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="265326957"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 23:19:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 23:19:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 23:19:47 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 23:19:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2jGzfKtyGZMT1TRnNpmIil46dliW8PQA384wCY8cemb1EXWe4Yktzubswc8ifVgB0UBDa1kfeUq1seNirvqTLXq/DGBo/ob3vGplH48N6guO32fk12E89ntoRC9xEPc5QOKbARdR7Nr5r5vNVjFFeyXswfPGPsqMieSkE3vWvkJoC0pC+K/kQ8CLBB6ZZ/uHKDglz7HnRT4G8TX2dVe2h2lKDxLyxZjn6rn2E8r/eCnCIdksA9fyVEZANm60qX6vtsgbB+k2y5wlr3ztTbptjRdw7s8oVEMiHNwQ8wuNOpvSVzixVw1t5GOUCzoZo8GN9JrOACyqVrMNhC2wFAtLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LO+wfeh+oR3331NUDCxHxZthRnnWFjzL+kLRxiGr+dI=;
 b=fm+47smU3abfPHqMM0+bNjnZuUfFRAfOuKWIvblB9s3eMqGTtCqB/Ay+bOIw0t5Pm/2R6l/trKxKt+elyGzvidGRWERXhpnjO1kvjueDhZ9PGO/A/o8gfxwfyKIOwg2WrZj+Po3l9+M8unAjga/cvvsiAf8XMLQykJfTy8TZFYzLyqcgieB6zZzz6/SYrSdk3/C6SY3gQF9A88MyPd7AzCjOxTX8O9ZOBytRomNOJ4ghRLFrmjPGmh9+guOJi1ERjX+nxPT66JYMSzrR+jLq8rmpzFjUgB9bWYzbz2x1dSE9iFtlTIUCzAxzum3oVXt4tcee9xzZ5+DFcArvMMwB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA6PR11MB187491.namprd11.prod.outlook.com (2603:10b6:208:5e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 06:19:40 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 06:19:40 +0000
Message-ID: <7e5c94e4-6d7f-46ce-9665-c7788b50f58b@intel.com>
Date: Thu, 10 Sep 2026 11:49:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] tests/intel/xe_err_injection: add CRI GPU
 requirement check
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-11-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260903073335.339540-11-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA6PR11MB187491:EE_
X-MS-Office365-Filtering-Correlation-Id: e5681ef0-6b49-4e02-4695-08df0f037eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: sx01BRx3lhHvOXT9gfEN02u+7utqxNgRo+6f1O+UUrK4ga+WjBm4NqgiLcwK/Wk51G9/feypHqdo68LsAqJJ8WnVoqyN5ZQHTibaFJnLENB9YUk6R4PrtAir//1JnfSLuH+1/y0SBoMBIlSD3y+nhomtQ/699zv1bmN0KfegFcMubaywKYpDzfcWt6/Jm5Brj7vep9mU+SfhwSKF4rdZesU3G9mJJE6q6LbG6KtRSlpczvoF7P9hOHewx4Yh71nb3oNZqF2DhTiX1W3yKjHnAjghC7Q71UjdaJLYkhGM+co7W1TKZwmknSyk3p+42+SclbtaE0tc1mtmxGVGExFoE2MSJJfbBfmWoXtP+kDJpRMjEuMjQvwxgcYs0p0gqLaaBD0Lyen10+L38jrpFALE1GYDLMdS2vKmhKMroc7KJ2lj9YXHdiKYWsbZz2vxTNMbhXug8HWv1hi+ywZ3N4b+hVe1PnPynwi/bXEUbGrfCvOFFcfq5SXHWyCj3ktpRGcz0KJZ79+Qy5zSyWlxTJHlcje6eIXbDh7r9NvGZrgGTEoNJzQtnP0uPj3LxyBihNTgXMzV+XaxWqEs/pRgIoXiPb+Azni8ZSAgHdkousPfOIEp4A33rY4HGOzc1aGYvAzsEEV/lbzCRG8uMIg8IMnf6j8BvwVYla7Wm3KSDlrY03I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFdtVTRvQ3NabjMxWktHVC9OREVMWmEwNzUzRkdhUVNqL2RFWlJtem5CTGV5?=
 =?utf-8?B?SGlFMHpmRGdxUTNYNlBQa1VJaXBsZE1jb211b3dJRVIwZWNXbFovYWdmTEpE?=
 =?utf-8?B?QnlWc28ybk1EQlJvTlBKakNkRmk5cmNHODJ4WFE1dWRyZk1jbmVuVVU0SnVQ?=
 =?utf-8?B?aUxqL2dFbzJlUjM5M3MvOFpvemZiZmlqV2FaNDg3NkpIWjB3QnNhUWp0c3dl?=
 =?utf-8?B?Yk9RNDZMYVFuK0ZWRkNsYXo5SGNKM25mOU1McDMrRnNGbE5JVzBLdWZYZk54?=
 =?utf-8?B?U2ZkdlRQTTlGZlV3RE1mN0s3cXhsQWFiUEVFS3plZDZ4YWlzNmVST3ptSHF3?=
 =?utf-8?B?cGowMUNmUkREdDVMOUxrWjlQcnJXbnZPNStjT0Z6bnpTd0FZRWhKdW9rcXM3?=
 =?utf-8?B?WWNTRnlNUEFlZVpiQVcyV21WK0g2VzFrTUI0QUpMS3RaK3ZLTWJFNzcxdktK?=
 =?utf-8?B?M2kxbFEzSFNZeHNBVXVOUE5HV0hVaXM1UFFrYVlvYnYxaWUzK2FkUWRnb2Zo?=
 =?utf-8?B?OFNmOWhJMEgzVHhqUXBUNTUwUzl1ZVI0cTFFWEVMZHFnRWpIam5TQ2YzTzBF?=
 =?utf-8?B?TWNISCtYUDBxdmc1RkRxbnc3aERRZ2t1QTZUL1N5N2dzak91VFpTeEJQWWpQ?=
 =?utf-8?B?TG5kWnRyRzBjd3BuU2hwdVNzQ1B3N1lVbHRNc0Fjd3pGMzFnWlcxYzhsaW0v?=
 =?utf-8?B?MGRWYnhzWmZick1CbzJkZkRYOEdsVFYvNVY4WFpEOUNpSVNKU3lYVTUyUTlO?=
 =?utf-8?B?Tm8xQlRleUNYbkJKVWtVNkcvWjY3YkVxVnhpd2xuUmUwUjR1eWh6c1h6Uldl?=
 =?utf-8?B?d3dwb01PWk8wZkdRN1NSQ3U2U2FKUC9KcXFGVyt4d0g4ZXJ2cU02NHVuTlBz?=
 =?utf-8?B?cGFONWhZd1pHVm1UNndCUEVSZEIxVkNMVW5LZzh1THJsZGtKcSs5bzByUGRB?=
 =?utf-8?B?aXd2Yll6OVJCVnpXUHF2dmRZSU9JM1ZkYzZMUFE2R2JhRy9vNzk1bExuNHpD?=
 =?utf-8?B?TlUzU3lJazJJN0JsNVNyUG9WUTVWdkZNc21XaWlPMWE5UEw4MkRpUUM3WXlQ?=
 =?utf-8?B?K0ZLVEFVc0tRWXUyYWFKZmZ1TUZJTnQrcUxvZy9ONnhUTkt1RXRmMW5hT21U?=
 =?utf-8?B?Q2k5OE83UG9lM2pyaUlyS21kZ3FwdXpJb3BFNXdWczQzQ3piNWUzT2R0bExz?=
 =?utf-8?B?VW5XejU2dFVITXc3Vk5ycDlqVU83cDBUSE0rTTN2NHlENzAvUU0za3FGTWc0?=
 =?utf-8?B?cWd6SXJ5L3o3a3FMY1JPMk9zMXQrVzVuMUxJR3NwR3hWczVRL2doSWtDV3Q2?=
 =?utf-8?B?SEUveU9ZdUJRcnpCVDFUb2FRZURBUm1GN2FoUFlYUFpBWE5OTzdxcEhhYnR3?=
 =?utf-8?B?azZjTDFpYlhBMEEyakhyeW5LYU90dUx1K1h0Y1B3V29Na2FDMklabEJVeWpu?=
 =?utf-8?B?WjZCb3VKd25FT0F1eVhPTmEyTXl4WHFUc3R0TVdER21zMjF1VDdxSE52Z3Ix?=
 =?utf-8?B?V1REbVA1YTNUSE5vYlJ4VXh5ZDFtT0hiSHMzVXZMUEhyKzRPU056amJ5R254?=
 =?utf-8?B?NW9QU1ExWGNJNGRWMUhvclVpMERiaXg1UE95ZlljRmhBeGxUbFdxSmNuM1F4?=
 =?utf-8?B?MTdjSE94b3ptZUg0YTFKd1ZVUUxmRGljNzJuQU53SVlNSFd1ZWlReUI0SmFz?=
 =?utf-8?B?ZHZybm1YRDNIdzJscDdwSHNOdEEvUDdJWU5mUTQxWFE4d0xSbTd5RkhTM084?=
 =?utf-8?B?OW9QQ3Mram9NcTdvYk5vZWhtUmNxb3J6ZXVDQjl4TUtOQ2ZuYy9qUVdiTzBX?=
 =?utf-8?B?NDBHUGtuNnhTb2k3NEdKVXhJY05tKzZ5MjZQYzY3SkxrVTVJQjR4QXdpT2Fa?=
 =?utf-8?B?RjVqNS84aDdWWEJOODNHZkxXNlA0VHFlb1hobmZOcFdaY2FSUXpqSFhsR2Zv?=
 =?utf-8?B?ZVlXWEJSL0NJcXhzbkMxK3FkUnV2amRZK0tpZG5XYlRZYXBGZ0ZTU0hGbVBn?=
 =?utf-8?B?NUgyZ3R0N1krZE4reGRLb0tlUVBYOHk5bE5BOFMxeWNURWdlU25lRmlNdjBv?=
 =?utf-8?B?Nlg5cGxrdE1QdUxTcEUvWFZDMExvNUZ2ZnpmWDlJRW94WU85bUp3eXpaZGZn?=
 =?utf-8?B?YVRyK1JRUzV2S0xPbUZTZ011VHFSWktSTldHRkRTdXRvN3FEcWtGQjBtSkkv?=
 =?utf-8?B?UVE3NGFKR29ISVhBbHB6MU9nTlUweWRGMHZQRVpCUnpKZGNlbC93eGZvRmtu?=
 =?utf-8?B?YnBwTFIrTnBoMTFZYnBzem55bkNyZ2JaWGJING1rSExKd1BjVW1PK3pHVkEv?=
 =?utf-8?B?TTMzdFZGUzR3b3NCRitvVzB6SVJTRmJ4aHVmLzd3SWdpeHpHclZkMDhrRXMy?=
 =?utf-8?Q?dcaGz6TrsCulpZow=3D?=
X-Exchange-RoutingPolicyChecked: BaByUiOgY42Q5PM4uC63EnD1ylJzQa31KNORUPo+LdrAV/Va/RreNP3klx4dD7Wj/MrapKVddt+bf+CxdoyW5n8/4BYvdaVwX1I72sSS6sF9wefU/YnQsOikIJoxvNFuWrIN5EtuuqvKR5ytT4lfz0sJ2QX6v/eAhNhRmA/kTmSXlHv2cXqtTI0gakLezKrMcVuHpqmXO0cSPa9AMZkgDrjGe1CLXtJW5be7lN4RLmKudaPQeI/P2P7vfaDndeLzifF6k5TzuUSS9f8Y7OfEMm67CQkm/ZDQnnRAPZdDL3SPmxZ0W+IQtb5FDgzEAvP/OsNPm5H6HvaVNGf42YGxDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5681ef0-6b49-4e02-4695-08df0f037eff
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 06:19:40.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JvPBkeEyPLLOPpf8Wy4kvSIOxBbUkMz8weXEQ3tRdgm3qeD9+j3CTs9KKrXSbh5oO1SwGfqG26ncAEVw1wlzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB187491
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

Hi Ravi,

On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
> Add support to verify the CRI GPU and skips test gracefully
> on non-cri platforms
>
> Cc: Purkait Soham <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Jadav Raag <raag.jadav@intel.com>
> Cc: Nilawar Badal <badal.nilawar@intel.com>
> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   tests/intel/xe_err_injection.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index cdf15f70b..5492c0b9a 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -20,6 +20,7 @@
>   
>   #include "igt.h"
>   #include "lib/igt_drm_netlink.h"
> +#include "lib/intel_chipset.h"
>   #include "lib/intel_reg.h"
>   #include "lib/intel_compute.h"
>   
> @@ -569,6 +570,14 @@ static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
>   	CLEANUP_ON_ERROR(ctx, fw_handle);
>   }
>   
> +static void igt_require_cri(int fd)

igt_require_cri() is a static local helper, so please drop the igt_ 
prefix and use a plain local name.

Thanks,
Soham
> +{
> +	uint16_t dev_id = xe_dev_id(fd);
> +
> +	igt_require_f(IS_CRESCENTISLAND(dev_id),
> +		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
> +}
> +
>   static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
>   {
>   	igt_info("Starting Error Injection test: %s\n", injection);
> @@ -600,6 +609,11 @@ int igt_main()
>   	igt_fixture() {
>   		fd = drm_open_driver(DRIVER_XE);
>   		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
> +		igt_require_cri(fd);
> +		/*
> +		 * TODO: Add firmware query for error injection support.
> +		 * Should check: EOM (End of Manufacturing) status and error injection jumper state.
> +		 */
>   		xe_mmio_access_init(fd, &mmio);
>   		igt_require(xe_mmio_is_initialized(&mmio));
>   	}
