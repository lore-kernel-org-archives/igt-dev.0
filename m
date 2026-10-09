Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0812CA601E
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 12:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486201120FC;
	Fri,  9 Oct 2026 12:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8O9/K38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB1E10E53A
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791548919; x=1823084919;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XkoYysmKi7xAYt7zJehjHFPfKWYsFg8P8k/Spk3QkMY=;
 b=E8O9/K389y7mzk9jQivmxEZjefZfB7suO4q7lXC7ee25Mnqrg9Pf+NLo
 FgtTduFO7OjyAse13bpEJpAb3StlJKr2X3f34XSxUNDPO0CPCHZXzJKEd
 szFieV9x3iG4GhloZpryTRMGo5PsQq71l8NEzusOl1nPVAKhHejmYyLQy
 lhfVHx5P+iqyqAAg2BR/ngdStUG4QupKKi1JJQH2Y19JnplWJcZ6U4M3S
 SiZqJUiDuE2m2BnHL8b0f2mjzvuCYr75flx9btTO0lJtM+8hFj/qfdcuF
 NBEUO1x2XzSY/kfYOziUnHUKGZaWJlL7mKOvbATXRS1baayieHaqe8jOy g==;
X-CSE-ConnectionGUID: yIMS0+mTQgSNA+hsKxj1HQ==
X-CSE-MsgGUID: CYgizvDkQ6K7OAr52K0JuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="246868"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="246868"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:28:39 -0700
X-CSE-ConnectionGUID: JL13fMLGTKKfgngjZ9nAsA==
X-CSE-MsgGUID: CZQGIVnjQYu9d7R4VJkKug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="315135"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:28:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 05:28:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 05:28:38 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.38)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 05:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcPRw9SpZFeksNztp45SWoPhFJC6mVHYHGIoQkAIhYzUwJTzOD5s6BRVsy7lDTJgIMe5FF9237z9/AoHyJqgbcps0DXAwMke5jejM8zqBtMRDP7nk83wZnWZbmRHCFZ2aC3C+ieSyRL6L+xeUlVWX9EJPk8m9IBIBwwgfpry68aYMTp+zuJZJrhbt+xnHTyREI/boQQy0nGFkfgEfQuiD/ubNYvcwLY24zUYn12WLH2hXb0TDNV7nVmFZNamXiSmRD8h1cakbWjuATwjjHeYjLf7a7l69Roj33tfPvFylPfZdW81vmUTqFi2lkILZGXZeh5bwo//cpHs9FAb7KvUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOOl+jC2n5+zu2j77oqEfVelbo8mrxq/0LNnATAgNX0=;
 b=nFqdv1WyDIEiIWjaxnsUvgjVYHIEwvWmNuPqGLysqIN9925XoxzSZ/a2aLcS0hcSj5pcTrTW7Slz3V6gfKLzj6kr2gdbY0uLMSNRVVwBxPpXqdqqFS/Qp3rdMGZGhE7rVlfZ/+UpYAclVvXTbkiOWbpbkxF7YMrrkTI+/fNn2u0JIibhwjrr8Xrhte50Cp8Lx3fkWLUgf7jp2bV1MwPW3EovJ9K6i8YgKU48YbCU3OoiGiMmh8tBgweATz8mmqaXpEWZ+WLIb1a20jJKEYBVUQmzRObi3wflJ/Jcl0Uh+pi14AFxRKIp7qHD+VIOYmqyaCBVZTVlG+oFtBGJv55+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 IA3PR11MB490659.namprd11.prod.outlook.com (2603:10b6:208:61e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 12:28:36 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 12:28:36 +0000
Message-ID: <5f60e040-8329-4de3-beb5-bfac91627029@intel.com>
Date: Fri, 9 Oct 2026 17:58:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] lib/igt_drm_netlink: add event notify
 subscription and event wait support
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-9-ravi.kishore.koppuravuri@intel.com>
 <ecc0560a-f5a4-4ec6-a90b-8509174915a0@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <ecc0560a-f5a4-4ec6-a90b-8509174915a0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0034.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::11) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|IA3PR11MB490659:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf27bf5-4653-41f9-acc4-08df2600d6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|56012099006|11063799006|18002099003|22082099003|6133799003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: rnOsXhgOXLQ/HQdGo2coQQ44ATgToDZECQVJ9Q+y3XTV0gltpSgNtVvQH8KhA8THxQxbNxGk3vPBduKYFkiWqUEAlFmxvlJ/Llm+gZvGaMvNklkxP1OYHf7KidYeORlJA0LX5xac2fmV3SpvnqdzNMUTv2WEhHWkHWMqsi+SEhC+XDQv9ZdrL9DZ4adiE14mjgRzxwSA6CfQ7YD8qHiBRG9ZxNJ4kk+ostFys1ci1zNhNK3k8MXr5RyowdkoNdKSKjr09TfYLoGfqocRWYd2m2Cp395DKmvzVsSVEoGZGSyU6uR1U+b244+ss1kGp+nXRK4yrf5AwJhd2bIZ/kGhaP27ycUUpLsgUuaTIrUkJ8eJsr/nd/HskEG1HO14Qoxv1uA7QmC4TH5Bg8hpQd2kJQSHyWJ95Ku4kiqDMvoQiQRwMBNyH4N2pbP7ykoEz9hJAtT/uT5IRTF56auck6sN/lD1gKZAdo0EJ6NA8MBbTG9d7UMjp/rD6uJNA/66jiD5LIKzbigEn/FWyjyBRjXKFpkzy5gSOdC2dw8gYsMnzyvJ3KJSOI8ucTl1Czex8NgV7+FWgWt7YN+DuKIWf1J4xrLuvP2USPtTYYct93rhaGJ8+4TA+qPdK8FsIVnnWUNUGmumCCYwqMcunw6iTMEs0QQSU+5uwemt7cffHiKRRLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003)(3023799007)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDNObHdBYWdJZEMvYmNNM1dZRUNKVjRxYUgwSVFqRG96bXVaMzM4eVBqRmJG?=
 =?utf-8?B?VmJZbHkwb2J2elFpczM5QkV6c2laVmdvbDFybHU4ckZJSk1pZ2k4Y0Qrck5V?=
 =?utf-8?B?Wnl2SHMwRWlJTzEycStuc1JDNmVORm4xRkgzbEVwcHIvVVVvVEliMEtHWmpG?=
 =?utf-8?B?b1kvdVZpUWtUVmpoc0xHL29tT20wWDY5bGRtalBRWmZMcVlOTG0zZ2hka1JX?=
 =?utf-8?B?SVVjeUxKWHN0ZXErRlV3SmlLdHFlQ2R2aURYNVBJTldhaDlqYUl1MWlvcnNR?=
 =?utf-8?B?cjVuZzl4Nkh5cDZYN3BjRWh2VlNXQlhQRWovUUtmUEJKYVN5bEFqM0JSWHBP?=
 =?utf-8?B?czk1RFFmMmdQSThock1tckVrOFI1cUNKMWRiM3RtNXhBbE9ETHpCWXJZSlZD?=
 =?utf-8?B?b0JkVm9mdWQ0NGVBL1ExT3JzTlNtZTQvMUcvYnR4M2VwL2VZMUNPeG83NHRO?=
 =?utf-8?B?UXNCSEIveVVQSU0rdVZSRkJhcVA5b2Rsb0thbjVlZzBtUStxbW4rVG5aZHBu?=
 =?utf-8?B?L1FGRDF2S0FZdnpLaUVuWkVTekdJVzRmamJvYUlDNCtIVEp5akpmSER3Ull3?=
 =?utf-8?B?ZnlSeExVNFV6MWYxNnFkck5BUUU1WGF1WXVCa3l2VGtaaUJIQ1RRdWkxcVVS?=
 =?utf-8?B?UEVNVUJ1ZVgrdTRCMlF5VFppYytDRkp1M0srMmFtQ1lXRWtyZVp4MXYrQUhk?=
 =?utf-8?B?ZG1pYXMwWEdmWDVNbWRZOGZsdlkzZlFIMHJ2MlIySEVJZUt5c2JCeVVjdUlo?=
 =?utf-8?B?NVZJdWVUdS9Ob0NjSlI1UkZ0emt3T2tsOFJmd1hEQ1VvcFZoR2VqSk1kSks5?=
 =?utf-8?B?elNpRFc3Vkx0QTVmZUgxQzc0RU5pNFZ2QWYwdjBQSDZ0ZjNXT3E4RHViTTZE?=
 =?utf-8?B?aWVVTXZJZFBBVExIZWF3WU9mdGFNSk5xVkkzVGp5aHU4MngvbDhBUjVBdHhT?=
 =?utf-8?B?c2R2a3dKcWdlbTczY1J5cU9iN0Z1WXlyd255aURzOGYvcVNnYXp1WEZYTEtj?=
 =?utf-8?B?QlRRcWVaVGJuUURtaUFjdWZwaUplc0hZZEV0aGJ0YS9XbHhzSUxqQ0cvNk5D?=
 =?utf-8?B?dEZXaWJodkNwaEFxa00rNE9kek9VNmNmY01WUUlGRTJ1N1dWNnMwanAyZThU?=
 =?utf-8?B?dzlPSS9VdGtqTm5salZVbU53akJ6VmVYc09mZ3ZYN1VvWEphQ1psQ3BUS2JG?=
 =?utf-8?B?NGlkR0dWOTdzZjU4UHZlS1MveW5aeUhKeUVTREtXTUhuSytsVVdxOGJWOXVF?=
 =?utf-8?B?UTBHOGlnOUg2T25sVjQ1WmdQWnEveWVoLzhIR09BSU8veE1HKzV5TkdQWmha?=
 =?utf-8?B?eWpucExPMi9RTmpmRmRYV3lIU1JmTG1ZL2RhdnhxZnRCUTBqcGhmYURQUksv?=
 =?utf-8?B?WVpQRUhsSFQwQTZCTlNmSWZDa1JlMy9HeXl2M0MybzN1YjNZTElsMTlHL0tx?=
 =?utf-8?B?UUc1eE0ya0xpcENzUHFFb29ObG94Tm1QR2ZsaEg0Mm1BcVdXaDQ4MG1od2dn?=
 =?utf-8?B?V2VLMm5hYm95YXhtSm5MdjlXazhhVWhoRUtCYmkwS1AwQnpjVUY2ODMxUXpO?=
 =?utf-8?B?NXpTblpSODZiY3BOOHhKT0l3T3ZyVUZzZEordXZxTHQvWmFXdExQeFBVUEsx?=
 =?utf-8?B?VmErYWt4ZUR4U3hqNGZxQ09Kb24xa1lIbm9zbGkweldtRmYyQm5DdkxURTU0?=
 =?utf-8?B?YkUxQzlJMUtqT01VTlJmeFA1eS9ZSmtYUVdKYmc1TGEreEpMK284Y0V3RDAr?=
 =?utf-8?B?YzFjY1pNRzNIdlJBV21iZTVaYVJ4VEg3c3pOd2t4K29jZEorNW1HbEFjejUx?=
 =?utf-8?B?MDRJUE1qenZGdjErWXNuWjJNakRuVzRzbTJZTUd5V3AvTUcwZFlRYXNXVG95?=
 =?utf-8?B?dDdTclVZMzRGWVFsNTVzQnY1WWZtK2NFL0pRbytrSWtGK0tXazA0WHFTMHg0?=
 =?utf-8?B?WVRjcXFBTWl3dURwWjdOL01Pa0gxZEI1RkxISTdNdVNobDFSUlZlcU9ZT3Ni?=
 =?utf-8?B?Qm1XRWdaa2RwYUp4MWZPdEkvZXg1MXpNT05ZZHRmR2VtMTBQYlRmS3JvTnNR?=
 =?utf-8?B?K2lVODc4KzV1WmJDTWdvNVJ6TWR5a1Nid2tzc0FaSnlIdE03MkQ1OWZnZ1lS?=
 =?utf-8?B?bGU4akNkazJ0TytlT2lCbHJBTjJjYmFvYlYyN0h5bEJIdGJrTmRiZXNkejRC?=
 =?utf-8?B?WXloTDVBWkhZSGhuQ0VqaDA4Wng4ODJzQnBWYTYrRUE0ZnRDVDY0akVFMGdP?=
 =?utf-8?B?U2kwMi95OUN5T2x0WTZ1R1U4WEo1azBKdzZDVEpYcDBGWnh2T0M4YmJ1K01W?=
 =?utf-8?B?UHRsSGFxdEVJMWNQc1ZVTWxXMHpDbDZQbnNEYVBpYjZUU0hSSDVsSWM2UDFR?=
 =?utf-8?Q?bmgOJZmLtVnTPduE0kJrGCesGnHU6yZb6FU2F?=
X-Exchange-RoutingPolicyChecked: kXJ6Xk7mn44cKHvT8QEmph4NYWK9eCk61uy8Gtw5EAxwNzIT2CfWtgLMnvxCtB1XlkDlxbcqZu2u6lXNKMKHZ7wvWBArFXHoD9j4Ouj7/rYLCd3hd1KTIL5HWVsstmzioEBqdjy8vXzCrqvui+1sjayEzlrhAIxjYWPSoext/zwX6/nCQt5u+qVXiKG5DE/sNOfgJZ6LdjoBt4Hl8AZMA+1iiNPdsT0vjKQ8mMy5hIHJP0XlSMn0EvboZoDFi7CpORqhx+5hiJZnjZp3Jir+qTLCN2lg6kVP76H67UJeqVt7ki/ZDcDcz2J72eTCWnqhK/hV+OnILIHEEebajFmlQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf27bf5-4653-41f9-acc4-08df2600d6d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 12:28:35.8978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRx+ziDJn7HQtCKCHAU5saqc8jSg29nRPl0broYLBHjd8wP0Ov1NLxLpcN7Z/DUy0608SDT5dSd5XJeTPRnCrZG5dc7ddQMdBCw/O08m4KpfCoVzlcIYycZpkFqmaFVf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB490659
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

Hi Soham,

On 18-09-2026 20:33, Purkait, Soham wrote:
> Hi Ravi,
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> Added event notification support with subscribe for an error-notify 
>> event
>> and wait for the event notification functionalities.
>>
>> Cc: Purkait Soham <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Jadav Raag <raag.jadav@intel.com>
>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v2:Handled SEQ_CHECK nl response using separate callback
>>     Added monotonic-clock deadline to wait for messages without 
>> exceeding the
>>     caller’s total timeout.
>>     Added support to receive events until it sees an event whose node 
>> ID and
>>     error ID match the requested values.
>> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>>     Jani & Kamil)
>>     updated error event name from error-notify to error-report to align
>>     with the latest changes in drm-uapi/drm_ras.h
>> ---
>>   lib/igt_drm_netlink.c | 154 +++++++++++++++++++++++++++++++++++++++++-
>>   lib/igt_drm_netlink.h |   6 ++
>>   2 files changed, 157 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> index c0e3aff9b..6a3e475e8 100644
>> --- a/lib/igt_drm_netlink.c
>> +++ b/lib/igt_drm_netlink.c
>> @@ -6,6 +6,7 @@
>>   #include <errno.h>
>>   #include <poll.h>
>>   #include <stdint.h>
>> +#include <time.h>
>>     #include <netlink/genl/ctrl.h>
>>   #include <netlink/genl/genl.h>
>> @@ -28,6 +29,27 @@ static int ras_command_cb(struct nl_msg *msg, void 
>> *arg)
>>       switch (gnlh->cmd) {
>>       case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>>           break;
>> +    case DRM_RAS_CMD_ERROR_EVENT: {
>> +        struct nlattr *attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_MAX + 1];
> Move this at the start of the function.
will separate the attrs for event and other commands. events specific 
attr will be needed only for DRM_RAS_CMD_ERROR_EVENT and so will create 
struct nlattr *attrs inside the switch case itself. And will move the 
attrs for all other commands to the beginning of the function.
>> +
>> +        ret = genlmsg_parse(nlh, 0, attrs,
>> +                    DRM_RAS_A_ERROR_EVENT_ATTRS_MAX, NULL);
>> +        if (ret < 0)
>> +            return NL_SKIP;
>> +
>> +        if (!attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID] ||
>> +            !attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID] ||
>> +            !attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE])
>> +            return NL_SKIP;
>> +
>> +        ctx->event_node_id = 
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID]);
>> +        ctx->event_error_id = 
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID]);
>> +        ctx->event_error_value =
>> + nla_get_u32(attrs[DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE]);
>> +        ctx->event_received = ctx->event_node_id == ctx->node_id &&
>> +                      ctx->event_error_id == ctx->error_id;
>> +        break;
>> +    }
>>       case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>>           struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>>   @@ -61,13 +83,20 @@ static int ras_command_cb(struct nl_msg *msg, 
>> void *arg)
>>           return NL_SKIP;
>>       }
>>   -    ctx->reply_received = true;
>> -    if (ctx->ack_received)
>> -        ctx->cmd_done = true;
>> +    if (gnlh->cmd != DRM_RAS_CMD_ERROR_EVENT) {
>> +        ctx->reply_received = true;
>> +        if (ctx->ack_received)
>> +            ctx->cmd_done = true;
>> +    }
>>         return NL_OK;
>>   }
>>   +static int ras_multicast_seq_check_cb(struct nl_msg *msg, void *arg)
> What is the use of this callback ?
libnl checks the seq no of responses against the requests and if it does 
not match then the response will be rejected. For 
DRM_RAS_CMD_ERROR_EVENT, we are not sending any request but listening 
for the broadcasts from kernel, which will not have any matching 
sequence number to compare against. This function is registered in 
register_multicast_callbacks() to just return NL_OK to skip that check.
>> +{
>> +    return NL_OK;
>> +}
>> +
>>   static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr 
>> *err, void *arg)
>>   {
>>       struct app_context *ctx = arg;
>> @@ -121,6 +150,23 @@ static int register_callbacks(struct nl_cb *cb, 
>> struct app_context *ctx)
>>       return 0;
>>   }
>>   +static int register_multicast_callbacks(struct nl_cb *cb,
>> +                    struct app_context *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, 
>> ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_SEQ_CHECK, NL_CB_CUSTOM,
>> +            ras_multicast_seq_check_cb, ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return 0;
>> +}
>> +
>>   static int send_and_recv_nl_msg(struct app_context *ctx,
>>                   struct nl_cb *cb,
>>                   struct nl_msg *msg)
>> @@ -263,6 +309,10 @@ static void reset_drm_ras_netlink_context(struct 
>> app_context *ctx)
>>       ctx->ack_received = false;
>>       ctx->response_required = false;
>>       ctx->error_threshold = 0;
>> +    ctx->event_node_id = UINT32_MAX;
>> +    ctx->event_error_id = UINT32_MAX;
>> +    ctx->event_error_value = 0;
>> +    ctx->event_received = false;
>>       ctx->family_id = -1;
>>   }
>>   @@ -407,3 +457,101 @@ int 
>> igt_drm_netlink_set_error_threshold(struct app_context *ctx)
>>         return 0;
>>   }
>> +
>> +int igt_drm_netlink_subscribe_error_report(struct app_context *ctx, 
>> const char *notify_group_name)
>> +{
>> +    int grp_id;
>> +    int ret;
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0 ||
>> +        !notify_group_name || notify_group_name[0] == '\0')
>> +        return -EINVAL;
>> +
>> +    grp_id = genl_ctrl_resolve_grp(ctx->sock,
>> +                       DRM_RAS_FAMILY_NAME,
>> +                       notify_group_name);
>> +    if (grp_id < 0)
>> +        return grp_id;
>> +
>> +    ret = nl_socket_add_membership(ctx->sock, grp_id);
> Before this it is better to have a check for duplicate-subscription.

Even though multiple subscriptions are registered for the same group, 
kernel broadcasts only single message and it does not lead to any error.

But it is safer to add a guard to check if already subscribed to the 
same multicast group or not. will add it.

>> +    if (ret < 0)
>> +        return ret;
>
> libnl error codes (NLE_*) are not the same as standard errno/-errno 
> codes.
Will convert libnl error codes to standard error codes.
>
> Thanks,
> Soham
>> +
>> +    igt_debug("Subscribed to DRM RAS multicast group '%s' (id=%d).\n",
>> +          notify_group_name, grp_id);
>> +
>> +    return 0;
>> +}
>> +
>> +int igt_drm_netlink_wait_for_error_report_event(struct app_context 
>> *ctx, int timeout_ms)
>> +{
>> +    struct nl_cb *cb;
>> +    struct pollfd pfd;
>> +    struct timespec start, now;
>> +    int remaining_ms;
>> +    int ret;
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0)
>> +        return -EINVAL;
>> +
>> +    if (timeout_ms < -1)
>> +        return -EINVAL;
>> +
>> +    cb = nl_cb_alloc(NL_CB_DEFAULT);
>> +    if (!cb)
>> +        return -ENOMEM;
>> +
>> +    ret = register_multicast_callbacks(cb, ctx);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        return ret;
>> +    }
>> +
>> +    ctx->event_received = false;
>> +    clock_gettime(CLOCK_MONOTONIC, &start);
>> +
>> +    pfd.fd = nl_socket_get_fd(ctx->sock);
>> +    pfd.events = POLLIN;
>> +    pfd.revents = 0;
>> +
>> +    while (!ctx->event_received) {
>> +        if (timeout_ms == -1) {
>> +            remaining_ms = -1;
>> +        } else {
>> +            clock_gettime(CLOCK_MONOTONIC, &now);
>> +            remaining_ms = timeout_ms -
>> +                       (int)((now.tv_sec - start.tv_sec) * 1000 +
>> +                       (now.tv_nsec - start.tv_nsec) / 1000000);
>> +            if (remaining_ms <= 0) {
>> +                ret = -ETIMEDOUT;
>> +                break;
>> +            }
>> +        }
>> +
>> +        ret = poll(&pfd, 1, remaining_ms);
>> +        if (ret == 0) {
>> +            ret = -ETIMEDOUT;
>> +            break;
>> +        }
>> +
>> +        if (ret < 0) {
>> +            ret = -errno;
>> +            break;
>> +        }
>> +
>> +        ret = nl_recvmsgs(ctx->sock, cb);
>> +        if (ret < 0)
>> +            break;
>> +    }
>> +    nl_cb_put(cb);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (!ctx->event_received)
>> +        return -ENOMSG;
>> +
>> +    igt_debug("Received error-notify event: node_id=%u error_id=%u 
>> value=%u\n",
>> +          ctx->event_node_id, ctx->event_error_id, 
>> ctx->event_error_value);
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> index 9376e3dee..ebc575da6 100644
>> --- a/lib/igt_drm_netlink.h
>> +++ b/lib/igt_drm_netlink.h
>> @@ -19,6 +19,10 @@ struct app_context {
>>       bool ack_received;
>>       bool response_required;
>>       uint32_t error_threshold;
>> +    uint32_t event_node_id;
>> +    uint32_t event_error_id;
>> +    uint32_t event_error_value;
>> +    bool event_received;
>>       int family_id;
>>   };
>>   @@ -27,6 +31,8 @@ int igt_drm_netlink_init(struct app_context *ctx);
>>   int igt_drm_netlink_get_error_counter(struct app_context *ctx);
>>   int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
>>   int igt_drm_netlink_set_error_threshold(struct app_context *ctx);
>> +int igt_drm_netlink_subscribe_error_report(struct app_context *ctx, 
>> const char *notify_group_name);
>> +int igt_drm_netlink_wait_for_error_report_event(struct app_context 
>> *ctx, int timeout_ms);
>>     #endif /* IGT_DRM_NETLINK_H */
