Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA890CD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 22:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8450010EC56;
	Tue, 12 May 2026 22:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feMMuvxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A91010EC5A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 22:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778625896; x=1810161896;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E3IhinLzQTeai/YvRZShBLM2jMwSx2lalnVG8SSWOVo=;
 b=feMMuvxrzjD2NVOv8hOWy9VK+5PR/i1po0VS6eo9mbOLAsNHTc7UXxRo
 72GXUq8pImvZO8Q5gFMYeWkAb2Sj9MRKy9O9xPyU3B1qzlQ8RvTMd/GbC
 sCPY1+5RzObYDO/A1QqAGYkmBxLZOf+glWmaTOHfb0s+xXmPf0YoWsYpK
 d2SvWVjA+J0sGwTz38r+r0ouJY5CM4TiRDXlihvxiSssdDfgt3qLEXLii
 WPQ8Fo1wGI+KbM/ZX3kNt7xB4fxpG4JFUEZVPxefDQ/aqlM4xKmprzga6
 ieAnfgFZexk8O4NwGAFRG3O+2FUz91SvjpUYyf55DN5is0fjubR042N4y Q==;
X-CSE-ConnectionGUID: 6WeNWvCAT2aVP+rzKLPkXA==
X-CSE-MsgGUID: n55NU+DnRoWD8emFnNJhgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79529826"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79529826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 15:44:56 -0700
X-CSE-ConnectionGUID: n7vU4YngQvibuv+t7EyiHQ==
X-CSE-MsgGUID: fcgvmnFPROulOGn6HOfkmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="242896900"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 15:44:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 15:44:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 15:44:55 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.32)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 15:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7Ufhq6Plvqk44A4UZVCvhpPkhFKt5vt/6+jgEfq1cJy8pctNg/TkmfGQQ7xnBm4C2cHTJm9UhoPPja9xHxhv/c3Kt8NZIaA+MyOzcNeegtdB2hb2C4VWUxhagMutUrWqVDstnuJx7/6kAZYIjT2gMuDfnizSHz9gV7gGCGO+fE5TZZxOImVFyWZ/odBbT1qj2r9wj3Dj0jEvqkQ1pZoGD6qZcskuj/32YgD9Y+Ywbb9gN7FqLitSK+5KQS44JgYZAivBC2zOnkN1lopSedcPOrlgxFGZM/OEPvkNRgNCO/ea4ejtClHvxxTcGroA8U+lyZpFEJfwgCyOnrmcFE4yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrF9XQvHcHWu2ogF7lFOIBn0ucawgQWHp1CVFakqHQ8=;
 b=gWbIe0E6eTyjfzrcQKl8F6yQ40RGPb9oRCKOxKzAnLVL+QYPT2KXlU+cJxiipisWLUix+26Ab2BnlrYX0iWeTnzfqtEHRkruiwZqPhkcnAqUr7WfdJkMBS8DXoJsQ39nH0LDxUTImL3Ybm9f5Dk0JRg1tMM15NoLxS3vs15p4wvbiIJKSzyKji+NargiPQRcTXxxYWEkqSkJ1KPUSRFwgdXIS+x9zc1p4HryEuLDCPXAKzJj8toGEtgIasNqFIzWmDi5GdkmcUFGxp/T2BxGt/WBxYhQbejZGYonKbrWqbaNpFCl88pPKK+9Wb1B8pho+JWuB0W5RhajDnL/kzofcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Tue, 12 May
 2026 22:44:50 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 22:44:50 +0000
Message-ID: <4f68b11d-0dca-4b8c-bdb9-9dce30523aab@intel.com>
Date: Tue, 12 May 2026 15:44:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/intel/xe_pat: Add dynamic PAT index selection
 for pat-index-auto
To: Zongyao Bai <zongyao.bai@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jia.yao@intel.com>
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
 <20260511233622.2074382-4-zongyao.bai@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260511233622.2074382-4-zongyao.bai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:a03:255::9) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|PH0PR11MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e3147a-4ebe-4063-dea0-08deb0781359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|366016|1800799024|18002099003|22082099003|56012099003|11063799003|10086099003|3023799003;
X-Microsoft-Antispam-Message-Info: C+Rdy/k8+kyaFfsblqqvbKq5HN6fsIDQPfxD4ylm9hXd90Jw/4Dimmg10rH2BJ07zWFAaPRlXyjDu/HwvRZB/BvZr7vAhArlVw8ris5CNGkMfDVKMc9xNaNZ0xp69zKyjn6pvtNC2VjXkPqiqTEltLhOqiIsxkKVB+8Hs5EE9SmoGRvAbq/UBLkBQZWn0TPEScOYFqk7+oFAEoil1ZrP4BFuZYDp7o4pJGRbRqRTjWH5WcfelDY6FirshV/rsB1jI8f280ZOWgrUSwybHAG9Di2XOnTQU1MSv7rHPbOa8gRESGH6cD1mhjAFszcd5q8vc+gyFLHSPh2yhrAoQk0VkzDL7xWZBICHAWRc/JO71PCDvHwgSsQjKUBFu0nKgvedFOuG80lB+eXg2hCe1lDltWu8H9hRKuVvQDdyTRJIRaj5Nc4BCFHAJNFih+05NE/Mg61KusV28pkgmbGb+XDMnslLUY/Za/OUBnEkrFmyj/f6odfBGUZgXAEmFM8Ak3x+H4g2wHxVyM6rQMWK49/N8hACVrsFWnUIKJXkPcsf/ZILyKJR5Kj5nCvgM4Wg1pL03Sw9q9ZCMRefCn8XNM+EeU8ek/GwDmU2RfU6IjNflBt82Yw/51cMlcpGMSPka9uol6J+U4Y3aoNQvlaTBCypUy3EXxkzecFseMQ+DBQ9VIdMNtdy8+Gp7P5Bjo+jCFPa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(11063799003)(10086099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEpkR1JZdFVRSzVkQlFmbjZyRmtkenRiSDc3MXZKaldlVUlDYmV5elJVRHEy?=
 =?utf-8?B?dE9FYXg3eW40aENSdVZYYmNXQ3BsRy9NZlpJT3NlR3hBdERXaks5cWEwemp5?=
 =?utf-8?B?V0dzODlxZUxXaDN2cDNhQUhqcnlnWEhieUk4OHRiSXd4TElBYlpYTXlzTlN5?=
 =?utf-8?B?cHA0Z215aVhEZXRwbmZGSitNQjN5VDRMSHQyeUpjQk4wU2Zia2o3SmsrM2sy?=
 =?utf-8?B?Zk94M2JKMFZzOEd0TXN2ejM5dnJwSWJLSm9xd2RRbXJQRDIxN05rbUxnQW9Y?=
 =?utf-8?B?bUNLV3gvZVFaUjludzdhVkRTL01jZWFYdUlsK2dodzlNMkFUd2VJR3JWUHl5?=
 =?utf-8?B?Si9WWGV1MXhnYkRDNWhyQm1YQ2VUWElqRCs5SnpsM2g1d3E4OEZ6OUJ1MHNT?=
 =?utf-8?B?M2tIbEptWGpvR0trUUtTQW52WlRMaGk0VXRIa0tYZW43bC95OWVJT0lRRGVN?=
 =?utf-8?B?SjlIcng0SkY0MVgvMzVkeURHbllRK1gyYk8zNVg3dVRiaGpnVHV4MElwVkZP?=
 =?utf-8?B?OXBjYU9rcVhMNUwrMW9MWW9kMDVjVTVXcDJHL0JrVzR2YXpMaU5BRk1DbE5N?=
 =?utf-8?B?S3ljR3pySWh4OEQ5T05RbDRqdFN5Nm5iNVArVjg5Z2t1Z3EzUXRuZkRrSytZ?=
 =?utf-8?B?VmlwTVA2WmFOd0ZJb2F2SUpjZk9SUGVSVVBJRTl1bndldTFNNEN5c3VQbE1m?=
 =?utf-8?B?SFJLb0g2ZzN2c0ZZSy9xOFlVemg3V3lXOUwxZjJCUlVsdVY3SHM3bkNMUFJp?=
 =?utf-8?B?eGZXZWw3citjTUJaRVBEOEYwRmZsUjdxbGxGZWdRcUNUWEs0QVV2dEx3aTQv?=
 =?utf-8?B?NjFZb2pJVlZGS3dHY0NxMml4TjMrSm1KYnZYUFF6eEo3UHVqUmY2RmM4YTVu?=
 =?utf-8?B?bzNZRjEyWWcrRW02cFBlMG1aU0pheFRwcmxBQVgyQ3hHK1QvQWpHaXdQVzhp?=
 =?utf-8?B?VUQrb0o2b1piVFhGMDN2cnFpcVZZWG1SOEgzTEhZQmJoeThZU1p6aXk0Q2h5?=
 =?utf-8?B?Nm5Nc215UE5QR1MxTlFLdTdUYzJCb2J2eDJ1TExJdmEvcm9Ya09YalpISHly?=
 =?utf-8?B?SE5LL3Rlb3hJcThWellpRU5hcW1EVHp6TjJoT1JHRFYwUUMwbEVjc3BNUWNZ?=
 =?utf-8?B?STNGZkJvK2FlWHBEbkxubkFJTmlmMXpJQ3ZTQVBDd1hQWUhWUGc4UGxDYzlR?=
 =?utf-8?B?L1gwOHo1QWpaKzUybU1nYWxoVzdWZFZmS21IaHR2TTFocWVkZGh1dkVIR0xu?=
 =?utf-8?B?K05WYXhwMWxIaVRJaEx0c1J6WFhYRnZwcXdiMkFXSy9qV25hQkw3Wk5vSVJ0?=
 =?utf-8?B?SmN5WFFnZ0NpSzJKTFVhbTc0THJSOS9LTVFwWjF6UTNrUXpjOTFUYSt1OU9h?=
 =?utf-8?B?TTVwOTkzOHhWd1M0NFZxaVJsbjdrR0s4WHRPeDNuR251bkh2Ry8rWlJvdXAw?=
 =?utf-8?B?cHM1RGxPYkFudXdMNS9Ia1JycVMzaVNDcjVqNEFrTVFkNDUxMnRURTZxK2RQ?=
 =?utf-8?B?M0xtQ3duODBGU0N2K1BiengwaTdzb09keHVZdTFzQ2RtOEg3em9lU2tvY3Nk?=
 =?utf-8?B?WmZSQmxuMk5QOVRpcHFFZmRPY2tIdnZqNGZVcXN5b0xPVEd2WWhwNkNhN3ho?=
 =?utf-8?B?eGQ1dkl2a1pYU2tjbFdFaWs0dmxZVG5DMVZBQklDb3VzTk55Y1dUUDZLUGZi?=
 =?utf-8?B?VmxuNEhpL0FBS1dqWklRbWFnRU9nRTc5NWFNZzJWUDhLM1orR0xYckpJRnlF?=
 =?utf-8?B?SHJ3SEtPSXFMV0JPWEh6MHpUTUxGR1F5dTBoZHcrVW1Gc2hiRnhhcmtndUt3?=
 =?utf-8?B?SXVtOU54SkJ3Nm1CVk15NCtnUWpJdzRpbDZBUjlQei9GWXAvQXhxWkk3SS8r?=
 =?utf-8?B?eVJ4OGxxNjRqZXhxdDRNVGhwRkY0WFd5ZTB6TWRnTTNPSklHbWVxT25QcDJH?=
 =?utf-8?B?MGJJbHRtbUNJeWd4ekd4Tjd5ckpLY0pyajQ5M1NRYkR6TnprZTl5Z3l2VlFT?=
 =?utf-8?B?RlF6M3owdlBNdjQ3NVBGaUtWeTI0MUt3VThSZnpmNHZoSjI0MStsQ1RiMEUy?=
 =?utf-8?B?ZUlSUmtqUk9naTlJMzdnUlZuZWpTdU5yS1VSWTNKb0wzT2lZeW9uV1d2YlRS?=
 =?utf-8?B?NkRCR3d0YTgya1QxQWJ5QWtqYmZoTjFTZVdsWXF4VzJzOGl0dDRBWEp4WlNC?=
 =?utf-8?B?VG5DQlNuSXkyK2NlZmpGKzB2NWlmSUtLZ2R5ZzJLVFlBS3VoV2N3SkQxWjJr?=
 =?utf-8?B?UEliY1VNTjV3WUxGbUdPeExtMG1wRG90RTA3M1UwdThKeHVnbnlZTHNQRkN4?=
 =?utf-8?B?RUZ4S2VBbVVUYWRjZWVBTmRac0kza1FUY1NIT25PZEduL3dQb2lOZz09?=
X-Exchange-RoutingPolicyChecked: RtyxjwqVIq+haL3aMruMOCuC6m13EdOv6HyzB5gsSZUEZpCRxgFwyCzc7Es6KrsbxU5VUghq1LpGLVnD8eBV25d2SZiA3h7VOMObSYi+31HBjATITtMB9iZ5+evgtecNW0oMlt73sKOUmOB0rAdBBTn5NwOPFSAnEvj5V0NEc67AC4q+gE9utkR1zKEpLrufo1To19lpHulBj+M2SJEiVkqSksao1weZxK3laUhJnrgzq+Rlka3IzPzuvLPEO+B32nIpuuOA42SGsJZSCV8d+wxjlQRmyLOmTSnXCrmp3HefPPzZOLi8eAcpg5g6a3LYlfbUUYx/ZH1+kgBa1kTzPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e3147a-4ebe-4063-dea0-08deb0781359
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 22:44:50.2023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8dfRXY9rbMBsIlcV9o8617VeRtm9tolGJBu69iZp6B2SEkBYeifO187IlTUPjuQKZHabGRMt9CVR9c1SRga8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
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



On 5/11/2026 16:36, Zongyao Bai wrote:
> Introduce the `pat-index-auto` dynamic subtest to iteratively test
> PAT indices based on the hardware configuration, improving test
> coverage beyond hardcoded arrays.
>
> Build the test mode set by:
>      selecting a small common set first (WT, coherent, non-coherent)
>      adding randomized remaining valid entries
>
> Add pat-index-auto to xe.fast-feedback.testlist.
>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>   tests/intel-ci/xe.fast-feedback.testlist |   1 +
>   tests/intel/xe_pat.c                     | 158 +++++++++++++++++++++++
>   2 files changed, 159 insertions(+)
>
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index acff025fa..6851c1f49 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -211,6 +211,7 @@ igt@xe_pat@pat-index-xelp
>   igt@xe_pat@pat-index-xehpc
>   igt@xe_pat@pat-index-xelpg
>   igt@xe_pat@pat-index-xe2
> +igt@xe_pat@pat-index-auto
>   igt@xe_waitfence@abstime
>   igt@xe_waitfence@engine
>   igt@xe_waitfence@reltime
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 79f9a87aa..957f843ec 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -35,6 +35,7 @@
>   
>   #define XE_COH_NONE          1
>   #define XE_COH_AT_LEAST_1WAY 2
> +#define PAT_NAME_MAX_LEN     64
>   
>   /*
>    * PAT index 18: XA (eXclusive Access) + UC (Uncached).
> @@ -113,6 +114,7 @@ static void userptr_coh_none(int fd)
>   
>   #define L3_CACHE_POLICY_WB	0
>   #define L3_CACHE_POLICY_XD	1
> +#define L3_CACHE_POLICY_XA	2
>   #define L3_CACHE_POLICY_UC	3
>   
>   #define L4_CACHE_POLICY_WB	0
> @@ -1345,6 +1347,147 @@ const struct pat_index_entry bmg_g21_pat_index_modes[] = {
>   	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
>   };
>   
> +static void add_pat_mode(struct pat_index_entry *modes_arr, int idx,
> +			 uint32_t pat, bool has_comp_en, int pat_idx, bool cpu_wc)
> +{
> +	modes_arr[idx].get_pat_index = NULL;
> +	modes_arr[idx].pat_index = pat_idx;
> +	modes_arr[idx].compressed = has_comp_en && !!(pat & XE2_COMP_EN);
> +	modes_arr[idx].name = NULL;
> +	modes_arr[idx].coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat) >= COH_MODE_1WAY ?
> +				  XE_COH_AT_LEAST_1WAY : XE_COH_NONE;
> +	modes_arr[idx].force_cpu_wc = cpu_wc;
> +}
> +
> +/*
> + * Build pat_index_modes[] test table dynamically from hardware PAT table:
> + * 1. Read PAT entries from hardware
> + * 2. Pick common modes first (WT, Coherent, Non-coherent)
> + * 3. Pick random modes (shuffled remaining entries)
> + * 4. Return the modes array and count through output parameters
> + */
> +static int init_pat_index_modes(int fd, struct pat_index_entry **modes)
> +{
> +	const int TEST_MODE_CNT = 12;
 From the CI results, it seems the test is quit fast , why the 
TEST_MODE_CNT limited to 12 ?


      New IGT tests (4)

  *

    igt@xe_pat@pat-index-auto:

      o Statuses : 9 pass(s) 3 skip(s)
      o Exec time: [0.0, 12.56] s
  *

    igt@xe_pat@pat-index-auto@blt:

      o Statuses : 9 pass(s)
      o Exec time: [1.49, 4.86] s
  *

    igt@xe_pat@pat-index-auto@dw:

      o Statuses : 9 pass(s)
      o Exec time: [0.71, 1.98] s
  *

    igt@xe_pat@pat-index-auto@render:

      o Statuses : 9 pass(s)
      o Exec time: [1.91, 5.79] s
      o


> +	const int TEST_COMMON_MODE_MAX = 4;
> +
> +	/* Static storage for results - persists after function returns */
> +	static struct pat_index_entry pat_index_modes[XE_PAT_MAX_ENTRIES * 2];
> +	static struct intel_pat_cache pat_sw_config;
> +	static char name_storage[XE_PAT_MAX_ENTRIES * 2][PAT_NAME_MAX_LEN];
> +
> +	int n_entries;
> +	bool has_comp_en;
> +
> +	int test_cnt = igt_run_in_simulation() ? TEST_MODE_CNT / 2 : TEST_MODE_CNT;
> +	struct pat_index_entry common_modes[TEST_COMMON_MODE_MAX];
> +	struct pat_index_entry random_modes[XE_PAT_MAX_ENTRIES * 2];
> +	struct pat_index_entry tmp;
> +	int n_common = 0;
> +	int n_random = 0;
> +	int n_picked = 0;
> +	int i, j;
> +
> +	bool ensure_picked_wt = true;
> +	bool ensure_picked_coh = true;
> +	bool ensure_picked_noncoh = true;
> +
> +	/* Fetch PAT config from hardware */
> +	n_entries = xe_fetch_pat_sw_config(fd, &pat_sw_config);
> +	has_comp_en = HAS_FLATCCS(intel_get_drm_devid(fd));
> +
> +	igt_assert(n_entries > 0);
> +
> +	/* Step 1: Split entries into common_modes and random_modes */
> +	for (i = 0; i < n_entries; i++) {
> +		uint32_t pat = pat_sw_config.entries[i].pat;
> +		uint8_t pat_clos = REG_FIELD_GET(XE2_L3_CLOS, pat);
> +		uint8_t l3_policy = REG_FIELD_GET(XE2_L3_POLICY, pat);
> +		uint8_t l4_policy = REG_FIELD_GET(XE2_L4_POLICY, pat);
> +		uint8_t coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat);
> +
> +		if (pat_sw_config.entries[i].rsvd)
> +			continue;
> +
> +		/* Common pat index type 1: WT mode (l3=xd, l4=wt, coh=0) */
> +		if (ensure_picked_wt &&
> +		    pat_clos == 0 &&
> +		    l3_policy == L3_CACHE_POLICY_XD &&
> +		    l4_policy == L4_CACHE_POLICY_WT &&
> +		    coh_mode == 0) {
> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
> +			n_common++;
> +			ensure_picked_wt = false;
> +			continue;
> +		}
> +		/* Common pat index type 2: Coherent mode (l3=wb, l4=uc, coh>=1way) */
> +		if (ensure_picked_coh &&
> +		    pat_clos == 0 &&
> +		    l3_policy == L3_CACHE_POLICY_WB &&
> +		    l4_policy == L4_CACHE_POLICY_UC &&
> +		    coh_mode >= COH_MODE_1WAY) {
> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
> +			n_common++;
> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, true);
> +			n_common++;
> +			ensure_picked_coh = false;
> +			continue;
> +		}
> +		/* Common pat index type 3: Non-coherent mode (l3=uc, l4=uc, coh=0) */
> +		if (ensure_picked_noncoh &&
> +		    pat_clos == 0 &&
> +		    l3_policy == L3_CACHE_POLICY_UC &&
> +		    l4_policy == L4_CACHE_POLICY_UC &&
> +		    coh_mode == 0) {
> +			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
> +			n_common++;
> +			ensure_picked_noncoh = false;
> +			continue;
> +		}
> +
> +		/* Add to random_modes */
> +		add_pat_mode(random_modes, n_random, pat, has_comp_en, i, false);
> +		n_random++;
> +		if (coh_mode >= COH_MODE_1WAY) {
> +			add_pat_mode(random_modes, n_random, pat, has_comp_en, i, true);
> +			n_random++;
> +		}
> +	}
> +	igt_assert(n_common + n_random > 0);
> +
> +	/* Step 2: Fisher-Yates shuffle on random_modes */
> +	for (i = n_random - 1; i > 0; i--) {
> +		j = random() % (i + 1);
> +		tmp = random_modes[i];
> +		random_modes[i] = random_modes[j];
> +		random_modes[j] = tmp;
> +	}
> +
> +	/* Step 3: Merge common_modes and random_modes into pat_index_modes (up to test_cnt) */
> +	for (i = 0; i < n_common && n_picked < test_cnt; i++)
> +		pat_index_modes[n_picked++] = common_modes[i];
> +	for (i = 0; i < n_random && n_picked < test_cnt; i++)
> +		pat_index_modes[n_picked++] = random_modes[i];
> +
> +	/* Step 4: Assign simple numeric names and print debug info */
> +	for (i = 0; i < n_picked; i++) {
> +		snprintf(name_storage[i], PAT_NAME_MAX_LEN, "PAT_INDEX_%u%s",
> +			 pat_index_modes[i].pat_index,
> +			 pat_index_modes[i].force_cpu_wc ? "-force_cpu_wc" : "");
> +
> +		pat_index_modes[i].name = name_storage[i];
> +
> +		igt_debug("  [%d] idx=%2u comp=%d coh=%u cpu_wc=%d name=%s%s\n",
> +			  i, pat_index_modes[i].pat_index, pat_index_modes[i].compressed,
> +			  pat_index_modes[i].coh_mode, pat_index_modes[i].force_cpu_wc,
> +			  pat_index_modes[i].name,
> +			  (i < n_common) ? " (common)" : " (random)");
> +	}
> +
> +	*modes = pat_index_modes;
> +	return n_picked;
> +}
> +
>   const struct pat_index_entry xe3p_lpg_coherency_pat_index_modes[] = {
>   	{ NULL, 18, false, "xa-l3-uc",	 XE_COH_NONE          },
>   	{ NULL, 19, false, "xa-l3-1way", XE_COH_AT_LEAST_1WAY },
> @@ -1414,6 +1557,12 @@ static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
>    * Description: Check some of the xe2 pat_index modes.
>    */
>   
> +/**
> + * SUBTEST: pat-index-auto
> + * Test category: functionality test
> + * Description: Dynamically generate and test PAT index modes from platform PAT configuration.
> + */
> +
>   /**
>    * SUBTEST: xa-app-transient-media-off
>    * Test category: functionality test
> @@ -2275,6 +2424,15 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   							     ARRAY_SIZE(xe2_pat_index_modes));
>   	}
>   
> +	igt_subtest_with_dynamic("pat-index-auto") {
> +		struct pat_index_entry *modes;
> +		int n_modes;
> +
> +		igt_require(intel_graphics_ver(dev_id) >= IP_VER(20, 0));
> +		n_modes = init_pat_index_modes(fd, &modes);
> +		subtest_pat_index_modes_with_regions(fd, modes, n_modes);
> +	}
> +
>   	igt_subtest("display-vs-wb-transient")
>   		display_vs_wb_transient(fd);
>   

