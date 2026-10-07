Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A659CA5FFC
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 17:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA76C10E3D9;
	Wed,  7 Oct 2026 17:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgR3keK/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A5910F704
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 17:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791393233; x=1822929233;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VJAbyBzQfDfF+8cLIgbRLtrex6jH38vdU77zHca6rmc=;
 b=MgR3keK/altkQ3+cRqK6PjeN1TvRyMwm8P9mCWkCEVike3fNgL4TepSB
 vCH0OShPeubmQPY1oJmCMFOqIfq29FZ+2CupWXOVK9AkWWdB6BBc8C7iG
 VE8rj9VI8fdJ3/GHGYGxouBLqKOlLfBvSPE8j9uLY9W7YGyy8EMom7xYK
 TI5I0mSLIHrnNRodA3JACwG+Xwa5uIgB2kNtA0H+LjqJSFnVepvU6fGq0
 vicbuANm+xSlNzF9dJlGQhyy9uVfNX3jP4T4g+WqftdPWWBqZbMeSXPqa
 WfndAA7mtMTpTPNnM/mxfqaUvwaBFPtbFSK8s05GaOHcZQF05Dk++8F7v Q==;
X-CSE-ConnectionGUID: a0tFrKZ3Q5GueowcCe3yvg==
X-CSE-MsgGUID: mI5OMlkMQ0mw4GI6EGAWzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="58080"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="58080"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 10:13:53 -0700
X-CSE-ConnectionGUID: XIUdL/EDQkGQMT5KQafzJA==
X-CSE-MsgGUID: ZVYllt8yTWuIAujWJyQUuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="229876"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 10:13:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 10:13:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 10:13:52 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 10:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khdA8kW/0gL8pt1deGqw05ySY9uJYhQPVzNjn6+QsWWzzzLi6Asx/aTXKzgmwtu/n201OHOKypoKLBK49d6azO1nGkimUjwOPPiun+aQ1MVLBPspyoA4yrb2f2qHa4C0YV4nMbya0VZa6CQR0P9GxtoURM1msNCBjIEI0cQRGt7o8+On8WnhvW1zh7MuD1QSjeiu8l1jYvDih4YfJ19JwV7Y6slLzb3e0eBiZ8aeqA7Un/lGUIcUUwdJlyBtMT7Ypt3aigpW1kUbg/2rcXkorTOL3uqhmHqQJPpnmouGj8pe+Q8gehnFBkw0xD3y3GSL7657VvVqpOi2Va6nR50Ugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Skwq/r1oE71dV6/xNngByehBH6TnZNN+tyqHtohRQ4=;
 b=xOMdUc9jKBnGinmpS9E8LarUiFOS7B80NM75xJQ8xUs6krxtm5wWDdxALJbsN+VoTieA/pWGVLtrRWcmfIH31olqb3P1SKX+t/tGjPdTesysKRwpbZY7QgGU6E5mzoCdK4VI1avqstfi0qNWqmyECqazujUro7UwjVdGfIU/1hgkr/DZhXvR2l7chbxWsAuSxD5tUUvnyeFd9qjPAf0821Mqlci51xwZOWeoFdtvi0WS93Coavkguzuc55smwoJGiHHxyDz0uMIk43jXwXO02UR0MrxtjL2NG7rBAf5u1rxG+2oUp2oA5fmsRnCGp411DKVHJSV4jcgu4p2PkMtNNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SA1PR11MB7039.namprd11.prod.outlook.com (2603:10b6:806:2b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Wed, 7 Oct
 2026 17:13:28 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%3]) with mapi id 15.21.0451.026; Wed, 7 Oct 2026
 17:13:27 +0000
Message-ID: <bd8f1d53-44f3-45b8-ab21-b5b7f79dbfb5@intel.com>
Date: Wed, 7 Oct 2026 10:13:25 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBsaWIvaW50ZWxf?=
 =?UTF-8?Q?device=5Finfo=3A_get_the_xe_=2Egraphics=5Frel_from_GMD=5FID?=
To: <igt-dev@lists.freedesktop.org>
References: <20260928172713.1341060-1-x.wang@intel.com>
 <179065315887.216889.2589082717932645110@61270ab9df2a>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <179065315887.216889.2589082717932645110@61270ab9df2a>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::18) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SA1PR11MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce744cd-5f47-46b7-7d4a-08df24964d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|13003099007|3023799007|10067099003|4143699003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: dmzlYNf4phR52O72lE2s/+fYMIEPqYw8H5kyedVrcfRO+sZS5xdbFeF76R2vz8txcavqUMivzbGHKE2r+/hBm5kqdSydo1Wx/iOTbpOA1SdoUMhHVacjCAQGjLNtEkLTLoBr++nzAcgP1k0HMpaje5wBJpoZ0zJ61CVAti1i09fo2/gGs8YfQxDosIkBxzBadHgjVTym6/rOdOsxCkmr6PkvJFU0bNEFAPMMeYZuIF1ifGUsxf8HDnvW1rkdljtzQIy8ADM5K8yXQSEJypYZZG5bPmUFVq/wRdtDsJcrYqtfSwZm5v5OS1pIAOcs2JPvHhKUsOjf4wksd/N2RD/glpg03dqQOsBhKlgvq+Fe0BKoKj1WVvH5HaRbZP41KyeMSM03GkUwav+dSSfA7EUyny2mOglhTJ0BfX0R2hcXso04N828+iC9dleBwotuXbdeTCerWrP9DTFWL6uHMRPHYJiyv4NhltN082cbMLoFVScb6AlYHLTBNXdIZpXOaxKtc3gS2wTaXI9s8hz01EQ4nfyaK2oUgaCj6iDQCpGO+PjFSFvT9Bi+Rz4zSoiT00dY42ThKaz6/0s4ahhwMdHmyH3lMOTLz7OtL7cUrciNkB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(13003099007)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFFsYTVUbUxHSGw0UWFCVmswL2ZoVU1udEpiWVJoaVFFTVBxZlppM29QTGNC?=
 =?utf-8?B?YjRMek5uaEx1bGVubVJIUWl5RzM2a081cGVBNkpGencyd0VNNmJpbWdHek80?=
 =?utf-8?B?MUp6NU1KOTdNWGhiZGRWZ0dxUDJPM1QrL1lQR1luSWxhczJIS1RYS0ltcHJ3?=
 =?utf-8?B?eTFmcGExQlNiSE5UUDhSVFg0eXU5K1NrNktod21EaCtEUVE0NENKaElRbzdJ?=
 =?utf-8?B?L0syQWFSaURPbm4wWFVtVVpPMjYrRFZSMXgycnFOOTRWMWRURkJ1L1pHSXZt?=
 =?utf-8?B?cE1jV2U5S3ZhcmNDdmhtcndXU2R5aTUyYmZYVkxRc2VEVTZRTnEyZ2pDWERv?=
 =?utf-8?B?WVRYbWFlRFBTOGwwUUFVZ2MwWjRQdlhsT1d1WkFkQWRML3FvQS84ajRSVmlK?=
 =?utf-8?B?ek1BVmVJYk51ZFp3SzJCWnFqWUFGbFlERHZlSllZdnJZTStLc3RtcEVjTHd0?=
 =?utf-8?B?QVkyTW5qWWwyOUxESENGYmdRL0Z2aWkyZ0FnaDgvLy9TSzRRSDhKdXo1Ylp3?=
 =?utf-8?B?bC8wdVB4cHpVSWRJMnpRaG9uenRlOVJ0VVRDbE1VWitIa2J5NXpzMmwwY21K?=
 =?utf-8?B?Wm1rdm8zRERpcTQxZWw1c3JheXd6RS9HVE15V1Y5UWdmeUZJRTJRMDdKTEFB?=
 =?utf-8?B?OHp6LzdaOEtDVmIrNWkxWWNva1hKYjJpbWFQV3RyT1NIMUs1bUdyeTMwUnlH?=
 =?utf-8?B?Q3I3RVRZTGw2QnIvQ3hpV0Y0YVV4SCtERGxxNHVwZDl0VHhmNFdmSDdGUkxR?=
 =?utf-8?B?WUM5cE41ak91dWtScnNBaE1FOWNyVFh5ZWk2VytKVXdGK1ErcW1sN3RIdVJ6?=
 =?utf-8?B?Z1U5bmlhUEJROGY3ajNsSFIyTGQyL2FuNzBuUkRIUVpzdXZmZmhtZEdQNUtU?=
 =?utf-8?B?SW1taVd5TEFqV2dhWWhwNWhQL244azgxdjdsQkhKTkRKNWpBd0YvQ2lMUm5Z?=
 =?utf-8?B?ajI5WWpvRjJRR29GYW4razRwbHphNTBucm9IeWxaWlJ5c0hWQXoybEp0ejBC?=
 =?utf-8?B?a1Z5cFdmalVxKzkva3gyN3RQc3ZER0FxZjNmOG5ZellpMlhjd25vK2FjSXJ1?=
 =?utf-8?B?NVYveEZ2eXdKcVgzOVVZbEMzRkdnRmxIbkZWZGFwSGQrMXpzVk9yVndqMFoz?=
 =?utf-8?B?NnpxMFlPT0ZGQ0huMWgzSlNmUFkvVnV5TTE4c1NOWWJGbURXeWNEbkNKVmhD?=
 =?utf-8?B?WnVmZlhXMHVFNmlRSHIraUxhaFR3TEZ0NTRzVXY3WU53OFo4aWJ1TngwaVNV?=
 =?utf-8?B?QVozYlZyWTl2eEtxY2RUNE5uck51cFpZWWhEWk5KQVdIN09GOHVOYjBTZXRK?=
 =?utf-8?B?NW9aVVpsM3YxdUNYcmpwanZzaTAyS0hGTVlsS0g3ZWIyRFQzWFI0SkRhNktP?=
 =?utf-8?B?V0Q4OUZMaU5CZm9ITS80MGM1dDIzekYvZXJWcFBnNHpRcVNrR1IxdEkxVTlR?=
 =?utf-8?B?aDc2V213VEN2eGtFT0wyVGJOQ1hOOGw2a2kwQm1sQkxhejFIaUpsRmNGYkV6?=
 =?utf-8?B?dGdJVkJYV2syVi85b0hXakc2SFJxcHpTQnlIK1VtbEVyMEdFS2NZS2xyUFhC?=
 =?utf-8?B?OHFCR1Z6ak0rVHhPYytBT1RnbUEwcTRxMmVyQnMvK3grK2xjejRERWt6M1E1?=
 =?utf-8?B?QWtuUWQ2ZTVOV2o1VlF2R0ZjK1RNemJYVkJGa2x4NkJUelE5by8vdVYyT215?=
 =?utf-8?B?bCtHbjlWdWxhY25FN2NtNUd3QmtHSjJOWXFIaXRhTk5sU0RnUU5kbEhqOTJT?=
 =?utf-8?B?cUl4aUp0UFJ2ZGVxQTkrMDBJK1c3bnNBa3RQcDN2eGtQME50V2EyL1poMjFy?=
 =?utf-8?B?Q2lkN3c3MnRzRm1FVllqa1R4dGs1SWxnTk9GUzZWTVdtR0FhcnprckMzYVZk?=
 =?utf-8?B?UGY1UXJxVDQ4VWlTR3NCdVIxczhWUy85K1ZMc25VTnpVaXVsVlRNcFZVajVk?=
 =?utf-8?B?QS9EODMrVnZQc1FiTUZhY25LUm9GVGVUQmdFN3NEYkJ0bDFTZUt5RXFieHVW?=
 =?utf-8?B?K0tKRDVScUJ2dENSaDdJZWdTVXd2aE95QzhlWStiMVZuRFV1WkVtNlVZV3Fa?=
 =?utf-8?B?VndwNWtxWU9MNnEvb1ZxYVdvMFJUTUsrLzRLMHFTQ1Rpam1Cc2lFTWoxOVNQ?=
 =?utf-8?B?RGg5YitxclgvNm5zWk5MNU5zNG5FU1Rtc1VIU1RIcW5RNlBNVVFXZGQyV3NX?=
 =?utf-8?B?R1JIL3JidTZuUjlUQlJiSkRGOXdkUFR5WmNzV2pBd1FpeVFqWmN5c1VrQ25y?=
 =?utf-8?B?dXkvYVFBei9JV2tnV0RMeWtsYnI3V1FPa1Q4WDhKUVdiSDU1QUhMSnh1UzdU?=
 =?utf-8?Q?0Fa+KXbO0G1LT2LK+X?=
X-Exchange-RoutingPolicyChecked: xTdwRJSRonhxNY0sL8En21aHFJevAaQnOnWlciAOh89Xcd+UEZ60DQSWzqk6gtWCVaf/qLh+KsoxBPAMbjJuSd7IyMY231e8VH8ivXdw4w2TUZJc6gPeJVZkzlF2Va/bbtuvDxz9U//R7OXMPZGJkoiD+vJH0/CctjWKQ4O1V1tjvNUZIAZ06Gzv7JwJccVKefktSFr9m9RmvYQhOS8CIrW+Zf9jYtyrbyEM83AofSAhj/W2Zc41xNSGeNF7H4bqLKQuW/F4UbfOHgBc0tXoOGz+UfIMwvAF7XRcMsxJ2Nlc1FKMj3wfr0ARrbyqBk7VrKa7BGnBTMGYvrKrBukXBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce744cd-5f47-46b7-7d4a-08df24964d74
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 17:13:27.5900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGOfT0WM1x7GibjSIzr9WFNR6W+VCxHPlVz9bnlGzv2TOrCw1fXTC1XUhZ1D+eu3WX/k2MAKlg2l/Z7YCdXiSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7039
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



On 9/28/2026 20:39, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/intel_device_info: get the xe .graphics_rel from GMD_ID
> *URL:* 	https://patchwork.freedesktop.org/series/175134/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/index.html
>
>
>   CI Bug Log - changes from XEIGT_9114_FULL -> XEIGTPW_15911_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_15911_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15911_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (3 -> 3)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15911_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>
The failure is not related to my patches.

Thanks
Xin
>
>  *
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_15911_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#7225
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225>)
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-ptl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-1/igt@kms_async_flips@alternate-sync-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#6078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078>) +1
>         other test fail
>  *
>
>     igt@kms_async_flips@async-flip-hang:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-2/igt@kms_async_flips@async-flip-hang.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-6/igt@kms_async_flips@async-flip-hang.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html>
>         (Intel XE#9399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399> /
>         Intel XE#9409
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9409>) +1
>         other test abort
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:
>
>       o shard-ptl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-edp-1-4:
>
>       o shard-ptl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-edp-1-4.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-edp-1-4.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#2370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370>)
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-270:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         (Intel XE#5901
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-90.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (Intel XE#5808
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808>)
>         +11 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-addfb:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@kms_big_fb@x-tiled-addfb.html>
>         (Intel XE#5850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-2/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#5851
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851>)
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#2328
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328> /
>         Intel XE#7367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610> /
>         Intel XE#7387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-3/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +8
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#5822
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822>)
>         +14 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html>
>         (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669> /
>         Intel XE#7389
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-edp-1:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-edp-1.html>
>         (Intel XE#5823
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823> /
>         Intel XE#6918
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
>
>       o shard-ptl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html>
>         (Intel XE#9364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9364>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1
>         other test skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-8/igt@kms_cdclk@mode-transition.html>
>         (Intel XE#9205
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205>) +4
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724> /
>         Intel XE#7449
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449>)
>  *
>
>     igt@kms_chamelium_color@ctm-max:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@kms_chamelium_color@ctm-max.html>
>         (Intel XE#5824
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-3/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html>
>         (Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html>
>         (Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>) +2
>         other tests skip
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-3/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html>
>         (Intel XE#8391
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +6
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-fast:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +6
>         other tests skip
>  *
>
>     igt@kms_chamelium_sharpness_filter@filter-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-3/igt@kms_chamelium_sharpness_filter@filter-basic.html>
>         (Intel XE#6507
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507> /
>         Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_chamelium_sharpness_filter@filter-basic.html>
>         (Intel XE#6507
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>  *
>
>     igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3.html>
>         (Intel XE#6969
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969>) +7
>         other tests skip
>  *
>
>     igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-8/igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3.html>
>         (Intel XE#6969
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969>)
>         +15 other tests skip
>  *
>
>     igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-10/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020@pipe-a-plane-3.html>
>         (Intel XE#9333
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333>)
>         +14 other tests fail
>  *
>
>     igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-4:
>
>       o shard-ptl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-c-plane-4.html>
>         (Intel XE#9333
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333>)
>         +41 other tests fail
>  *
>
>     igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-3:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-a-plane-3.html>
>         (Intel XE#9333
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333>)
>         +15 other tests fail
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-7/igt@kms_content_protection@atomic.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> /
>         Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304> /
>         Intel XE#7374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374>) +3
>         other tests fail
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-6/igt@kms_content_protection@atomic.html>
>         (Intel XE#7642
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-3/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307> /
>         Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390> /
>         Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-2/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#5832
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832> /
>         Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321> /
>         Intel XE#7355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-64x21:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-5/igt@kms_cursor_crc@cursor-random-64x21.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html>
>         (Intel XE#5900
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         (Intel XE#5962
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309> /
>         Intel XE#7343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (Intel XE#5962
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962> /
>         Intel XE#7343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343>) +1
>         other test skip
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html>
>         (Intel XE#4210
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210> /
>         Intel XE#7467
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467>)
>  *
>
>     igt@kms_dp_link_training@uhbr-sst:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_dp_link_training@uhbr-sst.html>
>         (Intel XE#5870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html>
>         (Intel XE#8265
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265>) +2
>         other tests skip
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html>
>         (Intel XE#5907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907>) +2
>         other tests skip
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html>
>         (Intel XE#8265
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265>)
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (Intel XE#4156
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156> /
>         Intel XE#7425
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425>)
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-6/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138> /
>         Intel XE#7344
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344>)
>  *
>
>     igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>         +10 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-8/igt@kms_flip@2x-flip-vs-expired-vblank.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +2
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-ptl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-6/igt@kms_flip@flip-vs-suspend.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) +1
>         other test abort
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7349
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html>
>         (Intel XE#7179
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7349
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>)
>  *
>
>     igt@kms_force_connector_basic@force-connector-state:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-2/igt@kms_force_connector_basic@force-connector-state.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#5800
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800> /
>         Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>)
>         +15 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656> /
>         Intel XE#7905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#5812
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812>)
>         +67 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html>
>         (Intel XE#7905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +38 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#7865
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865>)
>         +17 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>)
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +1
>         other test skip
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#7865
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +38 other tests skip
>  *
>
>     igt@kms_hdmi_audio_bw@audio-bw-hblank160:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-1/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html>
>         (Intel XE#9312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312>)
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362> /
>         Intel XE#9438
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9438>) +1
>         other test abort
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#6911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911> /
>         Intel XE#7378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378>)
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#6900
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#7591
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +2
>         other tests skip
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +2
>         other tests skip
>  *
>
>     igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-4/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html>
>         (Intel XE#8303
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303>) +1
>         other test skip
>  *
>
>     igt@kms_plane_multiple@tiling-x:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-8/igt@kms_plane_multiple@tiling-x.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html>
>         (Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>)
>         +14 other tests skip
>  *
>
>     igt@kms_pm_backlight@bad-brightness:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html>
>         (Intel XE#7376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376> /
>         Intel XE#7760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc5-psr-suspend-resume:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-3/igt@kms_pm_dc@dc5-psr-suspend-resume.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-7/igt@kms_pm_dc@dc5-psr-suspend-resume.html>
>         (Intel XE#8399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html>
>         (Intel XE#2499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499>)
>  *
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         (Intel XE#5849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-2/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#7383
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html>
>         (Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html>
>         (Intel XE#5858
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html>
>         (Intel XE#5858
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387> /
>         Intel XE#7429
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429>) +1
>         other test skip
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-3/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#7413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413>)
>  *
>
>     igt@kms_psr@fbc-psr2-primary-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-7/igt@kms_psr@fbc-psr2-primary-blt.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +6
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-8/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#5835
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835>) +3
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#7345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345>)
>  *
>
>     igt@kms_psr@fbc-psr2-primary-render@edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-render@edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4609
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609> /
>         Intel XE#7345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345>)
>  *
>
>     igt@kms_psr@pr-primary-page-flip:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_psr@pr-primary-page-flip.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>         (Intel XE#5821
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330> /
>         Intel XE#5813
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-2/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#5857
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-ptl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-5/igt@kms_vblank@ts-continuation-suspend.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-6/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#9375
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375>) +1
>         other test abort
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@kms_vrr@negative-basic.html>
>         (Intel XE#5949
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949> /
>         Intel XE#9277
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-1/igt@kms_vrr@negative-basic.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499> /
>         Intel XE#9271
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271>)
>  *
>
>     igt@xe_ccs@suspend-resume:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-4/igt@xe_ccs@suspend-resume.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-4/igt@xe_ccs@suspend-resume.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) +1
>         other test abort
>  *
>
>     igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-2/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362> /
>         Intel XE#9425
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9425>) +1
>         other test abort
>  *
>
>     igt@xe_compute@ccs-mode-compute-kernel:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#6599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599>)
>  *
>
>     igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html>
>         (Intel XE#5764
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764>) +7
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-2/igt@xe_evict@evict-beng-large-multi-vm-cm.html>
>         (Intel XE#6540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2
>         other tests skip
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321> /
>         Intel XE#8355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355>)
>  *
>
>     igt@xe_evict@evict-small-multi-queue-priority-cm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority-cm.html>
>         (Intel XE#8370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370>) +1
>         other test skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html>
>         (Intel XE#6144
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144>) +1
>         other test skip
>  *
>
>     igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-6/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html>
>         (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>)
>         +13 other tests skip
>  *
>
>     igt@xe_exec_balancer@twice-virtual-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-1/igt@xe_exec_balancer@twice-virtual-basic.html>
>         (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html>
>         (Intel XE#5575
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575> /
>         Intel XE#7484
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484>) +7
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html>
>         (Intel XE#8374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374>)
>         +12 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-4/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html>
>         (Intel XE#8374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374>)
>  *
>
>     igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-3/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html>
>         (Intel XE#8374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374>)
>         +16 other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-7/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html>
>         (Intel XE#9003
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003>)
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-2/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html>
>         (Intel XE#9003
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003>)
>  *
>
>     igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html>
>         (Intel XE#8364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364>)
>         +17 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@max-queues-preempt-mode-priority:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-priority.html>
>         (Intel XE#8364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364>)
>         +25 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@one-queue-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-3/igt@xe_exec_multi_queue@one-queue-basic.html>
>         (Intel XE#8364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364>) +7
>         other tests skip
>  *
>
>     igt@xe_exec_reset@cm-multi-queue-close-execqueues:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html>
>         (Intel XE#8369
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369>)
>  *
>
>     igt@xe_exec_reset@cm-multi-queue-gt-reset:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@xe_exec_reset@cm-multi-queue-gt-reset.html>
>         (Intel XE#8369
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_reset@multi-queue-cat-error:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error.html>
>         (Intel XE#8369
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369>) +1
>         other test skip
>  *
>
>     igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html>
>         (Intel XE#9096
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html>
>         (Intel XE#8378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +5
>         other tests skip
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html>
>         (Intel XE#8378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-fd-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-fd-basic.html>
>         (Intel XE#8378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +1
>         other test skip
>  *
>
>     igt@xe_live_ktest@xe_eudebug:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html>
>         (Intel XE#2833
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
>  *
>
>     igt@xe_madvise@atomic-global:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@xe_madvise@atomic-global.html>
>         (Intel XE#7980
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980>)
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-5/igt@xe_mmap@small-bar.html>
>         (Intel XE#586
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/586> /
>         Intel XE#7323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323> /
>         Intel XE#7384
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-8/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +1
>         other test skip
>  *
>
>     igt@xe_multigpu_svm@mgpu-pagefault-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-10/igt@xe_multigpu_svm@mgpu-pagefault-basic.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +1
>         other test skip
>  *
>
>     igt@xe_page_reclaim@random:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-8/igt@xe_page_reclaim@random.html>
>         (Intel XE#7793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793>)
>  *
>
>     igt@xe_pat@l2-flush-opt-svm-pat-restrict:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html>
>         (Intel XE#7590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-3/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html>
>         (Intel XE#7590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#5771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771> /
>         Intel XE#7590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590>)
>  *
>
>     igt@xe_pm@d3cold-i2c:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-8/igt@xe_pm@d3cold-i2c.html>
>         (Intel XE#5741
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s3-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-3/igt@xe_pm@s3-basic.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584> /
>         Intel XE#7369
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369>)
>  *
>
>     igt@xe_pm@s3-mocs:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-6/igt@xe_pm@s3-mocs.html>
>         (Intel XE#6867
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867>) +1
>         other test skip
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#5611
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611> /
>         Intel XE#7456
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456>)
>  *
>
>     igt@xe_pm_residency@aspm_link_residency:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@xe_pm_residency@aspm_link_residency.html>
>         (Intel XE#7271
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271>)
>  *
>
>     igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733> /
>         Intel XE#7417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417>) +1
>         other test skip
>  *
>
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
>
>       o shard-ptl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-8/igt@xe_pxp@pxp-termination-key-update-post-suspend.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) +2
>         other tests abort
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#6019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019>) +1
>         other test skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-9/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-hwconfig:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-7/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_vram@vf-access-after-resize-up:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-3/igt@xe_sriov_vram@vf-access-after-resize-up.html>
>         (Intel XE#6376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376> /
>         Intel XE#7422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422>)
>  *
>
>     igt@xe_sriov_vram@vf-access-beyond:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-7/igt@xe_sriov_vram@vf-access-beyond.html>
>         (Intel XE#6376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376> /
>         Intel XE#7330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330> /
>         Intel XE#7422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422>)
>  *
>
>     igt@xe_survivability@i2c-functionality:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@xe_survivability@i2c-functionality.html>
>         (Intel XE#8415
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415> /
>         Intel XE#8432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432>)
>  *
>
>     igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
>
>       o shard-ptl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-6/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html>
>         (Intel XE#7892
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892>)
>
>
>         Possible fixes
>
>  *
>
>     igt@core_hotunplug@hotunbind-rebind-with-load:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind-with-load.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind-with-load.html>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#3718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718> /
>         Intel XE#6078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
>
>       o shard-ptl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:
>
>       o shard-ptl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html>
>         (Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149> /
>         Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdmi_audio_bw@audio-bw-hblank160:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-5/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html>
>         (Intel XE#9313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html>
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-ptl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-3/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#7308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-6/igt@kms_hdmi_inject@inject-audio.html>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#7308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html>
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:
>
>       o shard-ptl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html>
>         (Intel XE#9340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9340>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_dc@dc5-dpms-suspend-resume:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-7/igt@kms_pm_dc@dc5-dpms-suspend-resume.html>
>         (Intel XE#9390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9390>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html>
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#8399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2029
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029> /
>         Intel XE#7395
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html>
>  *
>
>     igt@kms_vrr@flip-dpms@pipe-a-edp-1:
>
>       o shard-ptl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-1/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html>
>         (Intel XE#4227
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227> /
>         Intel XE#7397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html>
>         +3 other tests pass
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>
>       o shard-ptl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html>
>         (Intel XE#9096
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-5/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html>
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-lnl-8/igt@xe_pm@s4-mocs.html>
>         (Intel XE#7727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-lnl-6/igt@xe_pm@s4-mocs.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
>       o shard-ptl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (Intel XE#9364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9364>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729> /
>         Intel XE#7424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9114/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509> /
>         Intel XE#7437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15911/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>)
>
>
>     Build changes
>
>   * IGT: IGT_9114 -> IGTPW_15911
>
> IGTPW_15911: f843bf9701ae8afab65230b4d34984506cd4e60c @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a: 
> 972eeb850a4ca07aba05ccb805db28a33eab2c9a
>

