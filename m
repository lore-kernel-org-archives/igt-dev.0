Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2F2C87FCF
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 10:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFB310E0C1;
	Mon,  4 Aug 2025 10:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rb79Qj81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3736B10E0C1
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 10:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754304067; x=1785840067;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=40Jda/qdVVbE/Sm6N8Hm1PsuHfvnXkrxt8nULEve/ms=;
 b=Rb79Qj81I4PA6lQBpyLUO98tYAsl4zJ0ekB1x2tLU6AK49WgjZLoVUTl
 0FixcwegBnRb7gexlpK6XKnSRh7BiHk6CMgTPLX0+hLArVdsiXyo61JL/
 vzfLJazHfQN6ZrfXQ0PhYYeMUSW1lIsh0ryMfYFY0UHBQhBI8DscSrfmq
 XREi0aWlunDYO9/H69Euy2JxKXq33lmfhzUmKKCWo990b6Q7Q8Wb2DlfO
 c89k/wMwJXAB3aNiJHRYJbSFGlTJ/pPcb28DnvoqiamdvGVj3PeniiQOj
 DRO30Rg302Gj9M18oEci++UzwXeWh/nHChHh9kz8562wAGU4nqwCJ32oB w==;
X-CSE-ConnectionGUID: 4ip+LojJT0+pVy0YOw675g==
X-CSE-MsgGUID: 91Qj11N2QQqypOT/m9HgSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56645493"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="56645493"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 03:41:06 -0700
X-CSE-ConnectionGUID: YR7kkwDjQ76zKAq41gok2Q==
X-CSE-MsgGUID: 7N85A573QY6ZDk791MWh6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164577579"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 03:41:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 03:41:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 03:41:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 03:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UustDw17NYJCW7tXUwIOQKLDG+EhPpnwO4bks90n9lS8I0EH7PhwzCgcvLFntG1yeB2n/JwHjYhHAH5xVGfBldat1Ib33SzdpHXpO5DnFBq4zEOoRCaXRFGbenMeBA/nIUCXyVpWOvyiPyGqb4StBx2YcJ316n0ishHLmdJTEBFcFe48lkfea1pB0BYOkByfmNvf5b8fRYEuoREjloV7Yf4hWu8OriT9NS7fHhLgzyQbmgPZQhQPZhuts1TH/laj9J3F44Rs0YTHtxVohd6xvJrDyM3y0zbW4TiUjMVvawXos1Vx1Tzoe3PnQLHGlvzfMJPlZGM4i8C6x4P2A3C63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U51x1ddlJE+KCiat8KlUc4iDEO0wRtrd/b6YVAwXdsk=;
 b=C3GG4VUJa/eku1MArnBS495yiPJCR6vojqZqp0s+VHMaFh03kRWqYP02hqFDdnTXfYLY8dWWHFvjdTc07JJ1aUqxsoDDDKKyPaZtVWKMQh26uzcQbfdifWAH5kljYxeN5egPDDwvgWQGHawYAaPOjq8PnSi78W36Z0QSVzpdcrKf1wK+gFCsOQYU2hyFO7blTFHYEKzgwhgWnDTICn61vPcZ2ardLu+JMEe6tVyX0Nmi2U0ad4qgajFcLWwbReCFeMpa+CJMSimvXlXY6SqvdqbXq8gPyCRC0kV0DpTxtrbSoDUv2EjUcJh5PGmJelp6qcG/+yVdg7kihsEbtEvF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA4PR11MB9107.namprd11.prod.outlook.com (2603:10b6:208:562::22)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:40:49 +0000
Received: from IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6b7e:af5:887a:e384]) by IA4PR11MB9107.namprd11.prod.outlook.com
 ([fe80::6b7e:af5:887a:e384%4]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 10:40:49 +0000
Message-ID: <d6efd3eb-7b50-4d49-b48a-b15a157609fc@intel.com>
Date: Mon, 4 Aug 2025 12:40:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/4] scripts: Update documentation for blocklist
 verification
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
 <20250728173152.220113-4-kamil.konieczny@linux.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250728173152.220113-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To IA4PR11MB9107.namprd11.prod.outlook.com
 (2603:10b6:208:562::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR11MB9107:EE_|SA0PR11MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb3b714-9dc1-4304-74ad-08ddd34360c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEx1QnRmRGd4cGVXL01FUllDUitRODc1YWl0eEE5VGxpQzlCbE5pbFgzOWd5?=
 =?utf-8?B?bWVMRzd4NWxuU016bHdpRVVCUUxuL3gvK1RPUk5jaWRDZG5JRzU4eVFkVE1D?=
 =?utf-8?B?YmdWSlpXbTBoWDkwM29yRzQzeWFON3BqRzlzSUFWVDI3R2xtLzZiSnVLcFFU?=
 =?utf-8?B?d0dpRTBXM2pkdzhPQWdNZXRXQnA3blkrS3VGTGgycXk4aVJMWGF0bWlVTzdE?=
 =?utf-8?B?b0NDelA2TTNVQjNDUzNRNWFQZyttL3VkZXJvSTJxZ3E4VG02aUZzUnpqSnQy?=
 =?utf-8?B?eXdlV2pPSkY2c3BGc1ZTdnRpczJDempnRHhVb2ltZ0F5U0J1dFBDSVBxdTVL?=
 =?utf-8?B?d2hwRE0wNGcxWTZEUXN6aVFMMy9CSDdDMnBudXVKWUJkbGtYWGdaWTJyWHhF?=
 =?utf-8?B?UHJHcytkSFFab2lvS3l1cWdqTzFTYmNKZDB3Z2VHMzZlaDZaWmMvVjZzVFU5?=
 =?utf-8?B?NzZ2MkJtUUFiS25FTWsyT1JFTUVLNmp6Vm5udzNyRlM4VDA5R0ROT3F6eXgx?=
 =?utf-8?B?NHZMT1ZtbXhGMXc2SVNwKzkyOFlicm8rNUptVEg3Y1hvdmJEWGMwUFduRXp6?=
 =?utf-8?B?TEJRVC9jN2hCVERoVGJES0xQVk90dXA0RFdCZ29QN2J0MG5rMlF1Q2hZR29C?=
 =?utf-8?B?em5qY3h0eDJpbUF1c1dUTUpnL29GNzdtOWVqWExvd2NOVVJJc3czYjYyQkNq?=
 =?utf-8?B?YUVlNlRadlBsUUFaOCtUN2VlNG10dTU5YnVVVjdaQUdzTXJvd2RFT2J3YlBX?=
 =?utf-8?B?NXpqcVdWNEs1Ulh3NCtLSUZIaTl6VWlFSzlkczJMcGtGUWo3UGJWb0NhUzhy?=
 =?utf-8?B?YWRXL1UxaTQyTUxpWDZ5M3hJVGd1TG5CVEVlKzZweXJPOTFRR2tNOGt5d2VE?=
 =?utf-8?B?N2lxVEhnbmgrNkNXekVQSjNGd0VPWnVvVnMvVjlvVWcxdGY3S2h5b3A3TlFh?=
 =?utf-8?B?TmI1MVJ5cnpTWTJjeS9rRjRNV0swYTZHdlg0RWQ5Z3pINXA3Sm5zMlBjdHhx?=
 =?utf-8?B?NTZseTFDYXUzVnJKMGM4UUQzSW9lREVUUnpxcXJQSm5pV3BUZ3gyR2xZazdH?=
 =?utf-8?B?RXQyeS9KVXpTQm5KMHU2OE1yZUFEN0tONU1lZHZLTlRZSnBiemFkbFRSMGhK?=
 =?utf-8?B?WFZ5UTJxYzhhVFFwYmxWSjBJQ0xPRjF4ZG5CNitIL3dlbzlsUnNOWnRiQnVq?=
 =?utf-8?B?eUtwK29Td2lIakxYYmkrZ1FVSWhJVDhmTjdFZVFNL25pZ2NOVGVqSDVSWm05?=
 =?utf-8?B?TGFYUkozWHhlQmxWdm9xRUN2YmNhdVZWcmpiODhFUFE2d3pkbG1UVG1XeHRG?=
 =?utf-8?B?WmNFWFZCcGRXa3ozZ25UOU9QSzAvMGxLZzNkZ3JXRklXV0RwQTl3UkdkWUJj?=
 =?utf-8?B?NTBuRWZYcEliVi9Gb2w2Z254c2o5c3RBaUpOMVlKd3lQb0pRRzUyYWtWQTJs?=
 =?utf-8?B?YXpGNWlPWWh2cnNrWEVXbFFBUjByZ2NXL1I3d1FFUWQ0UG1ZS1hXUW01UERI?=
 =?utf-8?B?VGhzNHhhQWZwWkR5RUowQk9yL3d4UWF3SXN1ajBvVFB2T0JrOW5ERnpzYm1R?=
 =?utf-8?B?Q2NPWHF5aVpHRmpTYUh6eitxVmpsVjhtRFdBNUNxZStrcEtHTlNCbThVbjls?=
 =?utf-8?B?QU4zVThsbFpIanFjK1VOV1VoRFFGRnBEVG9vaFZmVFMvdjRPVm1qdlpGTlh3?=
 =?utf-8?B?bnN3RjNmWHBReGszZ0lCUll1dXQyOTExdzg1WTNRdVZsTnJPdFpEa2lOMU54?=
 =?utf-8?B?TE1RTmVIRnFmS3JwNmo0amp0UVp5bzNvY0J5elZ6eFp6WXlSK0p3Y3Z1YjJ6?=
 =?utf-8?B?SUdqcjFsWW5aMnQ1ekkrS004OGlXcmNmQ0hFOW1RTUpVR3BlNXg3UU1oS0h3?=
 =?utf-8?B?cy9QS2drVElFR1ZFSjBJQk1TaFNndFIrbG42U1gyOENkRHNlT0xmK3ZuYWFn?=
 =?utf-8?Q?rHZs/2inQBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ri9vU3JhcFl2dVZGUUsvT09SdGRtRFpCMS9KR3ZpelF0bHhiMUlhZDcwNjRu?=
 =?utf-8?B?aWYwY3dvbDY1d1JQelA0c1dneGF5NkhBNzZCRmtmMXh2ems5bTdvRm4rNXBs?=
 =?utf-8?B?ZjhqQm41QytNNGNhVVBFdHkrOWZEUVpQcXF0c1RDeXJ1OGo2Y1FKTTI3TWdG?=
 =?utf-8?B?U2h2dlEvTGJCVFErYlNiSk9odzAxY05vNis3Zzg3MXNZWm1QaWZ3M0NySENo?=
 =?utf-8?B?ZkVNTXRBSFIvTzhJSngybjFXRXhxMU1ESWxWZEdUdHlxYTBRKzdKNUJPZXdj?=
 =?utf-8?B?ZU43MFEvWWwxN20xT0JWbmVvai85QlNIVTI1czNVRVdEUUJjQTBIaEF1TmxD?=
 =?utf-8?B?Z0R0R0xPZHVZdGx2aWd5RDlRKy9yVWRseGlTMDBVRm5CU2IxbjZmSnU3ZDF1?=
 =?utf-8?B?NUpiUXRUcHBHbnlPT1VqRXRFdzlwUWg4UUMzZ2NxdDVoT1dqcXdyNDZGTkd4?=
 =?utf-8?B?bWY1empsWS9oTlcweVl2bmlBZmtSdVJwMGpaMEYybkZNblYyUEJiVnh0ZUlG?=
 =?utf-8?B?V2VFVHNIQ1V4UmxQd0kyMzR0bGovTjZtVmhWdDZLaE8reXd0OU1kVHZ5Ylpv?=
 =?utf-8?B?SnUzcDk4VDFzR3NzT0dLUFA2WnJvR2tJSDhZN3ZZU0VZZGc5VkZqc0RVVU5o?=
 =?utf-8?B?L0NSVGYvV3hub3BISXlwNWREdDBjT0YrdmgxOTFDcTJuVlh4cE93SE51MEdF?=
 =?utf-8?B?N2FmOUZhRnE5TWZwNWdQemQ2TkM4R0RUcWdZZ2tqZXQ4T0RBc0Ntd2pJaGNB?=
 =?utf-8?B?bGU3NkgwMC91TXo4Rm5nYmp6NUlZMEZLaitweTFOSDcyOWc3eTF3MDhNVU1L?=
 =?utf-8?B?RGluUlpEYW5oSmZUSlErRm9tR2ZzOGZWOTdXWGx2VkxpUXEyRlFzVmF1QStO?=
 =?utf-8?B?Vy9VN0RJNlJFSi9WUkVrUzRZcnFqN0NJcU10M3pWeDZlWTl3MmY3bWNXdTEy?=
 =?utf-8?B?aWlSSEFsV002a3loOHY3ZFdmMExVYkFwTTlDVkZUTXk1UVF4Q3VucGEzWnBi?=
 =?utf-8?B?VHlyUm1VckU3QzRxQUpZbCtQNmRuMDBxU1hFbHF2UmV2blU3cmJGZHJENFkz?=
 =?utf-8?B?RzdDWHNCOFlEdDZXQmFaQVpLa1k5T0RUZ2lDbWFWV0p1RTJ0TmpFUkZONGhr?=
 =?utf-8?B?aC9YSTRXdmdHWFEyVnBNTjBXYVQ0b2ZQUzc4aWFRNHhFMmpYcHI1cXhnNGZT?=
 =?utf-8?B?UEJZMHZDNlFCcmNrTnVrNzdoYnhRVkx1NEpha3NDS0lWSkV3M0ZUVlNqODBi?=
 =?utf-8?B?ZEdDdXNocWYxZlZpemNSR2JKZkM3UW5qSmdEY1dhUkdadGxVVEo1UVM1UVJr?=
 =?utf-8?B?WjBKa1ZJNENSRGdqdWVsalJYc2Fpa1VHUGMrZStWcVdkOUhVZVBaUlJkenF3?=
 =?utf-8?B?M1FmbUtuQXYrSUFlZ3ZZVnZLSGFkRG5rRC9KVnNHY043S0FLYlFEVy84djE5?=
 =?utf-8?B?Zk5xMWFvdm9oMDdtOHROVU45LzkzL1c3N25wVHFjdXUya3VVM05Wa0FGWmdC?=
 =?utf-8?B?eUVuaDVROWFweStBV3Z0ODFaY2dhYWp4U3o5MmMzRmhqemtoUDA4UGU4QkFy?=
 =?utf-8?B?SXJsNHUwV3hvd3pldmk1VkRTVElDekZENkVuQ3RiaysyajJQR0hrSi85c3RF?=
 =?utf-8?B?V0VmMTVYM25jQlFFcUJEWHZYNmdDc25DbTU4U1JXQTMwWTVwbmppeWVMRWhJ?=
 =?utf-8?B?QmZpdkp5OEZOZTYyeDNSNVEvQ3Y5aEYwcDFZdDZtSzQzSlM3ZldhejZuQ0Ja?=
 =?utf-8?B?V3Jyb1lIbGowSkRrcVN3cXhJU2w3TnF2NHQwOXROMmszUGdKUG5jQTNLUHRk?=
 =?utf-8?B?V09qT0FmV2VlNXZEandZOUd3Y3Y0WEZaYUo1T3hvK0lCa0Z1d00zdlNKRkE5?=
 =?utf-8?B?WmprajVIS1BYYUJXVzYxdkxLRitySmpyZEpWdTJMMlZZaGVNREJwRzF0cXY3?=
 =?utf-8?B?Y3pQdy8wQzBVbW1TZEU4OUVQMzZKWTdqeGdRNG1paDZjdDhVemZ1a21NanBB?=
 =?utf-8?B?VHY0YlNJV2cvZXhtWE5mdW93ZjZvenRPenVOckpTV2FwdlBGV2ZkNUxmcnV0?=
 =?utf-8?B?ZzZGK2lVUmpKdVM2RXJoSm5RdUFYZHRJclRqQWl0UUwrWkdlZDFCVEJWUSsv?=
 =?utf-8?Q?InTvTLdP8nRHCdrWSkwhl/CZ6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb3b714-9dc1-4304-74ad-08ddd34360c8
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:40:49.8302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pni9KHsuSYXqFPeAZGqYVjfHtblazzkA0ptOGy1MWWsOGH6vF76ZRhJxHN9ZDF7tE2Qr5voOQhc841S7cHP1oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
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
> Update documentation to be up to date after changes. Also while
> at this, add SPDX MIT licence.
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   scripts/verify-blocklist.sh | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/verify-blocklist.sh b/scripts/verify-blocklist.sh
> index 05383f13f..2bb72af98 100755
> --- a/scripts/verify-blocklist.sh
> +++ b/scripts/verify-blocklist.sh
> @@ -1,13 +1,14 @@
>   #!/bin/sh
> +# SPDX-License-Identifier: MIT
>   
> -# Verify that all entries in a blacklist file are still valid
> +# Verify that all entries in a blocklist file are still valid
>   
>   usage() {
> -    echo "Usage: $0 <path-to-igt-runner> <test-binary-directory> <blacklist-files ...>"
> +    echo "Usage: $0 <path-to-igt-runner> <test-binary-directory> <blocklist-files ...>"
>       echo
>       echo " path-to-igt-runner: For example build/runner/igt_runner"
>       echo " test-binary-directory: For example build/tests"
> -    echo " blacklist-files: For example tests/intel-ci/blacklist.txt"
> +    echo " blocklist-files: For example tests/intel-ci/i915.blocklist.txt"
>       exit 2
>   }
>   
