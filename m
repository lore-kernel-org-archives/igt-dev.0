Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C4DC36002
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 20:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B1810E83B;
	Fri, 21 Mar 2025 20:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1aZozY/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5839810E83B
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 20:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742590269; x=1774126269;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i1u12/Cx2Go2AiwzBKMMOp79Ji1zPc08CNqNe7QSVLw=;
 b=d1aZozY/j07TxbTwa5KTfr6Aq7slJ1rMUUQDgMArCfbQM6Up1Q+SXim8
 x4pvvCMEK2axh2b8L0KQ7zEaySJG0oF3+3B+AEOVz9EzcsCcKawRoubCO
 IBQhJA+iN1iGHI/HIgAoKBzzXblPH8arMQQ8j8Ur2stFSYgs0zvf33Xkk
 xoRxp2CKJ8CsK9yJR1T0OIdDw0b/Jv3AUIO1lHKYy1D6PnHhAUdkvMwHf
 k18egObgr1P/oRiNO417DtuLeZSEjjCczvJFna4zPsnnZFAgOhs1Gu+Tk
 4AmiN/rlPvg+ua+g7KS70iD5LIC7LVXTXSGSIS6YreJre8coEljUfco6d g==;
X-CSE-ConnectionGUID: G0Ax4LuASiK7AmjMbk4Gug==
X-CSE-MsgGUID: /gQUI6v2Rv6SkLEznTDZoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="55248505"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="55248505"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 13:51:09 -0700
X-CSE-ConnectionGUID: TDU1P1xsRzaZVk8XCEoY8w==
X-CSE-MsgGUID: Sysd4uZ2SWKVXjkZCG96/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="124453233"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2025 13:51:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Mar 2025 13:51:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 13:51:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 13:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9Q7gHk98mUFEuZ2tP7btyM+n3dPRCRNCGcGU+JWK7AOwnBRCMyJShxjIa+G5HGqtXDnvhmmSc9yH+di8+3Z3VrrwCO/CzhYhEP/79Z1Ftg1QyQA707siMV5G9mQ+dYH7bAA4ggGgksSdc/T4+5B9Tuj5thFa8jytQsQOFytsqQtIWSbo26IOEg6wUa/8n2mqgzdLdw6gpyOcEqf6VIeAtD7nu4iv0iJ2sA5pjcDOEMgee0m3V1J5vgOB4iDRBTYRi4r0QH5grAeclPFE9LagjCSsbuS19tBE/D6d3KUmi00CDwfT4wLxOpk+cAGVpQZgvOEGasTUiIEz8PuxT3Z4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xsd/VTRXMBnZofASfGRQnR3g5I1wzUgHlP65RCcyfH8=;
 b=dzHsvJnyYW+LoQqf6hapZABb28sXNbOImjOjS4qMWFzD/CWloVClnjzn5GAaJW87F6KJ9FIhjs0Iuulc0EZ3M2TsHrBdM3dZqugtbXIcT/TU29q0VKRWqFPPETi0v02U++21Ng6LuoNKqvJVAz+009VjPU2SNLYl4kqRok0LaBNio+cHNYAayha2Vi/7siWbHUeuoqVL7QelYHlZ7Z/8iqRzpeTdGThd0hs0QhvXDQE4iStOKfM7xkIyjmjk30SHWueKbb55F1lImONKwi86JtQMA8+bT7L6XW9OuOGZuJpkXV3+ijGOGSIZKLrZj/9c+c/cEl53OUf1ZyhFsS6zJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 20:50:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 20:50:51 +0000
Date: Fri, 21 Mar 2025 13:50:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t v3 3/3] tests/intel/xe_pmu: Add a test to validate
 engine activity on a function
Message-ID: <Z93RKX27VZA4sYR8@soc-5CG1426VCC.clients.intel.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
 <20250321110958.3557106-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250321110958.3557106-4-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0312.namprd03.prod.outlook.com
 (2603:10b6:303:dd::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: cadcb033-58eb-42b5-1db2-08dd68ba110b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVFCcGE2VzNOVDlGYkFJckdkMm9ERCsyaUtBN05VUm5lRFgyQ0ZOOFRsTE5W?=
 =?utf-8?B?V0VpalZwUk1MaDhiSjhXaDg1TlcxbG1xWWZxSUV3c1ZpeGhuMGdqbkRhcW5Z?=
 =?utf-8?B?WVoySGp2QWo3MGlWMWZENVk2SlZEb3RXbEp2U2cxV3NDTFRjVzNhQzhHRFJh?=
 =?utf-8?B?bE5GbVR2NDhYY0dLUkU3bUIwVHYzSzU4RmJMUXp1blk2SjRjSTAvM1RnWE0y?=
 =?utf-8?B?VTlJeEVCMzJIandXUXNSUlhSeHVUS1JUMEQ0K1NvV3BiYmZOKzhEakFtMFZP?=
 =?utf-8?B?dkRNVXpsS04xaU96S0FTa1lOM05oelhsYkxrK1ZTRXJGV0M0d05KRVNnd0pO?=
 =?utf-8?B?eUJzU1FJaWtud0EyQXc0S0MwVXY3cm9xOC9EMkpsZ3JneWF0Nmc5Y0lrRFRE?=
 =?utf-8?B?V1I3MDdFYStMQU4xS2lId1VyZ2Nyd3N0aWswa1EyOFJCenhGcnlQakdRYnpC?=
 =?utf-8?B?QU9TZVJPdkZIWmxMWm1jM1A0YW9TRm9aZUFueGFnM3hQWi9RSXNET0RkWENY?=
 =?utf-8?B?eU5tNGRRUU1EdE1sZlIvR3FsWUxib0s1Q2ZlQmlUSndxOTJpUWh5Zk9NdXg3?=
 =?utf-8?B?b3lFQWxNdk5DRlZFNnJvcmFUQXJ4YlJzVXU4SjRzREozYkdnMTVWY0d0cHRw?=
 =?utf-8?B?bmxGWDJkRkl1dHpIK0NKa242RUdZUXMrQmVjVlUvVkx0WGpnKzdqM3hacmRX?=
 =?utf-8?B?OWJ5V25iOUpJcWlocXJFRnFySjlCZjFqNnFvbEhENCs0STU2MnZIQi9ZTHVV?=
 =?utf-8?B?TWlaa0YyT2F5SXk1WXFvQ3Jlb0VySFV0S01pMXUyZnphVFNCbTdMUmJsRG1W?=
 =?utf-8?B?ODdKVGtUUk1YbDZUVUdKWUlNUkJkeUFFR0FaNktXMWN1WFltNWJCekhoRVVY?=
 =?utf-8?B?WnNwcytIWGtWcEh3WmRJaHFWM2VSaXIyU25IVS9xMkgwaWZkZHBwQXV0UnNu?=
 =?utf-8?B?dnRrOWY5RGdiZkpGdEFxMUtjVG5KdlpLeEFtblF1cW1kWWRFTWFKVXZQTXFH?=
 =?utf-8?B?WEpCcktTZDZEaDFjMVdUWmRLZjlMNnFGRTYyblZhZW80MHZFdjVtWVJFUGFZ?=
 =?utf-8?B?R1I4NXlSQ0MwckFSdTBzWG5aVjRjbEtWR2x2cUVLc2c1bWR5eiszb2pERSsw?=
 =?utf-8?B?cGtKS3B4ckJGM3hySW11MjZjcjY5QlplZEJlRi9oYTQ5NjZOVXJibGhoOHIy?=
 =?utf-8?B?cDl0SjM3WGJWM04wMmtYd0N0UEcvb1I5R0NydUEvN1pWN2FsakJBSXNJSDVz?=
 =?utf-8?B?eVBuQlVzS3owVEZKOXZ3MmtyNnVxbDlTN3A4YWZZRzlqSXRjVEpqc2FjSWhZ?=
 =?utf-8?B?SUJkSFI1NWZSUVk1aGhHdzFaMVdmaTl3RVpqa1ZIK1lKZ2NaUTNaUyt1dUNH?=
 =?utf-8?B?Z0ZHU1hVQzQ0RGlyZ0d4MEhPSm1PZ1dVYUNTcHlRMkZVWE5rWDNCMk1RSXBq?=
 =?utf-8?B?WXpnRFhBbzROLzZIbkNZUTYvQ0g5aGhxeFc0N2crSDUvWVB4TmEyN2xiTlVI?=
 =?utf-8?B?VUFJU2V5UXZxcUYrVGM0Q051aDUzbkZJazRPWmtDZ1BMcWVZcGphNTZKT2lj?=
 =?utf-8?B?RmJFYmUvQUhNb2h3YzJTRi8zbWQybkJ2VnFKeCszdksvMW53UUt2Rmt6Z1Q0?=
 =?utf-8?B?ZUY0dTMzNEhGSE5IaXgzOFZ6NXcvKzMzSmlkMm5xVG5oMllSNzBER3hSajFJ?=
 =?utf-8?B?eXl2d29zRVFmeFpQY1R4M3l0MjJyNWRycDM1UEVIVDFCU1RZODZKV1FwdGFh?=
 =?utf-8?B?cDdMQjQ5RFU5OHoxak1sRUlhc2toQzVlMitvYlB5N1l1V3FJTHkyTDYzZlBB?=
 =?utf-8?B?bk1ZWTk5aW1Ta3pYcTI0UEpJcjI0bTZqOU5JM08zbjVjeDhET0MwR1F0Z2VM?=
 =?utf-8?Q?26DFR6BjPrRop?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGhrTmtnSll3dTZ2YU0zWTVJaFJzd3ZzVkQySVBlUUpnd0R5V3RLelJPYTE1?=
 =?utf-8?B?U1FwcWgvaERaK2pFY0pCQmNPVkhNbnJ3WWdrSHV6am9KQUZiRDI5RDRFbTNi?=
 =?utf-8?B?VVA4MG5VYmNxeGhIMlFuMWVWcFBpcEhiUGhibzdSb2lsNVFnck0xeGk3L2Fu?=
 =?utf-8?B?OFhTQzJlQjlLcHJRVFVXcmRXVHo3YVN4b2luUERlVDRPNjdHZEJIT0RXdWk3?=
 =?utf-8?B?Q0RCdjFVMEJXcU1KWE1XemU4Q29IYmY2d0JqekFMeDJJSWhCbHdKVS9lWmNS?=
 =?utf-8?B?d0RheEVKMUFrOHA0YTBUZXpFVm14TVlDYnV4bitsM1B1M3IrdU5SVElrZnR0?=
 =?utf-8?B?REorYXVhZ0lnVytteVBlcTFXTU5Bekl3WHhnRXF4VURIaXprVmF4RTF1TWVl?=
 =?utf-8?B?TmVwZ1BwYmU2SS92c1FOZDdrMUpVc011ZTZuUDkyNmJmYVhpR2RGc2lPWHZl?=
 =?utf-8?B?ZWVsVGIvbFREbXdiQW1zbW1HYklWakZIY2xKTDRxcHNROEUrSWdJYkZjQ1Nw?=
 =?utf-8?B?ZjZ4TUVsSHF3R01KS3RIUEptTk9qS3VpMFJkdytXcHgzTkZSK3FXMW41N3pJ?=
 =?utf-8?B?VGlXR1hXUHRTZXpId3dORTJlemdmeklIeUNXRW5qNnhIeUJRWlYyaG1DZHhu?=
 =?utf-8?B?c3FPc294TVJJcU95Nkxxb0Nld0hZblI5dVp4T0RFbHdpMlhleVAzcnZGQW1W?=
 =?utf-8?B?RDNyUW1nbDVveXA0bldvYzQ2dlVOVnNVSTVJdDN1M1lvZGZYVHlHOHVuTHVn?=
 =?utf-8?B?YkFoMEpWWUlKSEFVaktFeEJiTno4cXlTRm5KR0tlbU1lSWF6TElXckp6MlpL?=
 =?utf-8?B?S3JWUTM2dDNKWXdzWnhVUTM2eVU2WktJYUhtZHUvZEZ5VjlyNG0zdnQycldj?=
 =?utf-8?B?ZWNaMVZFYmRKNkZhY2gwbDl1VFB6K0dWdFh6N3ppNjdSVVBMRkJLcFdXWmZj?=
 =?utf-8?B?S1Q1anhmdFdzWTRSa09nRnB6VmRtektyTWZHVTV0VlBKaVRiMVlxL1pydlBR?=
 =?utf-8?B?TGxpMm03L25mY24yNHJEMUpyd0xCa3BNN1h6U3BHQ0tQaXhuZk9PNUtjMlZP?=
 =?utf-8?B?WHBFREZER045dmwxRDRXeUdkLzhhR1hxWjFqbElMcThTcSt3YWhtdFlTMEtN?=
 =?utf-8?B?VmxCQUZvM0dBelp5ZzllQ2FKeml4anhrcng4TXVpSkVXZGJkdCthem94Y0M2?=
 =?utf-8?B?V2UreGJPZWN1Y1MzQmtxUFNJRUJGc3JDazhNZU1lSjJoMTQrdm9VeTR4R1Q4?=
 =?utf-8?B?SE5Qb21nMjRibWRvSVJ0NkI3TGUxdk54azhKNEdQeHBrRThhY1JmZngwOXNx?=
 =?utf-8?B?ZDl2VHFveEFzd2RjWFpFa0ZwL0wzRW1BRVFndDhMZ2gvMUFwQ0pzRFdRNG53?=
 =?utf-8?B?YlUxWmc3bnc1a05GOXJ3dlhZdVhOUU9HT04wNTJxSXJ4NmY0RFhISUlTa2VU?=
 =?utf-8?B?OVgyMGl1NWN1dnF4c3p3TTN2MmYwNXByejdNL21GVDhhaGIycldZd2t5cU5N?=
 =?utf-8?B?NEdVSHhXOFF3WDNMbk1ub2szSnFQZHVYTzRVNmxVdlJSK1FyRDNKK0hkS2pE?=
 =?utf-8?B?cGdna2Q1NkwvbVVCV1dJVDRiaW9SS0N6SkhPVzYwN3R1TElEbm4zOFVrSUw0?=
 =?utf-8?B?MTlkc0xqcXFwcHIySWNzU1N3enFTNzkxOVlJV0ZZWVZncWYveEpMS2tvZUtO?=
 =?utf-8?B?UlNzeW1kaEs3cG0vazlhWEliak1ycUZpTWNqaW9IZUU3VU9vT3FJazc4V1BU?=
 =?utf-8?B?N2dXdzI4RlZsaWM0T1N2OS9XY2dVUnNpbk9CWUQwanYzUlhVa08zVGExV2Rw?=
 =?utf-8?B?RkJBbVlYbldUZ1RYZlE4cU5RNkZCeWtBQm9EYWxrVzFwc09KczNGUjhXMita?=
 =?utf-8?B?M1JOaGZXa29TTlB6QXp3NkI2TGtGNHlUekdkbkc5cytWYkhDMU4wSU5BNW5o?=
 =?utf-8?B?dzV5VTUweFY0T1hmMk5CckNQazV0MGFPblU2bEVod01EUXZoeWJmWmlWU0dr?=
 =?utf-8?B?ejgzREtSMHJrSWt0Qk9vTmNHQzYwM2ZCRzVXNlJhSEgwdkNQY0pQR2RncUV5?=
 =?utf-8?B?ekt6VkIwS25sYS9Tem8rY2RucjhwMVp6ajVSeUZ5KytJSkFWa2l3WCtPTmw4?=
 =?utf-8?B?Z2d5NEVMU3A1UlpVNjlmc0tRZUo3WUV2ajRuUWlDOXorSVFRUEVibkloTEVG?=
 =?utf-8?Q?LJvnO+LZJ7psFgVIGkETys4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cadcb033-58eb-42b5-1db2-08dd68ba110b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 20:50:51.8567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42UxreyNCoxa74M6IfqdU2NFq/Ttyy1iyKQTxNvlc6xK6ZjdB8KujM+aEpxCxEX8gRe3DAYvqVTqbNZvXo8zaYSCio76VP3oMO0gEdvRtZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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

On Fri, Mar 21, 2025 at 04:39:58PM +0530, Riana Tauro wrote:
>Add two tests to run workload on one function at a time with different
>scheduling policies. If sched-if-idle is set to true, then the functions
>use the execution quantum even if idle
>
>v2: add additional test for sched if idle (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 85 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 9a1f9b39e..5aa3ea332 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -29,6 +29,7 @@
>
> const double tolerance = 0.1;
> static char xe_device[NAME_MAX];
>+static int total_exec_quantum;
>
> #define test_each_engine(test, fd, hwe) \
> 	igt_subtest_with_dynamic(test) \
>@@ -262,6 +263,76 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
> 	}
> }
>
>+/**
>+ * SUBTEST: fn-engine-activity-load
>+ * Description: Test to validate engine activity by running load on a function
>+ *
>+ * SUBTEST: fn-engine-activity-sched-if-idle
>+ * Description: Test to validate engine activity by running load on a function
>+ */
>+static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int function)
>+{
>+	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>+	double busy_percent, exec_quantum_ratio;
>+	struct xe_cork *cork = NULL;
>+	int pmu_fd[2], fn_fd;
>+	bool sched_if_idle;
>+	uint32_t vm;
>+
>+	if (function > 0) {
>+		fn_fd = igt_sriov_open_vf_drm_device(fd, function);
>+		igt_assert_fd(fn_fd);
>+	} else {
>+		fn_fd = fd;
>+	}
>+
>+	config = get_event_config_fn(eci->gt_id, function, eci, "engine-active-ticks");
>+	pmu_fd[0] = open_group(fd, config, -1);
>+
>+	config = get_event_config_fn(eci->gt_id, function, eci, "engine-total-ticks");
>+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>+
>+	vm = xe_vm_create(fn_fd, 0, 0);
>+	cork = xe_cork_create_opts(fn_fd, eci, vm, 1, 1);
>+	xe_cork_sync_start(fn_fd, cork);
>+
>+	pmu_read_multi(pmu_fd[0], 2, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	pmu_read_multi(pmu_fd[0], 2, after);
>+
>+	xe_cork_sync_end(fn_fd, cork);
>+
>+	engine_active_ticks = after[0] - before[0];
>+	engine_total_ticks = after[1] - before[1];
>+
>+	igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", function,
>+		  after[0], before[0], engine_active_ticks);
>+	igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", function,
>+		  after[1], before[1], engine_total_ticks);
>+
>+	busy_percent = (double)engine_active_ticks / engine_total_ticks;
>+	exec_quantum_ratio = (double)total_exec_quantum / xe_sriov_get_exec_quantum_ms(fd, function, eci->gt_id);
>+
>+	igt_debug("Percent %lf\n", busy_percent * 100);
>+
>+	if (cork)
>+		xe_cork_destroy(fn_fd, cork);
>+
>+	xe_vm_destroy(fn_fd, vm);
>+
>+	close(pmu_fd[0]);
>+	close(pmu_fd[1]);
>+
>+	if (function > 0)
>+		close(fn_fd);
>+
>+	sched_if_idle = xe_sriov_get_sched_if_idle(fd, eci->gt_id);
>+	if (sched_if_idle)
>+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>+	else
>+		assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
>+}

Test looks good. With the comments in Patch 2 addressed, this is:

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>+
> /**
>  * SUBTEST: gt-c6-idle
>  * Description: Basic residency test to validate idle residency
>@@ -324,6 +395,8 @@ static unsigned int enable_and_provision_vfs(int fd)
> 	for (vf = 1; vf <= num_vfs; vf++)
> 		igt_sriov_bind_vf_drm_driver(fd, vf);
>
>+	total_exec_quantum = pf_exec_quantum + (num_vfs * vf_exec_quantum);
>+
> 	return num_vfs;
> }
>
>@@ -371,6 +444,18 @@ igt_main
> 		test_each_engine("all-fn-engine-activity-load", fd, eci)
> 			engine_activity_all_fn(fd, eci, num_fns);
>
>+		igt_describe("Validate per-function engine activity");
>+		test_each_engine("fn-engine-activity-load", fd, eci)
>+			for (int fn = 0; fn < num_fns; fn++)
>+				engine_activity_fn(fd, eci, fn);
>+
>+		igt_describe("Validate per-function engine activity when sched-if-idle is set");
>+		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
>+			xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
>+			for (int fn = 0; fn < num_fns; fn++)
>+				engine_activity_fn(fd, eci, fn);
>+		}
>+
> 		igt_fixture {
> 			igt_sriov_disable_vfs(fd);
> 			/* abort to avoid execution of next tests with enabled VFs */
>-- 
>2.47.1
>
