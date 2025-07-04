Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D86DC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 10:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1ED410E201;
	Fri,  4 Jul 2025 10:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFV2UtoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C8110E201
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751623274; x=1783159274;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sk8h5xLCIZRR9EftaowxwJSoKNSfOZF3e3DqnN70fsY=;
 b=FFV2UtoTBuDg42UEKYhDk4VP98wfE8IIWHPvCG4ezvNtAe9YJrtF3Ola
 BtGEh6hnI8N6RBfsslPXDowPyWGIE+PC8zoONermVRV4tuxLDAjSki6Gi
 pxxLOZBfIKiSvtQt0i2ChOg2bP2p5easgVOvMaGGM8wl5SIOtv2DHEGq/
 gqARYZ3Y/UO9uFo6Ad5kRYZkmmrek0xbVoFk7Ntsh9vWd+Z9Qntw7cYeZ
 6lTPTK1G13ieTK/SziHFtza1FDZAtTNLVxMPGI9CA9q4c6eCnMCAB41Gm
 +RkqDN+wYQhOOECDtasl2Tom8l2rZ3pDvxz06rE2uiGjMcUJ88HQ1EJ0U Q==;
X-CSE-ConnectionGUID: E2rEEDZfSZC6Qaw++BKppQ==
X-CSE-MsgGUID: ZLS4Cg70SZqFGwUMS4IbFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65307116"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="65307116"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:01:14 -0700
X-CSE-ConnectionGUID: OoNqywcUQrWNM1kGgZcpPA==
X-CSE-MsgGUID: Lq4v/6GOQROovT6byojkaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154358777"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:01:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 03:01:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 03:01:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.83)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 03:01:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=la1nmjU+AG18Q6gXeSyNiBE71mIx9UjYTNAyQ70n7s2Yc7cV1T6a23L41o+fjrVxZOWN6rvjx30tyczQEW2RlmtKtIZkJp6uU/mBkCKKmg8kuFBGSh+T3tYr0mekyZ/RU3WkWQgDWOZsuNOdYoJIat/v/DUPs3XUWCYA2E5rv69VrEsagsygJajbDinRupChPjXnlyzY/Mwd0VGcQywLjnUHtXw9kRVrfX+eBEDESGFHnontpZyYhuohdPxzTbazEyRBHM+e/JmfhbrXMn17Sj5td6Hhs6fmdbnqYNIX0V7k5Fhqj9yyFnv/T9LbK5SNtPtnnCpsgnrVrwZYh3SB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSfVtePgVSKQnJgnHbuzE9ixNgqobPaq/HAMxdyS4ss=;
 b=lJFpTwWMTQedhT6ZHo9mktf7dqOBAwy1Zsh0LOlJVpH+yG6CU3dGmdc3SfR6Uvo7Z2IW7DMHbWfOdyjhILJ+ufi5RJjUQjR3qUZd4ZNmgzBRsURb5GPAZ3+qsNExbfMxmJPQjTVpA/JLdWQ1iWUaTiZhNbb58B+wJcvkIxEx/jmUbBHU1RULPOU3X08jfOpfCQuz20FaMhTawXwbPBkHrTKfHWXbQzXajN/88bHUe9TWmHpu2JLSjzNDKaZQTimSpRs7tDhircnmOJOUzyXBlW7EmUQIURLRa9XAnMFqQ7AJiY/LRMwbD46g1MQrXBvlqqHpE4/2C5T8iHazzzGbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 10:01:10 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 10:01:10 +0000
Message-ID: <830d9413-7f7c-47cc-9473-50a59e4ccd79@intel.com>
Date: Fri, 4 Jul 2025 15:31:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 resend i-g-t 3/6] tests: Add core_debugfs_heads_power
To: Peter Senna Tschudin <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 <michal.wajdeczko@intel.com>, <marcin.bernatowicz@intel.com>,
 <kamil.konieczny@linux.intel.com>, <katarzyna.piecielska@intel.com>,
 <zbigniew.kempczynski@intel.com>, <ewelina.musial@intel.com>
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
 <20250616074240.45818-4-peter.senna@linux.intel.com>
 <aGbqZTPOpf79Xxx7@intel.com>
 <bb7e190c-203e-41f5-a367-baf5a0acf4ca@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <bb7e190c-203e-41f5-a367-baf5a0acf4ca@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3a7410-d0df-44ef-b818-08ddbae1b3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1kxVDlTUzk4VFVxZHl3WVFIcE11UE9abDZ3RlpLdFRyd1RvZVVhQkhyd3l2?=
 =?utf-8?B?NjUwSjRUY3lLancxRDVVbXdmdllRTWtvODdCK0E0WGI1RnBiVmxoeVY1YjJ6?=
 =?utf-8?B?MWZDek9xeGF1U1RiTTd5NitnSlhpUjVmMmFJNWZwckFXMnEvR29JZWdsWlc2?=
 =?utf-8?B?UVl3WmYrdDF5TnBpMlBLc3hIWGs0aGJ6K0s2MlJ5Wlk1d3ZXa25oVi8wYUh2?=
 =?utf-8?B?a2FPZ2MyNTBYdE1Jbkh0VUNaa3NVYmcyU012NGxoakRrbExJZm14RlZpS3Y1?=
 =?utf-8?B?ekN5VGxYb2NPaWE5R3hmaDU3L1JEYy83Q0FrK2VUV28rU3JVcU11RjlOdjhK?=
 =?utf-8?B?TU44bWNqZG9WUEFIKzkrM2o0NVd3MXdacW9IL3lqeVdsd2tGUm41QmxUNFpY?=
 =?utf-8?B?SDVkRHNDdUorWWdFb2N4bzdyQ3AvV29MbWZZTFFEYTNlN1k5Z0lKbWF5b3No?=
 =?utf-8?B?emIvZW9VTTBBTlo2ZzBJNndkVVhQSlpxMWdKcmJFd2s1NzVXOWhiMEo3bFZz?=
 =?utf-8?B?VE5HYU5hdHljeGJIdC9pMlJTeG5VM3E3cHdHcHpqeCtxNTlORmJRakc3a3Zp?=
 =?utf-8?B?RmRTUFJreDgwbEQ1TFEzdkFkTUZCMFpaUDIzWFErSzc0Y1EwNWZSQ2JGUWli?=
 =?utf-8?B?WGI4d3JXbURPQWw1UW5qM0M5d1NBS2R6aFdKNTAxeFlVKzJlWndtNnMzR1BU?=
 =?utf-8?B?Y3lucUlkbEhVRmN6QkFOOWdLa2tReDhqRkZPdWdLRDBIMFZLOVAvZ09MNEpW?=
 =?utf-8?B?QUxrcWtIbzV0MTRnSFBGaUNBam15Y2hoNXFJeDdPZ3V0cTFRZ1YrZlRtQ2kx?=
 =?utf-8?B?LzRIYjFJbnd6K2w1V0dDOXh6MGZhUGNuaDhGclJDeDU0dTZNRG1UQlpVUmhz?=
 =?utf-8?B?cnNha1FzYUxJTkJLMmFIaWJvTDJHbVZDd0IrWm9LK0Q4NzdMa2YvT3FvVzN1?=
 =?utf-8?B?Wk5zKzBkaEJqTERkNHNWdGxma0hUNjRRbVdhMzJBcGhFbTdjNHNGTXRnS1gx?=
 =?utf-8?B?VU1XM0FxUjZraFkrZFVTalprRGV6eDZXWG1KeVorOEo3aGZLdUN0MnlZaDZ2?=
 =?utf-8?B?bStwMlhvZ2g1Wmx3ZGg4QzAvcmlJTGhlVm5PZ29uMTdtWWhRVlUwYUJGSmEw?=
 =?utf-8?B?cGRMdjlRYTR0eHhQcEw0NnladWVCRnpVRjltWXlzalZjVVNyRW5oRmNnNkM2?=
 =?utf-8?B?WndDbzk4eHU2TFhVbmsvejc1RnBoOTR0bUpxQkhKaDBFZjJPQTRZZDRENXZU?=
 =?utf-8?B?bFN5eE1zc045ejNrK0N5UzBmV3NFMUJUWEloZGo2eWNDSlh3cXk0ai9hOWxR?=
 =?utf-8?B?MEE0cHpCdTV1N21pYXRjYjRmRWE4blFLMXlRTVB0dS9uM3psa1F4bG9kQ09o?=
 =?utf-8?B?a3E2bXNnOUNoZ1IrZ2dXVkZZc1hYejRRT2xHSDZHcmE3dHFyM0xBR2syb1ZZ?=
 =?utf-8?B?SFRSMW9QWXVlanZEWkwwRjN5WjdlV3BIQzBDWHB3T0I1WGxodG8zQUdTRmxD?=
 =?utf-8?B?UENWMS9Vem9LcVRiSWE2RFgrMTBiL1ZUcEhlWWV3bVdIUGZyZGNJVmZ5c0FU?=
 =?utf-8?B?SG13dkkwR29OUHNMY0doSkRYZGV5aFdmbWtlWEtnQ2paUDdFaktGNDJnMlcv?=
 =?utf-8?B?UFErc2ZBZTBzNk8yRFdJWFFMSlBSQkdyQUZsbEZINzFIcERZYlQydjJIWXdM?=
 =?utf-8?B?THBtREdUTWErSVVwVGZ5MklmZ2kyMVFEdU5CVnM1a0lvY04yNityYVZLRnVu?=
 =?utf-8?B?bkt5N0dzdUlwTk10WGJWQVN6NnF2bmJyZjVoOHVwL3E5VVB5NGFlcU5MU3BU?=
 =?utf-8?B?azc5Q3pwVXFvdklEY3dYeG5TQVZhc2xYNDRBSitiM0pIRkVESjgxNnZIK2hn?=
 =?utf-8?B?VjAwNk53WkR4TVNsWUVaeVRyRGNiWTZCVmFURXY1Y2tmSWpkUjJQNDlYbm9s?=
 =?utf-8?Q?iPjkHMvEoak=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0lRY1VkYml2Z0xYSUQwaElFYkVJMUs1WTY3SG5mUFdZQXhKbnI3ZU05d200?=
 =?utf-8?B?RDJMM3BFakNzZFBOOE1ra2NacW9ic3VTRStLUHoySnhSVTAxVFVqMGg5bEts?=
 =?utf-8?B?R1BoN3JXK2MwZUhEZm9zbnZiSDhaSjFleGdGbVBLbWhkaVgzb01KSXBpamVn?=
 =?utf-8?B?NDJrWkZZcytZZ0hRby9GME1zWGRPeTV4TTRFb2xDZ0JzVEFuYm56MHVFZWNK?=
 =?utf-8?B?WlNWc1crenlGc2d0Y3IxalZMcU1PTFhRZWhPVmIxODYxN3lrblBmS1JUWUpq?=
 =?utf-8?B?dXVmU3pSd01pZ2xUTndQdFVVTW8vOXZvKzZTVjFYQnpEQ2V3L1VUNEJJMDFO?=
 =?utf-8?B?VE9oOTNOWDkzNEpKSmg3VExPNm5jb1lGRzVHOEw1OEY2ZUNud1J1WDlPbVVP?=
 =?utf-8?B?Rzlqb1d0aTNIK2gxSXpVZjdQajFEaVR5NGdieWtDWTkwVlZjdlhPekpNOWpk?=
 =?utf-8?B?RGxYME5RWVdWMWFXSldUMm1jaUZuU1JoWkIzbzc5Wnl3Z1FaWHVMYWVkd3J6?=
 =?utf-8?B?OGw0bVRwSTl0WXdxWkdyUlFxZVQ1SnJGUkRYK20xblBiNFh2V3dudHVpWGth?=
 =?utf-8?B?U3I2S3VrYVQyRUcyMm52UnpiYWhaMTNMU3hVSjZacC9MbHhqUDlwc2NWa3hh?=
 =?utf-8?B?OE5mWGlLNEY0d0ljeTArVHhmT1ZhRFlaWExuNDIza0lsUEE0MUFlckFGSjFM?=
 =?utf-8?B?QTFmczRjRnYrNnY5Tk04SENSeVJYSTFxYXZtWVVXc2wwd3ZNT1d3QlhwbFRl?=
 =?utf-8?B?NDBzN1JHZXRsWW1KWm5YYUhidGFyQTVobWhkTS96Ujg0VjFERUdVbC9NZjVY?=
 =?utf-8?B?WCtzU2QyMUFwaXB5V0NKeDIrcTNtZDl0dTVRZmlCSHVFeW42RVMxWWVhVlc1?=
 =?utf-8?B?MHlETWJjVDdBdytFUDcwYldaYzVRMk5FNEFmbDZhUFlFT25EWjlhWUhTS0E0?=
 =?utf-8?B?OU00enVjYStiZmxjbUZRNEdYZXhiWTJmUU5mUVZXdkJscnhMNmpjVStmK01C?=
 =?utf-8?B?K1lpNlpDaVVMNDV5UTNBMEZKM28xWnRkOHY3T25kV2srSjhqT21FWllpL2U0?=
 =?utf-8?B?TmtaNEpucFRLRmg5LzhFam5HSWlTZDlFeUp5UUlRN2R5cEp1UEJ1U3dmcEl0?=
 =?utf-8?B?b2VTTjhrZ2RNVFlMRUhWZzE4NktzOHF6ZVdaVkkvMXVMRiszK1ZmMFFDUDJO?=
 =?utf-8?B?MnpCS1J5ZFJZUEM1M1QzRklIeWh0NFJKYTNFZ25Mb244WHpXQ29hQnlDaVps?=
 =?utf-8?B?bDlyWGlGN1IwcURxemJPd2s0QnlXZ0o3Y0xlTzZNZjJQZGtuM3lldlBNS0p3?=
 =?utf-8?B?eEo4YVc1OFJsTkhZdUNVRkFMYVpnNnF1YVRzQlYzcHowODBMdVY4Z2VvUXNK?=
 =?utf-8?B?d3o5K2pWWlBWdnVQUnVCWTU3MkRxWHhmZnBFcVRseVo5TW41dnVkNmd4U0xu?=
 =?utf-8?B?b082K1FCMm53TkVKdDdaRStHZGpjemZIVitWNEExYVdBaTZJbFlTUUZxRDFq?=
 =?utf-8?B?Y2JpSG1rQkpNeTlGSVVoMzM4TVprRURubGw2OVAzdCt4UndLeU12cFo0TmEy?=
 =?utf-8?B?T290OVVIeUh6KzZFb1MrY3ZEekJ5Tm9OY2ZSU2RmaXZneVE3Y2R4T2RyeG9X?=
 =?utf-8?B?a2ZCVHVKZHVjcGhUdWl0TFBML2ZST3U4NUpNM1VBWjNWcWVYWGpEZGFWdGw1?=
 =?utf-8?B?QlVtZzFpZlpPU0pEejgwOEc5blVRdm1hRVJneXFHV1JOcG1mSVptY0FSdlBI?=
 =?utf-8?B?LytnS1lxTnhudFpWSDZyc3pLTEtTcWJnb3E1aG52dTkwVEhleVIzUFRWTVh4?=
 =?utf-8?B?aloyOVFTNUFPdWZmazN1Z3Z3dzJXTkdHL2pKL1pUTzZZNS9sYmpZaDhiOFEx?=
 =?utf-8?B?dzJ6ZHhyOVJmOWRkY280ZXE4TWNOc2dJWDU5WFE0ZVJZMFFLQ25yY1FtMlZK?=
 =?utf-8?B?djBMOEYrMVAzYkdmU01lR24zaHVkQ2JvVXJabTJaUXhlWVk1QVZSRU5HODRC?=
 =?utf-8?B?S3VkQmlZY1A1UjJtbXlTRitCV01xbTYzN3V4UXpyV3VHZjFHM0RRTGRzdnZV?=
 =?utf-8?B?Ump1cmRCQW92MFNZK3ZjMzIxYXBPMmpkcnpxMFh4c1JUMk5jbkFyMmJPWWtS?=
 =?utf-8?Q?2NsRPriNtOSAIDO/m8Zo2/eXz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3a7410-d0df-44ef-b818-08ddbae1b3ae
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:01:10.3181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnDxwm9hi+39DnAmYB2tIcbVgFcsTblzkIh+gmVvGI+NUhLLIFjosAMjP0R2f5LOop0sODtmDkzDsDyd337GCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
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

Hi,

On 7/4/2025 1:36 PM, Peter Senna Tschudin wrote:
>
> On 7/3/2025 10:39 PM, Rodrigo Vivi wrote:
>> On Mon, Jun 16, 2025 at 09:42:35AM +0200, Peter Senna Tschudin wrote:
>>> Introduce core_debugfs_heads_power that is expected to work with any
>>> GPU, not limited to i915 and Xe. The test powers off all available
>>> heads before reading debugfs files, and then powers on all heads
>>> before reading the files again.
>>>
>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>> Cc: michal.wajdeczko@intel.com
>>> Cc: marcin.bernatowicz@intel.com
>>> Cc: kamil.konieczny@linux.intel.com
>>> Cc: katarzyna.piecielska@intel.com
>>> Cc: zbigniew.kempczynski@intel.com
>>> Cc: ewelina.musial@intel.com
>>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>>> ---
>>> v3:
>>>   - renamed the test
>>>   - Removed reference to sysfs from comments  (thanks Kamil)
>>>   - Updated description to match the display part (thanks Kamil)
>>>   - Moved from "display" to "heads". Our CI uses "headless" to refer
>>>     to a DUT without display and it is shorter
>>>   - renamed subtests for shorter names (thanks Kamil)
>>>   - fixed comments style (thanks Kamil)
>>>   - updated CC list
>>>   - changed the order to test first with all heads off then with all heads on
>>>     to prevent the need from powering on the heads at the end of the test
>>>     (thanks Kamil)
>>>   - removed snprintf from test names (thanks Kamil)
>>>   - removed subtest group (thanks Kamil)
>>>   - deleted kms_tests() and moved the code to igt_main (thanks Kamil)
>>>
>>> v2:
>>>   - changed style of comparison to NULL
>>>   - moved to a separate patch
>>>
>>>   tests/core_debugfs_heads_power.c | 156 +++++++++++++++++++++++++++++++
>>>   tests/meson.build                |   1 +
>>>   2 files changed, 157 insertions(+)
>>>   create mode 100644 tests/core_debugfs_heads_power.c
>>>
>>> diff --git a/tests/core_debugfs_heads_power.c b/tests/core_debugfs_heads_power.c
>>> new file mode 100644
>>> index 000000000..1813986d8
>>> --- /dev/null
>>> +++ b/tests/core_debugfs_heads_power.c
>>> @@ -0,0 +1,156 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#include "igt.h"
>>> +#include "igt_debugfs.h"
>>> +#include "igt_dir.h"
>>> +
>>> +/**
>>> + * TEST: debugfs heads power test
>> Could we please use display instead of heads here?
>>  From display folks perspective heads might be indeed more clear because we will
>> only use display if any 'head' is attached, but from folks outside of display
>> world, heads will be a confusing term to be in the name of the test.
>>
>> Or perhaps we name kms_debugfs
> My first name proposal was core_debugfs_display_on_off. This is
> informative because it makes it explicit that this runs the test with
> display on and with the display off. This name is also a good contrast
> with the other test core_debugfs. Removing the on_off suffix makes the
> name less informative.
>
> Problem is that core_debugfs_display_on_off is a large name. So using
> heads instead of display was an attempt to make the name shorter, but no
> one liked it. We are waiting the KMS team to decide on which name they want.
I would vote for kms_debugfs as this would be also consistent with the 
existing display tests. I'm also okay with 'core_debugfs_display' if we 
can't have kms_debugfs.
>
>
>
>
>>> + * Description: Read entries from debugfs with all heads on and with all heads
>>> + *		off.
>>> + * Category: Core
>>> + * Mega feature: General Core features
>>> + * Sub-category: uapi
>>> + * Functionality: debugfs
>>> + * Feature: core
>>> + * Test category: uapi
>>> + *
>>> + * SUBTEST: off-read-all
>>> + * Description: Read all debugfs entries with heads off.
>>> + *
>>> + * SUBTEST: on-read-all
>>> + * Description: Read all debugfs entries with heads on.
>>> + */
>>> +
>>> +/**
>>> + * bool igt_kms_all_displays_on: Try to turn on all heads
>>> + * @display: pointer to the igt_display structure
>>> + *
>>> + * Returns: void
>>> + */
>>> +static void igt_display_all_on(igt_display_t *display)
>>> +{
>>> +	struct igt_fb fb[IGT_MAX_PIPES];
>>> +	enum pipe pipe;
>>> +	int ret;
>>> +
>>> +	/* try to light all pipes */
>>> +retry:
>>> +	for_each_pipe(display, pipe) {
>>> +		igt_output_t *output;
>>> +
>>> +		for_each_valid_output_on_pipe(display, pipe, output) {
>>> +			igt_plane_t *primary;
>>> +			drmModeModeInfo *mode;
>>> +
>>> +			if (output->pending_pipe != PIPE_NONE)
>>> +				continue;
>>> +
>>> +			igt_output_set_pipe(output, pipe);
>>> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>> +			mode = igt_output_get_mode(output);
>>> +			igt_create_pattern_fb(display->drm_fd,
>>> +						mode->hdisplay, mode->vdisplay,
>>> +						DRM_FORMAT_XRGB8888,
>>> +						DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
>>> +
>>> +			/* Set a valid fb as some debugfs like to
>>> +			 * inspect it on a active pipe
>>> +			 */
>>> +			igt_plane_set_fb(primary, &fb[pipe]);
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	if (display->is_atomic)
>>> +		ret = igt_display_try_commit_atomic(display,
>>> +				DRM_MODE_ATOMIC_TEST_ONLY |
>>> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
>>> +				NULL);
>>> +	else
>>> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>>> +
>>> +	if (ret) {
>>> +		igt_output_t *output;
>>> +		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
>>> +
>>> +		igt_require_f(found, "No valid mode combo found.\n");
>>> +
>>> +		for_each_connected_output(display, output)
>>> +			igt_output_set_pipe(output, PIPE_NONE);
>>> +
>>> +		goto retry;
>>> +	}
>>> +
>>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +}
>>> +
>>> +/**
>>> + * bool igt_kms_all_displays_off: Try to turn off all heads
>>> + * @display: pointer to the igt_display structure
>>> + *
>>> + * Returns: void
>>> + */
>>> +static void igt_display_all_off(igt_display_t *display)
>>> +{
>>> +	enum pipe pipe;
>>> +	igt_output_t *output;
>>> +	igt_plane_t *plane;
>>> +
>>> +	for_each_connected_output(display, output)
>>> +		igt_output_set_pipe(output, PIPE_NONE);
>>> +
>>> +	for_each_pipe(display, pipe)
>>> +		for_each_plane_on_pipe(display, pipe, plane)
>>> +			igt_plane_set_fb(plane, NULL);
>>> +
>>> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +}
>>> +
>>> +IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
>>> +
>>> +igt_main
>>> +{
>>> +	int debugfs = -1;
>>> +	igt_display_t *display;
>>> +	int fd = -1;
>>> +	igt_dir_t *igt_dir = NULL;
>>> +
>>> +	igt_fixture {
>>> +		fd = drm_open_driver_master(DRIVER_ANY);
>>> +		debugfs = igt_debugfs_dir(fd);
>>> +		igt_require(debugfs >= 0);
>>> +
>>> +		igt_dir = igt_dir_create(debugfs);
>>> +		igt_require(igt_dir);
>>> +
>>> +		kmstest_set_vt_graphics_mode();
>>> +
>>> +		display = calloc(1, sizeof(*display));
>>> +		igt_display_require(display, fd);
>>> +	}
>>> +
>>> +	igt_subtest("off-read-all") {
>>> +		igt_display_all_off(display);
>>> +
>>> +		igt_dir_scan_dirfd(igt_dir, -1);
>>> +		igt_dir_process_files(igt_dir, NULL, NULL);
>>> +	}
>>> +
>>> +	igt_subtest("on-read-all") {
>>> +		/* try to light all pipes */
>>> +		igt_display_all_on(display);
>>> +
>>> +		igt_dir_scan_dirfd(igt_dir, -1);
>>> +		igt_dir_process_files(igt_dir, NULL, NULL);
>>> +	}
>>> +
>>> +	igt_fixture {
>>> +		igt_display_fini(display);
>>> +		close(debugfs);
>>> +		drm_close_driver(fd);
>>> +	}
>>> +}
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index fa62cbeb9..99dbd4feb 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -1,6 +1,7 @@
>>>   test_progs = [
>>>   	'core_auth',
>>>   	'core_debugfs',
>>> +	'core_debugfs_heads_power',
>>>   	'core_getclient',
>>>   	'core_getstats',
>>>   	'core_getversion',
>>> -- 
>>> 2.43.0
>>>
