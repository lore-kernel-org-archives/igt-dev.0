Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93255C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 12:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E6310EF97;
	Wed, 12 Aug 2026 12:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgkodDuR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6C610EF95
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 12:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786537447; x=1818073447;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WyR/XT03XlRPt8WmrZEwK5PlBraHsWWiYDVCbImXXjE=;
 b=fgkodDuRyGFXwtrg356fnjMXn6ukz4ut4QTGNITcII7GwNBDUy65x3wL
 uGcyHQw5LycEFFedAc7DFCPdI3Mtz7EY19KkYHxibz0eOidBEiSFP5kMJ
 AjMzQljr7grC7pjLaE0wsCepRvUK2df6rEFBKRwd+ckiYxU/PgunEnggA
 XDavrFYX5JLm4QlWf558lI+suR5TldKR4Yq1gheuKkuyfhEHo44yIkNq+
 oY5ImQwwKh+wNXVc8haIu6CYoNjHobiuDEsddhGUkLLoaGM0KzLAa/m69
 81X71bn+NPJMd2zMJaVFoK+PogRsMfYQKWjNyyOqRv1Mx9qBvIJO88omE w==;
X-CSE-ConnectionGUID: 41/qGEIXR12N4vIjagfrgQ==
X-CSE-MsgGUID: Zc41mGiuTQuC5DIWqvv8eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109875680"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="109875680"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:24:06 -0700
X-CSE-ConnectionGUID: Cayw+38+RMGCNah+iq5i/Q==
X-CSE-MsgGUID: 8OVxeRSwTeKJTR+CvYGgdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="287065427"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:24:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:24:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 05:24:05 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:24:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8u+Re+xgzfDBOcm5TEAx3xXHUAAaxOBvMEjE5rDZ4QSgNLugz6q0blrsvGNnS4WrnOyNzf3msmXc2pkUqCHtqUNrv09k/ahz1jW9PRvBe/eagoLrEFNe4A5F37qxbbcwWmYL2qsP7wUiZb/ub4CdsvZdFEKTj02rAeDBwsmTNHT/NPv8Btr4BfdtCK63nQgPEPifUsOPLC1OUxnN8Rq6xhb+tLY/8aLXDgSCnwmrpocVZQg6+Zy5XINRxLRyEUitmFqIVCo/bk+qNOKSczjsykpXcb9NFh9Y0Y2ED/Di9qB1Q3E59/JnZ908BFKzq5uj8xZgAY9r6sQlHiXu3AjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c24GwL7XLi7spKAcDr4M6NDatwaulYHutQAC1Q8F3sY=;
 b=wgT+4gk07R0yyOH8J9zcJi8aMFHZbgMBWSF7torvuCQfNJDxxjUcUwrPxzcBN+WmaYRHp5K0OH216qi+MJed/NyTgoc/hDhoiJCYCXJhFjGiyki8XsMlnChhSn3XEiIiZW+qWQ7c81nSEOeXWRB1aqgLEE3OsQKOwv9U3Mw8Ke0WdJ8j+wLRJukBOGxNl3MPpKUTLIJIhGd37CGOpJTqWY1ZgxFKwAh1A16WApwWSMPE6Qw1tmByBOYXbELqCsVvl8kJeiwkZnhKW4uVeSJT86s813KdOl7CykUtXc7LxAu0CRn1gplCUTGuISg7f7Ufz8mCab+vNvDZxNDolapv3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 12:24:02 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 12:24:02 +0000
Message-ID: <03831ff3-3d47-48e1-9c89-7e5fd93ead37@intel.com>
Date: Wed, 12 Aug 2026 14:23:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Add xe_sriov_vram to NVL blocklist
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20260812131013.1369674-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260812131013.1369674-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:50::28) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1c1005-b190-4211-f55c-08def86c97f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lh6TIQGAFzkwGzRXN0qcLGIJu7XyJ/ucnZ9KsFAvuwMNeHLzXEReBQYAma9DPKqciLLUcCYvLXDYR5eGupB4w1+7Y1ycfhbXcILgBE1MaHBS5vyWkSF8nMzsyNdnY41dal01C6syXEh8zHjDxZrNTo1YpEjud4mkbh0chhr/S+/7GDad1yajH3/OOOs9cakgVkVYjwvHB30uMOV5k+TXOcJCaRU8GCX0NNgbDGooio5yDvKZTaaR404UurVe7+B8TsgPWcyNlwbkQLKbLnEbOzHmU/F+bn4kFHFR9MzPBt2KdUakv54w2xXLz19aDs728IyHmTS+qdpOX6Mjo9hw8ttjN+K6LQeVtkiu43U2HnXVHdzzFuPxwfXzur97XM8YYQqQmDrjORSWo5ZDUSuZpiDrLeck3SnT3ep/KUU088qz4ngdeNtaYT76kRnAXywvMNG6fgX3gd9QuzLcC+afqxz9u4z9iD6pRYrNaZ1MZwoGb7vxhe7AaAJXlDuhzaYB2ELWMh7SM3cvPIqw87ZpKc+eP54qxclWB57cb73+UWPz6fcW0NUubAw4IkH9Q8UI9nVWbVNqA39RDHwFkglr9HyLHOVUXG4U6QuROzvWi0eyYUN09xY+RIyox5mNLFyhJFAis28chZF73o/01nT8KZWuacDw2Rm9R8OKRRd6EoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NngyelVTbXlTb25ZVFRPQXRUMmdRM0xaQ1FTbXdxLzBMUDJRYjlETHBYT3I3?=
 =?utf-8?B?MGlCOHZlTEpQeW92emRYYkVtVDBJN05DWUFzdG1BY3V0VjZSSm1tMXdXc1N3?=
 =?utf-8?B?d3JwZnQ1K1JrWkw3ckdEL0VYYW9COWpJNWpHYUV6b29acU5LbCtKTnZNbDM2?=
 =?utf-8?B?ajRucFZxRG5nV1Jub1A1anZweTdmQlpGbjN3SUtjOU05UlAxZnIxY2xGS2dl?=
 =?utf-8?B?Q1FuK1dCS0t0ZUNHWnlUUXFhY1RQRWs3Z1JrNlEwTVByUnVzZ0NFVjk1eE5t?=
 =?utf-8?B?dWtmYnUzcTZsZXVybDJlL1dDWTFYd0c5UXcxWkFYWXo3YThxQXAyNWpHWnlO?=
 =?utf-8?B?Yi91SjdFVkp5QUpLYnUySnYwcFpkOU5EeXpjNUZLQkYrajBvbHg1eWQ2NGxk?=
 =?utf-8?B?Z3NuUk9KUFB2bWdoMmdaRlZuaE05RmdyQ25ua2toRGdHWHVQQXNSY0dteU1E?=
 =?utf-8?B?UVRTVENHV2xlYlA0YWVnOHNXVEJvTCszWFY3N1Q3ZU93WnE3VWN0b2RPRUFw?=
 =?utf-8?B?RWdqdXNXZmRXdDMvVm91QVRPeWRjTkZzWmNqaHFYNGMyeXF2S0FhL0NyU1Ry?=
 =?utf-8?B?ZjJMbVBHSXhvWGNON3FlUXY1b2hCSmg2N3ZQMElTMVZpUjRubnJuSlA2Nit6?=
 =?utf-8?B?QUpiU1huY1lNTmFaZW9WUmdmM1NsaFphT0lEeSs1ZXhvOE5JajFsZGlsWkxy?=
 =?utf-8?B?ajdNc25lb1dYU0hTa25SYy9uVVdjVzBqdmdhRnYwL3pVRHlnTlZMUVZwWHdS?=
 =?utf-8?B?T2JoMklWSGN3VGQrd1E3WXIvaEhMM2dDbVZ3M2RLMUF4eTRydjBncDhlUjJs?=
 =?utf-8?B?U0p1c3E4TmJMSlVHVEwva2w3bW5UKzByVGJRa0tVdmQ2M0RJSEJiUHVrb0Vn?=
 =?utf-8?B?aG85WDE0c2doODFQQlZJRGlabm9TWXNwaVFDT1RzNWt4ZUpTUTNEZi9UVXBK?=
 =?utf-8?B?M1FUOFVDcTZtNWkxakxJRmlDK3JRUkNJWm9ydWhobXExM1h4WkxkRWJDQzRM?=
 =?utf-8?B?amFBTGtIYkE1M3F4cElhZVFubmFCZmJmYjVYVjNvVW53UnBFYkMwRkxNaVcw?=
 =?utf-8?B?QjgyTDJYbVNLTFlhQS93M002NmlCOUFuQmtxME1hSk5ib3pzM2VobjBYdkNz?=
 =?utf-8?B?bVlUWnV0Q2pEOHZ5elFzNmd4VHV6WFdUcnZTamZrV1hWRy9qRFhYUWlZQlRm?=
 =?utf-8?B?WmcyUEVHM3NZZVVIOWdkYWRuRVhwZzlXL0tuWVlLWGVYSThmb29JZGpSK25N?=
 =?utf-8?B?dGhUMFEvL2toMlBzMFNrMTl0SXdFVys0b3ZCOXBCazgwU3FiOUVnWGNib0hR?=
 =?utf-8?B?Q28rQkZsM0FuMlY1WTB2QTY0ejVFN05ISHdHZ2VBenZwcXdzVVBIdGxTRWtk?=
 =?utf-8?B?WkRUQ3hrMWxTQytMTExTYXMzR3JOWHhad3hCOVM2UFVjN0dGaXpYUzJFUHRz?=
 =?utf-8?B?YWd5VFZRblRzOFAxVHV3eWtGTUFJREFINzRJTUh3c3djS1I2clZ5S3daTjZz?=
 =?utf-8?B?YVlYdnRnRHhNdGtmdmZYR2pMc1l4YTBxcW9JWk9YdEkyYVV4aHgvZTJkZ2h6?=
 =?utf-8?B?T0xJWWdOUjcxZnhiSVAwakw4Uk1lQnBSVkI2YmQ1cmJrWmhBbGNST2RyVTN4?=
 =?utf-8?B?QTRXdFg1ak9oUnI5T2Q1Zk9IRnM4WVB0WGwxcWh4VkhuS2RDcURTVlVCY1A3?=
 =?utf-8?B?QS9rOGhsOGNqdnFNL0pybTk0T3ZQRFFTYkMzZlZXemRkaW9pQzIxUittT2N4?=
 =?utf-8?B?VDhKc0pkOWdJa0JXSFJLeTAycXB6RGVCZkxQd05vN013NExVbHJPTVpJQXpk?=
 =?utf-8?B?dWZZTU9GVWtoMHEwamNpdThPdStzNFk0Nk5LTmpKbXJvYXhPZTI2dDZxb0N1?=
 =?utf-8?B?NTVpNzcwemR6MDhnTjFrcUtOY09SVDMwNkFPNGdQbk1PRjUyaklKMkVPOW5t?=
 =?utf-8?B?OHUwUGQxdDBCYS9PRnJSTFRzb3BNZ3pidHhEWWoxK1BTK2h2UDZjWnRxQk44?=
 =?utf-8?B?YlQ3SHNtMHFsMmdqK1dhN1BMa3M2R1V2M1FsZ2hCL3gzeU41cTVpakNMRkcw?=
 =?utf-8?B?dk9EU2cwYVdPQUVWZTArTXNORWJiWDRFclhVQVBxZGNvdWx2T0QrRnZLUG9t?=
 =?utf-8?B?U0F4QWlKZFJUZmRNZTFGb3BaR2xIbXc5dGFDQVord2ZOS3NZbm9lNThJRXZ4?=
 =?utf-8?B?RXg2TDJEZXRpN1pzYnQwRHlkU2dLdUN5VllHTTNvQnQzeU8vQzZPdFhGVXd4?=
 =?utf-8?B?SHpBakJoS2JwMUNuaE90Vm9MOVlKdUR0QmF1UzRSVk5aMHpGN28yWFFucFI0?=
 =?utf-8?B?WCtXVFc2UU5kNXBTKzZQNDlDOS9uc092Nnp4Mk5CYWV0cnRsVDNOQT09?=
X-Exchange-RoutingPolicyChecked: I/tnrL4GI6RuOFLdaQC5FBKNJ2W89SeyHFUCAaFmb57muyz1Ol0cNHGsfG8mrNJonrW+qAbmj5LY24nV4tX+lJEoQEX/IHaQO5EZem6vo989/TlZyMo4pm7EuI/+x9gi6NnVdvHG+Kg0mjtxVtz+XRusqhSbobpXSYBSFApOtzN1E8DK3PReHZ3CV6l1krIB7srRCZ133kqPRHRo296eIdA0P73nJO14rAclRtciSxgBGFwAvVIqvlg+ZkLdrGlwkBROk9w/tq0a5oiVT3tQYhY8oPk75j4DQWu5zY0jjaAEwRWmj1zkr4GBiN0Cc3aBVcP29uH3hV4o0F4hEm9qHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1c1005-b190-4211-f55c-08def86c97f2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:24:02.5602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0sz3lBqT42qDbRe11mU3t5EOJ4fH04UVGDzK/LMQiBkWLfR2w9gaVCVrBjDNCOZ1vykrEwxZ3FRvlUcZEJpqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
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

On 8/12/2026 15:10, Jakub Kolakowski wrote:
> NVL does not have VRAM and xe_sriov_vram skips on this platform.
> Add the test to NVL blocklist.
>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel-ci/xe.nvl.core.blocklist.txt | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 14e76df47..c73ae500e 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -20,6 +20,7 @@ igt@xe_pm@d3hot-mmap-vram
>   igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
>   igt@xe_compute_preempt@.*vram.*
>   igt@xe_vm@out-of-memory
> +igt@xe_sriov_vram@.*
>   ##################################################################
>   # Valid skip: PAT index tests targeting older/different platforms
>   # These PAT (Page Attribute Table) index subtests validate
