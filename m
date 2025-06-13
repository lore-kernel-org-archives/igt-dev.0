Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E45C61DB2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 05:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1569910E0F6;
	Fri, 13 Jun 2025 05:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbHLQd2P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1308710E0F6
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 05:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749793077; x=1781329077;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=79J9YP5zxlfa9YgbqPsjJjiHWS+kgjWdjprVVtqm0xo=;
 b=dbHLQd2PaYH4wIQOXIZmKd9XJiMSNxiDMMzXEOhj9k2LN68XVY5L8wKh
 YMwjrnBu27oSrYAEZXo8DL4qfo3whrDBEY+EozOlX/udfmg6OD83Qo6V7
 dZpDGXu1hMQC7uIG5kS+HMojXAigw1YcaZKzpixGMcKukfTCy4wv/DhMU
 tr53rbPPP4K9KPw2Mno38ZcU5oeAPWw3YlEVfdDX1TtCzpUi4p7uRoyG0
 8f29P37aZy2h/PoyJs5F1PkhPL8VJZWGGR14VIpy3pZyENVrqeyuWuxgM
 yDbPHdCszepUooNXCInxI3MufXnBV5L+Ei46xpkU5P2YCPTQiCNhZSA8Q g==;
X-CSE-ConnectionGUID: QTfLmAh4S4uUqXxjJLE9pg==
X-CSE-MsgGUID: QRJhNIygRfq44Zb7mZjwlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62652790"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="62652790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:37:57 -0700
X-CSE-ConnectionGUID: A/F253awRImjLQlnBs0w/g==
X-CSE-MsgGUID: 8vzJaJ2HTCKx+pj8HMUmLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="148616215"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:37:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 22:37:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 22:37:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.87) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 22:37:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhlSxY3CpYnzR7TKjUQVMsXAlocLiVWMMOXk9mom1peKp3cJVl8La6Ei8Xn4bz5EM0UpDULSDJPIQMHcY6XI5/agiu1bck5x0ZGkTiRN2Qhw040wCtofpBq/7ePcXoNc46Wj7Arzv362zZUT1uMq6AKkWDFZ/XGYwKlUIUmQ8L0zMfX8jCO7T7Q1FpO0UljllODb8aYgOoB8WThV3+KfnjsSroIYjpftklT48YOias+DhqDQJqb7OU0QhVa149onwaNz6WPtxUWFJvBWPTZgxuTWBBz9CSFKPvE05TfYGLGcQg11IzvzpdX6rlapLHgDIyLERoMDMXLOMBw/8Aov9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09MgwaN4WO2u6xpGTiFD1TxrfHeTVH1g/QbotGY14gw=;
 b=XuQZCNZG6LuFozM5mubdauPzRLeROR0gm9vOzBkUTDSeX/i+VNeV0HBCXk10RINauCbxpxyNJcEHQkS3qNadhtzBytdChg08FQGjJ1ApgTAd+7Z0/IVXGWEo57SIHIIzrizszc1a5waWFAKKyzQUNhWlsg0XEOBjfbjClhsDHjzt2Uzs3VO+pGw93VShAH5C25bBR3g0A7cqD/uDd6XT/Jm+qfHEZcHfPjshGvkIH1c4z0NqRTI2Hw2qw0iI3rhizYMMKKwIgkcOqenBY7oqzvgR99nxaMQm94uvtAmVnO9TsUe8I6etPo72e33QnXVCE7+gGtBW17kZC7qzgOj6Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Fri, 13 Jun 2025 05:37:53 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 05:37:53 +0000
Message-ID: <c5ca37f5-643e-414f-be22-8c27db000ac4@intel.com>
Date: Fri, 13 Jun 2025 11:07:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/5] tools/gputop/xe_gputop: Add gputop support for xe
 specific devices
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>,
 <umesh.nerlige.ramappa@intel.com>
References: <20250611152137.1858240-1-soham.purkait@intel.com>
 <20250611152137.1858240-5-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250611152137.1858240-5-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 287c0c3b-4640-443e-d5cb-08ddaa3c7103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MElvUVpXWHpnUndGdm1iVEk5bFJxL25tNWZ3emhuUHBpTjZqMnFIL0JiVE9U?=
 =?utf-8?B?UVFpc2cwb3V2MUt6Z2lSUXlLbFNMVHNvZCsyeUVUb0V5YUYwMkRZWllJeURR?=
 =?utf-8?B?cWlYU3g3ZGJiSEcwUG9LaEk3Rlg1bmkyNVlrQmwwWDN2WXVONExRRzlJa1BV?=
 =?utf-8?B?TlorZW1GWk4vdTk0NXBsOVVIMzVWenRLVzhYZWRJRjNKeXF0Ui9BWXRrSkhF?=
 =?utf-8?B?T1Z0UTl6dU9rTjRpMTE2anZtbUlMbVlrVFFNSEdXQklzYjFWY1EyZE8xRWVi?=
 =?utf-8?B?SHRYZnlISDhxcDVFN25KVUtTQjF0ZHdBY0ErR0xMaVRtdGVtSGQ1SitlM3A1?=
 =?utf-8?B?c1RoVEg2MEttMktwTFJFSnBkN3g4NTcxbXFkOTlxU21ZdWhQaUxWZkk1Nmth?=
 =?utf-8?B?UEpvaUZnS1IzTjdNbyt6MHFPZnpEbnRZNis5TjlKWkVKWG12Rm5VeGtyUXNF?=
 =?utf-8?B?OEpqWVZZYU1kOEIyOXRsdzJEaFpHTlhTNzZiTmxZUU5xMkJEb0t5ZlhpVXBk?=
 =?utf-8?B?emFkOCtvak44bGdIQzNNMVM4cVpXOGZrV2g5eDZDZTZyN1dlWEFYcnd6R2cx?=
 =?utf-8?B?V2NlMjZNKzNPNXplSkJVNTI5NEliT3dZbUY2eG9Da0psV0ZDNUkwUnMrTEJ5?=
 =?utf-8?B?eWRrSUszem5jWmxlSlYzdnZlZzJ6aERzRW5YVHlMcXVHRFBYRktRdzVkeHF1?=
 =?utf-8?B?NW94T1FLVjJWK01nNncwbE1FcGlieDVHSUlqUm1VcTh5eTU5N3hURklXWEhJ?=
 =?utf-8?B?NldEUENsY3RzcnJOTGdmS3M0c1drZVJKRUY4TENIZ2dHRm5YbDNJcE1ST21a?=
 =?utf-8?B?QkNkREFrV3FyUVZ0VFJSdXpxUm15a2ZxZjFna0FVQUplRysvTHU3ZURFOGxK?=
 =?utf-8?B?WC9YQmlnTG5Qd2pQZkp2bW8rTm9ETmJZejFxSnJaNjJDOW4zaEpWUlkvZ1JE?=
 =?utf-8?B?bFFQQjRGQk1RZjdQaS9DZlcyYndGRVRKY2xpT05HZWVmSEFXazlGVW8rRGM0?=
 =?utf-8?B?SGg2Y0JQbTZVTHl5bUZabHdZTW5peTBuSCsza24wajhUK0dOM0NHWEFTbVF3?=
 =?utf-8?B?U1NOZzM4U2MvOElLeXNpQkNDaUFjOTVwU1AvbnpaaXVES1NyQXdKdzZhRVQ4?=
 =?utf-8?B?eVhGajNLcDh5RStZY1ZrZnExTHhGSCtGQ1BRY2lwTDY1QlMwQlBEK0JYOS95?=
 =?utf-8?B?SmFVL0hYeXoyS3RZOForbzVrN05GbzExMzZCaDN5Rjlza2FsZDMydmdBTlVI?=
 =?utf-8?B?ZENlbDBEUENveW42THp6ZktuQUNHVm96c1kyRE1PT3VjdEhNb2tDdTM4bS9J?=
 =?utf-8?B?NStRMGdhMnUrNldvcXA0ZGlBdzloRERIOWdnWG04ek8rQmR4NnkzdFNsOENu?=
 =?utf-8?B?S0tBL0lkc2p6VFJyVzNnZXV5ZUxYY3YxQUNqeVF3T1MydjRpTEswY0I0UFRn?=
 =?utf-8?B?bzZKRXdKdFNNZnVvTmxuUFVteGRpMVlDUnl3WHY0SHU1YmxXQzI1eUpNL3VR?=
 =?utf-8?B?OWpqRHI1TFh4T0lEdTFINUhFWTlOU002Q2YzYi94RUFUb0JQUS9PMyt5bzlX?=
 =?utf-8?B?anM1a0R5ci9GdGtxaVA3S05IQVhhMlRHWEIyUjRhUkM4VWdrOFNqbXl3RThZ?=
 =?utf-8?B?NndhakdHQzU5eVdIU0NZUUd6QlJjUm1PQWR2T3EzWktGTmIxY3NCTG56ZWVJ?=
 =?utf-8?B?MjNOYUpvUVh3Wm5GTWNVTVpVTlZvZHJmZ0pwazlrTGJ1VitGR2U5cnd6NnFv?=
 =?utf-8?B?bWE2dUcyaTZ2S0l0UnVDa0JCYlVpTkF1aGVEL29OWGdWOEFmekFXaFNhUXU0?=
 =?utf-8?B?OEtxY1Exb1BFek8xdVllK1d4ZEJ6TUZxUDg3OEhidGh4QTNSS2hwRmU5NVdj?=
 =?utf-8?B?dnJFSTJFeWs0TnFwVENrOVV1STViWk9uK3RiQmNFSGF1a2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0UveXF5MW0zcjhQVGxTdlM3SEZvRFVDWEppMDBQSk12UGkxOEgwNmpFeWtk?=
 =?utf-8?B?T0ZwM09OMHRGdmcvajR5SG1HQnU5ZVZYQ1JVNHhEYmtiazZDSGltQTY1VitQ?=
 =?utf-8?B?WldEZndFMDFkcklxNk44SGh3N1c3LzZLVHd6ZFRYam9kT2ZOY3FzWHZyRVdu?=
 =?utf-8?B?TWdzMnhWY0tnbVZscHU1Y2F6VG5rdWpZMzluM3JwUi95R0hKdXhFc3RRSVVw?=
 =?utf-8?B?VWZOSVo1KzN5R3lLMloweWFlN1VzZFc0aU1oWWVES3oxUHd2MjErRzFmaG5O?=
 =?utf-8?B?dnJLRVZJVVBHOVNKemRha2JlN3F4QlFXK2ZnaFh1OFFpbTFudkh0clN1ZndI?=
 =?utf-8?B?N09BU2wyekZzeStNa0VoS0ljUkhwalFXVDY3NmVlUko2MFZ0TDhhNUFGdCs2?=
 =?utf-8?B?UHFMN3U5NEJlbjRjTm5WZXdGSlBzQTdxQ3dpSUczUXU0WVN0Mk5qTjJOMlhw?=
 =?utf-8?B?OUVPNS9QN0VaZmxhbE50ek56RlkrSHFzNmxSTVVuZkRpR0dmSVkvM1A0cmlh?=
 =?utf-8?B?RU1neFRscUhiNHNFOURJMFRtdlVSOHFoN05CWTgvMnpLRmI5S3hLRHZqbkox?=
 =?utf-8?B?Y3ZwdFA1TUlSd3h6eTZFZVAzNkZnWmQ5ZW9TWGFkTU1YR0JnOFVPTDdSaURv?=
 =?utf-8?B?MXB0YlF3VUhBellwQmEvTG1TSHFoT0hyN2pMMnUzMzVLRUlwWGNSRXF4SzE4?=
 =?utf-8?B?M01sR0xlSFgyNmFIbWxHbmZTRnJIc3BiNEZ4WXhQL1RuNm9sbjhoeWpVK0hX?=
 =?utf-8?B?UzMrd0ZVdDdtc2M0ZzZlV3NjZmF3WkVKVEVRVzFBOXlPa0JaSUtORGt3b2RS?=
 =?utf-8?B?UTRheTNRU0YzbXhBKzVhREg5ek9aRGdRY2ExQWVhbzRMSW1xZVFad2VjUzFH?=
 =?utf-8?B?bFNaa3VZZFBBLzMvazlnQ3VTM1haZUN6NHkyUk0wbWxNYitINFFPSUZETEtG?=
 =?utf-8?B?ZmNnMU9jZW1wUWR4WUhNQTMzcE81QWFXQ3hLT0NvUS80U1JhNzlxalpFTm9x?=
 =?utf-8?B?NTFNV094Nm44cm1DREQyY1NWazhLL3psL2NGejFNUU9oeTMrQTN0OXg3UFg3?=
 =?utf-8?B?bWw4S08vN2NOMk9qYzA2V0NwR0ZjaW5EOVRSS3EwaVh1NmVUV2w0MkVjRnY0?=
 =?utf-8?B?UDhkUE5zWWN0WDVqWjVlMGg4RjJPUTdSL1FlSDByTU84MmJTcjlqTmtBb0lT?=
 =?utf-8?B?bmZyMFN5SngzUzNSMFpjdzR1UEhPZ0NkY1c1OUhvb0JrL2lFUmk2anBmNnkr?=
 =?utf-8?B?aG9kNE5NUFA0ZXJXQ3FOeTV4OE9IQk9OcVlHeXpxaDZ5Z3Z3cmRKeUg5SU9v?=
 =?utf-8?B?UTcwd3dqYXRoUGFhK1BrYjdzUjFILzdHRmhYN1Ewd28zQnZRUkdMclhOeGhO?=
 =?utf-8?B?dXl0T0ViczRrQk1tdGV6bG96TG96SFRoZXVXUW50ZjhWZUJ6SE9neCt0eW1u?=
 =?utf-8?B?MVpzUmpvZVR3MnhuZlJBcVVDQzJWY3lHL2IrNnpoVmpXbGN3b1crR3l1NVpS?=
 =?utf-8?B?MC84SWFjWm9nVGdzL242YXlldVQxK1Fka1JyeVlUOEtkcE1nZ2xIdlJNK0k4?=
 =?utf-8?B?aDRMZWxKelpMVC9XemVHYm4ydis4N1NPTGt1b1lMaTBja2xsNEVJVk5UNUor?=
 =?utf-8?B?MzdlM293NzRUL1VzV1ZIRWJVTzF1RDNTL216WkxIWDVFYzhXTVJMUXNjQjhj?=
 =?utf-8?B?OEZNUlNOdlVtZWNRVHJ2WTY4OWIyRExjbndYTjI2cng5RFE3cExYYnBRbGRT?=
 =?utf-8?B?MzRmeFlJUkZaNTNXaHBuQXJERk10SU1jTGh1Z25ucExBRkk4VkNuRmo2NXJv?=
 =?utf-8?B?ems1cm1vUlVVa2JqdGQwZlFmakUvU3ExQy9EK1Zjd09rdU80WEhRWjhzVVY1?=
 =?utf-8?B?L2pqQjRucXBHMXVhVWFTdmRRZEpoWDVaZk9JaGlyMW9sZEQ3cVNydG92Rmdv?=
 =?utf-8?B?d1F0dUU0M1hVQ1Bxbndvdk9lUTg5SlozM3BLUmdVV25TS2F4REs0K2JEbGMw?=
 =?utf-8?B?cFVDc2gyQVM2SnhLRnU3eHRtZGNGV3RYZDlORkhZdnBRdUpqeElndVBETi9R?=
 =?utf-8?B?bldIWVhvKzZ0N01GMWhGQ2cvNm1KSjAyLzBhTmJXUUJpdU5qY1pQY29Vemc0?=
 =?utf-8?Q?nOORPvmFSt0D7axG6vRusaSTk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 287c0c3b-4640-443e-d5cb-08ddaa3c7103
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:37:53.1819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oj6TxhP5mGeUSreFOZWXl5inT/3+TjA3r1p0ZPSKgqotD8ucJpcdlF0B9XNEyIczRDLoqtqKclXwHMBjv/SX7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
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



On 6/11/2025 8:51 PM, Soham Purkait wrote:
> Add gputop support for xe-specific devices. Separate
> driver-specific code into respective source files.
> 
> v2 : Fix for refactoring GPUTOP into a
>       vendor-agnostic tool. (Lucas)
> 
> v3 : Separate commit. (Kamil)
> 
> v4 : Headers in alphabetical order
>       Engines memory allocation at
>       the beginning all at once.
>       Removed PMU normalization. (Riana)
> 
> v5 : Refactor to eliminate redundant
>       and unused code segments.
>       Fix for proper resource cleanup. (Riana)
> 
> v8 : Allocated card structure memory inplace and
>       accordingly modified the clean up code.
> 
> v11 : Loop optimization in xe_populate_engines.
>        Removed short_name.
>        PMU fds are closed on cleanup.
>        Removed unnecessary comments. (Riana)
> 
> v12 : Cosmetic changes.
>                       (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

Looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
>   tools/gputop/xe_gputop.c | 378 +++++++++++++++++++++++++++++++++++++++
>   tools/gputop/xe_gputop.h |  61 +++++++
>   2 files changed, 439 insertions(+)
>   create mode 100644 tools/gputop/xe_gputop.c
>   create mode 100644 tools/gputop/xe_gputop.h
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> new file mode 100644
> index 000000000..1585f76e1
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.c
> @@ -0,0 +1,378 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gputop.h"
> +
> +#define engine_ptr(engines, n) (&(engines)->engine + (n))
> +
> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct xe_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "Video";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +void xe_clean_up(void *obj, int len)
> +{
> +	struct xe_gputop *dev = (struct xe_gputop *)obj;
> +	struct xe_pmu_counter pmu;
> +	struct xe_engine *eng;
> +
> +	for (int i = 0; i < len; i++) {
> +		if ((dev + i)->card)
> +			free((dev + i)->card);
> +		if ((dev + i)->eng_obj) {
> +			for (int j = 0;
> +			     j < ((struct xe_pmu_device *)(dev + i)->eng_obj)->num_engines;
> +			     j++) {
> +				eng = engine_ptr((struct xe_pmu_device *)(dev + i)->eng_obj, j);
> +				if (eng->display_name)
> +					free(eng->display_name);
> +
> +				pmu = eng->engine_active_ticks;
> +				if (pmu.present)
> +					close(pmu.fd);
> +
> +				pmu = eng->engine_total_ticks;
> +				if (pmu.present)
> +					close(pmu.fd);
> +			}
> +			free(dev->eng_obj);
> +		}
> +		if ((dev + i)->pmu_device)
> +			free(dev->pmu_device);
> +	}
> +}
> +
> +static char *pmu_name(struct igt_device_card *card)
> +{
> +	int card_fd;
> +	char device[30];
> +	char *path;
> +
> +	if (strlen(card->card))
> +		card_fd = igt_open_card(card);
> +	else if (strlen(card->render))
> +		card_fd = igt_open_render(card);
> +
> +	if (card_fd == -1)
> +		return NULL;
> +
> +	xe_perf_device(card_fd, device, sizeof(device));
> +	path = strdup(device);
> +	close(card_fd);
> +	return path;
> +}
> +
> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct xe_pmu_counter *pmu, int *fd)
> +{
> +	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
> +
> +	if (fd__ >= 0) {
> +		if (*fd == -1)
> +			*fd = fd__;
> +		pmu->present = true;
> +		pmu->idx = (*cnt)++;
> +		pmu->fd = fd__;
> +	}
> +
> +	return fd__;
> +}
> +
> +void xe_gputop_init(void *ptr,
> +		    struct igt_device_card *card)
> +{
> +	struct xe_gputop *obj = (struct xe_gputop *)ptr;
> +
> +	obj->pmu_device = pmu_name(card);
> +	if (!obj->pmu_device) {
> +		fprintf(stderr, "%s : pmu_device path returned NULL", card->pci_slot_name);
> +		exit(EXIT_FAILURE);
> +	}
> +	obj->card = card;
> +}
> +
> +static int pmu_format_shift(int xe, const char *name)
> +{
> +	uint32_t start;
> +	int format;
> +	char device[80];
> +
> +	format = perf_event_format(xe_perf_device(xe, device, sizeof(device)),
> +				   name, &start);
> +	if (format)
> +		return 0;
> +
> +	return start;
> +}
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct xe_engine *a = (struct xe_engine *)__a;
> +	const struct xe_engine *b = (struct xe_engine *)__b;
> +
> +	if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
> +		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
> +	else
> +		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
> +}
> +
> +void *xe_populate_engines(const void *obj)
> +{
> +	struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
> +	uint64_t engine_active_config, engine_total_config;
> +	uint64_t engine_class, engine_instance, gt_shift;
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct xe_pmu_device *engines;
> +	char device[30];
> +	int ret = 0;
> +	int card_fd;
> +
> +	if (!card || !strlen(card->card) || !strlen(card->render))
> +		return NULL;
> +
> +	if (strlen(card->card)) {
> +		card_fd = igt_open_card(card);
> +	} else if (strlen(card->render)) {
> +		card_fd = igt_open_render(card);
> +	} else {
> +		fprintf(stderr, "Failed to detect device!\n");
> +		return NULL;
> +	}
> +	xe_device_get(card_fd);
> +	engines = malloc(sizeof(struct xe_pmu_device) +
> +			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +	if (!engines)
> +		return NULL;
> +
> +	memset(engines, 0, sizeof(struct xe_pmu_device) +
> +	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +
> +	engines->num_engines = 0;
> +	engines->device = ((struct xe_gputop *)obj)->pmu_device;
> +	gt_shift = pmu_format_shift(card_fd, "gt");
> +	engine_class = pmu_format_shift(card_fd, "engine_class");
> +	engine_instance = pmu_format_shift(card_fd, "engine_instance");
> +	xe_perf_device(card_fd, device, sizeof(device));
> +	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
> +	if (ret < 0)
> +		return NULL;
> +
> +	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
> +	if (ret < 0)
> +		return NULL;
> +
> +	xe_for_each_engine(card_fd, hwe) {
> +		uint64_t  param_config;
> +		struct xe_engine *engine;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> +			| hwe->engine_instance << engine_instance;
> +		engine->drm_xe_engine = *hwe;
> +		engine->engine_active_ticks.config = engine_active_config | param_config;
> +		engine->engine_total_ticks.config = engine_total_config | param_config;
> +
> +		if (engine->engine_active_ticks.config == -1 ||
> +		    engine->engine_total_ticks.config == -1) {
> +			ret = ENOENT;
> +			break;
> +		}
> +
> +		ret = asprintf(&engine->display_name, "%s/%u",
> +			       class_display_name(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engines->num_engines++;
> +	}
> +
> +	if (!ret) {
> +		errno = ret;
> +		return NULL;
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct xe_engine), engine_cmp);
> +
> +	((struct xe_gputop *)obj)->eng_obj = engines;
> +
> +	return engines;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	len = read(fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +void xe_pmu_sample(const void *obj)
> +{
> +	struct xe_pmu_device *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	const int num_val = engines->num_counters;
> +	uint64_t val[2 + num_val];
> +	unsigned int i;
> +
> +	pmu_read_multi(engines->fd, num_val, val);
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->engine_active_ticks, val);
> +		update_sample(&engine->engine_total_ticks, val);
> +	}
> +}
> +
> +int xe_pmu_init(const void *obj)
> +{
> +	struct xe_pmu_device *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	struct xe_engine *engine;
> +	unsigned int i;
> +	uint64_t type;
> +	int fd;
> +
> +	type = igt_perf_type_id(engines->device);
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		engine = engine_ptr(engines, i);
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
> +			       &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
> +			       &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +	}
> +	return 0;
> +}
> +
> +static double pmu_active_percentage(struct xe_engine *engine)
> +{
> +	double pmu_active_ticks = engine->engine_active_ticks.val.cur -
> +				  engine->engine_active_ticks.val.prev;
> +	double pmu_total_ticks = engine->engine_total_ticks.val.cur -
> +				 engine->engine_total_ticks.val.prev;
> +	double percentage;
> +
> +	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
> +	return percentage;
> +}
> +
> +static int
> +print_device_description(const void *obj, int lines, int w, int h)
> +{
> +	char *desc;
> +	int len;
> +
> +	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
> +		       ((struct xe_gputop *)obj)->card->driver,
> +		       ((struct xe_gputop *)obj)->card->pci_slot_name);
> +
> +	printf("\033[7m%s%*s\033[0m\n",
> +	       desc,
> +	       (int)(w - len), " ");
> +	lines++;
> +	free(desc);
> +	return lines;
> +}
> +
> +static int
> +print_engines_header(struct xe_pmu_device *engines,
> +		     int lines, int con_w, int con_h)
> +{
> +	const char *a;
> +
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		if (!engine->num_counters)
> +			continue;
> +
> +		a = "            ENGINES   ACTIVITY  ";
> +
> +		printf("\033[7m%s%*s\033[0m\n",
> +		       a,
> +		       (int)(con_w - strlen(a)), " ");
> +		lines++;
> +
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct xe_pmu_device *engines, unsigned int i,
> +	     int lines, int con_w, int con_h)
> +{
> +	struct xe_engine *engine = engine_ptr(engines, i);
> +	double percentage = pmu_active_percentage(engine);
> +
> +	printf("%*s", (int)(strlen("            ENGINES")), engine->display_name);
> +	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
> +	printf("\n");
> +
> +	return ++lines;
> +}
> +
> +int xe_print_engines(const void *obj, int lines, int w, int h)
> +{
> +	struct xe_pmu_device *show = ((struct xe_gputop *)obj)->eng_obj;
> +
> +	lines = print_device_description(obj, lines, w, h);
> +
> +	lines = print_engines_header(show, lines, w,  h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, lines, w, h);
> +
> +	lines = print_engines_footer(lines, w, h);
> +
> +	return lines;
> +}
> +
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
> new file mode 100644
> index 000000000..3a7856ae2
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_GPUTOP_H__
> +#define __XE_GPUTOP_H__
> +
> +#include <dirent.h>
> +
> +#include "igt_device_scan.h"
> +#include "igt_perf.h"
> +#include "utils.h"
> +#include "xe/xe_query.h"
> +
> +struct xe_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct xe_pmu_counter {
> +	uint64_t type;
> +	uint64_t config;
> +	unsigned int idx;
> +	struct xe_pmu_pair val;
> +	int fd;
> +	bool present;
> +};
> +
> +struct xe_engine {
> +	const char *name;
> +	char *display_name;
> +	struct drm_xe_engine_class_instance drm_xe_engine;
> +	unsigned int num_counters;
> +	struct xe_pmu_counter engine_active_ticks;
> +	struct xe_pmu_counter engine_total_ticks;
> +};
> +
> +struct xe_pmu_device {
> +	unsigned int num_engines;
> +	unsigned int num_counters;
> +	int fd;
> +	char *device;
> +	struct xe_engine engine;
> +};
> +
> +struct xe_gputop {
> +	char *pmu_device;
> +	struct igt_device_card *card;
> +	struct xe_pmu_device *eng_obj;
> +};
> +
> +void xe_gputop_init(void *ptr, struct igt_device_card *card);
> +void xe_populate_device_instances(struct gputop_device *dv);
> +void *xe_populate_engines(const void *obj);
> +void xe_pmu_sample(const void *obj);
> +int xe_pmu_init(const void *obj);
> +int xe_print_engines(const void *obj, int lines, int w, int h);
> +void xe_clean_up(void *obj, int len);
> +
> +#endif /* __XE_GPUTOP_H__ */

