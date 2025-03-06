Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9809CC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 16:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F8E10E03D;
	Thu,  6 Mar 2025 16:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UtmyrqW1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB11810E03D
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741278340; x=1772814340;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zkphkS8svdTsqlf5CI6aa6eXtim7TfMpVvhOvoJAPLM=;
 b=UtmyrqW1Km7tYeO65px1F3DFbosgs/zTfKypU3OLMhGnttZwG7joEDrz
 im1zIbq6yQibLwSkLU7tdY4QEOgDNTLpQqow3/bRGaGBxZl9VwrU+XCn/
 DeArZBk6ORUjKJDdC+QVWoWxK/ISHDiIxI3W8CSlZiowbPm36oC6j90X3
 PZssqAlU4+NfJzfBNkBOzl8/Op7IQbJ0srVmaoVeZamQLb4XMnokNGkng
 Pfee7KJ+jHqvDdeeo0iuiQaUonpq/8jsw/IRnMi7gCjkPL9vpyRy1EjXB
 txhsKPmmmP73woZBHJEE470zQVgy+ttXzTFjrL0euy0+o2ZzQ1i5VfFgB A==;
X-CSE-ConnectionGUID: 6Jc37d4jR168MFwdtUniSQ==
X-CSE-MsgGUID: Y2pLJ3zYQCqOhBv50t8Fvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41550552"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="41550552"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 08:25:39 -0800
X-CSE-ConnectionGUID: 3e2kLKOPRa+ja586WeP26A==
X-CSE-MsgGUID: THD1xUYtSRy6tSmTIgeXtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124285813"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 08:25:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 08:25:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 08:25:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 08:25:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jH0kCDpetGOeB2cxhgtZsB/NZCqhS1jgbyXy1e7GVwjXnQI18WaKn5RBCAavd/h5XVEDeNDQU/v6Ip2G86CpmOTKCnArYYF+9hXpgHIwl/3epOuKigkmF8VqczCK0QSumccU0jeB1Fm3qnYThTAAMo29UFLzsdg5AiS4DP3QUG9Vaz0atk7751Bxd+czVUfQZstRCKmCHT2mZT6m2hiJVWRWGa6vv5tD5fWQuHoiR4kH02GyqtBWp7T1DN+gGlLYc6V93OOXHPY3sCEOFZswy9IZDHcOKfLx998RNWdTCUm9mkIg25Xw0geq6CELrb+Nh7ph6JvOXIE/2YamKV2fug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eICTmdTG+lIotAwsJebCQjrHV835vD/bGzC1DROlPk=;
 b=u7Ek+p1IRRAWvbX3B9aVlv2EimCwit0qi2wF/BQmTmg4a8y4YO8SgMM+M+drmyGvzawhNDfXnfHsG53N4q6CGNBF1DGY7FAmJyJygqlw8sxUfhpIddjNtKajjyzmFnnT8Ky3hKgK3BmLRYrxZ7mahijvniquc9EFzL+hNfZaKX4j5MCEYeHDiDB3pdHBuK3DnglnDBccBkjakoFuz03yzwW9Ia88ClpaZ7iRz/Ki0ocz/1xZOl0TmLxt6cUq5Rud9WsSWOPTZY8usfd99QxiThL0QnlFj7RoWyTFKTqxNwSqwWiD5OUxzURa8b9KwdsptEX7uB7paXhqA+MQikfuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 16:25:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:25:21 +0000
Date: Thu, 6 Mar 2025 10:25:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Message-ID: <xrwfe4zfyiwwcpl7ak6vdvgueznly344jqnkkiuraozz45tec5@w2cldwxkb3bh>
References: <20250306112754.1483363-1-soham.purkait@intel.com>
 <20250306135100.ey6vkuzvezylu7jt@kamilkon-desk.igk.intel.com>
 <yc7bfsm5qm7ciipadix2ahhwzazmnkkvbvvyfa5a27qu7vxq5o@5p7nmvftovgx>
 <CY5PR11MB6211DFD1745310E81E6C498095CA2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6211DFD1745310E81E6C498095CA2@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:303:8c::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: 886e31a5-de81-4d2b-a19f-08dd5ccb7db6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PW+yXJ8iCIeXBeQdC5/WoDP2Al1QtKlySKU8YV6AJFsGiCHSoKvPbJKjg3FZ?=
 =?us-ascii?Q?Xpm72wlTbRJQ8d+VMy4NfHjnV9CKspPKpiciCAyBo7SsbckpsyJ5/40KNiCs?=
 =?us-ascii?Q?XEfY2Bw1iwLckmf+vcjTpD/KCHUH70UM4VkgkuYUWZsru5m3QmWjbqY6BEym?=
 =?us-ascii?Q?apWXPphgVXpZuXwB5q8jDd+KEnfQO8steNkOzYlceCkuAbTMe+GC9ugZWAWg?=
 =?us-ascii?Q?FOTy1io8uPMeeo1X/I1cQfUN8AFJU3LoNDkVDYYr6WMS3qcKZJBSECzOQhF3?=
 =?us-ascii?Q?fRCI0KlM7kBckdgzqfqet4Z6u6ZJgEWXOtygFltmI3t7FaCUh2oWErtkMygw?=
 =?us-ascii?Q?ThDKKTDoSSEPBqBArPY1wU53aj7F1XPbNLV2pFYi81Ir0x2yiEgGkdMpFcEW?=
 =?us-ascii?Q?9Yi8rbHXnwf0dLfWYbenMnQjG81yPuAVKZN3Nk60LaJtIQvhiBWxs+W9ZV79?=
 =?us-ascii?Q?WAXLCUhSiV+Q8r2k2xyLsewPMJtUsBcCaz4yCGnCNsDhCK463JuPdlaSTs1/?=
 =?us-ascii?Q?J8lISw7ZtU25R+3zJBoEKH3idbq00si7OwiECXiF8nzBr0JDIYtiEm5cutaH?=
 =?us-ascii?Q?mbPCuLned/wsqSYVVV7gK2Iq3Mooc1KaR7xKngdORkGpbfAj07M/KwV6HR73?=
 =?us-ascii?Q?XENMfqfIKbvdyRQZ/bxLP1cq/VKiivXgJRMh0vshl7Md6g9IoqzUWZdeoYP0?=
 =?us-ascii?Q?h/uYvtOkXu4AhuyKAj0PlPcEq1wVqE0JABcVxiSzWws05pjLtK30TtszPZen?=
 =?us-ascii?Q?Kni0zaZGBHgJutsLcB73Prt4uQckA/OrE78nivknJVkno4iln67faaKnI0mf?=
 =?us-ascii?Q?U9d+1J48UjH6OtqdfXReCgCYdNxHnBdc6mHRDe6Vbf4VmKvzx7qCecY+KPA5?=
 =?us-ascii?Q?A+n7LLSULTFrTaufXYuA5G0QZLJR27DwZXBn8vKrBrdiq08XiivBVNlLqzUI?=
 =?us-ascii?Q?5HuMzQ0U2AfzJ47Oi5PR/7pNgad43wa0UIUJR9WWpE+sEkLvYZ2JmNZdS5ks?=
 =?us-ascii?Q?RrO1ZmO2E5W0m2R9ISNowM99vdNDhZDXm4sPvorgjcVNchz5f95lfFwJmlfb?=
 =?us-ascii?Q?dxL3MX5/dATl4Go3G+70M2hxtWKLFNHxxrECxpIasnoYSo2YWkUnZr2rID4e?=
 =?us-ascii?Q?1zd2wvyOXbz2bkFpWIyFD+YumYwHFxO1rvipO0grnU/L6BLmOSDnIMSsdsDs?=
 =?us-ascii?Q?cL085qZwhO2XGy4uLP7yFMh7v3RdiEr0XKU4gM5UkKyoRZXVsx97Hmeo73XN?=
 =?us-ascii?Q?2hPjQL+bxXEJLLSRdqNsedzApBr5Vkr/akYwKG1wDp3QAzLLGVzzeZ8pNBpv?=
 =?us-ascii?Q?5gwgogeV9q14zCzLhxObCCqCn0/0vxUuJlRbhuIHh6u1d3I1JDEzmD4YHnec?=
 =?us-ascii?Q?WymqHzaQudiuDmKfoemi7ZQuRQfe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0c08T/15lN/M1fZFLuHazSF17QXks3tr+FEk50gBPGEd5kp53YTNfXenPZ59?=
 =?us-ascii?Q?8RimQsxrW8kJitD2VcqvsaXJKP+cbCji7B0vMalSFYqyqNErheCz1ldvZtV9?=
 =?us-ascii?Q?Bzvx/WE0dD8wbJ9pQEn68bT4q/q50bB3PPvazHLH8LiyTRUO8IdyaksVBgco?=
 =?us-ascii?Q?KAH8R4ZoUFiPAxF+t8jRRvvDfNWN21xGtrZHKq1FQADj+c86TQzt9WkNk59e?=
 =?us-ascii?Q?3KpcK/sk6E9zHefH5N2eP6GAmzPr0glX1BVsJVr2jPJSE8xbHj99eRUd4qba?=
 =?us-ascii?Q?7LK9Ai4J519qtQI/s153R3fdFqkCZVIESBQk00HZ+Zt23Pw1l7zcO0n1cN6n?=
 =?us-ascii?Q?CC/xq+cya4+eNubvbqbMJp86ZmMHP3gtvAC5HeIu7pzebueJBvKX9t0LOeEh?=
 =?us-ascii?Q?5822uxYdY5Zg/t1g346HL5UVWOJBATMPWJuFkddU0x9YmzAOQtju+F46TWps?=
 =?us-ascii?Q?l0/DAZrgiYR0dkrBXj9cwn6QXVa9innRVKbi5Kb2VLlgNHQAa1vAu1RIwMyV?=
 =?us-ascii?Q?DfpnzYtm7P4n7GDj1IQW6aOTlRg/L9eiJmnXW+cxDMKWmcdvV51l5ZbdEMf0?=
 =?us-ascii?Q?c3aORLLvY3EiwXGDo1lGUcCGkQ00+0g4b5lC/2QBJMcvxfZ+MeKnqHvRXZVH?=
 =?us-ascii?Q?zv6q2D01/5yRrSMxLxZx7TV++KgL2vUepQXJ64ttxSLARioRxSFiQ6cqYXM2?=
 =?us-ascii?Q?QRJtuenJ3jEHUBMporqYqBS8gUc8Fc8DqTHk4AKCzjA7X9m3rz1Swhpwxs6x?=
 =?us-ascii?Q?XA2Qz8WGLfqeuNiFjmWEABqLHWIMD3ErbNJNTi60V/V2N54Qm8lzTOyhVtmg?=
 =?us-ascii?Q?ggJMDiuGmlgtJ8V/1EB6nxQBUHRWYqJk75ksGpJHxB5UrK0iWsNIUHlTJtxl?=
 =?us-ascii?Q?jHpbZslGrY/08eFRUIy4fcATxnLl1RrtpndVkLdiYrGaDD+yXLuTqE5TBYZd?=
 =?us-ascii?Q?trJ2CFr46whCnQjW8RegAXq7IyeNsptlpxOX+ES+CPV+tk2iVc6uDA910Oes?=
 =?us-ascii?Q?j+DESzd+7wjmMWT+OtPOdduO+GuROdvKCXpIk47SUFwKYijIB/OiPOXfOyXp?=
 =?us-ascii?Q?htbWC3/tHRMGRmwjfFHNBZ7jz+N8ndpOzd94r3MdPNVr3Vty+ctetYH2Q0Ld?=
 =?us-ascii?Q?/KxQvni/54h9aSWk/KyaFXA0unwiIUMiw0LBzU4rjO5U42UQG1Vk4d44r3W+?=
 =?us-ascii?Q?W4/5AlcozOemvh5gmOwGqOe+f9RP4Dhmi0fdJoxgJzsk1LDL8O50XopMeBBo?=
 =?us-ascii?Q?/sziboX75V+V1cZ99PWNWzDUKRlBnBkB53MFWMS98QM7rRFTsX6vLwdu9KDm?=
 =?us-ascii?Q?4mu+VSPdltBkXQGZ5+qmB3Z7H+ySNl1N8MNnqmMHsw9szR8z+nuHJHU+atxk?=
 =?us-ascii?Q?1t6pbX9XDIdmu++vp6p9voe04PdFqXIUYKdWqn9zzfXTnaHigZUe25/YdCnV?=
 =?us-ascii?Q?FFGDKNB69uizN+d2jy6Ax69ieZv05YWp5NBN9eul4IpEFWDHzaJ0qolPiZ8Y?=
 =?us-ascii?Q?WDUQiDwiI5flbzY/eHQ1dtCDz7c5RIpY9rxZ5V+/iyBhOORQ4NrVHFjvFK+G?=
 =?us-ascii?Q?8jt6CP28eBkhLEFTrDZOn99EorLcekVMLDMTEu+hOjxHD+xa1lUvf8oFmF9c?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 886e31a5-de81-4d2b-a19f-08dd5ccb7db6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:25:21.5871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6RFvTE7Ug1788EWDQwy9c1Xpe08uakjEXLmr+Bgq+3fkgHKckVlXJt2KObwAJth8whymr7nK3jkey/iOgfQhBBV28CAbl40PLgXGPs7/J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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

On Thu, Mar 06, 2025 at 10:06:01AM -0600, Gupta, Anshuman wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Thursday, March 6, 2025 9:20 PM
>> To: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Purkait, Soham
>> <soham.purkait@intel.com>; igt-dev@lists.freedesktop.org; Tauro, Riana
>> <riana.tauro@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>;
>> Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>
>> Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
>>
>> On Thu, Mar 06, 2025 at 02:51:00PM +0100, Kamil Konieczny wrote:
>> >Hi Soham,
>> >On 2025-03-06 at 16:57:54 +0530, Soham Purkait wrote:
>> >
>> >add prefix 'tools/intel_pm_rpm:' in subject, so it will be:
>> >
>> >[PATCH i-g-t v1] tools/intel_pm_rpm: Add support for Xe driver
>> >
>> >> Add support for runtime power management for Xe driver.
>> >>
>> >
>> >Add here your s-o-b:
>> >
>> >Soham Purkait <soham.purkait@intel.com>
>> >
>> >Please use checkpatch.pl for some obvious corrections like this, you
>> >can find this script in Linux kernel sources, also read CONTRIBUTING.md
>> >in i-g-t sources for some options for checkpatch.
>> >
>> >> ---
>> >>  tools/intel_pm_rpm.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c index
>> >> 08c25ca8a..945247d2e 100644
>> >> --- a/tools/intel_pm_rpm.c
>> >> +++ b/tools/intel_pm_rpm.c
>> >> @@ -151,7 +151,7 @@ int main(int argc, char *argv[])
>> >>  			goto exit;
>> >>  		}
>> >>  	} else {
>> >> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
>> >> +		if (!igt_device_find_first_i915_discrete_card(&card) &&
>> >> +!igt_device_find_first_xe_discrete_card(&card)) {
>> >
>> >Split this line:
>> >		if (!igt_device_find_first_i915_discrete_card(&card) &&
>> >		    !igt_device_find_first_xe_discrete_card(&card)) {
>>
>> I'd rather stop spreading this. Particularly in **tools**.
>> If env_device is NULL, why don 't we rather build a match string with the thing
>> we want aka
>>
>> 	"pci:vendor=8086,device=discrete"
>>
>> I'd replace in tools the current uses of
>> igt_device_find_first_i915_discrete_card() with:
>>
>> 	"pci:vendor=8086,device=discrete,driver=i915"
>>
>> ... and implement the driver= match in igt_device_scan if it's not there. Then if
>> it works with either i915 or xe, we remove it.
>>
>> I also think the tool is being less than helpful by trying to work with discrete-
>> only device.
>This tool implemented with intention put the discrete cards in runtime d3cold as it requires to tune each pcie device in the topology.
>As d3cold only supported on  dgpu, we don't need this tool for igpu.

ok, but should this be a check by discrete for each driver or checking
power state and d3cold_allowed in the pci layer?

What do you do if the user passed 00:02.0 as device?

Lucas De Marchi

>Thanks,
>Anshuman.
>>
>> It looks like SET_I915_AUTOSUSPEND_DELAY also needs to be abstracted?
>>
>>
>> Lucas De Marchi
>>
>>
>> >
>> >Btw should we also add support for other cards in multi-GPU case? If
>> >yes this is some more work for another patch.
>> >
>> >Regards,
>> >Kamil
>> >
>> >>  			igt_warn("No discrete gpu found\n");
>> >>  			ret = EXIT_FAILURE;
>> >>  			goto exit;
>> >> --
>> >> 2.34.1
>> >>
