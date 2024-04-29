Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33774C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 13:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C52112C80;
	Mon, 29 Apr 2024 13:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNcwGYW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3018D10FE84
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714397511; x=1745933511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s5EX0R1dwriXX5YAoEIv0hnKksJXm+uvZTbD8HV23mA=;
 b=DNcwGYW47GB8bG/hRt7m9Q6eNr8f+DrUNk/waOoXuLmFUHObQTj+ZV5c
 5+znRnHm8xvL4qyKeRWbtCuPbQQjFkIc5enL+x+KoSpGXvtERFKwYCDyi
 NYMKop1BpDit2P+BlcjX7g9QmRSu4lVT0Seg31VXe0MdyYgF3YQiACK4s
 r67KEbbhg1QTKUxyyWX7G3uDxkEq7fvAnbVOOvt8RQnfMriFCCLDto50Q
 gZiZeqOuo1TU8ftqZdVtQ7qvzsQnaUglifb0B1MaRPUcoz4zT+GZRKIwE
 e9Ns6LnDGNcXArJpHQWDnOqZFXLBpTbNmR5tO+Js/kr2pu8xsD1MfBicP A==;
X-CSE-ConnectionGUID: CJe+I+S+Q8eZ74eeBGuwKA==
X-CSE-MsgGUID: 8C2QDZnKSH2rgWEkVJbH8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10592107"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="10592107"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 06:31:51 -0700
X-CSE-ConnectionGUID: JRfzCHDbQESPl09boBMA/w==
X-CSE-MsgGUID: VQt1hfAQSJSKnC/C0b3pxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30760841"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 06:31:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:31:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 06:31:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 06:31:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 06:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5OsiGFj8xW/B5d9Zs4UDvw6julUPXSOTbCpjnl2mF0nO1QFYBq8Era/Joi2Bnw31vgbailFUmbMSGTHfGVgzrDSzuM1TKIfZ/Pi/DqTDK5vUEZloHhu+Q0YI+HosjNlhFXAkovvT9OyDyDy9KUK0SbEE+v98T2CufcxOvLc1hSQLJ+n1zoznuImd1O6xdfkkTi1TfX3163y6LsBphqD/C3ytqtaELPoJkFSmbq1MQ0Jc0k2xDQHIU4lhRmZSHmWD89Un2p3RD+ztPd2WZTuuaOlL5uovmpu6cgLQWUqHZ4adxeOFfa7GTfGG7phpYriHzpfV7kkaws0WBY7y5bkug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5EX0R1dwriXX5YAoEIv0hnKksJXm+uvZTbD8HV23mA=;
 b=c5v5tmiK1UDZDUu2hSFPkYIrE1d1n6iai6jkpUYonVE1ZSmaC4Nz2XVaHOLsCLIOwVybXbh3YQllGwjOc/+s022gQ9RRPqn4ZqjCeGVnhpRVPal/Ol3j6khtLb9LF9yjt4oHtVziX7xr736QgFlOf0cDOOrK4sbZUbu1U+DZMsyp2RGGecHq6+HFsFwPVMcrwfm3RsXPzT/x3iFhiDjMGZXwi0NAvaO6L19faylr8soiMUiAnpRny0HLqDNXl1P2kIq/8KOOlO/iSLZv6p0mDzz0/yKQRr1i6xLuajb1dLiUfCzY8igTmD3ktjUV6KiQ7M8Oq4qnrjwqgc0MmpAFPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 13:31:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 13:31:32 +0000
Date: Mon, 29 Apr 2024 08:31:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] intel_reg: Reorder commands and annotate ones
 needing reg spec
Message-ID: <dgkn2tfwo7ly6ob4m2kvfaiqgkzdmj5hsktaaufdjk7u3t5or5@piz4z5w3vk33>
References: <20240426153352.3209972-1-lucas.demarchi@intel.com>
 <87mspc4jxb.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87mspc4jxb.fsf@intel.com>
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af6a1a6-b108-43ce-3bc9-08dc6850aefa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ez+riMfAw8onPtSGiZ/EdXwaNHrQETzEf5nONb1GFKPVrCQYMIXrUPOiaLwr?=
 =?us-ascii?Q?JP2/WH9DNlAHy7axES3Daqwr0GKtmF37GH8o4Br4OqGBveWu4PNtUn0WKW37?=
 =?us-ascii?Q?aSxAEfJVUmaNrfEkjSoWV8dJeuP/s1sp1EYBzArYZGfeAMDRmEEYvLYUxxF9?=
 =?us-ascii?Q?iIBGm+JrkWs7bKO49+qfDr5PJctPcGJl5FMAykYHm9spk2Akb8FG7xJ+2+DQ?=
 =?us-ascii?Q?yXOhmJC0G8xraxr2vSStOlhAMO2Aw+l/cYNivKFBsOF1nLKlTEdKqYRC8p2u?=
 =?us-ascii?Q?+HPRPgv35GbWO4jTGckFQJzkI/3hq3zkN+SXjZZSBF8BQJQCRWHnjH2IaUdz?=
 =?us-ascii?Q?ZxhzfFhdSbcH31h9lDz4/B/XEhnXMPEf5Z9G/lL52yxzQAe9mo5gpSkI5o2M?=
 =?us-ascii?Q?xDjkGstaRIWLIqRu+OtU7vufSDGBE3SprOsMoibqGl5BRuqZTKQgfRWqpvlj?=
 =?us-ascii?Q?rpLaACIUvQQ9ajRjWHaw1Bmh4lElGHc6jIEcKEaqnlA4CkiX+TW8jpCtN5yJ?=
 =?us-ascii?Q?QYB5VR5UgSeWDCKpG3UZkXTatx8XioCL+unZpnoMUtbTatmt5jWL5TYpJNMD?=
 =?us-ascii?Q?UH45hLCJRTA2CVX4vx3MsEXh0mI684FHhWfcOR+lVrcNnkTmHHDGukjqWRr7?=
 =?us-ascii?Q?0KntIo2HA4SoiMw3vCk9cblAAaxFFDtMWwa+KAKP2oLcO5RSzPT1HPGmeiUZ?=
 =?us-ascii?Q?8juelwnzu2KwkpT1DKf88EVijGokyfZLo1fOfXcBJ1uZjM0jC7KwOLeXb9hg?=
 =?us-ascii?Q?Id9XkLcn9oI67Sxo2AucqSbn6W/t8xxIppZKVikzzsjjFZjA/EtzccYl8+i8?=
 =?us-ascii?Q?vSY7OCS44ySWZJI1z0yIwFyTBhwmUVRt3WhT4yacBvRFFFArPUodONWVbIvJ?=
 =?us-ascii?Q?m+iI0tkjWl978h/QYLhn58Je9dTo3KYrH75uLvL13x6rsFrjtMnFZ0dzPrh/?=
 =?us-ascii?Q?yhwjCpEhPmGpR8TPTE2l8quPPAjkyJrgINgd6eVmswUk10tTBHgq1cVi2Q9l?=
 =?us-ascii?Q?LYzah3B0kJpSsuFlrAeqK8XVKzImEHBkFDAejTHYtLM1hRr2mSO4DGJq3PNE?=
 =?us-ascii?Q?yaX12Bfq0kyrpuqH4oAQeNELIRjy/sRWHm+jFKo6DXwR2fjWJ+kpZ2sl1kVj?=
 =?us-ascii?Q?EVRp8SeX33+P8VFueahNqF3RKiszQ80Z4eV8Et9l6so7HmJTjSZ/9zTJt/AJ?=
 =?us-ascii?Q?RfXeuTLm+1iDA47RZBZHf8LLsF3L1UIfGAy1efZuGTBXjK6ANe+GpT2W/X9t?=
 =?us-ascii?Q?Rd+AVq5dlbNMfgxKc7bL5cduc7z2eGGWkj3FHj7z7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a7uzNwDbHzzXX+lyBWCww42eJ3QyFmGyW3FNAPVShrrfYqPppWzpGAOMNvLM?=
 =?us-ascii?Q?mgVIuOgMJBtB6I+ZnMt/c/jKXrCywdSJXKHZ6v4JiOhqrYiIV4+THqc147ps?=
 =?us-ascii?Q?VqoC3063LnXZhB+rSw7guGEGT4dZelEb8eyYR56tIvXlpC/SZmRIE9WdztBr?=
 =?us-ascii?Q?I1ABSsS9VI8lGwTaTfo2rKBzs7n1xbQkFop3hGx/nLZHC0TtdsjL56JlSf6J?=
 =?us-ascii?Q?zbd/CrQ3/3L3Z47VnWP/kr8wchNvaE7MGuc21n+KgzNliWAeLVIhPRbv4tLV?=
 =?us-ascii?Q?8X0B3EzIXV3ez4NI5BxXK0EzMRYOmiJISnTibX5UMT+fCl4knLXo4zwzg8dc?=
 =?us-ascii?Q?K3hCXKY0sQ2DESIU0VVCtsp4eYZ0FtKm2jKO04JnjBY86dfrZFHWPfpqj7jp?=
 =?us-ascii?Q?w1kOVEVj4/E4AHyCODvJr+bnImSGvOawNIiUIEgTkhNSO0+4q96Fg2Xmm884?=
 =?us-ascii?Q?TxMbJhIY+i3ew8bygnSbc+7NSiHqbSd7rpCHJ8jwSXiYb2bSuPxK+lrVQ6YT?=
 =?us-ascii?Q?3W/cLnn8htMptox835nhQni7pwsmhXGIJpfNiZDAW+OUWMXFim9z/IFJQNd9?=
 =?us-ascii?Q?dF4NFLQ4wsiHq0BTMfelToS8e6g9M433p5t/GYSQBT07DI7RJ/wtj4Hp6Uol?=
 =?us-ascii?Q?7FdzCW5W4RBU+h8QNchqHpJ6asUKjXIZkWkO5br3KwirumRGS/TknnfZl1/k?=
 =?us-ascii?Q?8csLiRKNv9jLi62xy+295v7hQ2vdGYRPwMxO4EVf/JvEYyTDg59CJo6vSvyh?=
 =?us-ascii?Q?4jhQDz+Fc6lOcg0b8Pf7Wduvx2UY4qJL0f6e9jTFHd2xcBAcvITQvmXIage5?=
 =?us-ascii?Q?rbmnNccuyXTVBrpcS9PSR6REm+8R7UeuycUu5J2zH+8rNnNP35eNX5URXt2J?=
 =?us-ascii?Q?H0fglS/GkzT10aisKtYeVBhDYcW8GYury9AIO/GJZ1lEEbXQiqA951i9hp2l?=
 =?us-ascii?Q?MqJAPvJkHUgwLf1/Y8fN3AsHXTfIFwlLDHKP2Y++A3RyMQtbvX2i3OgsfkqS?=
 =?us-ascii?Q?/TKm+XD7zh9gIjJGece/AqR392R8VgKCFIBqcfqOy654ucqpQNVBk9sqPbql?=
 =?us-ascii?Q?CmKY78g4SSAGlrszKYE1t7sJxdxLOtuuOzObCd/bDMSJekW+IsBSy8nJl7fg?=
 =?us-ascii?Q?5uwjnjj4wHbSc43daK3n5gmv7ogYCdZmIklAAAUm7VBSSX3ct0S/JMQRCINg?=
 =?us-ascii?Q?LBKm/JCJmDAumFFQkmdletj0B5PHjPY/IVJ/tmn4N1MokbMvspD/sAOJ2OS0?=
 =?us-ascii?Q?aSM/FpCuY6UDhxh+dl1DcKHeJdF4afqc+dhHo6pnRODAf8pRevpbtynEjLk3?=
 =?us-ascii?Q?xI5e9u8+05rNLoG+yrADGgz0MTdkVZJfYv62cuzaBF1r805kv20YsYYArmi4?=
 =?us-ascii?Q?e5goHxIwyM7pMzVy1qYhgoXex6iVNWC+FsH6r/99xfI1nepRrn2SNU8L4jFo?=
 =?us-ascii?Q?WNQs9Yv20DwQ/f8j9Zi0IbxBv4ULJdMYqF9MwqIElbiFWSqjIowS9Sp0U+/R?=
 =?us-ascii?Q?5fwMtubRcq93EBELa28hFCe31oRhPheesKk4h4LJLMWFD5TmDva6o9HBPeXu?=
 =?us-ascii?Q?PuVqw9ySSVwrFCzqEFupLqiEpkjzPfNR8Q83nkQpIkcbsVKZaf/6ohDwpTxH?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af6a1a6-b108-43ce-3bc9-08dc6850aefa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 13:31:32.4098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qd4HKvFZdq1qscpi5q3cbDcFTGHFbOoXxEiIJEThFFeTKBSqYtYyTaI3B4jyRlL6XBt8EqbdD/mkU17nJ11G1b6y3hiFSo/CMhgGpA7vwe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
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

On Mon, Apr 29, 2024 at 12:06:40PM GMT, Jani Nikula wrote:
>On Fri, 26 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Group together the commands that operate with a reg spec and annotate
>> those that will implicitly enable a future --decode option.
>
>The series LGTM,
>
>Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
>Please follow-up with an update to man/intel_reg.rst.

TIL we have a man pages :-o

thanks
Lucas De Marchi
