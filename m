Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE72EEA71A2
	for <igt-dev@archiver.kernel.org>; Sun, 19 Apr 2026 15:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACA610E3AD;
	Sun, 19 Apr 2026 15:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMe7VAfD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6030810E3AD
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Apr 2026 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776614330; x=1808150330;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IyDUggCCvxk3KCWb/Adb44Tp4TA89wctAGSgt8a5Npo=;
 b=GMe7VAfDxiLmAol3ImencOSw+UDnVMVPOLT2VE0OVMcl0XcQmTuFYVBW
 QaGoQW3pCC0QD4r/ULebXHlukt4CYwnB2r+PO1dqOzzIYUFxMHYB+WKKn
 Mt+EFNpsLm4E9A0sRmmPQ12ET+CZfqk84AbvH78ugWlRLTUgxwHgzNB45
 8yrOY8pFdwqKlC8mljZFrmpRzZR8gzv3UUAfQYpEezJDU4ahjmOOAztC3
 9d2ulINYQC/2vgqGkPF+ig2+gTGGqPYo8K/VhxUEHubZaSxRuPO8HBU+g
 oGMdRCeAkf0Q/pamSZmasa7G0AvXWkJ2ORq4cXr9ixHH+XzLXvpi+bFrW A==;
X-CSE-ConnectionGUID: UEeTTexGSzqwvlKYdxrc/w==
X-CSE-MsgGUID: /h4MtG3kTBek/gf1mnTQsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89010727"
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; d="scan'208";a="89010727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 08:58:50 -0700
X-CSE-ConnectionGUID: P1/1VXxzQdyRuZNWVxZceA==
X-CSE-MsgGUID: znwF/2wYQI6c/gwf3t89kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,188,1770624000"; d="scan'208";a="230636328"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 08:58:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 08:58:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 08:58:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 08:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpnOkml7idRpzapqpg2SgPlROV+vGeR+wg7l7Cm4TWGPwkAJkBafvx/HpXcV7TeSN0N6/c/TSS1vHQi8sDBFGBFHqX1WYxyoPVX4z564og7e5qio8DnS7+jaAh+4swsIawiXllMntVkN8aA3ypP5x4F1vT2/0/Z0IjdIGhwbvWnU+GJGLlqIxvnqOzz0/e/+IOiOpdoQE2gwB2/SnvmWyi9b8m9N2IDEL6k2AjQ5JvZmhZ+G1iTxhc0HzSEHSaUwebWaaAXXvllopS2PQsKvPlYg8Xb2t+KI185C9MREhojPT58729fkm/ouyGwXn6Nn0lIM/cW7gZOetxc7/R/HVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3kPTOVb37uxa2M96Wx/vN3if0U5oCk9FEOMztwdpGU=;
 b=UU4z5w1leugP/7VZHOHxBl7HyXAiueEPnSL9G4XnfjnIKq6fdHjVnJWeanL95YoWu9iK08JGmhiNvAptmMTvLfo9wGWQbsM3F7YZ/fr99DWvgHbNsnxL6szwfYjbzqjyx7y2AOyNYRv1iqt1wLBL2KeoUMn01zly25NvsZA78o0GKCRnsjlab+vEJhKsYxesHY4f7I9ItApzgq/2qI3U2IPNVCeZbAgeplPJRweD6FsleKI41TPYItzaYfSrlNALCC1IS9NnOQFlJI5t1WTWd8gPtSYNMeDM6ZXaMXecijP2Dl0G58aD0SDsd7FAweYh5ggT1zcHPPPdIbUYdJq13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Sun, 19 Apr
 2026 15:58:44 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9818.023; Sun, 19 Apr 2026
 15:58:44 +0000
Message-ID: <e7f4c984-34b8-43ea-98ce-71be6f9dda07@intel.com>
Date: Sun, 19 Apr 2026 21:28:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/8] lib/intel_batchbuffer: move engine class
 selection to helper
To: <igt-dev@lists.freedesktop.org>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-6-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260323162911.1912755-6-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::6) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e6042e-5680-4b2c-5873-08de9e2c889f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: I0XszIBOmpLw6DWQFS/tHJkeP3m/JXBcW05nawJ7A+/yuvasFRnGyDJUkXIfHDTxdXxEE0YdEjcSD4X27BmQsQz7KdTCL+ziZP3+FsW7m5lXN+xICwRxGupRnBhf7l/scO9Z0gk36FjscEgOJTPDWwM8roJRouarfQAWrTwmTE84+cNYzAv5tlBRo+dNSUP3oVGcTDdm5qG9WiImPmO0LbpdxgPPl1TiAUem4e7cInnb/lWJR7aIlv/gTOw71jFQqm3RhKN0IuG0ECiXREDlW4laJxiUEaFTXyIgdPXMZyrImS7xr2TQwg0bJjJ1ZBeTnL3tO/db4GkAbqbSkmYma3rMDb2YQnbi6qWvLtajDpVrZzrS2nGPW7zcX6oJsolsly7unj+13jMF3B8nXP0h3Fp12WzTk9R+o3Owj2aXhysWZXvJLCJC590IWr3Ho/pa8z4sKuahzXycpgRcGUS6iA747173IFe6takLpAi+vL7LHPlwPANGmxD6yb3G++lNefjqF6ZBtQwYYqxNbhynU7c0UQaYWaQN9XPXlMewPCzRMB0Ypi8AHlPSsU7lr0oQg3L7zwyX018D9cj8yje+riymel7SB4KC1ZnmuTyhhKDUJmkHKLcsvp9AnRT569cqI/k7SY2qeYxMign1TUjc1Cnx3RpPOAWyPwrq2MJt/IAmiAp7M6oX3euusuXMtj2wGz9pAblZ/PZBxl4UEO/B0iaHNMMMVQrx5j83u1c7cDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0dMZ3lvdzBFWGtIUVR0ZHJGMDU1V0lNcjI3RWV2eUdVT29JQkpRSHV4N2Vx?=
 =?utf-8?B?ZEhCVktWd2dWdFJOVzJNRUM4STBJaGJSWC91SmpzQ2ZxNzlWLzhuL1JwQWk4?=
 =?utf-8?B?Rit1ekRzc1c4aVdVWmEyU0QyOElLcXJ1eUFzejVHT0xpZ3hZeW1EUGN1bCtu?=
 =?utf-8?B?Nk12eGpQRXZGZUhJWWw5bjAzUUJldUtrcGs3MGFXT054QkhWc0gwdXlrSkp4?=
 =?utf-8?B?MVlUVkhQL3hrOFZOQ0dLb05rSXp4d2hHaFRTL3dLZjNkTWdoZ0VLU29zWGhl?=
 =?utf-8?B?ejdmTENLdlM5czhIZHU2L1F4OXdrcWJPZDBFSHpWVjhRSXN6R0ZHUW9FTldW?=
 =?utf-8?B?eWRPZ2hoZnpURjFkaHJML244VVVGOVB4U2pNT1ZxSlBXdE9HRUVxRTBuZnUw?=
 =?utf-8?B?c0ZCdFd2T01GdEV1NWd2WDdSY05VeUhZWkZlZVJma09lcVdSTmRWWjhUSGMr?=
 =?utf-8?B?Q2JYKzV4MEZYc210NTU4QW9XeERSSFVURnNZVG1OL29jd05jd0NLVXZ6UXhi?=
 =?utf-8?B?N2lnSFR5eWlLNVRFRjZBelRvM1NHVHZpeGdLb2twdGZnaEQ5TjhEQXdOSkZJ?=
 =?utf-8?B?c2svclFzMHg2SVBEUjlsSE82TlczNlZKVGx4SXgvZU9aLys1SmErRm9rNHFW?=
 =?utf-8?B?K2o5dW91aXJDcGpmWjdxa1pldXJIWkVCWjc5eS9LOElycHM1dnFoMHdYeThF?=
 =?utf-8?B?OE9DL0lvcmt1amV0VnVYbDhKbExFblRZOXFwRGgzYW1UVkNFbEdOZEg2UHVF?=
 =?utf-8?B?WEkzb20xZUpnQVpFSVRqeGtYSlhuSktvUERtT0JiQncxZnBnR2p1clY1RnAy?=
 =?utf-8?B?OWluc3o4SzZPK0xFZFhYYitIMFpxT3BaTHFYSWIwTmIyOGU2c1NKZVd1YWZp?=
 =?utf-8?B?bndBcDFOUFYvalpISlhLNGtvK2MvMFMzVU1DTUdZbDdJU1p5dGgzNXVCOVJC?=
 =?utf-8?B?bkk1eUtNVWtWbDNEdFR1YVVIVi84RjhJa0FlT3RnWUx6eUFhY2R5NFgxYXYz?=
 =?utf-8?B?dFhHeWFjZWNkTWlJYW8zNmJnNXF0SVJNVGg3aVNmSVlnTGFBZmJMREx3TGRB?=
 =?utf-8?B?cUxKRmQ2a3Nnd2V3amxrYVNCcjE2dVBPaDBETmlka0xBZWxLK3h3azhjU0M0?=
 =?utf-8?B?TUhrc1Ftck5HNEFKQU5yVW9hSUZLTzE1L2tmWHJDNjhvZ1Q5Yy9XZ3VDUzc0?=
 =?utf-8?B?ZTJXQWlQSXNRNG1KcnRrOHRtMnpWb1M5UlIreUNWVWk5YU9CNDFaUlpzcmhX?=
 =?utf-8?B?QXFlN3lRb2twbHVGNHhTOWo1SEYzRVRwR0dvc2FkeWVLWWwwSytHZEF6OGtY?=
 =?utf-8?B?aHpXdkNMUG9hb3o4NlVtQjhZQlF0MUcrWW8zUzNJeVRwUjlIeEs4T3NFUzgr?=
 =?utf-8?B?QjM2cmU3bkQ3amk3RGtKRHNQUm04NWk1b2dQeWZoTEJKVStKMWNwaFN1QjRh?=
 =?utf-8?B?L0t2cit4c3RNM2FJdVI4Q3MyRzUwcXFvWXF6Z3ZaY3kyZyt4eHNmMFROUmZz?=
 =?utf-8?B?ZFFoamMwOUVsWGk0RUNOUmRSOE9JVHVneTRvWi8veEhybWZXZUdhcDhDYWo3?=
 =?utf-8?B?ckpsMVVEL0phcWh0eTRHNEo1amI5Q1locHVuMERCSDRGd3l4M1BSdWozdlRT?=
 =?utf-8?B?a2NPOTVMem02SEJWSGxpUVpXRDVVOS9KVjh0aCt1SG5EanQzK3JQMU1sNGxS?=
 =?utf-8?B?QzB2c284Wk1kb2pDNVRuL2txRFNLOUdEeEhPUG42bVYycHNGMWxxcHhNOW5n?=
 =?utf-8?B?U0FFMW1Md2k2K1NKVndxNUZDRkdJeW5zc1Bac3R5VlJPbmlFWGNBNmZCZlZI?=
 =?utf-8?B?anYrVHcyV0R1aXpnNVZVd0FPU050MDBGSnV3TlAvWXVBNTNJU25BckdER3hI?=
 =?utf-8?B?V2NqVks0UUxDNGJxSklKZmZzUW5uQXNBNDd1YnRVYXF0amVnd2dmV0JPK2ZS?=
 =?utf-8?B?ZFJNN3ExUFlrcVBNb0pEYUlSMmRVNEpxaDl2MitDdFlpcXphWWkzTUptUVdq?=
 =?utf-8?B?aHdoa1NDb25wenY5alRER2NQM2gzeUUydkcyWnpnRWtyV1JIVjNyN2JGOWJi?=
 =?utf-8?B?UENiSUtoZnIxYW9UVXVqWlJUUmZiNE5yRDBRVVVuYVM5TVJxTDM2ZmVzTXJK?=
 =?utf-8?B?RksyU0hRY05ZUFlkbGtEZHBiWU82SnIrUFlWSmlyYWdJSFlKNTNmYWRlbG50?=
 =?utf-8?B?S25GSzFjeDVSMlJueHBKcUZIaExGZjNVYlNUSHZneVYzNE5DVkhDOVR1K1Nm?=
 =?utf-8?B?T0NFcXk4Yjh2aVd2a2pFY0lpVE5Bcm12Zk03ZFB0TGI0L2hkOXdkU25QdVJ4?=
 =?utf-8?B?U2RjRWFrRW1yZkhVSTNTYmFXWWc4VWlmS29ORWhuSSt0MktEZ2FDS3l0cFpG?=
 =?utf-8?Q?XACpS+s8B0A/UMNY=3D?=
X-Exchange-RoutingPolicyChecked: kVm/kdQFCnfhJGsAxq/ox/xOKmg+4k6RhJTalBaELU5bW9diCmMplZj1J9+M6Miw6uo+k7oWYwiFFlzU3rf1Yv05FnHkgxxrD/XYRjVBhT936NT9b8Z6V8pEqaw3W9Zyks6OjLA5bytsPy/vNnwlLIuRdU+VS7zRsq71KGQQUWW/8QcBADuq6GkxcBd1uLYM0aPiyMHVT+gNqZxm2Xd4CHcL2LO0oB9pamMasj8zRU9drqYYt+oVQPK7uKAfYvLx7l8U+8eyXcjO4jErmbCTMnmWob9Mxd1s2T9n85txzebqj6TDmBzRWPKZRW7hmQgokF9TZRKACX8pg2JLXuxWNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e6042e-5680-4b2c-5873-08de9e2c889f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 15:58:44.4031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VXddgEbrlmD8Hri4lCGr0vyV0mQKzUDVFeaeTww3GRhCCGp568Iobam9jpqzn8l6tfo4NwRDSNiuChaORiTKcEnJ5VG2dCFnGyVFTcH15k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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

Hi JP,

On 3/23/2026 9:59 PM, Juha-Pekka Heikkila wrote:
> move engine class selection to helper to avoid duplicate code
Capitalize M in move and end the commit message line with a .
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_batchbuffer.c | 42 +++++++++++++++++++++--------------------
>   1 file changed, 22 insertions(+), 20 deletions(-)
>
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index cfafaecd0..a3fa58b4f 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -2468,6 +2468,26 @@ static void update_offsets(struct intel_bb *ibb,
>   	}
>   }
>   
> +static unsigned short get_engine_class(int fd, uint64_t flags)
> +{
> +	switch (flags & I915_EXEC_RING_MASK) {
> +	case I915_EXEC_DEFAULT:
> +	case I915_EXEC_BLT:
> +		return DRM_XE_ENGINE_CLASS_COPY;
> +	case I915_EXEC_BSD:
> +		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> +	case I915_EXEC_RENDER:
> +		if (xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER))
> +			return DRM_XE_ENGINE_CLASS_RENDER;
> +		else
> +			return DRM_XE_ENGINE_CLASS_COMPUTE;
> +	case I915_EXEC_VEBOX:
> +		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +	default:
> +		igt_assert_f(false, "Unknown engine: %x", (uint32_t)flags);
update assert message something like below
igt_assert_f(false, "Unknown engine class: 0x%x", (uint32_t)flags);

> +	}
> +}
> +
>   #define LINELEN 76
>   
>   /*
> @@ -2510,26 +2530,8 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
>   		inst.engine_instance =
>   			(flags & I915_EXEC_BSD_MASK) >> I915_EXEC_BSD_SHIFT;
>   
> -		switch (flags & I915_EXEC_RING_MASK) {
> -		case I915_EXEC_DEFAULT:
> -		case I915_EXEC_BLT:
> -			inst.engine_class = DRM_XE_ENGINE_CLASS_COPY;
> -			break;
> -		case I915_EXEC_BSD:
> -			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> -			break;
> -		case I915_EXEC_RENDER:
> -			if (xe_has_engine_class(ibb->fd, DRM_XE_ENGINE_CLASS_RENDER))
> -				inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
> -			else
> -				inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
> -			break;
> -		case I915_EXEC_VEBOX:
> -			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
> -			break;
> -		default:
> -			igt_assert_f(false, "Unknown engine: %x", (uint32_t) flags);
> -		}
> +		inst.engine_class = get_engine_class(ibb->fd, flags);
> +
>   		igt_debug("Run on %s\n", xe_engine_class_string(inst.engine_class));
>   
>   		if (ibb->engine_id)
