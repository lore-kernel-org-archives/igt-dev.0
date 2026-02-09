Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337BEE7C706
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A435689322;
	Mon,  9 Feb 2026 08:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJOzYzMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F0A89322
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770624884; x=1802160884;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fKYVogTpL/1Wz6MeFQlutqtgmCXligznLvggmPtL77Q=;
 b=fJOzYzMZ9T2/xp+aHzgzvuWdRvWpUH/85H/gLYLJZ0e598wIFjD+0528
 lU11xKImQmWK0bkRT9wjexQjQ7w4SfrgImzJtws2BYurJxv7Jmf8X+UBW
 RjM0/LY0yNk4tvDJUtXtcm1BdBk5ierQlYU5hZTnsekoKI+wXCnV4zCf2
 yOmBKOl7qqLL6Gr1FGpKBD5dZvdQ9i3s47GsVDrH1TUnesUiTFr8HRa2v
 y9SXH1V9RnE+8YX5OxMJeTEK0Y6DVOVV24EEOTch7XH8T6Eyk2faCSOEX
 xwlEKdxQEdClr3CpK9kRJRSlBgfiaAHqO96sNORyMKjapTrMHnad+zhh/ Q==;
X-CSE-ConnectionGUID: pvmN20mCSk6msggGDX97Pg==
X-CSE-MsgGUID: siVT9elWTxWTMUHqzc1ewg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71632769"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="71632769"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:14:43 -0800
X-CSE-ConnectionGUID: RbXZffS7TLerTkcjthScGw==
X-CSE-MsgGUID: deGNfop5Rt+iapjxNH43Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="210703734"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:14:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 00:14:43 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 00:14:43 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 00:14:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7zS+B1MFx2jlzOL4CJirpsjcINPqf6NyOQL407baQFcKy1gnYkpVCwHqj2sc9rWoj6KyLBj8sRCuSPpUhp21nxNO4OLFqOcEzGBoR/PF+6NVnm2MitbjgSMvsgFIMDN7qRqdw7dY/BompNZKD30axZbeVPJdPgpjIlWTBibueOH0uCtpSLVGodvL005t/AgcpL9PApCq0dnF1SRLjYNO7wInAqD0PsOv2Fwros/A+b0mHS+TJGiLeWT6w8T8LSk/OWOBEa3Gd+P6k/cfzg1kv5BJBMSYFba0RKTqcvShFuxEPSCPSO92qrZ+sCkd1qnnGkD4gMa1Pg8KdcaeEsrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3C8NY3Is3QPJg566u9oiGDYLJkopA4rDpnDo1bJlM7Y=;
 b=dEUjD1VSA4xXsSWLx6R1Opj0hqGF/iaU1v1OrQhmeGgjwBounY4ldRIv4c0VXhhefA+ll7pOg8K3g9RXpeasO07MjxXxPlggfmiLSE4Vslzq7S+kMowqeLkL8LScS1BLKixq5NAEr94tdMXa4hW+EsAhE0108jZq/ss6nR8hVpOLh+awJk9acIpzms3k8qadTgMMCMwUcz+7daH9y3sWfmvvDRfJjqWDkJk9GwZakw+zrZnKzYkuEa+ZPiMk8BPX5c41hHtVAVRAVZdaMtfuWQ/MV4TuSHYMma50R5efEQeKzHKSOMmoKGko1cUP897LpuY4KWKVJoP6zzAukBGdgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 08:14:39 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 08:14:39 +0000
Message-ID: <edac5f23-8a49-4594-adeb-367ace502dbf@intel.com>
Date: Mon, 9 Feb 2026 13:44:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 0/9] Add writeback changes for intel-supported
 formats
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <suraj.kandpal@intel.com>
References: <20260204171819.292327-1-sowmiya.s@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260204171819.292327-1-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0128.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd6347c-ce77-4e9f-2f96-08de67b34523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2s0Wmc5bU85VE5POHREdlI3S1N0TU5WaTU5SUxFZkhibUpZZFFlck5vOHFp?=
 =?utf-8?B?K3hVaEp1REVXNDVCaWcvTytVUDU1NDREd3dRdmdXaUg4NnllelMrU1RsM1c4?=
 =?utf-8?B?OG00eWVDT2pFS0lIUVpxWTBkWWoxOUxmNVRGT0o5QmlrSitRKzMrQUFhMVNt?=
 =?utf-8?B?THUvbDhabWdra3dTZ0VEVGkvYkJxQWRBU1ZiQ2ttT21Zb0daSEZQaG5rS1dY?=
 =?utf-8?B?TFF3cFhFc2doWjRNQ1dTZXBUQVhvckZSQXZEd01IYm1tL2wrVWJRc0RlUWxo?=
 =?utf-8?B?SW1KNDY4dHN3ZnN6dGdub21GV3dlSUM1YjE4YXM0Y0hNQTNyRXhOZ2hneWVl?=
 =?utf-8?B?bEtYSUNxQWtlM2xJclE4YkF4Nmxrbmkyblo2ekloS1k2eHl4ZXBUdDc5TmJp?=
 =?utf-8?B?dzNCQ0xHOE92Y0EraXYxVjRUMHBQdVFGUnk3Qjk2NWgyUzlxbi9UTE1MMnM1?=
 =?utf-8?B?RjdlZ0ZRNzZhVytEdTJ1M0JMVnZNUHpaeTBkN1pnNHJsWkEyTE1oSFBpMURt?=
 =?utf-8?B?VDVIandJN0NsczZVMklJaml1bWdwdU56Z2NZZ3dsOFBxeGYwR2ZyY1c3eEZs?=
 =?utf-8?B?UFBwMUFzdnFVeEJ1c3hXZ212VUhMWmh3bU1oME95ZHR0amZEU1ZBZ0ErVTQ4?=
 =?utf-8?B?Q3VTdkcyZXhEUXlwUHllMTVWUjA0QUJWZmJVWG9MYS85Sm5zb1ErUm54V0w0?=
 =?utf-8?B?dENraFpCOXBuNkZjSEJyVU9uRWVDS3pPRWxEaWtQWVBKWlZlSXF1ZEVaUFY5?=
 =?utf-8?B?T1VvQzVJUHlUMiszVy9VUzE4OEovSzJXSDViR0IyNExDeHlmUDNuV2gvN0Jp?=
 =?utf-8?B?UERLdTA5ZURaSWNnbjFteUVwc1Z4NDhFWEZwaFhCeGVOekNyb0RZRm1JYS92?=
 =?utf-8?B?MFY5S2xxd095VU9PaTlPcytlMWtaRzF4eXpqalVuTWF2RDFHbWJOZVhBSUVx?=
 =?utf-8?B?cGRYUitwWDI4OHk1MUZuNjlNOHQ0ODRLQVFsWk9zZTNwYkYrMGU3QlJUZnhD?=
 =?utf-8?B?U3hUZkNoUWdBV083TjRTWjBNL3lJaVMweUZSemlmQ2wrelN5Q0pSelhSc2R3?=
 =?utf-8?B?WCtEYVRHN1lSNHhTcVFJZCtLck1UVWFnQ3MzeWNQN0VaclVoVTNnMDBpbVZk?=
 =?utf-8?B?Y3hUaDRiM05kVjJySGdqdlFBNG9VU3BFaWZlNGdIM2dOTWJnbG9nR0pqV0tZ?=
 =?utf-8?B?bnFycDY0aFgrMzdLazUybTgwTm8yMWlxMnVKa1BMT21NM2hYOTZhVXZTNjlp?=
 =?utf-8?B?dVRQMDd6UUZIZFhTVkZiSnNoR0RVTm1GUkF3WTFnK0ZqUGtWVGQyZUhaSVRM?=
 =?utf-8?B?M01IMGZGcXFyS0podE55VTIzNTJtWDVuTjIzcjVtVVFhN0EwYzM1ekwxbmpY?=
 =?utf-8?B?OS9nTWNGd3cxd3d5QzFUSzhaTUJnQ01wZUk1VGx6K2dMODFDd0IyRVBGZGVx?=
 =?utf-8?B?ZTFMWkJNZ1VGeW1nYS9nVklWdTk4c0lGUjlTUys3cVVsVVZkZ29YdnV4NDVi?=
 =?utf-8?B?Rk9ubzR3WUgrbHpSZk5xaWY1TnIweFVJUXhZQVZpZ0tydStLazhnVFJ1Z0Jx?=
 =?utf-8?B?STRMS1IyclBZZkVDSldGczVkWG80WGd0aDMwZzVNc3JtaklqWDdIVjdTeXAr?=
 =?utf-8?B?NWhDSzJwcFcxWDRlKzFsZGlKTzhjd1ZUTnZPZU9FOTJ3U0prWUxqWDhwZ05T?=
 =?utf-8?B?RTFSUEwwV3oxY2lPZUs4RXlIK3lrVzVUU0hsQXB4K2JKRDJpVThvWEUrZUls?=
 =?utf-8?B?R2NheXllRXFERFNpOUZzQmNvL1BZNGlEd0JpYUI1cXZCUis4MXJEVzN1aHhp?=
 =?utf-8?B?OU9SSDQ4WXMxcVhCMTlXUUtURVI0SHFPRytDbzlHNzlHTGduNUhFeUQzalA2?=
 =?utf-8?B?RzBqT2RaanVXanhVYWZVbDVUY25FRHJlK3Y3czBHVHlFOU1LOFhnV2hUM3ZR?=
 =?utf-8?B?QVlvV3p0VktYb1ZpNkNoQU0xakZPWFZCU1FJbFAwWTVFTHpVWi9HMEU0Qjdh?=
 =?utf-8?B?cGppU0tXdzRzbW9NUjhiazM5YjBmR2xSNDR5YnBXRmgwZmxacFg4bkRCZHB0?=
 =?utf-8?B?RmRpWVZES2E3NlJhT2RNa05GNHQyV3NsSDA2NGNuZTVKLzdEaGdEOFNwWkRt?=
 =?utf-8?Q?Us/c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2tTOE05SHMwRGlhZFY4UFFmaVRrMk10UXZSYUNaeWcxZWhBeG5JVG81bjhZ?=
 =?utf-8?B?c01JQ3BOTlhhZERTT0JPSXhtQ0NHTDRKZ3c5bzQ4L2ZGMzI2ejVMcU9aVmtF?=
 =?utf-8?B?N3p1YnlXNEZOY1puTmVTZi9nZUNDeEdDNWFCSFh6b0ZoU2tYUHNpS0Z0T2Nq?=
 =?utf-8?B?U0NvbTZ1TjIzUjlaY3k2NERROGJoUXM1aEg0YWxCMEQza2pEcTBtcEZxRGt4?=
 =?utf-8?B?MkMxQmcwWGtTYjVKdjVoTklLNXVzM3Z3UCtFWTZ4WG1BckVuajl6Wk96L1hX?=
 =?utf-8?B?RXpqTXQ5dGJUeWx0TSs0Zk14bi8wWTVDZC9sUy9ySytKOTVRbDY0ZGVhb3R2?=
 =?utf-8?B?V3NRNDEvTHhHSVJZTFdJSElkWEthR29za1hkQ2VZQm40eHdzcTg5dTg2WllZ?=
 =?utf-8?B?bWtzSzQ4SHk3WWJxNHJBdmpwTitzV1JnU0pxUVVmRG5nTzlmaVFqRk9oSnBO?=
 =?utf-8?B?K3FDSldvVzM0MHZnWXZNdlRwSjFxVTFtMmJiNlNOL2ZvRE1zMHk3b0VaRmho?=
 =?utf-8?B?S01DQmQzckJNWmQrdnNKZ3hSTjIxVGZuSjVhcDBwNFQxV3RxdkxsaEpURDVM?=
 =?utf-8?B?MGpYUVpibEVhTjhwWEVsNWsrOXV1UkU3THNYWGZzUnMySjk1VnFDbkF5eE83?=
 =?utf-8?B?bS94ZXl3dDAvOXpnYVlDVHMrMjhwemFrNGtaTU1uNEZnaGk2bURJcFQ1bERV?=
 =?utf-8?B?VWtjSzk3aHF5TG9pT2RjT1libjM2UEZ2ZjdqVHplTDJ4MUxMa29jeEdRZ2VV?=
 =?utf-8?B?TnhKK2xkOTRyaTk2bUN2WDk2bjRZV0wyNnFSYjJ1UGVPeEJ6YzdUVkZHWjg5?=
 =?utf-8?B?cVZrMSthQ09STFI4Zkh3Y1lFVUlTZ0ZZZnA2VnlyN1JjbkhCY3lLUHVzRXhX?=
 =?utf-8?B?Y3dJcE8vOVZYKzRvRjR4NjM4aEk0RTQ5MHd4bFB2K1ZJVVdueEpBZ3B6SVcx?=
 =?utf-8?B?dHk5K1ZtcVBRbEZoMEdaMVh6SW51OFBxNXlQS2ZPU0tZQjNiYTNPc3Y2MDRj?=
 =?utf-8?B?enNMdFVEMVQ1Z2t5K3pSRjA1dUZrRWJ3QjhFVFZmWU1Rc3BrV0poZXdIV3Ju?=
 =?utf-8?B?MGNQbURET2NiU3ZpVkgrMHB3OG1KbjZoRGNiVzJNQkE4QzdzOFZlVEwyOU4v?=
 =?utf-8?B?YXovU0l1bWpra1FPbXZWRHZpYy9IV3ZIQ2pDTXhPdFdMSUdIRWI4N3FLSjds?=
 =?utf-8?B?MDRyRDkraTNiLzBrWkhNaDVsTGc4UFluYjBmdzU2VUZGaVVJQWNJRkJ3YlhC?=
 =?utf-8?B?YWZxS3hIYmorRTJJKzZlSjJXRFAzUHNUTitpaUZnL1VaOG9MRXA0dWFEV1pF?=
 =?utf-8?B?RDl5bWN1VkdZeHo2d1FtL3VSVy9FdlhaSzNZWVdmN1dGWHU0RFl0WUNyQ0xn?=
 =?utf-8?B?c2pRWjF3VVo3ZHZsallDSnZPSDVZWDNUZW1OTHM2ZU9sbW56VVZTS2FXNDZH?=
 =?utf-8?B?Y0ZqMUJveEhzTWgyMmRDRkZJYjVHWHdIV21HblVITTJaaVM3aXA1RmlSN2dV?=
 =?utf-8?B?bjd0UzJ5clFnZDVLbnE1K1hwejJYbld6dzU0TmQ4Q3l0b0E1S1JoR0xOVmFY?=
 =?utf-8?B?Z283U0ZNazlMdGxVeVJjcURKZm9yaXJBdkZOa0JiTDZDWGNXOEx3aUdhQXEx?=
 =?utf-8?B?dWQwRHk0eHhKSHpkSnJFNGZVOUVIOTR2azhrWXdoMlNSVnltYWU1Zys3RlRz?=
 =?utf-8?B?YlhSaGw5NXdNMi9wUFhjZHhpY2pZUnJ6a2hNLzBSVllJYXpNaG9TcldVMGNO?=
 =?utf-8?B?U2FTakhyU3BieFlNYkU1MlA5MGd1aDRUSVErd3lpREwvMXdWUVFnNlp6TmI2?=
 =?utf-8?B?VkVROVpyMkFBcnRNSVRwaUFyK2VZVi9ZRmI3SFowUHhmcVdLRWZQVEhDM0JN?=
 =?utf-8?B?Y292ZFJsRHJQUVBnOExpS0p6U3FGSThEUkxzdjZPWFZGMEpvVVEyYzFWOXoz?=
 =?utf-8?B?S01KRnduOXpjMG56S0RyVGljeEt6dkFHaVR5SE9JTDVoL3huWFlSUkQzbERB?=
 =?utf-8?B?RWlkelQ2cXczbDVJZEk2YzM4WlE5Q09Ib0pvZUVjTlVMWTBYUmhQYTkzSER1?=
 =?utf-8?B?N0pPSmlsME5jT2Z3bHpCNHoyeVd3cVVzTStjeGVyVG5FanRMT3JRU0gwWXdV?=
 =?utf-8?B?SGhlb0puZGwzcjg0c3FtTnJrTzlSTXdDZWJKZDdUTGdJbS8zTlYrSGN3NDVU?=
 =?utf-8?B?OUpOMWVHa3lDMmFuNFRCZWdCSFFPYktuOWZIUVdKaU0rNmR1RGNjb3ZlUGIv?=
 =?utf-8?B?QW5YWWVmeDNoanNxbEZseSs0K20wRTRDdzc2NEhZZmFtV0ZUdkRZblh4aG5K?=
 =?utf-8?B?U3JVNkRpUW1RT0plUGNHRUhSWDc1aFhmZHpVbGppem9BSk9LaEF2UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd6347c-ce77-4e9f-2f96-08de67b34523
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 08:14:39.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlfZ/Dt5SjG6VK/9KzkEY8G7dgV8ScdGzZV7cizXsVvL1J0fdJbR7r0890pmVAMVIz9h+HUSrz0d9ethYaq7yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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

Hi Sowmiya,

Could you please add a patch in this series to unblocklist kms_writeback 
on CI, so that we get the results for this subtest before merging this 
series.

Thanks and Regards,
Karthik.B.S

On 2/4/2026 10:48 PM, Sowmiya S wrote:
> This series introduces validation for writeback functionality
> across newly supported formats specific to Intel platforms.
> existing functions with limited format support were retained
> for compatibility. After validating new formats introduced by
> the platform, additional format support was added to the
> writeback test suite. Subtests leveraging common framebuffer
> creation logic were consolidated and dynamic subtest generation
> was implemented to efficiently handle format-specific variations.
> Add negative test cases to validate format and mode.Refactored
> existing test cases to improve efficiency.Add helper function
> to get the default format.
>
>   lib/igt_fb.c          |  39 +++++++-
>   lib/igt_fb.h          |   1 +
>   tests/kms_writeback.c | 211 +++++++++++++++++++++++++-----------------
>   3 files changed, 162 insertions(+), 89 deletions(-)
>
