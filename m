Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4548EC3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 13:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9D710E9DC;
	Thu,  3 Apr 2025 13:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmnhqjRx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6124610E9C3
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743687333; x=1775223333;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bQ2ONVzB2MLfA+CDXJwdtxqU2/MI92qeT6V4Qjz5Cdw=;
 b=VmnhqjRxr2nRt3Hr8kYhBVd+nV1jgBejSMV9pqiwWBlNfsAkSDNMLcF/
 I2id2EfS5+mVW5IqI0s4KG4+MbScKITot6UiDC67NRElnqatMbFzeYWxJ
 9UrArt5oKNnPe4zDtaqv27bTsJzPs9+7wVgGRDGwdEnyY2/A22bxgFkwD
 vbITnUe4vZ0F7rfmUnOI/VEBYXOgKj0c8oj4TiYcs8uVfZSmuMvCBHDy4
 Rsy4nJIhNNN7Wr2M3HNhCSZIw4lJ5TXXOacoOtnFUru84jGtDT2YuEbCX
 oQLYYKFT0gu2HXwns0ZK6KziI/imXqaRdoH3edEZb51bVdhhLKP4k1b5h g==;
X-CSE-ConnectionGUID: RZLIUVUcQySQiESFbGSkww==
X-CSE-MsgGUID: Xc/u08+uRjWq+i3YqmYi8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55725292"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55725292"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 06:35:33 -0700
X-CSE-ConnectionGUID: RFKg2GseRSGlc6kub3gTVQ==
X-CSE-MsgGUID: 59kTu+dvSpykF1jlcAcEYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131727430"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 06:34:50 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 06:34:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 06:34:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 06:34:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBzy2qn64GWvWZuVNsV0+UFcexalzZI0mXXZvi2Urb3Z0xmDhjXvA6liBiavKKO3nxcmI3Mju711z5AYha+tqjFEqY1ZtxC7+0iIUEjkOemIiXzpJGET2kKV6RjuJ4VOXtaJJDzylLl4pUIuHT+VxDjYDuIq59CUELmOPhqWcoSsKKmBFjeG3bRyu+51Wu4bqXh/fLJrS8e8BdO+8H98C3yDxvD0eI5E3U9t4T/YM/MccnyIjCJaa59fk7xMIKemi0mD0vdDRYR+lxsKV1xEeI35tMIu5Hv9ZRkfljCPQ1hiXPwsU1zsTzk5kqud+f0kfAhDpUnp//rCvO7gih8q6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAM6MLrW1RwGb0MU/8AFGNCmYWcqZByuWaRUYsVFyrY=;
 b=qGeQQ/aJ/ho1K1GcTkZfiQnGqHiMAoIGHr4BZH0myAWYRVz0amy0egDk4fnRUreNXT+FBQ8ccoUJZ0lPfmGqabq4f3dVp1a7TfzwahfboAbBollOXYTideWL05yItL+TNeTPAZcwi8LQDUWABL9uuPqzdY+ZC9RcTHLTEWVZIBWyScIs7CdKz3I40ChB/B8KtydgPIVPZr6wVpZyo9RB0X0L8TCgRMVYdR70Q4AgQWHSebxeL4ZyaHgf6pJW2Er6zmGif/tyicOuWmNLprEt2ZVyPrZ5sm7NzBQNSAOYYc/8FdSjLsKEfTm6M9l2ANGOfAlnKokuMIBoHNCUe/48LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH3PR11MB7843.namprd11.prod.outlook.com (2603:10b6:610:124::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 13:34:45 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::cec1:b76:724f:592e]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::cec1:b76:724f:592e%6]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 13:34:45 +0000
Message-ID: <1b95cae9-33c2-47b5-b4e5-d9000543cd8c@intel.com>
Date: Thu, 3 Apr 2025 15:34:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v4,2/3] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, Francois Dugast <francois.dugast@intel.com>
References: <20250328111532.16620-3-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250328111532.16620-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CH3PR11MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1678c6-bedc-414c-3149-08dd72b44bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c292YW5DdlFHcUoyc3B3cmFuVWFOd1ovUVR5QnQvSWZLWVl2RnVVbWxwWXdJ?=
 =?utf-8?B?d0ptSkY2V0Rad00wUmxpZkVJbDdXNHJEbEZLTDdRdC80Q3hPS1EwWGtNSXpz?=
 =?utf-8?B?L3Uwanh5djFZcnpKT0JNUXpXMEF2ZVJkRFI4RFpsa2hFSmdJL00rTkdHWnFX?=
 =?utf-8?B?aDlhdmdxY0ZVYzZWTFljNDhyZXNtMTRzK1E3SGQrZU5GR2xNM0pZSkhabUZN?=
 =?utf-8?B?MWdiRFUveUlHZ2tDTFJ2RjZiNzE4eFFucmFMT2o1TmY3WDdDNEJMdnRQSHA4?=
 =?utf-8?B?Y0pQUnh6dWlIYy9nNEhxRmV1czI2NGZlWHRFT1BSdDNKV1JVbjNEVDJZd2pv?=
 =?utf-8?B?ak5rd3d4NlA3aGR1VDBneXhENXlGRGpZYVVLcHN5YnROQlJhdGs3UmtjQXFa?=
 =?utf-8?B?MWcxaExua0kzZ2F0RmRBNzQ4VWduU3hzY0dYb2lIY3dEbHg1WDZNWVY4WUdu?=
 =?utf-8?B?SVNIN3VmK1dvbEZRVE5MK3ZjRUl0VTlxOUpJZ05tT2tnTWRVSGllbDVwM0Iz?=
 =?utf-8?B?TWRGRlExT3VyaEVyYXNrZCtmdlZ3VlNPZ0xRVlcyTERnSUxKd0c3S3hZelZZ?=
 =?utf-8?B?bDdBYXJjQ3JHU0RhMi9PTWxDL0dLSDZCNXdIcVRTWXdaS3JXTW5lYlBLVmN1?=
 =?utf-8?B?UjhJUXZsVG1nS2lBY0djUXZVWVpWd3BzQ2J2UTJsVFdnU0p4aURSeEU2OFRP?=
 =?utf-8?B?eTUxcHp4S1p0NCtrbFp3VERXbnZsK2FBY3BSWCtFNmhZVXdydzEzMXFlMUpp?=
 =?utf-8?B?cmg3UkNrSWk2ZHprdXYwbXFWMnpHcXZkZzk3b3U4QTV2QjdGZzBDOU1kZ3Bl?=
 =?utf-8?B?MFRhQlBTQXhaSTFOclhTZ2gyeXkzZ1Nua1RDRzRmK2dzSlkwL3QwZCt2YzMr?=
 =?utf-8?B?Q1NRdkhUYmRqc3JwV3BwTzZDNXVIaThTZHphVjlxMEZla21KU0VETzZVSXIy?=
 =?utf-8?B?dWNMVElmTG5zTkJnWWpGSE1FTUwwckR3MEJ1T0lIV29PL0hwaUg3NGgxMmdy?=
 =?utf-8?B?SUorZ0MzUEJvWXhqdTVRTDlKWEhJcEU3TkNsZ3NtcHY0aEYxRWlKT3UrdVlR?=
 =?utf-8?B?VTVMdWpZUTFGMjJMQXFNMW5rRGN5L1c1NmlGZVZ3ZUsrNHlOM3EzT2ZnbHk1?=
 =?utf-8?B?a29XK0lmZ3RlZGVra3JTNEJGdGpiL29RMmM0d0phVHRBdUpWUTJ1Nk40bzRq?=
 =?utf-8?B?Wi9IakRMK2k4ZjROSFZ4aVJUUWJkRk9ZSC9UalNQVEVveWYxL0l1eHNPUXdq?=
 =?utf-8?B?bmFEVXFIWHFSVWxkbkVmbjdvNlJQbW5qb0JTTWpPak94bi9sM04rVGZYZUUz?=
 =?utf-8?B?d1l0ZjVNN0xKbXV4eHQwM1dpT3ptbnQwNjJUKzZkMnR6aEgwY3RrcmFySVph?=
 =?utf-8?B?a1NZUDF1bXFIMTlzcWRWZklHTkR2RjgxdlJZcTVodXhXamRlaHdFOTQ1M0oy?=
 =?utf-8?B?UFBnRGs1aGxReVdGaXNnYzlsQTlPZW9PY2QycUxyYVJpTTlnQ2pYQThVbGY5?=
 =?utf-8?B?L3J4MHVlQi90RzNPTStkdGtETno4WnNCbFp6bzR1bDF4UHoyZzhtVnl3YUd1?=
 =?utf-8?B?OUFRdTB2amFHMjJ5bE45OHlyMGZldXJDampoSkdUMlFTTVR1VkRER2NpSzgz?=
 =?utf-8?B?MGxjK25UNE5Sa0ZKa1lTV0RjTkRxTzVxbWZ4NXpROEFOdFRkem1hanRBKzdT?=
 =?utf-8?B?L1JoZUxxS2Z1NisxN21Zbmc4TWF3MGp3ekRxWTgzdlZQbE95aHd3eUg1VmlY?=
 =?utf-8?B?aVRubmkraTY0MThienVvSDVKRmJNQ2JzOGZlcjVCNGN1V0R6ZWY2TkVFMzFz?=
 =?utf-8?B?VDlSZ25NWTFjMXhIUm9BcENEUGRqRkQ2cW5teUJzcE1BaFNrV0R4bU9CQU1i?=
 =?utf-8?Q?03BCgS00PyLtF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW5vaGRtRzBndnJWWmRoZjM0NUNteXY4cFdYc1lVZWxWbHBBcGN3WXU5SDRl?=
 =?utf-8?B?OHY3dzBUNEJ2azA3WUczSVNUbVQvemlvanlxOW91M3R6U2UzdDBaVWU2YXZW?=
 =?utf-8?B?ZXJLYS9JWVhxOTFEd3lBZnBWTGo3dWZWYzRGdG1pU2JzS2g0WnV0VmdXdkdq?=
 =?utf-8?B?SGVzblVFb2JmRkdWYjRWM1JkTHB0WWhWUU9jRzEzSDQxWEJ4SS9hSEl3U09w?=
 =?utf-8?B?T3I1R2NCU0duZmNLSE1ydnhuZE9VVWJDUjBsMHExcW5BRXl5SzVrUktWN2p4?=
 =?utf-8?B?ajQrdUM5eUJTbDVlcGIvMStQTlM4by81ZGVnTXF6YXhDaWdoTTZPQWlhcHVJ?=
 =?utf-8?B?VGowWlhTVjVPUXFjQ3dXa1hJdjNTVmhMeVArc1V5SWZWMmF5em5zajArZ2I1?=
 =?utf-8?B?ZlRtSU5SNnVIV2pGdWI4clJpUHc4bjh3TUhVdmJJc1VnS29pbUdwdDNCY1Ax?=
 =?utf-8?B?cUxnMGovaWJwTW92K3hOZVBiRWFWbXd5WHlMOE8yKzJONVRxL0NUZjZsVTNS?=
 =?utf-8?B?QU5uNW0wOE9xeWljTXVjQWgyVFYxZzN6K01BRU1BTitGYWxpaVVKNE5mdWww?=
 =?utf-8?B?Njdpb0tianVYVFJsZ0VZVDN3MjdwOW9IZW4zbkVQeVlYbkdaNU1HZmRyWE9q?=
 =?utf-8?B?SVdRaGhHMHFsSWNaRUg2ZjY4MUtZTU9seThNMU9tSExjMUc0VlV3bjVyVTRa?=
 =?utf-8?B?bjd4K1MydWIySWQxUEd4aFRRZHErL3VDQi9yc2l6RlZsaWZObnJMeWNsNFI2?=
 =?utf-8?B?OFlTQkFKVjN1S2E4UGtmMmRuZUZwSzhndzFieDZ1b3dWWERBWHQvcHlrNjY5?=
 =?utf-8?B?T2YvbjBncWFxeXZHNVU4d21ubGoyQ0RIMFRINncyNDhON3NvV3JMQUozMUhQ?=
 =?utf-8?B?OEM1N2ljNnlMWDV5dHYzWHo1U2EyNG9MZ3prRmpIUzlXcFdHajdwSWVZeVlL?=
 =?utf-8?B?ZTVKMVI1U1cvMytoUHhtZ1VNY3BvTmN0Mm9XZGwwWmQxdk1OS2w0SDc0cEVs?=
 =?utf-8?B?OTljRTZYTmJLQlhBLzA3eEtsTG5TSjh6dXVHYVBEVFNHNHlZNnlMWVhUTmFy?=
 =?utf-8?B?bDhCOGdKaEZLT1lJWTBTWUZUYUFTcFdBZWRobU9rVzFQRG9tVTBsSUNzd0FU?=
 =?utf-8?B?Nm14YXQ0MHh3OWJoZkNXRHJQblZGU1lMb3JrU09zYm0wdWZScllSR2dzY29n?=
 =?utf-8?B?UVZKTlJnU3Z2N3JwK0lxek1UVGNzRnFCUzZlanBnckFpYnpuZVgwYzI5Nm5p?=
 =?utf-8?B?Zlk5VVo3UFZRbW5hZGVXbjJUT0pxRE91VXFIQmIyODE4dkVZZWZ5aHhpOVVS?=
 =?utf-8?B?clJERWFKSE1JU29PUzZGelFFYmxmNnJVWWZiN0lUaXA2WmpiaEJPcjZvWU1S?=
 =?utf-8?B?dHBNS1M2QU5nRFRFU0phY2hyQ2xyWmMvVmt4QjBWbmxNRlBQZkRFUWtXcGd4?=
 =?utf-8?B?dUgxd1U5djA1bnpLRDRpWSs3WjhuNWdCb2hOd0oySjhCMWxRUFZJUHVrSVFz?=
 =?utf-8?B?YWx4MUU2NENnWmpxUkdvU296cUNqZDlNNUpsbDN5RUxyVnVGdEZBdlh4bXpS?=
 =?utf-8?B?SHkyRGo2T1IzYlpGOVdOcEZpRjJaUVdoTDBNbis1NzM4aWFVbTFoMnZ1eU9J?=
 =?utf-8?B?SjFrY3Z1OEhaTk1wb0M1dmhoeUx1ZHlNbEpnejdUaDRUZk9BR1hmVHZwZGpi?=
 =?utf-8?B?d29SQzZQd3o1RFh2ZVpRU1pLdjlvWS90WnFuTXpoVTBtWStSOGZoSTUvMnBT?=
 =?utf-8?B?YzVqNDZyd1N6c3pDZmx2VGFjc3RoV2FsZVUzOHdCcTQxYjNaWmVOYmh5RUxo?=
 =?utf-8?B?bjYyK294Z1ppekwrajBIZFRFaUFMdXFKZ29wQ3J2d0VUMFhpeTlYR1Y0dWhE?=
 =?utf-8?B?ZGFQOHJTMUtJTUs2R3diU0RtL3ZCSzFYZHc1dVBRN05BWVVicDR5UUh0MHVW?=
 =?utf-8?B?MVFwQVBUMzNQQ09EbGtIcHZjeUJkeVl6d1NQQ3BMY0FxeFRPZGRZTWxMUDB6?=
 =?utf-8?B?TlhqQmpkUHZKOENJT2JZU1pGeFR3TUxjajFkUGxWQ2FQMnByN2tPTHRrd1BY?=
 =?utf-8?B?eDNnY1IzeTlaM2wyWVdmZzdQQUJzaVpSaTIvaVplak80L3ZBa080bFVtNVpj?=
 =?utf-8?B?d3d1QTkzRnh0Y2lvSFVpNWt0N1BMblg1RGxhWGhXK2hhVXVZSnRxSU0yWFRm?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1678c6-bedc-414c-3149-08dd72b44bd0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 13:34:45.1026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84/fAZur2STZ8OM2tpBmFuyVU16F3fhaqyTooe+KzShlNg87rIvFerG38sD1u9W+6rOVKhiypYOaVCz1r88scw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7843
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


On 3/28/2025 12:15, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe during driver probe when executing xe_guc_ct_send_recv() /
> xe_guc_mmio_send_recv() so that more code paths are tested, such as
> error handling and unwinding.
>
> All xe_init() kind of functions are called just once during driver probe,
> so it is sufficient to fail first/all calls to them. Driver communicates
> with the GuC multiple times, and the real failure can happen at different
> call, hence the need to inject failure in GuC communication functions,
> like guc_mmio_send() or guc_ct_send(), but it can't be just first call or
> all calls, but we need to be able to select specific iteration to fail.
>
> To address this problem, the environmental variable IGT_FAULT_INJECT_ITERATION

I think it'd be better to use test parameter instead of environment 
variable. Please check igt_main_args() and consider using it.

> is used. If the IGT_FAULT_INJECT_ITERATION is not exported, an error will
> be injected in every possible function call starting from first up to the
> max number of iteration defined by INJECT_ITERATIONS, currently hardcoded
> as 100. Also, using IGT_FAULT_INJECT_ITERATION, an error can be injected at
> specific function call.
>
> Error can be injected using:
> igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
> igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 61 ++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
>
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 1325a1716..a49070b4d 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -26,6 +26,7 @@
>   #define INJECT_ERRNO	-ENOMEM
>   #define BO_ADDR		0x1a0000
>   #define BO_SIZE		(1024*1024)
> +#define INJECT_ITERATIONS	100
>   
>   enum injection_list_action {
>   	INJECTION_LIST_ADD,
> @@ -43,6 +44,24 @@ struct fault_injection_params {
>   	uint32_t space;
>   };
>   
> +/**
> + *  Introduce a new environmental variable IGT_FAULT_INJECT_ITERATION
> + *  using which an error can be injected at specific function call.
> + *  When unset test will run for INJECT_ITERATIONS iterations.
> + *  When set to <=0 or malformed - same as unset.
> + *  When set to >0 it will run single n-th iteration only.
> + */
> +static int get_fault_inject_iter(void)
> +{
> +	const char *env = getenv("IGT_FAULT_INJECT_ITERATION");
> +
> +	/* Return 0 if not exported / -ve value */
> +	if (!env || atoi(env) <= 0)
> +		return 0;
> +
> +	return atoi(env);
> +}
> +
>   static int fail_function_open(void)
>   {
>   	int debugfs_fail_function_dir_fd;
> @@ -228,6 +247,34 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>   	injection_list_do(INJECTION_LIST_REMOVE, function_name);
>   }
>   
> +/**
> + * SUBTEST: probe-fail-guc-%s
> + * Description: inject an error in the injectable function %arg[1] then reprobe driver
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_guc_mmio_send_recv:     Inject an error when calling xe_guc_mmio_send_recv
> + * @xe_guc_ct_send_recv:       Inject an error when calling xe_guc_ct_send_recv
> + */
> +static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
> +               struct fault_injection_params *fault_params)
> +{
> +	int iter_start = 0, iter_end = 0, iter = 0;
> +
> +	igt_assert(fault_params);
> +
> +	/* Get the iteration count from environment */
> +	iter = get_fault_inject_iter();
> +	iter_start = iter ? : 0;

Can't it be just iter_start = iter; ?

> +	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;
> +	for (int i = iter_start; i < iter_end; i++) {
> +		fault_params->space = i;
> +		setup_injection_fault(fault_params);
> +		inject_fault_probe(fd, pci_slot, function_name);
> +		igt_kmod_unbind("xe", pci_slot);
> +	}
> +}
> +
>   /**
>    * SUBTEST: exec-queue-create-fail-%s
>    * Description: inject an error in function %arg[1] used in exec queue create IOCTL to make it fail
> @@ -406,6 +453,7 @@ igt_main
>   {
>   	int fd, sysfs;
>   	struct drm_xe_engine_class_instance *hwe;
> +	struct fault_injection_params fault_params;
>   	static uint32_t devid;
>   	char pci_slot[NAME_MAX];
>   	const struct section {
> @@ -463,6 +511,12 @@ igt_main
>   		{ }
>   	};
>   
> +	const struct section guc_fail_functions[] = {
> +		{ "xe_guc_mmio_send_recv" },
> +		{ "xe_guc_ct_send_recv" },
> +		{ }
> +	};
> +
>   	igt_fixture {
>   		igt_require(fail_function_injection_enabled());
>   		fd = drm_open_driver(DRIVER_XE);
> @@ -505,6 +559,13 @@ igt_main
>   		igt_subtest_f("inject-fault-probe-function-%s", s->name)
>   			inject_fault_probe(fd, pci_slot, s->name);
>   
> +   for (const struct section *s = guc_fail_functions; s->name; s++)
> +       igt_subtest_f("probe-fail-guc-%s", s->name) {
> +           memcpy(&fault_params, &default_fault_params,
> +                   sizeof(struct fault_injection_params));
> +           probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> +       }
> +
>   	igt_fixture {
>   		close(sysfs);
>   		drm_close_driver(fd);
