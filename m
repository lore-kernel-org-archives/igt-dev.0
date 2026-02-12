Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AB1EEA84E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 20:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B58610E1C9;
	Thu, 12 Feb 2026 20:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7oCbtz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2345910E1C9
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770929937; x=1802465937;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/3eY76wKUso7dKG0rNeivhTNb/J3qDzDjd96gky7XAc=;
 b=f7oCbtz0Mro2gC4BNJAVJpZYCfQ/LiDMoR861a0vNirxOGxZB9aQWifz
 IebY9RtoN3M+OVX+XWaEmAHexSGxi8l4bBAtXn5G57+8ESiDTYr4ji1jY
 grqUashdvPfqn74AY4EJ3LrVAI68WWxItf3IXjEJVcKgRw3mtV2e+13oC
 cNndEQCmd43b6x/Ixfq5ug1CvsTNp6lPEuQPXi4YNYplv/E08Go+sC8AT
 yjb1LgD7IQCj8cCU4a/nkoyQSh7ijs4itu71YGljSsic8IlEAzrY9HKzS
 f6uV4TllPCwMnR5UxKNoqCcT4fT1AlHV0RH8A9DOJCKWGJtR4N4Vtuh13 g==;
X-CSE-ConnectionGUID: D27iaWdlTaKPouW5Gi+FvQ==
X-CSE-MsgGUID: JWS5l2OmRAmcmWLJdlI4hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="74717368"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="74717368"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:58:57 -0800
X-CSE-ConnectionGUID: GRVY9pvaRB6GwACm9GE05Q==
X-CSE-MsgGUID: P6vvtKD/TqmYVykdifFJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="235702257"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 12:58:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 12:58:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 12:58:56 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 12:58:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugvCTM2Ws/u/eBQM3N4hSJbzz63MmirL909bRKL/STcAXte+ddROBYwRnmehw5kod2//v40xTz8lwggusGLSBq6rs3tgK3QJAkG1PrKO+f/mBc1bXDj6j8k+sESir/oGD8bzYK61uC9NNqyNCf/nEEqEM04P8pdbdAVLmihk9J0JEF1dDFWnuE/LBzOyQYRNXDTt1Q2aDmN/Yt/4d2QXKr9eqYVxpht248XEP1uMYv+9GBFtbo2QMM+rKzpcpaFjZuqKss3q7Ht9l8PVIhs40Dz6tS4Pc4GTYhOW4glYWD3V1tk41yaIbaYyZjm4wGwWZZlmpai2l3UWYBqITVOVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlpjBgAC5QsurPz1ViR4UC0xahMwHKwkiaQ8beWkvRA=;
 b=pUwoFa7WCi6rA7mb1ueNUI5otam+oVzzwvFPS+KMYx47Uo2gE76Ufc8Qfwsu5kuWhzu/F2gjYF/VWDH0dZJM+I/GKb/IakTHlcvcTe0bGdhKnCL0KfzKylCWiAOp2JKiMIZwHYFnbFKuael4nuRALyfxQO72UmO1bfllkC3zg2J5IcwKu4EJvGm32gjBVZq3XUAtUbr2qGunyOMVs6g82cyc6Gu9WVhnorgcPTEj64abVIhz1k0ou5zLle7mJFU5L4n++9N0Iv2lwUmxxrMAcIbIZYxDFuVXkbWRWGBcu0rvsTsPqbXzK6ZUuhX1XLcveBYvJiL0ppdvz0oB+U6FeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 20:58:49 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 20:58:49 +0000
Message-ID: <9124955a-ded7-42a1-80cf-3e675e58a24a@intel.com>
Date: Fri, 13 Feb 2026 02:28:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/kms_color_pipeline: Disable pipe color
 properties in test setup
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
 <20260202060415.2680288-3-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260202060415.2680288-3-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::11) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b55c5c-6537-435e-fe67-08de6a7984a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEd1Q3VPYzM5WnBlcXVzaURBWVpRNEFuNjBwZDJwVCt3dnZiOURVQ1l4ZDhE?=
 =?utf-8?B?SURSUngyL1U2MjQyekE2czdJRDBSSHZkUkJpNVZXc3V3aDl2Q1p6YmtNWnkv?=
 =?utf-8?B?RndnSGNrMzVJTEtwY3ZkSmtMdHJoTzk1b0l4QVJucEZvMzJPNGczRFhGZVRB?=
 =?utf-8?B?T1ZqY3EyM05iTDVtU0pJNGU5a3RRYlV2bEpzMjVrRjV0eHluVDhnSDBmRjdZ?=
 =?utf-8?B?ZHhUTzRVMnpMTElTbElHVlFiSFduOVp4ZlhTQXV3SjlYU0F5cy9UbkxlbTlo?=
 =?utf-8?B?WUgyUkRoUm42QUxGQkhkSE5vYUlDajJCb1FjelN1Wi9Wck5PbGRYeS9ZaDZC?=
 =?utf-8?B?bEVpQ1ZEZ0NjbWhadUhtdkNLb241a0E1R3JyUzVYSnlRbld5Vk1VNzdLLzU3?=
 =?utf-8?B?c2dCL2dacHgzWHNqQXZlNzROZXQ1aUNKN0pjMFNpUGpibVlMdVZpcElucCt1?=
 =?utf-8?B?Z0N4VkFCcktISTlVb0hJYW5EVEdMb0xTTnFMcU5UcWl6QXE2TklYbmNCSlpP?=
 =?utf-8?B?NjVWZFViOWZwbmd4TE00VlBHVEdMUkI1V2c2cmlNZ3FwSXQ0ZXo0a2Z2TzVa?=
 =?utf-8?B?cFhyR3pzRXhQQnRMcWNYaHNUb1hEWXNBRGs3end0dnZnTVpEcktxZC9lYS9Z?=
 =?utf-8?B?cDkzRU5SZ0x5dTVaekFYSk12SmFlT1ppOFFWaWkreDlqNm9qeFZVc2ZneEtI?=
 =?utf-8?B?T2plUnBUVjc2ZjkvNlBrMitxbTdEc0lpVVB6amVzQURHTFJkOCszdi9BNHAy?=
 =?utf-8?B?NlF4TFpRcG8xNmZmclNJL1lncFU2NjFPK1ArdUFraXdITmFCb1Bac0FRUjVs?=
 =?utf-8?B?a0JKT2NzU25QU1dRaVhOZ1lQVzloUjY5NDEzKzZCRXRzb1ZxQzBjVDcvUlp3?=
 =?utf-8?B?ZjY0bzNucWVpSGNZWTFjRysxU3RQRE5QNjU3d2JHSDlZVkk4ODFBdzNqRGFw?=
 =?utf-8?B?NlpseXhveHZIOWtTMlZSSW9UMjBwUlhDZnhsWjBacmJzaDhwUWRKNXgzdFZ3?=
 =?utf-8?B?RTlydlhYNzB6MWJjNlZBSFN0cERpd3hlSy95MlZFTjlXN3JPelVCSlZrM05n?=
 =?utf-8?B?am9rTnRIVmdRdUN2eVppZkNkcnU5bmhEQndBQW9sRTl4NnJFQTZYNXo5MzNq?=
 =?utf-8?B?TGppRjhDbzdOT01Wby90SzFoMlI3aTE1ZW1BL3czVzlDcVJnMXpUVDlOa1pJ?=
 =?utf-8?B?Q0xsMTdYNzVRZW9sZTlNUFAycU84bWdkOElUckVNZWdLTTNkK0lkcDMzajA3?=
 =?utf-8?B?ZFNYL3E5ZmFKZ1lGb1d4RG5iWTRKcjg3enhJWjE5UkNlVmp6bGRFcFFPb1kw?=
 =?utf-8?B?SXFHYXg5S2lOWWxWbnVCREdrRDRXV0dpYVJSeGVWT2pmNXg0WE44NllVR0tQ?=
 =?utf-8?B?QkhiWmFnZVIyNzlMSjZ5RElMb1hJUEdEYmtaaDJJR0EwQlhOb0dPWnA4Q0Nw?=
 =?utf-8?B?NzhqZi9IazRmVFBoczdYM2xtU01ZeE1UYllKTS9CZW04cjRLQ1FnMzRzVk5Y?=
 =?utf-8?B?VVBVN3F1bitaSVI0RUJnMmgxRmRRUjhTc2Z5SFZ2WmN0L2V2UkE0UDFVTnA1?=
 =?utf-8?B?OTlTSFlLZTBvUmwyaEY5L3NaNW9pV0ZCMWhqeTFjTndRcG1iS0hNdk9lR2dj?=
 =?utf-8?B?YWV2WDBEUVRDaW5sKy9aYytJbk8rbkZvSWxXeDVENDFIMXBxbnpQOUpFcjFx?=
 =?utf-8?B?c3ZjaW0za2Y4NlphRzFDeXE5bE5UL3VVODV2ZXRsMlVaNEdJNlVHVDV3bit3?=
 =?utf-8?B?WmRUV1h3UlhMVG1xUGp6NWg3d2J3S1cyRThlSjBDS0c4OW16Umx6VlFmaDNK?=
 =?utf-8?B?bU04UnZLa2MvMURUcitjclN4dWpZenh2TkE3MGJ1cjJDRzJoVE9RN1RacEMz?=
 =?utf-8?B?YnJDMjJEc0VyY2pCcW5HeTVEbXZyMTlNcDJZVVRlSXNncGZIZ0J0aWtwdUhS?=
 =?utf-8?B?Wi92TVF5bndGNUVteHhBU3FuRVNPRy9uZEhTei9vRUFOWnNKSHpaeEhybUR0?=
 =?utf-8?B?empMaC8xMFNiYndjUzBoWEhWemRsS0IyQlZ3czQvQjNucmVYeGk1ejUvVFVL?=
 =?utf-8?B?ekVPVC9yWUxZaWhGYTRHSWFNc3pvZmJGZXk5eXdDbTlMTUpETGJzcGpWVHRO?=
 =?utf-8?Q?GHIQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHQwWUtmcVBIbUErb0xiNitmWTF6WW9YME53cGNJMk1zZW1obUpPb3pSajhC?=
 =?utf-8?B?V0tsZkU3R0hjeGZLeUpGcUZqT0czVjJpWnlXb0JGTVBQLzVaWHgrcm9GbU5L?=
 =?utf-8?B?VE8yU0NkUDlsd3ZrdGVRaUE5cS92Zm9UKzBNbDNRQlB1c0NLQ1hSbzduMG1J?=
 =?utf-8?B?Ukg0V09DSEVwNnJCMVFQRDZMZUkxL1ZxRTZudWRoRGdURldLcWNTd2h4c3cv?=
 =?utf-8?B?NG5iUXp5aHc1NGNwWkI1d0hZa29SNmhwdUlxaFlzVWpndWlDME5QZWZNZTJq?=
 =?utf-8?B?OFBBaW50Slk3aXdORFFUUkJrdTRxSDNKWW5kUTJySyszSFE1ODc0cmJZdGNY?=
 =?utf-8?B?bFB3U0Vhc2RCN3lMY0hZWjhuSUNoZlAra2JOZkI1cGF4NTcrZFd6cVhJd0dI?=
 =?utf-8?B?bzNLMHBDWm9pVW1nUUgwcG1PWkdyaU5DME1Nb3UwZ25LYmlWKzBjdkVReitw?=
 =?utf-8?B?dlJSb2lhVGUxZWlaT2c2T3FGandKaFRLRjIrKzJoUjdnNStCV2NhRjg5aTg2?=
 =?utf-8?B?bEZ0K0hMRWRHN3RGOGRGTWQybFErUDB2d1dqTVRwNXFJcFMxbUFGTUx6WWEr?=
 =?utf-8?B?ZkY1cktUZytZMDhGSVhnbFFROHFPYUZCTHIwcTdCSmZSVHFtODFSY0QrUTA5?=
 =?utf-8?B?RjZVSE9Vd3d3Q0gxRTNiZU9STjdDMnVhSDJ1NVBudTdWRHJDYkw0VDFuTVly?=
 =?utf-8?B?czlDT1I3Z25yVWg1aVZCbWtBMFZQSDRnbFNkWjR0cTZRUDdNVTZ0ZU41WmJW?=
 =?utf-8?B?MDgzOEV4TS9IVnc5eXZHc2htTDQzQ0lkQXkwMVJLY2ZNQ1NWZnhxbjNwbXdG?=
 =?utf-8?B?eTN2QW9JVC9ibnZQT0lydTJSb2l3Y2RaNUw2TjJEeUlOcnRJN3JaREdxbjIr?=
 =?utf-8?B?SUlCamVjUElqY0liMlY3UFBCS01UTll3SEI0dzhmQThMbGZ0dFJyUHcwYVo5?=
 =?utf-8?B?S3N4TmpqblNWWWJjWFNJcXFVWG1XeEJ1THFwT3o3eE9lYzVCTlZ0YmR2VmtQ?=
 =?utf-8?B?bTRlUFBBTmc2UTV3c1JFMUR6RGU2eGJFZHV0bzNsRGRGdVpiYVBTUnlTSGlL?=
 =?utf-8?B?ZXI3cVFXb1AzM1NMYlRhRFQxVzdIUFVHK0tWQmtmclV3d25RQ09TSk4wNVA3?=
 =?utf-8?B?U0VGVTZocW1PWk1mY25ZcnJyQkxwZHpvNEE0b21heDR4LzlZam12TDZGVndP?=
 =?utf-8?B?TGd2eW5YZjlnZEJ2M2dvR2lGQkhvSGpFcmNPSnozTmd0SXhVaWlyVkpTU3NQ?=
 =?utf-8?B?OE5xT1FuLy9seHp0d2xaY1l2SEpDMGtSaDdGM09CS3Rqb04xWHJTWDRjQ0VP?=
 =?utf-8?B?Y29PRGJ0eXYzUkhaNUs2T0xVNHY4dm8xdXVET2Zjbm0xbmpodkJFZnUyU0FN?=
 =?utf-8?B?cGZXQUF3Y3hDRHc1NzQ2eTZmdGNNbE11TVVqNHF5N2t2c3RxdmJkOE1mTUhT?=
 =?utf-8?B?YXY3cDludDJacTZ6cE1yR0Q5TVY0Ymw2ajA1Rmp6aWhvaExDREtCMVoxZjVY?=
 =?utf-8?B?TmQyZlNFdkUzU1lJVXAvSFZBcVBxWk8zL25oL0h1UGRBdU9wdHhRbFB6NUdp?=
 =?utf-8?B?QldVQjM0SGpTL3ZZZlV5SjF5dlJpY0NBMUwwN09TaGVIRGI2Z0dBM2NlYkoy?=
 =?utf-8?B?aDh1WlFoSWM4RGMrSnEwQllqOCt1aDZyaXZ4Zk9RanhjSmhpVG1XUCsvNzNU?=
 =?utf-8?B?WVBOMUJnNWdWU3BBQ1NWR2NZVlRJY05rWlZUOVAxVVdnTXk1a01rbjF3end0?=
 =?utf-8?B?ODczS0g2UXVqR1lhN3BVVHR6UEYrZ3RRWXFaZkNHTWs5RC83K1VTdUdvWEZ1?=
 =?utf-8?B?d2F5L2grUGROaXMzcFdSR2d5OG50a1d6c2JqNjFGbi8zU21LdWdLczNVZkNv?=
 =?utf-8?B?YXhjalNKZ1R1OVA3UWl1bW5NN09qZkVTbXlxY0pNblpWelJCZit5M1pqRWVN?=
 =?utf-8?B?NVI2RWlPMWNsbzBnY0l5NVV2c2F4SzhFei9Lc1krZVlWUXgrMjBWSzFnczNP?=
 =?utf-8?B?TjVZeWRnenkxdEJhRmt6Z1lsQUYwU2UrZFlSTVdhQkFQZU4vcjBweGx5c3pJ?=
 =?utf-8?B?dWxJMDMvTng5VUtVUWd1eTdlVHBBZU9FNEdnZ3ZkMjRoTkVQQWNQdXoxSkNy?=
 =?utf-8?B?bi9QQkZWU20zZHRnY3BIbjNFRTlIaC85YXNFWTkrN1FuWW5qR2pSNVZySDdT?=
 =?utf-8?B?S1Z3NUlxVnBmcUxrUUgzcU1OVWwrdmw0T3dZVzZOOEVSRm9ZSFVNOGJqTCs1?=
 =?utf-8?B?MExLZFc0V0djbzZQZGdPNzhmY1B6SlQ5S0liOWk2SXo5ZW9lMDZSSmtmYjFX?=
 =?utf-8?B?ZVhYS1VUNHdITDdFdzBOZmkzZ1YwRVIxSGpHNForeFRvdVpNQXd4QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b55c5c-6537-435e-fe67-08de6a7984a4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 20:58:49.0638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yplZgB/9gqNdENv89Y09QCqD2V89NO1WFfNJ58K9BebejbYljGgWwoL1H0klDUZ7IxAmQlzeDJGgDSXHsyyQDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
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

Hi Chaitanya,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 02-02-2026 11:34 am, Chaitanya Kumar Borah wrote:
> Move disabling of pipe-level color properties (CTM, degamma, gamma)
> from the individual plane color tests into the common test setup.
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_color_pipeline.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index dd2eed637..e15f4d79a 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -65,6 +65,11 @@ static void test_setup(data_t *data, enum pipe p)
>   	data->pipe_crc = igt_crtc_crc_new(crtc,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   
> +	/* Disable Pipe color props. */
> +	disable_ctm(crtc);
> +	disable_degamma(crtc);
> +	disable_gamma(crtc);
> +
>   	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   }
>   
> @@ -107,10 +112,6 @@ static void _test_plane_colorops(data_t *data, enum pipe pipe,
>   				 &fb));
>   	igt_plane_set_fb(plane, &fb);
>   
> -	/* Disable Pipe color props. */
> -	disable_ctm(plane->crtc);
> -	disable_degamma(plane->crtc);
> -	disable_gamma(plane->crtc);
>   	igt_display_commit_atomic(&data->display, 0, NULL);
>   
>   	/* Reference (software-equivalent) CRC */
