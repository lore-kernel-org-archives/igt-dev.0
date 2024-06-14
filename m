Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B38AC27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 14:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9FB10ED63;
	Fri, 14 Jun 2024 14:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOj9THzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4C710ED63
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718374833; x=1749910833;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ykrcqd6/dN1oUP9rMBgpCUYe1ailbLLy/EAaCo5raSs=;
 b=jOj9THzD1sPhhVudsgFY0MU1aTvZXT7itRhR+P6fqFHuWjqHt5fdVG7I
 uaPc5jzDwRRJBgr9hcF4aQHD/Vd7+R7RS3BxTOOqB776WBvom09QZTg8J
 Igy/AYLg0l83ApgRVQOYAoZrOEKtytIKnebdXWR6J9ZP5k680Dm0DbIgD
 zuuSPO5s2niPhzH5USwCg3ZPhjY8fUz6dhFnZtSWz7AGWi9AWmIvG1cDp
 8m/jB/5nbw/NRGVo1beaD5+fNCrZbMnIRPUWajsZqlZC049E/z5bdREX0
 lBSOGxOZ/oGYA5V6/UbmQ0qA7nA8r26jewdtaiAwWkTCbmwjtRxx1Z2ke w==;
X-CSE-ConnectionGUID: IDJnYRPYRkq2w0xfDlNonA==
X-CSE-MsgGUID: gdH2uMCLT96RDtxHNApKbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="32740184"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="32740184"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 07:20:19 -0700
X-CSE-ConnectionGUID: SZBckiXyQN25kJiviCvS9w==
X-CSE-MsgGUID: InwLD5UXSn20kstZsVWXFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="40474051"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 07:20:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 07:20:15 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 07:20:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 07:20:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 07:20:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFkZg1/GRjIuHVfYe2VMs1dwzImoFA73wXEv9jP05Q89xekRibJ+ujMz5CJtVH9mxb19tAD+jx0b4XGWi5b7CQj85jsVRrbcOCS2JBkxeidMRrc6uTdBqWGA88hUu89EVkXNBjfJ1p5+iNlWTOd4gPp4BWmkwV4TKePqrcahvtxjDcQBGR41BGqb4C/0LJwfA7bJR7kh/cx3Mw7RKbtFFIBVNMx/ZoyMGcDpvHJNqdg17BbPbwMZvjVML051Q/M4OpRWK70OqFq5VN9QUUe4saQmBJr3vKCu5bm2jY/6WxbsuYV/KmDgQVv2ue9NUzeIXD47gpKugFFSAJe/5Rzqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnuEokIIp1NG8sVsyvpI1IqhLc76QJzt6INKhJuGk3Q=;
 b=evDlXPZJXP00TuP/NnFXMhIxAdN6Ft+fPwoxY3GQgqIfLgk0DUFm0YN7VRUZUfOPpLZvxUKuLbj+2TYlCH+RVC60vcqH2H+5+Z42Lwg0lZ+rv9Pzc20rtEjA9Pfr/LNcihl/DwPh4QlcTZcj1/JQ8aEAMt8qYBmJLCxzNSHSEtxAZJ6ZqyW81H+hurWQTTvJIhFcYloidsb6Gv3lTw4b2IkvqXqIVCxoq7EG1wOeem2ghHK32IR3AbyzJM1NEDSVvtfggdQwFguiNxcYNRsibeRa2y5c/CYfDnvQQBANAOVj5nH02+HObSRTpCJHRdLpMl4vQToamDz0XB88OsSGBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ1PR11MB6202.namprd11.prod.outlook.com (2603:10b6:a03:45b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 14:20:04 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.7677.026; Fri, 14 Jun 2024
 14:20:04 +0000
Message-ID: <ce394992-ca36-4f9c-8cbd-6953825e4286@intel.com>
Date: Fri, 14 Jun 2024 19:49:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] "tests/intel/xe_gt_freq: Fix freq_low_max test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>
References: <20240614100712.38276-1-badal.nilawar@intel.com>
 <20240614100712.38276-3-badal.nilawar@intel.com>
 <20240614133722.6ok4fvliugt5pd3b@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240614133722.6ok4fvliugt5pd3b@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ1PR11MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 3632e761-b56d-4309-50d7-08dc8c7d1580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVdFQk9tdWdpb0hCbk5qdi9LNnV6Z2cwMTNxQmhGakU1ZUNGOGwxbWJ4Zk9o?=
 =?utf-8?B?ajlBTnVGVlBOVUVzVkphbXdnRjRqWkRDamRoSVlxUTVoQWxPa3duV2Q3ekxR?=
 =?utf-8?B?OWc1RXdsYWl0Zm5uUXNPdk1wWVEycWN1a1hQMk1HL1doOTF2YU5lc2JleThR?=
 =?utf-8?B?MXdwdGVaMDRqeXplZFAyVWF2SURKOGtlck5KYWZhcWlHOU1UVVFtOUw0QUNu?=
 =?utf-8?B?bUx1WGV1QnExaVJ2L3lja0F6blJuSGdiZEppV1M0R1VYY2NWcW42YTJHSEh1?=
 =?utf-8?B?eUs3d1RwY0h4a09xTThHZ1BFRUE3SXBwRFJ4bzI5WlF5NWY2Rlp0L08rRk5J?=
 =?utf-8?B?YVh3N0RIUThDT0FVd0ZjTUdsTnZYbHFOMnViR3J3Q1lhOVBzL0xnN2NQMVVn?=
 =?utf-8?B?ZFNXOHErWjR1ampuZHpWa0lmZk9pM1g3K1RzeWNUQ3ZxSW90cXhsalNXNlYw?=
 =?utf-8?B?d05CaVUxU2dCL2ZDUDh0Tld2QzJOZDBjVjY1OXVQUmZKNWQxNzZ0NEd3WDFk?=
 =?utf-8?B?MmsyNlUvcEZGOFdqNFUzSXNoRVMwYWFtQUY0MEhhQkRVUUZoZDlCNk93cm5m?=
 =?utf-8?B?NFM0azQ3bDQyR2sycmRHeE1kV25NNGtPN3pvbWE3NHlxUFFKc1o4MzlVZzZk?=
 =?utf-8?B?bnV4OUtnZ242YkJLMmpCSUJQcDcxOEFRTnZLbVBVQlNINllvK0dPTWMvTDF4?=
 =?utf-8?B?YklCNmhCRmQwZkpMMDgxWnAzdnB6Q2hVVlVSSjl2SDFVY1Z6SHpzWDl4UndR?=
 =?utf-8?B?TDg2TkFaeCtYUjJJL0FkcitDaTJ3ekN6YWlPMDZJWmg3ajZhMEZCV1lHRVlF?=
 =?utf-8?B?MDlkNmhIanhkZ09SazgvQjNJKzBTYTFZS2phZWFjZUpnREtCZkFZbDFwRlZn?=
 =?utf-8?B?a1FlaUYvbS8vcytVWkU5VHBFUVBSalhlZW1wbncwRHJod3I2WG56dHFhNllZ?=
 =?utf-8?B?QlduV0QvbzJKdUlhZkliOXhoZHowNEtpNXo2N0dNQ2RnZU1jVHU1bkd6S0d6?=
 =?utf-8?B?OXBSWjA4V2tPMjlGSXNzUlJyOHBWU0cyemNMQU5ZNjZzc3RHNXFYL0lOUFNx?=
 =?utf-8?B?Y3dkKzVqSlVZTE9JSHFFSTRLRGtjVUFvZ1RLWHlIYzhJV0ZsRmxKV3RiOGkr?=
 =?utf-8?B?bFVBU3RUMWFvWUZBbWY3ZHV2KzM0bGVpL3VkSTV0UEdFUVFhTGdOR3lXU05R?=
 =?utf-8?B?aitOa3JhTVdtVFZBRE5sM1J3UENCMkJ2N3RpdmxQQmRDajVXOHhNWkxmWTlq?=
 =?utf-8?B?VStQOEpGNXlVZmwyY1JjQTVyNHp5M0RQVFlFUng5ajhua0ZPNlBmWDd5akUw?=
 =?utf-8?B?cTNBMkRkc1YvTHZENEtta3dVbUVtenFaUy9ZZ00vcmNudTBqdXY4WFQxbE5C?=
 =?utf-8?B?RE1neVBON1Z0ckw3NW1uWkFsZkFVN0J2OXM3UExhUWxRcEpwYTNHcEdTaUEr?=
 =?utf-8?B?WWV5NHNiK2EzektWS3U1Tmx0ZGEvVFlZVTYrN055R2FobkpFcEc1c25UNzZv?=
 =?utf-8?B?ZW1tdk5MdXFDWnYrYWkvSXlLL0hJOTdTc3dPWDhsUldPTEMzc0JjdzRWUVlM?=
 =?utf-8?B?ZjVoUFZFMmdFODB1NWJJa2RlVXJ2UjJQcVFnRmVCWVY5MWlWcGtNTG91d3o5?=
 =?utf-8?B?S1EwckkxUklKL202NkoxS2FPbElQTE1MSUQ1dHRIMkdubDFiQWoxZUdRUExp?=
 =?utf-8?B?ZW5Rc3JPcWNpZFNEY0huWEQ2R1Nzek9xbFJTMGdRazhEcmFyMU5nWDY2SVlR?=
 =?utf-8?Q?+cDtcfkjsj+KXkHebU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDVhazFIaW1OdDN0eHV2ZjBSNlZyQ0NTQW5JbXF4dGV1NGd3eWdUV2M5SjhC?=
 =?utf-8?B?ZmFYem92N0h6NEdHNkpxNUJGQTdoK0YxQU1zN1EyZjVwUEJlVDlrNndhY0kr?=
 =?utf-8?B?cGdUa0hDTENKRlNPVmJEdGkvQVlmVkg1TmRnV3JOOGdkRjFLQnJjUmhydWhD?=
 =?utf-8?B?WmgwZW1BdTA3eTV1bVVFWGtXeTdUUnllOUF0MzU5N0txdUhZUmh3VEZQVVRH?=
 =?utf-8?B?ZFFtZ3lqRStYcXRQZnp6TUo1dVVvLy9uWHhLREkwN2hyVjNDNWx1NW1YYzlj?=
 =?utf-8?B?Q3VCdWdNRnRvSXhLM1VsNmhsUlplRVFWUjlPMkJHQVZZci9lTmd5TnVLN2NE?=
 =?utf-8?B?ZEV6VVJkbWFrTWtvM2Iwb004RmdBak13SzhNV08wQklYSmRmUlVBcEQrZU56?=
 =?utf-8?B?TVl3OVRNK2RHZHhhdklVSzJSbFdYa2NuZHRnbzlYLzFzVTcrSnlsTG9vMUY5?=
 =?utf-8?B?WTlyL1ZldjdZdXBrZGp2ZS9ZNWhVOHhIb0hOUWpmckE5ZkZJMWpveStCZHhy?=
 =?utf-8?B?aEhsY3FYSG5PM0tEcmorYldpeEN2Q25jR08rbFUxU1oxc25scEVxL3FKelYx?=
 =?utf-8?B?NXRlSWpqRFc5YjBQaGpVdm1YZW5PL2wxT1FhVVVUbVpJSStpZVRCN2M0OW1O?=
 =?utf-8?B?ajhFVnNQY24xZ0hBcHQ2SU0rQ0IrV2VJTHNRcEw5QmhQOTBtUmtxRWZKODJC?=
 =?utf-8?B?WlNuLzkyeE1NRE9kUDYvTnFGb1dxbTF6R1EvU01GdFpxQ0ZsUDBNUWF2bTlI?=
 =?utf-8?B?UGtpSW5HRFZDT0pTRXFxV2ROQm43eXV2b3pnbTk2QytLVStkL1dvcXZ6ZStX?=
 =?utf-8?B?cnZ6N2t4WG42cXVXWk1Hb0M0aEp6WjVHbng3RFhhUXVxWDR3d2owZHNGK21v?=
 =?utf-8?B?VHVqNzRLYStFSnF0V3NpakNnTXUzcVlJUmhNWlZaeEUwZ0VJQy9hZkYwQU5H?=
 =?utf-8?B?cEhvY1lLTDVmbmhCV3UvcW5CUHY3eDI0VFhtRVU4bGpCcVM2Tk9HK2RScE1n?=
 =?utf-8?B?N2REOTl0ay9pMHNjTkxhbGh6Y0dNbTdrUkV2RHUybE56V2dTajlsL1Z0NElH?=
 =?utf-8?B?QlRDemNZZFh0Zm9BM2N4NnpVc0w3MTZUMmtDVmtCQzZSVHAzdExsa3NWNW4z?=
 =?utf-8?B?L2VIdkh0US84V1IrdndxVWNpVjM1eDNjY0xDeXA5Q29ZTlFHL2NZRDdGclI1?=
 =?utf-8?B?dllpN2QzR2w5VktGUi9PbDEwZ2trRk84Wlo0bVVsZmtqSnlvc0FyOFExWktU?=
 =?utf-8?B?and3WEIwZ2txTk0yTVNrZ3hxZjZ1T1QwVmdjL1ZGMG05S0MzYmh5c1BOWVds?=
 =?utf-8?B?bS9QcGNZeFBXSW9HclRYeUNIWUYzcWJaSHNDSk1jVlFZOGlmL0N4bE12TSs1?=
 =?utf-8?B?RXcvaUZwQll1dzExRXBGOHozUHg3cVo0cXZMV3U5a1JxTGxrTnh4VzFnQ1Bq?=
 =?utf-8?B?V2VZeVlPMEphMExyU2E0U3hHc0RRa0lYMmRqSU5UY2lmSUVGZExBdTMxMXJ5?=
 =?utf-8?B?YTRqZ1dwdU43MjFXL1U0cFFWQ25qblU0YkhQR0w1dk5XR29XdHJnZXNRaUdv?=
 =?utf-8?B?alpsd0VKTnNpSTBwYXVoTmpYd1VNOTRxaFI2d3UrVXl1aWQ0aTh4WVhBWWFH?=
 =?utf-8?B?bE5ORkNhTjR0bC9DYUVUcVhnYjVZb1gwbnE3bVIyTEgraUdNWTFIbk5KQTBV?=
 =?utf-8?B?UFZPNTVmakRGbGZ1M3lPWWlUKzJRTnpRcjB0Wm91SHJiVWljK29FREZsSnMw?=
 =?utf-8?B?OHVVU2d5KzFxTEk2NW9US1BtYVhvem9jK3ZmZWtnTkJqdXMwMkx4SEVJYWN0?=
 =?utf-8?B?N012ZGwxcGdmZFVKS2NqOUNLbHhlMk5HY3lPcDlzM1VNbzRmTkplbDNSMnFC?=
 =?utf-8?B?bkMvK0dwYmFGVUU1OHdoWFFwV2ZjMmx6cHc3U1pnSzNhMDBseHo2QmZFcHZx?=
 =?utf-8?B?RkFOdXJNeDhISkxIbVFyL0VIc21od011eVJRZzlaOFEyNTVQdVFOQnZSOHc1?=
 =?utf-8?B?a29iTFQxdXZxMXIxcG9SNldET0JYL2YxU0FHalNaQzkwMFlVV2EvdzZEVVdl?=
 =?utf-8?B?ZFRFL3drdWFJcndyY2kvc0V2UU1SNXBpVDRQK3BSSmxYRlkxUTIzOXI0eUJE?=
 =?utf-8?B?Q2RBUVZLb1RqNExLdk9KSHp3ZTBEQzJHVWJscVhXUjYxYUtsQUV6ZjN6QnpY?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3632e761-b56d-4309-50d7-08dc8c7d1580
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 14:20:04.2468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mACz0k4sDgV+0AvkPR5CDG/zoIbk64MgqOD7W7uRz3HC4ZShQdfXyfuMEass4KPpgpftzUm64DEnsxkR+XNVPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6202
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



On 14-06-2024 19:07, Kamil Konieczny wrote:
> Hi Badal,
> On 2024-06-14 at 15:37:12 +0530, Badal Nilawar wrote:
>> Intention of freq_low_max is to validate GuC PC flow when max freq set
>> to less than min freq. Validating cur freq is enough as workloads are
>> not being run.
>>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> 
> Instead of revert and fixing revert, please send one patch
> and add there which one did you fixed.
Sure, will send one patch with fixed tag
> 
>> ---
>>   tests/intel/xe_gt_freq.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>> index 24333612b..b3562181d 100644
>> --- a/tests/intel/xe_gt_freq.c
>> +++ b/tests/intel/xe_gt_freq.c
>> @@ -277,7 +277,6 @@ static void test_freq_low_max(int fd, int gt_id)
>>   	rpe = get_freq(fd, gt_id, "rpe");
>>   
>>   	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
>> -	igt_assert(get_freq(fd, gt_id, "act") == rpe);
> 
> Why ot writing comment here why "act" frequency is not checked?
Sure, will add comment.

Thanks,
Badal
> 
> Regards,
> Kamil
> 
>>   }
>>   
>>   /**
>> -- 
>> 2.34.1
>>
