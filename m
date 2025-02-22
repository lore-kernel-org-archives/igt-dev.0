Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B40C021B3
	for <igt-dev@archiver.kernel.org>; Sat, 22 Feb 2025 00:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481C210E1A8;
	Sat, 22 Feb 2025 00:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h263qQFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8873C10E1A8
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Feb 2025 00:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740185234; x=1771721234;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RVEY+bOpChLS3MSG8ikq979XBLBWJU+E7anUSLXeIi0=;
 b=h263qQFAzYxgo94UlzqiPTQHz6JD4XnON49KJ7nmMDAe0yCuaXn1OjoC
 9/9a9AwEXK6FrZ/wY7YMgmVxZqaL1mg4vU+XBdYQ+9rfnK8+Ch6ARZhsF
 e2pY7Z15mURFQbhRhmOXP/QoD2Kuf39y+L3C2HKOVuGmVwsjh+Ax2g84W
 fSzBcgEo2qzVQFDbtM+oHzMBEO9QYD+HAZ0VWQuLISfsVc1rpUJodUba2
 s6DB+jJrGDd9f47mfThrByoAIwJYCcaDXcOESnGs/BrYWtILIcl/WWTfX
 9bqHu/D+fsqBb6KIBQxJsDRURClW4cGQaxe+aTIat5hH1Yv9hHs5FPArp Q==;
X-CSE-ConnectionGUID: Uqj14pnTSSKXI4ORGwyQIQ==
X-CSE-MsgGUID: Fuh+UgpkR9WgWN1UNCTB+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="52419676"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="52419676"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:47:14 -0800
X-CSE-ConnectionGUID: rya+uVDMT7abxq6ARfhSCw==
X-CSE-MsgGUID: TBWtjpSWR9eUJPY7ip9y+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146408583"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:47:13 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 21 Feb 2025 16:47:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Feb 2025 16:47:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 16:47:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHXa9yfKLrXby5gE+t/O54wajg3gMGHhyvG05BmMPFTjHRnKqFjq14Le44PhDtYGeqWmfLThrW8q7TiGFKU/ZaON4sEomIhOFsdLaYNTXJHEPj74h69i/ZclSxMyAsl8FdS6bubW2kxxLifj5UHvXyrLuB3353L2GXRWKmtVTFc9CkNUiSsKhbyQd+E/xm9G595OTXoKtZuC4+T2v/4dKpZlgoBR8AoeqZSUnD0CmI2G6ji8Y/8NXe/tZKumyU8zOkQ4+7/D3t3xPmUdEdAmjDNWqAcIaWiuhlWTPIQp1NFfe4yPa0UrGXuZ9SXLy/pY90ZoCB6ZIO6uvPgb5+hCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HShRnkiGZPvuGp0mYywpyODZTUcCSX0L0Diod5YLFyc=;
 b=MUQhY4jpIr9a1wEzA4luiJ3FaI2DfjT0Lxtv/5f4CfzOX3/9SIVniL0vfKxZojxqyMa1Bz3AQ+Ybme7JedCubR9OuGUOY4kcJqd8+J80q6MdQ1vcLOs+xb37vUSG1Dxiaykg4UGqjyFg8tORh94VKkQN1MDkxRCJ7xMkNkI8iTxGUSkgnjrP4P2HWErDnA3CFHb4svIhzDk7ewIvaf5IU6wV80SXNeMG1A/E5LKsr50sR6686EhSidCtEefSFRW+WHu3v1XWfPwT5Rt81AB1vMYUUDAF/T9q30yc30COU3pwS4NFw4vyASQ6DQw/giqUbWgXGBGEJJgi4VOZVMd5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Sat, 22 Feb
 2025 00:46:55 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.015; Sat, 22 Feb 2025
 00:46:55 +0000
Date: Fri, 21 Feb 2025 16:46:54 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t CI run 04/14] tests/intel/xe_oa: Use default
 exponent for some tests
Message-ID: <Z7keftB8DVM8lGCe@orsosgc001>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
 <20250218202812.1679653-5-umesh.nerlige.ramappa@intel.com>
 <85eczqom9f.wl-ashutosh.dixit@intel.com>
 <Z7kcYel9BWtxBmoc@orsosgc001>
 <85bjuuolkt.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85bjuuolkt.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:303:dc::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: c957f9ba-059f-452a-af97-08dd52da67e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFhGOWNZdXlNOGd3aDN1R1dTdENqQzFOemVLRWlrSHpCY2R6eWkxaitXNzg3?=
 =?utf-8?B?SWJVTXdHaUNVRXUwRzNRaXpvK3lNOGwwMHh6L0VFNndCZ3B6RVR2SlpaWjlT?=
 =?utf-8?B?ZEFJbE82RkhsYUoxTGtTYmF2OTlGS3RYc1RVM1B5ZjdZaFh1YmZaMWk3NFV0?=
 =?utf-8?B?WGdKKy9la0x2OW9JMzFydHc1djVRV3pHNlliU2RtbUVyU0RwU2o3bGtHemZv?=
 =?utf-8?B?bnU5eXRpcHZabnkrYTBxNjNtTHRKUk1tMWVCSGppR1ZRZ05NR1VseDJEOXAz?=
 =?utf-8?B?U0MvK3VGcFJjdzE3UGZYc1hoSVdWZXljbHhZUGFYTTVYUU5FUkt2SWNCY3h3?=
 =?utf-8?B?dnlEbk1xb21FODMwKzd3YjdOZjBBUzJKamhrajRNdkxHYUZvdkxHZGNvNlgv?=
 =?utf-8?B?TWZsNkthVFR5SDhXZUNLTzh3bldRYzBFZUh5SUFqamNUMDcxUWUrZ0NGSzls?=
 =?utf-8?B?d2dwV1JubzNNMDRDVHNpVmFVc0E3YWNSYVcrNnR5WVBCYXQwSlNHQ0xkU1Yr?=
 =?utf-8?B?S2lsUzBDb1RSZVBxUGJZS0NHaGVXNUZmQytlQWhwN1R4NlhZZmZOemloN2ZO?=
 =?utf-8?B?SFlQbVdVb2NmSmw3N3NjZE02YWNwSk1TQVZWaDVvcmNwejFWV1loR0xGNDV0?=
 =?utf-8?B?aG9UNE1KdC9LTWhtMEQrUGU4c3YvR2F6ZkswWDhzcS9RKzRwZHp3Z042TVMz?=
 =?utf-8?B?WFZVUWFPdThNOXRFRHA4aFZoU2IrVkt6dDY5aGZPc2VUV3RhWFpKbnI1YW9W?=
 =?utf-8?B?cGFTT1NkeDhHenV6eVk0NUQwRC8yN1IwcFdWZGV1T2NQdzlnRTB1MWU2M1NE?=
 =?utf-8?B?UVNUVHZBOWNyNktJalhSRUsvL3pTemNsTHpOWUNkbTJPSS9MQnQzOURlZUZX?=
 =?utf-8?B?Z1NmWGFnZ1BIMlZ1Y1BDL2tHaXhTUkFxUHV2QnRlZ2FhbE1PTmtxSXo2aDNi?=
 =?utf-8?B?NnZRMmRBWi9wUmVia1JUdnZBZStxczRPMDF5SXZaTUpNVEdhbG1HdTNwTFh6?=
 =?utf-8?B?S0VrcVBHK29tbU9VY2k0OVpsOXUxTkFnVTZ2aDJCa0dnS2hJRTRtNCtPcVQr?=
 =?utf-8?B?M1JsODRsRGxNTzFta0FxUUdueG94Z2Z1ZDFtKzRodi9pd3pxUll0VzNweDBW?=
 =?utf-8?B?ejJNRXBmbmJOWGs4dzMzeUdXRGJzRFppMFc4YVlyMTluNDh6WHpsMDZCRWJx?=
 =?utf-8?B?VzgxeFRXWGhTbXgwMjJVWnZTdU4yZFh6bmdIRWdQQ3lQbzZLZ09KR2ZUU0xa?=
 =?utf-8?B?V3VtMVVMYkhBZ0Nuby9zRDcrUlNPWjZvK3VQU2ZkODVFOW52SURUWnBEU0pY?=
 =?utf-8?B?SHYwcmdoeW5HY2drc0dud1l3RjVVeVEwZEhpbHFuekRKM3VQZ2g1M2FxQ3ND?=
 =?utf-8?B?RFhjakdVMTdjOTM5dkhiR1ptOXdMQWprdGpJSFpOWDl4bFVQM05BdjRxWkVP?=
 =?utf-8?B?ZlFVczV3YWpqclEvSGtKOTNpV1k3NUFoOHp5dTVYTnFVMGNrZGRiMHVmTkFl?=
 =?utf-8?B?amw1R20rcEVKWDFFWmxnM2lvR1lxN25ibnRyaGFMSDJwTVVsNEZXTnZocXpC?=
 =?utf-8?B?bFd0elRQVStXbnFOMk94V0p6elZ5bWFMaXJRbDlzL0ZiR25uNlhvSkV2cHpO?=
 =?utf-8?B?QTdkYlphWjJrOG5QcUU2a3FuNFoyQWQ3N2s0V001MHZycGFSazU0VDQyQVFQ?=
 =?utf-8?B?YUNEMVlHNGZTdzVmYS9ieVdDVnZDNDl4MWREOXJ4b3Z4ZzJrdm9WUXNtUlcz?=
 =?utf-8?B?aFEwV1Y2K2NUZkFoYkI2N2xWYytuL1NTREZOeEVNRjdXenhWeGs0c0FFVEwx?=
 =?utf-8?B?enh5SGdNQXNNNnZXN0hWTDJYVW5OQ3YvTHdWbmpuZ1U2elM3NlhLY2E0TnNx?=
 =?utf-8?Q?Kznl9PAkbI3Wb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnVCT042MVI0Y0cwaEEwYWNSc0lnT2xQZE9TY0xmYXh2MUw2YlN3akNsOVZX?=
 =?utf-8?B?UFpVbXAzcmlyMGpoUTcvU0tSK2hIVHdXQW1JT0dZMGhwU3VaZVFQRWxXRDND?=
 =?utf-8?B?dlRlTllScUIwdGUwMmpHTHhIU0ZYT1J2ME40eVozVWtTRjNncTFTblNEWW1y?=
 =?utf-8?B?aG1mMGRDeGlKaXFBZmVibndGaUZnR1E4L2xRSUhncm56REMwK0lDZkRKc2RC?=
 =?utf-8?B?R1lUWkZVd3FhbDRoY0UxcWlvWFZZMkQ0T0Q2d1BNY3pQWDhDcG8vbjlDcElU?=
 =?utf-8?B?bFFORE1EZGd0THRvMFpuUmpWMHBwSXZBd0xweWhGOGhHMm9yc0FaNGtkY1BW?=
 =?utf-8?B?aGl6MjNmZ25kRmpqc0hNaGpSNE05VDhYVFZ5dmZGVkNJM3BrZnN2NHFHVDNl?=
 =?utf-8?B?K0RjUVpwR2kzSk5EbjZvVW5UcXppOUdOYU5wWm02eW5EWHQva2g2ZHpiNm54?=
 =?utf-8?B?dzlKQTdOUUVEN3ZMZ0RoUE03THI1TmlhSzc2TndiRTFzcUpFOXcza2ErMHVE?=
 =?utf-8?B?NUVMM1ZpaXBTVkFwWUZMbGF1SDhrNmN1R3E1cnpjbXVoRm5TTHFIYnJQMW1O?=
 =?utf-8?B?S3Q2UVl5UE96dUdxMDRrVFlnRjNWM3FhZmRUZDRhWmVrWjZWWGlMQTY3VlVm?=
 =?utf-8?B?Vlh3eVZhbW9ML0JmTmpCNXhCOFg4MTc2WTJlQVFBY0VTb1R2M05qQURxWUFK?=
 =?utf-8?B?K0VFVVpWaFltUjlqS3F1d2hvNWczYW5uNS9kQVFmUWhXZ2ZQWFc0ci84Z2lI?=
 =?utf-8?B?RmhGdVhDbWpvcy9mY3pNa2Ixd1V2bEEyRFFYRnR2QWtEa1ZPcTZRaXBlaWZ6?=
 =?utf-8?B?SEg2ZjRyTjFpcXJ4T0pjOTZRTnY5RWlBS1RmWjBCOFl0ZHlNaXl1bzJERm1W?=
 =?utf-8?B?dDRydlhaRHluSm9kQVpveCttb1hKaXlycjVnM0dxNGxnaHR5WXZKZDZmY09M?=
 =?utf-8?B?MWZoRklmaU9HQjI3aDYvdG1xY09JSWNRaWRnZFhLMEZHWWV4SlNEa2toV1Bs?=
 =?utf-8?B?NUxQOFphT05ubm9SYTFUUHQ4YURkdXVlZnh1cFVOQVJDY250YTQ2TkNwUTA1?=
 =?utf-8?B?a0NPVVhVS1Bzc0JoZ282ZDY5eHk5eEhBUS9EMm5MOThxKzc2WVNjeWlzNGRM?=
 =?utf-8?B?Znh3U2lWZitGR2pNbWZ2aWpyUEl4SFFNdkhqWFp5a1owWlVmbVhtOFl1Mm91?=
 =?utf-8?B?ZEFnZ1crY2FSb2M2UW1rdkRzdkJtTGZUTEJ5R1hXS01vME9HZzF1OCtFdDNq?=
 =?utf-8?B?WTBuQWVsdHlIYnB4VkxvMkVpemttR1ZTbldmM2NEQXJNZEU2OXZ3dEdYUFpa?=
 =?utf-8?B?YTlZZVdoWTNKVVduRXFCSjd3c0FKVWUvUm92UzlzcVlOeFNFbmlFTkk3U3pY?=
 =?utf-8?B?UnNsOUw3aXh0c3pYNE93S1hhU0w5Sk1va1RuRWdDYUhiTmphWFlCWW1GN3Ny?=
 =?utf-8?B?dlFkMmd4cnZma1Bvam1GR29EcXNXK0dwZU91SVF2VVhGbHprb1IrWllVZTFB?=
 =?utf-8?B?NDdWN3BZTDU0M05pazZPTzlNc2Yrc1NjT3hRaGg5Qzc0Rk5ObjBOR0NicGlq?=
 =?utf-8?B?V3FEc2hLQW8yblRZa0hucFJFNFM1Wld0U3NnVXl3c2lqdng3REFYTlBadEtr?=
 =?utf-8?B?aXYxbXJiR096aE5JM2VlVjVmbURweWU0aTUrOXlQcGdkK3Rka0NDYmh5dFp5?=
 =?utf-8?B?K1loSGs2WFJmWFdPZTNsRE9DcDRRNm1VczlHYzlBZXpWejluQ1ExcWM0bzNC?=
 =?utf-8?B?Uk1wbWNNaU5lT1hCckplK2g4VUROeFdqWXRqdnRRaC9XOEFmNm5lZXhTSG1h?=
 =?utf-8?B?bWlDZFlKSEVHWUZCbEVQSlVsR29MdEdyaStuN1RaTktCUHJ4WFVGTXhRL0lO?=
 =?utf-8?B?cFBxMnlhUytwTUx5Q2QzUk1EZWdoY3RDdVg1dG1ZZ2ZpWjF3OUR3V2Vlak9I?=
 =?utf-8?B?YmE2VTRCU1FzNys2blB2VkJVNjh5UHU5L21CV3kzRm5PNEx3S0RCUGxtY2tZ?=
 =?utf-8?B?eHZGZW91d1dUUm5NeXdBNG9heHRQOTVNTURaMlRGeUM1ZFBXT3NUVUk2MUx1?=
 =?utf-8?B?SE5NVGh2dWx2U0FJb1ZtVHc0ODBZNnkyRWt5bmlaTVNaeHVGUlBYT2pydFJo?=
 =?utf-8?B?ZkpPWkhSY0gra0xvT0xHSlFLM0cyQ25FVTRqQ3VDY05zQjJCQXRkRjF1Zm5R?=
 =?utf-8?Q?ydffBo9dUc4SdX+7fypcipY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c957f9ba-059f-452a-af97-08dd52da67e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 00:46:55.6826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxfGqdgMRaFOagqDWObd2RS3G4Ic8/6lSSN5zuPpjNfcz9o9efpTrFBhG2fJHdoHsqtu1AuezIAMUFFFpxORPeVZ5yVDzkbjY5VrW9Xb6po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
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

On Fri, Feb 21, 2025 at 04:43:46PM -0800, Dixit, Ashutosh wrote:
>On Fri, 21 Feb 2025 16:37:53 -0800, Umesh Nerlige Ramappa wrote:
>>
>> On Fri, Feb 21, 2025 at 04:29:00PM -0800, Dixit, Ashutosh wrote:
>> > On Tue, 18 Feb 2025 12:28:02 -0800, Umesh Nerlige Ramappa wrote:
>> >>
>> >> Use the default exponent for below tests:
>> >>
>> >> oa-tlb-validate
>> >> short-reads
>> >> stress-open-close
>> >> mmio-triggered-reports
>> >
>> > Why? Let's add a reason in the commit message, for all the patches, even
>> > if, in this case, it might be "because it doesn't matter what exponent is
>> > used".
>>
>> That's open for discussion in this review. My reasoning:
>>
>> Other than the stress-open-close, none of the other tests actually depend
>> on the oa exponent, so we might as well use one value everywhere.
>
>Yeah that's what I thought.
>
>>
>> >
>> > Because these tests were ported from i915 I myself don't quite understand
>> > why some of these tests do what the do. So it will help if we could
>> > document why we are making the changes we are making, and, when needed,
>> > what the effect of the changes is going to be.
>>
>> There is one patch on top of this series which should adjust the exponent
>> value for all tests so that they run quickly on simulation.  Maybe I should
>> post the v2 with that patch so the context is clear, otherwise, I agree
>> that the reason for these changes is unclear.
>
>Either way, or just state on the patch something like: "this would allow
>these tests to run in a reasonable time on slower platforms".

will do
>
>Oops, should have commented on the original series, but ended up commenting
>on the CI series :/

Either should be fine. Both series are identical except that the CI one 
forces 128MB buffer-size test and also runs on DG2.

Thanks,
Umesh

>
>Thanks.
>--
>Ashutosh
