Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E7ED4115D
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 10:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD8410E05E;
	Thu, 15 Jan 2026 10:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLQ7KJK9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51A010E05E
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 10:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768473126; x=1800009126;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yS0qf0gHAqRBtLyK1j1QuPnTCQsgdIjb84Wr7GU5BA8=;
 b=NLQ7KJK9NcdyUopIodVtDNwDF0BG//yRAxzmMbk+fl6bjotAz81A1NyB
 E+5wtNZpMBKQyPztgv1B1oYsx1HqRFksxk5CTPRpBU/QDT7kwDqw/Ntc/
 gbTEigUAh/zSURo8iFPhF61e35jVnkBHVWXT3VuEEKlWDCl783imCjQEx
 j4tozhreyFSmjSBXIZigW68CfQIU/JhtHAt+b8pDEHEFu0UlwY5KSocn3
 Ih4mF/6srOqNuxOzrpn7E+iY/1bUwoi0m7aRFsATEP/o8X56ZijdVY3Gq
 jHYmssp3eMB2akCvEmuZyUCmkW5xRfom5QwS4Y8R38gaeVNryhVwnrh5t Q==;
X-CSE-ConnectionGUID: L1+hq75wT36a5b6dwzzi4g==
X-CSE-MsgGUID: XxsRox3xS1G5S8cnieXgfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80420828"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="80420828"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:32:06 -0800
X-CSE-ConnectionGUID: ebp28J58Q4in0cVZJtBlrA==
X-CSE-MsgGUID: 04vfNx7OTxywV5fakx1VlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204979785"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:32:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 02:32:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 02:32:05 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 02:32:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrr86BZ3qpsFJlEADB46rmEKizZE+P+bnp4YqS5d8oU63wSdZ1zVbfZqBGQ0kM1M6bpgqgsKLOKry8kqMTOEmHxglnLIf2vD9W7cdbz7Nh2PFLXIFuH4+sJrzGmTvnI6mIXdoqR6OzvLmy41a1RKrD/Og7GSRS5AjsQEwyRXLIJn9vFzJ1FNbrfP+r8aDuup2dWnOy1EvdRqOwh5cvUGSkqfZLQL87l2H6eorPYELZ6cW0QUZfCEwDidCmBRKIaJb309LX61Vw8xF+jYQKImYOFFzts3aq0uRErzogfYMwLq8xhQe5HbVYUr6qMKJSKBstNQJODKLwyNtMlFtZYvlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EZn9XQ+SolBZR+Pi3xqL6cnAL5PFjIdaB6cgIoMXy4=;
 b=iy+ceZhQJLMPwQnMQmO5ZCxnEkpxVnfRluDgmRtsvOYxtetWCg+B/9nzhSaXShbLhLtSg8zjd630CZ4o8Upa31HNwb+kal4UAnHfRX7hagr4PAsleAdovuyooR6PjAH6WnW6BCLxwU0cApT30B7Y/4RGvJ0/D/X3oYXYFzyK/ZmFoqsq1Sf7IDaY9Icg/vEpGrH9koOZa1U5zUi+zxmvm6XPBqEcAi/MvwJoMLsQlzkP75IZv66t1Ech2ivDUZAMVkDKEVNVylcvtIuZis8jetdTtD2vx/rXEPQa/hQ07c7mGRaJAttkfxRcxvYqbGYoUD3D2PeKR6Y4CSEqbMlD7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CYXPR11MB8755.namprd11.prod.outlook.com (2603:10b6:930:e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 10:32:02 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 10:32:02 +0000
Message-ID: <3d2324e6-f023-4b99-82b2-4e6a0945d89d@intel.com>
Date: Thu, 15 Jan 2026 11:31:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 02/10] lib/tests/igt_sysfs_choice: Add test
 coverage
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0002.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::12) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CYXPR11MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 752948c7-51dc-48c8-18ca-08de54215225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGlUVHpPRzNzVzg2dXhqQUtBY1Qvdm5xenNTQk11cHJIZ3hPRi9YZkp0ckRZ?=
 =?utf-8?B?N1dJbUdNQWFZYndKVHBsVFRZaXZ3RFUxelJEQ085d2t0dHQxdWR6dS9JZTRk?=
 =?utf-8?B?UVdvKzRVSFpiaXBmUXQrT1ViRkFocDFlUFZ6MVJUN0Jxd0lVT3g3V2tvanJW?=
 =?utf-8?B?aks2dDJQNmZwckJoelZtQkNMcDFRbUt1N1oxTmR0dk96QWlkekQwV2JmRkdM?=
 =?utf-8?B?MThpVFhQTzVBSkNValFxOEd3T0w2bTR5Q2h6QTNCZmZVUHhpQmNTYVVDbFlu?=
 =?utf-8?B?VnBxYkFGOGdPTStsRndpWUZudWg4aTU2eDdzclNhdUlhbVZTWVFEMUluc1FE?=
 =?utf-8?B?QU0wYlFzSDF0ZHhoNkJCUEpkbDJOTi9NSG9CeWs0Qk9LakQwdmdLcm4vRG5P?=
 =?utf-8?B?Q25pTlQzbWhkWVF6U3RmR0RHa3ZTMklQSXJ2VUxjZFJRZ2VsTXJiMlphelk3?=
 =?utf-8?B?VDJEUlVhTjdpMTUwekFNc0FCUFhtMHEzRzFGdUtVT0pYVmZGaGFvZHFTWW9j?=
 =?utf-8?B?RVRPTlJHWWlDWWFaWU02elRjMFl4bHBmUGROMi9pZm9nbDhnRWx4dVhRTWpS?=
 =?utf-8?B?UjV4V0tCTmxiQWxNRFN4L1ZHL0NvaXZ2M1VIY0hESElmWjN1aEFOMEZHOEJC?=
 =?utf-8?B?N0FYN1lZeDc4U21YVmpIbllqNVA4TzVLekZiV01VemowdDliVjU5Rmk3VTBx?=
 =?utf-8?B?MkRQV1RZL3lpM0l1T2JKODJybk9ycFpSSWRFQmNYSGNEN1FNZnFBUzJWSkQ2?=
 =?utf-8?B?Q29iS012M1d5TThRR3EzcDNZdkNyY1ExWUIzQlBCc3NGQ0VaNGZvYkUrQ0Z6?=
 =?utf-8?B?dHNFbFFYNklocTZ0cDVtWmVQYmJWM2dXbElwSnRYQ1lBbUUzTjZVNlh2Tys5?=
 =?utf-8?B?a1ZBanFDdlVGakxldkdVWFBmSy9KVHBNSW5qZVU0UkJ1K2YweXh1a1BtenA4?=
 =?utf-8?B?OTNkWjJpNHNlMXdCRWRRQWFUa0VlV1BGU3lrQ1NJSVB5UXU0RmJYclkwUlpW?=
 =?utf-8?B?KzFrM0NVT3VyaERsTVBXWFJFeG9QWVVJZW1jTCticGFsN1hZNjROMDczWHZa?=
 =?utf-8?B?V1dobXVWcVVXcWFGMUhFSzVoa2NEVy9zQ3JZUUJjZW1hUnl4VURHdHNFU2RR?=
 =?utf-8?B?TFlPRDJEazhjMEVwblFmRTBlYkdFMVdZWlE5L1luVHQ3b0ZoeGx2b256ZmYz?=
 =?utf-8?B?bW9aWkUvV3J1a3B0TmdFOXpxQlcyalNHY0JKMzRrd1BJVFhCaUhnUVNlNno1?=
 =?utf-8?B?d1EvN2VZdVl6OHBYaWI3SzhnYTAyWW9BT0E5UFZYVVhFcm5lVkJ2WjgrRnVS?=
 =?utf-8?B?eFRBT1pJS1lhZmJkMGpMV2NiUU9Tc3JkS3lPQUJobUZWTGR0b3VhTnRPdHE1?=
 =?utf-8?B?YXdRZExXYWJ1cGthcDhrUmRMdy9VTDRnK0NwWGNmK3Vpb3NyclR2SmcyQkJt?=
 =?utf-8?B?SURZZldQSVEzUkkwMGlhZFhZZnlDcFhIYjd0dGRGWk1vZlNVaVZyQjJJck95?=
 =?utf-8?B?bEM5KzJJWE8zcllCY1orbWFuTitkaGtrZW5LckVENHNrbUR3VGJ1SDlGc0Z2?=
 =?utf-8?B?OWFvV2ozZGQvajVXeGpzTHJvRXRLcEFRK0psd240NzhLVHM0TllUY3ZDYmhY?=
 =?utf-8?B?STl3TUVETDQwL2Q1OUFpT3JKcmJjVVV5S00xM20rQnJLblMwR2xkUGRyYXMv?=
 =?utf-8?B?K0JZY2ZtakFRYnFHMTZIRE4wZ2tBd1hwYkNyYVhrWDVyQU5UMEU3cDlYRExu?=
 =?utf-8?B?b3pHRG5Xcld6cmlnNlB6OU85MUVBRzNwQWJHZTJPRHBmNCtENUVjZHlLYnQy?=
 =?utf-8?B?ejdQSjhxaVpmWWR3T1BnSEQyMkFJNUpIR1hHeGpta1BkeXpFVDMveFM3b3c4?=
 =?utf-8?B?VGF2ZE5JdmdQSFJleCtDN29PK2lHWC9yU0ticXNyT2w4WXc2MmVjL1Y1WnZq?=
 =?utf-8?B?VTc2eU42M0lHZVVCSDRHS1dpZzEzYkdOSm5lc1BSckptYWlnaG1IeVNuQVlp?=
 =?utf-8?B?SlU2NW9WcDZid2psSzg3dGpmeHZpTFA2OW16ckt1Ri95OURwR21JaGhrbFlX?=
 =?utf-8?B?UWtNRnN4alNqeXFqMitzQVpvUDNPZTBUMTJQVm5RQTRDU002ZnNqb2VNMmdN?=
 =?utf-8?Q?iOtA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(7142099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVBuNjFLRGlIY2k5b0V4ZVFlcEF3MFNCc1M4ek9RTUh3VEFWUHJ2UWptL2VI?=
 =?utf-8?B?STJUa053MWFueERzZUl3dGNRRjh2OGtncWNuaTloOXpFc3BBaW9qRG9rUkxK?=
 =?utf-8?B?enBkRkRMdXFXN0tjSVA2TjhWSVA3VHE0QnI2SW1KL3RWYndKdC9DQ045MnYy?=
 =?utf-8?B?Z0NvYmtpUm5rQWNPVUZOOWE3Qm5PRUowV1JEUUVXRXVhd0hpaW41UzRiQytE?=
 =?utf-8?B?ZEpnNGNGQmV2ajZ6VkJtOFprVzV5MWp1UWlMcHkzZjlYZjVEeklhZndKWjgz?=
 =?utf-8?B?WnZjZHkyWTFnWWxrQmFxQlRobkwwRHlIS3VmUVRCajh6WGRqd2JMQWRTMGxZ?=
 =?utf-8?B?QTdDa1RiZ1UyYmVndEZ0TFVLenVnY1NXdFFOYzhyclJsNUVzM2Z0MHI1U0pD?=
 =?utf-8?B?MzcwbHQyWExhRDZyc1RENGNlKzlOa1U3eUR5VWRwM3lRY1JrSHZXbFZ6Zksy?=
 =?utf-8?B?aUlHMzByVksyOGE2WUZUUXJOME5oRkhiREdjN3hMTXE3RFZIRmRGUENVZnNP?=
 =?utf-8?B?Z0lTZXYybW1WL3RQRUdTM3d5dEN6Tml3VlZyZG9ObVFvazdDcEhJejBSOVVH?=
 =?utf-8?B?cVhrVmxQQy9STTRING5pbkIzYXZQYk5DNk1KNWRCcXVEVk0zdkg4NzB5VGhx?=
 =?utf-8?B?SmFvbVFNcms5Rm5idXhVOFVteVd4UzBWbHVvMHJEaFJyTENpalV0K2NuRC8r?=
 =?utf-8?B?UTRzTjZLdEVKOTZiQ0o3dzVjQVlGZ054ZVViVWZKcmhPUlRSc0d5ZDlxRVJo?=
 =?utf-8?B?ZC9MRGtqWm1OTUY1MjFIZ1hQU09wV0ZqaEFyK3dTWjJZY01jSytzcDg3Tmp4?=
 =?utf-8?B?ZDk2eUgwOWpBUDB6eUJwVm13MFV4N0JqZ3pNMFpwRUhKT2dJRy9udHd5aitO?=
 =?utf-8?B?ZDkwSHN4OE9XQmRiUCtGWWRkdTg0bXArZnF4R2dnN1lFYnZyMGh3aGdkeGs0?=
 =?utf-8?B?ZkE5dis4aHIwSVY0TWZrRC9kTUYwaW14TmZkU0JnRmZndVFDVEpJRXBkMU5S?=
 =?utf-8?B?QnZ4UG16T0VJM0RESmJndXFITVYvWXRGclNNQzhxODN4dDNGUkZmZEJpTENB?=
 =?utf-8?B?SkZZcDRrTnU1OE1GaWc5Wks5Ykx3Wkxkd3VRZzFZZEFsSDBlVkdjc1c1Szl0?=
 =?utf-8?B?T2xLN0l2SCtxaGQ1cE5vTGNiL2N4bW9WWE5iSXZFalNyc2hmRGdZVStLWkxk?=
 =?utf-8?B?bU4xOEZtMi9HQnh1ZkRsYy9pZ0JxamlaNEUrYmdBT3orT3J1TGlZUDZWR3NX?=
 =?utf-8?B?S2JQQ01oVWJKSUowZ25yb0V2NjlrT1kydVp4YmR4aVVSaUNwcTJKRUxJd0JF?=
 =?utf-8?B?Sy92M241YW1CcXhGalhMRGw2OTdpeCtHRnRiZDAzaURaS3U4bVl4OXRkQVlu?=
 =?utf-8?B?UlFUZldmdE12dENibEhaNFl1VFk1S2RvUjJ5UEhiYk9qWVB6Z2pHZzR5bWZq?=
 =?utf-8?B?dGlXR1d1em8rY0IxazRGdjlMZUlDbmlSOTZqSDA1c1FWYU84SnpwUFowYUVN?=
 =?utf-8?B?R1BoZE9JZXR3WXY5N0xDSUJFclNaaXpPVlo1dGVWRDVJaW92RDZ4TFp2eElu?=
 =?utf-8?B?MVZobU81YnhNejlJUmRMZjczczJYT0JwVW1QRldVZEJiZEZtZ29JblRIVjhT?=
 =?utf-8?B?QitlaGN0eHA5eDVkZHlRSjJaVHhLSXV0OWRISW9HK2ZmK3FzMm56Qm9EMTZk?=
 =?utf-8?B?Ym5DR2NvRGxwbmNlMDloMnFDUTJOR2dCZDhOSVFwSzdrWUdFMXN5VnJGeTV3?=
 =?utf-8?B?elZONmhtNXcyOEhWRWpNOGE1bFAyM3VxeWxpbXhTemt4V2dPYlJLWkVxMi9R?=
 =?utf-8?B?YWNNQXl2SUdkcUxHa2RBVnRJaC9IZWticHdPTXRic00rVEw0OVliaGlERjEw?=
 =?utf-8?B?bFIrOC9pU0VnVTRmQnY3a052WU9kMEFRcWpCdGR5NFBvTUg2UkdMUVBvaUlG?=
 =?utf-8?B?c3huN0h2UVB3OG5pbUp1KzJlbmN6WWlCemcydm43QTNxNkRFU2xZYjRRTkxu?=
 =?utf-8?B?YWdoNTVNOTlubjEwMGtITzZlOWVrUEdQckxCRXFwa250RFBERSt1bmZ4cEpT?=
 =?utf-8?B?L2EzNlFiN2lwd1hPSC8rZVdWTEFDTy9YUS9kQ2ZFMDh6eE5LeUF6QWZJZnA0?=
 =?utf-8?B?WXZ6b0k5Z2JnYUZrWEdVVllIWjhTWEl3MzE5RnFMZGtBWjZmVzVsZm00aVZa?=
 =?utf-8?B?ZldjdlZxODU1QUhtekNNZHhkaVBjRkhRdjMrK29zYTdHVW8xSTRoQjhMNTF5?=
 =?utf-8?B?YmpWOFd1VzM5UU41eVNPU1lZUUJFVmhUallQcm42Z0toclVDbjY5ajN0NkJz?=
 =?utf-8?B?azFrUU1DeXNsQU8xdmVKTjUwSzBhdTNVK3Q5aTNaVUZITmc0bHYzQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 752948c7-51dc-48c8-18ca-08de54215225
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:32:02.4324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqdAuZpzkPIYFF2CjTeiJqoAMmQ5lRbfnuhv7xKXiLLhFDLIeERXJ4oN6DwNWZvuEw2OcvZGyoLEaPmz2duNxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8755
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


On 11/25/2025 11:23, Marcin Bernatowicz wrote:
> Add unit tests exercising parsing, selection rules, intersection,
> round-trip formatting, and mask conversion for igt_sysfs_choice.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   lib/tests/igt_sysfs_choice.c | 387 +++++++++++++++++++++++++++++++++++
>   lib/tests/meson.build        |   1 +
>   2 files changed, 388 insertions(+)
>   create mode 100644 lib/tests/igt_sysfs_choice.c
>
> diff --git a/lib/tests/igt_sysfs_choice.c b/lib/tests/igt_sysfs_choice.c
> new file mode 100644
> index 000000000..05b10c0d0
> --- /dev/null
> +++ b/lib/tests/igt_sysfs_choice.c
> @@ -0,0 +1,387 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation

2026

> + */
> +#include <errno.h>
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_sysfs_choice.h"
> +
> +static void assert_token(const struct igt_sysfs_choice *c,
> +			 size_t idx, const char *expected)
> +{
> +	igt_assert_f(idx < c->num_tokens,
> +		     "token index %zu out of range (num_tokens=%zu)\n",
> +		     idx, c->num_tokens);
> +	igt_assert(c->tokens[idx]);
> +	igt_assert_f(!strcmp(c->tokens[idx], expected),
> +		     "token[%zu] mismatch: got='%s' expected='%s'\n",
> +		     idx, c->tokens[idx], expected);
> +}
> +
> +static void parse_ok(const char *str, struct igt_sysfs_choice *choice)
> +{
> +	int ret;
> +
> +	ret = igt_sysfs_choice_parse(str, choice);
> +	igt_assert_f(ret == 0, "parse(\"%s\") failed: %d\n", str, ret);
> +}
> +
> +static void test_parse_basic_first_selected(void)
> +{
> +	struct igt_sysfs_choice c;
> +
> +	parse_ok("[low] normal high\n", &c);
> +
> +	igt_assert_eq(c.num_tokens, 3);
> +	assert_token(&c, 0, "low");
> +	assert_token(&c, 1, "normal");
> +	assert_token(&c, 2, "high");
> +
> +	igt_assert_eq(c.selected, 0);
> +}
> +
> +static void test_parse_middle_selected_whitespace(void)
> +{
> +	struct igt_sysfs_choice c;
> +
> +	parse_ok("  low   [normal]   high  \n", &c);
> +
> +	igt_assert_eq(c.num_tokens, 3);
> +	assert_token(&c, 0, "low");
> +	assert_token(&c, 1, "normal");
> +	assert_token(&c, 2, "high");
> +
> +	igt_assert_eq(c.selected, 1);
> +}
> +
> +static void test_parse_single_token(void)
> +{
> +	struct igt_sysfs_choice c;
> +
> +	parse_ok("[only]\n", &c);
> +
> +	igt_assert_eq(c.num_tokens, 1);
> +	assert_token(&c, 0, "only");
> +	igt_assert_eq(c.selected, 0);
> +}
> +
> +static void test_parse_error_missing_selected(void)
> +{
> +	struct igt_sysfs_choice c;
> +	int ret;
> +
> +	ret = igt_sysfs_choice_parse("low normal high\n", &c);
> +	igt_assert_eq(ret, -EINVAL);
> +}
> +
> +static void test_parse_error_multiple_selected(void)
> +{
> +	struct igt_sysfs_choice c;
> +	int ret;
> +
> +	ret = igt_sysfs_choice_parse("[low] [normal] high\n", &c);
> +	igt_assert_eq(ret, -EINVAL);
> +
> +	ret = igt_sysfs_choice_parse("low [normal] [high]\n", &c);
> +	igt_assert_eq(ret, -EINVAL);
> +}
> +
> +static void test_parse_error_unterminated_bracket(void)
> +{
> +	struct igt_sysfs_choice c;
> +	int ret;
> +
> +	ret = igt_sysfs_choice_parse("[low normal high\n", &c);
> +	igt_assert_eq(ret, -EINVAL);
> +
> +	ret = igt_sysfs_choice_parse("low [normal high]\n", &c);
> +	igt_assert_eq(ret, -EINVAL);
> +}
> +
> +static void test_parse_error_too_many_tokens(void)
> +{
> +	struct igt_sysfs_choice c;
> +	char buf[512];
> +	size_t i;
> +	int len = 0;
> +	int ret;
> +
> +	/*
> +	 * Build a line with (IGT_SYSFS_CHOICE_MAX_TOKENS + 1) tokens:
> +	 * "[t0] t1 t2 ... tN"
> +	 */
> +	len += snprintf(buf + len, sizeof(buf) - len, "[t0]");
> +	for (i = 1; i < IGT_SYSFS_CHOICE_MAX_TOKENS + 1 && len < (int)sizeof(buf); i++)
> +		len += snprintf(buf + len, sizeof(buf) - len, " t%zu", i);
> +	len += snprintf(buf + len, sizeof(buf) - len, "\n");
> +
> +	ret = igt_sysfs_choice_parse(buf, &c);
> +	igt_assert_eq(ret, -E2BIG);
> +}
> +
> +static void test_selected_basic(void)
> +{
> +	struct igt_sysfs_choice c;
> +	const char *sel;
> +
> +	/* selected at position 0 */
> +	parse_ok("[low] normal high\n", &c);
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(sel);
> +	igt_assert(!strcmp(sel, "low"));
> +
> +	/* selected at position 1 */
> +	parse_ok("low [normal] high\n", &c);
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(sel);
> +	igt_assert(!strcmp(sel, "normal"));
> +
> +	/* selected at position 2 */
> +	parse_ok("low normal [high]\n", &c);
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(sel);
> +	igt_assert(!strcmp(sel, "high"));
> +}
> +
> +static void test_selected_invalid_index(void)
> +{
> +	struct igt_sysfs_choice c;
> +	const char *sel;
> +
> +	/* selected = -1 */
> +	parse_ok("[only]\n", &c);
> +	c.selected = -1;
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(!sel);
> +
> +	/* selected >= num_tokens */
> +	parse_ok("[only]\n", &c);
> +	c.selected = 999;
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(!sel);
> +
> +	/* empty choice */
> +	memset(&c, 0, sizeof(c));
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(!sel);
> +}
> +
> +static void test_to_string_roundtrip(void)
> +{
> +	struct igt_sysfs_choice c1, c2;
> +	char out[IGT_SYSFS_CHOICE_MAX_LEN];
> +	const char *s;
> +
> +	parse_ok(" low [normal]  high \n", &c1);
> +
> +	s = igt_sysfs_choice_to_string(&c1, out, sizeof(out));
> +	igt_assert(s == out);
> +
> +	/*
> +	 * Expect canonical format: tokens separated by single spaces,
> +	 * one [selected], no trailing newline.
> +	 */
> +	igt_assert_f(!strcmp(out, "low [normal] high"),
> +		     "to_string produced '%s'\n", out);

nit: "choice_to_string produced..."

> +
> +	/* Parse again and ensure we get the same structure. */
> +	parse_ok(out, &c2);
> +
> +	igt_assert_eq(c2.num_tokens, 3);
> +	assert_token(&c2, 0, "low");
> +	assert_token(&c2, 1, "normal");
> +	assert_token(&c2, 2, "high");
> +	igt_assert_eq(c2.selected, 1);
> +}
> +
> +static void test_find_basic(void)
> +{
> +	struct igt_sysfs_choice c;
> +	int idx;
> +
> +	parse_ok("[low] normal high\n", &c);
> +
> +	idx = igt_sysfs_choice_find(&c, "low");
> +	igt_assert_eq(idx, 0);
> +
> +	idx = igt_sysfs_choice_find(&c, "normal");
> +	igt_assert_eq(idx, 1);
> +
> +	idx = igt_sysfs_choice_find(&c, "high");
> +	igt_assert_eq(idx, 2);
> +
> +	idx = igt_sysfs_choice_find(&c, "ultra");
> +	igt_assert_lt(idx, 0);
> +}
> +
> +static const char *const prio_names[] = {
> +	"low",
> +	"normal",
> +	"high",
> +};
> +
> +static void test_to_mask_basic(void)
> +{
> +	struct igt_sysfs_choice c;
> +	unsigned int mask = 0;
> +	int selected_idx = -1;
> +	int ret;
> +
> +	parse_ok("[low] normal high\n", &c);
> +
> +	ret = igt_sysfs_choice_to_mask(&c, prio_names, ARRAY_SIZE(prio_names),
> +				       &mask, &selected_idx);
> +	igt_assert_eq(ret, 0);
> +
> +	/* low | normal | high -> bits 0,1,2 set */
> +	igt_assert_eq(mask, (1u << 0) | (1u << 1) | (1u << 2));

use BIT() macro - the same applies for other occurrences

> +	igt_assert_eq(selected_idx, 0);
> +}
> +
> +static void test_to_mask_ignores_unknown(void)
> +{
> +	struct igt_sysfs_choice c;
> +	unsigned int mask = 0;
> +	int selected_idx = -1;
> +	int ret;
> +
> +	parse_ok("[low] normal extra\n", &c);
> +
> +	ret = igt_sysfs_choice_to_mask(&c, prio_names, ARRAY_SIZE(prio_names),
> +				       &mask, &selected_idx);
> +	igt_assert_eq(ret, 0);
> +
> +	/* "extra" is ignored, only low + normal mapped */
> +	igt_assert_eq(mask, (1u << 0) | (1u << 1));
> +	igt_assert_eq(selected_idx, 0);
> +}
> +
> +static void test_to_mask_selected_unknown(void)
> +{
> +	struct igt_sysfs_choice c;
> +	unsigned int mask = 0;
> +	int selected_idx = 123;
> +	int ret;
> +
> +	parse_ok("low normal [extra]\n", &c);
> +
> +	ret = igt_sysfs_choice_to_mask(&c, prio_names, ARRAY_SIZE(prio_names),
> +				       &mask, &selected_idx);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_assert_eq(mask, (1u << 0) | (1u << 1)); /* low + normal */
> +	igt_assert_eq(selected_idx, -1);
> +}
> +
> +static void test_format_mask_basic(void)
> +{
> +	char buf[128];
> +	const char *s;
> +
> +	/* mask for low + normal + high, selected = normal (1) */
> +	s = igt_sysfs_choice_format_mask(buf, sizeof(buf),
> +					 prio_names, ARRAY_SIZE(prio_names),
> +					 (1u << 0) | (1u << 1) | (1u << 2),
> +					 1);
> +	igt_assert(s == buf);
> +	igt_assert_f(!strcmp(buf, "low [normal] high"),
> +		     "format_mask produced '%s'\n", buf);
> +}
> +
> +static void test_format_mask_empty(void)
> +{
> +	char buf[128];
> +	const char *s;
> +
> +	s = igt_sysfs_choice_format_mask(buf, sizeof(buf),
> +					 prio_names, ARRAY_SIZE(prio_names),
> +					 0, -1);
> +	igt_assert(s == buf);
> +	igt_assert_eq(buf[0], '\0');
> +}
> +
> +static void test_format_mask_unknown_bit(void)
> +{
> +	char buf[128];
> +	const char *s;
> +
> +	s = igt_sysfs_choice_format_mask(buf, sizeof(buf),
> +					 prio_names, ARRAY_SIZE(prio_names),
> +					 (1u << 0) | (1u << 3),
> +					 0);
> +	igt_assert(s == buf);
> +	igt_assert_f(!strcmp(buf, "[low]"),
> +		     "format_mask produced '%s'\n", buf);

nit: "choice_format_mask produced..."

> +}
> +
> +static void test_intersect_basic(void)
> +{
> +	struct igt_sysfs_choice a, b;
> +	int ret;
> +
> +	parse_ok("[low] normal high\n", &a);
> +	parse_ok("low [normal] ultra\n", &b);
> +
> +	ret = igt_sysfs_choice_intersect(&a, &b);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_assert_eq(a.num_tokens, 2);
> +	assert_token(&a, 0, "low");
> +	assert_token(&a, 1, "normal");
> +
> +	/* semantics: selected remains the original selected token if still common */
> +	igt_assert_eq(a.selected, 0);
> +}
> +
> +static void test_intersect_single_common(void)
> +{
> +	struct igt_sysfs_choice a, b;
> +	int ret;
> +
> +	parse_ok("low [normal] high\n", &a);
> +	parse_ok("[normal] ultra\n", &b);
> +
> +	ret = igt_sysfs_choice_intersect(&a, &b);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_assert_eq(a.num_tokens, 1);
> +	assert_token(&a, 0, "normal");
> +	igt_assert_eq(a.selected, 0);
> +}
> +
> +static void test_intersect_no_common(void)
> +{
> +	struct igt_sysfs_choice a, b;
> +	int ret;
> +
> +	parse_ok("[low] normal\n", &a);
> +	parse_ok("[high] ultra\n", &b);
> +
> +	ret = igt_sysfs_choice_intersect(&a, &b);
> +	igt_assert_eq(ret, -ENOENT);
> +}
> +
> +igt_simple_main
> +{
> +	test_parse_basic_first_selected();
> +	test_parse_middle_selected_whitespace();
> +	test_parse_single_token();
> +	test_parse_error_missing_selected();
> +	test_parse_error_multiple_selected();
> +	test_parse_error_unterminated_bracket();
> +	test_parse_error_too_many_tokens();
> +	test_selected_basic();
> +	test_selected_invalid_index();
> +	test_to_string_roundtrip();
> +	test_find_basic();
> +	test_to_mask_basic();
> +	test_to_mask_ignores_unknown();
> +	test_to_mask_selected_unknown();
> +	test_format_mask_basic();
> +	test_format_mask_empty();
> +	test_format_mask_unknown_bit();
> +	test_intersect_basic();
> +	test_intersect_single_common();
> +	test_intersect_no_common();
> +}
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index 1ce19f63c..124a9ecae 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -23,6 +23,7 @@ lib_tests = [
>   	'igt_simulation',
>   	'igt_stats',
>   	'igt_subtest_group',
> +	'igt_sysfs_choice',
>   	'igt_thread',
>   	'igt_types',
>   	'i915_perf_data_alignment',
