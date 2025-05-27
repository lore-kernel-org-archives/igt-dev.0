Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E46C54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 19:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6186910E519;
	Tue, 27 May 2025 19:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpfNaKQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CA110E550
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 19:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748373846; x=1779909846;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Yr3gYT9q48b+N3wUv5AbE2tLcpbI06D4G4WufzY8bYg=;
 b=BpfNaKQjkVAO08qY0RB1I7cVGw6i8NVEUMwS6HTXIwL9NbpJ3jvEO0JG
 JLyUt4n0M4oLI+vMkxIHNrXzvQFvXGdliixk4QkdAHJpkgLG1oW5g0o9e
 B21hFKkJTIbQx7VdZhjkxZZKEfnhHLs3bbrcZh4FrkX/AJdvSm1GQNzNc
 QAghnl/SQ5/2PFWxrc89AlZ8knyB6mjd3SnyFIx1TH6E99NHEjyxWPE3h
 tT0N3dypyOVbNe0bVJ+kKH4PWT59l5+6KrQy2zLZ7AvmHF9HfOiv5p2+k
 D+K+/C2UClZnqhC3GQJ0KnizXDIXhrwVQ+/xauHj9xjztaGKUqpGMYgEl Q==;
X-CSE-ConnectionGUID: GsQ+i77LSN2X78gNZXka3A==
X-CSE-MsgGUID: 3s6zuWkOTiiW2quIaM5L7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54035195"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="54035195"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:24:05 -0700
X-CSE-ConnectionGUID: GkFNUWNwTxSbRDGHMIqcig==
X-CSE-MsgGUID: z4RrMb7ATfCdBsYkxWk/AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="142855992"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 12:24:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 12:24:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 12:24:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.52)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 12:24:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1KtfLMjOhr9DRbbNFzc9DgJrR6ykLn0GmmncEnC3CkHpbR2f54OO+8vBlWPcqlrMjxoRqlHXt+/6BMq0NFm2DdQcjOho6l0QNtVXazklFGA8OTozfx2h7DVvmS0v806JMWrVNSOySgcPsLa1voU3AVR9NyAwHWAF7aIBUQNbGsfODE/QzJ0y7QlY589SGnn2Sg46UzViQReglz7dU1qH6maa501lo0Vi0gSpQMmj21o+mvYf364i0jvY63oiYXWvuMacK3DfytUm4JyVU8aiVKz/XMSBzTr2xwEyQNQn2QWlIP4riyAfDTd6hsnFXAdtGb6m0gtoYp6oBdBPc8rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr9CBf5+xhyCoe3v8ct5DqPK0bIssiGIucsn7VBQhOA=;
 b=VC4168D+gt/SfAN55rfWbdMTVS8btkxeRPS53Zh5KumTa3iZfysyFEzcITDNA8QrP99rxRvA2vGO4Kg81ywforx/IX6JJcpmVR5lpff7C0yaJFf0NDMQFsJNvCAo8SGyXSdpNrF5knysZ8QiyujP7V9n2hVhnK4AW76+N0xqDWHklsaMBCc3EWlMA/lFunNwTWLfYHV9o6WOCTS67g8Pw83QogDe9V1KD6ZM7tzIMA7gPjotkNe+NUZRbLYO9Oe8KPTg+jyFr+uqpQo+j23MnJhrp/cy+wKHtaykrRAVhzrflTe9/AGpkS+ilTKYtHL37i8XQwvFSC7AbnncEm2EmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ1PR11MB6155.namprd11.prod.outlook.com (2603:10b6:a03:45e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 19:24:01 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 19:24:01 +0000
Date: Tue, 27 May 2025 21:23:58 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 08/11] tests/xe_copy_basic: add subtest to
 verify mem-copy in pages
Message-ID: <aDYRTldlyPM-JRvb@fdugast-desk>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
 <20250523080126.75295-9-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523080126.75295-9-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0339.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::18) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ1PR11MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b2327a-07ca-4df0-a502-08dd9d54092f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2Z3cWhpK3BKM0Y4alR5NWpzL1BsMS9pN3B5UExUSDlTTkZqU2hyNHQrOUla?=
 =?utf-8?B?TWNpdWsrSnAxZnNZL3I4S2JvM2Zlbk5hT2lUZnpCNUVocXRFK3JURVQxWVZa?=
 =?utf-8?B?bmVWNzl3UkhyZXltZGFreWx6czM5Wmo5QVRSSVJvYXhmbzhPYVp0Ry9CQWdi?=
 =?utf-8?B?anVybjZzcFZ2TWJLb3RyMEh2eU0xbHMzM0o4OVdWR0tTM1pyQXozb3hISGUr?=
 =?utf-8?B?aFlFMGNnSHA4d1k0UnhBbVJkTjVNelZyWThVUVBUTUtMZTlMWWxUMWpTM29a?=
 =?utf-8?B?dFVzT2pFRHVTMzluSjcxWTVOaStrYzJCSHVXVFpjTXhTWU5lTTdWVk5BOGNW?=
 =?utf-8?B?WW9GMDh6aVZtRU5mMnVxT2dhbFg2em5zK2Ryc0VXTE9FTGhFRXF4MEIrZWtQ?=
 =?utf-8?B?MkgvTHRTRWV3WHB3c0lEbkZVVWJ5TjhBMlVwaTdXeWFvamN5S1l2ajNoRE9X?=
 =?utf-8?B?UU14cjc0dTc5SlpWMHBPeGlNaE9McEQ1MVcwaVVFenc3U1dRNXFVZGVvWitC?=
 =?utf-8?B?UnM0QUlqL2JWMzNrT0JOOFVsenhnQk0yYU1NT2hrZjU5Qm5UaXRTeVI3U2dk?=
 =?utf-8?B?R2l1ZFV5V2p2SFowQVl6cFIzQXdCa29HdHVUbDQrSFBGakI3dW4veit4M2Nx?=
 =?utf-8?B?UXl0UWhoWExQbGRGaDdzZkZnOXA3WnBwb1NOUkExUm9ISzFJRGl4aSs3bUpV?=
 =?utf-8?B?MDNxT2lMS3dEVFNEaUVQTTFycXVpZjZHdmpHSU9zY1laUEowZDVKeTc3QlU1?=
 =?utf-8?B?cEZ4Z0h5YkZZSUJSTFZCQW1laU9jd00yZjB6ZWlaaEFZNUJDWkF2bkFwUGUv?=
 =?utf-8?B?MTdkSDFzQXhqWGdzaVFUTWU1MThLL3dZME44eDJpS0hIajUyVDNmRzhxdWht?=
 =?utf-8?B?YU5jY2FxMkNDVkI3ZWZ4QWs1WUtjL3dYT1AzaFFoS2p4cTJnaHoyMzAvY25J?=
 =?utf-8?B?WCtxTUVCekJDV1Rrd01YWFdkNHFraDZxdkpYbzZtOU9TbjNqdGtZQzIvb1dZ?=
 =?utf-8?B?c1hGamU1ajFDVDRLSnVmenE2QUlkQ0pqL1o3c3JCa0JwSDFVbFNBMSttdjk4?=
 =?utf-8?B?bk5FakJYeFltYXF1RkNQK0dZek9ydnVOL1ZtVlhwVGlYZnkxYy9wUE90SHN0?=
 =?utf-8?B?UXpFZlVLazFCNXVHNlRnTCszQ0dyZm9LVGdwWVo4a3Vlc09CbWJ2QjBvYVNZ?=
 =?utf-8?B?dCtDTXpKQUo1RUZ0YSt3cUtvb1VLWmVnN2FMbC9IQkRYRkhqVlVva0JxbXB2?=
 =?utf-8?B?RTlkNUkwK005TnpvczRvWDZrM2REakNFL1IyU3FxWkF3RVduakk1VG13ZFhx?=
 =?utf-8?B?eThIQ1ZTeDFQa0VpOUU4OE10NFJCTGVtNElBUXZUOUFSSTk0bUtQempyVzd5?=
 =?utf-8?B?R21SNmRXSjNIL1Y2QUg3WXprNUZ4MXlxWEx2TmltWmNIdnlJRVBEc2p5UExj?=
 =?utf-8?B?em02R0wwL0NkWVdGM3pKZExDMlQzOGluUmJiWWNqdldHSGtueGVoSUIxcXNC?=
 =?utf-8?B?dlNyenk2RjQ0OVJkZHdtNGZGVmllUkIvL1NJbHArWG9ibU5mbWZWc1ZIaklw?=
 =?utf-8?B?ZWVRQzA0aHhFNWphS2lmRzk3R3VMV2hvWXVMTjgvMHpQQ3JydjJsaDRqaGdx?=
 =?utf-8?B?UVd4b0NtOVMyUXdML0gwYktXT3gxWnY5OGIyNGpMNGNHdjlTR1pickt6citj?=
 =?utf-8?B?Y1JXajVZakczM0s4aGVkdHUwOHBaRDlZb0h4MWhCNmIyUUZvL3dFMzZIQlpL?=
 =?utf-8?B?Y1JJQUQvd2F0Y0lwNkdwcUZUcEpoblhvbzNxRURvOVhvQitqeHFWWitEMnZo?=
 =?utf-8?B?akkrY2t2MzNNQkl1OTRPTlFyZ2F3dHNnQ3ZlUjJmZXVYWG8rREExZS9oWnpn?=
 =?utf-8?B?YTZad0VWSWUyR0s1OS9tMUFWQlRxTjVXSDRmNnJWaDB1SjgycjVDaXZ4ekNk?=
 =?utf-8?Q?twdJrQokxgw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2tBSG9QanRRWFhrZDZ2TVJNRFVpRCtPT2d2N2dHQTNtaXZMODhyQytyRHVJ?=
 =?utf-8?B?aXpPNWxDMVhtWS9abDhEcVJ6cFhUZENmWklvVUFWMnNRK2QyalJVOVpBM0pp?=
 =?utf-8?B?N09WZVoyZUJUQ0dGNW9ZT090b09WWlFtbjNKWG9JQnVwMjRHTkh0SC96VCtu?=
 =?utf-8?B?WmVBY2k4Si9iNUhEQ3duTlNpSldMYTBKNWlTQStvTXFDVTZmMVUzNFIvWU5r?=
 =?utf-8?B?TnNRTHRKaDAzVkZkMFJaQTFVZXVlTW1lcytlN2Z1ZjBMZjk1NVhWK0o1TkN3?=
 =?utf-8?B?c0FNVFkrem1Id2J1bWtWaEVrZ09Gbm5SWmFlT3VWZmU0b3FWbmpHcFM1eEtB?=
 =?utf-8?B?dzJYSWhMTmVZSnVjK0hST2NxS2R5ZXFpSHU2VWdydGppN01mblNnbGh3bk95?=
 =?utf-8?B?ZkdIR01LNzVLeWNySFpqZkdlZXB4Z1VZRGQ2ZzNYVXh4SFNYZTRvOGpUaHB3?=
 =?utf-8?B?RTBBc0M1aGhqK2xUdGxUWUFJU0VnUGFSckhrWGlEU1ZvNXZWRWloQVdzQm5I?=
 =?utf-8?B?eXRMMGE1NHEvWVpndkRWTzdacm5OZElKZXlXM2RXOFJKQTlKa040M1BTOWVD?=
 =?utf-8?B?ZkJaTzZEMFBKdktaSXExRStwZ3BXU0h4blBnL1N3cUYwRlBwTGNzRktWclNu?=
 =?utf-8?B?VTFFcDlKTmVYbTN4bWRXWEljTGI2SERLZjlucHpnd0Q3cWptU1hnWDZJcUcv?=
 =?utf-8?B?OTlvUHBFdUhKclhnVE5WOExUVVcxRjZDZzd2dVRtb1FmS2hPVnVDV1ZHTzBM?=
 =?utf-8?B?d0RJZ2hOZXA3MUdaOC9TVXo3SlVjVHdkYlB6SnpmRW1vQVBEWXFBbkl3aHVH?=
 =?utf-8?B?bEpzQ2FMVkIrTWw1QVRkblErQlQ1am1vVnU3bVRZU1pTaDBNbkcyQjFpbVZi?=
 =?utf-8?B?eGFmTUlFbW9kc2V4ci9Nc2MwWHNzbEVadzJtbWZ2STQvRHl3U2xCYzIxSVh0?=
 =?utf-8?B?eFYvNXo3TzJDZzZiMlZxZE5PNFNNN2p4L3RNWWkwVm1jYkdoYnR5UHNENER2?=
 =?utf-8?B?QlJ4RjYzUHVPMFJFK0tCMTI1UWgxSUMraEZ4UmJMcE9wcGtzeXlFVisvNDNu?=
 =?utf-8?B?U2l6Z01ES1phK1ZrclU0eTBza1FENzdBNUsyd0FLZ0ZURFkvOGhUN2xLQmIx?=
 =?utf-8?B?SmJkNXhjMjNJQkRWTnZqVjkrMFc3SkgwMkh0c0JSWTlya2g5c3BwZUhJcy83?=
 =?utf-8?B?bi9PZlY0UFB1S0QyMlBHRkh3eE4rbUQvdk5hU05xSkNseG9aOUo3RFQ3Ukdt?=
 =?utf-8?B?N0hXLzlZcUFLbURRK2pzNk4vemRlUmYyZEo3QzZKVTFNb0xFVmZBQTZ3NjFR?=
 =?utf-8?B?cTQ2ZmJFMzVRdWxTeGhKWDBQTGZnM0pXNm5Ob092d0RibWxDWHBQTHZRY3hB?=
 =?utf-8?B?WEJKalNuZ1k0czRRdlZFWWpJVHQ2RS9tWG1jTUtCeEFGWHhmd2Z3ekpNSFVu?=
 =?utf-8?B?SmwwdTVuL2FVcVFZeXAyQTR3VFhEbnUxREl2aC9Hc2Nuemc3MXk0dFBYVThX?=
 =?utf-8?B?Y1JiZHpYUTlQcjVHVmpGbmRxRFM0RmtIcENsejhaVGdtdDY0eUQxcHhIVkhn?=
 =?utf-8?B?MUxMeGxKTXFoSzk3T3BrRXRQV2hEUFlXMkQvTWJNYWI1Y0dMQWtoVitKRW9K?=
 =?utf-8?B?MXNRanErNVdWYU54VEdEd0cwQytrOW1lTGxUMlprR2YxOXRPb2RRc3VrcC9t?=
 =?utf-8?B?MlJHODFJd0QyQ0tETHJoRHFCR1U3UzAzZmFnRHB4TXg4SlJyNDRCeDhPd3Zv?=
 =?utf-8?B?ckYyMGhMVkQ1WmdPZ0FKejZUeDlkelpmR1UwcDY2TXBIdUx2d0xHQXprSmw4?=
 =?utf-8?B?UE1pTnBuZkk2QS81bjlCTjFqT2xCblJjS0luVnhsUDFhMnJrK2xxSEU2OVNr?=
 =?utf-8?B?ZUM0VkV6Sm92MjREZzJtMG1kZEtnclFUQUdkdTVNN2NDRUpMaUFSUkl0KzND?=
 =?utf-8?B?ZXNtKzZyOUNZMmhHcFVLOS92cVJDWHEzQllGUVFNQk5KRTNVTU1OWXJKRUd1?=
 =?utf-8?B?WStIbDZ3TWJUaENSbHp4MXZGdXZjMWtobzg3R0FXRkdaL21rNkdjM014TFpi?=
 =?utf-8?B?RG5tdFpuWW9rOGhGc2lPY3ZrNzBicHhlNVZ3YnV0b2wrNXgwYXZ5K3g4TDY2?=
 =?utf-8?B?Yi9kWnVBTExIdTgwQWZlUlUwZ29mOXRHdXdDNFo1Z0JoVityZ3J3RXQvYVBC?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b2327a-07ca-4df0-a502-08dd9d54092f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 19:24:01.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBh3syMp0UFoAKRl87MegWKxNuHHhUW+6/66rVoBcIz/agt8UhoSk+3mnQvlNox8B9GFHrdvygpuY2FyiDq8v1iLLj5HDw3qLgKkvIoHO0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6155
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

On Fri, May 23, 2025 at 10:01:23AM +0200, Zbigniew Kempczyński wrote:
> Mem-copy in linear mode supports copying in 256B pages. Verify is
> it properly handled in intel_blt.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_copy_basic.c | 56 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index bed3e39426..404fe7f50a 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -48,6 +48,20 @@ struct rect {
>   * @0xfffe: 0xfffe
>   * @0x8fffe: 0x8fffe
>   */
> +
> +/**
> + *
> + * SUBTEST: mem-page-copy-%s
> + * Description: Test validates MEM_COPY command, it takes various
                                                                     ^
Is something missing here? The line wrap is odd and after this series the
test description ends up being exactly the same for mem-copy-linear-%s,
mem-page-copy-%s and mem-matrix-copy-%s.

With that fixed:

    Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> + *              parameters needed for the filling batch buffer for MEM_COPY command
> + *              with size %arg[1].
> + * Test category: functionality test
> + *
> + * arg[1]:
> + * @1: 1
> + * @17: 17
> + */
> +
>  static void
>  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
>  	 enum blt_memop_type type, enum blt_memop_mode mode,
> @@ -62,23 +76,45 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	uint8_t src_mocs = intel_get_uc_mocs_index(fd);
>  	uint8_t dst_mocs = src_mocs;
>  	uint32_t bb;
> -	int result;
> +	uint8_t *psrc, *pdst;
> +	int result, i;
>  
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  
> -	blt_mem_copy_init(fd, &mem, MODE_BYTE, TYPE_LINEAR);
> +	blt_mem_copy_init(fd, &mem, mode, type);
>  	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
>  			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
>  			   region, dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	mem.src.ptr = xe_bo_map(fd, src_handle, size);
>  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> +	psrc = (uint8_t *) mem.src.ptr;
> +	pdst = (uint8_t *) mem.dst.ptr;
> +
> +	srand(time(NULL));
> +
> +	/* Randomize whole src */
> +	for (i = 0; i < size; i++)
> +		psrc[i] = rand();
>  
>  	blt_set_batch(&mem.bb, bb, bb_size, region);
>  	igt_assert(mem.src.width == mem.dst.width);
>  
>  	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
> -	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
> +
> +	if (type == TYPE_LINEAR && mode == MODE_BYTE) {
> +		result = memcmp(psrc, pdst, width);
> +
> +		/* Rest of dst must contain 0 */
> +		for (i = width; i < size; i++) {
> +			if (pdst[i] != 0) {
> +				result = -1;
> +				break;
> +			}
> +		}
> +	} else {
> +		result = memcmp(psrc, pdst, pitch << 8);
> +	}
>  
>  	intel_allocator_bind(ahnd, 0, 0);
>  	munmap(mem.src.ptr, size);
> @@ -86,7 +122,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	gem_close(fd, bb);
>  	put_ahnd(ahnd);
>  
> -	igt_assert_f(!result, "source and destination differ\n");
> +	igt_assert_f(!result, "destination doesn't contain valid data\n");
>  }
>  
>  /**
> @@ -176,6 +212,8 @@ igt_main
>  				 { 0, 0x3fff, 1 },
>  				 { 0, 0xfffe, 1 },
>  				 { 0, 0x8fffe, 1 } };
> +	struct rect page[] = { { 0, 1, 1, MODE_PAGE },
> +			       { 0, 17, 1, MODE_PAGE }};
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -195,6 +233,16 @@ igt_main
>  		}
>  	}
>  
> +	for (int i = 0; i < ARRAY_SIZE(page); i++) {
> +		igt_subtest_f("mem-page-copy-%u", page[i].width) {
> +			igt_require(blt_has_mem_copy(fd));
> +			for_each_variation_r(regions, 1, set) {
> +				region = igt_collection_get_value(regions, 0);
> +				copy_test(fd, &page[i], MEM_COPY, region);
> +			}
> +		}
> +	}
> +
>  	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
>  		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
>  			igt_require(blt_has_mem_set(fd));
> -- 
> 2.43.0
> 
