Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839E2CD4F39
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 05:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3862110E35B;
	Thu, 14 May 2026 05:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSM0yQ2b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C25510E35B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 05:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778735921; x=1810271921;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8Lq5yzLnBkRB8N6SdbZT4O+mmC2HH/Prbp6VZKGCWcY=;
 b=LSM0yQ2bNzu7hIY8KtN37kDYUtDUeTsVHKHb22zX6M6EsbQXyzt8JOpA
 UeIZiaaTzSH5XNxzQ9DeCBu2GCcFPzPlrtSiyHZRRyO/YEZiycjRbv9nF
 s7yB4VLAEN3c/HUSHagqapkyYTfCM6OzygrMWCn9rH2xcBdoQUGpeXxj+
 PpiOwdGRXKYhMY7fTekufQWLsMhomVn9O/u25/fthb7ZPRoRtZHRn63rV
 p6TkPETlyUei+TLsdx9TGUItZAaxY1aLT8VHjOCcMZWv7ykedRzMLhnZq
 pHjYDVjUXkFuvTZlAXh6JrDY9s7PbBMeQZ0wOXFobcgsy8Tlhwyjn698k w==;
X-CSE-ConnectionGUID: Lfbqvpq3QDqJ93QMV/fAzQ==
X-CSE-MsgGUID: OQMpwMq+TUy46tGLTMqOmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102342454"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="102342454"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 22:18:41 -0700
X-CSE-ConnectionGUID: DOTrdAdiRc65pKGd3FGGXg==
X-CSE-MsgGUID: GwVyknGVRd6bFwSV5XMDqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237427348"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 22:18:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 22:18:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 22:18:40 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 22:18:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9Tnn0roPrhRdmKhPVuIyArkRn+qfei8xJdbzJCxf5EPBN/ZqNTTAGVIONpdRrTVCh0ddLIRFDRlWSMl9m3GKjNSGGarb4qDJw/ZLVp/WQJYF262mAxW+E65BOCodiQzzy3+rh357XSk2DJXcbwaIdDyP0VGq6QVvW/Ux6GMKb7weEVvHLc1nw5Z3/iGoNUe/cCRN5zz6MLfQq3JIX1sbxOmyALSJlpiLbp0g9sdcMw2AAk8OVp+lJ2yXpyFQ5LNgB9Oc9vS03hpcS26dBhPyN5FWkOsgct7TmxXajV04xI2OQpUfzZv5JChzacIO5JYV8LrcDJRmuCeV4EEB1ErzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmGo0S/DCrOL2/EKCpeknUMpveceBNN3psEoYDmosps=;
 b=jBctfwFqhgSBoeCtdoy3VsUZxXw1dlsUijBw8aBB0WK5QZKzZDdtlX2QvcvwYUd3rXgRA24j/itTlRnFwv2xIQMiFxY6J1BfVwWTMRm5iM/hH0+g0+FvUQHEnLO5KYo20QXeayHfs6QpM4T2Awh12PJMrg2/FQDlPrxoKOKACaLE5RDumS2pkA7er2g/iDvXU/IRdU3QKxfwIwieFrqYJ4sUrRllrQYZl7kEsMSq98s78l5Kc2V0RWgjCtf6scZEx04Zc0he1jIsvdliHrEFhw5Qm9o1dGWey8fxyY1Va997EbkXJDf9/T+MVNYwr29mH6P5/Uw10yrTXGqmcz87nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 05:18:33 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 05:18:32 +0000
Message-ID: <ae674a8d-8012-4ac7-9d25-fa0eb5644cd8@intel.com>
Date: Thu, 14 May 2026 10:48:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 21/25] tests/kms_async_flips: Remove the
 IN_FORMAT_ASYNC check
To: <igt-dev@lists.freedesktop.org>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-22-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260512122143.11013-22-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0236.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::10) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: c8cb9088-dea4-459a-7198-08deb1783dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11063799003|56012099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lLp+zqYRq9/fmXs2CSZDHxVEmeRM359/0vcjkJ19E4MSHfGz2mg/jAqTrzLevfB0qTUjhGxy4WEp4ro7AkFau+FZymFHcCN0nVyrY0PBjP+tpt7mdgiE8FcL2/gsxY50Yo33bpC4WyBwZ2Eokwe/cw/LBT5AbgZucRO5ok9NsDkIhgMiwiq7XKVSGdg0ujhdIwPzqmutnSq7E9FEmkaID/f32gHgE/H7cJiEwpmrFYtbbGTOgz0s7pQqBtIKHvVjEfdZIM2mJa4HFLVBQYYYf0SrZDJ4Zb0uiv2VL+jFKrFRgZJjwcVdD14xXEdH7Af927JXuqk4M8kOOOjJiEaL1qPFw3zlHWS1oONfXp6QMiDDf7/aW+hQgOCTv+sIOESLU5FVHpTrKiOH9zY2TBWFZx5teiK3b8r5Jm/hmmdqyeA1DK9t85Je5y0pIYNNhLwK/IXj7UnIrFXTxSCTnuLCFG2wDYM/bfafwRaTyyjHVDqQz7cOP7XyPGihZvIbKOtuTiNRIfm+RlnYilTj42fVOjV6DIFinUsMBqje1DgYqFOkCiwmqk9+jkQUg3Wvl8QcuOzsr+SlHsmIfASZpydKipXenvja15Rw/0Jre3quorGCDP3f2Wtl9FiX6PMvupH1hNJnFh5px+OXmH0F9e+BWppqPcSa9UumBw8BR47m4WiSf5xieFr6HHJkQgTy/EXI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(56012099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnJqQWhNbmlFSXlzcXZjZ1VHcGs2SG1NTW5YaWw0QkcvYVQrL0R2eGtzekc3?=
 =?utf-8?B?eE11YUhDU3R5aG1KbjQreDdKZGY1WHFKTXN5UWw1WjEvZzlrYjJrTjJaZDht?=
 =?utf-8?B?N1hsM1FmdTczU1FzaHlOTVpsRm5YM2JuOUZIVjlhMnl2SmhZMkF6RHdqSDNJ?=
 =?utf-8?B?cGpDMTltTkpPSkI0cVJTZ3lhbFJpbUhvMUFuaGtjR05mTXc3TEovcFdPMTBq?=
 =?utf-8?B?RWxrMTI4UCtubElFdzVKR21tb1lZdEMyaXZmSG5oN1JndnJkek9FbmZWNU5x?=
 =?utf-8?B?cnkzbGVVaFBFVWtwUnZkVDdGQ0k3KzBqRnJJR2tpaVVXUEIwMVFXM0lVVkhh?=
 =?utf-8?B?N1crcGJ2UWxQREFqaGNLZVBFSTZVWEVDRjh4MzRFb1JFclI5aXdpdHV2OGlR?=
 =?utf-8?B?VUZBK0tNK3JVaDhtUU43T2l2aVROMVFUckIrTlRiZEVEV01tYk9WQU9uQy91?=
 =?utf-8?B?WHM0MzlHTk5EMjNsNHdPdzBnMUVoRDU1bTRlOERHYkJTUmpCa3VHZWJJQnc5?=
 =?utf-8?B?bFB6dkJobHRHbUwvMHFzNlYxSzVLYTdSb2l3TDVNK1YrT2lxKzlTcEJDZ3FB?=
 =?utf-8?B?ajAyalhoQTB1UkhuS1dCUjN6WlRxWmk2eEw2MjJ4Mk1PQjZ1M3o3VWhKc21a?=
 =?utf-8?B?TXRBZndiR0hEZE1hUC90NTk4NDlLbDVEWDRxRzFBUFZyNUlydGN2ZVZoenpL?=
 =?utf-8?B?QWRSWWdiejJDb1QwSDg1TWZucGp1VXNQOGtvajhmdDhFclRvR1Z1T0cxRFNw?=
 =?utf-8?B?a2ozWG92YXNIclhtK1dRMWJEMHhaMGRVRkYwNFVJZndRY01UaWFLRFM4eXZ2?=
 =?utf-8?B?SFU3cjlUN04vZjJMWDhmZjk3Q0xJeUhhQ0JCL2JVRTdLMkFnVXhRMGh3cnBx?=
 =?utf-8?B?UG1NTEJ6YUtiRWhjT056QVNOVDVYajF1UDdMbzJvQjZNQjRzcE5XOHlXQUE4?=
 =?utf-8?B?bnZVbkp2WnN1TWNWNlhZcExZbFo5RytQcXl4aFRSbU96UVJsNWFyNFlta3FW?=
 =?utf-8?B?MFZHaTZUWWxGQWY1MHZ5Rld1UXBsRXNyRkVXTEZjS2JVZ3hONXZUTnRjZ0FI?=
 =?utf-8?B?ai9TLzkxRUFYczhkM1k4aGo4aHNBMXpia05mbUNLbHB1QThtYk1QeXNPNTBr?=
 =?utf-8?B?b2pMelVPL053SEFSRmplS2RXMnBVRUdYQ0xNSmJVdDFNQkNzRUF6WWYydnVp?=
 =?utf-8?B?RUl0bDYwckZjL2hySWlCcWEvSlFHWHo3MnZWQm95a0U0bTFxaTgyUUJHMG9D?=
 =?utf-8?B?T3FGTW5raDlNYnFWTUl4dDlwbUM2T2NmdHI4bEZRYVl2SDBqVTc1cU5rbWVv?=
 =?utf-8?B?MmlkRjBzZmgybWNuYXRUbnVncEpMRHNDcjdtRnRvUWZLTGRZOW85VW9VcXQ5?=
 =?utf-8?B?Y0Q4QzZPWll4d1dzdlZkSFI1cEFHMHJHcDhPanlLTm9EZzZyZ2VISFBnNWFv?=
 =?utf-8?B?clNrd0E4ZXZMZTBPUGtrRGpLQmtBMkUvRU5qbCtrbkJsK2JlUythOUxJWnhR?=
 =?utf-8?B?V2FIV3ppZWhyclJGTGJrbDJqVERwWXNzT1kzbXRUOUVKbWl6cW83RUJqU3Za?=
 =?utf-8?B?VkpRdUNmdUFyRVpuZVdvOGp6Q09LTGEzbytwbGRhWEdjUC9CS0ZQYy9Xa2h5?=
 =?utf-8?B?MUpWVnAwYWpoQ0Fnc2lRbjVGb2NsMXl0dmtFR1RxK2o0ektVcjBPWmVNTEph?=
 =?utf-8?B?dTdyS1J5ekNqdzAySWE3M2ZZVG5lbE5aRU9nSE1HR3lMZ2tVMXBuVlBkNmlW?=
 =?utf-8?B?N1o1Ynd3a3RPWDZUTGZXRzZ3NWVyYW9NbnBkRThOb0RndDI3WjA5Y1g1R1Fo?=
 =?utf-8?B?S2owREF1Q3hnRG55TEc1ajcyNXk0WWpQSVZWZVR0N3g4QnZWSmRrRVQrM1VZ?=
 =?utf-8?B?N2pZWVZoYXl4dUoySXJEdVBqNk9JU3JHQnp4RTJOK2xjekcrSzBEL1BpRktN?=
 =?utf-8?B?L1ZDOVNZdCtRaHA4NHE1Tm00RWFyZkxCWXErU2VhaGdvRzJhNndPMCt2MVMx?=
 =?utf-8?B?YytnWTFBOE1FZ2tTdU41bVgyZFVoWDZhTzVsNHNXaUE4YkJRaERjWjlFeUo3?=
 =?utf-8?B?UmZHd3NBUmo5R0JLTGVncWJtZmQrKzJCT1ovRi84SjdpbzJOUmNXdWpYTkFm?=
 =?utf-8?B?T1RtbEE5cWxTczI2MWNzMTVjZzQ1MDY0SXhVSjJaVW5KZmV4RTZvQjVRaHJ3?=
 =?utf-8?B?aDNSNTdFZEVEQWdFRVVZZDZWMzJVcHBCTjFMT1J2RnYyMDBvYThRL1ZwWTlV?=
 =?utf-8?B?eG82c1RDN0xldTdFKzBSUDhRMnQ2V2NnTmZMTmZSd0ZOOWVHcFVkL1lCTmVY?=
 =?utf-8?B?Zng2ejhDWldibWgzU2dMQzl0T2hrUVk4L0x6MW9ZN3ltWUxiK1JpeFlCMGh6?=
 =?utf-8?Q?rRIbexjdwlVoiMCuawTymd8Ca4MzSp/mpjbqF?=
X-Exchange-RoutingPolicyChecked: FFDeURpzxSM5nr80OZjNBjThmm7a2qqD+sTwGM0LaoJwZReQ7de+zv74luqzoRj0jeQQsN5aQyh6uqaNidAjiK5wfEH8lYN52prdxoOLa0svixNe1J3CqLw07UJgMg6081j0MEmWyRkgodJAEGTA9HzQnt+qMFkNje+9h3edC+cNoycYaACdI+YI/LC7yXv1SqW/FzPVDUgaw8KVFNnGlmF9afD7m5qU+bpdHdB8o8AIIOy4qco7jQSdn7cZWuSnMc73i9pLkhonpfmng22NuKsL+r++D7rCEN/0wfT2xnQGsbXjDCRRB/WbIEr++tIDrhmrc7/a4NG5naQlxeKFdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c8cb9088-dea4-459a-7198-08deb1783dd8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 05:18:32.8284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUEZaHT7+8c0OTNjMtjmx5Pu60h8QQ42wjrcnpQrdravalEyiNqQmDbe0KysP4BQ/FlvcLvN00zHAWV6dhcvDxLk25L4aop6gavq5e082ZqB7qtD3Ya1Tnu3AG1okRHw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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



On 12-05-2026 17:51, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Stop looking for the IN_FORMATS_ASYNC blob. lib/kms will now
> provide format_mods_async even if the blob isn't there.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

LGTM,
Tested-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 6a56aaa48ecd..3d8c37631e2a 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -871,11 +871,6 @@ static void test_crc(data_t *data)
>   
>   static void require_linear_modifier(data_t *data)
>   {
> -	if(!igt_plane_has_prop(data->plane, IGT_PLANE_IN_FORMATS_ASYNC)) {
> -		data->modifier = DRM_FORMAT_MOD_LINEAR;
> -		return;
> -	}
> -
>   	for (int i = 0; i < data->plane->format_mods_async.count; i++) {
>   		uint64_t modifier = data->plane->format_mods_async.modifiers[i];
>   

