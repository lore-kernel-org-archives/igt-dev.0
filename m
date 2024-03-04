Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85894C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 19:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266B7112537;
	Mon,  4 Mar 2024 19:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zay/1ocM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6C8112537
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 19:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709582296; x=1741118296;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=gl/C6NldmfsqLzVL+4GOXmLDijk8AHWjAAOGEhb1pN4=;
 b=Zay/1ocMjyCiaMVX3DnQgNvm2RzszsRhvt/PdY2EAQ13M9Na2RucpxMY
 A35CAoKwZ62PkYBxOOvuJcjYibGzOS9jFCgXx7m/Yul0JJh4pLSKvVeSA
 pxpaSnETCiS59RqpGfPX9HgGuXz8cvl6EYs+eTCCSmI/4F/XiqV4SJW0V
 xefFABP7tqjsR8Bh2sP2gCPYgMRXAQLZE/Es4ZWQLbPXd8Nao2ZM9cFiK
 IUEVdxGHfxfLYAYulx5IwL7l0wcD3YPcUkia2auhtGlys8QxLI7MeI2oo
 LWbel4qDQsdRZg70AzYYx7iklCPMwWCJUwYskyRO0t34A2fSozLpSIc3A A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="29523221"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="29523221"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 11:58:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9053796"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 11:58:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 11:58:14 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 11:58:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 11:58:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 11:58:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtNLyk1F4Ej0g/Qokpmu7JPFgJa6Ji6src/86frRffbxieprUom2SeUMtTSoNd5wjtrdzxn+CQ4DnNg3RB5BBtez7mMiJifx/a9sLLStZLMtsa+A5732nkMXnfa0gvkwFjyQJgOMpMKKiAc+e8OiGE3YRegeEUg7B6Vb62KIVBcscW/Zh7ktNxgsDl4xnh5+DMQLvg5zEYJ2tsEN0gYKtg9y7p5IvGbyr8NvnbrggtYltYAqCK6FM5xuAPcCumf6QbGurSyo1y37+QmND7gMcnz8eEtDvqhPS0eak+7328dm0oYk6tkLA8Uxb1tp6xWa+TZvO/7mMe60kYRbcUJGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gl/C6NldmfsqLzVL+4GOXmLDijk8AHWjAAOGEhb1pN4=;
 b=VhjEM1hO15njaI7u3AiSot3HzVZbSp10sqgcGPrq8YHp4pvHc59tgO0N5WSgrucbUM99zYXUaQttSpAH7I/ZA8bv9YZFeeFd3anHxeQll2wwkWeaxdlxT2DjNCTO4tu+k2M7VNam4kiLhePlb1uQ39cX1bVIitlo6SkkZNpMV9C6DEEoRbGgfgszayPIaBoJMrak9E1ANRm2GHU1aQ0ENgw4YZPS07hhNpSqRbR4dtaokSYfhsqAksVF7FkfybfE4fe5QZ9SXK60WDx6m9IOXw0olf7TEiX6ezy8Em0pJnr+5lallu6V54ewXL1O0Ukuuj5hqTjLCylpxYI8qHkqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6841.namprd11.prod.outlook.com (2603:10b6:930:62::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 19:58:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 19:58:11 +0000
Date: Mon, 4 Mar 2024 13:58:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Allow to load kunit from alias
Message-ID: <g6ood4uzdnvppwfawrgks7e7h7ojnfyurnvy4tva62bfmpj6hg@mkh5sotue4uj>
References: <20240222193044.3004471-1-lucas.demarchi@intel.com>
 <20240304160529.rr2z4dmzbkeyih4o@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240304160529.rr2z4dmzbkeyih4o@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: BYAPR07CA0085.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: b655e428-ab7b-436c-e787-08dc3c856b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: szxVFv7s122hqQAF1uDRIyqhS5ncWfWTvVfay1cPMGIdxBnkIsCL3yoViIaH0M7FiPWIbhqlgfEUdRuf5qf5n4IXV6YhezhJ4Isybz5S2DZ6W3mHIaf0n2loYQgy/L3UzhKfFlYZSDy94czGxm1+bJwvNyvJM1pkPRq8z6xR9BfAsKY6cIGG7rQ3DKyPV39Vqy+EhWBVvvey29exezoAcChlzgdRTVqYRQfizGTWnc/lORqUGMWv7iWR1BmDcD4ibRaAKJ7GX+d9yTjQqdnC9jOQU+Fu8nDc7JVZoCECbz+g44izRnabfXtFjpeSY7kshBPyodsnRbQFDT2gpbMvGV49qjvTGLPMKrEW2PCLD0yUrROtLjXqNF1mUR0Uw7pyLBUeYNXfsEPiRmkdOj4w+TN5PHyHIMU46D1DHhDU0rFKxro0GVbdWq2/XW1kGe7pVtemqiR53K+4pjJ0smLJJ+eja508Lw89dCz6vyQoTIsPh+dOaJPJD+CkHMCEqO9rAOnu0pOKtBTAh0GUNX6ICk+rEeirHIyNLOwsxOSIXR5H4H16QVlhTiVBX3w5LQ6dyMCZIrSVmov5F9A1aaC06J9yrML1+YGgn1Xe6DkRVKABQiRa8zapHvKEzz5eI85idus7Elf9hZEyiBsZ71t/HkILRYx/z261m86//jg8qF4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8OgVK/R5UWVLN4InZBJ015pL6/29k6d9V3l8BVPVOA8DOKYa6m/pLrwlYWkV?=
 =?us-ascii?Q?lOdyA7kjeQ2hy7GGfKsELPxmUiz/2OPSmBm94lcYtA5BFu8JCi4kDY8MBcMi?=
 =?us-ascii?Q?6HQ9DdO+rkr5ajTHWM3MTYxdNSYvpWQr0c+LNrnDrECdMph7GEjGwrrxsBDJ?=
 =?us-ascii?Q?eY5eYjb+pqv4cs6f3jfbtqlxZ7KlsHgajL0Nc2Gz3mxfQ/GLNzzPXqKkjeV7?=
 =?us-ascii?Q?kNzdC1fKFrK71xTXZaTwO2h3z6oRFZhYqvewgglP16boB8gbC13IbH1lEBtz?=
 =?us-ascii?Q?L0hEhvBjn5axR1DMy2BUG5eKxtadSkIhqaXENy/QHEg881uRaXrFarvCVOE5?=
 =?us-ascii?Q?dXGa63d1t85dUvr/xn3RUG3/Vy33F4376psjIRnQs26liHn4KfolgCKK91Om?=
 =?us-ascii?Q?Tux9BdOD3NK8FgaLX1iDPomj0aBddEczhcy1xZ7zaJLnBthNUI9JG9p8Qjnt?=
 =?us-ascii?Q?/C1GB2ddcJwUEHlX//bP/DzCesc616VFwE4KZNcWWu2V+ang+IklzdSZib69?=
 =?us-ascii?Q?CB8nIjMFSiSEm0oOPLKezC0A2P6zL7eAvJ9IpYJTs9MyCbLlgb4Lj4jgRQGb?=
 =?us-ascii?Q?HfUxdHixuinBhJEWPPmpQH8mZEfSwWOXuin7WFUldvGjPzuX1OiD0PGe1lrH?=
 =?us-ascii?Q?BaUFqwPsoQnBmKXaMe0lkhNVHcbhCSilknbJPUFrXLN1gXGyJocdp/ayScz7?=
 =?us-ascii?Q?RVTTK7TxKwbfZ4sAt4CTR6UKdXYsS1qzyGuHSCelw33AVHcY/tJ+ZyRIZNOz?=
 =?us-ascii?Q?GdFrqqCYJad98B6DrOBJdo6NCcdORorsRdyxI2vKqhq/lUsd3SkMNeRU+eYP?=
 =?us-ascii?Q?6boYABig2wYCT8couoPwa3xFVnJLk0vRqosUguU5q5tyJ7g0Dute5FCFkCjf?=
 =?us-ascii?Q?qSs2MlcsnxLA67osaUFru7tMsdzlcoPLhW/EKjB7A3KRfmiM1uF2Yc7lHRsb?=
 =?us-ascii?Q?e+gBOi6WT24tajo4mlzoZ1uALBTOwQFJiFH2VDefic7pNJFXB8Sm26gDaO7c?=
 =?us-ascii?Q?+/mX1IlQU2LAQqHdCjaA11YWnhEIdRqhT6fEUJ420vMwc+N76K8dKSz3a4a/?=
 =?us-ascii?Q?M2nD0b/4sIaC0+0OzlVe8IXLRKJQ+n30QEQy74Xf8MwiLZfPNoPPYo94CadT?=
 =?us-ascii?Q?FfvwlyeDPR1JkudL2zqxbxslUgeUM3S13BiRKT+5jK9LgGJhMZMk99xw7r7J?=
 =?us-ascii?Q?qRxhiWIdEnylzXZjfElHp0VhTFbMtAx3NSpWxu4kbavylHwIE03zmgBZVLtQ?=
 =?us-ascii?Q?9331VdO9OSx/CA3U21pvu/0fvSkxFGJg7cCYGccb24h3oUzOmAsh830e/7/3?=
 =?us-ascii?Q?cznGc3HJv6FbJ+QK742/eDSlC71UqYkLIu6ydrMdsOEoN7Z+Gk72gRufA26Z?=
 =?us-ascii?Q?SDdEY1f+xvw0T97S/NJzqi+S9d3qxNMfHGMHEwm2hN/VCtP63XGk2vDGsqOH?=
 =?us-ascii?Q?HSmZ2Ba2fkJFRvgzw7NsSocTUzq22IC5lJLtvFcOb0CRaZzSj8hX9x9HkPZq?=
 =?us-ascii?Q?V3hFGHPJiaFMtnjjA2lPvVnHojocytPKKXCfjI4DfePT4hpU3BnojV2jux8h?=
 =?us-ascii?Q?6MlOuOsQczyW+QmfEqZmASmPpM+/gz5eKuwIcU3IXc+v2/MM6/A2rFAAJ/qX?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b655e428-ab7b-436c-e787-08dc3c856b52
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 19:58:11.0052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dODl+BnvDX5dCs8h8Fp4JwkiXkfecYow+twxmI7nQHCVOdIvcgwdqmX1kVhv+ZWSw2apSpwl5FYoWJyW124rgv+k8xheW5G0F5oDFWCcQHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6841
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

On Mon, Mar 04, 2024 at 05:05:29PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-02-22 at 11:30:44 -0800, Lucas De Marchi wrote:
>> Instead of only allowing to load the from the module name, also allow it
>> from alias by using kmod_module_new_from_lookup(). With that a user can
>> have their on aliases and the kernel can also export a compat alias for
>> future module renames.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>It is somehow test listing failing: ./dmabuf --list
>
>tests/dmabuf:
>Checking invalid option handling...
>Checking valid option handling...
>Checking subtest enumeration...
>test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!

thanks for finding that. Humn... the issue is that igt_kselftests()
creates a kmod ctx and a kmod_module even for listing tests and
apparently on the server side (where things were not supposed to
execute).

I will take a look on fixing that up.

Lucas De Marchi
