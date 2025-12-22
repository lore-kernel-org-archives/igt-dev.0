Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C840E674B2
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 14:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD9210E6B1;
	Mon, 22 Dec 2025 14:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEz45Os+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F098210E6B1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766412264; x=1797948264;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QDdUehZSeZbFoIbBufk9p80BFta8FiEcGwxzOOWIeb0=;
 b=HEz45Os+2+qRNhNk/PumtaBtMr4KRpa2EklQ8MGdLMuxTH2j1are/gpp
 qnr6SvnSqNIyTVQrm09CB/yaggQs2+SyzaLe/JITFL6ewvvjJV8JinQ6V
 I8XfcURiKQ2F95yuUE3imlI5dfhcIetU5zwppsN7kKEW6VNsMIzajGSac
 HyhMIFdaTAAgGWpEO+8Tsv3jdBSU9Z8CahhbsQPE2gbpwqh57/oMZ6dU7
 sRVZWrkEUiiyohhkhwtiW7cwSgBoAyddOykb9SlkpGi41EKFoFjYQLxSX
 mhKASeGZjuljLlAxVq2jUpE2yzk4YFPglZx6hRdhFbwOA56SI729s6pVb g==;
X-CSE-ConnectionGUID: Fae4G7aCTMKTe5g2iQjo/Q==
X-CSE-MsgGUID: DIfJeVIBQ4uKFbO+4ljrig==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72126623"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="72126623"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:04:24 -0800
X-CSE-ConnectionGUID: nRf624JWRsmOCy/CWMMK1A==
X-CSE-MsgGUID: Z0xcVjvsQPaOnAk/0g0kKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="230543449"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 06:04:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:04:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 06:04:23 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 06:03:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7PBVZCNYEuGvO6LM+nycOq9NhXcWLvuCU2eiSRFNkk2LKB+wrInb7L9UJWgXiKAlnUeiqE82F9bI5N/QgqeJW6jPWmWGUiImckeIY6oZL/Yz0GLxOn2vrvlqogNFIJ3XACcXXOf1pttNjBmKDP4leRUJECQHfncMc0mIbFIFTfKvNXo2J7VCZER8hlN9hLveOuN3QhibS4guB15g3FzApK6ACfhNsbOo8F6t5IAcyTEgRugRXwIcGvPeV7arCcO2OiPS/EotIo+BEUVjUrx6AJ8BaJBN3W2xYWqWkKc7Ehrr2nQGRCd1KkD1oV9fzNW5MTSY6GrJptA5YsflwKv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPBiGUu2M5qQ98svR5Cr7n0N7hy1NGUauzNVKTIPf6Y=;
 b=Mz/EyeCeW3dep1fTu6ilOYstA6aT/GIOdLOQF63FhoeQVJCsphAb3BmQHmiBBYdTa3hOlSj/HHwXrgLMQeCReacishR/xYt+erVIVRIFazGPmCz6qHxnrhBiSpfPsW30spcNEUI4WXhof/X4ftWJJ4TFdSKwXuRx+e8hls7Z1ZGV96Nrjg82yelpzr10DOikAQ0W5aAcHjX3np7WGvksBVrquS/h3Loj/TQ8pUfZRL2gS8vk64NSI9tqUTjF2gnF+HuccgC7EaD0i7BiLOYFwq0rkxjXm3IU3l7+j8xqKpDNANgALgsJsPipNGhoS58zt5Wc7EqsrhmZjDKVHo3Y6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB9520.namprd11.prod.outlook.com (2603:10b6:208:59e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 14:03:38 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 14:03:38 +0000
Message-ID: <1cbac608-06b1-472d-b359-9ec84b19d6e4@intel.com>
Date: Mon, 22 Dec 2025 19:33:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v7 4/8] tests/kms_color: Add test_plane_colorops()
 helper to validate plane color operations
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
 <20251219112606.1330425-5-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219112606.1330425-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0030.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::14) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|IA1PR11MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: d25d6813-aa99-4ed1-f0a3-08de4162e76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUhVU00veDRUSjRRd2Jpb0xqckRhSFBTVzZRRFIwSnhEdUI2cWFFMFJ5bVMz?=
 =?utf-8?B?L0JPUXR1V1ZzYkNSRTU0bjBLcUNzVEpOQmsvT2tuNHlvdTVON1BVVlpFUkVG?=
 =?utf-8?B?aE9Sd0dEOTFwT0xvOVJLb2JmSzBPS0xGdDZaRGVuRXBOOEI1S0h3VVFQb1Iv?=
 =?utf-8?B?N0wvak15dUsxODZRcW9ERXVCa05mNEt5VnhYLzFJSHZYdytkNFRPVWRvb2dD?=
 =?utf-8?B?RU9WelRKaWU4d3VmY1pkc0xLSy81Z3ZkNzhOeU5yTWpqQ1BZajRNNHV6cEcv?=
 =?utf-8?B?YnVrTDkrdU42SHJTbGdmZi9LbjRIaVVJRTZmQUJZRlE3NnJ2ZUZZQ1NOME5z?=
 =?utf-8?B?WFFPcU0vU2JnRWE1RlVLdlZmSy9KN09kMEFocFV4b2dtTnRkdG5XcVpHaFFs?=
 =?utf-8?B?b3dvZTR5T09GZHZqTlNVTmdtbWs0Y0xOb01ZZkRVQUlsdGRIem1xRCtjUWVx?=
 =?utf-8?B?aExJdEI4d29tSWFrdWVaenhXS01mWThKUmRxeUt4bm9IWUhLWjFhSDRTNnRi?=
 =?utf-8?B?TWY0dVkxT0VNK2JENDNoMmdiaXhlbkRRT2hkcEdZV25nZ0pzN0kyaU83NHdO?=
 =?utf-8?B?VGQvUDN1NXlJcE5CcVZXT2h5WWFlYlNFa00zZU1tNmpsKzFjNjRCajdDalN0?=
 =?utf-8?B?TjdsTWtBd1FKdHdqZVpRN3pKTTdDT2hZMXdxVVpKVDJCR21ETkNnTnMyTy81?=
 =?utf-8?B?ZWNTY1hoN0d4R3FVQk9tK0wrYnBld0Myb2dsa2hLdkJiMHdxZlBmMzRLcVcz?=
 =?utf-8?B?c1ZjbFU4SE93TmRrcDkwM1h5TlRGTnUzUDNiSkRKN3BQNm1PT3IyUWcrVGRC?=
 =?utf-8?B?SmFlMVhScVhqQnhtUUdVQndURFhSTWNBN0FqNEFIWTZKSHlBSko4REZURTRK?=
 =?utf-8?B?NXA2dzRnODFyZWsvdEJrMnNKcWMyZXdpeEZ4S2MwTWNGVndzeUVjZzFPNzFR?=
 =?utf-8?B?Y3ZwWWdPK2N4TTdzUE9memQ3L0VRWEZOcG1NT0p5d2xtKzcrR3Z5N3FhakRJ?=
 =?utf-8?B?cXlWOGxrSk8xdUZ3OGVRb0RTbllMNHpLeENhaExKeVowa1Y5bEhIQ1BsNk9T?=
 =?utf-8?B?bFNJRFlYTWJwNkxVYlNhN2FwdXdxbzlnVkE1MHBqenlUaG9SeVdEQS82T2tw?=
 =?utf-8?B?TDJLaEh3TGxzZnUraHdSMzNpcStMcG1YZ0NheU5KMXEzV0VTbVJnb3BpbldL?=
 =?utf-8?B?MVZoV0Qra1RFcGhPOUE2NUpGTUlVMXlnV0ZDMm1hZ3B0SHRVZlBnK09xeXVF?=
 =?utf-8?B?cGtuVlZyNXRGUzh5VjlScEhZQWtGWjE1SFFxZHVwejh2S0NrOTlFWmVXQnRi?=
 =?utf-8?B?WFg4SU9XdHNZaGFpOU1QSXVha3BUcStVTCtKd1h6SnJtRWJnbDZ4ejV5V3p3?=
 =?utf-8?B?RUJ5YkgybWxFVUp1d0NZb3VBTVJDbUMzaGl0R2h2NTZHVzd4ZStWTmlZMlZp?=
 =?utf-8?B?TEczaWtFbnlMV3ZReThGWmpHdDFLa0QvelhwMHJ0QzVNMStXQXZQMGxXc2RI?=
 =?utf-8?B?UkMxbnZ4MjZtS2R6bFRReG45STk3c25iWGp6OTV4RGduQ0JGeTFuMVhJVzZT?=
 =?utf-8?B?Q0RyNnRGY1JUVllGNk04NHVEaVdqaFJRemJUMG53QzVDSU5SV2RBcXZPclpZ?=
 =?utf-8?B?Ui9ac1JPLzV6ZlYxRGozamw5TXRGWkhHVW5hNE1yT2dKZVo5S1JNOWgzWDVR?=
 =?utf-8?B?WTlvUHdjTjRVY09sQmIyTmF5ZVk2N2luVGdTbG1JdjI3ckRRV1hOS3BIYWJ2?=
 =?utf-8?B?amFLQ1hOamtNd0dqR2ZWYUFXS2tTU1BFcEhkeDZObXJsNTE3MThvYk8vNENm?=
 =?utf-8?B?RlNQZHk5WDNpQjVoT2x0Z2NFTVpqRG94VW12dDJBenFoSHI3VlMzQ05Nb2Z1?=
 =?utf-8?B?RXBxMkVHVThtNXRiUVRXRXhyVFRoYUVqLzJ2L3RpYVRlTENqK2ExclM4Tmgx?=
 =?utf-8?Q?NXLb0WRW7jtlsBe8pu223/ATSZSVPSta?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODVWbk1hZU5aenJyU0RGYUxiMDRsUStkMEJxcndRcndlR2lUUkJqWG1sdzVQ?=
 =?utf-8?B?QTJVYWFiem94RU01WGtxVFY1am1OSWxsSTNJcmIzcDVNam05UmNNU0NRcGNS?=
 =?utf-8?B?M2tHVkpmdm5DRUxJM1JLRW5hUlkwMjNsSmJLM1NFRjRhMEVIa2JacmJBaFhu?=
 =?utf-8?B?MlBhTzlVMVBVdmMvYlEwOC9WZTgxOWFpMy83ZWJDdkRkVENUVFMvOTljdm1l?=
 =?utf-8?B?dGhDOUFQb09SbThiWUJ4NDRidnUrU1k2dUJiSzZGU085TjVHQjFYUmRJd1hJ?=
 =?utf-8?B?VFgxOU1lbm9jeU4rRDh4Z3JmRTRyaEZwQVp2dmFhOUdPY3VCdFpHeVIyclZL?=
 =?utf-8?B?Skc3YWFXQ0lUakVXV0VGN0YvNzVtVlNlRjMxak1yZzUyNkZoUkVtTGRXNjVH?=
 =?utf-8?B?cVZqWFhtWXpYWmlaWms1YWVmWmRseFNqUzNnOUlHcDl3Tlh5SE5pYUQ3OXdO?=
 =?utf-8?B?QTRIMmJIREw5RkFHb0hSb0tFRGxlci85MXJiQ094WHlxbzduUzZxbUZlWkY1?=
 =?utf-8?B?TGxoSExjM3RaN0xvZmxpK29qekU3VDVldVoxSnJjb1NkaThYNm02OURFbzB1?=
 =?utf-8?B?bnFHRTNtSWlVeWRSZUI2ZktWVE94L3p0UG9YczZGSDFsQThvSXV1Tm5HUjhJ?=
 =?utf-8?B?SFNSVDFjZmpCNEpIdU92ZkdaYzAzcnl2bzAwZlByZnA4MHVrQkRFcVNCbE4w?=
 =?utf-8?B?azZ5TUNmTjZtcDFiRUp5VWJKanJUakZqNVZEaExvNEJwV0lBSlZaS0xlVm5T?=
 =?utf-8?B?TVlXbmx2d3VOVFNyaU5CZ3FrZzZPM0JWeUppeEVGS25La2dOYkZZTmZCRzZP?=
 =?utf-8?B?VnlOTkd0cmdNanYyQzdIbzhjQ01mWUtLZVRIZTZqZFQ1VFI4OGNOd29DT1BS?=
 =?utf-8?B?K2lQOTl6MzZESVFPTUtVTml5S2MrQmN2ckVNV3c3bWtNT3N4NEZBTVZOdFo2?=
 =?utf-8?B?L1NkN3lKdi9GOE1HQ3ZwTnI5dFFNOWxzL0JxWWNtTStjWklsOUV1RW55RHpR?=
 =?utf-8?B?OC9JVXkraytxaHU3dFdMZ3RGMkcyYmh2SW5TQncxZDYyQmlaYzZ5Tlc4MldM?=
 =?utf-8?B?eXFvWTM1NHh2SkJoeEtqNThOYm5tOW5UcTZYSkxITWpVS0o0bjhxNFJxQXdJ?=
 =?utf-8?B?aWhJTTZtNlZKRUhDdXBPUmt2ajVDSUhXVXdxOU1CMyt4NzZCTWkvSXFNNUNG?=
 =?utf-8?B?N0tER1dBclZMa2E1a3Rmc3E5ek0xZUIxeG9OZDlNb09VbFlLT29xT1VwcW1V?=
 =?utf-8?B?SUpsZ2JTUjBFMHQrcU5uT3RPdEhFMENHWkRTZ3prVk1uRm03cHJTNUlncjFi?=
 =?utf-8?B?eEg2S3Nkc2UwZVVORkk2YzVZWmljYjl4NGFKVDczOWFlZm0xbFBWbW5tek81?=
 =?utf-8?B?UGF0WFV4dUtMTlUwamt2QktEdmRxL3lZRXdzcGsrRWYvRjNGa25JZGhFemEx?=
 =?utf-8?B?aGRFUUMyTXI1cmFjdEJYMGlVL3V2MU1Nc05xR3J2ck9BUkJwYVFKd09mWlVU?=
 =?utf-8?B?Zzc5VXFNK2FSR0grQWNtdDg3TDFzREs3MzliQUd3Qzl1WFJxa0VnNHlpN0Q3?=
 =?utf-8?B?SkN4Q1N4V290OXZhOGZjcFd4dnBBbU1YRXNYYm1vLzlicHNyYkJWYWYvenBt?=
 =?utf-8?B?YzVrUFZ6TDQvOUV4V0VHWmRrU3Awc3M3bHdUSmpReDFXcEFIV0pHOWtYRFkx?=
 =?utf-8?B?bmhvU1ZkUGFBc2lmMDY0ZE9ZOUZQckhWNkRvckpLcmNwd0RsU3V6WFRFemF2?=
 =?utf-8?B?SkR6Z0VDMitTaFY5ZGtaekorRmlZR21iNUlmSDJmdElOVEkwVzlMa2wrUEE1?=
 =?utf-8?B?N1BuNUhSeWhYS3pmai9VUU5Ibzc2RUF1Y2FiRWpxN28yejZqZFpGb1RZS2Vk?=
 =?utf-8?B?UGVVNXV3NzNkRkZ6Y2pqN01Mc0hxSUdUL3lNUVovQ0d0Uml0a3dnN202bFRq?=
 =?utf-8?B?S1ZKSjBWaHVrdnZyR09YQnE1MGt1eEVQbGVFRytzNFp3cGdsRE5FeHhSVlNp?=
 =?utf-8?B?MTFMSXRiYWo0TEY2cmFIOXkvK3lxLzFja2dodHRJc3lLWkFGVWk1ZjV5Nmoy?=
 =?utf-8?B?TU40ckNNVVpmRmRCRFFNU3RqZkpyUXgxWGZWNEpETkhGWGZ1Zk1ObEphTlo3?=
 =?utf-8?B?TGl4b3ozWUpDc1ZPU01xU2NFazNJTVV4VE9OTVpuTWp0VjkwbG1WUURJWC9y?=
 =?utf-8?B?a3dydmlDQTVmZ3RXby83V0xid1JUSkZmTXVTVndlSjAzL2MwUkg4ZE9pSXpi?=
 =?utf-8?B?YktzeVoxOEVqaHJhelRJbjRxcEE0dHZtZWVTRDlJWnpYa0YwUWFVOUowRlNn?=
 =?utf-8?B?NUhBa0RUazZuTmRwOE9UNlp3aFRVSVdlc2NTcVFLd0k5UjBPZVZkRlFVK1BI?=
 =?utf-8?Q?i6MUBQQ+HhDmp49M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d25d6813-aa99-4ed1-f0a3-08de4162e76d
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 14:03:38.1644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijXDl3/BJntblXl2WqMaQqObnR7CqTcDxg8UF+p7vV0SImBGfWYeDFdngfhYcZod906Op15sfGgGq+Sq1LDTGyeOXo1GrO4sv+VkBTSJps4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9520
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



On 12/19/2025 4:56 PM, Swati Sharma wrote:
> Add test_plane_colorops() as a __maybe_unused static helper to
> validate color operations applied on a plane. The helper sets up a
> framebuffer, disables pipe color properties, applies the provided
> color pipeline, and compares CRCs between expected and transformed
> frames to verify correctness.
> 
> v2: -rename crc var (Chaitanya)
>      -add skip if colorop not supported (Chaitanya)
>      -remove prepare_lut_data (Chaitanya)
> v3: -rebase

LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_color.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index edc31026b..c3c064d53 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -720,6 +720,67 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
>   	return true;
>   }
>   
> +__maybe_unused
> +static bool test_plane_colorops(data_t *data,
> +				const color_t *fb_colors,
> +				const color_t *exp_colors,
> +				kms_colorop_t *colorops[])
> +{
> +	igt_plane_t *plane = data->primary;
> +	igt_output_t *output = data->output;
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_colorop_t *color_pipeline = get_color_pipeline(display, plane, colorops);
> +	igt_crc_t crc_software, crc_hardware;
> +	struct igt_fb fb;
> +	bool ret;
> +
> +	igt_skip_on(!color_pipeline);
> +
> +	igt_output_set_crtc(output, plane->pipe);
> +	mode = igt_output_get_mode(output);
> +
> +	igt_assert(igt_create_fb(data->drm_fd,
> +				 mode->hdisplay,
> +				 mode->vdisplay,
> +				 DRM_FORMAT_XRGB8888,
> +				 DRM_FORMAT_MOD_LINEAR,
> +				 &fb));
> +	igt_plane_set_fb(plane, &fb);
> +
> +	disable_ctm(plane->pipe);
> +	disable_degamma(plane->pipe);
> +	disable_gamma(plane->pipe);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	set_color_pipeline_bypass(plane);
> +	paint_rectangles(data, mode, exp_colors, &fb);
> +
> +	igt_plane_set_fb(plane, &fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_wait_for_vblank(plane->pipe);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
> +
> +	set_color_pipeline(display, plane, colorops, color_pipeline);
> +	if (ctm_colorop_only(colorops))
> +		paint_rectangles(data, mode, fb_colors, &fb);
> +	else
> +		paint_gradient_rectangles(data, mode, fb_colors, &fb);
> +	igt_plane_set_fb(plane, &fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_wait_for_vblank(plane->pipe);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
> +
> +	ret = igt_check_crc_equal(&crc_hardware, &crc_software);
> +
> +	clear_colorops(display, plane, colorops);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_output_set_crtc(output, NULL);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	return ret;
> +}
> +
>   static void
>   prep_pipe(data_t *data, enum pipe p)
>   {

