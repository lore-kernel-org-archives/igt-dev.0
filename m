Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35EBC3ABBE
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 06:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3055710E32E;
	Thu,  8 May 2025 06:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEbmvhzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEE810E32E
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 06:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746685655; x=1778221655;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=qQfBDJr6Q76Nf/hZMu8BU2pvJiZ66SLu396nMUveMck=;
 b=bEbmvhzF7DQMVGqLwAZb8FS/Aq4ETPNxl3Sed3It0v5RYe3AeCahcyf7
 CESevX2yia/uREpKv7Kp3QJiVh8SlUqKhBVqrbBThMHeqOS4dyevHHw45
 5/EVS3R/Y1X1vFpL6qcqFvuYrnsNf8sDYWUJk/gh7NTfu00H7rWeGrSh1
 3EmPWwEDPpYF+RROI0Tg4Y72I9tWh0+oKToi3MoFp5hOUgt3bmrI/ikjL
 42XgW3nhk9bYmi4btKM1huMq2aZP65LaSauRw4BXgoSuUOJHyiuVNMCSp
 vU+DMMlhcqmqTN/34p1SQoJPd6oARk2sm2SlQPiFfQckDVdq9EOjClgqk g==;
X-CSE-ConnectionGUID: pf2FoUxPT0GFTZsfuT2k2g==
X-CSE-MsgGUID: 7b8b7V4BRKqKnz8fyj/2AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48533013"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48533013"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:27:35 -0700
X-CSE-ConnectionGUID: oqfdRUHoR/OoHNzEc4ckpg==
X-CSE-MsgGUID: gaPpFmEkSDG7Twys4lIgGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="141153332"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 23:27:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 23:27:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 23:27:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 23:27:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awcb/nT6bvZM4DSFymtYx+VHUJCdwUqz3Y/FgKU/rrHgHnlBAZQWUABW+XK5n3cq1wFG2ZjldH9csuLkffH17HsVLlKSl9G5tcrqUgNRO1DdVA8mllRb2UipjMYpCtm8hXBu6SF+HBltIqHFAnGPDlUsLAL0OmGvuBtl3jWdPgaGhFPvzdu8hWvwaUqleJ6eAsjeqHidVhH8+VBqt1Uusk8cGnJ2xxFz+D/1Jf1PvG+ibuly2g0suCAHX0a7nTsWKm5APbtONYQBpCgj2OlfHqqo0BFgfYrVEKb5mDbOUk/kv5k8M6d584f7/hBSAy4MeuMQrA2t/fs+aNyLFa8XOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQfBDJr6Q76Nf/hZMu8BU2pvJiZ66SLu396nMUveMck=;
 b=khyrxFbkRKyRymqejJSye6bF4rkV8klvBWqAbWASAoOFDToWQ7kZmup94vmaYlL3+g2VhYRCS5ewBek1oOlYdkjk87JKCBiKGN8nROCgBgFazEi46c/aK8whoO4qyYwrfTEE1zWTyFiMcjIOVDrRjwpQX5j/RQVbOz+Nxo1BuxEZt2F7mMM22byO9xJxobTdE5ThZiE6Tygzb9DMIHkJgqQvFhcPWCoz44gknS5LkeyC3803CJ8PTj8A+JcvwFAM3MR3KszOgIbzkCP/J+gUGPBwbd4aNf8dbaHYWWR0RsDF5BBwRWHMBpIrALQrlXsuzAQ3X/HBTl9Rjr0JF/7OAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by MW4PR11MB6762.namprd11.prod.outlook.com (2603:10b6:303:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 8 May
 2025 06:27:27 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 06:27:27 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Refine FBC
 test conditions for BMG variants
Thread-Topic: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Refine FBC
 test conditions for BMG variants
Thread-Index: AQHbvyH67mgwJsHRTEax1YBoEukxhbPIRkMA
Date: Thu, 8 May 2025 06:27:27 +0000
Message-ID: <9a29dc8154c6d0374aa26ac05bbb79486396a152.camel@intel.com>
References: <20250507073015.1006511-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250507073015.1006511-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|MW4PR11MB6762:EE_
x-ms-office365-filtering-correlation-id: a05593d3-9926-43b8-fb7c-08dd8df96763
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?blFPZDVrQVUvT05sS2FUNFBQZ1VEUXN1MndvY0N1M1NYR3J3Z3hiRG1RTDZv?=
 =?utf-8?B?SC9aZmRCajhraTQwZVBvb0JJUnNxNi9mM0dJSURFNEhUcHQ1L0w3a0lXc1c5?=
 =?utf-8?B?K1pLNy84U1NSUzBTTWRYRWRYN1EzS0c2S0tFR1FEYVhsTVcyQUhJMEY3NDha?=
 =?utf-8?B?RnpOQU51S3dUanNuTGdRN0VKd1Faa3M3ejJ1SGZSMHVqR3l4TXBGeW5ad0Mx?=
 =?utf-8?B?ZlNlMUgyRGNvNjFLa3JmUFNGb2ZKRkI3Q3RkbGwrbERMYWZxcnZSckdDS1Iy?=
 =?utf-8?B?YjdJZDB2NldNdVk4aFZ6cUZhZ2pJL3E2UHdyQmtXeVcvdHg0Tm9rU1FrVDJv?=
 =?utf-8?B?V1FDc3cxRjVUdm0yeUErdnpTZ3JmdlE0ZGxjTHZIdytzOTVZRGlFVFlBWG9O?=
 =?utf-8?B?dFM4dEx2MUQwb2d1MG9pQk1nQkRxR0ZXMXhzbGFUY21uVUU2RUpMdkl1WWM3?=
 =?utf-8?B?Nlk3cktQc2d3K2hHa2JQMERzeXloRTI4ZDFDMTBNaTNDQmxiTU9UWHFyQytK?=
 =?utf-8?B?UmI0M2c2OUtKY0RLeTNLeVEvLytGZ3ptanlNVFZPdXlOS3FFWmtXaVZheEgz?=
 =?utf-8?B?TXBHWmZPaE1Td0xwaXcvcXM5bnVWWUdzdGEzb3lMUk5jVUJZMkVaS3BwVmVG?=
 =?utf-8?B?SjRzT0NTQUl3VFZpNjZvdkhZSklCbnk5OHhlcjNkSEN2QmpiUXlSYW5ZWW1N?=
 =?utf-8?B?Y25Gc2haUWxiSGc1V0NGR3NZQzl3R0R0SjVJbDZ4WFdyTHlCRHdDVEp5Wkkv?=
 =?utf-8?B?b1psdXYyYnM0M2VIR05zNlBoMW9sUGRYRERiZzBQMVE2cnZYcGVac2dPLzhE?=
 =?utf-8?B?QUtUK2tNamFMRDZkUHVCdHdxWTU4QWtSODV4QVNyeWY4dnl1QVdRbzdHMEx6?=
 =?utf-8?B?Z3dwOW5mb3hqOXE1L2M0M1puSG9OUDVyQ0ZRdHdiV0lqYlFLZWlac21ydkFu?=
 =?utf-8?B?WEdFanFVQ0JlaWl6UDdweXNUME9KNHZILzVsSzdXaC9SL3pQdFVqTk9xMnVG?=
 =?utf-8?B?WmEyc25sZUJMT2V3c0EvQmJUYll2SHQ0TUdFbHM3STJiYlF2cjVZbE10Smkr?=
 =?utf-8?B?OWluZy9FcFNiUWl0ZDU5N0Z6bnRrbGVlS2RTR3dNMElGMUljbGdyeXlmTGRp?=
 =?utf-8?B?eUM4NWxsLzMveGVQTHQrQURwQnZRZldIR2VhYXVLRzA2V0p4a2ROUmVvVGhE?=
 =?utf-8?B?TUlhbnJoOG53NlNCOUpHSHU0OFZha3BCRHh1NSthcC9XdkU0VG5UQTlPOU9U?=
 =?utf-8?B?bXpoTTYvY3F6a3I4MFFCazlLdVJ1ZkpxMmJxTWdUOGtFc2FRS0VsWDh5ZDlj?=
 =?utf-8?B?S05aSVJia3V6ZWpFNm54WDRrZERrUXdraWFKN0U4cC9NYUpCb3RVdm1IaFA5?=
 =?utf-8?B?a0N2b2NzNUdIOTkxRjdRTWRWYmFTa29pNHNlMGYrWnBsRGY2bit4a3VCL21U?=
 =?utf-8?B?dGVUQmZINXZZZGNIejA4MlcvdWIzU2tqQjBFWjlxTnE0WGZsTlE2MFgvNWNz?=
 =?utf-8?B?Yy9xQXB5OTNZdHR1TGowRlk3Nml1dFQxM3BjU3VpWHROamkrb2x5QlBRY1R6?=
 =?utf-8?B?Smd0UVZOZkRISXZDa1k4QjdHT1RHd1ZLMVJzMjVuc3FmdDR1OXp6Mldla25Z?=
 =?utf-8?B?UGdLUjhVYXFhSUY5amdoZlJ4RUFwRzRkVHhNSktNQXZFYkJUMVBCMmhqcXRn?=
 =?utf-8?B?THJtMmRNaEcyMVhva21zYk0zU3FybVk3Y1FKZlBaWElYNTNzTDNyRFpldU1m?=
 =?utf-8?B?Y0ZONy96T2g1ZEo5cjFOUzkwc25LT0NrcWNnNHRSeEpHOTV5Smxnemk0V3p6?=
 =?utf-8?B?NXpmZHVZbk1KZGpETjRpelgzZUlvLzUyeTdNMTZjS3lEcmdNb09ubm5sWElG?=
 =?utf-8?B?bGFUaVJ1Q0lPMldzRWJiR3podXhuak1OR2VySDM2U1Q4VTdMWDAzNG9GYVpT?=
 =?utf-8?B?c1I5aWV4c0NNM1BleldFSzRPUHpYR1hjZlFmdWF3azVwem13STlMMHlUQUEy?=
 =?utf-8?B?cUQ5STFKUnJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFBjeHpGUjVPbHp4WjlNekRmblIyTWVKemZ1MkRHL3BXTVQ1ckhQTkNDYnJ2?=
 =?utf-8?B?Yjl2dUNubU9pN1ZGTzJhVFAwYWdJN0FrNkp1YU4xUWtRV1B6ZkNyaVZNODhi?=
 =?utf-8?B?R3l2Q2RPRjlmWFNIYk9saU1ZMnRMbGcvbWt6RGwwSDh2R1RYdkU1QTR1QVJS?=
 =?utf-8?B?dHQvczFFVmtjaXQrN0MwTU1PREpIVWw0UnlpeXRCUkpnbFV6M1d2RmJnNUhK?=
 =?utf-8?B?U2RrV3ZnQTVRaFA3MUU1bTlDV3diRmErajJUV0RMWVFnUDErNnFCRVhoaUF2?=
 =?utf-8?B?c0x0ZkdvejU1RlhyL0lUZCtvWWppYUJBdWhoY2pKZm91SHNqYnVkRy95RlQ1?=
 =?utf-8?B?b1lTRXVHa2RhS0h5a2F5Y040MzdHL2JlTEluSFkxaHo4OU8rS00wZzVFT05K?=
 =?utf-8?B?enBrQ0E5SThFa2N4TlVHOEdjZW9nR2M2eVM1MERxLzVsTnAzaXpTMm4zUFhp?=
 =?utf-8?B?bndacVdVS1BoeUV5ZUVLa3ViN3UyS2NMbWpvNzNMSmpCMVoySGtIYTY0MVlF?=
 =?utf-8?B?a3NSMXdiZ1NtcDFlU1Y2RnZUUGdsZnBNbVRnV3RXT2hPQ1FUcmdjN0M1Zm4v?=
 =?utf-8?B?ZlJKQzhtWm8xd25vKytXNFdybTFGNzVDcHFDVW9tckRrSFo5ZGMvSEZjb1lh?=
 =?utf-8?B?YTk4SnZSOFV4blBOSStycml4SXF0SGpQTHYyMlgzNXl3Uk54eXJQZnI3QWVW?=
 =?utf-8?B?YjRhdWE5T1JPNXBPMEdCV3VqMDZhU3FtWXNkU215aXYwRXVpL2ZiSExub2VI?=
 =?utf-8?B?YklLcVVMWktKOTdPSHhxT084dDFjZmFZcFFKQmhCRWwreU04UlVJU3NDMVFY?=
 =?utf-8?B?cGVrNmdHREF4RENhbDZVOGFpQ3lJT1IxMndDUm43bHN6dlM0YXFNWVdZZnpt?=
 =?utf-8?B?UEhocm9LQ2k3NkwrcmhCdnNPVFJhQWoxNml0NEoyNG9tbGFHdmZEeXkybFJL?=
 =?utf-8?B?ZXUyVXZlM1JzNHRJQVpxdU50dDJZWEdzUVk2ZTE0ZE9BU2FwcE1qOFRFQnpW?=
 =?utf-8?B?U2hlb3Btd3RZOHo0dUdtWU9WYnZJbnVwZFFZWndrUit4dy83ZTFJak9oSU41?=
 =?utf-8?B?Z2VOSEZreWp6NnMyRTZpZFJkT1V6NXVSY0pJTldPUDRRNHZvamxSOEx3R0lG?=
 =?utf-8?B?ZjRFSzlRZEpiWXRIck1vWnFablhnUjVnTDJ1Ujg4cTFmS0pJUWhBTWlkUEp3?=
 =?utf-8?B?eXVCUHNDU20rektZOElVTW1yOE1IUEk3WEx0YWxSRlE3UkVnYXpDTUlaQXBk?=
 =?utf-8?B?NGo5eW9wNUJjMDBpRExKZ2k0WFgzMWZhZXZWWE5lU0pyNHZGcFBMMm5rdUIw?=
 =?utf-8?B?Mmt2R3NpbW1GRUttZHBkWHBWS2FNeUJncUpiV1c1cndZSWxtRDhUUllrbm5B?=
 =?utf-8?B?b2Rqczk0cWpIRGNjZGNodGU2KzlkNExMNlZyek9rSk5nZURISlY5WEt6YjUx?=
 =?utf-8?B?NTdIeXp5NnUwZU9JUU9rMStxRms4M04zY3kwT1dmMFZJYUxUeXEzTzk0R2FU?=
 =?utf-8?B?MDhHYk5TaVlNMmJpaTl5OXlET2xvWU41T0IyOXdOdDd5d01jT1RkczUwM0tj?=
 =?utf-8?B?KzVJYkl0Szl6RVFxb0l6aTBSWTg3ZVBoU1liaXJoazZKRFJUSTRXVjNlcFVC?=
 =?utf-8?B?OXNWbXlCUEtHVm9uWEdKTFhQUnQzSGhqTld2YnNhZ0tycmRadU1iZGtEaW9r?=
 =?utf-8?B?cWM1dnduTHV5eWxGR3J3UGxCRVBYb1lNT29XZUgvNlBGaTlhNUpxYUlGUHZF?=
 =?utf-8?B?ckYyRU9ZZmFRbVdOdnh0VzJlNXdXL2w5dHVNWnExcWg4MXdOTC81TGdKaXlP?=
 =?utf-8?B?QmZhVkNXSWFFRmNWdmJpZW02L3hQSGVLVUVJVDBPU2ZmSk5jWERQckx2bkR1?=
 =?utf-8?B?WDdEUzRxUXhOS1RyTVB2VVVMaFljTURCY2hIMlNrTXE4WlB2TmxPRFNEcE5F?=
 =?utf-8?B?SVNMMlZFci83dzFMZTJ5NnZBdTQ5cHJ6WDZQV2FWKzZ4aUYycWwyU0VFMFJh?=
 =?utf-8?B?aythOThoQkUxUC8xYi9lNU01Syt1cjEzRWdhNDRXem5jc2pzQXZjcFNpTFJ6?=
 =?utf-8?B?c3RQRm44bzY1bzR6NU5lUm9QTm9QUFNNTEd3RG5tWlZaeG45d1A0VldXZGFa?=
 =?utf-8?B?MEJrckVZRkxEdU1jSUlwNnBtemVYa0NoWjZxOFdVVS9STnpaZy9QQ1BZcUFo?=
 =?utf-8?Q?a9XxJXc4CZG2m/1plI2Um1Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59B4A5706FBAFE43A4AB2E99A99306C5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05593d3-9926-43b8-fb7c-08dd8df96763
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 06:27:27.7131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3VnxH9HeAhBiw2+MI1IGRrrwGChyC6cguv9tvzbSyRkERmfOjh880V5nz8j8hVDIYFghXqn91Y+KJJWT+z08R56HY4dnai7F1IVE2JMuLLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6762
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

SGkgDQoNClNvbWUgY29tbWVudHMuDQoNCkkgd291bGQgc3BsaXQgdGhpcyBpbnRvIHR3byBwYXRj
aGVzLA0KDQoxLiBFbmFibGUgdGhlIHRlc3RzIHN1cHBvcnQgdmFyaWF0aW9ucyBiYXNlZCBvbiB0
aGUgV0FzDQoNCjIuIEFkZCB0aGUgRkJDIHNwZWNpZmljIFdBIGNoZWNrDQoNCk9uIFdlZCwgMjAy
NS0wNS0wNyBhdCAxMzowMCArMDUzMCwgTW9oYW1tZWQgVGhhc2xlZW0gd3JvdGU6DQo+IFRoaXMg
dXBkYXRlIHN0b3BzIHNraXBwaW5nIGZiYy0qIHRlc3RzIGJhc2VkIG9uIHRoZSBCTUcgcGxhdGZv
cm0uDQo+IEluc3RlYWQsIHRlc3RzIGFyZSBleGNsdWRlZCBvbmx5IGZvciBzcGVjaWZpYyB1bnN1
cHBvcnRlZCBCTUcgdmFyaWFudHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNb2hhbW1lZCBUaGFz
bGVlbSA8bW9oYW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBsaWIvaWd0X2tt
cy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAz
MCArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoGxpYi9pZ3Rfa21zLmjCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+IMKgdGVz
dHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfMKgIDcgKysrLS0tDQo+IMKgMyBm
aWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2ttcy5jDQo+IGluZGV4IGYzYmM0ODFm
Mi4uNjY4ZGE1OTE1IDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2ttcy5jDQo+ICsrKyBiL2xpYi9p
Z3Rfa21zLmMNCj4gQEAgLTYxLDYgKzYxLDcgQEANCj4gwqAjaW5jbHVkZSAiaWd0X2RldmljZS5o
Ig0KPiDCoCNpbmNsdWRlICJpZ3Rfc3lzZnMuaCINCj4gwqAjaW5jbHVkZSAic3dfc3luYy5oIg0K
PiArI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+IMKgI2lmZGVmIEhBVkVfQ0hBTUVMSVVNDQo+
IMKgI2luY2x1ZGUgImlndF9jaGFtZWxpdW0uaCINCj4gwqAjZW5kaWYNCj4gQEAgLTc0NDIsMyAr
NzQ0MywzMiBAQCBpbnQgaWd0X2JhY2tsaWdodF93cml0ZShpbnQgdmFsdWUsIGNvbnN0IGNoYXIg
KmZuYW1lLA0KPiBpZ3RfYmFja2xpZ2h0X2NvbnRleHRfdCAqYw0KPiDCoA0KPiDCoAlyZXR1cm4g
MDsNCj4gwqB9DQo+ICsNCj4gKy8qKg0KPiArICogaWd0X3JlYWRfZGVidWdmc193YToNCj4gKyAq
IEBkcm1fZmQ6CUEgZHJtIGZpbGUgZGVzY3JpcHRvcg0KPiArICogQGNoZWNrX3dhOglXYSB0byBi
ZSBjaGVja2VkDQo+ICsgKi8NCj4gK2Jvb2wgaWd0X3JlYWRfZGVidWdmc193YShpbnQgZHJtX2Zk
LCBjb25zdCBjaGFyICpjaGVja193YSkNCj4gK3sNCj4gKwljaGFyIGJ1Zls0MDk2XTsNCg0KV2hh
dCBpZiB0aGVyZSBhcmUgbW9yZSBXQXMgdGhhbiBpdCBjYW4gZml0IGludG8gNDA5NiBjaGFyYWN0
ZXJzPw0KSU1PLCB5b3UgbWlnaHQgaGF2ZSB0byBkdW1wIHRoZSB3aG9sZSB3YSBzeXNmcyBmaWxl
IGFuZCB0aGVuIHNlYXJjaCBmb3IgdGhlIHdhLiBSZWY6IGlndF9zeXNmc19nZXQoKQ0KDQo+ICsJ
Ym9vbCBmb3VuZCA9IGZhbHNlOw0KPiArCWNoYXIgbmFtZVtQQVRIX01BWF07DQo+ICsJdW5zaWdu
ZWQgaW50IHhlLCBkZWJ1Z2ZzX2ZkOw0KPiArDQo+ICsJZGVidWdmc19mZCA9IGlndF9kZWJ1Z2Zz
X2Rpcihkcm1fZmQpOw0KPiArDQo+ICsJeGVfZm9yX2VhY2hfZ3QoZHJtX2ZkLCB4ZSkgew0KPiAr
CQlzcHJpbnRmKG5hbWUsICJndCVkL3dvcmthcm91bmRzIiwgeGUpOw0KPiArCQlpZ3RfcmVxdWly
ZShpZ3RfZGVidWdmc19leGlzdHMoZHJtX2ZkLCBuYW1lLCBPX1JET05MWSkpOw0KPiArDQo+ICsJ
CWlmIChpZ3RfZGVidWdmc19zaW1wbGVfcmVhZChkZWJ1Z2ZzX2ZkLCBuYW1lLCBidWYsIHNpemVv
ZihidWYpKSA+IDApIHsNCj4gKwkJCWlmIChzdHJzdHIoYnVmLCBjaGVja193YSkpIHsNCj4gKwkJ
CQlmb3VuZCA9IHRydWU7DQoNCkFsc28geW91IG1heSByZXR1cm4gZGlyZWN0bHkgZnJvbSBoZXJl
IGlmIHRoZSB3YSBpcyBmb3VuZCBhbmQgdGhlbiB5b3UgY2FuIGF2b2lkICJmb3VuZCIgYW5kIGFs
c28NCnRoaXMgbG9vcCBtaWdodCBsb29rIGNsZWFuDQoNCj4gKwkJCQlicmVhazsNCj4gKwkJCX0N
Cj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCXJldHVybiBmb3VuZDsNCj4gK30NCj4gZGlmZiAtLWdp
dCBhL2xpYi9pZ3Rfa21zLmggYi9saWIvaWd0X2ttcy5oDQo+IGluZGV4IDAzODFjODJhZC4uY2Q4
M2E1NmU3IDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2ttcy5oDQo+ICsrKyBiL2xpYi9pZ3Rfa21z
LmgNCj4gQEAgLTEyNzksNSArMTI3OSw2IEBAIHZvaWQgaWd0X3NldF9saW5rX3BhcmFtcyhpbnQg
ZHJtX2ZkLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwNCj4gwqAJCQnCoMKgIGNoYXIgKmxpbmtfcmF0
ZSwgY2hhciAqbGFuZV9jb3VudCk7DQo+IMKgaW50IGlndF9iYWNrbGlnaHRfcmVhZChpbnQgKnJl
c3VsdCwgY29uc3QgY2hhciAqZm5hbWUsIGlndF9iYWNrbGlnaHRfY29udGV4dF90ICpjb250ZXh0
KTsNCj4gwqBpbnQgaWd0X2JhY2tsaWdodF93cml0ZShpbnQgdmFsdWUsIGNvbnN0IGNoYXIgKmZu
YW1lLCBpZ3RfYmFja2xpZ2h0X2NvbnRleHRfdCAqY29udGV4dCk7DQo+ICtib29sIGlndF9yZWFk
X2RlYnVnZnNfd2EoaW50IGRybV9mZCwgY29uc3QgY2hhciAqY2hlY2tfd2EpOw0KPiDCoA0KPiDC
oCNlbmRpZiAvKiBfX0lHVF9LTVNfSF9fICovDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9r
bXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyBiL3Rlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90
cmFja2luZy5jDQo+IGluZGV4IDA4MDkzNTJjYi4uNTZkNmM2Zjc0IDEwMDY0NA0KPiAtLS0gYS90
ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiArKysgYi90ZXN0cy9pbnRl
bC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiBAQCAtNzgxLDYgKzc4MSw3IEBADQo+IMKg
ICovDQo+IMKgDQo+IMKgI2RlZmluZSBUSU1FIFNMT1dfUVVJQ0soMTAwMCwgMTAwMDApDQo+ICsj
ZGVmaW5lIENIRUNLX1dBICIxNjAyMzU4ODM0MCINCg0KTWF5IGJlIGEgYmV0dGVyIG5hbWUgZm9y
IHRoaXM/IFdBX0ZCQ19ESVNBQkxFRCBvciBzb21ldGhpbmcgbGlrZSB0aGF0Pw0KDQo+IMKgDQo+
IMKgSUdUX1RFU1RfREVTQ1JJUFRJT04oIlRlc3QgdGhlIEtlcm5lbCdzIGZyb250YnVmZmVyIHRy
YWNraW5nIG1lY2hhbmlzbSBhbmQgIg0KPiDCoAkJwqDCoMKgwqAgIml0cyByZWxhdGVkIGZlYXR1
cmVzOiBGQkMsIFBTUiBhbmQgRFJSUyIpOw0KPiBAQCAtMjYxMCw3ICsyNjExLDcgQEAgc3RhdGlj
IHZvaWQgcHJlcGFyZV9zdWJ0ZXN0X2RhdGEoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCwNCj4g
wqBzdGF0aWMgdm9pZCBwcmVwYXJlX3N1YnRlc3Rfc2NyZWVucyhjb25zdCBzdHJ1Y3QgdGVzdF9t
b2RlICp0KQ0KPiDCoHsNCj4gwqAJLyogRkJDIGRpc2FibGVkOiBXYV8xNjAyMzU4ODM0MCAqLw0K
PiAtCWlndF9za2lwX29uX2YoKElTX0JBVFRMRU1BR0UoZHJtLmRldmlkKSAmJiB0LT5mZWF0dXJl
ID09IEZFQVRVUkVfRkJDKSwNCj4gKwlpZ3Rfc2tpcF9vbl9mKChpZ3RfcmVhZF9kZWJ1Z2ZzX3dh
KGRybS5mZCwgQ0hFQ0tfV0EpICYmIHQtPmZlYXR1cmUgPT0gRkVBVFVSRV9GQkMpLA0KPiDCoAkJ
wqDCoMKgwqDCoCAiRkJDIGlzbid0IHN1cHBvcnRlZCBvbiBCTUdcbiIpOw0KPiDCoA0KPiDCoAlp
ZiAodC0+cGlwZXMgPT0gUElQRV9EVUFMKQ0KPiBAQCAtMjY1OCw3ICsyNjU5LDcgQEAgc3RhdGlj
IHZvaWQgcHJlcGFyZV9zdWJ0ZXN0KGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUgKnQsDQo+IMKgc3Rh
dGljIHZvaWQgcnRlX3N1YnRlc3QoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkNCj4gwqB7DQo+
IMKgCS8qIEZCQyBkaXNhYmxlZDogV2FfMTYwMjM1ODgzNDAgKi8NCj4gLQlpZ3Rfc2tpcF9vbl9m
KChJU19CQVRUTEVNQUdFKGRybS5kZXZpZCkgJiYgdC0+ZmVhdHVyZSA9PSBGRUFUVVJFX0ZCQyks
DQo+ICsJaWd0X3NraXBfb25fZigoaWd0X3JlYWRfZGVidWdmc193YShkcm0uZmQsIENIRUNLX1dB
KSAmJiB0LT5mZWF0dXJlID09IEZFQVRVUkVfRkJDKSwNCj4gwqAJCcKgwqDCoMKgwqAgIkZCQyBp
c24ndCBzdXBwb3J0ZWQgb24gQk1HXG4iKTsNCk1heSBiZSBhbGlnbiB0aGUgZGVzY3JpcHRpb24g
aGVyZSB0byB0aGUgV0E/DQoNCj4gwqANCj4gwqAJcHJlcGFyZV9zdWJ0ZXN0X2RhdGEodCwgTlVM
TCk7DQo+IEBAIC00MTU3LDcgKzQxNTgsNyBAQCBpZ3RfbWFpbl9hcmdzKCIiLCBsb25nX29wdGlv
bnMsIGhlbHBfc3RyLCBvcHRfaGFuZGxlciwgTlVMTCkNCj4gwqAJCQl0LnRpbGluZyA9IG9wdC50
aWxpbmc7DQo+IMKgDQo+IMKgCQkJLyogRkJDIGRpc2FibGVkOiBXYV8xNjAyMzU4ODM0MCAqLw0K
PiAtCQkJaWd0X3NraXBfb25fZigoSVNfQkFUVExFTUFHRShkcm0uZGV2aWQpICYmIHQuZmVhdHVy
ZSA9PSBGRUFUVVJFX0ZCQyksDQo+ICsJCQlpZ3Rfc2tpcF9vbl9mKChpZ3RfcmVhZF9kZWJ1Z2Zz
X3dhKGRybS5mZCwgQ0hFQ0tfV0EpICYmIHQuZmVhdHVyZSA9PQ0KPiBGRUFUVVJFX0ZCQyksDQo+
IMKgCQkJCcKgwqDCoMKgwqAgIkZCQyBpc24ndCBzdXBwb3J0ZWQgb24gQk1HXG4iKTsNClNhbWUu
Lg0KDQpCUg0KVmlub2QNCj4gwqANCj4gwqAJCQlmb3JfZWFjaF9waXBlKCZkcm0uZGlzcGxheSwg
cGlwZSkgew0KDQo=
