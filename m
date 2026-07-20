Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B88C44521
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 07:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CB010E131;
	Mon, 20 Jul 2026 07:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmVqeM6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA4C10E131
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 07:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784531066; x=1816067066;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/43oq/lByiFAkdE7fmFdPU8l8CEpTb3ann2/yOAiZWc=;
 b=BmVqeM6FU4thBvX5Pqjhglp+p3iHdqDJ/2CQmV/thWhRbI9bAC+VhbLq
 NK2WmFgUIyKnsJFYQS9PuGtzPEm9Diwm5Jyf/57T2G2okWYVAJFKv8k9R
 p2yekpm/bE05fYkbXpHwNZgk2EZ2UQeFeU8uDpZNcAZLrpCzXVuDZRe5Z
 fQoQffv/vxxtgvMGJAV10155PYnipOB5q9zZBV5RtNP7uyE+ev2vUcKUW
 7tHjWnkY14O2OUWfo6sW4Wp30Alwc/HoIVK+e0cyB/LKzvin/6xLUp3YY
 jxQx++cfuaGVOr50evRZd951SrNcTjEIt7cu+b5XecJhryApm7ekZroF0 Q==;
X-CSE-ConnectionGUID: iW+kJLn4QFiGaVGj2i0prg==
X-CSE-MsgGUID: w7annOJ0RhWnXqkDTUDyNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95755884"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="95755884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 00:04:23 -0700
X-CSE-ConnectionGUID: nWPOHVChS+KxB+n2+DOymA==
X-CSE-MsgGUID: YDve8QlUSayBGs07hwJ84g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="260940717"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 00:04:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 00:04:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 00:04:22 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 00:04:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYd2iqXcOngEgWp5h0m8ogjABjUndX5Dur1BFkGVMXti8UDzcPlmN2IWywO1R1gcQwPjRwWtWdpQqKQPMbNUgV0DJN957CEFOs//h180GtDB6GE/gPdbQQW6f0DhAedIdyGbxfgDkwDkQl8Rt6BsBMSqQASiJPGC2iBw2OFTqSmNlM3A82fGbjuvPCaTZUrkKImWGBrSrBwSfG5DLQauzV2ANNiIOlv0QKsqf6djKIMr+5Jkg0RDz7bd0pfM3Jd9nZcBdi98dNrsskyB1B15J1GXQKol/FU37Sfh/xMnMzulNAj++hE3l0I4EMMOtlKrZyp0TDRZ4O0hx57wyrJlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQqG1Nd+8oQ6UYRsCAb3XbRjzpek8fLjbGjGAmvNOdw=;
 b=ZQlolkcCew0kgr/6H9S05yRWneT1Dj+I2QEKkGEc4F99laGkOQL5bIejLqS0iF37WQHlIESuxISiYl3VQ9gm7CRhN21hAG117Gw5ibDbagCfoleI+QzsmWf2nWNDR9I0acyV1gQNpxlHusx6010vlpWHhOgmlv11NPtEiwOJlgJ8D/2wVgeVz9+9ywcn4EWK37pJm8o6d5DXW51CchZpcQGm75HLaAtAUKphLve5z5/WeGgZY86YemmUS/pmmQE+RQkSCHhDv0mwpsZdgT/hrdWwmyOv0rP0zMB2WlMFWQHRXB3UWBj5bLR1mV/oxlcBFxh/1KlxhytAZvWV2wPaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 07:04:20 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Mon, 20 Jul 2026
 07:04:20 +0000
Date: Mon, 20 Jul 2026 07:04:10 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 19/31] tools/intel_backlight: link with minimal
 sub-libraries
Message-ID: <dk7be5up45kulcqy6e52xjljvulloqkzjittnnffr2dhvmkqjz@pxqqpnqhhtzt>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <79080311747e9ffd343b3b7cd21d97d63be4498f.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <79080311747e9ffd343b3b7cd21d97d63be4498f.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0007.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::7)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|BL1PR11MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: 30cad76f-c8b8-4585-1ce9-08dee62d1f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006|6133799003|27256017;
X-Microsoft-Antispam-Message-Info: F9yqWT2GKNH5Oeyfyf1dFhemK4fH3aGRYhH8yrZYC/ztFTePtVQOZ13mES4g9xKSxEUDpO8bFCn9Odz2WcNsyJk8ZQJWKt21/bR5cuFkYnFuCiXmFNIBQVP/7J/Ik7ltsNAs85JhPgy3KugpW5yppmPXCJ+J1krmL1LQl8Fhxbq6//whUk/yjwePiGM207gVwDe7onSHtoDM2WYiNWgtb2wLoB1smQoeVyisg69LbYWMzTZaQd88jMPDj6JJOEKG7NY3NYQbO9Qbet8ZuOJRFk7I65PrWD50kvf18h6Oe/cwSZ4aCIMl8fw3ncJai/0cX43RVYbgYktrwHhBv6z9tlmudjhwx6C9oeMU54iI5nthe6azlb9m+//e3IAiNVitKcbRaZ9J4lsq2mj+bpI3KBTwLqFJQC+P54JRRhFBpYv9A5OtuW0dhefLxpavwRgfee6RL1Htji/Bt0j+EQLIUtnPDzH+XZhDa49rRtc9DgjLlYzB4V42+e9fNnKEyN78rXeUAolYqtN/7RgseYfH1eygpfBYgb/d5hQHY6NhU5jCfRQkvYGzK/TwEtPZgHSiXEnuJC7Ac6ZiHhNXMCTroc3ac8RYgm2htwcjKzv5RfTDDQbwEZ7IlI/oTFCDFipZ7kMdJyUOY26HTwBMvK0qO+Ll9A2Lk10zBaFPavxRIqTCqAm1uzHXpgvmCN0Ly9oyF0UnTHV65el9qpdJqRHyxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGoyYldFeDlpZjZPSjhhcysyZSs3U2xMcUlYZStxZzRuT3BSS2ZXWE5UVG0r?=
 =?utf-8?B?UTNMUnlkQjhQdC9YN1czZUZJdDMxeVN5TW45MCt2Y25HU1pwbnp5MXJDVGNs?=
 =?utf-8?B?azdZZ2ZJbG02cGQybHoremtzQldFS1lDamd4aHdrdTRhaFVWVkZHVVRJNUVE?=
 =?utf-8?B?S0YxZFplWWFEaDlNVmRFY01zT3dEYnNrL3ZhMEMxTUd2VEVxR1REamw5VGgx?=
 =?utf-8?B?K1J4TEc0VHVqWThHVFdlaFkrNWNJYWR0TUE4S2g4ciswYlZnQTBUMUtiVElN?=
 =?utf-8?B?NGxkMGgxRm1Qb280c2hoTENuNHFDTWd6RE93WGg1NllISlppSnFUb0l0emNK?=
 =?utf-8?B?VTlTMDhZdHRSSitsODhValFOVmdQT04veTlZdHJZQUpEZnEwUkQ5empyZlU3?=
 =?utf-8?B?dEN4MDlLL1lvUDdGVU5QNWxPVnpOYmUvZFBEenRMOUNKMFBkR05CM250OG1R?=
 =?utf-8?B?NWh5Sis1SEQ4R2c1ZzZqVmFxa21NNjBJSmcyU1hzZVhxZDdVNTJ6QUoyL2NG?=
 =?utf-8?B?bFpYeEk0K1ZsNy9DcmZBV3lYbFlheG42bFVKMWx2VUZpRE5YRUl4VEh6b2JL?=
 =?utf-8?B?WjZ0RHloOCtHMWpPc1ZUcUpRWkZlVy92ZTBSSUloMzZYd0RSSHZnOVBValZv?=
 =?utf-8?B?UlBhdk8rUDNHSXN5UGJMRThaT1RRQXNLUnhwQ3AwaXdZYndOOVBzY3Jsa1JE?=
 =?utf-8?B?RHozNzEwemFZbU5FRTlFYm1WeUwrcTZ3VnVZVXVOQTlxMzA2M2EzTEpYbk1N?=
 =?utf-8?B?SUp2c1dmMjgyT2VDR2w4eU14Sm5uMk9kMFRaajkwaC9uSk5MV3ZtSHJxMFJV?=
 =?utf-8?B?Ulp6OWEwM3lTK0k4VWQ1a255ZWJMUWxGbEk2bVRycEszN1RvTDBHYjg2Tnpp?=
 =?utf-8?B?WjZtRjBLZ3RlbFFrTFdOcXN2SzZRUFJ0YW4zYUw5MEJld1p4L2JGajBiZzJL?=
 =?utf-8?B?QXNJNlNCekxmQkgxZWhFQldkUG1iaXlOZnc2T1FGMkdZODJkK2NUVnNYQTNK?=
 =?utf-8?B?eTlWTzUvRmtJS3Y5NDEyQ01rWHdVT1ova3IrV1Q1QUZtci9TYzFaNmV2Vm5j?=
 =?utf-8?B?amUrQTRXMlprVjBuQWI4QmloK1lxT3RlQW5ZRldDa0ZoNjZ2aXRFL0o1ak5N?=
 =?utf-8?B?RjlHRjdHMW5EMXJFTHdyZ0lVb0p3c3IveVFnZnFGSWpEdmZOMnFURU94ZTVh?=
 =?utf-8?B?ZFJ2YVhCTVUrSG9Ldk05K1ZrQUQrUjZ4YlJscWdXUG1xL2ZsdUxOL2pyVVo3?=
 =?utf-8?B?ajFacS9WN3lNcmRJMjV0M08xblkwZWNlTUhSMjN5eEhmWVFSTEFudXNxNXRq?=
 =?utf-8?B?dzdVWllpSzYvbDdYWGZrV002T3kwVnRwank0b0h4OXUrN0FOYkJycTNxUWRt?=
 =?utf-8?B?Unl2MHFPSDBpa0ZrTmF6ckZsSGN1MDhQT2pHcjYwaDZYSllqa1JjVkNrYmpZ?=
 =?utf-8?B?Qjk5aThtVi9meU1qdTNPRnpQcGRSRmx1NHBlaDkzQ0ZSUkFiUFNKMW52Mmhj?=
 =?utf-8?B?NHJybnFYdytoRnNHWVpSaGNSNldURE4xTFZhOG94WVZBOGZOazFsUklSZnRu?=
 =?utf-8?B?Vzlmd1dpM1Raa2dhc2tmeHoxNE0zc3FiY2tFazMrNEdXOXp5VWhqNEtGc0Zi?=
 =?utf-8?B?WEVydnVPTGp3UHZidzcxTEI0am04UklGamlGWTFWa2hnVUJrcG5NbnkvL1g4?=
 =?utf-8?B?WURrSXorYUdGZXZjTEY2ZzNjL0FHRkVYZy9JSnFIeXMrMEgwNUk0bEpxSGUw?=
 =?utf-8?B?QXFLMXMyRzdOY0tKSHhDd0c1Y0hDWSttRDl0NWtJbWJzSnphRUlvcmx4dnpN?=
 =?utf-8?B?N0lheWZCT0dNNEE2QVJ3dU41aTVMa3lXZDFuMStOMEFERFk4MFVDQXhOalU0?=
 =?utf-8?B?ZVc5UHJPZjErRTREdnpzM3ZFcGZyTVpDSmlRbEJuSFc4WlNBdjh4UjBab0dx?=
 =?utf-8?B?Q3dpc3FsdGJ3cjc4TGo5VTRkM1JRNi9WYmlCelVPY0F3VnZKNTVWZC9kYUlH?=
 =?utf-8?B?bjVmTko0TlZaeWQveURRWnIwZkJLbldNSXdvZkFaeUVpc244MEhuS0RLYXRr?=
 =?utf-8?B?RXlFa1NNbWdpVTEyczVYWTJNQmhLVWREOXVTcUFmeHZzemU1Zzc2d09FM21h?=
 =?utf-8?B?bndyak4yRGpqbjdYL2VHeXc5akpIRzhmYldnalZ1MWVtQWcyanBzTXRENVhu?=
 =?utf-8?B?VGtHa0NrRXpZWEZoZ3UzNVhSQURGZXhxY3ZtczJkT3JiM1JPZkhNdEw3bDJ5?=
 =?utf-8?B?bUVqQmRCT0dEcUs1cVMwSXNycTJ3dFZvQnR6NHY4K2pqejk2d0dlcUQ5Zklv?=
 =?utf-8?B?Q1hjQURpZDNWNDhiaGZwbit2a2ZiTUQvNkdCNjBRdTNhSk14eUZQaU1aaXYr?=
 =?utf-8?Q?2HpCMQt9ansENCc8=3D?=
X-Exchange-RoutingPolicyChecked: SiqbH77gTiieOL8bTYUQue6BkqhQAGOjPJ8hnMUKKHjI3PxxDqOGIA8+DHjvAxvMpIj8ak1LN9Koi1AfCcoGEpKmKuGzo7bk+yktZrSsYltCaPobIOh697Ef9xf4ePiNKprrf3MiseC2mTKOE4etw5mzHa7AF8UpNbk5y+TqFIieqx2GROH1JjWS6HcUDD5gYNWzOFcZOPGx9EFS44IJCcvjn5El/4/YmSvbKAqnkU0xpxUGN31kgpXCSjxTnrE5hlQ6zW9qwPc89ELC0qq0UnSjCBk1kBu5SHBGJCPe4YLevyueaIP18Xy0Y4QyA/zg/MPUKQNVvDgcf7krUJiHyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cad76f-c8b8-4585-1ce9-08dee62d1f52
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:04:20.7638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d092A0aaCCbdpU7Sy5TbtRVU7jDAm26YixtBlt4lzFnh0zSliGb9nGCtus8IGcAjWffKcbwtWn2eYoUJlet+9eUpK26XHkMo0rE6b+VrD68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
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

Hi,

On 2026-07-15 at 14:15:29 +0200, Sebastian Brzezinka wrote:
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
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
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
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
