Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75A4CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 11:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6415610E8A4;
	Thu,  6 Nov 2025 11:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJ9mMqk2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6B910E899
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762427983; x=1793963983;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K1cTMo4e1OT8XeXsyvxTef3JK1rP8z8lnKzerPbg42w=;
 b=WJ9mMqk2r1BGUdCFpFFD4PKwGeylrPZ7B9rsqGlblVU3YqaGcsxuK386
 l2jz1O1ejVk8exD9heK0bPeVdDFQso4dYTNfu13GA3OmntDTmKrd6Y7mH
 X91p5OV2EQmz59wpsYVw0zR/E+70pyPfSnWbuAXoIKMPoE4Q8PpEmi/Zm
 ZFQK/sA6FAhhlHcz+D3aGWK8ZqxNx4YuBpewkr06bE4GDtXAdPWfKwm1M
 BFmXPljuWt/OxUdrBXITyMDv2ua9fnnzcYnGewE+4g/QRPEXlqzlexNhl
 77kdMAVqPd3L6QXxF+DEGuvc1cadThm2VzrTeAl8msINXqNAqKasFFRqU g==;
X-CSE-ConnectionGUID: 54OcMsAcQGaKQveOdNNMEw==
X-CSE-MsgGUID: EV4Kp5jKQEa3IRnArTNxWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="90029193"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="90029193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:19:43 -0800
X-CSE-ConnectionGUID: p+08cLjyTwKB5UGGJbO/6Q==
X-CSE-MsgGUID: 8gUn6H/2QvKNb/JpfrDOSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188013199"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:19:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 03:19:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 03:19:42 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 03:19:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOwdBjjJVDA/w9DYWIRNul86t3YhYMrjcDEpiGYMbSAsjAqL8WJQACQlEWcYx7chfl+Gl9qmsITZmD4958KZhhXroNzJYffjXVt8qoCbnC4tRilvuZsdMDMDQO/ZlgbX7/wxsi9cRqAceXgVkhvjKRYNACVb7gRx9M8eooMcRCcIudWxePhH97m4zehMMXt7W19540ujfKto/AuKVHGhKxe2pLnx28RWMvnRR+PCYEyeDDwyAtfXYTCv5XROd9Nf3V6qn9AZ6ayl+XpSXOXylCtzqfyd/+BP4Z/FDsEaadjmtEupVHl+kijhHmfA++CgrdhUoXWqAeVRKnUB0OuHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZmfVWrEp0Uboh4VGTOzv38nfFWBUpfpbaz28e2Rk2I=;
 b=VTn10ECLMjmq9c+WbECms+XZ0G//PX/qQN77XasvhOU4y5iSHbi+TtDUacsHDQcypuNz0TkCehG3TCkV/cTRCJD8uMTAGF8qTw4Go9VEEhdkoo26RGBrPYSUHz+PZvQ+gvsV31Anm2jk2fxDF65Rpgqm/e83gCUWj/vwQiU+qt/9XwjK4YQUq3pVKuJ7lk8kmz13tspVyVo3vycWV1Nle4PZjoKJH6hqNumsKDPQ0Mqu7UeLtMZRxGnU39rZfOLzx0iZ+oGlT3GbvgkzjhDusJIaM1JoYBmvMp270RLUomjHDTWM8o5dOcoOMp8JBU07TgIZheOLLLTSobLGdHfmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 11:19:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 11:19:39 +0000
Date: Thu, 6 Nov 2025 12:19:36 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lukasz.laguna@intel.com>,
 <jakub1.kolakowski@intel.com>
Subject: Re: [PATCH i-g-t 4/6] tests/xe_sriov_flr: Make subchecks Tile aware
Message-ID: <20251106111936.n2wgzkd7iv65q4mi@intel.com>
References: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
 <20251031125633.1374273-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031125633.1374273-5-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: VI1PR09CA0182.eurprd09.prod.outlook.com
 (2603:10a6:800:120::36) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BL3PR11MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: f76b3937-f5ab-4fbb-daae-08de1d266064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnpadDN4MlExbVRHemFZTlEybytwOC90NStPODhObUU3YWF1QUVMbWVmQnBn?=
 =?utf-8?B?NU1UNVc0Z0p2TUp4QTQyT2k5a3hOMFd2U1piOGxYTnVBUnZzckRlZHpzNERG?=
 =?utf-8?B?M3VzNm8wVEhSRTZrcDUrQ0hoVnVrR3lNVlV4U1ZzQ0ZlSUYxaTV6THhudVMx?=
 =?utf-8?B?aE1OQW4yU21LblFxdjdSUTF6ZXRvS3pFdVNmZDIxM3NWYUtpbnFKUU1tTGtD?=
 =?utf-8?B?QTVrcFV0Y0tlTVdVdzlqdE9yN2dFZmFucDNSWWc2Ykd1WUJHSjZseTFLbjJ3?=
 =?utf-8?B?aTlqSmV6VUFIVnVoNmFDY05PUzUvZXk2MTVvTC9ZQStzWTZEbnJKUVNNQk5X?=
 =?utf-8?B?RzI0TE1XVkxoZUIxTVp4TGtmdGtMaWZwdzZyUGhqWk9jRSs2RG5IeFJya3dw?=
 =?utf-8?B?N2hIZy9INDVjdVQwdEhNWjcrdllHdkJrUm5VM09YVlU1aVgzdHNxamJYUGU1?=
 =?utf-8?B?bnZzbFZQVVBCQnpzUEV1b1BTN2gwUjFvMWM1VW1mNWJIYk94WDJZSHJObFNG?=
 =?utf-8?B?RTRCa09FOUlJL3JBdG85UnlHelJEaER1ZTNIMlR3RDVyT2NIblJsNmlQemQx?=
 =?utf-8?B?QUFEVWY0UXJmZVNqY3JYTGowanFNVVZrdmF6a3BENHVQWFJnbUVoK2xlSE5T?=
 =?utf-8?B?K28xYUsvVnU4N2JQellVU3NqU2xmSjRDSTZsMTdKZmh2bHdWandtSnBMQmNp?=
 =?utf-8?B?VG1hNGhqd0xSaUg2cGRLaUF4clVRSnVHNVVFbUtqejJNTExLclFsSEYySUxE?=
 =?utf-8?B?dnZDd2xabVRrdHJMR1lib0tSeUQ0Rk14eE8wUlJkcHNzZTRNNGdVcWxxMjcv?=
 =?utf-8?B?Y2x3Z1RZMlZzOHJ6RXZ3S1M3c3ZXYkVjalRHOTZsbEUyelBEaWlpdW0xMHdZ?=
 =?utf-8?B?bzRPVGwvR2JDZ21KQ25iN28xeGFCSDFUV1VVRzRzMUJVZlpIeXBlbWxCVnMz?=
 =?utf-8?B?WVMxZ1hwdzlUVHpYdkNnM2ZvRDNuV3VIajFmMW9EcEhpWjhiU0pnLzJhaUFG?=
 =?utf-8?B?WEZ2STNmTUlIaEhCK1ErZUVmd0lKOXNvMzVHVmpobnU5eDlNUUk0dzAvSmlh?=
 =?utf-8?B?WWhkLzZVa3BuWkgxai8rTjBmakhCbjdZeWgrN3BJb01jMkswKzMyRThMd1FC?=
 =?utf-8?B?MHhxMlhPZEh6b3o4RERubVZPeTZTQitMYVNxTy9qS1RSb0FrUjI3cVZ2dVY3?=
 =?utf-8?B?NENkak5sTjhPVUdIYjZFL0pTWkV3dlY3dEVxeHhSQ1k4MFYxaFhRakRrZm5X?=
 =?utf-8?B?UFMrdnZ4T1FQTHVta1dZOXBvVHVObDBkL0RqK0xmSllocUZIbXNINC9TMTBz?=
 =?utf-8?B?Z0dZVlptMTdMVXZUcExRdHQwaDBHYUZaZDd2VVpqcjc3emw5d2EzVkpaVDFL?=
 =?utf-8?B?dTlGMEUrMU5NajU2V2Y4S1ZXNFBwMHVEM2xuNGxTcWJVMFlpbW5LQjd0eTdP?=
 =?utf-8?B?dkI4Vld2a1BwejNZbWtxeTZ2anJSZ2oxVGhYVnI3anZudEdyaEVzWjBaVWor?=
 =?utf-8?B?QVJjM1VDOW0rc0hNaE94WnVxRk8rWFZER2lKSk5DMit6cDdoSXRFZ3duVjl0?=
 =?utf-8?B?MmpEcGJlT0FSNlZTMCtsMVp2eHYxN2VjMlFsNTdXdUcyMzBHVVRGOVN3RHFW?=
 =?utf-8?B?Y1R5UE9wVXZEaDhRTVlWd0NyN0tFd2E4S0IxeGU4RU9JK2lzWVpHTzVqTk5M?=
 =?utf-8?B?Ulg2TE1tQmZGYzlYVzVCekRQc28wQmFRd1hCZ0xISmZ4K3FNL2JIMnJYZEl6?=
 =?utf-8?B?SWcrc3pZS2gvM3RVTWc3UWwyRFNObUJGTFVPOUFsbnpJQkQ4YjFSd0M4VWxG?=
 =?utf-8?B?TDYrdTBRQytYbEVRc2gvbEp6OUlqdkhNMGZpWEpWQ05SUktMYnl6Z2VnMVpy?=
 =?utf-8?B?L3h5NTVwdVdWYjZrNnVsS1plZVFlVE0xL3NhK0hXOWY0K3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFVnU0NzU1FmWE1EK2pnMVJKT0h0Mi9XSlRpNkJFNldDQld0MGxOK2tqUDZp?=
 =?utf-8?B?czVPckFoZUUvaHhjam0reDZpaDBCYzZTMVZ3bFRzQ2FjdUV5OUpTMENqTWc3?=
 =?utf-8?B?OXRkTjY5TmZSczRWWEovNStTQ0tWeC9RMFhxdkdnaHhIcVQ2QVN5QnlDdHNV?=
 =?utf-8?B?ZncxYnpvVWVWSVBtQUtWSUVrWEtENlovaEpBeVRDRW0yU0F4T09xT0hJbGts?=
 =?utf-8?B?YWlsT0F6SEFDZjIyRDk2bllyNzUwbzA5SXNZNUt6R2ovQnpweDdyejR3TnpQ?=
 =?utf-8?B?bUlXL0w0QjdzQlhPQ2lyWDhkYlZpY3VIZm52RStXN1ZUQnpPb2JHN3FEREYy?=
 =?utf-8?B?RHdjalBwUGxXaG9pTWd0YjBqays1QzBBNkxWOWZ0OGFaUWk5Qm9uOGU2V0dM?=
 =?utf-8?B?RDdDc0VQZ3N1aWVPdStnRFUwOTJaSDlTTnFqbHp4Vmdvdk8yMlBNMXRtOWwy?=
 =?utf-8?B?bWlqT25CYUFuVWZVQVdLRFlRY1NFOXBVNzFndlcyQ0h3K1hCN2NvK3ZtRmNF?=
 =?utf-8?B?WkhVRWxRd2RDWGVlakF6c3Y1NHFGbm5rTE5jN0RTN3Fla0xYbnhML2tjMHJL?=
 =?utf-8?B?SjFPZU9xcGROcGRnYk9NYmY3dE5WVFQ4eXhiZk0rbURwYW1yRVo3bmo2WW96?=
 =?utf-8?B?TjgrUFR5OXVmSnExV1ZkN05CZmVMUFJQcmJ3ZitzQTIwa1R6YmVsN01SdHJy?=
 =?utf-8?B?SDM0dlhDbE5XZ2p5Q2JidFc2L0ZXQXIyRTB6dVRRRWZaNW1HUGZqa0pwckhn?=
 =?utf-8?B?M1BuWjh1cXp0SC9sbWJEOVVuclZkb0ZZSFNlYjcrQjdLMXFNc0VwUzZSRW0r?=
 =?utf-8?B?STQwbUEwSVdEeUtCOTYwYkdYb08vcVJTM2NyZWE4Q0FXSG5vMXYyZlBKc3dr?=
 =?utf-8?B?di9XWFhxWEJ3N2RsN0VrL0xWa2pJOWdROVl5S0RTNjRBTFJZaFpOa1h6YnVY?=
 =?utf-8?B?NEZOMWZjSjJrWG9MWFhRMzRiSjMzcTRSaVFLL0U1aVpROVlHNGJpenhsK2RV?=
 =?utf-8?B?czFlNkdoaUsvbXNXQUJ5dmQ3a1FKT2J2ZFZxaDlwSkdkaTBUTGg3NUsyYktr?=
 =?utf-8?B?dEtNYVpTbFNNWUFBUk9JVlIvbUZ6STVpeXFkVHRheXBob0JzbGVIMGU1U0Jw?=
 =?utf-8?B?NlJjNFYzS25QcGZGckcvZG82emJGK212TDNqYk5DbUhNVzdrejFnVGpZVlYy?=
 =?utf-8?B?c2RlOEtNK3NhUjczbm9mNjdPb3cyeXNRbHdwdkdTU09jc3FBZmhVdUlrYXZz?=
 =?utf-8?B?Rm0xUWtlRVM0NUViOFN4YTBJTW5QeElSYkVyMU9SUmlKR0ZteTAvcG05c002?=
 =?utf-8?B?N2pWRUdkdTVHQTRKVHZBYzlZVmJ0VllhRDBrcXhydlpZeXBGNjRmRTJiRDU4?=
 =?utf-8?B?MW00c3J4TFRxRkZmaVRpOWN0L05KS01lWVpXT1ZNYmJkUldQTnoyS1BaaHhO?=
 =?utf-8?B?V0lpcTlzZlJmd3JZTWhhZHBOdThWWEk0MDJSeWI1dUhHeDRtVkx3QkR0cjJI?=
 =?utf-8?B?WURMTkl3M2ROZk9Hc3NNV25KeTZEWHJ4dkJaNTAxQndQbmkzWUhJanE4aFR2?=
 =?utf-8?B?NFlIdGdWZnFtODh6dDZWMzJudmxjdnNsWUxxMGJNUENadytUdnpZTUJpUzhM?=
 =?utf-8?B?VmxKUkZTTkxvY3ExN3JqMW00WmZFT0U0RjRFQ3pMdlJGTzNEWFRZZG83T3Fv?=
 =?utf-8?B?Zk5wcDdVTGJUOG93NVFlOTNvL2JJT3Z4V21hVXZGVHpQd3ZKelpLOUlXdmtB?=
 =?utf-8?B?SmdnUTU0V2xyQkJPelBlRWdMTGhGTWM3bzRRM3gwRUw0VytVdmxtazFFYUxG?=
 =?utf-8?B?ay9tKzdzRkVXSkJJQTZtV3NvQVBVUDJwdFBDS0NKTDJyL3BUWHZXdVp1YVNs?=
 =?utf-8?B?dVlrVXdMZzVPNm43WUJPZ0JaZTdPRGtMZXhiWHV4YWZWNFdsWkFNcXA1b2Nl?=
 =?utf-8?B?UlNyTUhVUWlXTFhFd05GS0xjUmZnNXh4Unh1bDZtcy9od2pyZWxZREVZdnFs?=
 =?utf-8?B?SENxSTJ0c3dJR2cyc3JqaVgwYUNEUTVRQzg1VS9tdG5ndWNWeW0zaCtmcVJh?=
 =?utf-8?B?a0R5R01rSE9WQ0ZQRDNmTDN3VUsvVlNOcXhtVy9UZ1RSM1RUendsYStOZWpR?=
 =?utf-8?B?OGZjcEZ5VDFrdVdPZjloUnd5SW9ZYTNLQzVrUnhIMDgyTkp3c3huT1d6clNV?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f76b3937-f5ab-4fbb-daae-08de1d266064
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:19:39.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgjqzRVouq98HBULU1XjKzYjVl+xhZ6xRhzZ+rE6bB4xJCjx00uvP+kWpz8NaaLGgzvQLlJNGRs2bxLAI4OSXpq5AUW7GJoKzJUhWhXiTt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
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

Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com> wrote on pią [2025-paź-31 13:56:31 +0100]:
> Follow up on Piotr's adjustments for tile-aware FLR tests.
> 
> Replace GT ID with Tile ID in struct subcheck_data and adapt the code
> to use new MMIO tile helpers. Each tile now has its own set of subchecks
> initialized in clear_tests, with separate data structures per tile.
> 
> Keeping the Tile ID in subcheck_data allows verify_flr() to remain
> unchanged and avoids an xe_for_each_tile "explosion".
> 
> Link: https://patchwork.freedesktop.org/series/156216/
> Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_sriov_flr.c | 276 ++++++++++++++++++-------------------
>  1 file changed, 135 insertions(+), 141 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 077ed15af..38b303391 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -66,8 +66,7 @@ const char *SKIP_REASON = "SKIP";
>   * @pf_fd: File descriptor for the Physical Function.
>   * @num_vfs: Number of Virtual Functions (VFs) enabled and under test. This count is
>   *           used to iterate over and manage the VFs during the testing process.
> - * @gt: GT under test. This identifier is used to specify a particular GT
> - *      for operations when GT-specific testing is required.
> + * @tile: Tile under test.
>   * @stop_reason: Pointer to a string that indicates why a subcheck should skip or fail.
>   *               This field is crucial for controlling the flow of subcheck execution.
>   *               If set, it should prevent further execution of the current subcheck,
> @@ -79,12 +78,12 @@ const char *SKIP_REASON = "SKIP";
>   * Example usage:
>   * A typical use of this structure involves initializing it with the necessary test setup
>   * parameters, checking the `stop_reason` field before proceeding with each subcheck operation,
> - * and using `pf_fd`, `num_vfs`, and `gt` as needed based on the specific subcheck requirements.
> + * and using `pf_fd`, `num_vfs`, and `tile` as needed based on the specific subcheck requirements.
>   */
>  struct subcheck_data {
>  	int pf_fd;
>  	int num_vfs;
> -	int gt;
> +	uint8_t tile;
>  	char *stop_reason;
>  };
>  
> @@ -207,16 +206,19 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
>  	for (int i = 0; i < num_checks; ++i) {
>  		if (checks[i].data->stop_reason) {
>  			if (is_subcheck_skipped(&checks[i])) {
> -				igt_info("%s: %s", checks[i].name,
> +				igt_info("%s: Tile%u: %s", checks[i].name,
> +					 checks[i].data->tile,
>  					 checks[i].data->stop_reason);
>  				skips++;
>  			} else {
> -				igt_critical("%s: %s", checks[i].name,
> +				igt_critical("%s: Tile%u: %s", checks[i].name,
> +					     checks[i].data->tile,
>  					     checks[i].data->stop_reason);
>  				fails++;
>  			}
>  		} else {
> -			igt_info("%s: SUCCESS\n", checks[i].name);
> +			igt_info("%s: Tile%u: SUCCESS\n", checks[i].name,
> +				 checks[i].data->tile);
>  		}
>  	}
>  
> @@ -470,8 +472,8 @@ static int execute_parallel_flr_twice(int pf_fd, int num_vfs,
>  #define GGTT_PTE_ADDR_SHIFT			12
>  
>  struct ggtt_ops {
> -	void (*set_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
> -	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
> +	void (*set_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
> +	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset);
>  };
>  
>  struct ggtt_provisioned_offset_range {
> @@ -491,68 +493,66 @@ struct ggtt_data {
>  	struct ggtt_ops ggtt;
>  };
>  
> -static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
> +static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset)
>  {
> -	return xe_mmio_ggtt_read(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset);
> +	return xe_mmio_ggtt_read(mmio, tile, pte_offset);
>  }
>  
> -static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
> +static void intel_set_pte(struct xe_mmio *mmio, uint8_t tile,
> +			  uint32_t pte_offset, xe_ggtt_pte_t pte)
>  {
> -	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
> +	xe_mmio_ggtt_write(mmio, tile, pte_offset, pte);
>  }
>  
> -static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
> +static void intel_mtl_set_pte(struct xe_mmio *mmio, uint8_t tile,
> +			      uint32_t pte_offset, xe_ggtt_pte_t pte)
>  {
> -	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
> +	xe_mmio_ggtt_write(mmio, tile, pte_offset, pte);
>  
>  	/* force flush by read some MMIO register */
> -	xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), GEN12_VF_CAP_REG);
> +	xe_mmio_gt_read32(mmio, tile, GEN12_VF_CAP_REG);

You are using the wrong function here. You should use xe_mmio_tile_read32

>  }
>  
> -static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
> -			uint8_t gpa, xe_ggtt_pte_t *out)
> +static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
> +			uint32_t pte_offset, uint8_t gpa, xe_ggtt_pte_t *out)
>  {
>  	xe_ggtt_pte_t pte;
>  
> -	pte = ggtt->get_pte(mmio, gt, pte_offset);
> +	pte = ggtt->get_pte(mmio, tile, pte_offset);
>  	pte &= ~GGTT_PTE_TEST_FIELD_MASK;
>  	pte |= ((xe_ggtt_pte_t)gpa << GGTT_PTE_ADDR_SHIFT) & GGTT_PTE_TEST_FIELD_MASK;
> -	ggtt->set_pte(mmio, gt, pte_offset, pte);
> -	*out = ggtt->get_pte(mmio, gt, pte_offset);
> +	ggtt->set_pte(mmio, tile, pte_offset, pte);
> +	*out = ggtt->get_pte(mmio, tile, pte_offset);
>  
>  	return *out == pte;
>  }
>  
> -static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
> -			  uint8_t expected_gpa, xe_ggtt_pte_t *out)
> +static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
> +			  uint32_t pte_offset, uint8_t expected_gpa, xe_ggtt_pte_t *out)
>  {
>  	uint8_t val;
>  
> -	*out = ggtt->get_pte(mmio, gt, pte_offset);
> +	*out = ggtt->get_pte(mmio, tile, pte_offset);
>  	val = (uint8_t)((*out & GGTT_PTE_TEST_FIELD_MASK) >> GGTT_PTE_ADDR_SHIFT);
>  
>  	return val == expected_gpa;
>  }
>  
> -static bool is_intel_mmio_initialized(const struct intel_mmio_data *mmio)
> -{
> -	return mmio->dev;
> -}
> -
>  static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>  {
>  	int ret, pf_fd = gdata->base.pf_fd, num_vfs = gdata->base.num_vfs;
>  	struct xe_sriov_provisioned_range *ranges;
> -	unsigned int nr_ranges, gt = gdata->base.gt;
> +	uint8_t tile = gdata->base.tile;
> +	unsigned int nr_ranges;
>  
>  	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
>  	igt_assert(gdata->pte_offsets);
>  
> -	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, xe_gt_get_tile_id(pf_fd, gt),
> -							 gdata->mmio, &ranges, &nr_ranges);
> +	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, gdata->mmio,
> +							 &ranges, &nr_ranges);
>  	if (ret) {
> -		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
> -				gt, ret);
> +		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges (%d)\n",
> +				ret);
>  		return -1;
>  	}
>  
> @@ -597,12 +597,6 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
>  {
>  	struct ggtt_data *gdata = (struct ggtt_data *)data;
>  
> -	if (!xe_is_main_gt(data->pf_fd, data->gt)) {
> -		set_skip_reason(data, "GGTT provisioning not exposed on GT%d (non-MAIN)\n",
> -				data->gt);
> -		return;
> -	}
> -
>  	gdata->ggtt.get_pte = intel_get_pte;
>  	if (IS_METEORLAKE(intel_get_drm_devid(data->pf_fd)))
>  		gdata->ggtt.set_pte = intel_mtl_set_pte;
> @@ -610,7 +604,7 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
>  		gdata->ggtt.set_pte = intel_set_pte;
>  
>  	if (gdata->mmio) {
> -		if (!is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
> +		if (!xe_mmio_is_initialized(&gdata->mmio[0]))
>  			xe_mmio_vf_access_init(data->pf_fd, 0 /*PF*/, gdata->mmio);
 In kernel we have such macro:
 /**
 * VFID - Virtual Function Identifier
 * @n: VF number
 *
 * Helper macro to represent Virtual Function (VF) Identifier.
 * VFID(0) is used as alias to the PFID that represents Physical Function.
 *
 * Note: According to PCI spec, SR-IOV VF's numbers are 1-based (VF1, VF2, ...).
 */
#define VFID(n)		(n)
#define PFID		VFID(0)

It was introduced only to improve code readability. Perhaps it would be worth using it here as well.


>  
>  		populate_ggtt_pte_offsets(gdata);
> @@ -628,12 +622,13 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>  	if (data->stop_reason)
>  		return;
>  
> -	igt_debug("Prepare gpa on VF%u offset range [%#x-%#x]\n", vf_id,
> +	igt_debug("Tile%u: Prepare gpa on VF%u offset range [%#x-%#x]\n",
> +		  gdata->base.tile, vf_id,
>  		  gdata->pte_offsets[vf_id].start,
>  		  gdata->pte_offsets[vf_id].end);
>  
>  	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
> -		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
> +		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->tile, pte_offset,
>  				 (uint8_t)vf_id, &pte)) {
>  			set_skip_reason(data,
>  					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
> @@ -654,7 +649,7 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>  		return;
>  
>  	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
> -		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
> +		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->tile, pte_offset,
>  				   expected, &pte)) {
>  			set_fail_reason(data,
>  					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
> @@ -669,8 +664,6 @@ static void ggtt_subcheck_cleanup(struct subcheck_data *data)
>  	struct ggtt_data *gdata = (struct ggtt_data *)data;
>  
>  	free(gdata->pte_offsets);
> -	if (gdata->mmio && is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
> -		xe_mmio_access_fini(gdata->mmio);
>  }
>  
>  struct lmem_data {
> @@ -739,37 +732,33 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
>  {
>  	struct lmem_data *ldata = (struct lmem_data *)data;
>  	struct xe_sriov_provisioned_range *ranges;
> -	unsigned int nr_ranges, gt;
> +	unsigned int nr_ranges, main_gt;
>  	int ret;
>  
> +	main_gt = xe_tile_get_main_gt_id(data->pf_fd, data->tile);
>  	ldata->vf_lmem_size = calloc(data->num_vfs + 1, sizeof(size_t));
>  	igt_assert(ldata->vf_lmem_size);
>  
> -	xe_for_each_gt(data->pf_fd, gt) {
> -		if (!xe_is_main_gt(data->pf_fd, gt))
> -			continue;
> -
> -		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
> -								  XE_SRIOV_SHARED_RES_LMEM,
> -								  gt, &ranges, &nr_ranges);
> -		if (ret) {
> -			set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
> -					xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
> -					gt, ret);
> -			return -1;
> -		}
> -
> -		for (unsigned int i = 0; i < nr_ranges; ++i) {
> -			const unsigned int vf_id = ranges[i].vf_id;
> +	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
> +							  XE_SRIOV_SHARED_RES_LMEM,
> +							  main_gt, &ranges, &nr_ranges);
> +	if (ret) {
> +		set_skip_reason(data, "Failed read %s on main GT (%d)\n",
> +				xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
> +				ret);
> +		return -1;
> +	}
>  
> -			igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
> -			/* Sum the allocation for vf_id (inclusive range) */
> -			ldata->vf_lmem_size[vf_id] += ranges[i].end - ranges[i].start + 1;
> -		}
> +	for (unsigned int i = 0; i < nr_ranges; ++i) {
> +		const unsigned int vf_id = ranges[i].vf_id;
>  
> -		free(ranges);
> +		igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
> +		/* Sum the allocation for vf_id (inclusive range) */
> +		ldata->vf_lmem_size[vf_id] += ranges[i].end - ranges[i].start + 1;
>  	}
>  
> +	free(ranges);
> +
>  	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
>  		if (!ldata->vf_lmem_size[vf_id]) {
>  			set_skip_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
> @@ -839,7 +828,7 @@ static void lmem_subcheck_cleanup(struct subcheck_data *data)
>  
>  struct regs_data {
>  	struct subcheck_data base;
> -	struct intel_mmio_data *mmio;
> +	struct xe_mmio *mmio;
>  	uint32_t reg_addr;
>  	int reg_count;
>  };
> @@ -857,31 +846,21 @@ static void regs_subcheck_init(struct subcheck_data *data)
>  static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>  {
>  	struct regs_data *rdata = (struct regs_data *)data;
> +	uint8_t tile = data->tile;
>  	uint32_t reg;
>  	int i;
>  
>  	if (data->stop_reason)
>  		return;
>  
> -	if (!is_intel_mmio_initialized(&rdata->mmio[vf_id])) {
> -		struct pci_device *pci_dev = __igt_device_get_pci_device(data->pf_fd, vf_id);
> -
> -		if (!pci_dev) {
> -			set_skip_reason(data, "No PCI device found for VF%u\n", vf_id);
> -			return;
> -		}
> -
> -		if (intel_register_access_init(&rdata->mmio[vf_id], pci_dev, false)) {
> -			set_skip_reason(data, "Failed to get access to VF%u MMIO\n", vf_id);
> -			return;
> -		}
> -	}
> +	if (!xe_mmio_is_initialized(&rdata->mmio[vf_id]))
> +		xe_mmio_vf_access_init(data->pf_fd, vf_id, &rdata->mmio[vf_id]);
>  
>  	for (i = 0; i < rdata->reg_count; i++) {
>  		reg = rdata->reg_addr + i * 4;
>  
> -		intel_register_write(&rdata->mmio[vf_id], reg, vf_id);
> -		if (intel_register_read(&rdata->mmio[vf_id], reg) != vf_id) {
> +		xe_mmio_tile_write32(&rdata->mmio[vf_id], tile, reg, vf_id);
> +		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], tile, reg) != vf_id) {
>  			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
>  			return;
>  		}
> @@ -901,7 +880,7 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>  	for (i = 0; i < rdata->reg_count; i++) {
>  		reg = rdata->reg_addr + i * 4;
>  
> -		if (intel_register_read(&rdata->mmio[vf_id], reg) != expected) {
> +		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], data->tile, reg) != expected) {
>  			set_fail_reason(data,
>  					"Registers check after VF%u FLR failed on VF%u\n",
>  					flr_vf_id, vf_id);
> @@ -910,50 +889,42 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>  	}
>  }
>  
> -static void regs_subcheck_cleanup(struct subcheck_data *data)
> -{
> -	struct regs_data *rdata = (struct regs_data *)data;
> -	int i;
> +static void regs_subcheck_cleanup(struct subcheck_data *data) { }
>  
> -	if (rdata->mmio)
> -		for (i = 1; i <= data->num_vfs; ++i)
> -			if (is_intel_mmio_initialized(&rdata->mmio[i]))
> -				intel_register_access_fini(&rdata->mmio[i]);
> +static void cleanup_mmio(struct xe_mmio *mmio, int num_vfs)
> +{
> +	for (int i = 0; i <= num_vfs; ++i)
> +		if (xe_mmio_is_initialized(&mmio[i]))
> +			xe_mmio_access_fini(&mmio[i]);
>  }
>  
>  static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  {
> -	struct xe_mmio xemmio = { };
> -	const unsigned int num_gts = xe_number_gt(pf_fd);
> -	struct ggtt_data gdata[num_gts];
> -	struct lmem_data ldata = {
> -		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs }
> -	};
> -	struct intel_mmio_data mmio[num_vfs + 1];
> -	struct regs_data scratch_data = {
> -		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
> -		.mmio = mmio,
> -		.reg_addr = SCRATCH_REG,
> -		.reg_count = SCRATCH_REG_COUNT
> -	};
> -	struct regs_data media_scratch_data = {
> -		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
> -		.mmio = mmio,
> -		.reg_addr = MED_SCRATCH_REG,
> -		.reg_count = MED_SCRATCH_REG_COUNT
> -	};
> -	const unsigned int num_checks = num_gts + 3;
> +	struct xe_mmio mmio[num_vfs + 1];
> +	const uint8_t num_tiles = xe_tiles_count(pf_fd);
> +	struct subcheck_data base;
> +	struct ggtt_data gdata[num_tiles];
> +	struct lmem_data ldata[num_tiles];
> +	struct regs_data scratch_data[num_tiles];
> +	struct regs_data media_scratch_data[num_tiles];
> +	const unsigned int subcheck_count  = 4;

One space too many

> +	const unsigned int num_checks =	subcheck_count * num_tiles;
>  	struct subcheck checks[num_checks];
> -	int i = 0, gt_id;
> +	unsigned int i = 0, t;
>  
>  	memset(mmio, 0, sizeof(mmio));
>  
> -	xe_for_each_gt(pf_fd, gt_id) {
> +	xe_for_each_tile(pf_fd, t) {
> +		igt_assert_lt(i, num_tiles);
> +		base = (struct subcheck_data){ .pf_fd = pf_fd,
> +					       .num_vfs = num_vfs,
> +					       .tile = t };
> +
>  		gdata[i] = (struct ggtt_data){
> -			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = gt_id },
> -			.mmio = &xemmio
> +			.base = base,
> +			.mmio = mmio,
>  		};
> -		checks[i] = (struct subcheck){
> +		checks[i * subcheck_count + 0] = (struct subcheck){
>  			.data = (struct subcheck_data *)&gdata[i],
>  			.name = "clear-ggtt",
>  			.init = ggtt_subcheck_init,
> @@ -961,33 +932,56 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  			.verify_vf = ggtt_subcheck_verify_vf,
>  			.cleanup = ggtt_subcheck_cleanup
>  		};
> +
> +		ldata[i] = (struct lmem_data){
> +			.base = base,
> +		};
> +		checks[i * subcheck_count + 1] = (struct subcheck){
> +			.data = (struct subcheck_data *)&ldata[i],
> +			.name = "clear-lmem",
> +			.init = lmem_subcheck_init,
> +			.prepare_vf = lmem_subcheck_prepare_vf,
> +			.verify_vf = lmem_subcheck_verify_vf,
> +			.cleanup = lmem_subcheck_cleanup
> +		};
> +
> +		scratch_data[i] = (struct regs_data){
> +			.base = base,
> +			.mmio = mmio,
> +			.reg_addr = SCRATCH_REG,
> +			.reg_count = SCRATCH_REG_COUNT,
> +		};
> +		checks[i * subcheck_count + 2] = (struct subcheck){
> +			.data = (struct subcheck_data *)&scratch_data[i],
> +			.name = "clear-scratch-regs",
> +			.init = regs_subcheck_init,
> +			.prepare_vf = regs_subcheck_prepare_vf,
> +			.verify_vf = regs_subcheck_verify_vf,
> +			.cleanup = regs_subcheck_cleanup
> +		};
> +
> +		media_scratch_data[i] = (struct regs_data){
> +			.base = base,
> +			.mmio = mmio,
> +			.reg_addr = MED_SCRATCH_REG,
> +			.reg_count = MED_SCRATCH_REG_COUNT,
> +		};
> +		checks[i * subcheck_count + 3] = (struct subcheck){
> +			.data = (struct subcheck_data *)&media_scratch_data[i],
> +			.name = "clear-media-scratch-regs",
> +			.init = regs_subcheck_init,
> +			.prepare_vf = regs_subcheck_prepare_vf,
> +			.verify_vf = regs_subcheck_verify_vf,
> +			.cleanup = regs_subcheck_cleanup
> +		};
>  		i++;
>  	}
> -	checks[i++] = (struct subcheck) {
> -		.data = (struct subcheck_data *)&ldata,
> -		.name = "clear-lmem",
> -		.init = lmem_subcheck_init,
> -		.prepare_vf = lmem_subcheck_prepare_vf,
> -		.verify_vf = lmem_subcheck_verify_vf,
> -		.cleanup = lmem_subcheck_cleanup };
> -	checks[i++] = (struct subcheck) {
> -		.data = (struct subcheck_data *)&scratch_data,
> -		.name = "clear-scratch-regs",
> -		.init = regs_subcheck_init,
> -		.prepare_vf = regs_subcheck_prepare_vf,
> -		.verify_vf = regs_subcheck_verify_vf,
> -		.cleanup = regs_subcheck_cleanup };
> -	checks[i++] = (struct subcheck) {
> -		.data = (struct subcheck_data *)&media_scratch_data,
> -		.name = "clear-media-scratch-regs",
> -		.init = regs_subcheck_init,
> -		.prepare_vf = regs_subcheck_prepare_vf,
> -		.verify_vf = regs_subcheck_verify_vf,
> -		.cleanup = regs_subcheck_cleanup
> -	};
> -	igt_assert_eq(i, num_checks);
> +	igt_assert_eq(i, num_tiles);
> +	igt_assert_eq(i * subcheck_count, num_checks);
>  
>  	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
> +
> +	cleanup_mmio(mmio, num_vfs);
>  }

Thanks
Piotr
>  
>  igt_main
> -- 
> 2.43.0
> 

-- 
