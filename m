Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E79CEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 07:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E084610E2DF;
	Mon, 17 Nov 2025 07:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3/EC4Ym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3132D10E2DF
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763363629; x=1794899629;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J+dUuWsuR0siUFodYJkceEt87FzxWKDfYIgc1TE9on0=;
 b=l3/EC4YmE2mGFd3VCUmNCdFYmy1qEEJ+KGJsM/ufSqxnOr0hEUqQE3F7
 0g26SoeQrcdQAK2/ZGhO+olOW694I3QnWdg1Ln+3MYAo4qr/Z4QZBbTDF
 RecIRg/pJHLelpYJibxgayB7/iV0J/FJtMvao1zqoR76MYjxnhd1ar0gy
 2/jyVDA3rqAEUW/WyTTZk5/TsByO+FtVjIbF+/pmElYWQo34D6iXA3xrO
 P1Xhofy6kDKU/i6p+WdMSOLEiQhu1ThHgEwA04RDxR0kpWSkAEs2RuwMT
 BLxmutd67nnC+5AVwGEVPIlZSn/PIKZIH3xNOYXSU/xCedbTeXa6xPaLg Q==;
X-CSE-ConnectionGUID: 3iQDqKGHQZ2f3RmmRzf0GQ==
X-CSE-MsgGUID: tqlA29lwTRe+b0EBKsoohA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65391143"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65391143"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 23:13:48 -0800
X-CSE-ConnectionGUID: yx30SvBXQvG2xs+diQvFeA==
X-CSE-MsgGUID: TAxkuLG6TS2CuKVwDbSsLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="221019228"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 23:13:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 23:13:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 16 Nov 2025 23:13:48 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 23:13:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsFcQNE9KRNk+hg/a/7gfJv6WibCfQliMzloqJ/qQ/99sx9Uj9WHx37T7t0/Dal7m56s5r3kMftm6BPerbhHrQ0dhXlkXlZXPE5owLDpV0f8Rb7Ci43HghAuBTmfWrtO9iWSelRrJskWpJXPPD7GLaOkI7joL9MaJ0NMt3MtC2jvFGxGOzuGwQP3KvPJXYc3t6QSQD29E6OQGWp3+85VX54wQwJpG2SpZD6v3d36H2zfHMueRlem2nGdjHv9d0U6Oey+ZO0WXtdQgjbuBRXupNv7FqC6xgVrk363WiDREunJdQumS8915q5/cme4m8foUtTGxHy4AgKBcWHH4wYvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKUrh0l+nPHbScHTA/zn5I4F0HV6xlzdExWNSbxGZCo=;
 b=PRoeGrMAP6tHL/bQBg4n7HJgBrMnuyGjLetAJXzUqKnpzu2Wp6OQ07O+MGpo/zpynTR4TdFNGfsmGtxL90dKP48HKS5IlIHOntk/8Avnt8C8w25RwB9Ze2czKuKfoVr5jjssLj82q7SOSW3vicVTKF6xv9CZV+rYHqcAXQdRsS+fD3Adv/tFbhpUnZ7IaLDcV1CqUQyXK0bDHLHjqg/71e3dMQwh9CGBzT7SwzUJ4lJgRdnQ90pHHjTrJXzJVB8fhjzI84ziDfKKexc0owSfvSEOPLmZSBjNc+lKaa88HPKsxhXR9x/eickm5csYmACfFHkdQs3uO8j/GN/ag8aZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH3PR11MB8436.namprd11.prod.outlook.com (2603:10b6:610:173::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 07:13:46 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 07:13:44 +0000
Message-ID: <a5dab740-690f-4cb6-ad5f-d6f916716ab2@intel.com>
Date: Mon, 17 Nov 2025 12:43:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] test/kms_color: Select atomic commit if display is
 configured atomic
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, 
 Karthik B S <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, <uma.shankar@intel.com>
CC: Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20251113153851.2428277-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251113153851.2428277-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH3PR11MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0e35bb-ee63-4006-3102-08de25a8d81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3pCekNnenl6Qk41SzRYN0NlSGVvd2IrTDZQbGFmU0oyVjBTcTBsR2hFcnpW?=
 =?utf-8?B?dDJRWUllczVhR2hhc1JtMWdlc0ZKcWNhOTZVdjJ2SlhCNTAybjNma3Zad0pu?=
 =?utf-8?B?NTNCekVuZldsMjFYT21rTVRCNU1hNDczNWQwenhaQ3FsSnZaSVRyKzQwbis0?=
 =?utf-8?B?Tlg3M3lETm9UdjNaZ2VWYXExWk03NzJ4Uy9TSHVhU3BucFQ4ckZWY2FoaFpD?=
 =?utf-8?B?QjZsdUEzNGZOYkt2dmVaZWZtUWVIeUdQVkdVQzhkMzBxeEZOdTI0ODljZ1Fm?=
 =?utf-8?B?MTEwREhaME50UmdWalUvT2JENzNTc2d3RkFHaWJKNEdJYUxTVEhNQmhGM0pP?=
 =?utf-8?B?ampCbnYzSEltNVA4ZFlKQklkNXprbFI5QW5nOEo5dGh0QnE1YzNrZGFFYkNk?=
 =?utf-8?B?RHJYRHhyTEsvVTgrd1BiODRCdTh4RFBhNFQrUzFGL2lXZnpwZjZuZWpaaDBy?=
 =?utf-8?B?ME4yWkl0U3hoSXpEcG1Ba2hNVVZOakNvTmt0ZXhmd3plWUFETTJLdUpkUDhT?=
 =?utf-8?B?NXFkZHE4Z3E2S2R1MXVvcDBHdFU3anlrZHlGM25YMmhHamgyRndEdzErcnNo?=
 =?utf-8?B?RUJBTEViUFJ5RTQwSktPcDhiUWFtRjkxZm5iVjI4S25INVZwc2t1MUIzTWdv?=
 =?utf-8?B?RGkvWmhaUkxuRHN1RjVpQU5UOHQ4c095QmFFVWdPR0x0YXJzaGNCaGdKMndP?=
 =?utf-8?B?R2tBZWNXMzcxek9tR2xJZXV4WXBtelBuU0o3OE5vWTVqdzRNa0FOWHpqSHIx?=
 =?utf-8?B?ZUlJNXE0MmZybkw1RlhTcm5FOG9jU3JUK09GTU55Z0R3c3JEZzRERkczSFcx?=
 =?utf-8?B?bERnSDM0T29wb1FRYisxQTJkMVJMdFZKRXF0ZWxpMWxCY1RZK1ZOajBPc1Uy?=
 =?utf-8?B?aEl6RDF3aS9XZ0U2MkZDRWtIZy9YMlU3eThYcnhmdHl3anFKNDc4V2RVbGsy?=
 =?utf-8?B?dy96RzRkK1BjNDhSeFBHbUlFK2ljWkw0dkljd0pReUtRZzlDWjRZYit0STVU?=
 =?utf-8?B?VndicDM2RHp5OHlrTTFjMXRnR3g4aXhCRnh3Z2FRK2xaZzZrZ094dlFMN1o0?=
 =?utf-8?B?SGk3WEVtWWNvd04rK3NqVXFueEFIMUpxa2NSbUN3bXFOV09SWHNsRW54Ny9S?=
 =?utf-8?B?OVZRUGVqRTdkZklObmVST1VidXhjU296enB2OFhsU1BMMTN6enVtRWp0ei8w?=
 =?utf-8?B?WkJqS0xPZTFHK25YNUZiN0pJalNGWk52cnJPdkxGa3BhbUFCOWpaMkVsM0lW?=
 =?utf-8?B?cVVOcVI3bFFSR3JVRjhyNGVDNm9GR0ROa0VrYUc4YXIwdVdISWxzR1hJQVh6?=
 =?utf-8?B?Wm9NUGZ2TXlJRFdxOG1CWjhJWXBmSW1HZUpyYU1ZOE5MbWxlMDh1MnBnalJ4?=
 =?utf-8?B?aWZvZFl2NnAyM2RzSExzN3BPRWVsSmVSSTI0UFkzS1FzM25uQkFTVmJXSTl1?=
 =?utf-8?B?TGpULzNLSWRuMHhGNStWV0podzFYYXZSVThEcGwwbldiOFg4UDdvV3RvM2d6?=
 =?utf-8?B?eVhaa1BGb1dIZlN6cFRJQTM4cVh2VzJXcTdQTGZtajNHUitwUGNjcy9jVW51?=
 =?utf-8?B?RVY5Z2RaUXhvNkQrcXdsWExUN1FWQVl0UDJkbFFDMXhUUHo3dG1CMDMwUE85?=
 =?utf-8?B?b2ZhL1I2MVVGd0x5QW9OUE56TEQ4YWpwaTZTNUhGQ255U05ZY3MrRy9pOXFB?=
 =?utf-8?B?czlYUHlSVkNQSkNwK0gyYlp3TDFJc1dUa2tMUzZTT3RvRjRVS3laUEZZTWtF?=
 =?utf-8?B?ZEw4ODdSWlloWnErQTR2REpMaURoc1NaVW5SaDIyOW03ZEN2cXd2dFhJVXl3?=
 =?utf-8?B?WTlHM2svZ0QvSnNZZnJyWERUV0JzVlZiSmpERUdueDByY2FmMkNRWGNJdHJC?=
 =?utf-8?B?SEcxbjZWUlhFV0lRNnhzbWVUQy9sNlZyYXBOSFk5KzY4N3BYUGlmODNFOFVK?=
 =?utf-8?Q?NpUMeSMl9hgFF+OLvOD/KjQhdIBLyTdt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDV3UHp1anMxMjZyNzVkZ0o3c3Y1ZW1qL0o0K2pkMHl6M0hZVUVJK0ZuTnN5?=
 =?utf-8?B?eFVkbWgvaTVKYVY2WVhpZHVMbmwwUnFDM01oaWIvRW1XR1RhWUlKRUlIRDJQ?=
 =?utf-8?B?WldrM1VCL3laMnNlZ1ZNM0lYYjJiQlZjM1ZKQjNJd0Ivd0R6ODRUOEJzaG1R?=
 =?utf-8?B?d1V5ejdGWU5DVTljeExpbnpWeDlCMWlEL3I5WW4wOEE3TC9nbFRmVEw5YzJ0?=
 =?utf-8?B?WCtBTnNGNk42cU5kWDV0WUVZZzFnZVgzVzVYWm1qNUJxSFhha2poU0VURVZD?=
 =?utf-8?B?TVE1ODFiSUs5b3hUREFqL1FKN2hwaFczdW1pOGN4M1d3SUFveDEwY0RCZ0Z1?=
 =?utf-8?B?eDY0RSs3aHM1ZUwxRWxWUHV2S3RpTnJ1ZXYxRTZCcVZyc2V6aTVNcDJwcVFY?=
 =?utf-8?B?VHhVaGZzVnRqYXpGNXZZbWo4TFZOemtiYlVDMmh1T2xUMzNTY1MycUhIRmpw?=
 =?utf-8?B?MFR3d1FUZUNqRTJvakhZd2xyQXdGa0RQSlB6NFNaTFNWUnFDaWhDeGNJTXha?=
 =?utf-8?B?cTY1bXQ5dE0zbWZsc1B1WGhoOURRQWFiYzdvSjN2ZFJtZndpMGU5NlF2QmJi?=
 =?utf-8?B?MVpXaDJvbTRFU0hEL3ZzWm1hVHdUUWxYVXZyUVFIVGw2dUxkdSsvSlBJNmpT?=
 =?utf-8?B?OFlPYnFoV3JpcStZRFhZek80U290OGQyclVvYVM4OXdPZUlGa014ZHBKZ2tE?=
 =?utf-8?B?TGRjZ2NBSjVaNi9mZk9ReXJKK3dTYTZNamwzc0J6VHI5Ri96NllteTFiZXF3?=
 =?utf-8?B?WXdtTEJFVklCNXlOQ1NRVTNCMGlIVktiSjljTWxOc21IR0ZHd1pWY2ZBVzR2?=
 =?utf-8?B?QWhQUUx1WStXT2p2clFrakdjdE1XQXlCMjY2cnJqSWpsdzhQSlRZaUhuREc3?=
 =?utf-8?B?R3Vqa3ZtU1ZBMGh3SnZObGhDaExXRGc5WFhWM2tZZmlPZ05LVzBuS0RxdHRz?=
 =?utf-8?B?RmpNWG5UbXhOZVZRUXVxSHdjL0ZJZmMwc2o5VnVaSFl4NHNuTnFHQkh0WWM5?=
 =?utf-8?B?VVgrdmIzbG5nQzBSVUtwME9SanFwQmJRRk80QnJJRG5mU2toZWRaYjZLUXBu?=
 =?utf-8?B?SW0vS0w3c00xZFB2RFlzRXZINjBpcmtIWEdibVpjUHl3MklYdW9DdVI1MG5T?=
 =?utf-8?B?RXk2UG5KM0dXeWtVcnZZQnlMSktCa25FdFBlZHRGcTBKN1NISU54RGFWTE5w?=
 =?utf-8?B?NXM5cnEvT1FQZWlaTXo1eUpoZjVpaUNxQ1BSbnd1cXlSUzlmbnNqQTN5cnox?=
 =?utf-8?B?Sm1FbFdJSndQSWRDOXYwMkFaMkFKYlRQcDVQU0hXZXV1V3grejA3b05mekU3?=
 =?utf-8?B?aTF1cWNoc2FYVkF3TTB4bHhBd2F4bVRLMVhNM0F6aUtxSHBPRnJSa0N3NEtu?=
 =?utf-8?B?TTdzUjNnYWJpamUwSzJnRmxxZmE4RXVtTjJtQnZ0bWdFSzJ5RlNVVHBEMUhI?=
 =?utf-8?B?Z2pEa3NhckJiZ01BaVU1UGlJYkpjM1hXMThXcVN0L0Y0WDBjc1VheDY4RDN1?=
 =?utf-8?B?Zk5PdU1DczhlOGdLTFZpMmR6aU51RjRobHJYL1l3UWk5cGRpZFpWaGcrU1Fj?=
 =?utf-8?B?d2RYMFVOd0NneW1jY1F0RXRYZ1FYRXJKN2NzSFNDblpLYk5pUXZkWEhpTHRv?=
 =?utf-8?B?NlZKclg4L1ZBL1pnLzhUaEF3OEtETytJM2VDU2RPcnlqM2p3THp1Sm04aUFK?=
 =?utf-8?B?NFNyWG9YKzFDNm5FZnBvdnZVcGJiOWJJbUlUTjZ6UnNjckdRWFIwWktGc2Ji?=
 =?utf-8?B?cFVTc0ZsWnh6YUI5TUZyWXI3QVlLTHc3eU5kWVhpZ3RMUk40MkJxcVVkOCtw?=
 =?utf-8?B?YktmTGcrMXJxZFpMakVsQi9RRlVZdXIrOEdxbk93am0zOVJxQlZaNkl2aEFn?=
 =?utf-8?B?VXZ1cmdpTTIzbU9SQmFnd2FFRE1NU3ZTUElBNE9Kd1ZpRlJ5SWl4a3NwOVgx?=
 =?utf-8?B?bjRldnhXQlFKaVNuclRoSmNEdkVRUExKUURhOU9wejRTMkUzais3S3FPdTdq?=
 =?utf-8?B?aVVTNVA1ZEdWRTNQRVMrL2QrSTZ4eU5CbXFjS1NlS0doODFWRVN1SVJhUjRQ?=
 =?utf-8?B?NExadGV6bWxmMGRLZi9MZk1NY1lNdlF2dExGdG9xVDFJUE53aDRjQ3pBeEJa?=
 =?utf-8?B?SnZXSnBYb2VoYlUrem1MYTFKY3Y3cDAxV3Q3MVBySGowY1k0NG5OWnlaamZ1?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0e35bb-ee63-4006-3102-08de25a8d81c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 07:13:44.7407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSuERqACgbB/ZrWrCzYd4w7COfDc1AsmhtvqvjyLFX1+RaEiefsEwUvfgp6HeLYTG6d9aiDQb5eSPinLt0ie+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8436
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

Hi Lin,

Long back i had floated similar patch 
https://patchwork.freedesktop.org/patch/254752/?series=50539&rev=1
which was eventually *not* merged.
On that patch I had got feedback to switch to atomic since there's no
upstream driver supporting color management props that doesn't support 
atomic.

@chaitanya @uma any feedback on this?


On 13-11-2025 09:08 pm, Jason-JH Lin wrote:
> Update the test to select commit type based on display configuration:
> use atomic commit if the display is configured for atomic, otherwise
> use legacy commit.
>
> When a driver makes use of gamma_lut, degamma_lut, or ctm properties
> from crtc state, these properties are applied only with atomic commit.
> This change ensures all relevant properties are properly synchronized
> to crtc state during testing.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   tests/kms_color.c | 47 ++++++++++++++++++++++++-----------------------
>   1 file changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index c424083b7fd4..0520c2b3bbbd 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -125,12 +125,12 @@ static bool test_pipe_degamma(data_t *data,
>   	disable_ctm(primary->pipe);
>   	disable_gamma(primary->pipe);
>   	set_degamma(data, primary->pipe, degamma_linear);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	/* Draw solid colors with linear degamma transformation. */
>   	paint_rectangles(data, mode, red_green_blue, &fb);
>   	igt_plane_set_fb(primary, &fb);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_wait_for_vblank(data->drm_fd,
>   			    display->pipes[primary->pipe->pipe].crtc_offset);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> @@ -142,7 +142,7 @@ static bool test_pipe_degamma(data_t *data,
>   	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>   	igt_plane_set_fb(primary, &fb);
>   	set_degamma(data, primary->pipe, degamma_full);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_wait_for_vblank(data->drm_fd,
>   			    display->pipes[primary->pipe->pipe].crtc_offset);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> @@ -156,7 +156,7 @@ static bool test_pipe_degamma(data_t *data,
>   	disable_degamma(primary->pipe);
>   	igt_plane_set_fb(primary, NULL);
>   	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_remove_fb(data->drm_fd, &fb);
>   	igt_remove_fb(data->drm_fd, &fb_modeset);
>   
> @@ -215,12 +215,12 @@ static bool test_pipe_gamma(data_t *data,
>   	disable_ctm(primary->pipe);
>   	disable_degamma(primary->pipe);
>   	set_gamma(data, primary->pipe, gamma_full);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	/* Draw solid colors with no gamma transformation. */
>   	paint_rectangles(data, mode, red_green_blue, &fb);
>   	igt_plane_set_fb(primary, &fb);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_wait_for_vblank(data->drm_fd,
>   			    display->pipes[primary->pipe->pipe].crtc_offset);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> @@ -231,7 +231,7 @@ static bool test_pipe_gamma(data_t *data,
>   	 */
>   	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>   	igt_plane_set_fb(primary, &fb);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_wait_for_vblank(data->drm_fd,
>   			    display->pipes[primary->pipe->pipe].crtc_offset);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> @@ -245,7 +245,7 @@ static bool test_pipe_gamma(data_t *data,
>   	disable_gamma(primary->pipe);
>   	igt_plane_set_fb(primary, NULL);
>   	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_remove_fb(data->drm_fd, &fb);
>   	igt_remove_fb(data->drm_fd, &fb_modeset);
>   
> @@ -312,12 +312,12 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	disable_degamma(primary->pipe);
>   	disable_gamma(primary->pipe);
>   	disable_ctm(primary->pipe);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	/* Draw solid colors with no gamma transformation. */
>   	paint_rectangles(data, mode, red_green_blue, &fb);
>   	igt_plane_set_fb(primary, &fb);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_wait_for_vblank(data->drm_fd,
>   			    display->pipes[primary->pipe->pipe].crtc_offset);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> @@ -334,7 +334,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
>   	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
>   					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_wait_for_vblank(data->drm_fd,
>   			    display->pipes[primary->pipe->pipe].crtc_offset);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> @@ -351,11 +351,11 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   
>   	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
>   					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	igt_plane_set_fb(primary, NULL);
>   	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_remove_fb(data->drm_fd, &fb);
>   	igt_remove_fb(data->drm_fd, &fb_modeset);
>   
> @@ -384,6 +384,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>   	uint16_t *red_lut, *green_lut, *blue_lut;
>   	struct drm_color_lut *lut;
>   	drmModePropertyBlobPtr blob;
> +	igt_display_t *display = &data->display;
>   	igt_output_t *output = data->output;
>   	bool ret = true;
>   
> @@ -399,7 +400,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>   	disable_degamma(primary->pipe);
>   	disable_ctm(primary->pipe);
>   	disable_gamma(primary->pipe);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	/*
>   	 * Set a degama & gamma LUT and a CTM using the
> @@ -411,7 +412,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>   	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
>   		set_ctm(primary->pipe, ctm_identity);
>   	set_gamma(data, primary->pipe, gamma_zero);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
>   		blob = get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
> @@ -466,7 +467,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>   					  primary->pipe->crtc_id,
>   					  legacy_lut_size,
>   					  red_lut, green_lut, blue_lut), 0);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
>   		igt_assert(get_blob(data, primary->pipe,
> @@ -493,7 +494,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>   end:
>   	igt_plane_set_fb(primary, NULL);
>   	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	free_lut(degamma_linear);
>   	free_lut(gamma_zero);
> @@ -572,12 +573,12 @@ static bool test_pipe_ctm(data_t *data,
>   	igt_debug("color after[2] %f,%f,%f\n", after[2].r, after[2].g, after[2].b);
>   
>   	disable_ctm(primary->pipe);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	paint_rectangles(data, mode, after, &fb);
>   	igt_plane_set_fb(primary, &fb);
>   	set_ctm(primary->pipe, ctm_identity);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_wait_for_vblank(data->drm_fd,
>   			    display->pipes[primary->pipe->pipe].crtc_offset);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
> @@ -586,7 +587,7 @@ static bool test_pipe_ctm(data_t *data,
>   	paint_rectangles(data, mode, before, &fb);
>   	igt_plane_set_fb(primary, &fb);
>   	set_ctm(primary->pipe, ctm_matrix);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_wait_for_vblank(data->drm_fd,
>   			    display->pipes[primary->pipe->pipe].crtc_offset);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
> @@ -600,7 +601,7 @@ static bool test_pipe_ctm(data_t *data,
>   	disable_ctm(primary->pipe);
>   	igt_plane_set_fb(primary, NULL);
>   	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit(&data->display);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	igt_remove_fb(data->drm_fd, &fb);
>   	igt_remove_fb(data->drm_fd, &fb_modeset);
>   
> @@ -689,7 +690,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>   		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
>   		paint_rectangles(data, mode, red_green_blue_limited, &fb);
>   		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   		igt_wait_for_vblank(data->drm_fd,
>   				display->pipes[primary->pipe->pipe].crtc_offset);
>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
> @@ -698,7 +699,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>   		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_16_235);
>   		paint_rectangles(data, mode, red_green_blue_full, &fb);
>   		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   		igt_wait_for_vblank(data->drm_fd,
>   				display->pipes[primary->pipe->pipe].crtc_offset);
>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);

