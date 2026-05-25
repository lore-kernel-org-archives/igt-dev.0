Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81362CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 19:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A2A10E0E2;
	Mon, 25 May 2026 19:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDhmekI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4739010E0E2
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 19:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779736568; x=1811272568;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Mz8HdoPkDiT/moowOIRuF5MiHwCgd+GWuNMvSAI/dw=;
 b=MDhmekI2x3EK5Ly8M7zRdxNTtGdaxIU78GkoMF/zM0J3XbisKvmtSNHV
 Oj+KSVWBHDw4gZzG/oZq+vqp2Qq0PJ0mGCgfZYwWN8s8Chq2dBionsqSE
 9kLWwXkirO7iv8a0f+/lyVsplLIC5DjLeh6hWfHIUpGlRFueogT6l3TYW
 8+0g62vNmCff1YW2k2ce9HVSkK3AdcTD2IvaaloQ+J2k0w6opF874m8Ez
 /wtFitr2IerFHT3BbzIia8xrc5Gt8+kbngoGd7FdUOxfbHPeKiLcraJFi
 6164qn6rhkBv/BAKvPG9U1iord6W3g9TeNwZg3sXCvyQG+whS7qujXD6u g==;
X-CSE-ConnectionGUID: bo52BT1VTsivWu/N4MMhCA==
X-CSE-MsgGUID: XWZq2EY/TGCfE/z7Z0+G0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="98133268"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="98133268"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:16:07 -0700
X-CSE-ConnectionGUID: 5yD74EsjT4SblakZpgYADQ==
X-CSE-MsgGUID: YFIy6EmlTdugw2bpl1EjsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="245713645"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:16:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:16:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 12:16:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:16:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fj3W53p2Yud7OdxtajXY4qqrMl4BTY9qhmuzMbLHPVh65YgcTqzSIgBTXW5V+VuUWuWFTZSJyTsqeD1BdyXcGDTHLiroQDVONgvXBlnl+OLfyK6PIAH2/o3LxtICj3JmfpWSnGtk2Gf6YdCOnEK/zTjt8lBz1EtkF99LEj768V4HveATn1OL0YSyA2I0SKJ7HuBn6THbsLD8mhT5o2quDwRIh+2w9gQJBIyEF2qq1ownAAr8Ku3f+sxBqRd6opqFxZM7+Tm3Zmh1qqYYHxsPFJazD5SUALoqIurhJrkoRclM5KOiVdIY225X55u0+Y067Nv1IceNIRcx1VJQ3GOUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqBoxMdPzHTYhEjr2OAV+7JGdZSoezhu/sVCvmeumr0=;
 b=DEzAnuogXyt/GF+BgqGl368zvAmmPLZmjV0H4fCFjYBiZgeAgZfjUuEpRhw8SrY6mVp030mnOwx1WRBPxQikGYvS/rGGeWmxlCvW3noQyfATtc6t6oTzXFAtww+FN3E52iZ8zMS23L0qtSX2WWO21MTKvRLTTHYsQ9DeR2QnHRAi+4zff42kugHDKxrX1UCX1P1YGNLcyxIqWPE23C4M0NrisK4wx7zRb6/mi9icOcIHgThXC0lXGbRa0ohN3VgedW3WHIM5VJj65+Jz6zz+gYwmCER+kIPt6ZZoMRhcq5UR4jaf188Baz6ar+NAid4mOkiOcrHXVfwWuaHL/8TnZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MW4PR11MB7080.namprd11.prod.outlook.com (2603:10b6:303:21a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 19:16:04 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 19:16:04 +0000
Message-ID: <58a258dd-2258-4fb0-8219-f8d8ef68e3ae@intel.com>
Date: Tue, 26 May 2026 00:45:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] lib/tests: make igt_get_output_max_bpc()
 return status and handle failures in callers
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260525092621.668816-1-pranay.samala@intel.com>
 <20260525092621.668816-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260525092621.668816-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::8) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MW4PR11MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f919e5-e31a-4da5-d3dc-08deba9210d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003|11063799006|5023799004|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: A6dWMe5E/FKbVlk5y5xUTp9WzkTSYNcW5r72oTMjj2mABsExG+tZSHJNaJGLilQTRhCwXPqfoSoSYWcSHjMiTse7FSWt2dPlnVFZJwPMu4z/VPdPlN/xnZBcNK8rSRoFsfw9ZP+UrqkAk/F9i16z5+KtdhsOwpl0VLzUvIHNwmQzYrdlXoPkrX/KU62ifIwMtXIyDZzgRnCwp0OwPFCfltP48tsrmJG+G4bYUr6Pmag+rv652OhvbUBrd+fHysiKVNV5PSdHUjldUMrO+Ee5AbhvcKUk9nCTD9g9yLn98vITnjPo1JejBe/sVCChiZZEBe6gRAL9YSqk0k5o8QMB7/oc1mYupbD8eMVICIhSOaekyZkPLtXz3HTuxweTBIg/RHc4PUmRWp8XCVQK6ab9DFKcV3Iw7WsnPMNxvj+QU4TtKuRk3UGj3ouHrTfHf/rBmvv67kRZEp0kSRnr18Ey9M4daOr/m13Xh6JWw5H7pjCoCsJTzrmy+NkRjlYX86zwOOq1GcGznenhwui7gyRUhL3rX3yml2pluhfDnq15ab5kiZnVrt9rQFWPb8j6A1pfcOrDuLLqNpmknKbL/493rzbeCTvNOL6ofCYLSDYxaHpyg5dLPclGggBeUEREm8dhgohxvkmjUvdCzjESRat5kEGwi28yYw+ThUc2AodnwHxSaDDahvj0RtbORVPLqYVt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003)(11063799006)(5023799004)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUpxbWtHWlEza2p4S3p1V0xpeGp1cU5zRzZlSkJZbGZ2SmJoMkpPQ2FCNW9E?=
 =?utf-8?B?emd1Q1VMWmMvckY4QUVTZ3liVmFJczdqcGVOakNoZ1RXdzhpejE5elhGaEJq?=
 =?utf-8?B?SUFjckFnWVRjL1Vndm1IRlUxektRRFlJVEtXSUdjdE5QczBLVzJoTEhEYnox?=
 =?utf-8?B?QWV3RHkrU3UvMC9hQ2JrK1phRjFOVk9kS0JRUmY2c3lwQThiSWhKYkRjQnpB?=
 =?utf-8?B?c2UvZkxYZXN1Z2lURndEdDZuOUZudC8yc01pWVpWa0tCejR4eXFmMDZkSmNv?=
 =?utf-8?B?bmhFbFZ5NlRiVW9aZnlmanlsVldTZzMzVXBXNHFZekJKQ1phbTZmZzM3L1Jw?=
 =?utf-8?B?TGFoRWlRSkNRV0U5aTRPbXlIRndQSlJjUDArREVLOHZJS2RxZmRyUjY2eGFJ?=
 =?utf-8?B?MEQxdXZ1b3YvbUlpM1pnbGVWRzB0TkQ0R3N0UTBUOFVJQWV0dlRnM0ZKVVlW?=
 =?utf-8?B?alE3NE1iOThsc2Y0MVNtcEpYS09ieXJRZDd5aGI3OWEydmdidlo4bFdwS2xw?=
 =?utf-8?B?MjB0TmZacG1YSE5lNmEvR3VtWFlnVUZ6UjNwY3doeDhqaWpXaEdsT1RRL1RK?=
 =?utf-8?B?blRtdzRwTjY1UHdESFZwTFhZcE5nZ3hHdS8wM2RFSytYMnBGZ0tjMjFad1NF?=
 =?utf-8?B?eXQ1MVVJM1Y2UFljaGlIeWFEYVJ3ZHhYVnAxd1lnUHluUjZvQ3BWQVFFYlBq?=
 =?utf-8?B?REtWakx0YUZRMmFxSTlPNmxFc3dGU2I5Q3VFaXZxOTlMRnZweVJva1Z5dXpY?=
 =?utf-8?B?cVBRSzYvSitEWitRbTJKUE1jM0dEY29hTndzUVZSUUJxQzNOWHdBQ2F6TEZD?=
 =?utf-8?B?dE9oSDBQbEkySlNaY1FpRTd6a1JlUnZvd2JiUGlaU2R1ZkRGTmJ0WjlFVlJY?=
 =?utf-8?B?L0tRKyt0M1k2ZExoL3RJdVFUSCtDU01EdjA0ZHVoWFF2MDQ1RGpLVnVLWDdw?=
 =?utf-8?B?RXlxTkwvN09oKzdwVkl3elVJd003YnltdXdRbmJwTzAvT2F4cFdPZEdxdkh2?=
 =?utf-8?B?VFZObWxIeDAyMDlqZzlnN2hBWHRjclZuSjlGd3U3aE9DMktmQVkrbjgxME1Q?=
 =?utf-8?B?bythUE5ET1pNOFJXVGFNMC9scjU4OVVYVjFGdzVmYmZKUmVyVWR3RHlRK1dT?=
 =?utf-8?B?ZDhPVnptamZzWkRjdUtqT05vc0l5Zkt5TThidVZmbm1neGlRNDhjWFZRM3pO?=
 =?utf-8?B?dEdza2QvMitvcVZIMU1GVzJ2T1crME83aFFOT2I0TnRUTndJaHdIeHB1cFBN?=
 =?utf-8?B?QUE3MHRmcEtqK1pmMXpqNUtGZm16VXNJbk1oT0RlWERkU2VxUElmSlhkWVFz?=
 =?utf-8?B?N1BqSDhsTTNGV3QxbVUwTXJ5U2tCaE8yalVZVzdCSUw5UjNLTHd2SWRUcjhV?=
 =?utf-8?B?K0JJRFFkdzZhWDZvSjR1UkVWTmhCTG5FUFd4d3B2a2ttcXZ4SEY4TC9RVW5r?=
 =?utf-8?B?SGNtVDF4UTk2Rmo0elV2UmkyaDE1Ni9hNTdsTGx6QTV5L00yWVExcXF6bGRJ?=
 =?utf-8?B?Um0yZTVJKzJ2dmU5NWVQc2laT0p3NnhxYmt4QzREUjBFMVJtdTlGV05JNy9m?=
 =?utf-8?B?dmZXaGtiZENzdjdMR29wSjY4UkhsM3hSakpXc0lTd25QZjRiQWRLckxOVk1X?=
 =?utf-8?B?d2lXemlDRXJuTWdDdjRpZFFFQWJQZzcxd1pmQVR3TitMWWtRSG5JdlhFUUdK?=
 =?utf-8?B?dm5tN2ZkdnNWcURRSndGV3VnZmtPUTlYMmw4K3ExdEFNaVlEeDFaUjBSK29Z?=
 =?utf-8?B?NGZRL3V2bkpzUUxDWDd3VHFtN1JjYTBETk9IWkk0S2cyOURXK1lXVHQyVk53?=
 =?utf-8?B?a20wbE52d0lHU1JidUVKL1pEU2Y2WXJpR1lEZERNNkNKZFFWbDNhbnhMTjBr?=
 =?utf-8?B?ekUrMUFRZWNqUnlmZ2tNRDNBUlZSQzVBdjJjbXJkVzI2ZXZqblc4YU1yTVlM?=
 =?utf-8?B?WXA0Vmpnd2VuWXV3YWxpSGprbTdzWHd6bkpyNUkwa3lDNnllbW9XbFAvUHdo?=
 =?utf-8?B?WlpFU0c5Q21xdzUwRHF6Nm8vNnFGRWFQcDZMSVlyS1R3K1lPYjhGK1kweTd2?=
 =?utf-8?B?czVrREZGd0l3QkhmNHJoek1OdHJSMjd2dzdiMGRGZ041Rzd6RGtqSC82QzlC?=
 =?utf-8?B?UjdXa3VWOEdlQkczVkdBcnhvcEJwU2ZjSEpnVGJpT3dNOU1WVlhub3NDYU9V?=
 =?utf-8?B?dDhwV0FWaStFbllsL3puN1NadXF6NDgyRWg3TkN2OU9kWFBCdkpMNzNRa0JF?=
 =?utf-8?B?V25LcWxPNFRXQWhsMnlmWnpodU9NdHBNV2FRMDRlZ3U1YWN4bTZQY2NnV0pz?=
 =?utf-8?B?UlAyWkptSjYySW5GbmlJR2hZUTRnNmNnQldUOFRPTHNGelNSWlQ1QT09?=
X-Exchange-RoutingPolicyChecked: JN9NEoGJN36QK1BJpcs6ah9yeeLbSMgEbljXCMZhyhLJDnEBrSDexx7zjOyeE9Tpwj5dwd0MYsCjNKSZCRsG51HHs/te3TIUzOflVZtkomKk2OWe9qBtaz43edvIzpQLKB42mvr9oVM6lmNpFWo3xCfcx4gr/QOVrtTF5rQvquSwWfDIqduS7IDBpRYRvzeVLMcVAt5zjoxQuwCYFM+uxjI+hH+XGDvuLuOBbnST4iVQMxVdaBlryIqxeduViUJ90KgXUfG5LnGmihbe2+qTSLvYPc9sGHNkGDHMrBz3jdS+yENfHu1gHrVfyZmS9X/roz66NR8R8cd+ofDE3BgHWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f919e5-e31a-4da5-d3dc-08deba9210d5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 19:16:04.4658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvLxoUdepisIdAOlpZIk+meYWccx8FLsYfyoDHd/muSGvF95ZGHxUVJjhNgCingjdJWi5yAmyae9S71nRznYLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7080
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

Hi Pranay

On 25-05-2026 02:56 pm, Pranay Samala wrote:
> Change igt_get_output_max_bpc() to return bool and fill an output parameter
> instead of asserting/requiring internally. This lets callers handle debugfs
> read/parse failures gracefully instead of failing inside the helper.
>
> Update test call sites to use the new boolean-return API so each test can
> decide how to handle max-bpc read failures. This separates read/parsing
> failures from capability checks and makes skip/continue decisions explicit
> with clearer logging, while preserving normal capability validation when
> max bpc is read successfully.
>
> v2:
> - Combine lib & test changes into single patch (Karthik)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_kms.c                          | 38 ++++++++++++++++++--------
>   lib/igt_kms.h                          |  2 +-
>   tests/amdgpu/amd_bypass.c              |  6 +++-
>   tests/amdgpu/amd_dp_dsc.c              | 10 ++++++-
>   tests/intel/kms_dsc.c                  | 13 +++++++--
>   tests/intel/kms_frontbuffer_tracking.c | 10 ++++++-
>   tests/kms_color_helper.c               |  5 +++-
>   tests/kms_dither.c                     |  9 +++++-
>   tests/kms_hdr.c                        | 16 +++++++++--
>   9 files changed, 87 insertions(+), 22 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e20307923..a3f8d6928 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6665,32 +6665,43 @@ bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
>   
>   /**
>    * igt_get_output_max_bpc:
> - * @drmfd: A drm file descriptor
> - * @connector_name: Name of the libdrm connector we're going to use
> + * @output: Output to query.
> + * @maximum: Returned maximum bpc value.
Also, this could be s/Returned/Return

Please add what this function actually does?

Something like "Read the maximum supported bits-per-component from the 
connector's debugfs output_bpc file."

Followed by

>    *
> - * Returns: The maximum bpc from the connector debugfs.
> + * Returns: true on success, false on failure.
>    */
> -unsigned int igt_get_output_max_bpc(igt_output_t *output)
> +bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum)
>   {
>   	igt_display_t *display = output->display;
>   	int drmfd = display->drm_fd;
>   	char buf[24];
>   	char *start_loc;
>   	int fd, res;
> -	unsigned int maximum;
> +
> +	if (!maximum)
> +		return false;
> +
> +	*maximum = 0;
>   
>   	fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
> -	igt_assert(fd >= 0);
> +	if (fd < 0)
> +		return false;
>   
>   	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
> -	igt_require(res > 0);
> -
>   	close(fd);
> +	if (res <= 0)
> +		return false;
> +
> +	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] = '\0';
> +
> +	start_loc = strstr(buf, "Maximum: ");
> +	if (!start_loc)
> +		return false;
>   
> -	igt_assert(start_loc = strstr(buf, "Maximum: "));
> -	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &maximum), 1);
> +	if (sscanf(start_loc, "Maximum: %u", maximum) != 1)
> +		return false;
>   
> -	return maximum;
> +	return true;
>   }
>   
>   /**
> @@ -6734,9 +6745,12 @@ unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc)
>   static unsigned int get_current_bpc(igt_crtc_t *crtc, igt_output_t *output,
>   				    unsigned int bpc)
>   {
> -	unsigned int maximum = igt_get_output_max_bpc(output);
> +	unsigned int maximum;
>   	unsigned int current = igt_get_crtc_current_bpc(crtc);
>   
> +	igt_require_f(igt_get_output_max_bpc(output, &maximum),
> +		      "Failed to read max bpc for %s\n", igt_output_name(output));
> +
>   	igt_require_f(maximum >= bpc,
>   		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
>   		      maximum);
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c2a3099de..0ff1ee688 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1246,7 +1246,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display);
>   bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
>   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>   bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
> -unsigned int igt_get_output_max_bpc(igt_output_t *output);
> +bool igt_get_output_max_bpc(igt_output_t *output, unsigned int *maximum);
>   unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc);
>   void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
>   				 unsigned int bpc);
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 3c537ea9e..e59691f16 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -323,6 +323,7 @@ static void bypass_8bpc_test(data_t *data)
>   	igt_display_t *display = &data->display;
>   	igt_fb_t fb;
>   	enum pattern ptn;
> +	unsigned int maximum;
>   
>   	test_init(data);
>   
> @@ -345,7 +346,10 @@ static void bypass_8bpc_test(data_t *data)
>   	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
>   	 * with 8bpc.
>   	 */
> -	igt_skip_on_f(igt_get_output_max_bpc(data->output) <= 6,
> +	igt_skip_on_f(!igt_get_output_max_bpc(data->output, &maximum),
> +		      "Failed to read max bpc for %s\n", igt_output_name(data->output));
> +
> +	igt_skip_on_f(maximum <= 6,
>   		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
>   
>   	igt_create_fb(data->drm_fd, data->width, data->height,
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index 1742c7df4..dc71e903e 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -480,11 +480,19 @@ static void test_dsc_bpc(data_t *data)
>   
>   	/* Find max supported bpc */
>   	for_each_crtc(&data->display, crtc) {
> +		unsigned int maximum;
> +
>   		output = data->output[crtc->crtc_index];
>   		if (!output || !igt_output_is_connected(output))
>   			continue;
>   		igt_info("Checking bpc support of conn %s\n", output->name);
> -		max_supported_bpc[crtc->crtc_index] = igt_get_output_max_bpc(output);
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("Failed to read max bpc for conn %s\n", output->name);
> +			max_supported_bpc[crtc->crtc_index] = 0;
> +			continue;
> +		}
> +
> +		max_supported_bpc[crtc->crtc_index] = maximum;
>   	}
>   
>   	/* Setup all outputs */
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 4c41c6a3b..ee27f2630 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -265,6 +265,8 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
>   	for_each_crtc_with_valid_output(display, crtc, output) {
> +		unsigned int maximum;
> +
>   		data->output_format = output_format;
>   		data->plane_format = plane_format;
>   		data->input_bpc = bpc;
> @@ -275,8 +277,15 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
>   			continue;
>   
> -		if (igt_get_output_max_bpc(output) < MIN_DSC_BPC) {
> -			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("Output %s: Failed to read max bpc\n",
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
> +		if (maximum < MIN_DSC_BPC) {
> +			igt_info("Output %s doesn't support min %d-bpc\n",
> +				 igt_output_name(data->output), MIN_DSC_BPC);
>   			continue;
>   		}
>   
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 37706cab5..3adf14bd7 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2281,6 +2281,8 @@ static void setup_drrs(void)
>   
>   static void setup_hdr(void)
>   {
> +	unsigned int maximum;
> +
>   	if (!igt_output_has_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>   	    !igt_output_get_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>   	    !igt_output_supports_hdr(prim_mode_params.output)) {
> @@ -2294,7 +2296,13 @@ static void setup_hdr(void)
>   		return;
>   	}
>   
> -	if (igt_get_output_max_bpc(prim_mode_params.output) < 10) {
> +	if (!igt_get_output_max_bpc(prim_mode_params.output, &maximum)) {
> +		igt_info("Can't test HDR: Failed to read max bpc for %s.\n",
> +			 igt_output_name(prim_mode_params.output));
> +		return;
> +	}
> +
> +	if (maximum < 10) {
>   		igt_info("Can't test HDR: %s doesn't support 10 bpc.\n", igt_output_name(prim_mode_params.output));
>   		return;
>   	}
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index 24663444a..a50ac3a37 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -40,7 +40,10 @@ bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc)
>   bool
>   panel_supports_deep_color(igt_output_t *output)
>   {
> -	unsigned int maximum = igt_get_output_max_bpc(output);
> +	unsigned int maximum;
> +
> +	if (!igt_get_output_max_bpc(output, &maximum))
> +		return false;
>   
>   	igt_info("Max supported bit depth: %d\n", maximum);
>   
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index ca367db61..236e5c7c0 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -206,6 +206,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>   
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
> +		unsigned int maximum;
>   
>   		if (!is_supported(output)) {
>   			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
> @@ -213,7 +214,13 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>   			continue;
>   		}
>   
> -		if (igt_get_output_max_bpc(output) < output_bpc) {
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("Output %s: Failed to read max bpc.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (maximum < output_bpc) {
>   			igt_info("Output %s: Doesn't support %d-bpc.\n",
>   				 igt_output_name(output), output_bpc);
>   			continue;
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 32d8dfe14..d80dead6c 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -254,6 +254,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
> +		unsigned int maximum;
>   
>   		if (!has_max_bpc(output)) {
>   			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> @@ -261,7 +262,12 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			continue;
>   		}
>   
> -		if (igt_get_output_max_bpc(output) < 10) {
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (maximum < 10) {
>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>   			continue;
>   		}
> @@ -536,6 +542,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
> +		unsigned int maximum;
>   
>   		/* To test HDR, 10 bpc is required, so we need to
>   		 * set MAX_BPC property to 10bpc prior to setting
> @@ -560,7 +567,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>   			continue;
>   		}
>   
> -		if (igt_get_output_max_bpc(output) < 10) {
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (maximum < 10) {
>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>   			continue;
>   		}
