Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE282D5D689
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 20:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C51E10E313;
	Thu,  7 Nov 2024 20:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbi08jdc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6F010E313
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 20:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731010037; x=1762546037;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=gfOWSgUw2nJzrtEIYPQbErIHoVBset9UN0r7P/1grdg=;
 b=dbi08jdcrj8Np2gZZF6EReEkpWD3fyNcgPUGCNMHtYVtedOAOYIEBYYg
 3l+pdS/peWtbhFUvU1EQ5np12qCRd06lvmLjlf9SH6wad3ivdoueqYOsu
 1eqogJyGTkajOUn++BeZ0dqaSHEr6FjySsyXvXufSZY2avMc91A15ZPtb
 V7OKp74zvc9T183aRBSUh5K+K+AGbT8LB5h/iMW2xV1btHkk23BOKCZy4
 8VlKJfzHoOOZUqlpqWAS36UjVasqF0LJmlWkuq/8kYr2ocDV2d4bwsq7P
 6XmMeFiPP5338XLToP6e1qAMo4bAQ54TxHdK2Ua8H+FGUp5jGvLD2c16e A==;
X-CSE-ConnectionGUID: 2os1pUvHT1SiDEeMHwR6AA==
X-CSE-MsgGUID: Fhs2nSxNQNK7jcmWj3MqWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="56275480"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208,217";a="56275480"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 12:07:17 -0800
X-CSE-ConnectionGUID: hYNI45CvTs23KXQho6wnVg==
X-CSE-MsgGUID: Nk0+1zekRYq/ONnqO9Q87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208,217";a="89172622"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 12:07:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 12:07:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 12:07:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 12:07:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhzszEH91Jdu05vkR2nqb506Or/oNgWrEoIRVv3ZylWuG+YP6DF/7FQyvcsyAZQdn1mHGK8gY/XOCGzfJQDTNa3sCqQKV7x3pG7xCqzJYil/XrtvobU01NLziuUoBrZF/nnVPdxfyiUoq4bIOoyJNiqGlklg+o0gjXCSBwuaU2zjNIdAgplFbmJpKESiptERF1hRoVccm9PKM1t5HYxz1vCnppXBP8bhQQ2SBEGlAPl20A7J46hyLKwJx+2xK4dDJRWf5nBWbiK+xyYDte1S970H9DXPpcJMAHJQo3ELDXYTU0r3eylirT8CuYq3g/mVypxgoIsUTmcumdIgy3b8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uy4nxjj/bYsXXr32AefkOk+P5c2pfunqmalOjY0DlRw=;
 b=D0paeKMej1B5aJtFB5TxKj4jsJF9xHTczh+FwIQ9L8KWScJvaxeJ1sVDhbhIJpToxtjWFaql1/w0hrGoO5EDu9Lhn2V8PFmsMrzZXiFS6Zk1VrL99g/4QlbqC8b/5FM9+pkTRs4F8laUGdUJyfwPwMuoqfjQ1PIqnJJyWMg76YKExY0uV3kjFwNEWZfjub+bd38Q1IOmy6TM43r1ZnHuuAG0nK9hNTE6+GgU56bckbu70yziyBmH7vwU/4V/yrciwlTzkUw7q0Zv3Xicc11eJ75ekhzbiiNduzPypanGWBIleRbx5xdfIEavh5FuqPOStjZnml9Jspk2lyozMeXnhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 20:07:12 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%3]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 20:07:12 +0000
Content-Type: multipart/alternative;
 boundary="------------9gffDBnBQWyR00xRNwpymaql"
Message-ID: <593e7d35-1c02-4e61-88d9-7efe73f563cd@intel.com>
Date: Thu, 7 Nov 2024 12:07:11 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe?=
 =?UTF-8?Q?=5Fvm=3A_Reduce_n=5Fexecs_for_bind-array-enobufs?=
To: <igt-dev@lists.freedesktop.org>
References: <fb348c83c291f4257f525077660b9b67630d25a5.1730838535.git.jagmeet.randhawa@intel.com>
 <173084354563.1414110.7825204094288727695@2413ebb6fbb6>
Content-Language: en-US
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <173084354563.1414110.7825204094288727695@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:a03:100::38) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|MW4PR11MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 995a7571-d9ae-421e-1115-08dcff67c49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y012YlhtQVcyOWhBbG5sVUVPa2FXMHFobHhTQ01ZWVV1U29hRTV6aE85ZnRU?=
 =?utf-8?B?dTE4bmZxeURZcFZuN1NiemwrNldab2NCdXZ5WHRGMThoNHpzaEswMFVMNmN3?=
 =?utf-8?B?OENvbXZROWRHOEVNUmQ4R2I5cU1PWktqQmZESTYxNnJnM0lJcGMxNE4vMXlS?=
 =?utf-8?B?U3ZJMmQvdVpONDkzaDQ1ejRSNmt3M0QzdGg0b0tkYlpaTWxIanJlN1NDUDNS?=
 =?utf-8?B?TEsxUU5zOFoxcEY0Zkt1dWNKZ0NGbnF1QmdFOGQrMDRNUTVXc0RZRW5iekt0?=
 =?utf-8?B?LzM4L1V5cThpaDdreWtwUTViUVpYNVhKSmlQNDZ2WGNmdTNyNXA2bVpyL0J3?=
 =?utf-8?B?VUt2RGY2dFlWVWNub3hBMThkWCtJdTRWRW9iblZHNklNY0lucWw3bGg1ODNp?=
 =?utf-8?B?ajRIMzFqd2tWelVQZ0VLZzV4STkrV1JNMkVyd2hJQlNuTytqL1FnRXpvRWV0?=
 =?utf-8?B?NG1OR1hoeVBmTnJVYlhYVGJIRE9VZzhNb25NTmx5cENad1A0c2JZNmplTGpX?=
 =?utf-8?B?azBuOEZBZndYcUZXWHg0NjZ0NXZtM0lGbldXcTBDRjg1aCtxSHBWTDZTcmZj?=
 =?utf-8?B?elhLbFc4UUxuQk5kQVpBOXE2TkY3V282T1JhalJRSThWV1Z6akFzc25GOFJ0?=
 =?utf-8?B?eld6RndNVXZHcWZVYmZUR3ZXaE5QZ3Nub0k4bzZZdnluK3FMU1RIWUlPTlRI?=
 =?utf-8?B?ZU9PYlRFelpsWVhYdC9ERkorRXBVeitoM09QMnZuUnlydmh2ajNOcThuK3BQ?=
 =?utf-8?B?UVRqL3MyRFhkVDFld0sySnNpSzRudXE2Z0lpendRSzcvR1VrTDhhaXgxM2h2?=
 =?utf-8?B?OW14ZlFjc3pHTlFFT0RkSE92ZEkxZTdzOXcwbFY5M25ZQzM4UFdyT1N2QkFD?=
 =?utf-8?B?dmdBeFFWbWYvS2RJNXF0MlRWeHpuTW85NVpWYzJMdks0SW9LUCs4OURZNTJp?=
 =?utf-8?B?aDhQdmZpclluNWJ6SjZkQTdXaVY0V28yYzhtc09sb0FNbXVxa3ErdU91LzBD?=
 =?utf-8?B?Zys2K2Y1aFNOVnFzUnB4NWlVNGc5TGVlNW9DaHExSmt0VHZNd002NGxZd0Fa?=
 =?utf-8?B?Rm9HTHl5TCs3aWEyVzhIWktmdVNDa2g3NkJvQkNPQUI5NTdLZi84R3FsQVg0?=
 =?utf-8?B?dnNoS1krSHRPZkhuTHhUV0xMemNFZ2htTlprakdYODRSNGxpNEM4QjEzaFQ2?=
 =?utf-8?B?YmFZZHR2SWRXdmF2cGRSVG4yd0tmSEhRS28zV1V4cjlaVkpvNGkzejZiampW?=
 =?utf-8?B?VG9MV21yTGFDVjM4eS9EYVZoZi9CRGFYMnB6Zk9EeDlHRjZYUDZsV2NBZkp6?=
 =?utf-8?B?dVQzMCtYVXZxQjUrUmh2aEFmZjEwN1NhelQxQ1N5b09PQzBUcitOanFlZEhS?=
 =?utf-8?B?cUJUQ2UzbXpUR1RjbkFwZ09CN0VkT0hqdXhmUEx5SFdTdXNWWFo0VmtFNUJ4?=
 =?utf-8?B?QjZsbDBmRW93Z1ZxYVZGVXo3M0F2MU5qSEVrT3pXampzZEVkUTMwbTJsV3ox?=
 =?utf-8?B?QXRtWUl6Vm1hU2RtVE0razdBdjhxOVovVys5SjJaSUlqaEQ1ZnpmV09laSsw?=
 =?utf-8?B?YlpKVGcrOEFndHFCUzRwVm9nWUR2RkJZZHl3eGFPcjdXeGE2Qnl0Uk0vZTRE?=
 =?utf-8?B?WlRYN3ZCN2tiOWJ2bGJpYjQ4eE1hZThFTzVodi9VZWRocFhMWnNVdlR2dllZ?=
 =?utf-8?B?ZzlmNzBQbC9Tb0RaS0I2ZXdjN2p5Z1JzVy9PZUhseDNzSTFqU1YzK1NBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXlBTWtrYUVSVkFRZGlMRDZGRWdMY0x1OXRFMVhIWGdlK0lmbG9WS3Z1c0xO?=
 =?utf-8?B?QVRmL1NjWXlSYXRmVE03RHo1RnR1b0pxd2huNzNORUNQRlJ3ZmxuUzIvTjEr?=
 =?utf-8?B?Mk9oQjlhZ2kzMUpNRE85R2xJTDd3M2xCc05pZGxNS2RKL1p1SFUwdjNOeFVL?=
 =?utf-8?B?RlJpeGFHdmg4UUVxRFlhdHdtYXhOdEpnc2pUdWs2OXFHWXhqNVduZVBiOXVH?=
 =?utf-8?B?MkZ6THZqTTBxYVlxcW9HQU5YN0ZrN04rdlRQeWZNQXNCbERSbmI1UUN5UHY4?=
 =?utf-8?B?eHFyZkJyZEErem9xYmZYTFhPeEJyamFsNWhsdGM4N3RDY01iNWdteW9PWnlh?=
 =?utf-8?B?Q3o4alJuNDF6ZDJzb1BHWERRYnQ5clAzZWIvcHkwKzdUODRiSXM0UVlmRkFv?=
 =?utf-8?B?VUNwV0NCbjVwSjYxQUVEUVJLZG93QTlTYlpHRGdmNVMyeGROUkNWOXNaSFpG?=
 =?utf-8?B?eEZza1Ywc094MnI4RUtoV3Awa05ROFR1VHBzZTRFZ0VBMEtEUlZXQ3pvenly?=
 =?utf-8?B?NVFLSmlvTlNZMVJnUkxmdzZOTjNEcHdpdzZpOHliWHY2M0Y0cFdBSitaZ3RY?=
 =?utf-8?B?SFNxa0tJNWxaMDUwN2pjSEh2YVZkL3o1TUQ4b1JvYTRqd0JkT3phMGhaNDhw?=
 =?utf-8?B?YWlZakkwcUpiN1ZOL0ZQV1B4VlFvbU9ZZVlkamdDNDY1d1ZNOUNHMXovM1Ix?=
 =?utf-8?B?MldvUmt3elloaXhJM3dWbjdxOFpzK05tRHR6a3drcFNBNHMrZmZGeVhpVDUr?=
 =?utf-8?B?MStkRmVWWTM3SStVSkhsZkp0Q1BHVmttKzdNa2tPLzJyR0xWQ1ZoSW9wUWpP?=
 =?utf-8?B?M2pRYzZZcUdDQmxENlR4ZVc2aXVCa3FOZ1JrUVJRc3VEL3R2RFBtSlgvbXEz?=
 =?utf-8?B?VFY4NW9RSHlSclI5Y25ISnAySW1EdEZPcVQyRGhkSVNFVWdNNU1sc2ZTWnpu?=
 =?utf-8?B?ejI0SUNPRCtDRVJnVFBqdVhIK0dNU0l5U1BHa0NtQ2NNSjhDUlZXV3B3Q1E4?=
 =?utf-8?B?SXFQYWVISVh4SVRwRldRcG1yYW5sem5xeWlhU3FIUGptVk5heDB6RVRKVGdi?=
 =?utf-8?B?R0o0MlJFbDNNaVhWYmxNd0RrVzU1bDZNMVR4TVUySFdpWnAwQ09KU3dkQkMr?=
 =?utf-8?B?ak0yZC9rZHdKOTZic0h0VEZCLzUxdUFpZVR2Yll3TWt6anhRTStzN25ibldS?=
 =?utf-8?B?MWJBYmQ3WXM3T1o3Q3BPc1NDU1VkVC84NE1wdE9EMkhFN1p5WXBsaVVKQm4z?=
 =?utf-8?B?YjdYNG1EUHRsaHFPNmNxTjRzZExtT0dHOWRKT1NVamxmT3k5Q2h0M0FhWDZY?=
 =?utf-8?B?eHFSTk56ZWMzTmtmVDRzNTc3UDRxYU55R2tBSEE5LzVTdXo5TXpsTXBlekcv?=
 =?utf-8?B?b0ZNOU0vUE1JVTdCS1pKQ1k5RkRxQzhWRXU4SUNEaURTeDFXenZTaW1vUVZs?=
 =?utf-8?B?QXJ5QTloMVpQVWJ5QTJKd2h0bFVnRUNCQUpncW13bGlGR1loQUtZZ05LVVRW?=
 =?utf-8?B?bzkxU2ZoWlZPTHVIanozY0E4M1dVWXQ1dENRRy9OQnVPTXpydGJiUjZSSHYv?=
 =?utf-8?B?OEZKalFKSldsRkkrcnBaek8xTVZIZUhOK1NiMFJ5THZRbmYvOXZiNU9rZWZn?=
 =?utf-8?B?bnpRWTBEUlpKSFhxeW43ZUlnQWh1MVVrWWN4SGR4T3g1YzBOaHkrQ2pmV2dq?=
 =?utf-8?B?T25MSG5MRWcwU2RjN2x0Wmp6Z3NIeDJHdXVCek9uSkx4NzJibEJPY1JEL2tk?=
 =?utf-8?B?OTZNS3ovcmlQYzh3empBdjI3YSt6azhPaTBQWWhlSmU0U3lxNWxyN1J2UG9Q?=
 =?utf-8?B?MmUzdWFnelM0Z3NsUnVGZ2VudTJWRGoxNTZXc0k4cjlRcnZ5YmxZN0dqZE5B?=
 =?utf-8?B?azRPRUxTekUyMm5mY3N4UWRRbmJteVNBaC9lZzV0bCtRN3ZERGtxSW5HZDM0?=
 =?utf-8?B?azhRdVhZKzF5dWxLZG15MDg0S1Q5RnlzajVmZnRnVzhZTVJOcUZTbzk0bTFx?=
 =?utf-8?B?SGJxUkZheEdMclNHMEpNYUlHbnJXUmNzcjk0bDFQK0hqV2JxOUZmZ3pSZTVm?=
 =?utf-8?B?M3RsYWdvdmNqaDhPMnFNUUg4Y1E4aERhczVVaXVWa0hlTVZMMjdkYmdLL3d3?=
 =?utf-8?B?bXF1YmFLSGRXN1ZXL0Z0YVN2Ui9QWUNORGhtSENnczgwU0p1VU5SVSs2bytm?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 995a7571-d9ae-421e-1115-08dcff67c49b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 20:07:12.6201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpHOQOrxEXTWlPl7T2k6EJUIv5A4DcwZz3wotTCANbXyRX6HVCksBa87ZV0hDVaq1LeWbGmZF+nVBk5al181U8D7eYjPugehyQ00+MbyIZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
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

--------------9gffDBnBQWyR00xRNwpymaql
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi igt-dev,

On 11/5/2024 1:52 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_vm: Reduce n_execs for bind-array-enobufs
> *URL:* 	https://patchwork.freedesktop.org/series/140965/
> *State:* 	success
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/index.html
>
>
>   CI Bug Log - changes from XEIGT_8098_BAT -> XEIGTPW_12042_BAT
>
>
>     Summary
>
> *SUCCESS*
>
> No regressions found.
>
>
>     Participating hosts (9 -> 9)
>
> No changes in participating hosts
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_12042_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@xe_evict@evict-beng-small:
>
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/bat-adlp-7/igt@xe_evict@evict-beng-small.html>
>         (Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +15
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
>
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_frontbuffer_tracking@basic:
>
>       o bat-adlp-7: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html>
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>
>       o bat-adlp-7: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html>
>         (Intel XE#2874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html>
>         +1 other test pass
>
This is unrelated to my patch.

Thanks

Jagmeet

>
>     Build changes
>
>   * IGT: IGT_8098 -> IGTPW_12042
>   * Linux: xe-2168-b925cb281e79b763990ed64267ef82a87ace5060 ->
>     xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0
>
> IGTPW_12042: c90b9d96eeaa62f09596c5f4e5c759633bbaebcc @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8098: 8098
> xe-2168-b925cb281e79b763990ed64267ef82a87ace5060: 
> b925cb281e79b763990ed64267ef82a87ace5060
> xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0: 
> 1051f5a468c5531923b01ba67999e502ce47a6b0
>
--------------9gffDBnBQWyR00xRNwpymaql
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi igt-dev,<br>
    </p>
    <div class="moz-cite-prefix">On 11/5/2024 1:52 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:173084354563.1414110.7825204094288727695@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_vm: Reduce n_execs for bind-array-enobufs</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/140965/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/140965/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>success</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8098_BAT -&gt;
        XEIGTPW_12042_BAT</h1>
      <h2>Summary</h2>
      <p><strong>SUCCESS</strong></p>
      <p>No regressions found.</p>
      <h2>Participating hosts (9 -&gt; 9)</h2>
      <p>No changes in participating hosts</p>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_12042_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@xe_evict@evict-beng-small:</p>
          <ul>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/bat-adlp-7/igt@xe_evict@evict-beng-small.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261" moz-do-not-send="true">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
          <ul>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +32 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
          <ul>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_frontbuffer_tracking@basic:</p>
          <ul>
            <li>bat-adlp-7: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861" moz-do-not-send="true">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
          <ul>
            <li>bat-adlp-7: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874" moz-do-not-send="true">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>This is unrelated to my patch.</p>
    <p>Thanks</p>
    <p>Jagmeet<br>
    </p>
    <blockquote type="cite" cite="mid:173084354563.1414110.7825204094288727695@2413ebb6fbb6">
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8098 -&gt; IGTPW_12042</li>
        <li>Linux: xe-2168-b925cb281e79b763990ed64267ef82a87ace5060
          -&gt; xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0</li>
      </ul>
      <p>IGTPW_12042: c90b9d96eeaa62f09596c5f4e5c759633bbaebcc @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8098: 8098<br>
        xe-2168-b925cb281e79b763990ed64267ef82a87ace5060:
        b925cb281e79b763990ed64267ef82a87ace5060<br>
        xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0:
        1051f5a468c5531923b01ba67999e502ce47a6b0</p>
    </blockquote>
  </body>
</html>

--------------9gffDBnBQWyR00xRNwpymaql--
