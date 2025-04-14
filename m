Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2167AC369B5
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 22:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82E210E00A;
	Mon, 14 Apr 2025 22:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5BmDeC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094E310E00A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 22:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744669424; x=1776205424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=peWTs6bjdBLUsWmZpURl/j+kwLSdeEcBqs9zrH07y4U=;
 b=P5BmDeC8wxSBReCKF/TpxGgAx1bVuaSiZKc16wLt7x0nqIYwrp6LqxE4
 8PicFZimQnIFA9AYGBkfOWQCKBTtuw+kwNbeRRPJ5B+7Mum4rIgCyAzOX
 OlT6Vxpg1CkQR8s8eMLTfSH97N327qcBeKzftMwx14I5GQySR3as35mp7
 XCAL8dEQrYiSkwjjuSPtMwrYSqoCppQie9+K3osgZQeXY70LM6On4DdZx
 HhAJFhTygWbTVjCRdeDVRJy3j+d6zngsw9Bd5aU1WaQX0Lu+VaCt6fTTC
 Xkxpfsbqt5NHoJ6eqwEY47CVTG7D50NwOhnFKFXQUFI2a3g3nTHfb0I9h A==;
X-CSE-ConnectionGUID: wy+HyiYoTgWwmFVKbOqCMQ==
X-CSE-MsgGUID: 3kRr5tFlQMiV2QdF11+1hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49988701"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="49988701"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:22:00 -0700
X-CSE-ConnectionGUID: v3HZj7IYQD2snilg+ojNyQ==
X-CSE-MsgGUID: 8onVe9iZTV6P5FhI+W1qIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="160953431"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:21:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 15:21:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 15:21:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 15:21:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fplQ2S3niepp2QxvAG+EryhocjJLEEppCP3iOL/aqXXe/QLGYH8M41hzxd5EBtlls5UmHyJi+QQr1Gb+6wpnQL0gX9X7vlmyoR14S3VAcRKa2YjRnYoZ+aoHPXtzJ2QaRj22uM3lAOseAd5qpOYS0rbygZLEhiAYid0ogAbmCRsUgD4glcgOMk0bAwRqkPgjkEoCNXRxpKFCuvNMPi9tE63MPlHs1i6esB8Rp7Ji14HNeIOUw8fHixqyISsz8sGYrm2sywPNLTJiabqdp0HaQ4ZQGMyqs3494qadPqIqv38USH5H9X6gBtR4ztMarc3IqqEql0ZeWyuxZ/BaMKf3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBSKrLl3BLoZCQ9/zPZCUq2uO+dgkb8hls0hGG5JDLo=;
 b=sFwfsPW1xoZyTh/n8j5fbrthiwWIyf9HAupHaj30CRQo0DydvV/2c1OeVEuHdw8P+XaUugHNueL5U1ocexsjJyd+6K6uiXnMde50dmWbd9FG35lgQZ3Yvs0imJ+n47cswTWfu4rFFBtvq54ucvtJyHCZVCrHDCQ4QSeezxaoADZXs7+pkxMR4+w5JWiEeW1x6GAsFr0A/NIj+1N1MMG8mT4JHebDewYw6jN1dMYAJ7D/8Uyht4fK3bSJD8NAuxxH9PoJWaV0/NkU0MjKmsLqFnov218leMMSu2yyQq2yq1ofQSNUUdA6+R0nuqbL1xGjmhGYhoHCUzOFT4jf0uzYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 22:21:25 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 22:21:25 +0000
Date: Mon, 14 Apr 2025 15:21:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/6] tests/intel/xe_oa: Fix oa_tick_delta
Message-ID: <Z_2KZI6QzNqDJXdO@unerlige-desk.amr.corp.intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
 <20250408181210.1052760-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250408181210.1052760-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:303:b8::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: af529784-fc97-4053-4dce-08dd7ba2b1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajhFMXIzYmhLblFUSVQ3dU14aHpXbUs0YjJGNElBQVJ3QndoaW1vUTNEaHFi?=
 =?utf-8?B?NmZ2d2srSFY5OE94VEhhTEVLc2NlSDVvRTVNSUJQSVcxSWl5NGJELzJtb1pT?=
 =?utf-8?B?bEJpYkN1YUk2Q0tqeHdNNTRCMjVMemU2WVREWVJjd0k1MmdDVkg0aEpOZ2ZJ?=
 =?utf-8?B?VysyM3UwT3pJV3pReDc3U2dSVmVKTVVzN25CVDNBdEFFb3JCd0t6YWxpYWJ5?=
 =?utf-8?B?bmNoSnUvemNsTzltVmNCbHMrWTc5N3lrUHdVSDNSbUFrNVZaNDJJdjR5NVdD?=
 =?utf-8?B?c0F0aCs1QXY4b2ZZMWtncnFqTjZvYmlINVRLV0lDay83UUF1WTBmeGI4OEx6?=
 =?utf-8?B?c0ZRazBwRHZqcEJoWFhOQjdydnRzQUtKNHgzNEJ3ZCswckxiL0tDWUIvTjUy?=
 =?utf-8?B?TTRMeFJhMmdZUEt0RUU5Y0xzc0tNY0dpYXlldlA5OGsyVlpuYjZLUGtKTkxt?=
 =?utf-8?B?UmJzN2NJY3dhRkhkNzhxSTQrbFlwWGVsQkFjaFo3VXB2Ky92dk1DWnBTLytY?=
 =?utf-8?B?NWdvaHhWWkk2cXZSQW9hZFhYenp1eEZnL1RqYkFPU1hHK3c4dGhZek9sRzVz?=
 =?utf-8?B?VzVYRWFlb3BDd3h4N0VIU3BNdlVIdHg5NDg2TmtQcjNxaTNxd1duQlMxK1Z3?=
 =?utf-8?B?anlwKy9qaktWVzkzMHUwK082RFJ4YW9zdVN0NTAvMFdyaWxKeGFaMXk5dkxv?=
 =?utf-8?B?cTBPZ3ZPTkNjbkhnb2VBd3BlVHU3WXJFR0lDZWUra3ZWM0toNGFNazNqMm1l?=
 =?utf-8?B?cTZnb2NFa1g0RmM5M0NBVE05RzNDL0R4SzJ1alNSRFNBZEx5bDA4UzdQRjJq?=
 =?utf-8?B?SXJMQ1dFdHJqZ0tsNk45N2VEcDBYRjBzbi9qV3EwbmZTU0xORWtkL09HQkIv?=
 =?utf-8?B?VGRxRlBPaTZZVEc3TEhsdzZvaEZ5TWt0MWFiWWltTS83ZWhHNXJKSWxpZkEz?=
 =?utf-8?B?K2p5OU1BSE5ldTVqYVgyNllXZHUxbmtBNmtqcFYzSjl5R2x6T0srcXdjdGMz?=
 =?utf-8?B?aVZDOG1BMld0TkkzZkJDU3V5LzcrWFlLbEtkZDRxYTBLNlhkWFlnTnhMWWVT?=
 =?utf-8?B?RSt0ck5YWG1sd3dkQ1dQZExsLzdtK3NSSGlTWDFmOFcySkxNMkV0cm1kRkVH?=
 =?utf-8?B?d3J4Mm4velVNTmY3TFVtVmg3VDNQNEN6enZBcHFVWmhMZkc5aTR3bmdsamFL?=
 =?utf-8?B?dnBTRlpyMUp4Vk1YQi9HQUkwNEpPOEs3Mk5qeGk3dVJ1MUc3R29yM0twZU1I?=
 =?utf-8?B?SWxreVFFa1ZqWU5FQ25zRHlFMWZtTXY4bUNkaU1NS2ZJcDk4YkZndlZicFFD?=
 =?utf-8?B?aDBockdkNURaVnA3V3JZanFkU3FTZHNvVlNadnVTY254VXQxemZRSUpSblpk?=
 =?utf-8?B?QmFwL1RET3JXWkN1anFzVnRDaEZyd0FwdDRiVmkvRlhIS2ptV01xTUI2YjFi?=
 =?utf-8?B?L2RlZGJ6NVFqUFYza3VkVFRIYUducmpUaWRzK1E3S0lPcS81OVpob1cxUE9K?=
 =?utf-8?B?ODlubXRPcnNWdWMvU2xlemYrVG9tUkI2MGhJQ3ZrRTNEV1pyTzJLSmVWMmxH?=
 =?utf-8?B?eE1kbWJNcnorZWtoNE1YNFNlUERuY1BDTHhsUEJVTnBlZFBPcFdLOWx2dHJZ?=
 =?utf-8?B?OFdvS3A5RmNWczdHL1ZKemZ1ZTZRZjBrQWQ3eENzLzRXMEZlYUx4QnhUOU93?=
 =?utf-8?B?Qm42dUNyZ0V5R2ZGMkE1bnRLWHhJZlJPbSt6cFdoSEQ3TjY3VFVuc1BLd0JU?=
 =?utf-8?B?QUMyV3VMS095VGc3YWdGblIxVjVWZWgxZGZvMnhZNytJSTl3SmZhRWN0TjRj?=
 =?utf-8?B?SjhjcmtUQXgzRy8wczBTamk5K1RvSEJkbmk4Wnc0UWk4TnlsRWF6MnZiU0JG?=
 =?utf-8?B?NURFVzgwd2hzVE1EWFY4ZEhpNk1rVHBqd3JpWmpwYlFWUmtTdnFSa0ZZSExV?=
 =?utf-8?Q?UIjG7ox+DdA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3hDN1hOQ0VyK0Q4eEt6UlpzQTNlbVZZNmpQOGFCUXQrQzBBSjdPRUs0VjFM?=
 =?utf-8?B?bnlaZTE3NE9ibVptYUUxMGJNMld2N052QlV4dktKOVdJYWxaWFc0VFhTNFBq?=
 =?utf-8?B?YUo2cjZPRlg3V1gxTGFEQ1F4N3htVGdUcEcvTFdDMmpYTndFRk9mam1WdC85?=
 =?utf-8?B?aCtkcTZoTm1Kb2pUNktaVWZyVmpSdVNYUUxKK2hSQlphWWNUNnNYMldiTkkx?=
 =?utf-8?B?c2hPSWloa21aemxtMEUrOWZPTlYvMTFJZ0JDTUEzMUhCTWJiV2NZMkFva0dq?=
 =?utf-8?B?bmhsR1h1SjRTeEMrak9NRU1XbVhYcitnTFZIek9GSEtadTNmQW8wS2NOWG1r?=
 =?utf-8?B?WmNDeWlvNXlFLys5RExaUGUza1p5TStPbW0rbEFZSm8xb0R1MEZSL1hGeGha?=
 =?utf-8?B?V3V3d1dDVDZOOEJZZU0zQlVlcmtHMGJrcnN0RXUrdlhzczNzMlhZdzQ3ZlRO?=
 =?utf-8?B?K1JZN0d3QlA2TnBzWVdiZWN4bWE1L2FOTEdqeldaVDMyOW1QaFBEeTdvSVdu?=
 =?utf-8?B?ek9tc0lVUlZpK0RmcThvOFB5RWNNN1R2cXltaUwyNVllUW1oNjRNMHRaSE5w?=
 =?utf-8?B?Y0xUVlQvVnFVWkxNWmhvVm5PdjBBU3lkeHZsRGE0VTJtZUhTcTJtWUFJZ01n?=
 =?utf-8?B?WXovNDJMNjZGbjFtRnZwSGZWbzdTeFFHY2RncDQxVkJOVkNRUmV5NnIwL2lu?=
 =?utf-8?B?VzA3U2ZndGwxN04xS25TQTVzMks1Q2NNZENVRm5QelBQVjZNbVIzR3kweHFF?=
 =?utf-8?B?ZERPRi96SzJ2bHpwbDdzSjFLSDR3b0VVZEpTVnBIUkpsMXo2dUovZHAxeitP?=
 =?utf-8?B?ZDJ2c3BRYzczNmo5bjU0UmlJdUxDZmxTY2taMWFUbmpObkw2UHNuZyt3VDFw?=
 =?utf-8?B?SjRyUW8wamZZZUlMWm5WZzA0Ymg1eTFUTjhvL2l6ZGRKLzVGSU1NRE1sUXN1?=
 =?utf-8?B?c1dIcFdTOHVkRkxBbytkQ0ptWjhqd1dhUGhacUFyUGdvQVhCbDVWZjEwMSs0?=
 =?utf-8?B?VHU0bndiOE1xM28reStjaU00eXpRMEU1azlLaEpRMGVLZVJ5bUI3SjZaTzBi?=
 =?utf-8?B?R1FCY2lSOTh4Z1dxVkFhQjIxOCtXV21EMkVRUlgwSEZVaEsrNFhHZXVOTnAv?=
 =?utf-8?B?OVE1bjZkN2pWTkdlbmp6REFPNGpneVhpMG05c1B6dEo4OEdGdEZlUytpYTBi?=
 =?utf-8?B?T2NWNDJhQlBZeW1RT1Q3ODhLWmdldlBDQXRwSlNnSXhUMTJnWVk4Q1h3S0I1?=
 =?utf-8?B?UU9EUGVDakxMUUJNOXJQTEFobGRaV0grelBzNlVoYUFrM2ZpcHlYcHlQOGRy?=
 =?utf-8?B?SmF2RnVleEloRXN1RFBVRlA0dW5FdjdFRFlYU3FLbmM3aC83Sm02djJoQUl1?=
 =?utf-8?B?SjBqMmNQeGFLVk11NGNWNDhkeFB5dEFKbHpWbXAvYzFRVTdLM1hrb2RiTS9z?=
 =?utf-8?B?dzYwbXRpclNMVCtnd0xZOTRQOHBtME52WWRmZXU1ZmNsT09FYklmM2xYaHYw?=
 =?utf-8?B?SzROc3NIaWtiRnY1enJBQ3Ezbk9CRUQ1c1ZuaWJIdFVrSXkxM2ZjVWFDcXky?=
 =?utf-8?B?Q3VLOUlTMVJMNG5zV3V4UWhCSlhrUzdEdFBPWTBnMW9KNzVuT2FYeXZvK3dM?=
 =?utf-8?B?ME85d3ZiMlUwcmFsVmhhczE1ZUpsQ3VHR1BndCtZZkdkbXFVLzB6bndhRko4?=
 =?utf-8?B?aVh0YWIrcmFYODdiZ2piWFlsN2x2OFFkVnA5TXovZDJrRmFHZUh4VlU3TXBi?=
 =?utf-8?B?OElqNjBLUDluczBEU2dEeWlqbklQSUJrRUEyL1ZWZ1lQck1Od0NoeExnY0tn?=
 =?utf-8?B?V0JyaUs2MHo5Mm96ZFE5ZzlhODRSQ1BGYXJ5eDI3Ui80cURFV01OdnAzTGd6?=
 =?utf-8?B?Vy9VUkF3c3VEbnl0bkVtS3pWYXh0ZEFzb0Z5WW02TVE1MUxFUDVuS1gxcGNZ?=
 =?utf-8?B?cENtVmdZTTd6VjF1TlN1OFFGY2JWKzF1Y2l4ZUJBeGRVTDZRVUcyeC94ZkhO?=
 =?utf-8?B?bi93eWo4T2crVFdzOTQ0emt2VWx5eXM5RmVBUy9GMWRsY2NEZk9DQ0pLTlNS?=
 =?utf-8?B?RjdKbVNXQ2xvVUNvOGxwQjRlZHdjck9jaC9GVEZrU3BJdkw1ZFJCMk1LbSsx?=
 =?utf-8?B?WFNZWnVLZS9nLzlXRDZ0cXdXaVR1aWVhSEJVQkdOT1pmd3hidXg3ejJsVVVI?=
 =?utf-8?Q?/x8eSH4AT7IHOf1m3mpgxUc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af529784-fc97-4053-4dce-08dd7ba2b1c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 22:21:25.6176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmPehaIOEi+lCmaCvmSo+z4toxagc0AsrNqOfRwN52QZaIzI/hJQIEGc5dhSImF0/u8OjoR/Jp/siwMgXjzm8AFOS0P/sA7GeX1rCC+Xrqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
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

On Tue, Apr 08, 2025 at 11:12:06AM -0700, Ashutosh Dixit wrote:
>oa_tick_delta should take into account whether OA report header is 64 or 32
>bit when passing width to elapsed_delta.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index a20120881a..2440101900 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -627,8 +627,11 @@ oa_tick_delta(const uint32_t *report1,
> 	      const uint32_t *report0,
> 	      enum intel_xe_oa_format_name format)
> {
>+	struct oa_format fmt = get_oa_format(format);
>+	uint32_t width = fmt.report_hdr_64bit ? 64 : 32;
>+
> 	return elapsed_delta(read_report_ticks(report1, format),
>-			     read_report_ticks(report0, format), 32);
>+			     read_report_ticks(report0, format), width);
> }
>
> static void
>-- 
>2.48.1
>
