Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BA5C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 04:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A52A10E549;
	Wed,  8 Jul 2026 04:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpdYv2PZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C62D10E549
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 04:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783486201; x=1815022201;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=X9IDasg0KBSgT1Sm/xwzsSSxEmvo7NcyOdZmHsQM77I=;
 b=jpdYv2PZOSt+SwR5W0MA9i10Q4O5RwX7fVuKoSmOpiXhXY3x+qJw2vaC
 t2EDkUDS9DG8lHyIKU0jduIP5wzCTr73zfuYdDG45TjD4XOHTTB413r3H
 B/rpgHThnOLaI6n2/dH94ha8bCTCU/cBnLEtODDVQ5UihzgGEr0eP+o9h
 JAzLa7YGf9AavIAhG2ceuqf9W2//O9HM463IgzCs3ug8/lZqZsKnLfYWG
 HOKU0lKskKSCzIAGNEX0YQs9vFe6t7Kg5KLmT3AlKROCIEdhPJK4U7uKT
 uUSZWTKFarZ9bgOzJvqqpncQOUBEJ7FskIKfkTNkzpbuQAuukR+keiJkc w==;
X-CSE-ConnectionGUID: SXgOuKAvT+6RNCyn3GuDXw==
X-CSE-MsgGUID: 3TuK8wqPRmSSfcytdHUJ1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84332699"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208,217";a="84332699"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 21:50:00 -0700
X-CSE-ConnectionGUID: kQ6g4JB3QGOxxjdri3Xulg==
X-CSE-MsgGUID: jNj/0V4+RV+rkpJ9goyBSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
 d="scan'208,217";a="252438700"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 21:50:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 21:49:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 21:49:59 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 21:49:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQMrHZ175jilbYKX80dxoA4hMCAONgvjTrFobGn6WlwG2c7lAfhcJxaCPv5XE36JpE9r0ZcA1TlA0/Qu0YJYrNZkJWXrdT1PQgYvVz7a5tangSaxMDY875QanLHWy1zFg2X3cJyFHE+FPmDS8bGqh+meSKHOQ64GLYe3mV3sZkOvXhqVrLmHn7yuRULX5dSB9pVMYSnjD4rze/s9FOaPK10sA9YzsSSLH2OTuuQoOrihsxbmpEuWekXeSU/2AKULCuOzNCe72z69OHyjLOTbpzXbEZpBlEBx7NbbbUqTHVi8UYGJLyXDfrmTg2G84wdLtXQjQvTAd9+tyqMc6ysR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZTgQhQ0t0o+Tx/QQb8Gb4IvDlHqYuzysxbR/DzIomo=;
 b=K2yOh8aeJ7x2l3kAlygP4OAsMDVAxIU+GlXX6w7/zDt76SmhLMgHxHRWKGCwpxYkYHT6pvSHlLuHqT2DlXEwt106ErAJykR7VKkJjm8xS02kNCX8SblsoAjwzrTfATlVO1WNQkc0iUjzoHtFUBpvR3pDKapgOVixei1jS9Np/y2IKBih8OVjm4w2gAu/bcbl+xTfzAkKy/xM2uBYET/L0s1TNOZcGTkSRdPo9/ZmcrIGIEco/VlvnEL9OlS3laZI6NOlpDVxGe2voBwyu5igp3AAtk0IoBxWcd0Q+tg4iC3LpyAWP6wIw5QCSkvYDokJeR7fConcaC9HvUUqlT7QUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 04:49:56 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0159.012; Wed, 8 Jul 2026
 04:49:55 +0000
Content-Type: multipart/alternative;
 boundary="------------ub2ERUvw1KVmQDyWlzSOo8Mq"
Message-ID: <8a286006-268c-4d98-9b24-00d9d281be30@intel.com>
Date: Wed, 8 Jul 2026 10:19:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Skip mirrored pipe
 combinations
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260707041113.3997991-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260707041113.3997991-1-jeevan.b@intel.com>
X-ClientProxiedBy: MA5P287CA0330.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::8) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|IA1PR11MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d10c1bd-37ef-4969-8755-08dedcac5b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|3023799007|8096899003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 2Wdjj1voBzm02etCX2+tty1iAjaIPdJkK1NeF7c5kyLuW94fujgsIHGp4rGyf324fGQ89708nopmomjsPNbYm32odc7jLelCLALPqYLMG38C1dBkAHQ4oyC+GSEMOEIt5NPD7ouvoDWTrj7Dpg5yaT1JqqdVsG7AeYtWepvaDihfJTLQo2tV7fkPp4Gz5SUEJkOdrZqx+/aWURVKFs+jC+ico9Gu7YbH1zHE+4NEZTc1tUMOIcwfEO2uYbIyPUgvx0Re9fB8MDzGlnYgAM1NQFLZ52HmmyOQzzDrzixauZ3lJ8xtuUIjtg3m1cQXtJHXK7r+DfTXN+q5c4q89UqfH4WKd5ET9rlFmGEigwfht5Br0pLu0fcDDNyyyV5mtw3k9McGA8Wn5xUKq15YsYD1BRf97xxLbAeckFzmM5vKKlVg+2oiqxqsuhJ7dbZk5U5/iBz4BAeB7mKCNE9Paw7rValoan21qwS0Mg0007wIMDo8J9hT9MmUk5C3Gsa+JWLb2V1pSrxR0Dd8R3ZaDfy/1mfn22LzTDd8muy8u3JZ3EpttPN08AOYaKTqiXIECzePh6ogXwVyehcJiwa1j3JEeaQXZGS4Qlnw8fbbzNqg5bfzbD7PfQl1WVeRVOS4sWuBzRpzkg1kL6NRN0REHffudRDvyzSQzJDKa7HkEg018hw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(3023799007)(8096899003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJaK0lNZFlFaUFhMU5YQWI1TFlBWjdsYnNvUzE5YWJBTExhakFsSXpSZVRU?=
 =?utf-8?B?OGRyU2xkamVxTHp3WVBKWVlMRmJWYlFMNWNSaFlqNFRqK2RxMTlOZ0QxWGtE?=
 =?utf-8?B?bXoxZmFxQ2oydTNnUEcydXFJY2k1YVM0cER3b3RSVlN4anlHQnpyOUJ0a2RZ?=
 =?utf-8?B?R0w2aXdPbVFVbFE0Z0JBMTZSODFvUHBlbEhLK09VcmlmNXQ1VVJKTFk2bU1M?=
 =?utf-8?B?KzdRaFphajU0VnhraTBtem9sSEhFY0c3dTI3YThzelJSY2o1NGRIQTd2NlNj?=
 =?utf-8?B?UGdtVWFMUzFqWVZIaFdnV25XUjFBSm53UGxvMnhGd2RnL2V2aFlDNW5OVWJI?=
 =?utf-8?B?TUdDN0VjQS9oa3B4MDB6MDJWSmJTSUNZWDNQTHoyTGkrY0hacmRRNFgrSnVF?=
 =?utf-8?B?anpxMG83ZzhLZVRRSE1nYkZSNFFseEZ3SEQxb3NrODU4OW1iU3N3L1gwaFZR?=
 =?utf-8?B?eFBKVW9ZQzdwZG0yNm83UFBoTGhRR1hQQmFkMjVGSy9vSm1CbkdSSDZPeHYr?=
 =?utf-8?B?dlc5bXBTUW1PQWcyREdJOXN1M09qR3pXNklncEVvaDhXbnJQNUU2V2xkRjZj?=
 =?utf-8?B?NVpPRlYwT3o3UE04a3dCMjhQZWVuWU8xL2FKUDlXMjk5T0VRc1dRZnViblNB?=
 =?utf-8?B?RFFUbVVkRG5YKzdXQ2lxcStQeUxUcVNmditDcUk1MU01cGxERW1mR2t0N2wr?=
 =?utf-8?B?a1lBUGMzeW4wUE9CSVB0REZtOHEwUlh5cmFtM3RQTGdjbk1HVVBhN293ai9C?=
 =?utf-8?B?KzRuZnp0VFI0VXZ2SEZyclJDT09wUFhVZG5ZUDR1OWMxS25MRGJCTXFZczVV?=
 =?utf-8?B?NnhCKzFveW41UlRocDdOdzl1eTl5K2g4NGVKaS9STUxMZVhGNHlDTjdpNlFh?=
 =?utf-8?B?N1FaK2dzQVh1WGR0NXYwWkYxRElTQW1lMlh1aE5aU2JDV2dFU3oxaUlNRWZV?=
 =?utf-8?B?dmZOY2pyOGZ3SkJjNi9OREpxNm1KNG5LK3N0Y3cxQk1NZGxYdzZrcUp2aUZU?=
 =?utf-8?B?ejJ2a2pCbk1jNUt6L25Vb1JzNXNZQXRMZmZCN0lrVGxkYnNsYkJaTTcwUXdk?=
 =?utf-8?B?L0FFQytVVjV5akh5T0VkWDRIS2QxUzB2bkMrdndadlFqTE5UNXpoclJkZE9U?=
 =?utf-8?B?Wm41S3JpajBxaDFsZEtqdjV2UURsMVNBUGF1Y2d4dFFERkFpTXRUOTRVS0Nm?=
 =?utf-8?B?MG4xRnFrdEE2UmR1NExwaGNHd0lhWFpHQ0JKaDAzODRIQWJPM2hxSEhlM3FM?=
 =?utf-8?B?MjNpVXR0VUVSVmQzeTNwUW4wbXpRTm80NkRwTjhjZkJWUHZHelp6WllCSXhw?=
 =?utf-8?B?eUViVmc4NWxXVm41YUR6Tks3M2I3UXRyM05QRExvdVJvN3JrcXBOWWh2TmZw?=
 =?utf-8?B?Z3B2VVIxRkM0aVRmeTBKVUhBU1BIOU5yQlJNRWdwVVpZcnlXSmI1NklmclNt?=
 =?utf-8?B?Q25zRkQyQTFMWE1OSGtwNVJmdzZVNjhZcWU4bHhLNzAzRWRyUzFBc2Q5bW85?=
 =?utf-8?B?enJ6RUxWUVNnblRJUDk1dmFkM1NoNWRNZHNPb2FaRTcyUkQ1ZHJubUdzY2dH?=
 =?utf-8?B?ZHdDNE5xcUtIc2MyYzBRWExOYkZsV2drTjN3WWNjTWc5bVBUQVNDMUd2TWts?=
 =?utf-8?B?MTV6NjJOZVlNNVhGWDlYQndORWhSSXdJOXNLaUYrYmRPUzhxUWlVaE5EZ0ZJ?=
 =?utf-8?B?OXVqVWZHL1NQblVWTUJFUXFMczVBMUx1amNJZFNLMWJJbEhJUGVqSTBac0px?=
 =?utf-8?B?RFJoNmp6ZENyR216SkdROXp0RmpCdHhwZ3lkWkF5M0tXcXplY204MnorMGM2?=
 =?utf-8?B?eU9aek5SQS9ybHh4dWF2VlpwREVHVmxvbnRORytPdHJiNk9aQW1sWjQwV2dw?=
 =?utf-8?B?dkI5Rk5WNkR2UXUwdHpJaHlTQVNBYjU1ZDVqR2Z4cUYxSWhtVGZQdGcwVlNF?=
 =?utf-8?B?U0RSQng3MzY0OGZ2RTBjMUgrMmJEWE1JaXdwRGhqb3NSYnFBdUJ3VkNkbEx5?=
 =?utf-8?B?MHhSaTRwVVRPSWdnekltdTl4S2FrNm1sVW5lMWN6K0ZFNE9jd0tuYmZqc2V5?=
 =?utf-8?B?WlVCRGxwTC9mdnN6dDEvektLOGdmZ1hzRnlSU0dBbEpVT0tybFAwTWtFeWth?=
 =?utf-8?B?L1JtVFdPVkZnZG1jT2dCdjE1SmlTR1krRjBLdExMMXBxYnlxTnFyL1Ezb0k3?=
 =?utf-8?B?VFJWYVVkaVZNSUVlNUhQQnBtZlZLVHVJVDVIWXRVQ0VsK2xPU2pUT20rUWtu?=
 =?utf-8?B?a3JwVmU4ZHlQSjFrUGZJZTlaRVBxbFpRVWJaUTYxQW1Jb01kTnNmSE1yWTRs?=
 =?utf-8?B?NGRGekY4d25OTzBmZk1JVHNGUjIwYTkzZG5ELzZqYm9TeWtSaXZ1K0s0eko4?=
 =?utf-8?Q?TcoKLYuYvNi4ck7k=3D?=
X-Exchange-RoutingPolicyChecked: hBqZVZKQhYkqP/3nSw0vGBOLwTxoTmH45XrXgKjTL6LqFSXEMw7DSUxFR5A/rZ6eBLKvahKBs0JUJCwaInK8ZVSIr2FnDFF4NSadSZTLvW5nGbS4nCGewyhSOPQDTuJYtclNB+t3sIhFb1sDDu5Z4VTs55N6v955rFSib2w+2lS3o58qHj607lSmgwcidJj8xnaUy287/XfINirFe9cIIhBOteJOc17qLTVob3Yrnpn/fV3hMrATTkSRJopXQQGyGkA4drIEfudc4XwDCxGt9FJ8UzKQcAykoASP9HbLinL8AJGOnUqkhVFz3MeX70zs3bLSPO/oAOLR6VR+uOb7iQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d10c1bd-37ef-4969-8755-08dedcac5b25
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 04:49:55.8038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/n/Tn+oeELt4zvdPirGi93ZDIZ8rrbO6qiFGZuH5pSfhDCF5jqj9PlQbSTEU4dnFcgxxAHFgrSIdQMbjElSe5/kyY1VkQL7VC1XfAGxh8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7854
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

--------------ub2ERUvw1KVmQDyWlzSOo8Mq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeevan,

On 7/7/2026 9:41 AM, Jeevan B wrote:
> Use a canonical pipe ordering in extended-mode-basic so each pipe pair
> is tested only once. This removes mirrored combinations (A-B and B-A)
> that provide duplicate coverage.
>
> Reducing these redundant combinations lowers the total number of dynamic
> subtests, helping prevent incomplete test execution in CI while
> preserving coverage of all pipe and output pairings.
>
> v2: Skip mirrored pipe pairs, but keep both directions for SST<->MST
>      combos.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index d8aae4256..c1876aa05 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -193,6 +193,11 @@ static void run_extendedmode_test(data_t *data) {
>   			if (output1 == output2)
>   				continue;
>   
> +			if (crtc1->pipe > crtc2->pipe &&
> +			    igt_check_output_is_dp_mst(output1) ==
> +			    igt_check_output_is_dp_mst(output2))
> +				continue;
> +
>   			igt_display_reset(display);
>   
>   			igt_output_set_crtc(output1, crtc1);

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

--------------ub2ERUvw1KVmQDyWlzSOo8Mq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jeevan,</p>
    <div class="moz-cite-prefix">On 7/7/2026 9:41 AM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260707041113.3997991-1-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Use a canonical pipe ordering in extended-mode-basic so each pipe pair
is tested only once. This removes mirrored combinations (A-B and B-A)
that provide duplicate coverage.

Reducing these redundant combinations lowers the total number of dynamic
subtests, helping prevent incomplete test execution in CI while
preserving coverage of all pipe and output pairings.

v2: Skip mirrored pipe pairs, but keep both directions for SST&lt;-&gt;MST
    combos.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/kms_display_modes.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index d8aae4256..c1876aa05 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -193,6 +193,11 @@ static void run_extendedmode_test(data_t *data) {
 			if (output1 == output2)
 				continue;
 
+			if (crtc1-&gt;pipe &gt; crtc2-&gt;pipe &amp;&amp;
+			    igt_check_output_is_dp_mst(output1) ==
+			    igt_check_output_is_dp_mst(output2))
+				continue;
+
 			igt_display_reset(display);
 
 			igt_output_set_crtc(output1, crtc1);</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260707041113.3997991-1-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------ub2ERUvw1KVmQDyWlzSOo8Mq--
