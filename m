Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C21C3DA63
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 14:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E919C10E925;
	Thu, 18 Jul 2024 14:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnJ10bo/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FD310E925
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721312676; x=1752848676;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QPmUvPEGES5T/eI4XCjzphMLi0P42RG28DQLcub+UwI=;
 b=AnJ10bo/q1EJB+mO75dzZmjLbk2cl5CT5kfQlcuLgUqVQ0yshdU7W2Nx
 ogeB36us8twwddLK8RYfzNJVQazE3PXD7amskqarq/jH2QZ3LgmenM9To
 KhGKNS0EQHnH8gqMq6mWA2X1iouX7FZE0f+oEJJQn/y2HsW6saGYC+7DR
 fQM9NhE8UVOoCscG197toju0aih6fgOa5pJN836aVEc/P+KK/sZzB48ER
 Inoxmhpe+TZUmWolMxO6GoOhKcQw3fEA/qwerELixyxrwNG7yDltZmodT
 6hFFo9itGxX9uoL4zYVKSPyd4uIswXKga/kKdJtLIl1M4X0lZu8KeF9Cd g==;
X-CSE-ConnectionGUID: O9q3tXOpQmGg+i+5T1B64w==
X-CSE-MsgGUID: GWb2lkg5S1WGvHYUjvTLXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18723556"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="18723556"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 07:24:29 -0700
X-CSE-ConnectionGUID: nf564tkMRQ24jFYVcOycgw==
X-CSE-MsgGUID: JozOdd33R2OCMQnfs7+3Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="55621193"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 07:24:30 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 07:24:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 07:24:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 07:24:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpTR4iLq/0r+paAQr9jGTZxKdjoLofZTsMjrAhPp+oD7f4HLUX9RjofEFsVAkojYo0Xay/pi7mTSO80KsopGPYtvexS20fD7c8vd6US3bmcxfOSci5I9Fi8her5+sLEPH+1wLLCucaDnuW9t+xARSmNiiNQHjs3deYXwCsSWYBbf9AfxFyaZoDgompNdaJfH+cRrwsEa/UfNchmdmd2mm3eW9izNi9WE+kKrJuY68yKLMumXOcDtNOxUm6iiyuSLh9yvEBo9uLhuuglEQuhQVPq/f5ixjubGzQiJwEcGJA5JbKG+50rBt0sFDFCIlqo1zhci1F4W0dSRIaVnS0uJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgljUEnISB0tyXHyAZJQwVbp5hYt1/K/zCbQid+FDXo=;
 b=yozIO3w9XkoZ0vMJmJPcUeKUAc8ebA5csFKfQ6wnW1E/SYc0mirSYv31B0KQ8nkm4UKuNoU9+4ndIV19K6OVxcoML7jbLFx7Qug5vuOdCnIPNvVr2tNJ1hKDZ16+TRmvl4DjNomYGFPbpIm/twL4EJWsfviBT9zss5zMtnes8AJXHn1vM+XswyZXpP+xF3or3thlLjcH3LtXHEdXIeAm6Y0bc0qmUsOaFEirONjjN1hY9kVKUCm0vEYRL6wtLt99NZxG8fJvgReP+L+y1LKJiy1lEKTvIYHX1qjHTJf54ynbqR8pCRQ1TSv9TfDNg1tMykj2vVAvmLFSPmb+lp+7dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB8522.namprd11.prod.outlook.com (2603:10b6:806:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Thu, 18 Jul
 2024 14:24:27 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 14:24:27 +0000
Message-ID: <aa8c365c-2a2f-414f-a3ed-216781bdb21b@intel.com>
Date: Thu, 18 Jul 2024 19:54:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 0/5] tests/kms_plane_scaling: Improvise the
 scaling BW issues.
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 64479b1e-1139-42d3-f5fe-08dca7355428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlRGdys2WXRwYXZuaE9nc1VFUWRzaHlpbFJMam9HcUdnVDRsTmZaQlVyNys0?=
 =?utf-8?B?WTZDZzZHampLODlFMkFTQi9XSFJnb1pYVWZNOURHNmh0bXJ0VzNkWEhORnVF?=
 =?utf-8?B?dkFESEl4eTNuKzlrQUdML3VYNkViSVBaZEYvalBJU1lUUFJrejZZekMzVG5P?=
 =?utf-8?B?cG50SHJTN3hoMytwQVJUNkpKZG9DUzlTYXN2Q2NLNElDMjJHY21rRTI4UkQ4?=
 =?utf-8?B?bVJlY25vOVdMUUNVcjhWQXEzMU9CZmRuYzJ1SWc3K0VFa2YyNG9QK015bXIr?=
 =?utf-8?B?ajdXV3NuQzFDVzUzUHJoemJiaWhEVGhpbzhUWmJDZTVaZ09QalA0Zng5NEla?=
 =?utf-8?B?OVo4aWZlWXJTREFwU0hhMWNWTXpxUjl1SWlCamwrWXBNd0V0ZXpQMW83elRC?=
 =?utf-8?B?bVU0aTFIRGxuQXp0Yy9PVmUzMDJDR1JuOTY3MHFsNG9URytwRXFKczMzSkhR?=
 =?utf-8?B?aG5laUpvOGZMU3lLMm9LdFVFbVdHYzQ3RWcvbW5FcFY3UUdLVy9nYWRUQWVQ?=
 =?utf-8?B?QVY5eW03R1MzOFpjVnlFbzAyNFFvTkZJbUpacEFza3o5Mi96RFBUbHV4YWhI?=
 =?utf-8?B?eWhmamVJZUNueFZvN3duVW5IS0pCSFd0MnZ2T29KTUtqUlFoQ2ExWnRHRTky?=
 =?utf-8?B?blZFVUFIa2IxODQ5WmUyL0k1ZHF1c3BXc3hNTjBLVHRZK0R5YTE3QlhYeWNn?=
 =?utf-8?B?UEdmWlFQNFZlek4rajdqc285aEd6R012SW16VWZES1JUZGRHNHNlL1Ira25F?=
 =?utf-8?B?NzA0V1ExYjJJR3dhR1NISUpwRU93ZjNhanJmTUZZTWJtSkFPNnMxYlVGN3NH?=
 =?utf-8?B?VnloZVNtZ0czdHV0WVNSZkd1LzNFand6TVRhY0svQnByOXZhRWxGWFRhV1Jl?=
 =?utf-8?B?MjhQSkJQNDN5d0U5bEhndTZvT1lkR1JsQzQ1eEUrdmlTMmY1NXc4SzNSdkcw?=
 =?utf-8?B?Y3FtczZ0VXpYeEppWkFpeVhCcExVQ2UxcFpIdEkvRWdrTkMvY3MvK1VPZ2w4?=
 =?utf-8?B?SGp1dzI3clhhaTk0RjdzSnlvaitDVlZwL01pR3JTMWZYeExFbFBPaFBjQnV3?=
 =?utf-8?B?S2sxdWpud29SNFNvOHpibzhadFBCTmJEYTE2TlhCOEZndFplbytZeloxbnNN?=
 =?utf-8?B?WWYwclhiRmJ3L2VDVllhaWhnb2xzSktGVEpISGxMUUNNOW5iRzk1aVZ6M0Uw?=
 =?utf-8?B?SVp3dG9qa3JSLytlMkNaL2F2NCtwcWlySElyWElRRHYxQUZrWnAwdjdYajhh?=
 =?utf-8?B?OHJDZ2lyN2Q3Y0oyR2hqNGt0bUwwZTgrdTRnK3RSN3I4SWtydzVWTk55dHpK?=
 =?utf-8?B?alpDa0NZTlJXbVZpQnV1SWRCeTJ6cis2Ym5XYnVRRnBDdGZkeUl6eTFwOGVo?=
 =?utf-8?B?M3Q3amFvbmVSNHhldmZEdzhJcFMvTnA2NE0xSXNOUE9UektONlg5N3ZkM1dV?=
 =?utf-8?B?RmkrcTdxWjNib012dTArQTJ5Q0pISjYwNkdGSVdFZ0xFaG8zMjBXWGQwVjZ5?=
 =?utf-8?B?VXowZENPTmhFaGhZMzVmNy9ISDExWU4yWjZKdHlrWEZ6QTdKc0lwYmZUcWtB?=
 =?utf-8?B?Q0p2M2VneEdlWmY5M3J3N0IyWm9oRE1PbXZwdUtEQS84MEtBOVh5OUJrd3ZT?=
 =?utf-8?B?RFFSY29JbVp2WHZRbWlZOVZITU9xNzVsWTh1QmpiUmR3Q3dPVGIzdEg0ck1X?=
 =?utf-8?B?eC85TWpDL2wxNTFoTi9CQTlGdG90UnJuNnJxZlFCL1NONXpRdmlubnRxNzk0?=
 =?utf-8?B?T2RxY2RjT2lxSkoyNjlrVXpsRWF5N2RIYStKbVdOSG15T01VVkIweWxIcVNB?=
 =?utf-8?B?bkF6V29RMksyWmZ2MU5vZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUxFZ0dZOU5zU25hdmVnT3R6Zm9NOHM3eHRZcEwyN2pLL3J3WU5WcmF3eHlG?=
 =?utf-8?B?NVJiQmI5VDg3UmUxSHhhVmJUWnEvY29ZVE1SLzBuWHNBbVE4U1JWNU9ZeFo4?=
 =?utf-8?B?NXQxdkdFSVBXUjVEYW5MMHp1b1Y1bXdJbmFBZUo2MVhpWWx0ZDNYUFY5dUph?=
 =?utf-8?B?bytJSnFINVREZnUrM3VkblNpcmdsQVdlbEY1U1ptYTVtcW02eENBdzVRQWNq?=
 =?utf-8?B?anRpSy9uWjBITjJrSlg5Q3MyZ0ZMakxMbkdOYW9JbXc3ZklTSXdRY3BIeTMz?=
 =?utf-8?B?RXA1R2o5cGQwZjhpRVMzMW1kdlRwek5yZXNLakU4dGdYMGphUVl1Tm9DSlcr?=
 =?utf-8?B?Z3NaSVlJZm5qN0IyNmYvNi9LK29VSi8zL3ZIT09TU0VqT0MyaG9FTXFZUnBi?=
 =?utf-8?B?ZHdvR1Z3WmtRQ0xOa1prOVlDVFplNW9IMmlUZ2d2T05HUXJ3cS9rL1lLRHln?=
 =?utf-8?B?b3dzRVlVdXZNVHpsc3RNVm9oeHhJb1NNUVJQVlhXN25BZHVDQWN2R095Z1pD?=
 =?utf-8?B?UWs0VmVwalFXRHY1WldEellRYzBjOEI1K0dUUSsydy9FMHYxVE5GQXhVdGIv?=
 =?utf-8?B?aTdhMW1DWlcrZ2s1eS8xb2dnaHVoVnBEalgwdkRNZmt4T1JXaCs1WEZMR0dE?=
 =?utf-8?B?eVhZVUZTSVlpVEZVaElJRE5VMzc2V1c1RXRSWFdTdGx0aEJJVlRma3RReUNW?=
 =?utf-8?B?dWhzeDVEbktRd3JLb3pYNEwxVVpubmsvdHdiSzF2K2Rab0FtSmt1dXJFNy92?=
 =?utf-8?B?elNBN3ArcXh0U0l2ay84TmFYR2g0czZXUFRSbWYyOGlaMXpYSE1BcnppMUlt?=
 =?utf-8?B?VmlvK0h6Qkw1cGQ5NkNXY1g3Szg3aFVHNFVreDlTVEpmWGs3blUvNTNoNFA3?=
 =?utf-8?B?bmZhZjJPN1BxRVRpaFZFa0djQ0xlOHI3WUpOTzRaTUJiSk44TXMxS0hiWXFM?=
 =?utf-8?B?WURGQUF3SElrQjJkZmVOTXpLaWFiaXFrM0RUYkgzeW5XSVdscVZGanhQTjVo?=
 =?utf-8?B?VjNReVVMUUh1eDdCQnBYREhOa3JYckJyeklnUEhCd29ucnVCZFpqcjUvSkF1?=
 =?utf-8?B?dy84SlRacng1VUg4MVFDbURlQTBNL1F4SUNhQlZYdnpwVlNHVTV6Y2NOLzk2?=
 =?utf-8?B?MmtobFdFcDNVTnVCZXBFNXZPTGpBajJoN0VLT0tVOVM3T0szYXNlV2xtL2VL?=
 =?utf-8?B?dTA5UkUyWXBzMEpCR293NFlSS3pZU1VORkJtbUxsdVI3Zm4vaWNHRlFFMGNC?=
 =?utf-8?B?UjNnRitGK0JWdUppV055cENDM2NPQmxUdi9lSTgwTXFQSHNpWHJKREVPNWZH?=
 =?utf-8?B?eVlxTFRlZzVoclpROEFZNEc2MzA0Qk5RY1AvYndIeEdyUjBlNS9raC95OE5D?=
 =?utf-8?B?N01iUXhJYU1aWXNtWXlSNmdnM3RWeUZ2ckFEcGFTK2FjRUYyOGV1Z0dvSmE1?=
 =?utf-8?B?alVUL0c5RUM0UG1rZ2JQdXB6UUM5M1IvaHVPcmFYRWdXVWdkUXVJcGJvZ3VI?=
 =?utf-8?B?T3F0TldCd0JUVEs3MG1lQ01jVFkrTHpkazI0N1BEMmpFcUhLVWR0T2JvclZO?=
 =?utf-8?B?bkVOanNFVVlMUE1qaWJGMkkxSE5CelpiSWluSFRpSDNOK0N3S0VBMEs0SGJV?=
 =?utf-8?B?WG42K1FMU1J0bkt4dTk0b28xeDRGWmR4cVNseDE1bk1oMFFEdSt3VFdFSXdD?=
 =?utf-8?B?dmtSdWdVc015dXBSRGxIOVVUd3c2WmIvK00zcm15ek1LSHZRZ1Z0VzdmbGpO?=
 =?utf-8?B?MVlWTHpocFJxY0I2OTB5dzlmM1N0cFFFNGM1RkU2OE81R1ZKeDlwZFNxanFw?=
 =?utf-8?B?TVJNZjV0UU4xWUloZUpobXp3M2dCT3AyZ2FKM3pzMVo0K3hrNExHUWs3REZV?=
 =?utf-8?B?dFU4VVpDRkJvM0xRbHdKYmZELzQ2WUFDU01Qd0J4clp5YUtKbnBrbXdjTVJT?=
 =?utf-8?B?OTR0Y2dXWlRrQmxWV2VpWkpyWmdUZkczdjlNYVRaRy83d1ExVDVuL2xzSHd1?=
 =?utf-8?B?VzBPT2VVV0t4Uy9FanZQQmIzVVhJdGN5MGV6cTFPOFdva1JhTTYxd2RmRlY3?=
 =?utf-8?B?dWE3VFV1dlJtS1hjeTRzSkxtS1hxY0lhckRSTXdHZWQ5T09KMEVmdGIvR0Z0?=
 =?utf-8?B?a20zNU1QUTQ3MnRObEVCMkJ3ZVFvRjRiU1p2U1p5aktHWjM4N2hGZXk3M1hq?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64479b1e-1139-42d3-f5fe-08dca7355428
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 14:24:27.0009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGdYU4gdNnkmFvKEVbNz9SF2qGYTzqrVMBKXYGMpJYgti+SkZIND/Z2HTl6EWT1TsV0FWwXL/EW5LhnZWK/HFo648jf/b4xD+JPc8gXkAYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8522
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


On 7/18/2024 7:35 PM, Naladala Ramanaidu wrote:
> Find display mode fitting within bandwidth constraints for scaling
> operations

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>
> Naladala Ramanaidu (5):
>    tests/kms_plane_scaling: Update the single plane scaling function
>      arguments
>    tests/kms_plane_scaling: Update the multi plane scaling function
>      arguments
>    tests/kms_plane_scaling: Find display mode fitting in BW
>    tests/kms_plane_scaling: Find display mode fitting in BW for rotations
>    HAX patch do not merge
>
>   tests/intel-ci/fast-feedback.testlist    | 201 ++++----------
>   tests/intel-ci/xe-fast-feedback.testlist | 317 ++++-------------------
>   tests/kms_plane_scaling.c                | 278 +++++++++++---------
>   3 files changed, 256 insertions(+), 540 deletions(-)
>
