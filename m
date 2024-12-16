Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862B9E7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 11:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4828710E5C7;
	Mon, 16 Dec 2024 11:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/VPK+5Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14C910E5C7;
 Mon, 16 Dec 2024 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734349538; x=1765885538;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RMLwoYKdoLbap5cq92LtzCzcaocNmBB5p8r0RE8ZPLs=;
 b=I/VPK+5YFWAL22uVDDQxLHZ2fvIzowYfvuCqja9+LKl6+PkVqPGZrgds
 g15FPt6M0Bdf5JWxStSIo7wpXX6bX2wK/usWemPbM1nJR7J6tf3Nu2lMi
 oVHTWDL6u6w+K4qipPnhgnkkDZrrztzqf3H8nzHwHvFZ5V6dmLsKBUKIr
 UdPnbdsr5L0WKhEN4WmlQ2mY4kX87WkTUHTKm41YkKDG4bROmRJ+DBg5d
 TWtxbDvrRh1nTJ/K5k5aNCKTNCkDTBN9WKzl1IXZiD7HeSZv1JD0G30CT
 vqZ4REiAF65XDNL6upLa1kpRb92nYk1qObn3xemjKIlRWqIDWusbm9qA4 Q==;
X-CSE-ConnectionGUID: XIA6ow1RQ+eqIVhyLr8xfw==
X-CSE-MsgGUID: J2dXKvqzRbaeadfiCHer3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34636288"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34636288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 03:45:37 -0800
X-CSE-ConnectionGUID: g1Cz7UK6QgmpWJuZ/P1SBQ==
X-CSE-MsgGUID: C2QZw1dAS1uiYuRaX3BTOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="127983801"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 03:45:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 03:45:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 03:45:36 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 03:45:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkbRvuxo1+CvKOjlI0LHZ8baQe6ngeXAn40uhMqcGeO2gGuG4nNaYfFEf5AZgPLWY43QvzOrCF1f8qIN0DZw4ALJse9Fp0jFdmu0bRYIZq9szrsV8YJMkdtNWKcvWBqYf+SyW+vQFB6tSK5GhJY7pP105sZbbD5smOm+Z+WEPmKHI67KILkulaEvCi3jrQgvqVseMkzqt9RE+NyrQAwhqyC4nRWad5fmqjLv/bKTIa4gWRNED49tdNDElgVtEncex2kJ9a6R3D8BiTJvDVHvmOLPrMNNb95xDeGVaEPF2dMYQmfBPvImLmBOez/Nt72pprACld4wLK2dgvZppRXjqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itIB5jdTDmYqb0k9Y7P1h1xnxqhtZHz/4p+jmvWc844=;
 b=vHiIobfWOg/fsN5jrCN7e4ai8SJbf4D6bTuIoSNhg+tsIeeJrtSjdSn1XFxNZwJWraRYVVd8hyYZN+VKst1Pk++lcWXL/AxR4yu+SKzlPF23LIjHQIvZznXvYX478r7rbxQFysh0u6wcX2SOEwv7hyXop0oqqN5jJHqiSGiCWkeGoXfcAO4wwNTT04N3pNh2kA1fSAdTX1iVGTHzdOjalkfrC45WiYAQSbWESwYj+1Cb+ItyVuHwJ1gmrJNV2zxws2MOGOJF+Vw0tkT0x+fZy92PSxJ7kibOLdXNQsotNTxkcT8wLo33MHcSZfW2Ud6Oa2NKr9Si3lJTcIzFzqAMjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by PH0PR11MB7615.namprd11.prod.outlook.com (2603:10b6:510:26e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 11:45:33 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%7]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 11:45:33 +0000
Date: Mon, 16 Dec 2024 12:45:29 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <igt-dev@lists.freedesktop.org>, <mikolaj.wasiak@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/intel/i915_hangman: Fix spin engine hang (rev4)
Message-ID: <bfka2ippylpxahxdaawj46emygsg3jbjvop4cpu2qqtll5uhsk@aijsx4ekplya>
References: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
 <173386471778.968252.10555697611170292799@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173386471778.968252.10555697611170292799@b555e5b46a47>
X-ClientProxiedBy: DU6P191CA0054.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::21) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|PH0PR11MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae087a5-9cba-4c9b-e00e-08dd1dc72633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm51KzFCM1JtcG5pWG9HWU5OWFhES0g2VnJlcU1oLzYyZGw1WDYybWtkMldo?=
 =?utf-8?B?TVRhamxlLzQrcFF0RzZmOWRtbHlzaWlWNlZwOFo5L1ZQakg1TnJvSmJheENJ?=
 =?utf-8?B?VHRWZm5zalI4cm9naTF3ME5ibDU2cmUxSGpwRVBvOTMzaGtxcGQrTWg0UFAv?=
 =?utf-8?B?RjI2K2lmREt2amtKR3JFU21oTmlQZUpvazhTOGRueVBISmxFTWdLbzhPekp2?=
 =?utf-8?B?MS9KVnB4QWRubjZGS3QrbFlkS2hDYlQ3azdqNTRrWmhUL2VhT2U2UzBQVWxj?=
 =?utf-8?B?ZGNxRUpnMVMzUkQwZk9VY25FVlc4WFdLRVZZd1ZlTDVYNjlSWDd0d09Wclpw?=
 =?utf-8?B?QWk0TmVkc3pEOGRjRXdGamRQaTN6ZHAvYUowb2lXellxUFd3MjRvTk5mSUtG?=
 =?utf-8?B?YTlBOFp2ZGpCbFpETEN4aTNEY3BaMzJrMjFTQWtPZFRTaHAvd01iVkgyc3VZ?=
 =?utf-8?B?RS9XNEJWeHRPdno5c0k3RGYrM1BxQ042TTBUMExheU84aE5XV3F4eEFuLy9z?=
 =?utf-8?B?ZmhhUVI2WkkzM0ZEUjRESmM0V2JDUmFtYVM3NituTzlMYTNsOG03cSsyYlZx?=
 =?utf-8?B?UTBDSDJLalJyTDdQOVNwc2RNWUU2N2l2L00zREwzTVhqbjVrdXRBMGdlTm13?=
 =?utf-8?B?enpJdUI2eUdoV09NZlg5ZENHRFFyamhBVlhuUG9leEZTOFpXNzc2RjBqNWxa?=
 =?utf-8?B?cWtIbDZmY2g1WlU0c0JMVm92MlhBS3lsVzVIa2hDc0t5LzJhR3pNZldVK1ZJ?=
 =?utf-8?B?NTF0QjdYZ21CY2lkajF3T2UzeXBRamd1R09MWHpQcXRxMWFuWkhycDFZWUJE?=
 =?utf-8?B?MlZYSDRkUGxYT01IU3I3OFd2aDVTSnFiQ0tXb0ZuUVRRUVVSeHMrT1BJamhj?=
 =?utf-8?B?ZTRPNnZOMnp4RTMvdW1hTjBEak9QMlpwWFZGWEZhL2t3VlpRTHBoYjgxTWlu?=
 =?utf-8?B?L043STRFWVk0U3ZKUURpMHhKWktMaWF5UGZUUGJJdDRLeDNMeWR3SUpFcGpI?=
 =?utf-8?B?ZGVjT3VJMDZRRVlhN053Rk1VdW5zQkRvUHU5VFEzSnF6Uy9ZcHM0N0hMdllp?=
 =?utf-8?B?dDBTN0dJeE9QUXhYdURPbDI1aWxqMFlNUy85Ny9xMWFoZVFXR1NQL1VGZGlu?=
 =?utf-8?B?MGZWY2lkalhCRDNaTWhsSnpyUXdZZHp0bTZzZUJFcTRNNlFrcmhMY2lDblg0?=
 =?utf-8?B?SE5jWVdQVWh3YkpvYlFvM1dnNHhrVEt0V1RvdCt0dXpTMEpBS0d5V1lLQktT?=
 =?utf-8?B?OFZPNHRzK2E5SDNJandoZkNNZHkwT3QzMzhQMXU1Ly92MGNDcDB5MkRBMzRl?=
 =?utf-8?B?WEI0eHVNZDMwdWFSeWVCczZHdytXc3VhQmpNYm9oVnlGNk5NY0RHRFVyU05u?=
 =?utf-8?B?ak1xc2NwR210bVppVFlzYkdJOGR6MStjQXZSLzEyR0xTbEhHVDZ4REhSdkUv?=
 =?utf-8?B?TEFuRnBJd3J2a1N3ekFJZkNHMDFkTzVjM1MxY1hmUlh0T0NVdVFBVS9jRTBC?=
 =?utf-8?B?a2NSOVk4NnpWajRaK044dWJCQWRsMGhSc210RFkrSU9CaWk0b3V0aG0wcCtw?=
 =?utf-8?B?dmpmTnhqaHBoNE5PWEZ6T0xabFNOajlPL2RuOTlwa3RUT0dzMHEzbEdQcHZw?=
 =?utf-8?B?bkNsbDRtdkVJVTdKQlJtc3hRR3BrUzVtSzdLR2VrdnZrWVpUNFBFcE1Cbjcx?=
 =?utf-8?B?UzNZRHF4Y1ZSL3Y0cFYvU2JUMXRvRTV6UFlTT01IVFM0V2traW5UMndmUXJO?=
 =?utf-8?B?eFdQcXNvUXZNdjhPeUNKNzRwUklrbG0rMGMzWnQrbC9BU1FCNUFDVDEwTC83?=
 =?utf-8?B?aEswQ2xOb0YvYTJRWndnQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2NReHNHcnkzME9hdThpTVZjdWtjR05tMHRRU2lDNm4vK3lEVGJyT0ZEd1Z1?=
 =?utf-8?B?VVVmQTlUdERHaHN5OERqVUJ2UGloQko4OGhHenErOTd5bHJvbnBUaEdJVFRU?=
 =?utf-8?B?dWwyc3ZML2k1dTZEYmZpbmVzUDVwYmZDQWJYWlR1YWc5WU9iZWpvVG1HdTJG?=
 =?utf-8?B?Y0ZLbUE3UXVxakZvRWRkaHRVbzkrd0RHbGdobStkdld3Q0kwdUR2cUwyYTZN?=
 =?utf-8?B?NXNBVjFBYUg4VXBPbklFbDRPb3Rub1lqMHAvRzVHcXcwTURHQlNYS3V5eExh?=
 =?utf-8?B?ZFJCUnYxSFZPa3JaMllUQUJkbHVlQ1RlbVBOY1QwdFA2bDBLL3p6d3BReGYw?=
 =?utf-8?B?eVhXVFpTNWRZRnFvUG5pSVVxOGMwOHlmNi93YzkxNTZJMktqbFJuWnZhL2lw?=
 =?utf-8?B?dmdoQmo0WSt6WDYyWDRmYlpNNVhIcHNtUG1ONjFFT0U3b0pCM1IrbUJJeEZh?=
 =?utf-8?B?RzQ3VmMwaUtjbS84L0g3a0ZDZi9ZVWNhdldDL2ZmNnNnWHpnb3RqOVVsRStL?=
 =?utf-8?B?amcvUDc4R0JQc01UMlhwck1xa2grdjRuV0NydGo4RnVhTXdOYWNHczdxV0Y3?=
 =?utf-8?B?Mnp0dHhTZWdvYkwzMDhaeWg4UGVsUEpYNHhVUE13RDdjT2dLdzY4NldldkpP?=
 =?utf-8?B?d0pmUTBINnV5cnRFVnNPaW1qTXNMNzhuVUFhVkVGYkkzVkpWREJhcDdqc0NX?=
 =?utf-8?B?K0FvK2RFa1I2cDlxc3YxdDdFYlZ0TWN6eGYydFFLa2YrRFBwQXJoTDM3N3ls?=
 =?utf-8?B?UzYreHJLMmJCWG5uYmhPeExrelVEZWNtdEJUdmFQMGhoUXV2UlBOWnMyZDU1?=
 =?utf-8?B?SFFRSUcwQVBqdjZFQjArZWM5TlhzQno0N01KdmRyWEMzbTBZcWxHQUNuODl3?=
 =?utf-8?B?M0VtNFpFWk81K09CSTFGK0crdStFempyZ2hFUmtNb1pzU2Rtd2JEQzZFM05y?=
 =?utf-8?B?SnZDWWtHeWVJeXB0c29zLzFwc1dDNWMxMlA0UkJkcHFKNUxFWU9rVjE5ZnFo?=
 =?utf-8?B?bFdZWkdNOE16RDQrWnVhdGZ3Q09BemtkZXpERHJNd2dhVm91TFROZ3BGSkNw?=
 =?utf-8?B?elBhZGlTc092L3lRbEtxOWR5WDJhWmNtSlc5VjdhZEtTdlJ4dzF5L0x1U3BF?=
 =?utf-8?B?cHFhLzZjc25XYWlvVklKSUFsZTBhZUUxOVNkaGNOS29mZ3lhZVhJa2NraUs4?=
 =?utf-8?B?Tjl5bWhUQ2Fwa2pGWkJRbUx1M1ljc3lwVmJlYTZrUktZV2QvY2c3U09mb0gw?=
 =?utf-8?B?VDhmS2xGRFVvZEFCRFdKSk1PSnZWMVk4S01ycHFZUmZVOGNraThseEpZWG1s?=
 =?utf-8?B?NzRxSkJRZEJqWHNpWGtOVjRKcHRhUmZhdWRHQVFnMkI4QW1ITXUvNGlpdlhU?=
 =?utf-8?B?cnh2NUh1V1J5bjdmYWNFcForYXZLbU51Y1RzRmc3V2JDYlZzaDI2cFJIOUY2?=
 =?utf-8?B?czNUMFFjbnFaZ3liM01WT0taYy9sank1Mk5VVDd6RXR3RTcrREFoZ01QUzBQ?=
 =?utf-8?B?Z3NCUEs0QWNTU2wxeURMU2tVMG9NcVFWa09iNFNJWWhUMHh0bS9VTkY5eE91?=
 =?utf-8?B?ZXNIR3FFcWQwVmYxRnIrVmVtRW9YOU9UZVdWY0QvbzJLK01vQ0pWbm1rQVVl?=
 =?utf-8?B?cXByMVdUblZDYWw0VWIxd2d2aTF1OXU0VGkwRndjTXNmZEpEYWRBQ1lKTWRJ?=
 =?utf-8?B?Y3YxcUl2UGRIZXlCU2szdGNHTFQ4WTlvR0VGNlhOcGVLMCs1VUVxUzh5RUp4?=
 =?utf-8?B?OTBtejdWRnd0Z1pFTWlMSURlcnlEeDlpRTJVUWl1K0t0SytqNnJsT2p0K0l6?=
 =?utf-8?B?ek9rTTBpdlQvYXV1VFNGNlBuUG5mbHMzcE81R2VVSDYxUi84d3hRYTRHcnl0?=
 =?utf-8?B?bkJPWVByN041c0pDeEw3NHAxYkdQc3Y1am96ZHY0cW1UanFHZytvTjRGTVBC?=
 =?utf-8?B?UjhzV290bUg4VGZBN0czMW1sVjZjYXR1dlFsQmRNbU0wVVE5WXdvckVJUjh4?=
 =?utf-8?B?QWJXaFFxcGFnWGNBTTZwbzY4VE9iTHordSttVFVGWkdEUWZZQTRpc1FrYStZ?=
 =?utf-8?B?MjBCbkZQK3hNWGExem13bW11MngvNytRN0cyeFNEZ1haLzFTWGFaWWpselpX?=
 =?utf-8?B?ajZEYzV1Ukl1WEQvb3dCZ0R3RFNaeDhkdloxeUhHeEVCLzVFRE1XK2FEZUxl?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae087a5-9cba-4c9b-e00e-08dd1dc72633
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 11:45:33.4179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXiQWV4FcaIC2c5A8qD9+YLP8Tr0HdLCKyBPAEmeF+VwKGASHPei+gEqmSBiNw/HWx+cMSWHlr6ShU6AupV06WLpUsY7KZgCX8vlEE44RWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7615
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

On 2024-12-10 at 21:05:17 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/i915_hangman: Fix spin engine hang (rev4)
> URL   : https://patchwork.freedesktop.org/series/141694/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8147_full -> XEIGTPW_12283_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12283_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12283_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12283_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@fbdev@unaligned-read:
>     - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8147/shard-bmg-3/igt@fbdev@unaligned-read.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12283/shard-bmg-4/igt@fbdev@unaligned-read.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-render:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8147/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-render.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12283/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-render.html
> 
>   * igt@xe_vm@bind-array-twice:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12283/shard-bmg-4/igt@xe_vm@bind-array-twice.html
> 
>   
Hi i915 ci infra

This patch doesn't affect xe, only i915_hangman. Please update filters
and re-report.

Thanks,
Mikolaj

> 
> Build changes
> -------------
> 
>   * IGT: IGT_8147 -> IGTPW_12283
>   * Linux: xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f -> xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa
> 
>   IGTPW_12283: 61c297bc7e9803cb1849f801aea31b92a03bee74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f: afdbad14a16d9f44489fe37a05e93b24581bdc4f
>   xe-2346-6966a52cb5531bf6cc785fadba160a71cd31e7aa: 6966a52cb5531bf6cc785fadba160a71cd31e7aa
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12283/index.html
