Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C353EC54EFC
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 08:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6173510E53D;
	Tue, 28 Jul 2026 08:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFryey67";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A551410E812
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785226916; x=1816762916;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=H0vu7WQDnQhlLCfa4NproV5YEUx/FhL+k+E32Wym7/s=;
 b=oFryey673vJOu6uft2B4yJlMD6PjjpeWa97Esb99O+ClJOBD9GJY8Pmw
 H0Tfu9aYTDPmw0q1dr5BhAiQVgBPIjlkgAldopj5amwQqJogR2OfLLvK1
 GlGb+L2wjoZcnpG/X6m9ii8lCf94yWIIO4zur+X3t75xOT30dwCCtShfw
 KuDGLyTYh+c2ugxMZY+02pvXtXb67jBupleS7vrjhxMLELlU2YOnRhZyw
 85bugdpwHBXWBrw9sc66k+I5ubEyx5yugZAa3NoWd6unsPeEigZmPrzu1
 1bd/6sWn6tx64nRWbBZ/uHar7IIcyiSiHw4K4y6PBAKDqHAVXZqLwVNUY Q==;
X-CSE-ConnectionGUID: Le7vS6pLSwGNyruV0VmSXw==
X-CSE-MsgGUID: tTqzxjXARyOBAZTeX9odyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85818313"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85818313"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 01:21:56 -0700
X-CSE-ConnectionGUID: snGEdGamQEGoAkpgNDdUfQ==
X-CSE-MsgGUID: 1vWGiQSOQVaNcdVUd75MAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="257840842"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 01:21:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 01:21:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 01:21:55 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 01:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgSvGnUU7CVJYu+YVFh2dMpTLHraSUU9w9IcUsM0elgYjXsCZUUrVBX3AND2IofklDdR+Wug4iTX+nhrSornrBiVOVaSVqD5/GjsdQKjDVMUc+hnm3ZgeoxVvHKkRtZJznlaDzoDQvVzbWo/p6Oy/2g4A37DfARYLE47Tyy0v4J27qtg1+Z3Gbdp+erB4zXgc8puD4Aqb9HngKuxOh/6HQwMhukeAf/8cL9GaOeaGU4nuv9JwBDZKusi0yleVk9ZiCZ2rs8KTDqehpEhxr461uUkwwLgJ1I7JTUePbZijPATSFwhGdh3KOun1jdLw2JEQ7aM99ZinkHVp94u6yHj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXSXZVo7XOFOvRH1c7BP7XOgl5L0ib7KOvKcImrQA8s=;
 b=PWi4PntxiaBpkA0WjPJPu8kOj6WjpdcaeB9I5wZWLNwdfIJkjf1Up8CDs3wpmrTQUyWfM4QthWXR8cxhMLsSJtwaSYkguWJ7uunkrZDeFXMyqo2tPLEm8seRMEP8lya/fRxEnKswGb0jzDpf98DtBp6z5rLh0dPqA3P4OAsumMw4JKWv40Yqwa2SYg/q0uEFu9+Jzgxg/VxVjYUrbmsCvLrzSbNKlcejsPtDa+6gM5CHF0zNLAk1YMyDoJ3ArETQW7Cu45nbCPAoOOFwE/dpna1qMZAtpcXuDiJlzRfAZQHYpnWFsVmfCfh5TlSsmRwdIYPY2eyzIEK0/UQHF4Wo6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by PH3PPFDC3198517.namprd11.prod.outlook.com (2603:10b6:518:1::d55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 08:21:48 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 08:21:48 +0000
Message-ID: <eace460c-d575-4bdf-ba99-4814baa5c3e2@intel.com>
Date: Tue, 28 Jul 2026 13:51:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 05/16] tests/kms_frontbuffer_tracking: remove
 TEST_MODE_ITER_BEGIN() from `suspend`
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-6-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260713085515.463575-6-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0266.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::13) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|PH3PPFDC3198517:EE_
X-MS-Office365-Filtering-Correlation-Id: 71fd64a9-4da5-47ee-525f-08deec81447c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|5023799004|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vLbJrzo5OX1AU4leI9fb8uimgS1Q6heyiyEgGc7HwwcE3SgY4olnYx6Ys+De36LXw4XADOGjBAJEMF+un+Pe6XjEAc4PSuF/ZSWDvywokfigUxPR9IA3n3CtnVfCav2wJQfCqJSMe5vuORdwWrJCrILXM4h4y9mjYzq24z9wge+LC8U0hGu4tzdY3FRq3XmVjqJiMjxCLlLL+DE8uu1paxIjtJSBRmAt8JRakXYLBEA/NPfeFL33XUZvez4u4ng+JXTypsHhCHI4zr3VvyzcHDeNKhUHlrAewyRnFGkxoOWtVtvz9NuZ6G5AnQ4Haw3pjbQKIjlKeEY7wLI85u14j3lVoRpTJ3qpUx7V4rRWQADZd+558vKHfl1K1ItVqvIaZRUZT2Ffmd6W4X1GTxRcAcMIptm/gvwNiDtH42CwUvMJ/QI9pf4pIQYJWg5wfPFSc92weQukY08QCJ9BLBoaKrE2OJeGWn0FEYb76c39PgvsGYe88wmlRM4oDoPLUlFFxAx3sjypzcDEvgxbuEiIFh+PqEUSQK0uy0At75YEmDUN6/vllm0L5ksnLlMgHdZNCnk7r6Y5yFObAajHANCIMfbgrBWT35tUep+DW1YUemMUMmgaqYLMeknJywOtWi3b5qcBaDgCVMq3dlrh/mt14zZpLltQIM+s8N0mBQSDuFA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(5023799004)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3VQUGVoQ3FvNWxUekZJeHRpTUJPcjZkSlU3QXlYZk5UdkJXQ1l3WWk4NWpW?=
 =?utf-8?B?RWZKRmZ4MEkyY2tUaEcxbnU3aE95djA0cEZGTnhnRHdpZ2twQnNjLy92bDVl?=
 =?utf-8?B?N3lIU1pjdEVudWN3aHE1SFJ2SFQ2VDRYRUFjSjNCTlJxMWQzSHlUaFNkYzZs?=
 =?utf-8?B?WDBMa3YvVDJFc1VlekgyZHlRSzJWNUhQMlZ6L2RqT1JORldKR2ZZN1JEVjcw?=
 =?utf-8?B?a3pHQkFiNmZNck5GUVJISGIyd1l3QjUxU1ZkV0NqRHMvYS82Sm1rMGhITGFS?=
 =?utf-8?B?UjlFcUMzNFRkSDB2ckdhbkFVWnB0UXZxdENQY0REY21pRlNjdzlhMDlxUFRz?=
 =?utf-8?B?ZnN1QzhSSE5EVmFLQmxUUjFFcTZTSFl1NzJKWVJqUjV5dTQrUWVmODhuZmtR?=
 =?utf-8?B?OW55UHpURmRtRWN3VXVEWUg3NW5wc1B3WVZJUU10aHpnWXl1enZETGp1RE1K?=
 =?utf-8?B?S1lpNzdJaHZnWDlrQVlZS3d4WjhtQ2xLQUxLZUUrbDJ0cWpiTmx3K0Jhd0I0?=
 =?utf-8?B?VXJHZ0VYejlvRVpnMldLSkRYR2VUMURUTkVyNVlyUTEwTEVPbGprNktVQ25m?=
 =?utf-8?B?ejRWZTNHTWpveGZPK2NkbmE2cnNwN2J4QThDWFFvRVYvZDlMT2w2Q1l2dUho?=
 =?utf-8?B?VFQySFo4MjJzZUxneFJkR1lvRm5NUnNJZWtUcC9EdnFNeU03UmpCU1ZGNjY3?=
 =?utf-8?B?ZlBXV2twRXNib0Jjbi9WT2thWk1QRG1td2t5YXJueDdzWjVkb0ptZ2swRGFS?=
 =?utf-8?B?VzVhYXQzWEdvYUZ5ZWRLWlE2b1RSZ3FoQnc2Z2svUVRweTN1SURsQ0pQQlQv?=
 =?utf-8?B?RU5ydTlBVUkydHBMdFlLQWoxZGNtVUhFcko5d3grbjJwSitxeEM5SVVlMHJE?=
 =?utf-8?B?cWVsdnhlUlE4TU9BWFVhQ0tvYjdjYUZmYjVOdjQ2Q3Bpa2tMMDl2cGJhOTAv?=
 =?utf-8?B?UjVUblBLYTRvR3ZPVDluZHJCMjJZV2JWVU1QbUY5ZWEvSm1QRnBQanlaWUJW?=
 =?utf-8?B?S3M0OGxUWWw4dFNjMlIyNEpsSTJlRGFIcDNYVkdCN1NCQnRRQjh6V1BsSjJZ?=
 =?utf-8?B?cE5LZHFxUDNKeE14VEduVXNCcEkramdsVTM4T05BL09naWtFMUNCTFlPSG5P?=
 =?utf-8?B?UHoxbmlhN1UyNEcxREFrYWh5aThFMUVqdTBxZVBkeklHYk1JYTZKRWRnOUgx?=
 =?utf-8?B?VmNJMjJOUXBqSXVjbEltVTJTVzdpanp0cWI0UlZ6Vk9FU0EyNm42QlJ5MkZH?=
 =?utf-8?B?NFJSZkdmRmxLZysrcjNJcmE2R0p4SUVCU2tCTWI1dlBrc015cHlHS0dCNXBZ?=
 =?utf-8?B?eHhVZVdPUWhGVGRPOTlzb1ZNeWJyc2h4cHRrdnBTL1FkcEEyRmxoWXBFd3lN?=
 =?utf-8?B?UzVMT0p6VEhtUll5SjU1U0R0S2lFcmV4blZTMzE0TVg1RkZ4bVYvRm1GbW8v?=
 =?utf-8?B?a2c4OVhPOHV5Q21rZ01xOG83YmFwS2xEZUlDLy9hZnFpS0Z4TStZWG1mZzUv?=
 =?utf-8?B?R0pRemxBNkhoR1VmcGN1K1lYU3JVZXFyU3hlZ3FncVc2WTRtOS9taDBxTWww?=
 =?utf-8?B?THpVYW1oOTU1Z1pPL1dwMndZUmRDTG9GVy9wdXV3RU8rSmdCTjYrQ3N2aFJ6?=
 =?utf-8?B?Y3diQzA5TXJiZjJqUmZMK2pCV3VRYlAxaHlqczBFS2o1cVpjbnRiQ1VuK2lX?=
 =?utf-8?B?SHA1cm5BQTZWbTNkRjJaNHJRSDZQVFJJcS9RNmV3TjVkZ0xtQnlwUDI5OUVj?=
 =?utf-8?B?bjc4WmVKanRQZkg2a0gxb2tGQjNock5qK1g4ZDNDUFVaQ2U2UzhRSXRnSlF4?=
 =?utf-8?B?Q3FDTFF6U2h3RDMvZmVEMCsvQ01CNUZKQUVmQTVDRWRmVnRYNGw1bmpCSnVq?=
 =?utf-8?B?UEtMaTgyb2VOVkxKSnlSdkZpMCtMeVBhcWFwaTgvWnBTaE9mclVUdlpkZ0NQ?=
 =?utf-8?B?NkFOMjZYenNxa1ZQN0VsSGJBTFdyWUlTS1hqQkF1aDhVdHoyVzQzQUNFR1R1?=
 =?utf-8?B?U0RhalFWTi9jeERnUjVQVlFNTkNoenBYQXRMZUNjUDhGcTk5Zi9OMEhTMG1D?=
 =?utf-8?B?ZWVvTUxlUlFLc0k4T0FRdENMUzZIUlFXV3FHTEJva3hDY0tnQzBiMEJ6U2Yv?=
 =?utf-8?B?cDU2Q2V0a3U2UkQ0a2hZZHMrYVBMNlMwd3ZzSnZkbGhhdnZWU3ZpOVdzbFY4?=
 =?utf-8?B?Mlg3QW9ZVW9qR0FTVFlqUWRjMFFwb0J4YmhrYmhxaUErQVFXank5Z20vWkxu?=
 =?utf-8?B?VHZ6UlpUODVzbWpkTWJ0T012WCs5R1FBemtienFYaWxHRm5CYStwb3Q4S29v?=
 =?utf-8?B?TVY3ejUzTmFEUDVkOUpITG8rYzJia094b0k5MkNXS09Ca1pyaUdidzdzakRP?=
 =?utf-8?Q?BJFuTCQG8ptU2wqU=3D?=
X-Exchange-RoutingPolicyChecked: RgtAZhqFwjGwe1U/4a2UT6nVdiXasjniKtzc+lutPj4SINIcLtcNuuf09H3dkZF+jqlaj+txOACEs4LyvNKzUCmfAD9188yvTrz5QxA6mZXKzct+KRrmbNZXS9EvkLm45/MjoB9xqNBBic3wW7WWPYNePTs4Be+KeTZUQ0tndU8LlZncapmKyx1LBw6QPhbfenaDn4JZ3GJOOh7wm/ze2lFhOrm/PX1ZA0qknciRfb7cObRw4L/M8WeEkFYPx7feBDJ2WJZE2DT47VcbcaSSik+418P8afGTnmol3GlD0vNRtn7uuU4R0gE/9GI3etqtKSEXK/q1cognQGxPITEeGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fd64a9-4da5-47ee-525f-08deec81447c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 08:21:47.9787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CioXYG+sfeXwbLJ/sAqFEYWyOQuc6DskFG4CZ8Q7SZwWBXcZHCr9PXsG0G3wlC6nAfYRwVr4SpV3Erbn5x5+sIcQt7avL+/6MpLprXjijo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFDC3198517
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


On 13-07-2026 02:25 pm, Michał Grzelak wrote:
> igt@kms_frontbuffer_tracking uses TEST_MODE_ITER_BEGIN(t) which consists
> of nested for loops. However many loops can be omitted due to continue
> statements. This obfuscates following the execution of any given
> codepath. Replace TEST_MODE_ITER_BEGIN(t) for fliptrack tests with macro
> definition and remove loops that are skipped.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index f619f77e72..f5c2a81434 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -4655,12 +4655,20 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		}
>   	TEST_MODE_ITER_END
>   
> -	TEST_MODE_ITER_BEGIN(t)
> -		if (t.pipes != PIPE_SINGLE ||
> -		    t.screen != SCREEN_PRIM ||
> -		    t.plane != PLANE_PRI ||
> -		    t.fbs != FBS_INDIVIDUAL ||
> -		    t.method != IGT_DRAW_BLT)
> +	t.format = FORMAT_DEFAULT;
> +	t.flip = FLIP_PAGEFLIP;
> +	t.tiling = opt.tiling;
> +	t.pipes = PIPE_SINGLE;
> +	t.screen = SCREEN_PRIM;
> +	t.plane = PLANE_PRI;
> +	t.fbs = FBS_INDIVIDUAL;
> +	t.method = IGT_DRAW_BLT;
> +
> +	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
NIT:  blank line not needed
> +
> +		if (!opt.show_hidden && t.feature == FEATURE_NONE)
> +			continue;
> +		if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))
>   			continue;
>   
>   		igt_subtest_f("%s-modesetfrombusy", feature_str(t.feature))
> @@ -4721,7 +4729,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			igt_require(igt_draw_supports_method(drm.fd, t.method));
>   			suspend_subtest(&t);
>   		}
> -	TEST_MODE_ITER_END
> +	}
>   
>   	t.pipes = PIPE_SINGLE;
>   	t.screen = SCREEN_PRIM;
