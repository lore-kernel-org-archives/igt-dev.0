Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FD7606A334
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gzvEvxQ8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F9810E190;
	Wed, 11 Nov 2026 10:48:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B0010E0A9
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794394062; x=1825930062;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bTLLtBec+jWsd/jSxFN8NH7pgmsc07XDoLhPOdZhIGk=;
 b=gzvEvxQ8n9KehYrSWdIaI6batsXdxyDkdGMKtwMg90fq0FsWRS5pHHvw
 TbcYqDLOtwlXvdd3xjR3/g9Y1bTcGnKcjh7EXgg1xZnZlkQxQIyk5ghE7
 cWAbhu/mdbAvYrYf5Uft/fhwr9Fc2q+Tef78jPXk4qNyzSTcMYy1Lae32
 WWZSooP24SvA7Jp06rQ1XNgGmNvIBngwkD/R+iDQn92lMwUApMloCRGsY
 HZnRFvie8TjLB3HqpggVC4lOt0LQQxjDYIl89imG0SSiMy3j8ma4ELzlj
 ZwJ0i/vz9TwQB02K6r5WH1Uu7H5IX99AjmBa7xawMi4l8l1yLSpvq67qw A==;
X-CSE-ConnectionGUID: JOi7s7JOSxOaGI3out8z0A==
X-CSE-MsgGUID: 1sLa538QQsuNUYN8/jymEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3169222"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3169222"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:47:42 -0800
X-CSE-ConnectionGUID: EEdGNPNRQLOkVbJRRNYl4g==
X-CSE-MsgGUID: 4l5koEe+SnWJWha6VV1b7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8310421"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:47:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 02:47:41 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 02:47:41 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 02:47:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sy4wlMb2GXJHzGTMbuVz2GlaDZHLlEIbUgqQLZtR13JyUy6VYzuq/in1kq/K/il+pJYxT8dEy4AXyzYFXKYFQUil2xqyWXnHMNDzo/EFJrpOl0pz5GShUKJVFV9rGTcpnkxEiSpsO1t0n7lSryAffRGFVIdG8ffAC1fnpnY4vdiGmlb8j1yb8jHxSjCe9UuDb+DHYN9//HSBF/w3tW/c+agrFD4ZUD1RENY45Kx6JcqKKp/jBDl+a2lpzDNYdjFfB808ZsIBrUch59wEL7Bwo5hLSmHLNbmdXLPih/Z6xtaLLgjxx+z5+RKdZHajo1zBxgJuUu4/Hsr+vyJXj0i9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ+alnJs052O2WNeSyFAUulHa0Bkby3Aw4qzbh34Hjo=;
 b=FDJSCuf/FmFYhz2TreGg2tNwfn3CZ3xr4QXYBZe+FRyTGU10tYtMibVGTiqSg8oulioUIgtNYoeFsajz00cO2ka6GYO2DXWhT8O10AmgKfLt5rY99sgsJFS+1bJpM3dElhFHq+2eOhM4Ig69enMZRyu3WxFIeFLh+a7U8iYdbDhEfuHwbQrUpOiNsflxpazdow+S9f4PsqM9+ojgzFFufDJMIeFxXMZceiFzyTQ4fj0thexDLpLS2wOTXyMuuVlLskAAevm40rzntOZducngENozzUjCiFD7kMCL6SwK1ZDymep078HGcTHbYIxCQgOof0tQToqj5sqVrcSV49da5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 10:47:35 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 10:47:35 +0000
Message-ID: <2516cf97-4fbe-414d-9899-a50863f7beba@intel.com>
Date: Wed, 11 Nov 2026 16:17:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/10] lib/igt_drm_ras_nl: add event notify
 subscription and event wait support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
 <20261110160504.1315160-9-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261110160504.1315160-9-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|PH7PR11MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f2192d-769a-433c-a68c-08df3fe1320c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261102123227099003|56012099006|261021135927099003|11063799006|261021121427099003|261022105027099003|261026140227099003|261009223027099003|261021123027099003|261026121527099003|261022075727099003|261028144727099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: RkIMX/X/fNaDm1zq3X7WY6jp7TEyQYmnQFgo5DJlJt+QVHBevD8euX2+iO36dTeH63hiwSQi5phabkNSJBCyAH8URZYz0wtD9RBoJwn1Y6m86idre3RunfDqfZKWHW9aV4PyLRD2OahoLL0ekV1jQUzx9U0dy566kKud+xORaajGOW7I4S7CUEAxm+OYf1cI+x09USFEsDi3LWIFQYTcZUypwyUaxBX4jrZROC89VRoCxDpOBB1v0TDNHSRCfNWB+FZTMBIJPDF7vZHZUR4/Fz9LTuNdZhkuJNJosL0uf+V/ikUhpATsQP/bz6oKvIkys1OZWUU+3nfOnP0uiS9Mg+A6gBBdrD2MUDOMZtYdxpzkL/5z/GBN52YV/7yHpUktY7LXJaiEYJpFHMwB41aVodCYPP0s0Z537Ai8AXIZyIB6SD6aqb9Z0OF+ZhylRvr1G1awNXZXGi5Z/hI0yvgmIC4vZ0Heofghn/ETlpCn/81tMEgFiSoenJKobsh0+tI9jnVQRYDLoEHxkvZHl3+oWeg2xIaW/NP0eVbqV4DwygQRahL9zJlLG6J3cpsTf0kW2IpQ65mCriFK1UXPm2N5YG/A+Xir0tZbRNSXGHm2DF146ULe0qyEEw/xTj6S8bqTOn9DznhrvI2eBkQ95dtOi2vrchjykFLzYVtqa5PJdxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261102123227099003)(56012099006)(261021135927099003)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003)(261021123027099003)(261026121527099003)(261022075727099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE43V3ZnWVBMWFZiaHowcHB5YnFjdVZRNU5xalpBNkJJcHl1QWtwdysxUWhs?=
 =?utf-8?B?VmRHY29kWWpYR0owMERrRXRNdGUvZXI4UG9zZmluelFSSW1CeFJER2tVZ1hv?=
 =?utf-8?B?MGFDMStLMStueWlUQU1LL3FQbmZkWXNSL2lNQ3E3d0pVcU44QytsaVgrdC9u?=
 =?utf-8?B?WDltMVVMZW5lTUN1ZlB3UjlKLysxcHYvRWgwcFNaRVY0T0NueWZxTkRtUDFZ?=
 =?utf-8?B?eVlTcjROc1h3SzZCWE5uUWlFWmRQQlY3M1RzemU0MmZyc3YxNTlFTlo4Q1hm?=
 =?utf-8?B?Y1VZNnhVQlZIQ1ZVNllUdnRJTTRpekFiWVlmbmNmbmJubnZ0VmdXV2syR3BG?=
 =?utf-8?B?TnlkMnJFNUg2cUxMaHkzT1M3VTBJVk56aTZFRUJCRERDSVVHcFgvNTJ6MWF1?=
 =?utf-8?B?aUZ5eWxJTU9tYVZkUlExcnU2aW5HVkw2bUJ3NnNGR2J0SWgxY3ZvZUZzaFVk?=
 =?utf-8?B?N09SbzJNeWVWN3dKSU1PUjlndjBwS3V0TnNtVXJsSGFRY05VQzJnUU04VWZU?=
 =?utf-8?B?NnhWL0c3MkdhSGgvcnMzNkE4WXJSSDMyMzY5Z2JqVUdtN29kSXhNa3FZU3JH?=
 =?utf-8?B?czRQVUVrQ2ZxVUQ5QklNQnRjeTBIdC9rMXpXZnN4VXE1NTRlcVZnR1h2V2Jp?=
 =?utf-8?B?SzZ4UXE4R0dPRllHNmdSWExsSGRjYTRRRWJraDRUR0F3OUpRbEw3SUQ1NVZ2?=
 =?utf-8?B?a0Z5bW9aWk9oeUp4ZzY2WkZWQllFWFlHazY3TlY4K0J2NUJqaHNNUkJvRExx?=
 =?utf-8?B?ZDQvcXBNay94dTFRNWNGSTFsaHkvdzJqWEtTTmJXeit4K1dqRkUzN3hNblBj?=
 =?utf-8?B?SlNyNzl5RUM0V3lybldZdTNtMXMzcElVMEtZMXZQZlNUc3NMTGYrQjZuTGlE?=
 =?utf-8?B?OXFlZHdDSUdMNTlwRGtHTXBkWmJibXdMdFlGVTlOQ1JodkxFMk9SbHNlTG9j?=
 =?utf-8?B?WWYydHJJQjFucVo4RHkwYmF6UXpQMjRuejMwN2lXM094UitNeUNZZzJUdGpt?=
 =?utf-8?B?WEVieGoxUEVka0ZDcGVreDA1NDV6dUcyWVNtVkJtUUZ0Zk5xeWlEemtBWFFJ?=
 =?utf-8?B?R04zcDk0OTRqSi8rUWJlTkR5ZVNxWHRoRTNITEk3ZnFMWlNIMktoQ0hUWU1n?=
 =?utf-8?B?MTFDZnBWV3dFcUFQUVluOFFHbnBWdXl3YUZJMmc5ZHFSazRFZjFPZ01FT205?=
 =?utf-8?B?V09ScXZLUzI5WWdURzFZYmVXT3BFSWxNaEJ2MzJqcWpOaStsdG02bE1qWjhS?=
 =?utf-8?B?MEF2Qm00L0oxajZxbXNxV2hjZHV2dGh3QWJidXIxd01wNDRqaGN4UG1QLzB4?=
 =?utf-8?B?T0NHVjVMckdSeGV5TzBNcVF3QzZId21IZ0VmRk8wL0VMV0htYnZYMG9kQXRn?=
 =?utf-8?B?SHl3dytFVkNYVm1rdWNhYU4vVHZ3c3V1YUFWMVNQNjJXZHpFOTllN2pub0dj?=
 =?utf-8?B?d3VQa1ZuajgxS2pmMkNlMkVjUFVkUm1PSFpzY0ZnR1BxOTBDSThkWWlHZlJz?=
 =?utf-8?B?SUhmTU04alBtL2JWSEpQL3EzUjlYaVpselcvVVkrWURuaXltamNlM2thclRt?=
 =?utf-8?B?RldzcUoreU5tZ1VtWkh4R1A1WmpoeC9MTUNXQzBvb0hEeXNjZ2xoRlFDRHh2?=
 =?utf-8?B?Q1RUajBXemlVZ0FYc1lWY2RMSmg0clMrWFFURjdvaWsrMUh5U09RMTBFZDdO?=
 =?utf-8?B?TElOaXJ5MDk2Vk5hblQxbVNqdVNVYnRqUXlXa2N5VGsxcExkT3Q3ejd6c0li?=
 =?utf-8?B?enBRUWxmTjNBQS9jdUN2Wk1NbTd1TE10Vk1hYjg1bTJsYXBhSGkzQlRVSDNB?=
 =?utf-8?B?MXIwMWtiSzFvUWpWRDFYWklSbENqYi9FTDhLQ1RXY0htb3pFcUUyczRyKzdQ?=
 =?utf-8?B?RHZmdUZ3TUFMTkxBaGEzYTk2WHRJNTJ4UUdVejFHVlUvQkRobG9jYklYOWF4?=
 =?utf-8?B?UFIrcHp3c1VzYm42d1VLVFhib2ozTmJ6bWZQOXJ6ZGc3bUIvUjU0MHhrRVJs?=
 =?utf-8?B?cDBlK2JJdVlvT1dOMnpONnpKWE5ZZy9jTkg0YTZSWE85TW1KL09HWFVucWVh?=
 =?utf-8?B?M0xyMkF1Qlp5ZmF4VlB3ZFM1V2sweHE1Q3JQN0E4RXREQU1QR3haTmtMazZh?=
 =?utf-8?B?VElHTjNxSk5XdnM2b0tNTGlMUldxaFc2UEl2dzJibVNYR3Y4bXI3MWhoZEdU?=
 =?utf-8?B?SEsvVWtLV2Z4bmtabWNHTUVnWTZ3emd0WUdkTWtuVVFHK2liRk5OV1ZlbExY?=
 =?utf-8?B?MHBDeDN4VmkxQ2h2Y1hZM3daMXZuVkxqeXlBdkVabno3clY2ellYVnZLQXdE?=
 =?utf-8?B?Vk9HS09HWmNIRTFtWXZHaSs5Vnl4NW56cWxSRktWMVFwSmpYUVBhdz09?=
X-Exchange-RoutingPolicyChecked: Vfi5Z2BwtuU6ZV+UdCSZ3oBod2tpdKv8SVlkpoCUvI6OT4QIqWB4f8638tzRTS1JEjwXsu1irurAwPRtcfNefhKEl0Rz28HAYzwCqWMU9HqoXB8oKgpG08//uzHY/f1SQe2ldsWEJEF+2p+bHJ0qGfl9VIJmoKh9VB51cnjVk1KWHdXAwKcpLnp0eYmsS0Q1tiu6rHGH4HzchuThiuzNBn1XeIFseSh3jSwrCVHh/ArhDJkDaIv0J2VBYpcexQ+lmv39FFJiNHNEaXG3QNMw/rfFT7hDzT96H9WpD3TESItJQZBRjlG+sSt8vLhZv+Ev5PDn6fgXTSK/HbhXk8klMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f2192d-769a-433c-a68c-08df3fe1320c
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:47:35.2891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOCc0FRthXG8XqtYW8NRp0BkW0YUx7Bs5meIKoJVCi0P9V52ERPQQVXSxR2vNAGUiDiZL4MgK3I8N9NFgfY9bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8600
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,

On 10-11-2026 21:35, Ravi Kishore Koppuravuri wrote:
> Added event notification support with subscribe for an error-notify event
> and wait for the event notification functionalities.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v7:Added detailed debug messages to aid diagnosis of failure conditions
> v6:Added normalize_nl_error() for subscribe and wait_for_event functions
> v5:Added a guard to prevent duplicate multicast group subscriptions (Soham)
> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>     Jani & Kamil)
>     updated error event name from error-notify to error-report to align
>     with the latest changes in drm-uapi/drm_ras.h
> v2:Handled SEQ_CHECK nl response using separate callback
>     Added monotonic-clock deadline to wait for messages without exceeding the
>     caller’s total timeout.
>     Added support to receive events until it sees an event whose node ID and
>     error ID match the requested values.
> ---
>   lib/igt_drm_ras_nl.c | 190 +++++++++++++++++++++++++++++++++++++++++--
>   lib/igt_drm_ras_nl.h |  18 ++++
>   2 files changed, 201 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
> index ccd1d7fa3..1cf9935ae 100644
> --- a/lib/igt_drm_ras_nl.c
> +++ b/lib/igt_drm_ras_nl.c
> @@ -6,6 +6,7 @@
>   #include <errno.h>
>   #include <poll.h>
>   #include <stdint.h>
> +#include <time.h>
>   
>   #include <netlink/errno.h>
>   #include <netlink/genl/ctrl.h>
> @@ -64,10 +65,12 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   	nlh = nlmsg_hdr(msg);
>   	gnlh = nlmsg_data(nlh);
>   
> -	ret = genlmsg_parse(nlh, 0, attrs,
> -			    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> -	if (ret < 0)
> -		return NL_SKIP;
> +	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
> +		ret = genlmsg_parse(nlh, 0, attrs,
> +				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +	}
>   
>   	switch (gnlh->cmd) {
>   	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> @@ -87,14 +90,44 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   			nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
>   		break;
>   	}
> +	case DRM_RAS_CMD_ERROR_EVENT: {
> +		struct nlattr *event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_MAX + 1];
> +
> +		ret = genlmsg_parse(nlh, 0, event_attrs,
> +				    DRM_RAS_A_ERROR_EVENT_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +
> +		if (!event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID] ||
> +		    !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID] ||
> +		    !event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE])
> +			return NL_SKIP;
> +
> +		ctx->event_node_id =
> +			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID]);
> +		ctx->event_error_id =
> +			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID]);
> +		ctx->event_error_value =
> +			nla_get_u32(event_attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE]);
> +		ctx->event_received = ctx->event_node_id == ctx->node_id &&
> +				      ctx->event_error_id == ctx->error_id;
> +		break;
> +	}
>   	default:
>   		return NL_SKIP;
>   	}
>   
> -	ctx->reply_received = true;
> -	if (ctx->ack_received)
> -		ctx->cmd_done = true;
> +	if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
> +		ctx->reply_received = true;
> +		if (ctx->ack_received)
> +			ctx->cmd_done = true;
> +	}
> +
> +	return NL_OK;
> +}
>   
> +static int ras_multicast_seq_check_cb(struct nl_msg *msg, void *arg)
> +{
>   	return NL_OK;
>   }
>   
> @@ -160,6 +193,27 @@ static int register_callbacks(struct nl_cb *cb, struct igt_drm_ras_nl_context *c
>   	return 0;
>   }
>   
> +static int register_multicast_callbacks(struct nl_cb *cb,
> +					struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_VALID callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = nl_cb_set(cb, NL_CB_SEQ_CHECK, NL_CB_CUSTOM,
> +			ras_multicast_seq_check_cb, ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to set NL_CB_SEQ_CHECK callback (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int send_and_recv_nl_msg(struct igt_drm_ras_nl_context *ctx,
>   				struct nl_cb *cb,
>   				struct nl_msg *msg)
> @@ -339,7 +393,12 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
>   	ctx->ack_received = false;
>   	ctx->response_required = false;
>   	ctx->error_threshold = 0;
> +	ctx->event_node_id = UINT32_MAX;
> +	ctx->event_error_id = UINT32_MAX;
> +	ctx->event_error_value = 0;
> +	ctx->event_received = false;
>   	ctx->family_id = -1;
> +	ctx->subscribed_grp_id = -1;
>   }
>   
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
> @@ -482,3 +541,120 @@ int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
>   
>   	return 0;
>   }
> +
> +int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
> +					  const char *notify_group_name)
> +{
> +	int grp_id;
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0 ||
> +	    !notify_group_name || notify_group_name[0] == '\0') {
> +		igt_warn("Invalid input: ctx or sock or family_id=%d, or notify_group_name=%s\n",
> +			 ctx ? ctx->family_id : -1,
> +			 notify_group_name ? notify_group_name : "(null)");
> +		return -EINVAL;
> +	}
> +
> +	grp_id = genl_ctrl_resolve_grp(ctx->sock,
> +				       DRM_RAS_FAMILY_NAME,
> +				       notify_group_name);
> +	if (grp_id < 0)
> +		return normalize_nl_error(grp_id);
> +
> +	/* Check if already subscribed to the requested multicast group */
> +	if (ctx->subscribed_grp_id == grp_id) {
> +		igt_debug("Already subscribed to DRM RAS multicast group '%s' (id=%d).\n",
> +			  notify_group_name, grp_id);
> +		return 0;
> +	}
> +
> +	ret = nl_socket_add_membership(ctx->sock, grp_id);
> +	if (ret < 0)
> +		return normalize_nl_error(ret);
> +
> +	ctx->subscribed_grp_id = grp_id;
> +
> +	igt_debug("Subscribed to DRM RAS multicast group '%s' (id=%d).\n",
> +		  notify_group_name, grp_id);
> +
> +	return 0;
> +}
> +
> +int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx,
> +					       int timeout_ms)
> +{
> +	struct timespec start, now;
> +	struct pollfd pfd;
> +	struct nl_cb *cb;
> +	int remaining_ms;
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0)
> +		return -EINVAL;
> +
> +	if (timeout_ms < -1)
> +		return -EINVAL;
> +
> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
> +	if (!cb)
> +		return -ENOMEM;
> +
> +	ret = register_multicast_callbacks(cb, ctx);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		return normalize_nl_error(ret);
> +	}
> +
> +	ctx->event_received = false;
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +
> +	pfd.fd = nl_socket_get_fd(ctx->sock);
> +	pfd.events = POLLIN;
> +	pfd.revents = 0;
> +
> +	while (!ctx->event_received) {
> +		if (timeout_ms == -1) {
> +			remaining_ms = -1;
> +		} else {
> +			clock_gettime(CLOCK_MONOTONIC, &now);
> +			remaining_ms = timeout_ms -
> +				       (int)((now.tv_sec - start.tv_sec) * 1000 +
> +				       (now.tv_nsec - start.tv_nsec) / 1000000);
> +			if (remaining_ms <= 0) {
> +				igt_warn("Timeout reached while waiting for error event.\n");
> +				ret = -ETIMEDOUT;
> +				break;
> +			}
> +		}
> +
> +		ret = poll(&pfd, 1, remaining_ms);
> +		if (ret == 0) {
> +			igt_warn("timed out while polling for error event.\n");
> +			ret = -ETIMEDOUT;
> +			break;
> +		}
> +
> +		if (ret < 0) {
> +			ret = -errno;
> +			break;
> +		}
> +
> +		ret = nl_recvmsgs(ctx->sock, cb);
> +		if (ret < 0) {
> +			ret = normalize_nl_error(ret);
> +			break;
> +		}
> +	}
> +	nl_cb_put(cb);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!ctx->event_received)
> +		return -ENOMSG;
> +
> +	igt_debug("Received error event: node_id=%u error_id=%u value=%u\n",
> +		  ctx->event_node_id, ctx->event_error_id, ctx->event_error_value);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
> index 5c9be5b17..057c6026f 100644
> --- a/lib/igt_drm_ras_nl.h
> +++ b/lib/igt_drm_ras_nl.h
> @@ -47,6 +47,21 @@ struct igt_drm_ras_nl_context {
>   
>   	/** @error_threshold: Error threshold value to query/set */
>   	uint32_t error_threshold;
> +
> +	/** @event_node_id: RAS node ID reported by an error-report event */
> +	uint32_t event_node_id;
> +
> +	/** @event_error_id: RAS error ID reported by an error-report event */
> +	uint32_t event_error_id;
> +
> +	/** @event_error_value: Error counter value reported by an error-report event */
> +	uint32_t event_error_value;
> +
> +	/** @event_received: Set when a matching error-report event has been received */
> +	bool event_received;
> +
> +	/** @subscribed_grp_id: Multicast group ID currently subscribed to, or -1 if none */
> +	int subscribed_grp_id;
>   };
>   
>   void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
> @@ -54,6 +69,9 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
> +int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
> +					  const char *notify_group_name);
> +int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx, int timeout_ms);
>   
>   #endif /* IGT_DRM_RAS_NL_H */
>   
LGTM
Reviewed-by: Soham Purkait <soham.purkait@intel.com>

Regards,
Soham
