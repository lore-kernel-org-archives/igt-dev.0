Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187CAC87FCB
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 10:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C391010E14E;
	Mon,  4 Aug 2025 10:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8IcyipS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2695410E0C1
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754303983; x=1785839983;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HJTY0KtWN9D/bNEI5eHqi0VrOL4rck8vyTQSNdzdbII=;
 b=m8IcyipSXiRPpCuB8BY1hfmn1Gw56tbvkqO5Z82m7d9+m5xnxSsMWnD6
 Qi4ym6VEAbZeCwk2CDRXXns4ZDnwYT3w4TAhhkfVA0/BHSoT69ieFhXxK
 IN1fxJ5R0Uaow/NEDSLtaCWQ2cJYm35f8hfDupkAzYuM2m72bLSaVfY+u
 +ptNKmRY/G2dWy8DnmcbDDlIJnETN2CwyoWMXjtlwdmwxPzM38s9OmzLB
 bV49NzRZBEzcRa+hV71DQUf3JzgXORheWdGNQ7R84wk7evvpQJXZEPsGH
 rVzRPlo4xlxfiUZYKB1YYyErTJYYOj2riyYFVaRs0a26wI6cZj0/NWFaX Q==;
X-CSE-ConnectionGUID: QeoygVrXSwmFfgiEhFHpmw==
X-CSE-MsgGUID: fi9rppG/RGO0B19eEpzwpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="74148941"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="74148941"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 03:39:43 -0700
X-CSE-ConnectionGUID: vvZex7IgQtycipztk3DakQ==
X-CSE-MsgGUID: 3uYyOsQwQ5OHKgn5Caar8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164918612"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 03:39:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 03:39:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 03:39:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.73) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 03:39:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCmIrVF1uCLWrErhwBwa93D5U1j74wVuIuVryNIBtmjbZx/uK15OsKFCcpwcv2VHAD77FtmFQBCjf/Gli+WkqH2VCyrH36ayucQnNITOnI1aOj7rpD7o28jC8w08pv+PJBCng0189xz9Qn1sHAPcKIyTGfTal41i/A8/5aDFi9ZsmULB3U97XifL5Fy9ynQW5m8gG9ScTMrPPNA7AaiR/AOf/6XiCnfFgFKMWwyToF0y3fgmRb54YrtOP4I9kLgaesTBHgo0oAiAxfgsMU+zL3gbhmkShJPhUHOQOogvh1JPynmsDARo2Xvguv7A8Fo1HlqIg+6BPQ3EZzOM6layCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdB9cUA6HJZ48okLVM8rCrp+7S9F7asMJna//PX5wxI=;
 b=uww/kTEHtSFXJ31bRkOT0Ayq0o6hetvsRZv3YSY6WhHoQ6kITJvpMIxoBHnfsbluAiJsnLNiQlRP02p3zWW1TNJ31bzUGYEMRpL9vdR/OYKbTub8SIypfRS77aw5oYmyyDOMH9HMpLkIeSEDqcZqPZDCxXaS1+S+NDXr4AHHlMlrNZkmWvcoBMJrlE7IHzO0L1tBxihbfvXZWnNJQlwL3bsZKgWOUBbOITKBz1QOrGc8uh3fXzFgiR324YukUlp1F9ZsqNORZ0EyPPy/eQGAoEPgXDp3wGTMK6QGQy1MjIA8ipjL//e6BFqN03E0WoYz50YWSYat2a6yVsEzigsUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA4PR11MB9107.namprd11.prod.outlook.com (2603:10b6:208:562::22)
 by CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:39:38 +0000
Received: from IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6b7e:af5:887a:e384]) by IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6b7e:af5:887a:e384%4]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 10:39:38 +0000
Message-ID: <f91cc138-24a8-40c3-bd3b-0f92e8816493@intel.com>
Date: Mon, 4 Aug 2025 12:39:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 4/4] scripts: Add symlink to verify
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Michal Czaplinski <michal.czaplinski@intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>
References: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
 <20250728173152.220113-5-kamil.konieczny@linux.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250728173152.220113-5-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0105.eurprd04.prod.outlook.com
 (2603:10a6:803:64::40) To IA4PR11MB9107.namprd11.prod.outlook.com
 (2603:10b6:208:562::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR11MB9107:EE_|CH0PR11MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d8fc34-e73c-42ad-c5d3-08ddd343360c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVVnNWh4U1hrQVJyR1JRaWgwamJSeUR6c0hPRlBoKzVXMm0vTjBBbE9ocUE5?=
 =?utf-8?B?TDVRS25obDRLSVcyM21xZHJpaDRNSUt6QmhQUVFhU2hiRDlrNkNlSVlnbXZL?=
 =?utf-8?B?UndSTXU2MER1MWp1UnFoeHhLYnBIT2l4TlFQRzFRMXFwN2dReCtNbmF0U3E1?=
 =?utf-8?B?RUdjY2E3Y1QyYXdxTUE4d0c1dXJhZ1ExRnliM0Z0bEtoUThmdWF3TVlwdzgy?=
 =?utf-8?B?emZQRGZOS1UwUEtVcTNIVUFCOUlBQUpKc2FTeStwZ3Y1S0pHVkY5UFdJc1dw?=
 =?utf-8?B?bUh4ZFpaUVZ4dVEvVVVLUmFUQXl2cm5NalJzRG00V0l0NGFzNm90dVhncE14?=
 =?utf-8?B?ZXVKMnd0amNvQ1Nab1FCN2NTa3JlVVp5OEphWmxwaGpSY0pvd0h1WXptaC9R?=
 =?utf-8?B?SFJwUkJuWSt5ZVNMZVJtV2lZTTJtNUdyZTJwTmNRek9pK05Zam5wRWpmYUZY?=
 =?utf-8?B?VGNXRHFqT2xCcmNTUENDbUNZcGVvVFVyS21FNFZVVG1kaFlEWlY0NmxwU25x?=
 =?utf-8?B?Q3pnV01uWittUlg4eDVpT0ZDMXBVc0g1N3M3RmNMd09pMW1qWVFLRkoxK3VQ?=
 =?utf-8?B?dnpMejBiVncwTXY5S3RlbG9NV2xid041SWRwbFFNZHBCek1uK3A5am9sYkh3?=
 =?utf-8?B?NTJodjk3UWEvcWpMY0xsK0s5TmZSbEYxQVIxTmozaEtVVnZnYjB4OGxUOTBC?=
 =?utf-8?B?UTFYdldrRG1RQlNHWFZRczJsWTQ4YWFDUVh0c0hlalI1eGREOCs5UVRCQW5t?=
 =?utf-8?B?ZFdxSFlwSWMxaHRHVGxvSUdtQ2FUMjhLanFWaFVGdFZQZXRLODhldmdKc3E2?=
 =?utf-8?B?SGFzaytxS1libjBrTC9lclZsK0tIMlp5MDF6aDloaERrOHlQSytCQ2pNUkZj?=
 =?utf-8?B?UUhRdDFRZHR5a0RERXB4RUZxeFdEN1d4K0p1bEVBaGF0L0dtUWdKMStEOFk0?=
 =?utf-8?B?MDkxTE5hRFY3N0k5empScU1yUkFpNDZWcTAxOVJBZTNicTRnNC9yWFZYUTNu?=
 =?utf-8?B?YWpuRm41NUd5dVg0blZRdEtsY1FNdUVmeTh2WWlrVDFsMEFDUUdjK3plb2Na?=
 =?utf-8?B?RllzU3FrQ1lDMkJNQmpEZGdqWmlUc1FJaTllZGVhdnlVNFZqV2J3T3BkK0lq?=
 =?utf-8?B?cXhXZ0dQTXlCSHBveTdPMEJ5anVURlhaSVhaOUczV2I0bE5VWVBiUHhGdnZv?=
 =?utf-8?B?VXNvTDBibEE5Skl3L1JiOTZHNjhIcEgyZGJuM3I5S1h6dVFCSmlBOXR2eFJH?=
 =?utf-8?B?ZkhJWXQrVURNRE9KZXhYbmZVVXlnRjQ5Y1RwTVc0N0VEcS9NREMwZzBnVVRY?=
 =?utf-8?B?Y01zZkpQbHZuQVp5bVNnT0VpR1RzYlc5TWFHL0lpblUxcHFSbDRDSFR1RXVS?=
 =?utf-8?B?K2NhUVVuS2dRdXNMNHpMVFJCZjRDT2s2eDZxTU9pMUFjTzdadjB6ZFNqaFU4?=
 =?utf-8?B?b2NMRkVxeEFHU3E0OE9wdUordVlvTldFNXVNNWNyU3M5K1BVajZPdlcvYlRj?=
 =?utf-8?B?ejYxR0lzRXlJQXFJb2hSeEhGQ2dVaW1hRTZORi90aVFzL29NV3dSSk1kbTZJ?=
 =?utf-8?B?TUxsbGZ4dVloRFVHUUJka0V1N01qYUhLT2svYUxxS3B4bzFpZ1l3YThIcmZW?=
 =?utf-8?B?YXhvdjR6M0hXUTBkRnFDc2gvWCtIWHZKTVdQeXVqdkgwWDVqbDJGeDB2cGVl?=
 =?utf-8?B?WkNUeHk5bU1jcG96WHRWZnIxQlA1SVczVDR5YUhUanlmNTdLVFVUQWRmS3lU?=
 =?utf-8?B?cW9aQW9DcmxEbXhmSlJ5dURpbXp5VUkrcGJRQXN4TWNjZFdLZDllZENadld0?=
 =?utf-8?B?TU5kS1ZxcXJXMnNWSnY2M2lwcWYwRVpVUjlhLzkrdzA5eVBGVHVRRFNVbHBU?=
 =?utf-8?B?d2xLNHhSTEFidVZNN1ROY25NM2Z0d052YlhVSkNmZVk3eldpdUYrUklSVDJ3?=
 =?utf-8?Q?gt78CNa3q3c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUhQR2ljeHRMYVVmTlY2bzZpdloxMEREeW9qU2ZzNHpjYnJUMHl6WGV5eXFW?=
 =?utf-8?B?VUxtdmFJREFRZXMwQ0E1T29iRWN4bE8vNE12L2dyQXoyMlVUNi9yYVdPYkpX?=
 =?utf-8?B?YUM5RzJPd1VucUs0aytQNFIyenZjRFJGOWJhNW54U1JSTTBSdi85R3Z6VWt3?=
 =?utf-8?B?K1JrM0tZVGtuSkNsbHpUa3lTUmFQWlJROTBqWUt2V09nQTB0bFp4V20xZ0pU?=
 =?utf-8?B?QzdwVW5uSjRiWDdRN253OFUxMlJiNGxaUHFjeXBrUWVpVnQvWE5IQmxuSFQr?=
 =?utf-8?B?V096SHhSdmYxZE1XUVczN2wwNHFOUlhNak9Ic3pqQ2xQc1JEQ0Y2dGhZSnQ4?=
 =?utf-8?B?eVJwUUR6Z1FiWHFLOXAzZGM2MXRFZEF6MGN5b3BHVmR3aDVMTXhWOW5xSHVV?=
 =?utf-8?B?SE9yRFVsTXZiajlQSkIrSUFVN2w1dmwzVFBONjFjclZOT3I0QThBd1NsUnRG?=
 =?utf-8?B?K2ZrS3B6eTJsZFNnbUJ6M3dvRnV3dFdtTnYwK2NWdkZwQTMwbGVZLzFTNW9J?=
 =?utf-8?B?TUVscDVnMzU1TUpjcmVCWEZ5NHZBWkpieW9oamhKcjB5NzQySk5XTytpZzJy?=
 =?utf-8?B?dUM3TUZhVkl5WVRleFZPRWNQRU5PbDNoVlQwcUhsZWl5dGdDQ1VGOFQ5cEs0?=
 =?utf-8?B?bTJOR3Qrc2RHcmVRSHl1bm0xeGcwTGl4bWd3cjExSUtHME56STkrNzJBdFVU?=
 =?utf-8?B?dGQ3VkF3VWNpcld1c0UraC9TWUo2ZllTU00vOWlzTEd0TWhSYmFYUjdPKzNl?=
 =?utf-8?B?R2tVZXhZYllxNHgyc3NHWFlvWFA2L0FuMFNsZWcxT3NsTGg4SnFhTkIzUVRC?=
 =?utf-8?B?d3dpQVVpZ1cyZmlXc0dyV1ZlWVVXYVlSMXB2M3FuQjZBVTBMcVhwYjFWZitt?=
 =?utf-8?B?QkU1cnN5NVBoYnZGZ2NtOVNqZDlZaVNqSTIvckI5Ukx5MS9KTFBaMWVDZ2lt?=
 =?utf-8?B?ZGNma1pHTUVva2xXdWtySzQvdWd5R29nRzBtSGtrVzVJVVhQeWhaOVB3Q3NK?=
 =?utf-8?B?bUZXZnBuVUhIdmVqSUdQK241a3MrOVI5alJtcEMrUkVmQlFoV2lHeFRQYk1W?=
 =?utf-8?B?d3hkaldiZEVzNU9IVmVVWHJDNEFwaHBiQml2S1h5VDkwTklOQ0M3WGZDWnVs?=
 =?utf-8?B?VlJpcFpSM09RZzA0dzVXRzcxc0tXRGNGdjhqblZlWStIZ3hVaGtuOGN3cUFn?=
 =?utf-8?B?M3pRVFIvRjlXVDRhVW9RVEVNcHpEUnlxSXVST1NuZGZxQURYQk1CQWE1TVQ5?=
 =?utf-8?B?L09yS3FEbHlLakxXVzVUUU1jNEpkb01JT2pqYmtvR1NqV0IrQ2tORG4xSDlQ?=
 =?utf-8?B?ZDQ5cTUxTll2WlptQ2o2MlpDWWt3ak5VT2V3TjFDVGxWV1NsL0VXUEVGN3RQ?=
 =?utf-8?B?YUpFU2p6OFBGc01qdFBMSHRHdzl2SVNJdUF5Yk5zajI2MjVWSW1TYnhmS2U2?=
 =?utf-8?B?aS9FWmdDYUlhM2F3VWxla3BZVmJOQWRQczUwWjNyQmk2elBXTGMvVFBxcEVh?=
 =?utf-8?B?OUtmRjJ2OFNiWC81b1JsV0Z1QUJQL1NvVE1VcUduU3NEYWFzQURNK2RKQ2gv?=
 =?utf-8?B?N09hS1lZYy9RY1lXYVFxdE4rODF0c1hpVTJyTFlJZ0s5dFdnR1lLSFZ2YWRU?=
 =?utf-8?B?ZG05Y0dnaFNpVGJ1NldJdnFBR1BTNjdpYkFEUnRRSUQzVG43V0ZJWVhhSDhu?=
 =?utf-8?B?SGJvT3dJcHhxMlRxZEdCNXExVWcyMEwxUHFBQml3V3JhaTcwRWdrUkJUMUpB?=
 =?utf-8?B?V3dMUGZVM0l6aXlJY0Uray9XeDY3S2xEWmlPMlM3S0VRbGlmSXFQbzB2aTlx?=
 =?utf-8?B?T3NQU0R4N01RRnhHMm1UWEdEcjYyRlVxc2o5K05ueDcxaW4zeW5RQ0NhOUdT?=
 =?utf-8?B?ajFNUnlVc2tiL3Y3VmdmNjFGQXp0UytQc1dYRkxES3dhZ3FrUzB1WEpiaThF?=
 =?utf-8?B?Yk9MVStZeG5OM2FGVUNMYmkxR3NIbk51VldWTlpSVmprM3dubFhNaGlQUmNw?=
 =?utf-8?B?T2VNZWJ0WUEvR3U5TXVYc2NQOEFudlVZbThqWjBkU2plSzBJMFp3K3Q1bHVE?=
 =?utf-8?B?TTkwd1FmbkdCVEhXOFBXc2p2bEVtcmZ4bXVqaDBTMEpSVXJ0YTFmVjRQNVdJ?=
 =?utf-8?Q?OFrNnhjqN68jGu3zSFiDfFvUh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d8fc34-e73c-42ad-c5d3-08ddd343360c
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:39:38.2224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTfaB/y5f6zc/f69+XK5IeTfaK+nRRuyfCsJPVcgBTjvRc7k3Vi/GC2p+WFKMpK5t8tNJYMf1XSnlAzTDe89dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8189
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


W dniu 28.07.2025 o 19:31, Kamil Konieczny pisze:
> Add a symlink to give CI time to change its flow.
>
> Cc: Michal Czaplinski <michal.czaplinski@intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   scripts/verify-blacklist.sh | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 120000 scripts/verify-blacklist.sh
>
> diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blacklist.sh
> new file mode 120000
> index 000000000..7f706d61b
> --- /dev/null
> +++ b/scripts/verify-blacklist.sh
> @@ -0,0 +1 @@
> +verify-blocklist.sh
> \ No newline at end of file

New line could be added here, but since this is temporary solution, no 
big feelings.


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

