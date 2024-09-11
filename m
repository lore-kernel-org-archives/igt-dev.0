Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4F5EE498D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 10:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9105910E7BE;
	Wed, 11 Sep 2024 10:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIRT7ygy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990E10E7BE
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726050472; x=1757586472;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=fTHFQjJG5ficWMY/WXvqXKUsZyBQx22xQhA2oCBon3E=;
 b=JIRT7ygyyZYjqushqLfTErRwEbB9uYx6slPjZPh54/o+a8z6G4+0j8Vr
 szvKADnUBbeBXnW2Yc6S/1bDW8zBWS+UUOdfYoYY2vTfUzt+zLMRQAOk5
 4K56AbecZZDnTb+o55q2u6Jsy5FGeFeNnNr9VVMFb2gKp0JRyh3W58kia
 YYCQ1Y2NVAyKNo1u3tG/mGxNm1sSTdBll69scAbVb4aAnm85Oz+kfG8qp
 g7POIAyj5ND5lZWP2QHLGqwWvn3ZX7OPAfq06ddtC/OqwG+HghpXT9T1Q
 WY+JYLoLP7S76ebK1Aaj1eYyWMUfMLWTJxnJEBANjpg5se/ddsbdYbKeJ w==;
X-CSE-ConnectionGUID: gY9xfE7zQ1Wqk5wbyuYCGw==
X-CSE-MsgGUID: HYh3YzBpTMi9uzxDwEwMIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24664456"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24664456"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:27:52 -0700
X-CSE-ConnectionGUID: TO5JxgXZQiqpmNMtFwauVg==
X-CSE-MsgGUID: 061OSZMSSgevpHScOaTu4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="71459584"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 03:27:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 03:27:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 03:27:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 03:27:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 03:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChHeQpy0aBw1jvSUM9A+Q68V+A+orUUKk5MHr9hhomy6nygOn/IPUSdrtmpXmNmBocjh1FWnN72moBGBQSIdvrUT3kCUsSy89Pl91toSE8NyZK7vV/Sw7vuLUgkO/W52v7yqbgbWArZJwogXZ6xrQ6NpTSgA358uJONhIIFOpn2t1sULmlLFrNlwMFKvccdwzwABprAUA5dUnYaF1uacT6ZZ1ueUPunaurb6dJyt5CpDWSSzOdGElhzEoNigZuRYssMRx+8TEUu91shmfRBvOu2egYYANUrjQxyFSJ40WjAoixVOhTCltPx/WphLwJqEikmAjafoWN6azhi+4lsoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3b3fztbifisLyFN0KoSc1hN6B2yMYsc0kCzOqiwpqNY=;
 b=cHo4Cf95DpPb+25THban7BVpCLcz+uDijYDmLDddw6ZQO4IV5hsgFgu/kwWS0RI9d17YdSKhrtv+E0kZHVlN3Bji5rHXibnOWZqrZClCf5ffQWD39ZdDMVDE9ThWUyo6r2lvgU4yGI9EsZwOifav8UlOizk61BoWcsdor7v6jBaNNSjVyUaRQUBmTtDySoQZQ0Hyn7Y0GNE5BhlsJwrcLFWnzFztgg3frSeLtDKPM7xo+llLHO7RZiOp8pNW1N7wN+C/Ms5FJZNE7IYy6+gpQzFl4tpAdGj61YSmLl9/LjTDffPi6jLjbWFOV4cptO/qr6IF1n6cs8cd3UCHBeBWhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 by MN6PR11MB8101.namprd11.prod.outlook.com (2603:10b6:208:46e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 10:27:49 +0000
Received: from IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147]) by IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 10:27:48 +0000
Message-ID: <fafa5b7b-7bfe-4b9d-b257-4f43975cc5c6@intel.com>
Date: Wed, 11 Sep 2024 12:27:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_core: Refactor libpciaccess init/cleanup
 wrappers
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Lukasz Laguna
 <lukasz.laguna@intel.com>, Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Chris Wilson
 <chris.p.wilson@intel.com>
References: <20240829075811.87076-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@intel.com>
In-Reply-To: <20240829075811.87076-1-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: ZR2P278CA0074.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::8) To IA1PR11MB7824.namprd11.prod.outlook.com
 (2603:10b6:208:3f9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7824:EE_|MN6PR11MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: d19cad9b-fb58-45b4-36cb-08dcd24c6211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGR6bjlpMFdhbGprem41RlBSUmpNNVE1VDNNUmR2WnB1OSsxSytVMllNNDhz?=
 =?utf-8?B?ZGc3b2VxTkdyOWZOY09qanFvdURoVHM3ZzFSWllYeVZEQmJtNUdreWpjbGN2?=
 =?utf-8?B?bjhoT0FYMXlreGpRRGNUa1VxZGVhb1h1eHhtekFFbG91NmNrSUVxa09CaEt3?=
 =?utf-8?B?Wm11VmFCOEg5dGJRZkpDcHlWNklFVGM5R2pHb2lMK0tzQk1lb0lQUjZudWhS?=
 =?utf-8?B?YlU4R01tZVZlZ3JFbHFITngxaytjc2hUMHJmMU1GSnpNYm9HTzBUTDVPVWpz?=
 =?utf-8?B?S0l2d1lWU09sMTFxWU5oVUFyQ21hbVBzc05oK25UVHpoSTI4bk12WEZUTXk0?=
 =?utf-8?B?Qi9WMzBaZjRCTis0YnN4d2t2bEI0U1drUGlpbGpEN1ByYXMrdU5uVkI0Mm9U?=
 =?utf-8?B?ZmdmUzFXYTlxSHNKUkFTYytYUXNzQkE4MVdRK0UwSHplREh1ZHJnaFd1TTls?=
 =?utf-8?B?QkowLzlua3hvS3ZLNWJ2T05xajY0QVQ2bGxMZW9qcWhSK09aSFZnVVltVyti?=
 =?utf-8?B?TzR6M29KaWNSNFNCcXVVMXhrc2s3YVd4cEhUdEhuOTIrZ2dqdXJCV0VBWnEw?=
 =?utf-8?B?NXk0MGt4K0x3Ui9kU25YOXhDcWZqblhXWHowWnNEV2YxcXhjeTFHTTR5d2hk?=
 =?utf-8?B?aTJZekZqdDlRaXVvNU96aGdVdk5LK0FnZUVNenlJNDI4RjFTVXVEbGVlTGli?=
 =?utf-8?B?ZHZINnlEM1NkOTEzSGFXQzdWUFN3cG8ydXBwb2FEamdzSnhYNlJTY2ZQbk9o?=
 =?utf-8?B?WW45L3djVlBESnQvWlhQYlE1R2dKQWlRZFc4a1Y0TXIvWUZGaGxmRjZYeUxu?=
 =?utf-8?B?Z0hPVXFaUWdyMjlTUkwwVVZDY28yb2ZQNy9QanduNlNVWWZLajZBMGwxa1kx?=
 =?utf-8?B?RFNTYUZ0QUhnWkN3SHlZUW1WZ0lnL01uMFJMdjdxakp3K2Y3TnRxazl5b1gv?=
 =?utf-8?B?QmJ4Y1dsWHVtYkd0dlYwc01HU2JzRGRxNjE5eXEydkZ6cG9WcktDeWFnaW90?=
 =?utf-8?B?dFVDNTFNYUpBUmRXemp1ODhybm43ZnNCZGdiU2prSUZ0RTRwakI4UnFWakYv?=
 =?utf-8?B?WG80MCtxcGpxL2dwRks2MjAzVWErR0VSRFdpOVFIZnJXdFBaZk1laFFHNDd5?=
 =?utf-8?B?TGNwVDRqMUdLcW4ydFZvVDgrT3oxL3RpRlVhOVRGTWFWTXFzcmYzbFB0U3pT?=
 =?utf-8?B?Y0E1MUhQcytjSjh3R3E0VGhOeVVUQkJvYmxqQ1RkTUN4bjhvZUdOK2dOOWJF?=
 =?utf-8?B?WG5UTVhZQUlJcWszdUdOK1hNN3Z3ZnFrQmZKZVZod01oV3Z3YVZlb3IyOEV4?=
 =?utf-8?B?Ykdpdm84aEhzWFBoOC84cGRacTFsRkFhaXU4YllRY1V4Rys1YzVQeHF2TlNW?=
 =?utf-8?B?U0w2SEpCd2tFcm5hL2puNkM1Z0lrbjhVL1IydHBaNENackx2UWE3RjB4WGta?=
 =?utf-8?B?alg4ZTJHdHkvK1JOME55TFFIcDVvYVJLQmhsN1pvQk9laUloVHFBdXBqMkFH?=
 =?utf-8?B?bmE2cVBoMkFDSmY2ZCtoVlYzQjlQRkZ4Y1pZa2tMKzhCeFVJMFVuVW82djRm?=
 =?utf-8?B?MGs2Qm5sOG5sVm1oVGt1Z0lTYjdweURTb1VqWEY5UCt2NHZuNHNNbVpHejBt?=
 =?utf-8?B?R01Ha3RScWxhK3lGSm1HYzBSbkEwdWk2OXprTXhIMy9UVEZIRDRaMCtqbkM0?=
 =?utf-8?B?c1ppOWRuTlVjcW8zREJJblgzdzJOellRVmlxT2ZXUERDYkJJaDBwU05pTkps?=
 =?utf-8?B?NVUzVGRhL2dKcFJZUW40RWhZUUlkTXJmYlFBaGVwTXcvamtPRlV1VmlOelpS?=
 =?utf-8?B?Ti9KR2dlMW94MmFiUzZsUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkh6cVk3VklhY0xaZE5jZzYyb1hyLzVsTW4rb0JqQnBJa0lqM3owV3U1ejE4?=
 =?utf-8?B?Y3J0eFltQktLV1lvemNMQ2VDUjEyME1KMnF2ak1iekVERzFxRWlVZGRQV1Nq?=
 =?utf-8?B?V0ZvTEtiSXYyZDdrbnd0dEliZlV2V3prVk1DSGNwOFBJUnEramJTZ29WMkUx?=
 =?utf-8?B?czV3ZXBIRkVrR1dxRDNWcW9CS3NJaUgxR1pRbEtmTGEzUklISG5MUU5LZHVB?=
 =?utf-8?B?WXZpU0lsZkZpSXBNdEs3Rjc4VDVPODFiNjdBTHpYaC9tVGRsd0xNOGMzeGhn?=
 =?utf-8?B?V3VxMnA4WFI0L2dSTTQzZmlyNFRuYWl4VXhhZVQ5NzZEU2dWRjBpMFl5dkRM?=
 =?utf-8?B?eEdENjYxVVF4U0dvL2JyWUY2Y1VuZXBmbSttMUQwcDIvRnlLMDgxYU1ZT0M3?=
 =?utf-8?B?a1MzUjVwWXEzdk5DbHBpWk4yYXJCZHVLRVRyQmNiVEUrQUQydXlGVmlWTHpF?=
 =?utf-8?B?WUptWGt5VVgxdS9WOG45dnVKS2xadmQyUHJrNWU2WkVQbUphM2kxVEthMkZm?=
 =?utf-8?B?NktrSTRmZEl2K3NGZzNEbjVjWHA5UitNeFBjOThDSloxbnB0L0UwMmF3Y21i?=
 =?utf-8?B?Z2ZtcEJuMzVHMzFoSnk2OVFvandMQ0JpTUljdG0zZDgxbllEazhYMW1BTVBq?=
 =?utf-8?B?WkhiMkV4QUhidUlkdkxyNzhLU2g3eVlvN1BRb1hEUWJuNnNiaTBNYXo4dmxs?=
 =?utf-8?B?SVJlRnBtd0lCbC9tWkdXZEY2OWwrVUpCMWpBZUc1QkpnUEtUSkY4YVcrcHkw?=
 =?utf-8?B?VHZuVEx1a2oyV3FKcHdvWWpUR2N0R05zaFFaTFZ6YldqbThZdEFQdHpaQXZj?=
 =?utf-8?B?T3ZRci9SRUNJWVVCaVV1aTUxY0NJSk1DZnhxbHJvR3RmTGkyTHVqWG5CUUFP?=
 =?utf-8?B?QnF4TW1STHVvVDcrTDdabDJuakExTmhjeUluYkFudHA5MU5KQ0ZCN09tOVg5?=
 =?utf-8?B?MEUvZFB5Uml6Y2dVSGkwNkRhRXM5OWxmdFl2MVdocjc1REZpeVFaZm5lclh6?=
 =?utf-8?B?U1NncTE3K0poYWdSdldNZjM3OFhsdjNXdkZkbVZTbHRyUmJTUFBMMnFKQTFH?=
 =?utf-8?B?bG9wMUFOSHh2dU5aM0c4Y3BtakdRdkQ0amFreWVEbzlaNXJCbFlWWmRPa2Zk?=
 =?utf-8?B?T1FqZ3ZJTmg1VkNyYmNZNzN4eUJIQ0pTb3p1bzN5dGNOMnZIeHlpek0rYUFT?=
 =?utf-8?B?QXVNVnJ3akNHWHg2VHQreWd0N3JkRnJ0bWZPZDV0RUNQZFgvZ0x4Mjg3SVcz?=
 =?utf-8?B?YWdTbFhodDRpdWhLSHpiL1BCemJxeERhQjhJdWVKYU9CYllnN0pMcW5yOEZw?=
 =?utf-8?B?Q0cwWmxFLzlFT1JEWTljRmZkUUY0WjhoMG9XYmgwd0Q3TW1CMjFYWUszdlBQ?=
 =?utf-8?B?ZWhSWXR4V1B0Qlc1bTVxUk1DSzBmTk9TcTlFem1jM0xjRlozRmszdlMvMGpx?=
 =?utf-8?B?RHRpait6dWlYUE5yRzFlTWJFVDluSFBvc3RhRDZBYUxicmJORkdkT29SOXVa?=
 =?utf-8?B?R2YyZktYdi9aYkxIVWNaejNqYTh1NEVwNEtnNjluWmR0eWlJN09BYjJTbkdp?=
 =?utf-8?B?ZEw2QXZ6NTFFWXNzVFBCR1ZFTTllOFhWMGhIWTJMNEVCT1RpL2ZQa0JvSldP?=
 =?utf-8?B?Zk9TTitiQVlpemxyWXpxYXZtMVdlT0xUMVA1cDBHSGMrVHRwaG9SWlA0WTBG?=
 =?utf-8?B?alN4YlhOZVg2cURENlhGWi9hS1p3WnZ0bldtdEVid2FoOHd6Z00wdjRUbzdw?=
 =?utf-8?B?T2RvN3ZWYUxMVTMyQldjaWtrc0ZVTDJ3UEY5b3RvQzQ3NUcvdDNqRmowRFYv?=
 =?utf-8?B?eXFqNXkvSkZ3bDkrUTk4Y3N0a2srZ2QvZ3hoSm5nTVFJL1dnZzRkNXEycUlt?=
 =?utf-8?B?eWladzduanlIUmlIU0Y1MWVrbHUrbFFqa3dXR1FZUHZrRUhSS2QzMHc0dEtK?=
 =?utf-8?B?UjMxYi9nMHlnQklnSHVsL2Vqd21YQW1TN0ZweXF2elpmYUFTTSs2V01jR1Jp?=
 =?utf-8?B?cWxsdG5VODFQTis3ak4yYmtwc2VPZGhhcldpVXZaZGJjdnJ2WkllRU1yRDBV?=
 =?utf-8?B?SUk5bWt4emJQM0FyckdONUQ3aTNTcGJUME0vaWRlRWZEamtCRUtTdzMrQy9O?=
 =?utf-8?B?NDE0MUxGWmRIcmJjSW1MKys2M1hzbVl2TU9QK2RMZWpQZHJqN1NBaHM4Yno0?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d19cad9b-fb58-45b4-36cb-08dcd24c6211
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 10:27:48.6620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhbMlQxhsLkPcl+jaBEmoMWbym8/m1r8GRX1HbBJQPVsTY/FLVrhaiEBhetsD5bz/6P6HRSFVIr207g/pHVCng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8101
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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

CgpPbiAyOS4wOC4yMDI0IDA5OjU4LCBNYXJjaW4gQmVybmF0b3dpY3ogd3JvdGU6Cj4gRW5hYmxl
IHJlaW5pdGlhbGl6YXRpb24gb2YgdGhlIGxpYnBjaWFjY2VzcyBnbG9iYWwgc3RhdGUsIG5lY2Vz
c2FyeQo+IHRvIGNvcnJlY3RseSBoYW5kbGUgZHluYW1pYyBhZGQvcmVtb3ZlIG9mIFBDSSBkZXZp
Y2VzLCBzdWNoIGFzIHRoZQo+IGNyZWF0aW9uL3JlbW92YWwgb2YgVmlydHVhbCBGdW5jdGlvbnMg
KFZGcykuIFVwZGF0ZQo+IGlndF9wY2lfc3lzdGVtX2NsZWFudXAoKSB0byBjb25kaXRpb25hbGx5
IGNhbGwgcGNpX3N5c3RlbV9jbGVhbnVwKCkKPiBiYXNlZCBvbiB0aGUgaW5pdGlhbGl6YXRpb24g
c3RhdGUuIEludHJvZHVjZSBpZ3RfcGNpX3N5c3RlbV9yZWluaXQoKQo+IGZvciBleHBsaWNpdCBy
ZWluaXRpYWxpemF0aW9uIG9mIHRoZSBsaWJwY2lhY2Nlc3MgZ2xvYmFsIHN0YXRlLAo+IHBhcnRp
Y3VsYXJseSB1c2VmdWwgYWZ0ZXIgUENJIGRldmljZSBjaGFuZ2VzLCB0byBiZSB1c2VkIGluCj4g
c3Vic2VxdWVudCBwYXRjaGVzLgpQbGVhc2UgQ0MgbWUgb24gdGhlIHN1YnNlcXVlbnQgcGF0Y2hl
cy4KCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyY2luIEJlcm5hdG93aWN6IDxtYXJjaW4uYmVybmF0
b3dpY3pAbGludXguaW50ZWwuY29tPgo+IENjOiBBZGFtIE1pc3pjemFrIDxhZGFtLm1pc3pjemFr
QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTHVrYXN6IExhZ3VuYSA8bHVrYXN6LmxhZ3VuYUBpbnRl
bC5jb20+Cj4gQ2M6IEpha3ViIEtvbGFrb3dza2kgPGpha3ViMS5rb2xha293c2tpQGludGVsLmNv
bT4KPiBDYzogSmFudXN6IEtyenlzenRvZmlrIDxqYW51c3oua3J6eXN6dG9maWtAbGludXguaW50
ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzLnAud2lsc29uQGludGVsLmNvbT4KUmV2
aWV3ZWQtYnk6IFBldGVyIFNlbm5hIFRzY2h1ZGluIDxwZXRlci5zZW5uYUBsaW51eC5pbnRlbC5j
b20+Cgo+IC0tLQo+ICBsaWIvaWd0X2NvcmUuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLQo+ICBsaWIvaWd0X2NvcmUuaCB8IDM2ICsrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMo
KyksIDE4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2NvcmUuYyBiL2xp
Yi9pZ3RfY29yZS5jCj4gaW5kZXggM2ZmM2UwMzkyLi40NzEwODk5YmYgMTAwNjQ0Cj4gLS0tIGEv
bGliL2lndF9jb3JlLmMKPiArKysgYi9saWIvaWd0X2NvcmUuYwo+IEBAIC0zNDE0LDIxICszNDE0
LDUxIEBAIHZvaWQgaWd0X3NyYW5kb20odm9pZCkKPiAgfQo+ICAKPiAgLyogSUdUIHdyYXBwZXJz
IGFyb3VuZCBsaWJwY2lhY2Nlc3MgaW5pdC9jbGVhbnVwIGZ1bmN0aW9ucyAqLwo+ICtzdGF0aWMg
aW50IHBjaV9zeXN0ZW1faW5pdGlhbGl6ZWQ7Cj4gK3N0YXRpYyBwdGhyZWFkX211dGV4X3QgcGNp
X3N5c3RlbV9tdXRleCA9IFBUSFJFQURfTVVURVhfSU5JVElBTElaRVI7Cj4gKwo+ICt2b2lkIGln
dF9wY2lfc3lzdGVtX2NsZWFudXAodm9pZCkKPiArewo+ICsJcHRocmVhZF9tdXRleF9sb2NrKCZw
Y2lfc3lzdGVtX211dGV4KTsKPiArCWlmIChwY2lfc3lzdGVtX2luaXRpYWxpemVkKSB7Cj4gKwkJ
cGNpX3N5c3RlbV9jbGVhbnVwKCk7Cj4gKwkJcGNpX3N5c3RlbV9pbml0aWFsaXplZCA9IDA7Cj4g
Kwl9Cj4gKwlwdGhyZWFkX211dGV4X3VubG9jaygmcGNpX3N5c3RlbV9tdXRleCk7Cj4gK30KPiAg
Cj4gIHN0YXRpYyB2b2lkIHBjaV9zeXN0ZW1fZXhpdF9oYW5kbGVyKGludCBzaWcpCj4gIHsKPiAt
CXBjaV9zeXN0ZW1fY2xlYW51cCgpOwo+ICsJaWd0X3BjaV9zeXN0ZW1fY2xlYW51cCgpOwo+ICB9
Cj4gIAo+IC1zdGF0aWMgdm9pZCBfX3BjaV9zeXN0ZW1faW5pdCh2b2lkKQo+ICtpbnQgaWd0X3Bj
aV9zeXN0ZW1faW5pdCh2b2lkKQo+ICB7Cj4gLQlpZiAoIWlndF93YXJuX29uX2YocGNpX3N5c3Rl
bV9pbml0KCksICJDb3VsZCBub3QgaW5pdGlhbGl6ZSBsaWJwY2lhY2Nlc3MgZ2xvYmFsIGRhdGFc
biIpKQo+ICsJaW50IHJldCA9IDA7Cj4gKwlib29sIGluc3RhbGxfaGFuZGxlciA9IGZhbHNlOwo+
ICsKPiArCXB0aHJlYWRfbXV0ZXhfbG9jaygmcGNpX3N5c3RlbV9tdXRleCk7Cj4gKwlpZiAoIXBj
aV9zeXN0ZW1faW5pdGlhbGl6ZWQpIHsKPiArCQlyZXQgPSBpZ3Rfd2Fybl9vbl9mKHBjaV9zeXN0
ZW1faW5pdCgpLAo+ICsJCQkJICAgICJDb3VsZCBub3QgaW5pdGlhbGl6ZSBsaWJwY2lhY2Nlc3Mg
Z2xvYmFsIGRhdGFcbiIpOwo+ICsJCWlmIChyZXQpIHsKPiArCQkJcGNpX3N5c3RlbV9pbml0aWFs
aXplZCA9IDA7Cj4gKwkJfSBlbHNlIHsKPiArCQkJcGNpX3N5c3RlbV9pbml0aWFsaXplZCA9IDE7
Cj4gKwkJCWluc3RhbGxfaGFuZGxlciA9IHRydWU7Cj4gKwkJfQo+ICsJfQo+ICsJcHRocmVhZF9t
dXRleF91bmxvY2soJnBjaV9zeXN0ZW1fbXV0ZXgpOwo+ICsKPiArCWlmIChpbnN0YWxsX2hhbmRs
ZXIpCj4gIAkJaWd0X2luc3RhbGxfZXhpdF9oYW5kbGVyKHBjaV9zeXN0ZW1fZXhpdF9oYW5kbGVy
KTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+IC1pbnQgaWd0X3BjaV9zeXN0ZW1faW5p
dCh2b2lkKQo+ICtpbnQgaWd0X3BjaV9zeXN0ZW1fcmVpbml0KHZvaWQpCj4gIHsKPiAtCXN0YXRp
YyBwdGhyZWFkX29uY2VfdCBvbmNlX2NvbnRyb2wgPSBQVEhSRUFEX09OQ0VfSU5JVDsKPiArCWln
dF9wY2lfc3lzdGVtX2NsZWFudXAoKTsKPiAgCj4gLQlyZXR1cm4gcHRocmVhZF9vbmNlKCZvbmNl
X2NvbnRyb2wsIF9fcGNpX3N5c3RlbV9pbml0KTsKPiArCXJldHVybiBpZ3RfcGNpX3N5c3RlbV9p
bml0KCk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9jb3JlLmggYi9saWIvaWd0X2NvcmUu
aAo+IGluZGV4IDA2YzUzMTRiZi4uMGQ3ZTk0OGE4IDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfY29y
ZS5oCj4gKysrIGIvbGliL2lndF9jb3JlLmgKPiBAQCAtMTUxOCwyOCArMTUxOCw0MCBAQCB2b2lk
IGlndF9rbXNnKGNvbnN0IGNoYXIgKmZvcm1hdCwgLi4uKTsKPiAgICogaWd0X3BjaV9zeXN0ZW1f
aW5pdDoKPiAgICogSUdUIHdyYXBwZXIgYXJvdW5kIHBjaV9zeXN0ZW1faW5pdCgpCj4gICAqCj4g
LSAqIFJ1bnMgcGNpX3N5c3RlbV9pbml0KCkgYW5kIGluc3RhbGxzIHBjaV9zeXN0ZW1fY2xlYW51
cCgpIGFzIElHVCBleGl0IGhhbmRsZXIgd2hlbgo+IC0gKiBjYWxsZWQgZmlyc3QgcGVyIHRocmVh
ZCwgc3Vic2VxdWVudCBjYWxscyBhcmUgbm9vcC4gIFRlc3RzIHNob3VsZCB1c2UgdGhpcyB3cmFw
cGVyCj4gKyAqIFJ1bnMgcGNpX3N5c3RlbV9pbml0KCkgYW5kIGluc3RhbGxzIGlndF9wY2lfc3lz
dGVtX2NsZWFudXAoKSBhcyBJR1QgZXhpdCBoYW5kbGVyIHdoZW4KPiArICogY2FsbGVkIGZpcnN0
IHBlciB0aHJlYWQsIHN1YnNlcXVlbnQgY2FsbHMgYXJlIG5vb3AuIFRlc3RzIHNob3VsZCB1c2Ug
dGhpcyB3cmFwcGVyCj4gICAqIGluc3RlYWQgb2YgcGNpX3N5c3RlbV9pbml0KCkgdG8gYXZvaWQg
bWVtb3J5IGxlYWtpbmcgd2hpY2ggaGFwcGVucyBlYWNoIHRpbWUgYSBjYWxsCj4gICAqIHRvIHBj
aV9zeXN0ZW1faW5pdCgpIGlzIHJlcGVhdGVkIG5vdCBwcmVjZWRlZCBieSBwY2lfc3lzdGVtX2Ns
ZWFudXAoKSAobWF5IGVhc2lseQo+ICAgKiBoYXBwZW4gaW4gY29uc2VxdWVuY2Ugb2YgbG9uZyBq
dW1wcyBwZXJmb3JtZWQgYnkgSUdUIGZsb3cgY29udHJvbCBmdW5jdGlvbnMpLgo+ICAgKgo+IC0g
KiBSZXR1cm4gdmFsdWU6IGVxdWFsIHJldHVybiB2YWx1ZSBvZiBwdGhyZWFkX29uY2UoKSAocmV0
dXJuIHZhbHVlIG9mIHBjaV9zeXN0ZW1faW5pdCgpCj4gLSAqCQkgY2FuJ3QgYmUgcGFzc2VkIHRo
cm91Z2ggcHRocmVhZF9vbmNlKCkpCj4gKyAqIFJldHVybjoKPiArICogUmV0dXJuIHZhbHVlIG9m
IHBjaV9zeXN0ZW1faW5pdCgpIG9yIDAgaWYgcGNpIHN5c3RlbSBpcyBhbHJlYWR5IGluaXRpYWxp
emVkLgo+ICAgKi8KPiAgaW50IGlndF9wY2lfc3lzdGVtX2luaXQodm9pZCk7Cj4gIAo+ICsvKioK
PiArICogaWd0X3BjaV9zeXN0ZW1fcmVpbml0Ogo+ICsgKiBSZWluaXRpYWxpemUgbGlicGNpYWNj
ZXNzIGdsb2JhbCBkYXRhLgo+ICsgKgo+ICsgKiBFeGVjdXRlcyBpZ3RfcGNpX3N5c3RlbV9jbGVh
bnVwKCkgYW5kIGlndF9wY2lfc3lzdGVtX2luaXQoKSB0byByZWZyZXNoCj4gKyAqIHRoZSBQQ0kg
c3lzdGVtIHN0YXRlLCB0eXBpY2FsbHkgbmVlZGVkIGFmdGVyIFBDSSBkZXZpY2VzIGFyZSBhZGRl
ZCBvcgo+ICsgKiByZW1vdmVkLgo+ICsgKgo+ICsgKiBOb3RlOiBBbGwgcHJldmlvdXNseSBvYnRh
aW5lZCBoYW5kbGVzIChwY2lfZGV2LCBtbWlvKSBiZWNvbWUgaW52YWxpZAo+ICsgKiBhZnRlciB0
aGlzIGNhbGwuIERvIG5vdCB1c2Ugb2xkIGhhbmRsZXMgcG9zdC1yZWluaXRpYWxpemF0aW9uLgo+
ICsgKgo+ICsgKiBSZXR1cm46IE91dGNvbWUgb2YgaWd0X3BjaV9zeXN0ZW1faW5pdCgpLgo+ICsg
Ki8KPiAraW50IGlndF9wY2lfc3lzdGVtX3JlaW5pdCh2b2lkKTsKPiArCj4gIC8qKgo+ICAgKiBp
Z3RfcGNpX3N5c3RlbV9jbGVhbnVwKCk6Cj4gLSAqIElHVCByZXBsYWNlbWVudCBmb3IgcGNpX3N5
c3RlbV9jbGVhbnVwKCkKPiArICogSUdUIHdyYXBwZXIgYXJvdW5kIHBjaV9zeXN0ZW1fY2xlYW51
cCgpCj4gICAqCj4gLSAqIEZvciB1c2UgaW4gSUdUIGxpYnJhcnkgYW5kIHRlc3RzIHRvIGF2b2lk
IGRlc3Ryb3lpbmcgbGlicGNpYWNjZXNzIGdsb2JhbCBkYXRhLgo+IC0gKiBEaXJlY3QgY2FsbHMg
dG8gcGNpX3N5c3RlbV9jbGVhbnVwKCkgc2hvdWxkIGJlIGVpdGhlciBkcm9wcGVkIG9yIHJlcGxh
Y2VkIHdpdGggdGhpcwo+IC0gKiB3cmFwcGVyIChmb3IgY29kZSBjbGFyaXR5KSwgb3RoZXJ3aXNl
IHN1YnNlcXVlbnQgYWNjZXNzIHRvIGxpYnBjaWFjY2VzcyBnbG9iYWwgZGF0YQo+IC0gKiBtYXkg
YmUgbG9zdCB1bmxlc3MgcHJlY2VkZWQgYnkgZGlyZWN0IGNhbGwgdG8gcGNpX3N5c3RlbV9pbml0
KCkgKG5vdCByZWNvbW1lbmRlZCkuCj4gKyAqIFJ1bnMgcGNpX3N5c3RlbV9jbGVhbnVwKCkgaWYg
aWd0X3BjaV9zeXN0ZW1faW5pdCgpIHdhcyBzdWNjZXNzZnVsbHkgY2FsbGVkCj4gKyAqIGJlZm9y
ZS4gVGhpcyBhbGxvd3MgdG8gcmVmcmVzaCB0aGUgbGlicGNpYWNjZXNzIGdsb2JhbCBkYXRhIHdo
ZW4gZm9sbG93ZWQKPiArICogYnkgaWd0X3BjaV9zeXN0ZW1faW5pdCgpLCBzZWUgaWd0X3BjaV9z
eXN0ZW1fcmVpbml0KCkuCj4gICAqLwo+IC1zdGF0aWMgaW5saW5lIHZvaWQgaWd0X3BjaV9zeXN0
ZW1fY2xlYW51cCh2b2lkKQo+IC17Cj4gLX0KPiArdm9pZCBpZ3RfcGNpX3N5c3RlbV9jbGVhbnVw
KHZvaWQpOwo+ICAKPiAgI2VuZGlmIC8qIElHVF9DT1JFX0ggKi8KSW50ZWwgU2VtaWNvbmR1Y3Rv
ciBBRw0KUmVnaXN0ZXJlZCBOby4gMDIwLjMwLjkxMy43ODYtNw0KUmVnaXN0ZXJlZCBPZmZpY2U6
IER1Zm91cnN0cmFzc2UgMTAxICwgODAwOCBadXJpY2gsIFN3aXR6ZXJsYW5kCg==

