Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E926D10854BE
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 08:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955AC10E0DD;
	Wed, 18 Mar 2026 08:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V14+s/aR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C1E10E6EB
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773824062; x=1805360062;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3/GY0oy0h1n//zH4crQa5ksvRGOmvC8JtkUWsT9CKEU=;
 b=V14+s/aR7hBMK/7HS/Ay74eE3iwCPthIlT4U66IH6RDkAgA+ZC5juQ7v
 ZUE8XJ6P6++rpLN+5Fguf26QsEH27vE0MRUHZM6E2nGyWvcZGWpWRcapm
 FGX8/OmMSFkQ4iQh7CKxSWaxbj1oOFLS1a3hARtA57/weVbiEU1BmPeGZ
 LhJHRtV1NBmhnUjZouDJMD7wanYx9oD/XutqGIXJBE5jqZAc1dl4j/0Fx
 IC6EYUkY3EHAfKn5dmaKMrcK41NpziDlgs1HPN8HrA+cG8GtKDLzsXoDN
 5qxmXQhEoURG3kYiIdsKfxSJu0EMRPxWPka7cwWbt90NlPD8q3SIy8Eso A==;
X-CSE-ConnectionGUID: /tCPro3cTA6GL8XuT/6JOw==
X-CSE-MsgGUID: QqK2RQTeSWWJbA0H8VfDzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74759061"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74759061"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 01:54:22 -0700
X-CSE-ConnectionGUID: rFa8m0XzSNil3uHd7XjiPg==
X-CSE-MsgGUID: irND6OJOTeK+yhzH7psyPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="221795296"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 01:54:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 01:54:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 01:54:21 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 01:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wy18KduxPMDcmVyYYmb+jlgGk53G55qYRuO5Pt44DhOQVswMKEYbSoUYMhq936TZIn9hOVek07OEptl81vl7GC3W7+wqDX6BCklzGk1+4OfoKMDYCEN8JOj31UtYZw5lGbE676agn7W3G08u+4REcahB5tzGHeaZEeBQviEsU8mGUoIzsYqykURi6EsrQTnBP+v1x14EXEvO5Uyd7sW2XSNPrZLiz1ZyN/k3d3Hwat/UiCU3keOBpsAzuU3tJONun+X3z4VVv/k4w/ZkfWzfLZR/S4D4IGWYU720sGlqDEOmb4iP8bdzwqC472WlNLH3hZnHmR/46JUiNS9Dg4AXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qT/H4rrqbaphmQd6do+2TA9MhPxdTE8xpiZA2zDJ/tw=;
 b=b2lz1C9KR8YdOXpI8Hzyqeny3hDZxRLrSPfojZSPb/5gt5IHjRnmraEyMxLhkok5oUw+sjg5bG0UrCNz90tPS+nyHey3NV3nE5IHrWMSW9v78JjTPyJjwohiEQ9G2Rdqo5E4xcbpjqNVED9mADAOBU4phyNG1YUxNE5UkkXYDrZ6lYZZh3jHs2BbNx8oloW2caYl7FI6fXxNNKnHTBzc0ZESwKbZf/RKo5mFBM3gdWzJyZvXIogMwlaeoKoMB32EnxVJ30m0PlnH4S3jPa8zEszUfeuWWnfSjK0Za7wAPPccWnTWGZCAkgOFQQvgjbi+vQF4hds81hYFZ8tVo8hL/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by MN2PR11MB4710.namprd11.prod.outlook.com (2603:10b6:208:262::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:54:14 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:54:14 +0000
Message-ID: <80257ff3-e7de-4c04-bc97-bdd6b51147fd@intel.com>
Date: Wed, 18 Mar 2026 14:24:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/igt_psr: Fix Early Transport status handling
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
References: <20260226094251.3986123-1-ramanaidu.naladala@intel.com>
 <20260317193058.722290-1-ramanaidu.naladala@intel.com>
 <645964eee31a4df3c4fb1cf844f07e8bd9352424.camel@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <645964eee31a4df3c4fb1cf844f07e8bd9352424.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0105.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::7) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|MN2PR11MB4710:EE_
X-MS-Office365-Filtering-Correlation-Id: 8654f611-028e-4379-b120-08de84cbedde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: rhTUok9FG90LZU/2Y1sEhY68C41U8Z3gRi+3gGPuFtWmyp8wnJSI+aTQpJkPkjuYILBD+nR/Gbs7qrNYd2zvaQIJnQUff+8+pbomOtZRQ9WhB73RFb/DtnUMc/KSkNBcASzG+LD7JRoEuQ6Ktpp3HJfExbOxVTkM7dnEFNEuEK0+5K0OTp863EGuIk2TV1/ZduQbiWqObbnyk3I+nyAl/s6DRlIBAcHynXqqibnQ2MhDfiRfijwaFnKM9vQH5OUkU5PP680tcY3O+SUgvH0oDS66f9j9zbxHU5dOJQ74Ks15GEEAKeq89+YvlBoFd6uHBKbBm2CaPmlvf3CP5s8eomgAdQ8bPbSGlTLZV4PHN3oJz2C4O3aeLJkGzrolR27yqMoWXyLxUNVbU0KybsXsmhdfgEkXPS5KuRQmoWuwdzB1bCUIdpua8WoAk3LrbRRWmTC04CzD8EAKUXxsDM4ofFh6eq2ToskHT32LM87w6pgrnMWl83DS/zE4mwUB32cGhx/b9NXz2FNseEhmb6b8C5cLjEkkediCgGB2tS0p8V627LNusAV8d+VfWh663IgYOMRqdjSahpTupqsGg888+jvpdVP20Ogxxl5qS7O9KV7fep1SYvAZFjgJYpNaImeOUgXBmQoDO7eDU3dU0RiKntjH7evsV8EzSXUAptn9fKYo6m9f5D5zeESrp+Tlhn9ffdlqDTCOIljl6p0hp4LIeNzh9PujPDyS3EwGe5LUHUJaEO+jlkzUOGr+PU2PHotS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1ZFTFp6VkIvVUZ2bHNLcXE3YlNYSXVUdllGN2ttVFNHcFcrbkc5Zm9zZFZ1?=
 =?utf-8?B?dXVpSFMzT2tCZURrbmNpdXRKSmh1Z0JmNjZXUnYrYTdGbGN1T0kvbkVYck5t?=
 =?utf-8?B?WEVKcEtMdGxsUVNLcWN3Q05kSnRpb1BnRGxqTzNlVmxsWnRmRG9kRzhPemRI?=
 =?utf-8?B?cVBWN2U4bVFOLy9lMkJmTjcwbXBUVXhkR1dWenExOTBXM1RHb0RwWTFZYUdz?=
 =?utf-8?B?eG1qVmpvYS85aXVTVm1OdWt4cnJZQUdPRE1VZE43ckZYcXJhS2JKSXZxQStv?=
 =?utf-8?B?VHl0NEpVMFhYTDExVXJBSmp1dTJtajNlaU1zYnY2UGhSa2c0L3FqcEJCbTF6?=
 =?utf-8?B?OURwaEdsb1dxUzF5WDAxNHU1Y1BpNWZyZ21ERGhsMWV6blRjUk1pRk9Lc0Rp?=
 =?utf-8?B?UCs0dlFFRzJjN1VycmlURytGRkVtc3V5TXdMcGcraFVWZWFsQURHTk1VN1Uw?=
 =?utf-8?B?YWFxYnp4OGdUUUVyV0hQSVZRTXRYeUFIYzBLemM0eHVaVHIySWJ3QTlUSllL?=
 =?utf-8?B?WGNITlNmbmZ5RHVkOEpTSGlkNlN2RVQvUHFZMk1CY0tqWmF3SkpRaHQrVGcv?=
 =?utf-8?B?MDUyNEJhNVdsbEVEM3RaTUNXeXVaYUlQaGxEeWNML0liTVZ4a2h6M21qemhS?=
 =?utf-8?B?MnRKc1JFTU9HUzZ2NXFyY2xPKy83U25neVJVeVAwcEZXaDdkRWhnNjVBR0VE?=
 =?utf-8?B?WURXZlpoakhlYnZ5SXQ4bGdjY1pubXh6QXJQekJXSDZzbzJjRmszMWlZeW81?=
 =?utf-8?B?aEdPTksrQlpOd2xKNmNjYXpVWWNrNFQzSkx4ZHptMDhxWmJYUnpPUGpNT09U?=
 =?utf-8?B?NmxFaCsyaVh3eXBTU2NnSk85THQwK0lXVjNHWTR6M1NzN3o2bXY1UVRDcldW?=
 =?utf-8?B?bjVJMktwOXZ1WjBKbE5sdDBUaFVKM1VqWk10WXhsMEhzM1MwMUJldXA4RTRl?=
 =?utf-8?B?MEdXK1pST1VrZ1BzdFNBSVpwN1VOUkgxWVJ2WUtsczQ2elpUU1Q4U0NDTjBX?=
 =?utf-8?B?ZGRCNTZ0eWVQdmVVU2pNSXEwM1JSSXZCUkU2TVN6RmJTRlVPYkVJMkRzYTFS?=
 =?utf-8?B?aGNycXNRZGo4bU91V04zS2R4VVd0OEpGMVBMajlDcTBjOGV3ZzQyTFNkWTZi?=
 =?utf-8?B?QjBKcENZaEF2a29oSnhkUmZJa0V2dDJ0LzRJWVJ5aVBYNFR4aHRCbys1ZGR5?=
 =?utf-8?B?OUViTk1CWEk1TFd0Z3lQU1RZN3E0NzBQNGh2VjZGN3g4SHB0MTFWN2dGYm9G?=
 =?utf-8?B?aSsyYTZoVnFPcVRBejlUU1ZLMWgzdjNjWEMvQWdHMmMraVVhVzMwODlOZVJS?=
 =?utf-8?B?ZWFiQ2MrNXNYeXFpQU4yQk91bWYzWUtVT1VZeGJhNHAxTUJKNjN2YVp4US83?=
 =?utf-8?B?YkpENnlaaW9CaFhzbEJ3L3BYc1djN3YyN1FtWGtCMU9IN3BVVC9oZ3J1NUxG?=
 =?utf-8?B?VmRlV0daSmQ2TEtuNkM1cm9JZDZXV0lVZ0ZqeUQ5YnZoSWRMUWhWYTh0UE9j?=
 =?utf-8?B?OUgzVTRJMGczdTFBbnh0SDdHeTA2cy9EYUt5NUFHYlNQZ3dDbWFPSU0raWxu?=
 =?utf-8?B?N094bjVzcmpnMyszWXJEWWNlRlBzOGpOUmZGOEhOZUN4dkdrZFpmbHlLay9v?=
 =?utf-8?B?WTNyTkFXSVJtTWhxbklhSGNwREl1Z1JhbkpUR2xzZFA5b2V2WDNsMzNCaDc5?=
 =?utf-8?B?Mm1pbmFYM3pNdFJCMjJHaFVzNUIzc0NqejMyQmIwSUxQK0Z4VnlrUkpwSkVs?=
 =?utf-8?B?dUx1c2JtejFYU1JTTHkwK1AxNGJzaVlzRmM3ZUNxTTN2M2FIbjltTE8rUGlW?=
 =?utf-8?B?bDVtWDJmNjErNENSZVE1K1FldW5OZk9hUXNENTBMQy91dVdmU21KaWxCcSsv?=
 =?utf-8?B?dlNsaE5LMTh0QnFKSmRGZ05rSklrTFN1LzQ2SGU2RjBSMFlRbjBCR2ZtbEhE?=
 =?utf-8?B?OVhURHJiTHlGNlJWM1JYd0FQUFltRzVsZk4vNFNhNWxxZU9ZWWVpTm42b3kw?=
 =?utf-8?B?ajR6Tk44TWg0MW5MNTFMd2JlOFg1bnVQMllUZWFqdmZPZGM0RHFqSExQMzNr?=
 =?utf-8?B?OC9PY2NKeHNLdHNxczY0dW9HS0g1SnBLTTYwYmpwUzFFMWhZUHRSSVo3cmpo?=
 =?utf-8?B?NFZPR0NNRlhjaTdGSWVmdWRYWUgrVmc2SUhuU0JQQzZ0d3I3ZlFET3ZoMGlT?=
 =?utf-8?B?aVN4RllxZXlDOWhpRUlLSWdOMkpvNW1rK1VEc3VnRW8xV3lnUzRnRmQ4RzRJ?=
 =?utf-8?B?ajFTNVdSNmlZUExPeGhPSVNoeWUyU0xya3djMlEzTHhxbjFGTldGWmJjZGZm?=
 =?utf-8?B?dWJTbFJndUpOT1VRTHZtV3djNklYTEhxcThIaENML1FxY3ZRTm40OUZkZXFi?=
 =?utf-8?Q?owt+a7iPvhL1+QKw=3D?=
X-Exchange-RoutingPolicyChecked: iRYW9eWTjTibaSNepK9nHL/a+ItpXDLDCpAIm+gV7qopi7SEJnTtZ2j366jg2Yq6clCznNHQ9VXPqxHMqKlTAWf/vfgUK7EnzkTXO2YanXphY+GpZmRzRZvIJbskdC5uWCVGcOYAxwtKLdktXH6Mz/OJCXZ7ylXpZoK1ExF+6Xw5NXTQza4iQ+HfXCW9nsA/ivffmclQJOzVCS6qgcCcB3Y+m9iP/4UUyegF9MV1LNGFp97PbGtlH6LRbTX7XWyXRKGbwIAD5SIxU+mSA4JBTsV7pxuWBzTsp6QYcT7OcyXyRn+b3jmIUDVgZ7LLNytoFZhvom1Ai/Za5eCFWjyQpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8654f611-028e-4379-b120-08de84cbedde
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:54:14.0212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnI827D5YrfGfXN56AYwcrihe+UyK+SMGeo5XzonZzGPkBvYS5p+L3VbQjwYm8ZSCn6NbYAGm196OSV+SOaSIDw+AuPAhDvXQTJh+ynVIjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4710
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


On 3/18/2026 1:48 PM, Hogander, Jouni wrote:
> On Wed, 2026-03-18 at 01:00 +0530, Naladala Ramanaidu wrote:
>> Switch PSR status reads to the connector‑specific debugfs path
>> to avoid ambiguity on dual eDP or multi‑output systems. This
>> ensures the Early Transport state is checked for the correct
>> connector.
>>
>> Update the Early Transport debugfs handling in line with changes
>> introduced in KMD (commit c390bf07961b, "drm/i915/dp: Fix panel
>> replay when DSC is enabled").
>>
>> v2: Addressed review comments. (jeevan)
>>
>> Link:
>> https://lore.kernel.org/all/20251015161934.262108-8-imre.deak@intel.com/
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   lib/igt_psr.c             | 8 +++++---
>>   lib/igt_psr.h             | 2 +-
>>   tests/intel/kms_psr2_sf.c | 2 +-
>>   3 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
>> index 7e50c3dc6..09c34c97d 100644
>> --- a/lib/igt_psr.c
>> +++ b/lib/igt_psr.c
>> @@ -69,14 +69,16 @@ static bool psr_active_sink_check(int debugfs_fd,
>> igt_output_t *output)
>>   /*
>>    * Checks if Early Transport is enabled in PSR status by reading the
>> debugfs.
>>    */
>> -bool early_transport_check(int debugfs_fd)
>> +bool early_transport_check(int debugfs_fd, igt_output_t *output)
>>   {
>>   	char buf[PSR_STATUS_MAX_LEN];
>> +	char debugfs_file[128] = {0};
>>   
>> -	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status",
>> buf,
>> +	SET_DEBUGFS_PATH(output, debugfs_file);
>> +	igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>>   		 		sizeof(buf));
>>   
>> -	return strstr(buf, "enabled (Early Transport)");
>> +	return strstr(buf, "Early Transport");
> Checked this and to me it looks like it may indicate improperly ET
> being enabled. This is what I'm seeing in debugfs entry:
>
> Sink support: PSR = yes [0x04] (Early Transport), Panel Replay = yes,
> Panel Replay Selective Update = yes (Early Transport)
> PSR mode: Panel Replay Selective Update enabled (Early Transport)
> Source PSR/PanelReplay ctl: enabled [0x40000000]
> PSR2_CTL: 0x08000000
> Source PSR/PanelReplay status: SLEEP [0x30200011]
> Busy frontbuffer bits: 0x00000000
> Performance counter: 0
> Frame:	PSR2 SU blocks:
> 0	33
> 1	256
> 2	512
> 3	0
> 4	0
> 5	0
> 6	0
> 7	0
> PSR2 selective fetch: enabled
>
> So I think panel stating ET support already returns true if using this
> check?
>
> BR,
> Jouni Högander
Hi Jouni,

In my system i have not seen Early Transport sting printed that many 
times. On What config you this debugfs.  As per the Link patch if Early 
transport is supported it will print (Early Transport) and if not 
supported it will not print the string.
# cat /sys/kernel/debug/dri/0/DP-1/i915_psr_status
Sink support: PSR = no, Panel Replay = yes, Panel Replay Selective 
Update = yes, Panel Replay DSC support = selective update (Early Transport)
PSR mode: Panel Replay Selective Update enabled
Source PSR/PanelReplay ctl: enabled [0x40000000]
Source PSR/PanelReplay status: SU_STANDBY [0x64200010]
Busy frontbuffer bits: 0x00000000
Performance counter: 0
PSR2 selective fetch: enabled

Regards,
Ramanaidu N.
>
>>   }
>>   
>>   static bool sink_status_checks(void)
>> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
>> index 7639f8d46..53ab04483 100644
>> --- a/lib/igt_psr.h
>> +++ b/lib/igt_psr.h
>> @@ -49,7 +49,7 @@ enum fbc_mode {
>>   
>>   bool psr_disabled_check(int debugfs_fd);
>>   bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
>> -bool early_transport_check(int debugfs_fd);
>> +bool early_transport_check(int debugfs_fd, igt_output_t *output);
>>   bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t
>> *output);
>>   bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output);
>>   bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output);
>> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
>> index 1cc57ad35..7503c7682 100644
>> --- a/tests/intel/kms_psr2_sf.c
>> +++ b/tests/intel/kms_psr2_sf.c
>> @@ -961,7 +961,7 @@ static void run(data_t *data)
>>   			     "FBC still disabled\n");
>>   
>>   	if (is_et_check_needed(data))
>> -		igt_assert_f(early_transport_check(data-
>>> debugfs_fd),
>> +		igt_assert_f(early_transport_check(data->debugfs_fd,
>> data->output),
>>   			     "Early Transport Disabled\n");
>>   
>>   	data->screen_changes = 0;
