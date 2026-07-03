Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB06C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D01310F937;
	Fri,  3 Jul 2026 21:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZdS+9qd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880E710F935
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112729; x=1814648729;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HqWswV2He9mbngNapWP+aJ2IEo5l9crYVrNcSQph4+Y=;
 b=iZdS+9qdXmbVcw19lC0y352AOhxJXARv9tbE9wnPJKtEA9Cda9ifBBHD
 Emq2cGmA9G1S02J8Dx115Dziw09VLN6l/nCp3Y0bgz2NslbqbQ4vSJm+C
 zQFIhSe4wLOHLqGgKNB/lBeBwIANmxCzGDbu/FyKjFyX+PZobw+WH7reN
 9NimiWT7XRFaBBRo5/IXqpO5LMXM8TWojBsd6X/tucCYn9eT7evkh4588
 BOzlZNLnQFU6e+IlKxH+5hYhqq6STv8OfxHP/5JJLcKNMolVZ0k8/AYcl
 GrMK3hrWAE5lJGrcwXNvqeOzceDYrdMLC5n9Ln68L7hpV4LqvVjGLdQvI g==;
X-CSE-ConnectionGUID: kyW+jkfzToi5+0d4hdDJyg==
X-CSE-MsgGUID: 8qXrsJBaQC6alpf5DtRGcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83894308"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83894308"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:05:29 -0700
X-CSE-ConnectionGUID: UL4PW2JgRUufWlvAxZiymg==
X-CSE-MsgGUID: ZwrST0PcSh2NdvLM2oC/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="253328553"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:05:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:05:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:05:27 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:05:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dig6jo0+WJG2xQB6I9YnayBqUR1dSew7FvTIGlzY80rZLKdALhpU/0PbNoXf1eioqy/OkM6SoA19wSYZSZaL9iJIudSAUyYB+4B0069rIPhW7fcR1QKTp3SxyguYQj+fjDQVc4+4h1w5cmb/AZHYLqwkgYDgDSJPQSLfHeOQFJkW2exm/at8GGZ6O0m2xPupLeuDis6IvN8aqVsNApj7ocqjY0rKhlSwkOHbSTheYEjhdrnWNfmrwk7kKd8RXEci4Q8sj1L9rSwSlVf8QjE3WSq+qCwbT6snSlkXIgXXmuT3afJFJwA3Q/vY9pthKX9TIZpgmsFOLokYDoYkqNmYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkI+hOocVBFZJny9EW937bEXQ7HHF0DzuO/xhoaLcr8=;
 b=BpepPArrtBaCE8uWi2jwJogEIWgaqRCaF/itXp5JriLIKLODRBhJbwcVHC9Gte+UAcxfITT+UDCJqmEiWFkGMpSvYF0K0G/WnIWmfc15WEI5g5zCjTnzfElz9/gXguv5pG/S1nkO5PxIAcaG8mj9A9TB50nAqYaIXoHaBUM87FHYUkpO8zn07aHbEDGOu6K9b3j+FawG66cv+4IpOj15cZTybVMyXNQqPQLv34c2qSvLyqznrsK8EPF1M04Vd1ett9XP+3XmzBhStO+WKz5y322Z0x+4mAABtK4YbvCRj33oAV46kDd3Kbcm5VH2JnnQgEWjzJ16D1hVVYUL6SPEsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:05:25 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:05:25 +0000
Date: Fri, 3 Jul 2026 23:05:19 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 19/31] tools/intel_backlight: link with minimal
 sub-libraries
Message-ID: <6wckxaz5ygmrelwhxj7344ptzkremrsmgoxlz4mg7fnqve6d4m@aaaf7zfqim3h>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <79680c1b07900dc00b0244434196c5b5791262c0.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <79680c1b07900dc00b0244434196c5b5791262c0.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZP191CA0061.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::16) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 867961cf-c149-4ff3-a354-08ded946cd63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: ox+BtOGJQKO5SNAhOBLMbKA3IWhZ+kzH/8s1hg2cZdyjpPUsy8P2pCkDQQhfGJjn8F4k53K0TpvTKUZzsfTzCSKWJbkhxHO4/9zA6igyl/Q8nB7/ac416CACghDSZYgzDNRZ+Hg4u7woffTVo3JglXhw/kNUdt7AB5DZ6QAizJ8V0mDUPlI/mL/6lA6F4rtnzDy3MN/xKORh+JfXHg1ltWkIvYuXCgew+rCQSsK6mrYvBWwCmWiqNnxotFY7ena/DI6/xiK9FHVAYyBwZQkHaabOhxbm35CyWbSNwvmTFeRo8SJfFEMWRBIX6WRGZ6UW8ZZLZqUkzsq+2449XadCiIlGYJku7jgH90MuBxb20GPSr6YGz3FMVUozStoPVsEbPt5m6a8TVOBhdtnkmaWvRtStnvZF6YhtW6jVo7SWmkiTms9QBe3z4+Yl3+9MpvZqpn+elz4w/Qv5dm3vdGsCfXc13naK//bvvXJIU/DxAwTQL5VknRGoxs70F9Jsx15WsU18/kHGegpc8SFLrEMROdBe3Gq9bEX3fw8Ty0BL+Oy4XsYJDqiaBHAdHvT6orKtCsX1FnOLdJwPX9efH0Uo9MKqjduUmg4oqbx1MgFXN1cH8iX6WCTzlPPVQTU+Q6Kg40opVdJZIyQhLWnAWHSoLwj4JNG3rlBzel5WiVGnItk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWJkMmZDZ0VxTG0vTkRabW1DSGZ6WnBYYVp0WHNNYzVTMWhialNXcms4dTRz?=
 =?utf-8?B?UlAxSnRRb0Z6dzBtY3dnUTVIYzVERDB3RHRLSEJQc2lBeDJIMzA0ejY2K0Ev?=
 =?utf-8?B?R01oUHdlLzhpVkhiTk1EVXh0Mk9QRDRPanF2UmhqQk82S0x5eXdBbzBvTm9z?=
 =?utf-8?B?Zk5aM3hOaDd6cmNEVnFtNVM3aUNTTDBUVlJ5R21WbDc3eUNzdjFmYmM4N3Rh?=
 =?utf-8?B?dkhuQjNNc0N5Q0g5eXpFdFhBK05PVFkxRDdIS20xbEpwMkZwb1lPZ3V2OXdH?=
 =?utf-8?B?OVpZWjZJU0hQODcvRHlzRVVJVlcrYUdmSWJsSWZTelo2Qm9Lck9WZnNHVWFv?=
 =?utf-8?B?QTV0b3EvWTBLU2lKc1J0ZThiNEkxR2ZIQjZaU21NT3hmOUI1QkdXMzJ0ZUZX?=
 =?utf-8?B?RHcyajFKSldiK1Y5Wm5tbVU4aUtST0F4Y0ZwbWdGV2xBbzh0ZDVFVUFpUVRI?=
 =?utf-8?B?TVU4QmdCZVhaVFJsbU9uMHhBcXhhQ1EvNFJtQmlQSkN6N0owc2dGUnR1bi8y?=
 =?utf-8?B?YXR2Q3lQKysxckthVDZDYUZITy9nV1JxMU52YlAzeFJjM1ZtU3dTc1d3bXdn?=
 =?utf-8?B?cHdzajEyNnM5aFBYOEJBdmNtZkNZVGY4OXpyYVJPYi9FTklmQkREUGpBQi8y?=
 =?utf-8?B?ci9MclI3eGl5SG9aQ0QzNDkyOW5YTnpneWkxWWc3L05RbjJBclJwTUxuY2gy?=
 =?utf-8?B?N1ZRMGxMY1NaMGpEQ0ZWZmNuemF5OVRsc1lCR00wdTlvT1VLcGNGc2JTcXhm?=
 =?utf-8?B?ZVVzSEpJbUl1cTV0b1lkVkxsM2xjelNtY3FIbnVZeHFNeWRXZnJWNjR0Z1lH?=
 =?utf-8?B?enowQVVTV24zUlBVSGZxaXh0YUtZRG9mRE4vQWs1WW5oVUpEZkpUS2NoSmY1?=
 =?utf-8?B?WHNNRDVrMjlEY0ZlZGlHd1Q5dUorUS93dXVvT09kUkIrWVNLMy85dFlHU0dh?=
 =?utf-8?B?Z1QyVTdkMWJHakl5bmFOZW11eTAxYUNhQmkwWHp4SFdFdU5WcXhodjhIMzdh?=
 =?utf-8?B?enpudytnSFVwNDdpRVorTUIyQkE5VXFobnlJR3laTG9ZOXdJUE1HQzlYd2VZ?=
 =?utf-8?B?N1l4bWRFMUQvKzdwRE5oeFV4aG16Z1ZwdDBqeE1IWnNVenY3dzM4QXllVDRy?=
 =?utf-8?B?QW9oZkd0YkNMUk9KSW9XN3VyRk56Mk83QmVSWHV1eWtYOXRpT1hJYk0yc1B3?=
 =?utf-8?B?V0l3TytzT2oyZjBCSVI4ZGFjSHorZTd5RUZ6cmZKUmovem5yUStLdnZ6bXhh?=
 =?utf-8?B?QVdab2Rqa296UWJFUDUzaVZSc1FPc0dHVGh6cEFYdVVFOXdEVmZDekxoQ2hq?=
 =?utf-8?B?UzJBZytaK1E1K2RSbHlEbUN4MnUrSDBNMlpOWHRUOE42UkFKclk1TXJhcU9G?=
 =?utf-8?B?NFh1NjFGT01FeEt4S3pjL0wzdURwaFRha0hHd3hGakhRcFFOREtoVHM5dmZJ?=
 =?utf-8?B?UjhzdEpjUUcwQk02cmM1SS9DREt5STlQWEJVQjNUYkFyQnFTTHlnVGJVYmhM?=
 =?utf-8?B?NUpyMUc2alh0NElkbDFUb3FnOWUvUEpXL0hBN2xBU0NDUWt6MmpGbURoUGhn?=
 =?utf-8?B?MXFhbDlxUDlHTGpsbGxheDNCNzNGc0c5MjJUUDFidmRLT3dJakxDQkdQSDcw?=
 =?utf-8?B?LzRpSE1McE93anhLUWRJNzZOZzBybmZBRzMraDBWM1pqV1ZRNGJvQzBRMzdB?=
 =?utf-8?B?VmcvcVMvOG9EMWRlN3c5U3hzUW1ybDRsSEJjNmZMcFJSbncwSmUzM1luTWZZ?=
 =?utf-8?B?c2VSc0I5SmZHYmZtdDlWdDhvZ3BmVldpY1M3alRRR1pQa0lzV2U1ZGVvYnNs?=
 =?utf-8?B?Y01LT2RuYVBUQkRuOVQza28yMENWc0J1VHl3WU5XWDEwcXVlNlBLcWo4Y1My?=
 =?utf-8?B?dVNINnlPL1A4WlVTcmR1UzAzUUt2ZDBkVTVGS1RHcDRmSEpvRThYQ1lPL0ZY?=
 =?utf-8?B?R3FkRm90UHJ5aUdiYlpXNXduTlZvT3hrdVA4aU1oZ0t2b2hlR21LS0RaTEE1?=
 =?utf-8?B?YzdUR0M5MVpUUFlkY0lwMWRxWVBUOUk2clI3R2lhMXpCaFc4QmhFSkgzYUsx?=
 =?utf-8?B?MytqSkF2TzF0bFJSY25TN2xRMktLSUVMdHErbkhjRnZPeXBXd0pDdXNUdWVU?=
 =?utf-8?B?V1VHdENoS1dncHcySWFXTUVIamVudmx0VVpXN0NFN2VEcW1OaTZUZTV2K2VZ?=
 =?utf-8?B?Vmg4QmxmRUttaTlFUXV4UVBCM25zOGxFb0VINXpNcUpJK3FBdk5uMjdiRUw2?=
 =?utf-8?B?a2wwdkFmOHdTQkpkK25TaURiYlIzeEVoaW1uMXo0cmc4ZW82V1A3b3hyOWFE?=
 =?utf-8?B?cGVNN1p6b2U5aU5TWE15eHV5Sm13SlRTa0ZVVUtsang5KyttaHRGOXVxV05u?=
 =?utf-8?Q?FkgSbB7dCSPob7zL1Fy4NBSa99KPHVL5NzA8+doWU/LM8?=
X-MS-Exchange-AntiSpam-MessageData-1: +bswpBOTmKflL1T8rTgoUtFnxOdu167m6z4=
X-Exchange-RoutingPolicyChecked: NW+QSZZVikfT307if0nnRIymuixwBo2x7uvF7U/AZcD/NYQxwT3SRJqRlqkyeSA1S7GhLICjGXcuf7P9gT/E87UoFyycsdJHIp8s0kfeN6vRcqCmwEw2IClQsZ960f/NSOV9O2KnfqR/oem4MwiRN1q7olfExxWvdk+hcOluYrHooOjnD45S/avuxcO0dQVGeFuAgmo5jB/qaH7itJIsC8nk1bVx2zH+TI/uGipPEEet7memQOed4ZzXH4R7rd/DJ9R8Des+bNsPbZG1dmAQ6Q8AyFQiPW+mfRnLAQESOQygyWZ2MhsVa1CsqW/8Igs8AL3DUv4jiHThz/6rOrHK/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 867961cf-c149-4ff3-a354-08ded946cd63
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:05:25.1203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOkwO9PHNRblJklT5r6W3LT1L3rcVe+x3EIi5ISyTRJg2sl2m5TYY0q2dwxlxDSbzLyuLv2XgE+ObKyVL6BZyO/lPqY5sQHZFlWcxful5uA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:53 GMT, Sebastian Brzezinka wrote:
> intel_backlight only needs MMIO/register access helpers and the chipset
> metadata they use. The full libigt.so stack is unnecessary.
> 
> Add lib_igt_reg_tools and link intel_backlight against it instead of
> libigt.so.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 46cf1a717..8899a5b49 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -15,7 +15,6 @@ tools_progs = [
>  	'igt_facts',
>  	'igt_power',
>  	'intel_audio_dump',
> -	'intel_backlight',
>  	'intel_bios_dumper',
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
> @@ -92,6 +91,11 @@ executable('intel_vbt_decode', 'intel_vbt_decode.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_backlight', 'intel_backlight.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
