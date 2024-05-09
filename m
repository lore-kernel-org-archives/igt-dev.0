Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25D6C04FFE
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 01:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488CD10E2EA;
	Thu,  9 May 2024 01:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3mXf7gP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0030E10E347
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 01:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715218085; x=1746754085;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Q190UD4Jdx2ikYdlDs6qwGnhgOGtZpdzAKgdF4SKkoQ=;
 b=D3mXf7gPw1eBuljrff9uqX+QZNM5DVR6AqSZAua5qZVHs4O+67MrJx4S
 3yAOsrLQvoKTHZWT1ue1z4uDDD7PddSgXhRpv94/W7D389echY5Kp9N5w
 OdPhsYgmf9BWLB8l8DKYYjwnjGKifHlzhsogLqkDxdtGNjPDUjrlejup8
 C7LDFfOj75y37dsrhk13DhqdMkKt11DzJFirfmDhdH6TYxpJWsAkM6ZVH
 5LOlMxW//vRYbyD7GdXy/gRwZGtxxZ1hNAC3SykFE9VEWiU/N6sTG+aDy
 Ke5l6+K51tz4lRrGsoLgKSRg19nqFCX6eFncKwwRw1Gqq17IEe1ekFHXs w==;
X-CSE-ConnectionGUID: 9cVkYB/dTHOcUdk7Kpv+TQ==
X-CSE-MsgGUID: p21iWfliTrK35Q/zBqBwgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11238301"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11238301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 18:28:04 -0700
X-CSE-ConnectionGUID: X1kd5MmwR6eWFvmOHawO9A==
X-CSE-MsgGUID: aB6Snx5bTjekRKNxYpxcdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33607838"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 18:28:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 18:28:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 18:28:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 18:28:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 18:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCmYHqWCT+H/ew4hJVMXKpQMJqaztdw5wuowllDFHWAwLIZSjOD8A8TLDWY9FJx+uKspxouJLZ3o7i3QwPVQQy7Ss8Gbaa214Y87dIo+QamGKHyjr4SE1e4nTCjBSK6bxJ93sAsO2Z9fLmJdsMA12Lt63Pcg114mABcdVVfpsvVz6yS0situDPs6vNBHUxuvFB4pz/fpbHdi/WnWuvuPM9q06gy02htuhSFnSE+FtMW0ykPerkYni5mZqNFLEuAOJPFZripDG25DnHucnbzmUvRTuDXDeQawK23DXuBMV1fbLM8SqOl5neg7faQp5LM6aJ7wDkB5NbPeGKHjPq1hLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaABOeqaIGj4Mc72yJMskJ6YaMA5RA/uX/X8iVZPpGU=;
 b=SHahZ/LVNt0lEO2gOqwNgbm14Ya75U6lanCDZ7hE8DX9i7obMQ1YFLaIupJkdQDwib6AjW2ll/3qTZ57pPjUvTrpwb2yPjVNv9E6nz/zEhQblxUem03oRH1/nJ3lEgBsOsNK0Eecb1lttoSgVoLFx4UYVVxzTeDEoGLSq1a6nBlYm5tMJFCEvrrEwV9BNb8bSbNshZUrKzVgYraCLdod9o1yofyZQglukY5EFksqtZugblIZvjLRxU9eL+KfeqEZmQxMY/pTjpbJChZmGe4io0RL3lP1AELFrcH5XLESFlz/huKmFmID4hWzYwsvUP93o2I/q4nsbuJ3lzaF3xQDqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Thu, 9 May
 2024 01:28:00 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6%2]) with mapi id 15.20.7544.041; Thu, 9 May 2024
 01:28:00 +0000
Message-ID: <662f9756-b04d-462a-893a-8d0c4385c552@intel.com>
Date: Wed, 8 May 2024 18:27:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>
References: <20240503193714.1967850-1-jonathan.cavitt@intel.com>
 <20240503193714.1967850-2-jonathan.cavitt@intel.com>
 <20240508162349.4v4zpogce7ru6qh7@kamilkon-DESK.igk.intel.com>
 <CH0PR11MB5444E8304D0EF667EB79DBC9E5E52@CH0PR11MB5444.namprd11.prod.outlook.com>
 <20240508171127.cjl3ty7vra5fsszj@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240508171127.cjl3ty7vra5fsszj@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|IA1PR11MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4d23f8-335b-4452-23d1-08dc6fc743d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015|921011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1ZMY3YxTnpQZVZ2OXY5eXZLNmRwZWV1QlJjMHBBS3JkdUVHN2NOVjlBc3U4?=
 =?utf-8?B?V3k4T3lLRnNQNGNZQmQ3VXU0Q1R5MHNMUTZCZkR5QTk3UTQvaXV6dytVcm5U?=
 =?utf-8?B?OWE0bm93clZJaU5FMXA4aVlXQ1M4L3kyMGZvVHk0RFdkb09KWFE5Nis1UWJp?=
 =?utf-8?B?Y29KU2I0bElGNENlMFBaSVZIbzhsNW9KY2tkaGtQbHdSM1BTTlpOdWhmS1Ja?=
 =?utf-8?B?aTM0OXVtSFJSZG5EOCs4RC95aXJmTGpiL3lBQjV6bVlLQUFHd3lkdkt6dndt?=
 =?utf-8?B?Sm9ySFlVbnk3M0JRZzUwYlNSenp3OGw3aG5oUnJ1RWoxSGxseW9pSkdwVmh4?=
 =?utf-8?B?N3dBUUZFU3ZHdHE3czlURXllNFViWkRyQkFxVkZ3amliOWF0azVsQkhpUVZ5?=
 =?utf-8?B?MHFYSUtUT2tUM3lXWmhsUEpTU0p1S0RQY1RPbEptcCtzcnYxTURDQVU3Zlp4?=
 =?utf-8?B?UDZtYlJwU2h3Y0JIWThaWjdNZHdoNFhJM0FVQThqV3I0N0RNcHQwbXdxK3BE?=
 =?utf-8?B?Sk9tRG5rZDNxYmg2T3ZIZ0xLWG1vYUd2Ni9CT0VOK2JLb0lJVWxHeW5tUjlr?=
 =?utf-8?B?bVVMeGh0cVZPZ0NmWndjSksyVFlYdXJSdVlSUHRKbTJ4eWFrSDcxU1lxS3Rt?=
 =?utf-8?B?VGx4emthaUhFVUJ2dUdFRHJpMlVMK1N2c2FBbm9wMzNHOXFTc25JRFhMQVRH?=
 =?utf-8?B?ZE1NNDJ2WmhscnkrUkxiREFZUWJ1ejNGV3ozbDgwQTlaYUVqcVY1QmNKSk5K?=
 =?utf-8?B?WVNoRGRhaVF6VFN6d0hyQS9vUk9lWTduS0xmV2tJZGN3Z2p4LzJyYWJYZ3Qv?=
 =?utf-8?B?VTUra3A4QitBTFhNVFlUVHRXVTdrZk9OMGlNWHZ6Z3lGM0ZDZXBuRG9CUmJQ?=
 =?utf-8?B?YncrbmhNUGRKSVZUNUIvOHRLb3E5Tk1naDcvaW5JWW1LUXd5K01QMlpjcDdV?=
 =?utf-8?B?Um94b2lkNEpuZE0zWXNKaXBlWjdzM0twaE9nWHRwcEJ2bDdMM2psc3VnYzlk?=
 =?utf-8?B?SXBnYjJ6VHNidmludlBUMXYxbURPT2lBbUx0UTlVcjNGeC9iY1QrNGgzY0Fk?=
 =?utf-8?B?RnI5NlpFYWlzTFdKdUtGc1VuNnVZWUN1bVRjdnE1ZzY1ZjkzWHNwT0U2QXNj?=
 =?utf-8?B?MHlJblcwdGdQVmVWckZLRmt2Tjh2OVpVYVJZWW1SNWY2YVJ5bEpQcy9SMXZs?=
 =?utf-8?B?YndkM1FCTDI0YVM2dUw0RzQ3SDdJV3puS082aWVXbXlHK29LbGNCYkNNNkFs?=
 =?utf-8?B?MFBqS3NXUzQ0SGgxT1RaWjNWU21haExsa2hEc0VjaVpxRDNXK2JIeGxsYm1s?=
 =?utf-8?B?dnNzc3J2MnE5S0FjNjdZRWJwM2VVMWoxMWk5OXNBZnB1cHZXTnNmQjlWVVkw?=
 =?utf-8?B?VENDQkpIUGk5L0VNTGJsRW16ZHB5QmZ3MmpBOFphZXRlR01CT1FtaVAyTW5W?=
 =?utf-8?B?OVlWK2tSZmdEZG84L1VHOVp5a2FyOG5kUVB2WGNucFFFOEpmRzB5TTB4eUlx?=
 =?utf-8?B?VE9sTm01cWRNQ1ZFZXR4akVKZTB3TkpyQkVKcU9yVk1Ra3BsN1pncmt1ejFv?=
 =?utf-8?B?UkJFMnFQejQrMml5OWtuaFdWenFaczVYODA0MmIrMG1KOXN6M08xenVaVEl2?=
 =?utf-8?B?cmR2d3JIUW5qallCOFgxMThlMG9ERTRsRTU5Y1h2aGVyanNFYUU0eklOdlJF?=
 =?utf-8?B?OE1ERGFuRldvQWczOHVlYndERUg3SllnRHBBODBjVlYzZ3NZQklheUt0SHh5?=
 =?utf-8?Q?JJ2Vozg4wChRBs4pV1AFDN+38YmqxfuqbPWPoes?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zit5NWVuRnZNZk1qejNyRFk2YlBtdzU0bVJ5dnVnbmlIeTBuTTNiMDAraC9u?=
 =?utf-8?B?T0JNZ1Z4RU9PNGNJTVJNL3YzR04xcTVXSWYrN0hRemZCWEw1VjFlWHc5Y1VU?=
 =?utf-8?B?QWdlaTZVajFqbktDVmJNY21pZGZmM1R6Tm51YXdUbVQzM2ZyZitMcFYvNHlS?=
 =?utf-8?B?SkV4ZXNVaWlVd1MxblcvZ1dKNyt0Y1liS1kzb2Z3U0FlZG4wT3dkWTQ2MVYw?=
 =?utf-8?B?MWMvQ3NoOWRiZDZQVU9KVmNPMU1qRUJWZ0xrang2MHpnUXNld3F1aExIRXJ3?=
 =?utf-8?B?TnZ6UzZFNllBQ1pwSkRmcUJEMThoSEoyYmFpc3RmQ2NJbHNKMEt1ZUNYNFJD?=
 =?utf-8?B?cU1TNGRyOWx6K0tQek8xWXNBZjYzZmJqWWdvaTl2SnVLMWhlcjd1NDl0YWJW?=
 =?utf-8?B?Yk9RdVBIWWtnWDBNeGY5RC83STdQcFQzaU5ma0g5MTMzTnp4WlVtdytvVU5L?=
 =?utf-8?B?YzQ2cWZuTmc0cWZDUjJjS09BZ08vb3F0ZFFUenZiSlkzb0hHTTlSME10Z2lJ?=
 =?utf-8?B?VXBISFlERnVKRWZQNXZ5UlpEdnFnTlg0djFnSThhUWkxWlFXekhHTUxwTkxD?=
 =?utf-8?B?RGZjS29hK3VvWXBSQ01jZG9HYVpaSkV5STBZWUpKd212ZVQyWnBnbUEzdENs?=
 =?utf-8?B?YVRyYlpCQys3NFYzWGdMVFZMWXU2eWhBYlFmekNLa0x3d2dKMXhtSGRvbzBN?=
 =?utf-8?B?VzZNWGo0QXU5SjFEVnZrTmt0eUFPNGRQLzYwb3p5LzlWd1JaKzMrZnNtTFZ4?=
 =?utf-8?B?MjBlcFVEZitXN3prNlNGT1pTbUtvUVdiMVBoTWh6cTRuREp5T3pHVm1naksx?=
 =?utf-8?B?R29kbVNLZWhPWFdWS21qYWtRK2xHYS9yTjFhczQ2Qjg1OFM1WktOUTdpOXZP?=
 =?utf-8?B?N2ZpS0kzWCswb0dvRjVLVzc4U3QzNkozQmw0dmdOVjIvRWpvNWRnaGR1L0hP?=
 =?utf-8?B?cm9zOHhqY2x3bVViV3ZxUVY4QTRCeEFrSjFJU3ljcGVFeDl0NzJaTWxzczB3?=
 =?utf-8?B?VmtoT1dDdWxJMWM3MFhCODFLeEFUS0t3c2VyT1NGQVUrQ3ViSUQvMnZBZEUy?=
 =?utf-8?B?NjVrTlFWNXZ5WUVyNzRLaEcrNGhkTUNUM0pxaDI3TCt2NndNVGswOVRaWUpI?=
 =?utf-8?B?WG1tZk9OYmwxbEovZ1hna2kvRDVEbm5PdXBjK0VTVy9nVXBEMFpFcncwby9w?=
 =?utf-8?B?NERmVXhObWwxczV5bEpwWVNUYlhubHdVT1BySWxtemJaSUxQeEtibEZ5amtn?=
 =?utf-8?B?WE9WQUZpdjJwVm53TThnelBzL3A2b0MzcU9iSHVnK2VERklUT0pSVy9zclB1?=
 =?utf-8?B?SllmRlRGeVdXOVBlaWhhR2syKytiSk9EeGJna2IvMUllRnNKNEpFcFhkSCtp?=
 =?utf-8?B?MElmaFlEaFJ5dzRjUS9xV21MTmpabG1aY2tiQ1haZzhTVHRaMUJUR3ZOckY1?=
 =?utf-8?B?RHZ3ZUFYWUw1MnUrS0Y0Y2JkMkh2bC9DRjhEZlRSUnZsWm5JcmtTanUzdkJP?=
 =?utf-8?B?TWlKMkJqeHQvbE9BUUY2YVAxbmlPeWlBck9XQy94ekRmTjJ4N2xjRTRvNmZ6?=
 =?utf-8?B?dnVJL3lVWHU5VEZCamFTTWpiL1B3SHhiNDR1QzJNTUVGdUlzNlpTZ1NzU0Y2?=
 =?utf-8?B?Qnc3Q2oxMXBGcjNtV01kU3ovNmtqMW91ZGJYaG9iN2xjY1JXSXZhcHJ6TUhE?=
 =?utf-8?B?SW1KcmVkU1NkdmtVVk1hMXdxNmU1VXBiclBjWHB3TkNMZFdDR1ZHM2U0aGxP?=
 =?utf-8?B?cFNUeWVUQy9vZzN2T1JHbnphcWlvdkRtZjcyRmhFWHlBWDhKVktpMzRMQnND?=
 =?utf-8?B?QzFkdDFneE5TaDlhWnFBaWRxUW15WGpiK3BYdTRmYStEZnVtaW9TVlE0Y21o?=
 =?utf-8?B?dzM3dzlwMmplWjJyL2w4b2hZQzRVdHl6K2tId0JMUTRFemlNMFhDRndsRUN6?=
 =?utf-8?B?VXQxdklIWTBoTlRkdVFBMjcxaU1la0d3SHRyUUZrQ0ovM2VlVmpqTlBzYjVk?=
 =?utf-8?B?T3owVVVvMzJBZ044RktqUmZqdVBoQW1Eb2t3bFlQSXZBZFlHVkNIamtWOWZz?=
 =?utf-8?B?OU15UXdGNE1rNW1sZ2dYMnQyUkFrTngwMHBMRkgxRWJpUVZVLzdWZmJRWW84?=
 =?utf-8?Q?j+Uk+neM1Lc2oufrWftTepghq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4d23f8-335b-4452-23d1-08dc6fc743d2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 01:28:00.8040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJPgSxRuRWwWUdo/evXd8fhJCubawYUXYWpW/pZtLOfgXKH9y1I5vn5/lmaiA3hEXUMmJiQX+1mffwhDxaLryg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
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



On 5/8/2024 10:11 AM, Kamil Konieczny wrote:
> Hi,
> On 2024-05-08 at 16:43:04 +0000, Cavitt, Jonathan wrote:
>> -----Original Message-----
>> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Sent: Wednesday, May 8, 2024 9:24 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>; Welty, Brian <brian.welty@intel.com>; Mistat, Tomasz <tomasz.mistat@intel.com>; Girotra, Himanshu <himanshu.girotra@intel.com>
>> Subject: Re: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
>>>
>>> Hi Jonathan,
>>> On 2024-05-03 at 12:37:14 -0700, Jonathan Cavitt wrote:
>>>> It's possible for xe_supports_faults to return false if the system is
>>>> busy with multiple running tests.  This is because the check looks for
>>>> all active VMs and searches for VMs that do not have faults enabled,
>>>> returning false if any exist.  Recently, this check has been changed to
>>>> return EBUSY when the check fails in this way, so wait for up to ten
>>>> seconds for all the active VMs to flush out before proceeding.
>>>>
>>>> Suggested-by: Brian Welty <brian.welty@intel.com>
>>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>> ---
>>>>   lib/xe/xe_query.c | 9 +++++++--
>>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>>>> index 6df8f42649..5458c73417 100644
>>>> --- a/lib/xe/xe_query.c
>>>> +++ b/lib/xe/xe_query.c
>>>> @@ -314,8 +314,13 @@ bool xe_supports_faults(int fd)
>>>>   		.flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
>>>>   			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>>>>   	};
>>>> -
>>>> -	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
>>>> +	struct timespec tv = {};
>>>> +	int result, timeout;
>>>> +	do {
>>>> +		result = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
>>>> +		supports_faults = !result;
>>>> +		timeout = igt_seconds_elapsed(&tv);
>>>> +	} while (result == -EBUSY && timeout < 10);
>>> -------------------------------- ^^^^^^^^^^^^
>>>
>>> Waiting any number of seconds in library function is way too much,
>>> imho this is ok in test itself, not on lib.
>>
>> Is the suggestion here that we should perform the wait "on" xe_supports_faults,
>> rather than "in" xe_supports_faults?  I.E. that we do something like this instead
>> in xe_exec_fault_mode.c:
>>
>>          igt_fixture {
>>                  bool supports_faults;
>>                  struct timespec tv = {};
>>                  fd = drm_open_driver(DRIVER_XE);
>>                  do {
>>                          supports_faults = xe_supports_faults(fd);
>>                  } while (!supports_faults && igt_seconds_elapsed(&tv) < 10);
>>                  igt_require(supports_faults);
>>          }
>>
>> I can do this, though if xe_supports_faults returns false for any non-EBUSY related
>> reasons, we won't be able to detect it from here and we'll spend ten seconds waiting
>> for xe_supports_faults to return true when it strictly cannot.  Is this an acceptable
>> tradeoff?
>> -Jonathan Cavitt
>>
> 
> If you are doing this just after igt_main you do not expect
> it will return EBUSY. Other way would be to return errno from
> lib function and let subtest decide if it want to wait.
> There you could also account for simulation, where it can
> take longer. Btw is there any sysfs param for it?
> 
> Regards,
> Kamil
> 

Problem is the issue is that 2 VMs cannot be created in the 2 different 
modes.
Cannot have one VM in 'fault mode' at same time as one is in 'non-fault 
mode'.   So the correct place for the check is not even inside 
xe_supports_fault_mode(), but in xe_vm_create().

As every single IGT test that creates an IGT can fail with -EBUSY from
xe_vm_create() as creating 2 such  VMs is not allowed.  Whoever tries to 
create the VM second loses (fails).

Maybe a good first step is to have xe_vm_create() raise a SKIP on -EBUSY 
errors?

Maybe a good second step is to figure when and where adding a 
timeout+retry might make sense.....   maybe since this is a shard run (I 
think?),  this test can be attempted again later in the batch of tests?

-Brian




>>>
>>> Regards,
>>> Kamil
>>>
>>>>   
>>>>   	if (supports_faults)
>>>>   		xe_vm_destroy(fd, create.vm_id);
>>>> -- 
>>>> 2.25.1
>>>>
>>>
