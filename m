Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51590E66882
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 18:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0159210F077;
	Fri, 19 Dec 2025 18:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="laGXjwyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C05C10F05F
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 18:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766170656; x=1797706656;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=78e+GsIbq9hNIHwHAMhy1S05jtPGEF1WT9+BdkNW+FU=;
 b=laGXjwyDYGeaU1yqCiucIrezELiE50wENXH/ZPxN1kICUNDXziMDUeIl
 V/ChXzb4k1cHPsrhtHtvsozSZkIei9/yh7VXN+Wg8Zx5JT3To0SayzCrN
 6KtwsPedXNybuxuwjmjMaRxwqil2Pn61D9qzyQ1WwoMIjCXC8W+9QVXCr
 PEGQCpE+lIc1KTZs871DLRgak8MA4TbmKZiGXPhqRzNEmTGgCWE+TZOK9
 5F1dfOnUiMSDj6J7G49IsSAnAm1pIsS9yUWWx47OzSBs7k9sIrhJQs8JG
 EF8jCaKiNaxtgheVpsu8h69BKBAE2Y3WQLtZ9sXLZljRQ4deE9w6XJ3MY A==;
X-CSE-ConnectionGUID: E+51sWOiTqmlbIssoEvDPA==
X-CSE-MsgGUID: 7KaqVf43Sbu2tPfmLwcYrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68028762"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68028762"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:57:35 -0800
X-CSE-ConnectionGUID: h+RcpHpvQCGzAMkwVO4f6Q==
X-CSE-MsgGUID: y4mqoLyEQCy8FRdHjrig0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198087292"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:57:35 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 10:57:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 10:57:34 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 10:57:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2lRoZpgMmcMPtHBzyCoQQeQyEWBFj7q73K9JE1Gw3AYe8iU8Xj1GZK6n5Zt3DyLRD7KB0F9ZMyBZFTR4bc0LpGoaiXUbd4zutp6LcagQWXgCi53WsQN01z2OtpuSh2EC4sjw/esaqVENVjWu2oSG0mUiaOTV7TjacqwQeFJXT6TfYIJlYXVdmOiAbRSS8fd9K8myVSqLBpFyq9zPz46kSR79g1CY7hZ5sntlfGE6gbI4J90B7f5K2jcDdgN+V5cKUdFGwGEpKyPjbItFk7q+hIXLOgp9fkRimx6UJuuG6kqoMPtasv+JkBGhdyoJ0Z4OzX37ZKUO/le3uNbq8e7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI/x/pX9dT1nArM+EqXP8LdYph2FXn0cD6Qpy0u2eV8=;
 b=MZGGIHXoWVmrpoWam4LP8gO6/aXqzrFgy4wrbJ0zvR/st2NuFZSMUhUEy25x3S+MS82cVdTbOi5Rzexb/g/YZhH0yejoPu/Ka6F7CqCm6WU00FHnRY+63XDMIrxRNcmJ3XKiOQ2wKNHQhBkpV1ZVNBQTjyBhqjRoLncSbHppz7pbwHApwfYQHOZm8Wm/wMsXBPIcvAlxxV1JLWjUD+UAN4w8zM4DzJxLSFn23a43vXXZZ7gq5+VxoJIJuULTsxmpfbxwtM1u30RglXub+a18mnpiEKPr0BKD8xw0oJnAKpoF8RkE6cP+ktGt3B6CTfsitfzUnnjdEiBv6AVMoJYNHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 18:57:32 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 18:57:31 +0000
Message-ID: <cc7ef2b9-8914-4fea-a19a-64ffa7a6aeea@intel.com>
Date: Fri, 19 Dec 2025 10:57:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] lib/intel_pat: read Xe PAT config from debugfs
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>,
 <alex.zuo@intel.com>, <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20251217080732.266257-1-x.wang@intel.com>
 <20251217080732.266257-2-x.wang@intel.com>
 <20251217191535.GB1180203@mdroper-desk1.amr.corp.intel.com>
 <ec15d0f9-149b-45fb-b499-420d76f1f258@intel.com>
 <20251218222708.GM4164497@mdroper-desk1.amr.corp.intel.com>
 <14157c03-f8e5-4023-84ec-0edac1e67007@intel.com>
 <nhddiyaknjfhybzec4jgenlztl6am3s5bojizjolk5qvvhzrdh@wcqh247atlry>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <nhddiyaknjfhybzec4jgenlztl6am3s5bojizjolk5qvvhzrdh@wcqh247atlry>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|CO1PR11MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: 7126c168-c087-49a9-3977-08de3f3076c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFh1MFBQL0lJUk1VZFdlQUVkOFFmTWt4UzBwMVJYWEI0UVpYSHVIUFdpc3ZO?=
 =?utf-8?B?MjFia1ZIbk80Z0FIbWl5bTJzMWR0c1FHeklDNmMrS05DbFpDbWoyT2ZhTnFI?=
 =?utf-8?B?c3d3eURTY2hDMHlNMHNlMC96K1NweW53N0pSV1ZyTUcxWlFuekhhczhOQkpR?=
 =?utf-8?B?WGRNVVk1WHZXVE9jMDNCM3NkSlVndDZ3ZFJDZ0NXTmZ4VStTOWorTDE0TkRY?=
 =?utf-8?B?R1hDc2s1dWliK1Z0dTVhR0xFR1FyRVdBa0VzZzk0NHdPeXFPdTJvV2trdWxS?=
 =?utf-8?B?WEx4TE9Jc1ZlL3J1c1MxOHpKWGsyOHg2M3M1TGJFT2hqWWhJRmdhUXVTcnZq?=
 =?utf-8?B?NEJXVzBtb1dObDZBK3JaQkxvcHpaelROUlJpQURiVEk3MGd5d05FTXE5YmFi?=
 =?utf-8?B?WjJEYjhqblhpS01lWXF6T3RJYi9kLzFFRTFmcUwrOFJjditvbEgzU1RvNXVU?=
 =?utf-8?B?MTRHRlVOc2RBNlRUYzk1MVJVdk42VlVBWk1vYUJuTzNOVW5VYW5oRmZjeWxq?=
 =?utf-8?B?WmJLU0hlbmJ5RXBnN2puQ1g1VFBiTTg1eUU0aS9VWWJxeDZ1L0ZlbnM4ajYw?=
 =?utf-8?B?K3dxUW9GNXY5MWdMQXVWNXdnVkZYMG0yMit0SHdueVU1aGRkWDhvcnhRNXQ5?=
 =?utf-8?B?U3JRdmgwYlNyRWxhUUtpQlFuZGZIa1U5dVBzcy9JV0xPVC9lY2MzeVVRSHFV?=
 =?utf-8?B?QUZRUUhpRE5XeVJxdHhITnVqNUJDZVppekVOaEJJejFpYTZCTzZMZ0ltUlVT?=
 =?utf-8?B?QkU0VWZzTkRzQzkzVk4walJFTXExR2U4S29XMUkwRlpsdGtOaHZ1VXpPZlNt?=
 =?utf-8?B?aTFzSUtpb2YyQy80Y3dtaGtZbHJveWMzSGNrZ0RlZjdHREthVTJTWHpaVU5D?=
 =?utf-8?B?Z3JmcWJnNDVCS0YwSEdKTzNRSzgvU1NZY0J1aHVWZHBqVWRlZjlMcWxOSFJU?=
 =?utf-8?B?MitFREpZRHJ2RUhZT0szUWdsUm9aOENjUVRJenNKS3hPdXRqY0hVb3JSdlg5?=
 =?utf-8?B?Q0psVm5KUkJTT0lQVlZlbllETitoSEdrbGRZRElXME52dW52L3pLN3lrZmZh?=
 =?utf-8?B?Y2JnRm8vbVNxYVk3NjhPR1Y1YlBnWVJGbFlmL0JGUnZjakZXbm4rV1Y1TTR1?=
 =?utf-8?B?TkxyNy8rVHhjNXZLMGhqcVV1K2pVOVdPVXB6Nlp5VW5odFcrQ2hrWmMycHVC?=
 =?utf-8?B?RUlXMUcvY1p6VitYNTQ2bGsxbEdnVkt3R0RkWjJGRkdLQzc5QW5NNGhJMTFK?=
 =?utf-8?B?ZjRTMGhuK0xCQXZIMXBqT1lwUVI0ZEk1RkU4eDE3ak1XbUZ1QlRIYW1wQnNt?=
 =?utf-8?B?ZzAyVW9DQkUxcjBIcTFYVmtjQzRqU3pVTktYOXpiTEU4SzltOGtUSWFzRFo3?=
 =?utf-8?B?TWFYVDZtb0ZYblBZWXF0aEhVNnRFQVNMb1cvTFJUSks4Vm5tRkNHR2ZENzY4?=
 =?utf-8?B?aUtnZVVLQ00vUTl1UEkvRnRQOWhLK1RmWVA3eTYxR2ZwanhkUktCdThNZXF3?=
 =?utf-8?B?RngveFV4NzMvRW01YTdiMHV6RS8yMlZLbFBjSnZYbkpCbFFCVVVjZ1pYNlZX?=
 =?utf-8?B?aGJ5eUZ1bGgzdEcya3l0ZU9Cc0JqNXdNb0Ewd21LYldDMDJaVi9OcGhFUFVZ?=
 =?utf-8?B?TVU2MC9Zb3VUa1A4VVFROUFFeDF3elI5WEZyWDlmZjNTQWY1NyttYjgwYUdR?=
 =?utf-8?B?ejhDYzlKMjdjTGJTaGpMRmRBbGZnZ3dvTVN1cnZZUlZwcXcxTFc3UGo5WkdF?=
 =?utf-8?B?VzZPaWs4ZjJoenBHcmE0RjNQblY0RC9xQTdKMktlOVM5NEJRdldTeHNEWmRD?=
 =?utf-8?B?c0J0NXp2bFJOMCtzbWZwY0pDd1JIRzVLSElrTklESTBpWGdsb3VpeC9CelNq?=
 =?utf-8?B?b0E1bDRLcHpQNTRVK3BnUE5QdkN1RHNqQzVZVjBrL1hqRERBVi9YOWU2ejlz?=
 =?utf-8?Q?KqFPKOj0rbwuzirL1VPynAMTZzxqaMQL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0c2WG1udVBhL3h4OVZQdFVjT2FvcFdMQWJoMEh5dUd6YUFEMFZxTlZhRHZ0?=
 =?utf-8?B?c1h4UkFEd05LRTVldmV0alltaDFlQXlEM3lUMGZZTzRaaDdEVno1TEJQZjly?=
 =?utf-8?B?TjY0RmJFME1aZ1FnYlBuZWhpSmhyVTljUzMzcGV2a2s3cit2ZVhyaXhKdldh?=
 =?utf-8?B?UVZaUm1Dd0FkL2VQWlJvd2VaZy91QWlkUE83ZG5PVDVOZVlTNFhKZGRqWjd0?=
 =?utf-8?B?RkVmWTQwc2lvaUk0aDZNL2YraldwTGlZMVFlNUxwYWxLNXh0REkwdUhxa2Zw?=
 =?utf-8?B?TDhEcDZkdHRUL2RMWDA4Y1BvN1lxak9zRjRYd3ltUnhvS0FtSGQ1SmwzcXJN?=
 =?utf-8?B?Y2V2WHFaRVFpZDA4MGtLV2drLzdSWEIxdkExVHdNY1lCZ2FoK1hRZ1FzVHlw?=
 =?utf-8?B?N3ZZMUdqQjVXSVVpVi9zViszU1p3emhRbEVBL3BPcnNSTHdwZUlEcXVlb2dO?=
 =?utf-8?B?REtuQlRJWndXME42ZDJYVDVMeFcrbEorN2huY2FGN0R6c3VqWCtHVEVLOGMr?=
 =?utf-8?B?dzRxR3NmRkhiV2xmWnRlZElPUmw1d08zYzJQSjUzVmdjMFlEc01SUkQ1a2sv?=
 =?utf-8?B?eTRneVlFYjdPeGNUSURiU0lMdkxzSWl1RG1QTFQ4YUxJa3JVME8wWFBlMVVL?=
 =?utf-8?B?NGd4dU9aeEtrUXRnSTI3aHo1UjFuZXUvMUQvWXZCSVFyRDJPb1RtbHNoL29L?=
 =?utf-8?B?ZjhIRVdkZjNDRzBUaGNzekM1LzVjLy9OZkpMZHI2NUpJbnhMamw3RUQwYS9h?=
 =?utf-8?B?cDZrWlYrR2NiaFpOdGZlUktzRXRuOENRVXM1bWZrTWxybGRTd0QvUmJPYUVv?=
 =?utf-8?B?TVJOb2RROFM5UWNnR0FCWFB3dDNZSUpKYkFsbGNvVTB0SVNnRFp3azZTc21r?=
 =?utf-8?B?R283RFBNQmZCL0thWXpveWhPSjNENUhyWEJ2NHp1VFhzeWwrK01TVlhCeUV3?=
 =?utf-8?B?QTB1L0ZPRml4UWM1TGtjM0Fqa29zTHcrdGVWTjhUV0t5TkJQc280Ym80dW1H?=
 =?utf-8?B?RXE1N0ZvZFJLdXM5RE55QnU1a3RaQjJDbEJQbm9qeVozWWdiZ3RpWnlzbE1i?=
 =?utf-8?B?a3lWNEZvb3N2eEZjS3EveUc1V2M5OEVGU3k0SG96bzBtdlU2YW40NC9kSVg3?=
 =?utf-8?B?ZXlrUUthWk5nWjNqaFk0djlUTHUyQ3p6dCtZdmozZGhyeEJGMTJMdm83SUUw?=
 =?utf-8?B?V0ZkL2E0Qno5aG40aWlEejFvc0prREZLRnFtR0hCL045eUhEeFdpRXEralZx?=
 =?utf-8?B?SzBTOC9kR0xxRUo1WTQ4WnVqbjdJUmdrSi90ZnB6S3NoMC8zeXI0S05DQm1J?=
 =?utf-8?B?ZjAzTkpwUkVVamVkZ29OY2NKNExrb0tZWVlHektRcmxmYlZHRTVad2JwL250?=
 =?utf-8?B?dHBQVzRSNHdBU2VQYkhNbnZkSFZ0NmZ3cm10UUxVNEJJQkVkMmZ3UHptajla?=
 =?utf-8?B?c0l5WEJEbHU4Ulh5UGlNbVJzelQzU3oxSTNmeEpOOE5zbmpnVWliRmxIWkwv?=
 =?utf-8?B?NDBPZFFKYWI2NWRmaUR5eVR4UmttK0hzWFpHUmxFMEN6N1JmMUxCOS9MSFpM?=
 =?utf-8?B?QzhWRGJzSjhwdy9odmZRWGhEaVArZmZRc0x4RmNkeU14eVVsZVd3RzV1SEo0?=
 =?utf-8?B?NUVzUDlXbk1uQUFsbGpFSTIvUXJ3ZDFsVVQxeklERUcxK21iaGRLV1BDbzEz?=
 =?utf-8?B?Z2p2VW5zNm9XTEt4VEM5TUxjcjdjWFFYS1YxNXRkUm9BWEVRUWtBOE4rQkJC?=
 =?utf-8?B?WldMTlZXdkQySW03VVRrZGxhUkxYUllidjlqVmZxQVFjREE2VlJlaHp0QlBZ?=
 =?utf-8?B?R2ZPMk04czlzTlVLNmJRVDZYeExEd1NuYlpwTld2VlpEMTJ4Y1dJV3BVcTRJ?=
 =?utf-8?B?OVVCV2RRY05LdmJYcWNwbGp5VlljRjlSSWRHT2ZSTGcyZzhaYStzWGJRbVJi?=
 =?utf-8?B?MnpzVkxBZDRPbXVteFN3eFh5MVROU09hbTkrYXI2NGtKa0ZaNGYxUFkrdDcw?=
 =?utf-8?B?OWVCcy9mOW95QWxFS1UzTDhUYzYvNUc2V1llT0dTWmtmUjVvdEYwMjdkV3JV?=
 =?utf-8?B?YkZ5d25IckUwMHBGbUJaTjYzMjIxQStOalhIR0NHYnVKblZRUktLcENEZWNz?=
 =?utf-8?B?bVNCZS9ZMlE2UDVyK2VWTEdPclhkeWlaZmp5bnhSSFJ4M055NkF5ZWljL0tZ?=
 =?utf-8?B?WHB1czJMUFcrU3JHK3JQREx0K2V4aWtJcHJhSEhMNldtWDlNbkQxaEgyUVgx?=
 =?utf-8?B?M3k5LzNtWkNWOHl5R1BlRmxwTEhvM1RMNDRXZzNUYzBQaWpIT0svSE90U1Ir?=
 =?utf-8?Q?GpuJFbK7Dij5Qs0Wgh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7126c168-c087-49a9-3977-08de3f3076c1
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 18:57:31.8122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPi8VUgYlhab75qljvfRcpRddHie+t4o643dXfnkAuvewvagQi9hWFQ4q7cozbxzSREKu76VtuBPbef14i6kAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
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



On 12/19/2025 01:38, Zbigniew Kempczyński wrote:
> On Fri, Dec 19, 2025 at 12:18:00AM -0800, Wang, X wrote:
>
> <cut>
>
>> Thanks Matt — agreed that xe_device_get() should stay focused on ioctl-query
>> state, and debugfs is a test-only backchannel that shouldn't become a hard
>> dependency of generic device bring-up. The tricky part is that PAT is not
>> only consumed directly by tests. There are multiple library call paths that
>> end up calling intel_get_pat_idx_*() implicitly (e.g. VM bind defaults to
>> intel_get_pat_idx_wb(fd) when callers pass DEFAULT_PAT_INDEX, and similar
>> logic exists in other common helpers like bind/copy/blit/buf init). In those
>> cases, a test author may not have a clear place to "prefetch PAT before
>> dropping privileges," because the dependency is hidden behind the lib call
>> chain. Because of that, we still need a library-level "ensure PAT"
>> mechanism. Storing the parsed PAT table as per-fd state in struct xe_device
>> provides a single, consistent cache for all library users (and avoids
>> global/static caching, which is important for multi-GPU). So I think a
>> pragmatic approach is to try to prefetch pat_sw_config into xe_dev when
>> xe_device_get() is called. This makes PAT available before any privilege
>> drop and before any indirect lib call path. If PAT is still missing when
>> intel_get_pat_idx_*() is called, we can then igt_require_f() there since the
>> caller truly depends on it.
>>
>> Related lib call paths that can reach intel_get_pat_idx_*():
>>
>> lib/igt_draw.c		igt_draw_rect() -> intel_get_pat_idx_uc(fd)
>> lib/igt_fb.c		do_block_copy() -> intel_get_pat_idx_uc()
>> 			igt_fb_create_intel_buf -> intel_get_pat_idx_uc()
>> 			blitcopy() -> intel_get_pat_idx_uc()
>> 			
>> lib/intel_blt.c		blt_create_object() -> intel_get_pat_idx_uc_comp()
>> 	     blt_surface_get_flatccs_data() -> intel_get_pat_idx_uc_comp()
>>
>> lib/intel_bufops.c	intel_buf_init()
>> 			intel_buf_init_in_region()
>> 			intel_buf_init_using_handle_and_size()
>> 					    -> intel_get_pat_idx_uc_comp()
>> lib/xe/xe_util.c	xe_alloc_bind_ops() -> intel_get_pat_idx_wb()
>> lib/xe/xe_ioctl.c	___xe_vm_bind() -> intel_get_pat_idx_wb()
>> lib/xe/xe_legacy.c	xe_legacy_test_mode()->intel_get_pat_idx_uc_comp()
> You can call intel_get_pat_idx_*() family from non-root account, only
> what you need is a possibility to open drm fd. So getting device id
> and then returning predefined entries (uc/wt/wb/uc_comp) allows non-root
> to select necessary pat entry idx (pat tables are predefined and are not
> subject of change from time to time). Most of blitter code above will
> work even if you're not a root - with the exception of flatccs check
> in intel_blt (it tries to access debugfs path for the answer).
>
> So I think getting pat_sw_config() is nice addon which might be used
> by the tests which verify it, but for most of tests it is not required.
>
> --
> Zbigniew
Thanks for the review — I agree.

I’ll avoid making the common library path depend on debugfs, and I won’t
have xe_device_get() read pat_sw_config. Instead, debugfs parsing will be
kept test-only (used by the xe_pat test) to validate the kernel-exposed
PAT layout.

The trade-off is that this keeps a duplicated UC/WT/WB/UC_COMP PAT index
mapping (kernel vs IGT), which needs to be kept in sync as new platforms
and devids are added. Keeping the debugfs check in the test helps catch
drift early, without impacting unprivileged/common library paths.

Xin
>> Xin

