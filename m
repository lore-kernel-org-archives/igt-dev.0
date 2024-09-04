Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E0FCD4849
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 10:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0D210E74C;
	Wed,  4 Sep 2024 10:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuW3TFee";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B378B10E74C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725446514; x=1756982514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EKyQ3ti/0efpZ3O0FkCz9jc3sL//gBSxR6Oh9oJuZ50=;
 b=fuW3TFeeLwD7ueTJWKGtWmfgQnz6Y616aa0G1DrSaOZEHqC6Vs3rBpUt
 gP/mY1NXvEkzVihnGGbJbjdBRCHQ3FwXTHc8SHgKImi6GZRiWOSHtTobY
 02oFy9lbxPVYXDcJBAgtvMbQ+iRTsO9L9SwZyLwHfRM6EbpyPiG2RgE9n
 3wUCprUIHt0heQ/ML1f1A4Jm+6mbNhsVW9ckE3+Xa6jFsQJOHwfK880gq
 teL8PeFlzJYhXrwAFG/JT/BAPaT+ry4D/6xK5pXPIkVq3Wkggfzsj1agv
 ZzaJxsjjJgUP8cWwIhbZesqiTsUAWVXzOe9p8asFe1O1Yotryj4CRXva/ Q==;
X-CSE-ConnectionGUID: hCDI6NeaTkGffbfWQVgKRA==
X-CSE-MsgGUID: mEwyJYNXRkCQGxy5yHMftA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27859793"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="27859793"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 03:41:53 -0700
X-CSE-ConnectionGUID: eK51bMV9TeOSCag25iXE4g==
X-CSE-MsgGUID: UXIyBaKkS2mQpRorNHsmNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="64884312"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 03:41:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 03:41:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 03:41:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 03:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYm+k5A/v/CEaPEUmpVLx2Aai6SE6bWmCVL2QvBOdaUwcvcsN2iJKGtY0xF+CBsUc9PYV9U01xupvxzf5g8G13DoK8CKOe/k22AQ6468MAFOsABeYTc8cOXkH0PSj1DGN+iii/6v2yJsV25xX500DuxP6Q8A3S8hIY04gL6MKbjep+UQGh1RDUUU7qo+K4BfyKxA+kBjqAJWnGs6LC8PJv9tZVO8Pp4gJcDuf24tDHzjr2xT5iRt95tJzkndAxm4wGfxkMHAnnesteGaXNVgUVaEVF944OGh3syHvmh5GjypnFgT+0TGXj4Ov4pTvF8/Khk1p+esJFCaXDxigYXiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBo6V73Au37mBbqXFmBP+QNm4ww/1x+cJxouqAfAjCU=;
 b=OnYQ/q+OzZi54MtapKl7i9/mdJi7bO4I+M912zkOPanW5hKWiUHOCBw+9/zzs/opMg3erUBLoWTSRPjVmPyU4fCZAWrvL/CUVhSnMjiWe0CfFbyBvATSyXNwooVtvZLdL8c/3ivgBwuvgrwl+N8ClvB2osJaS0/wjTmrTHfg5/lYlGyyGe76ZLpnxPiLfNqN8lWyu8wbxkX2WNx9h7Fnaub64y0VxNxWLfrO2zrU9PphYQvrmT64qOMv91/qree3xYGQP5cY0/rA1o9w8y3vTQlzHO6anQTEPHAdI7JqkG+xyI3avhZqnKEC0+Y3sc5UhIlBmnUbr+L7EAWrCe8Eww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 BL1PR11MB5222.namprd11.prod.outlook.com (2603:10b6:208:313::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 10:41:50 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 10:41:49 +0000
Message-ID: <f72f69a4-705c-46c4-94c4-043f62bd77ef@intel.com>
Date: Wed, 4 Sep 2024 12:41:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/intel/xe_exec_fault_mode: Don't return
 early
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
References: <20240829180051.3286-1-nirmoy.das@intel.com>
 <SJ1PR11MB62047B49AD25D72861197DFC819C2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <SJ1PR11MB62047B49AD25D72861197DFC819C2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|BL1PR11MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: ba27cac6-47f0-4f66-b445-08dcccce2e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjhhbHBkdmtJY0Nyc3g2UEF1VVFRWDVjMWt6SXlSQld5eTVFNENaeGNyWUl2?=
 =?utf-8?B?Zmt2dWJ1RjN2dkc0cDdNZzlxRUF4ZmJrUlJCUjNuNEorRWg1VVFLNjVMYWJI?=
 =?utf-8?B?V0U5UmlOL0FodS93c0V2Z2R1bDR6TmNMaHVhcm5kSGdUMDVOTlBFV3lyV2lZ?=
 =?utf-8?B?WG16VHRaY0xhUloxQitjdjVFU0xRNlZMYlNoTHBBWGFIbXJXODUrSTVOUUJs?=
 =?utf-8?B?aFlMdGVmTWRmYSs4c20wSHduaklPclRFekZYUlQ4YURKVjNySk5uQ3Jpb1FJ?=
 =?utf-8?B?WG02UUhIWEhWdFpTYmNBd2JzSlp5WXg0MDFSSmxUQi9MUC9ibm5ENkE1a2hR?=
 =?utf-8?B?aTdVdDlwbjJOVEtsZk14RUtjMzJjVlltZUNZT2FISCt3U2hXRlBaY0U1YnNW?=
 =?utf-8?B?dGNMM042enlEcDYyc2YrczNueTU3T2lPa24yN3c2dXYyNkxsUkE4UHZXd3ZP?=
 =?utf-8?B?bzM1dXVEK2l1VmMza3A0R0x4cDJUb3FsL2ZmazhLc0lldWdKSUtkUVlHcGtN?=
 =?utf-8?B?VGEyVlgxMkNTak5MTVRCT09GdDk4SGdxUjhNSjd4SWRTWTVwWXduajdtdzR2?=
 =?utf-8?B?eTRVRlBQYlo0VTlpNnNLcUxOSmVLV3NacXZKejFKbkFDclk2SVpjLzA2UGV1?=
 =?utf-8?B?NnpBQkEvMUxYSG05Um9VTGh2STFxNHAzbDhCT0hVRW5zbVZSeE0zeFBLQXJK?=
 =?utf-8?B?Z3VDcDRVNmg1eFNyVnJuM2NXYVhqaDJLVXZHdm1VUEdXbitmeXVBSE5ZeUZ4?=
 =?utf-8?B?SE9WTXlmSEU5YXVmeG9zUnZyL2JYU0RvVlVDQ01QS0ZuS1ZRVDRucDdldVA2?=
 =?utf-8?B?RGc4WnBRQzY2OUswLzVkekI0eUhjZEFpdFdjRFZFazJRMHRQMlF2SjFjc0xB?=
 =?utf-8?B?WVJSRnhVNzZGWU1UVUloYVNmdHN2MTZibTNFVFB1bkhoKzFBdHBQdVhSRDZ5?=
 =?utf-8?B?dVIwd2JuU0VacUFxdG1TUWp4ZGhsd2J1Rjd5cjBiSnNQZWJjRVg1ZmRQZXlz?=
 =?utf-8?B?VVAzUTV3aEpzSnBnb0pseGV6U0tKM3VxR1Jvd1N3eWZzUnJFVld2VEV2WFdT?=
 =?utf-8?B?Q3hVSC8ydjcwSDZqTEtQOXFpeStSazJMWHkySWE4bEJzeHRjcjQveTZsV2Iv?=
 =?utf-8?B?cDErdStuQWdEWGNudnIxbmdpMzBZWEFVVC9mY052TG5yZkdZOHFoZzg3OWlZ?=
 =?utf-8?B?K0lleFViMEZCQm1rYXBsdDBmTkQzbG5LTGFZcFFzbHVJYWpkaEZUaXR4c3lN?=
 =?utf-8?B?cW81VmlsaXlTQWMrOEdTV1huYnE3S0ZjMEhvbTlZOEhWZU94UlRLTTM0a05z?=
 =?utf-8?B?RU5LcXNiUHBKbXlFdjIrUEt6UTlEUEdjaGszaFdHRWNUNnV6dkxvdDNQek9l?=
 =?utf-8?B?OHhWUjVZcHcwbFVBY0RrZTBzRDAxTTRmemgzd1NyNTFEb0tISWNpd29jVEx3?=
 =?utf-8?B?YllaTFZtNW1tT0c1a0FpazZwdDFNN3U3M2M1eHkwcVZWMjluK0dDV1FSVkNq?=
 =?utf-8?B?M08rUlN4UlVTRDlCNFlCeHhza2pvc1lrQXJnaVZyRlFxa2dCa0M1UjNsSTBI?=
 =?utf-8?B?c3YrRC84bWxEY1V1TDZyMmVQVDFKZnBWV3VuZjJ1aTcydEY3cGZFS0p4UUo4?=
 =?utf-8?B?QVl4OVdkNCtHN3dCS1BNTUpXUTg1Q0d1YTB4c3h4TGpxb3BtMUtOVTdoODl1?=
 =?utf-8?B?bTdLeFlDVVo0dTQvZStMYUJwTnZlMlZPRmIrd2Jua0QzaHYxeU83c081YmUr?=
 =?utf-8?Q?yfU3pgbaBS0v1GNip0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1RQOGhIK3JhZFRtQzJEaS9aVzN6WXFiVFJxbVdoc0htMzR3TXhTT1JKZXMv?=
 =?utf-8?B?ekZRcllyVEIrNFNET1ZMaHRGZ1BOS0Z4T2F2OWxrVEZ4empHbWlsUnJuUC9u?=
 =?utf-8?B?NEQ4VTFnTHhPMHd3WVhtL1FtNkMyL3BRUjZQZnlJLzc1QWRVbzBPMjNFOGxS?=
 =?utf-8?B?R2hCTndaTm01SzNrR0FScjRiY2hwKzFMbFI2RUwyY21IQ2R6UXVMcXJLR3Jt?=
 =?utf-8?B?ZmFCUGcxZWFsTU5YZFFGZmZwL0F6SHJoRFpEV3FHQkxoMTFhWjBuWlVrQkpr?=
 =?utf-8?B?Zno2Qit5aktHeXpXemYxOEdWZVNUTHY5ZldqejlrZG9aT1M5QUpXTytRUXdq?=
 =?utf-8?B?ZXZNTzRQazVwQ0hSQktOclQ2QkxCZ2FFSDNodVJiTGVHMWdHOW1vTGZPNGFE?=
 =?utf-8?B?aUZEd1h2MzJSTzhkdmdPSTUxTjdxbUo1U1NJQ1V1bngxa25zcHA0dWZuUXZ4?=
 =?utf-8?B?emNMbllZYjl2VVFGRzVoUEc5bmJPUVpCQ0lEWGxsK1dxdnRHSzlZRitIOUta?=
 =?utf-8?B?cHBZWkp4alF4R283YjR1YTM2OStjNFl2cktZVmtEcVBKZmp5SDhsRlZVaGxn?=
 =?utf-8?B?Qml4dXJOSkc0Umk1bHordzZrVXIzL1RMSUtPVkZMNVBSZURBV1B2NTRJWkZL?=
 =?utf-8?B?T2JmSWlBNE45T291eDZVNHJUTFgzV1AydC9JMDkwbG9OTFJKZkRvd0NZMGZm?=
 =?utf-8?B?N3dlSmtWTDlHa0FCdkExRGpNUXQrc0M2dlFMNzZWRGtXaHQvZTBCUUltWWdP?=
 =?utf-8?B?Z29wSHFTM0YxQlVFQldVRkVEa2I5UjFaR3l1R0tGbzJ6UER6eFd4Q0thcWcy?=
 =?utf-8?B?UllYLzRYSC9nVEt0Z25oSEVIMWZhTlpvcmd3MmtXSkY2NFBOUmJHMzZJSDM1?=
 =?utf-8?B?UlpPVG93aEcya2MwVDB3eU12a3dESUlOaTlkYmsvOS9CY3dESWFFS1lOTVJX?=
 =?utf-8?B?OXBXSW9DOFRvOWtmL1B5anZjcCtOVnovZUNBdm93a1ZCcG1mVklpOGNBM2lP?=
 =?utf-8?B?aVBUQ2h3K1I0cERZWTdyaEJEV1VHaTV1WThBZVNNak1LSnRKS2c3SG93TTZq?=
 =?utf-8?B?MUdlcGJwUGFDUmxaSEZHK0duM0NFOWlGYURxVUdVL05iUE9XUWh0aVVELzE5?=
 =?utf-8?B?ZEFrUzBIUlYyV08xalB6ZGtlZWNuYmluNVFkK2lHd3p4TEJzSEUvaHlEUnJC?=
 =?utf-8?B?M2diM2Nqb2FKUWNhSlJldGlSY1ZFb3lyT0VzR05aMFZ1V1BGTm1OOXI3QlNV?=
 =?utf-8?B?WUY2VHBFWnNJcWV1V1B3L2ZyVmJBUi9hZSt0Y0FMUzVRSTQ1RVhiQ1R2WGxq?=
 =?utf-8?B?ci90Um5qTjFXNWFlNlNtak92WWFRcFZUMjBuZTdDZGhXR3E4RlhjemNKLzlM?=
 =?utf-8?B?K2xLWGNpbnFrejRUVkxMM0FvS1pEeFRyVnRvcVV3bVRhYnBrbzg1d29rQ08x?=
 =?utf-8?B?NDV3anVDRmc5cm9TZTk2L1dFNENyNzZDZ0FuWml1djRNcHZKWGtRZWlKL2NK?=
 =?utf-8?B?eTZRTEVNeTB5a0RBWU00SkRlaDR2NDlJODJxM2hBVC9ybFVGZTEvbDFtbEt3?=
 =?utf-8?B?TkZWRzM0WGVDdXNNL1AzYUkwUnZ3a05ENEV0TEM3Qi9pTGxSNU5hK0FZZE92?=
 =?utf-8?B?NXZzbzM5bUN2NkxSbUlxenBtU0hFb1UwUWVmUVMyT2QrWWFiZ2NsN2FoTkhr?=
 =?utf-8?B?UDVEc0hqVnd0UDV4QzJrSWp0eHpvb1FJcmh3b0ppT2w5Qk9BcE94ck5QUDhu?=
 =?utf-8?B?Zzl4S3c3T05FdlVSemYrNW5WZWVMUHBGemlvdWxhY1ZLNkpPQ1dZcmZpVDdr?=
 =?utf-8?B?ZDkweGwyWXZJVHJuSmIxdThrTkk3MWI4cnNDUituSWE4U3UyTEdvWWgvWmJh?=
 =?utf-8?B?a1FhV2Jxb2dNVXRwNHJIOGxUTzFNelFsdUtqZWR5OUVZZkZiTHZJMDhyTjc5?=
 =?utf-8?B?UDBUYisvZzFDdGtiekxrNmJFbDRybm9TZmhYRGQxR0RaZWd3V0RhTnFTMGVq?=
 =?utf-8?B?L003a1hKMmZjeGlEVzRTUWxrNUJMOFhCUGZWN3JWekUzZVhZSnZHeTR6TUxR?=
 =?utf-8?B?NTNmaXNOR2h4ajJGcEx4aUVZekVBVlVTd01uelVoWUx3SU1TczdIZHBlTkRK?=
 =?utf-8?Q?nrkLIpAd0P3v7e/ECjO/QMj4Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba27cac6-47f0-4f66-b445-08dcccce2e86
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 10:41:49.8372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jmKhBVK/6CBN0l30gtodm9vsdPu4MHRBV/43wgPQ6t3qKoujzDLogPABsiFF/s3FpmFJ40qvRG4X8Q4DYVZjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5222
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


On 9/4/2024 6:49 AM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Das, Nirmoy <nirmoy.das@intel.com>
>> Sent: Thursday, August 29, 2024 11:31 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: kamil.konieczny@linux.intel.com; Das, Nirmoy <nirmoy.das@intel.com>;
>> Hajda, Andrzej <andrzej.hajda@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Subject: [PATCH i-g-t v4] tests/intel/xe_exec_fault_mode: Don't return early
>>
>> Tests that are causing pagefaults should wait for exec to queue ban/finish
>> otherwise pending engine resets because of on-going pagefaults would cause
>> failure in subsequent tests to fail.
>>
>> Not all execs will generate page faults and in such case reading ban property
>> is not enough but the signal should either -EIO or 0.
>> so read that instead.
>>
>> v2: specify timeout reason and iterate over exec_queues(Andrzej)
>> v3: increase timeout
>> v4: check for signal status to be -EIO/0.
>>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/intel/xe_exec_fault_mode.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_fault_mode.c
>> b/tests/intel/xe_exec_fault_mode.c
>> index 1f1f1e50b..fa050d0dc 100644
>> --- a/tests/intel/xe_exec_fault_mode.c
>> +++ b/tests/intel/xe_exec_fault_mode.c
>> @@ -329,6 +329,17 @@ test_exec(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>   				igt_assert_eq(data[i].data, 0xc0ffee);
>>   	}
>>
>> +	if ((flags & INVALID_FAULT)) {
> Nit: double bracket (( not needed I think

Fixed it in the v5


Thanks

Nirmoy

>
> Tejas
>> +		for (i = 0; i < n_execs; i++) {
>> +			int ret;
>> +			int64_t timeout = NSEC_PER_SEC;
>> +
>> +			ret = __xe_wait_ufence(fd, &data[i].exec_sync,
>> USER_FENCE_VALUE,
>> +					       exec_queues[i % n_exec_queues],
>> &timeout);
>> +			igt_assert(ret == -EIO || ret ==0);
>> +		}
>> +	}
>> +
>>   	for (i = 0; i < n_exec_queues; i++) {
>>   		xe_exec_queue_destroy(fd, exec_queues[i]);
>>   		if (bind_exec_queues[i])
>> --
>> 2.42.0
