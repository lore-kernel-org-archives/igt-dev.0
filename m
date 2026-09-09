Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECB2C79FB7
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 14:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDB510F195;
	Wed,  9 Sep 2026 14:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJvbm2n5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7910F195
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788962701; x=1820498701;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/p9DHbZ5bPiYAWWe2to4KnRQ7I85F+OU95IxkXoERRs=;
 b=EJvbm2n5amkk9FAMfr0Ymg2Rn3digbXQWiZVuIBTBsK6fbVa3OBF1kv0
 /Fs/KNZPOyY0VP3MI2M1Hg9sKQNtQe7ZMELFvx/FeQYCGecN8HS+xUpV+
 uwF89C59FOzrCHfZGvsf/NbJ/EBeDIIkbBT2k5on+O3/g6nu1DGEldN5K
 u2ij+hm88s/4DhSMKlgE5wShErVKH/O1P4jgpra0hI5NPjhhnho2S4w5k
 1mRi1Rsee9qSx4mkFZRwwwzpyyHQapNuLPkGu6VjVaGrPYJz3P0OfXl8y
 C1sC9pltOlxBqyNwnZtkFl8OTy86uo3SeWG1QAPSTiDIbsA4jS4DvtJUS w==;
X-CSE-ConnectionGUID: y7xed9VBQoWFwFy/69Ol0g==
X-CSE-MsgGUID: R7Vy5rznQUSmwTOS+ROe1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89258635"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89258635"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 07:04:47 -0700
X-CSE-ConnectionGUID: ptxBX72sQQOvrSMzg2JVrw==
X-CSE-MsgGUID: 8/CUU8UjQvKUli84q7ZnRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="269562108"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 07:02:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 07:02:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 07:02:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 07:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYT7oGdYI55wUlj8IZuzSdfD9Jmj1D58OtNV8ESo87aw9TEQIzuTiTKFyjRXi+vMwb4a9YCVnioVFplDHzlx9gDYQGH4L33NZC3TLpMcZKiLAPauJ8rswMkg+IokEHY8jFyDVLUxWEyp5f3uR6DgJCv7AGeeKMJ77lpv7wVFVUuuLV8f9CUJpGRykrqwHHZoXHY9OCkKQ4+QzUyWndPGZfARhdNq1ZUmA5pgJy874t4799b/yEOw/B3yMFoB6dVDrGrCnBxMq8AzKZ1ArmGxYuFzLUhnpBcx0MX3a2NOLQjfOSv8dI2NhgQgBp+axOUwxs4tzJh30RQ0K4Q7sgO+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypVcTrEjtU1KuH1CHPRR9n89Dgi8mnOv8zd2ZGtGbfY=;
 b=u4tTtCMGfiBu+GGbeLQ2lanlmR5vHXz+beqbsKxNwHgzT47MkTL9z+M7XfKRUk4hI6IBSpjjRVDBoKSFBRtVBLf7eJypfW6lRPBHkLX3fbVz7WqE/z7AtFNmSZ3eksrVaQ+2SM9nFPA0BWgIZ/pDFVWMcpPuzec7Bec57RYgLz0n3pnAf5/zAPtbr+yHFybEV1DHqjvknDVDktYKce7mvuw2xn4lvewms+25+952JC3Pzr2MbeQ+gkv7dCItjF8BsRmrTiy2RY9ZXASdX4ZEnNMBjTNb4BYxvzqH3xOmN2wwaoXlWDorHr3n4ZwiVOpdt0UXQ2WFvdkRs6BEYaXeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) by
 IA0PR11MB7933.namprd11.prod.outlook.com (2603:10b6:208:407::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 14:02:56 +0000
Received: from DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd]) by DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd%6]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 14:02:56 +0000
Date: Wed, 9 Sep 2026 16:02:52 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>
CC: Jani Nikula <jani.nikula@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v5 4/7] tools/vbt_decode: parse & dump VS/PE-O
 tables for LT
Message-ID: <c5oqfpsy24xhzcpupgd55j5jyhbka7xhqdwsfdxelvzubamelt@kjyduxtu343g>
References: <20260702182619.3973788-1-michal.grzelak@intel.com>
 <20260702182619.3973788-5-michal.grzelak@intel.com>
 <PH7PR11MB6053D10692F01DA128CBA26BE7A82@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR11MB6053D10692F01DA128CBA26BE7A82@PH7PR11MB6053.namprd11.prod.outlook.com>
X-ClientProxiedBy: VI1PR04CA0138.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::36) To DM4PR11MB7256.namprd11.prod.outlook.com
 (2603:10b6:8:10c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7256:EE_|IA0PR11MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c9b2c2-d5bc-44b8-d621-08df0e7b0c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: opVRTc6iIpZfRXm/Sq+hy78hNSEv0SAdnc9Habl4VVogZ72f8ePen0/wmwb+o4IaYMjG1vNeqRPfOoF6QI15daHS7+wEiUcrbMXQwp1T59hVH9y09AcmUh0RJrNm6n8SpQZN1PzlagniPGWXX4CasW1fxLzYn6nPCmyBPBqPp/rJuUTjyH4JuP7Fz2ZHpOO9Zy+ei4wqf8wQrY4PD4v6ylQM7H3aFZmZkuQFjd80ltr9W9HbyEmqj89jUjGhrZKholL42+NQiutig8BtJFGJqnLxLs3uK1SBuf4RkvfewAx3OYMjOtcmTXhRTDmI7E+adNuwtAm0uAYM5xIVwN9f5RiUQOjm5y+xqOfsKT5J6XUBvDAmFQvTAW0+TqqHkM3mmkhJ5MtEsvqJJXFi6Ipuo2i0K4TyWbwvQ5f4RHNZdRq4KLPq9CHtEnlBnyfupX7K1oiN1QQ+PsbloA4vkn3n8NpaSLoDNwcHrh2qccYe7UqY+xH4vkxGtYPMn/nbszQCVx+CE312H1UnnmJdsuv93T5GOZGR56BHmNMMvhdzyAV7BTI2TXbXs6yRfCWiCK+twGXigArtzptM5+64bUSjxQNdjZHf/QG0kEihX9rikFHm0QlEuMzYaIeFVk87qpnhXeLv3zwvrFoQh/1rE4ZzDDgzfPwSeyBq7kdSysTNDfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7256.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU84a3pMOHNFSnViVkZsK3Jxa2VjU3VnTlJnVUw3YkR2SU5VUW1JaWFGT3RH?=
 =?utf-8?B?OWZtcWVkSENqWEl3WVEvWVpNSkVERGhoOFdocWJGYlhTQXZRR2NLdDRNOVdR?=
 =?utf-8?B?VUdZMnhha3JTdmVac0dYSWttY0QycXNLR2FLQVEvY1dWdVlXWnhNMVFPYXVr?=
 =?utf-8?B?VzRrQldvaVUwZWlTMFl5bDF5ME5uUUpoSnUwbXNCUXpmNHlhamVMM3JYWEdu?=
 =?utf-8?B?YkdPb2lqcGZFamgybmhEa1B4UVllMHVrdkV3cE9ORFJabEpHZFlvMUxQa1B2?=
 =?utf-8?B?KzJvOVh2bEFMdmVRK0YvYU9UTXBCc0R6ZzBHOVlHRG9BaVhaNXdneHU5V3NV?=
 =?utf-8?B?N0xnVGl0TUkzQzVna2plNEZ5d3dRbjdyeG1velphMnBFMVovRmVidE1MZXRz?=
 =?utf-8?B?V1BtZXhYbEZYMVNKTWROY1RuVlR1WFVqQi9rNHJwbVFXNnROZEIzQ3lwOGQv?=
 =?utf-8?B?TlBBdkI3aisxN3I1SkYwWmpFeGJrRTN0bktsVVp2YnNrWmNDMVdoQVQzMVZa?=
 =?utf-8?B?aTVNNElCS0lKWWRhWXpDRXZWdzJBR0tIaXNjVDg2L0dCRVhtMTNjc28xS1h0?=
 =?utf-8?B?bytZdmNMVm5FSEFyZmlIdHlKc25kaHlZVFhXRnl4SjBqRjhwNk1nMCticWxl?=
 =?utf-8?B?amRjWHhmUjlzWlNHLzN5RzFnOFdhd2JLcXEvSWxmVnIyaVhVdHYydjFiaUtZ?=
 =?utf-8?B?Qk1Ga0hoeExOR3hhZkc5MXVHWlU3a1JHQ3hneGlXMWJRL0w4eWZZQTFYTnV4?=
 =?utf-8?B?MTdRMmR3ZERUVHRiWkl4cEdQZXlzemNFNlUyS0tTUDFFcG1uVlpyT3NJSXZS?=
 =?utf-8?B?ZWdyU1dFYTJObTdjcSsreHQ4bkhUSDVHSUlrV3RvdXp0TU9INC9FakRSNzl4?=
 =?utf-8?B?WG5uNWZ6R0trOHJJQW55Q0F6cnRkSG5kdVZvY1p2akFxMzZoTG5ndEo1N0pw?=
 =?utf-8?B?L1Zkay9ob1dzMFM3MnBCZVhhOHVZMEZiTzFNMlk4Z1Z4b2FIRnlwSEtmUHEz?=
 =?utf-8?B?WHd1a3BoSHJxNXg5aDYzOE1heUhFNncxQWJBY0RJRFN3YkFvN21zaU5NSUF1?=
 =?utf-8?B?OXVBL3J2TWhzV1lVTXlyZlZJQzNwUGRmZFV3S2dNaWdaZWVMVWllR1pkZTQ3?=
 =?utf-8?B?djZsSFBieVlhSFBHV29XUWpKaTYrNk5SQ3E3T2hRUG1VZWNmSEVvRU1VWk5M?=
 =?utf-8?B?THBtbFNTZjZWRXZXVkl2bzJ2Yjd3bTJsZFQrSVpURmUxUEhDZDB0VXNFbFZ1?=
 =?utf-8?B?U3BpUmZjenYwdkVDVmwranpWTHUzRnFJUUpkQzNBR0d1aHhYc2xnN2VaZEEy?=
 =?utf-8?B?WEdIYUN3a2t1RDFzUFFqTFAvYVNSTGNvMkNxeWU1VHRLZVA1M3ZoQkNZeW1p?=
 =?utf-8?B?WmRmS0l4UGo4RHkyMDNzcjFCNUp3WTNlOFl2ajd2TE54QkV3SXFzNmlUY1Zh?=
 =?utf-8?B?TDRtNkpNR1lWT2N4NzhjSEhMR2UraXdNeVFwWFIyc3pZYW1MbkkveEk4WWxh?=
 =?utf-8?B?NlpUM2pQRlc3T0luTExTUCtxNi85cWFwNXJHWmN1c2MwK3B2VGFQRm9BMmdX?=
 =?utf-8?B?dVB1Nk02bWUrOERGeXJSSUJLYmRicnQrMXdDc2E5N2RBVmpGekdUa3FFSmNL?=
 =?utf-8?B?WmhwNGFsQ3QyMXlKWndHaVBIQ3VtL2c2THNWbWNUeGJDMGhrYVJ2dGhqK2FO?=
 =?utf-8?B?RTNNamJtOEVGVE1mTHBCU20zaDhzOUgwRDhJTml0d2JiQmZ6bWZtVW1tUmNu?=
 =?utf-8?B?VVBOZUQwNy9qT3VHb3dkaEFmRkEraWZ3VGZjWE5OUkxFZWlZcFZEaGY3cWxz?=
 =?utf-8?B?T3FWQmVEY2w1aVo4c3BhdUZsZWR3MzRUN1dZWWF3akxSY0t5UnltbkhRcTJm?=
 =?utf-8?B?ZlRjSlh0MGVVQ0JsZlBkbjFWK1F4SXRsTWI3YzBiUGNCMjlRWExxL285OU45?=
 =?utf-8?B?NlFaaVJGVmVkMGs0bXVkYnVCdEFIVWpoM3Z0eUtQMjJsYnY2VkttOHVURTlK?=
 =?utf-8?B?a1pYRDhicUhwdko2NmszSDZSR3FvS055WmVBZVZ0c044L0tQRk5xMkcrUnhH?=
 =?utf-8?B?bEtSbm9kOTdpS3V1TmYyZS83L2FEZWxsOWlBbEtaNGZuQ05WRjRxaGFUcDA3?=
 =?utf-8?B?RlcvOGhndlA0VVhvOW5aMjNPTXQwNy8wYmVZdkxYVnRCMlNGOW1VanFJazQ5?=
 =?utf-8?B?NE1lc0JvNk91Y20xQWhzdjJRUU5GOTlrS2FHd1kvNHRlOGFvNGxEZWFWMUlj?=
 =?utf-8?B?bDh0UUxnR0l5RktMMkxxdnFKMW1WdEhVbUt6WWhIQUxMRGZuMEZHUHBJbWkw?=
 =?utf-8?B?RHNOekY2eHVYY0hrTG11amRremZaT2lzdmplRzhZOFRJRnp2WGJNNjZIb1hV?=
 =?utf-8?Q?Bc/TAoAXj7SB69sM=3D?=
X-Exchange-RoutingPolicyChecked: dX4NbivnnHjtvpxaPkr27qX8yknrxCo2sFHAJ3Q0lLu9OATNV7CHyXfaD0j9Oy89Gs49jZYPUryG0mrRt53fSpu0Mo1f+0jAFsCTtGgtap6WufdS0lr/xMNov+IGtckeVbo+wfBWZuZNftVCGbvVpuZLmh6ITIJgCSr397KfvHFkTMV4iCe5J3o59345fXhD3O3oSweljABiCDscDXUNgXgJE0VBhGx7VDQ76Q9e/wcdHZcN1Fh760GAVlT9jIlOxO1X9jSVYt5snjdwV2JJmaBuEIW3uoNWpjAR7wWElZgpytWDYcgO9AaIosxpz+p10hcCDVoZdGYflfrV5czf5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c9b2c2-d5bc-44b8-d621-08df0e7b0c8d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:02:56.5725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azW/xwGsyZDid5NAvb2mhfAYwKfvZbjJ2aYOaPBeD4o+0trkQ/iZlxZEHHoHeUMRw68txltE1IIJlcmkUlpF3CEOYtshQBRIxtBmDXwKu8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7933
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

On Tue, Sep 01, 2026 at 09:15:05AM GMT, Samala, Pranay wrote:
> Hi Michal,
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Michał
> > Grzelak
> > Sent: Thursday, July 2, 2026 11:56 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>; Grzelak, Michal <michal.grzelak@intel.com>
> > Subject: [PATCH i-g-t v5 4/7] tools/vbt_decode: parse & dump VS/PE-O tables
> > for LT
> > 
> > Dump VBT #57 tables for LT. Add a table of strings to store each table
> > purpose. Show the affected modes on dumping.
> > 
> > Currently Vswing / Pre-emphasis Override is not supported by kernel on LT,
> > but it doesn't harm to add decoding into IGT.
> > 
> > v2->v3
> > - return 16 rows on MTL instead of 10
> > 
> > v1->v2
> > - check platform basing on devid not VBT signature (Jani)
> > 
> > Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> > ---
> >  tools/intel_vbt_decode.c | 64 +++++++++++++++++++++++++++++++++-------
> >  1 file changed, 54 insertions(+), 10 deletions(-)
> > 
> > diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c index
> > 33f8598e5f..2f3f720573 100644
> > --- a/tools/intel_vbt_decode.c
> > +++ b/tools/intel_vbt_decode.c
> > @@ -3465,24 +3465,68 @@ static const char * const vspeo_dp14_levels[10]
> > = {
> >  	"V3-P0",
> >  };
> > 
> > -static void dump_vswing_preemphasis(struct context *context,
> > -				    const struct bdb_block *block)
> > +static const char * const vspeo_lt_tables[6] = {
> > +	"UNUSED",
> > +	"UNUSED",
> > +	"UNUSED",
> > +	"UNUSED",
> > +	"DP 1.4",
> > +	"DP 2.1",
> > +};
> > +
> > +static void dump_lt_vspeo(const struct bdb_vswing_preemph *vspeo,
> > +			  int num_rows)
> >  {
> > -	const struct bdb_vswing_preemph *vspeo = block_data(block);
> > +	const unsigned int *tables = vspeo->tables;
> > +	size_t offset = 0;
> > 
> >  	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
> >  	printf("\tNumber of columns: %d\n", vspeo->num_columns);
> > +	printf("\tNumber of rows: %d\n", num_rows);
> > +
> > +	printf("\tPHY type: LT\n");
> > 
> >  	for (int idx = 0; idx < vspeo->num_tables; idx++) {
> > -		printf("\tVswing Table #%d:\n", idx+1);
> > +		printf("\tVswing Table #%d (%s):\n", idx+1,
> > vspeo_lt_tables[idx]);
> > +		for (int row = 0; row < num_rows; row++) {
> > +			int main_cursor = tables[offset];
> > +			int pre_cursor = tables[offset + 1];
> > +			int post_cursor = tables[offset + 2];
> > +
> > +			printf("\t\tPreset #%02d: ", row+1);
> > +			printf("main-cursor: 0x%08x, ", main_cursor);
> > +			printf("pre-cursor: 0x%08x, ", pre_cursor);
> > +			printf("post-cursor: 0x%08x\n", post_cursor);
> > +
> > +			offset += vspeo->num_columns;
> > +		}
> > +	}
> > +}
> > 
> > -		for (int row = 0; row < 10; row++) {
> > -			printf("\t\t%s: ", vspeo_levels[row]);
> > +static int
> > +vswing_preemph_num_rows(int devid)
> > +{
> > +	return intel_display_ver(devid) >= 14 ? 16 : 10; }
> 
> The LT PHY decode looks plausible, but it still assumes a fixed row layout and field count.
> Please confirm the row count and field mapping against the real LT VBT data.

This patch needs to be dropped temporarily. I will add it once kernel
will handle Vswing / Pre-emphasis Override for LT PHY.

BR,
Michał

> 
> Regards,
> Pranay
> 
> > 
> > -			for (int col = 0; col < vspeo->num_columns; col++)
> > -				printf(" 0x%08x", vspeo->tables[idx * 10 *
> > vspeo->num_columns + row * col]);
> > -			printf("\n");
> > -		}
> > +static void dump_vswing_preemphasis(struct context *context,
> > +				    const struct bdb_block *block)
> > +{
> > +	const struct bdb_vswing_preemph *vspeo = block_data(block);
> > +	int devid = context->devid;
> > +	int num_rows;
> > +
> > +	if (!devid) {
> > +		fprintf(stderr, "Error: cannot parse VS/PE-O without
> > devid\n");
> > +		return;
> > +	}
> > +
> > +	num_rows = vswing_preemph_num_rows(devid);
> > +
> > +	if (IS_NOVALAKE_P(devid) || IS_NOVALAKE_S(devid)) {
> > +		dump_lt_vspeo(vspeo, num_rows);
> > +	} else {
> > +		printf("Warning: deparsing VS/PE-O from devid %x not
> > supported\n",
> > +devid);
> >  	}
> >  }
> > 
> > --
> > 2.45.2
> 
