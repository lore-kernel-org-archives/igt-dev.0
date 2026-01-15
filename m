Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBEDD3CC9F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 08:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A663B10E18D;
	Thu, 15 Jan 2026 08:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAksuXtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FEA10E18D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768465543; x=1800001543;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=11maVvynxKubkoux/GIdabr8YPELJKYYRcXqmLY++Ac=;
 b=VAksuXtTpfjPrMmz9KN4Ukrr9cYsWZ27uKKuCusN8EQ2lrHjVSn6H9ij
 OcxqypmTqeNNcxbAmRDCu+L5NTXkSmP7H9gTU2D8zf5GX7ZFvD3A8UIx+
 tmjMae/NRih5wuozEa++wDNpt6jE+bQ0xaBi88gH/jOcjzovgQtETbFB0
 njUdNFGWnrsBtjgpvtq8USI09MP8xdfnQM+/Rh47y58IGPNHeF0dm8dP3
 J/dg/R/qd6R7sQn3tqi4MbHudOpWWXlhZOkKSWWQx54c5Pcf0eyBIWfOw
 3nhYJNJuFspZpJn0rbW4qWKXDGoeCqwAT86kOIiN074jzxRrc7scl2H2m Q==;
X-CSE-ConnectionGUID: KyNmujtoSGWaEqR26x2cmQ==
X-CSE-MsgGUID: ++uHvVZXQrGgP+SA7p7OzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80413254"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="80413254"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:25:43 -0800
X-CSE-ConnectionGUID: pxArUAkVSu+pF2Bx+F0gpg==
X-CSE-MsgGUID: 6Jd2rGfXQr6KGs7Ce2Xn3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="209365353"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:25:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:25:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 00:25:42 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:25:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNg8j/pIlkkChvggtiU9/zJ11jgO6xihRE0aP5b5y2bu44o96muxrMx6GS7GwOKgEV26D0X68FD3v2uXaQMMplEqbAPmcvU/ULgPHWhm3rfi/uZJOQtOPPrksJp4winrTd8PW0zZ/08CP36IepPSbkLkJl1a/Ex/Z6nyVSPIw11Ff8VxtzfEw9FhFPhtOWBrjjhTGvHAgJ6OjCocjqcYpkL5JCYzheQVCxXprUGsVxEwk5xtbfnnXmn2dg+C5GHYsuxkt3ySZEMjkr2WthvMITKn0SH+AxZrbSiMUo6zwFFKh9Xh55O5pJ99f2QFMkJ72TrdFWUSTT5ZZaKhFkeEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bESwJHk/sB8tqVQ8wbNYsjpFPSo0emdqbqdwZkzcpxU=;
 b=a5TkXFlDbsqx4OMjABQbgSBjEtogPkcbwTxzbhOSCGVqDfucFos8fAm4Q4pzFGiRPi3k9RmHZ0Y6wkBXjQeR1HUzw1iCVJJg85EIkRkZ46YNhJ2WZ3VIAJ3bYYXxNGaXxnkIuFH+n2C+S1i1WMapNYIvd/U/T/F8C1JojNsN6oB4eq3BwddVs1ZwgWCyscKzaFiMNpj+E5eey6WicIA3zfoobnozhMpd+Zz2MLGjgrUe2y3xp5IxQixpuqbdwW33XHF5nvt1SpPF9OpMyXI74wa9TBjsB15ZozLSLSZwSxJHWaOVaPmJUbCFn2kI0urF4bhII7/u0iNP97qWuEc+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 08:25:35 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 08:25:35 +0000
Message-ID: <7b593a09-23cc-45d3-869f-c525d3155200@intel.com>
Date: Thu, 15 Jan 2026 09:25:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 07/10] tests/intel/xe_sriov_scheduling: Avoid
 assert on scheduling params restore in cleanup
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-8-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-8-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0130.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::14) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: df01ce42-e7b8-40ee-14a5-08de540fa7b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0g5KzlDMEh2RFpseUNVK1N5dWVmeFhRRzFzUnBhR0JOOHp2ZTN6SjJaRFJ3?=
 =?utf-8?B?b1VnUzREYWl1RThla2lobnk5S3MvMXFWR2MxaDgrZml5d1FFQzhtdWpSWXRw?=
 =?utf-8?B?QzBqaXBlV29YdW4rQWVoL2ZNdGxrcXFOMTJLbE1TOVNaUEc4c3Z3cUxSN0py?=
 =?utf-8?B?dmxWQVVOWUh2MnJkbTRxRHZ3OUttMkVoakJZQkVlZ2V6K25OWWYyZk9VaWdJ?=
 =?utf-8?B?QlBKSWp6SDJ6WWR1ZE9QYkpKZHlqL2dkaUh5bk9mcUlHMTMyZnpEbVV1eXI4?=
 =?utf-8?B?NHlXZ2pZbVJoejJqVkNFalhId1ROejlQYXpXL3RJTDNQeE1WZHV5bmU5aWZx?=
 =?utf-8?B?OHp4c2pnY3RkOGRXT0RtZlhJMnpEOWhDYWtiZk9SMThuV3RzVUtGSXgxVjRJ?=
 =?utf-8?B?K25PUjBKK2JMZk04ZjhSRGV4T3pyZGllUTQvUm5JL0s2NGl4cUZkNWZOYWRE?=
 =?utf-8?B?ejhObzk2QWIvcnFScC9ZUGliVFZNRGlZMXhKcmlEakVRODFWOU1ZaXZzZW5j?=
 =?utf-8?B?WTV1bmpKb2I2d3dEK1k0Y2lCOG1PeHMzZ1FrVkFNMFdoUktuTkZwSGdld0ZO?=
 =?utf-8?B?VldnSlhtaXYySGtyMW5NOGwrRkFhVlh2ek4zbTFYTWxxU0JtY1Zpb1lJNDln?=
 =?utf-8?B?Y2lid2VUbG5RNEt0blEwMW1Ka0tQSk1rTndTUlNLZ29LU2YvQzBjcGthQ3R4?=
 =?utf-8?B?WkdjWjNIdFJaWDJtZHdpRG1BSG9VTUV6UkNHL2Y0WVNVckVMSzExYXJPR3V1?=
 =?utf-8?B?R0hWL3JIUnNrU09vQnlSbXExSzBFcmgxR1VMTjRHTGQzVVBYb1Yxc1AwVWd2?=
 =?utf-8?B?SncwandkUHh5Ri9Ndk9PSG9PVTFEeG5GcjI4Z3ZWOGN5WXhqSVFnUytKVTJP?=
 =?utf-8?B?ZmFEMkY4NEE2U0pVNVhHZ3RnY3VzMTUxbEl0YUgyNWp2ZWRIcHNNUkVWTmpU?=
 =?utf-8?B?NDdlMExKeEt1QU5QZG55NXdrcUJraUpxeld2UmdHYWx6RGFUMnFxS041TUNO?=
 =?utf-8?B?cGpacVkwMDJYY24xcXJYR252VkVXMkxQd21EOEZNZkZUaEY4NDYvU3IyamQ3?=
 =?utf-8?B?d013NmVSYzlzU29mUUtzeVFGcTJaVjY0bVFFQzBGeUVDR3ZGVWVHYUhKNkNR?=
 =?utf-8?B?blUvWFpueW5EbmhCeTRsbEhZSEdvbzJabzJvUlU3SFhIdEY1Y1M3OHJVZDVl?=
 =?utf-8?B?YVdZazFjYlFIVE5VVXhUVEx4YlVDZzZ1WkhIRlRTSmhnWXFPMXRUYS8zcWN6?=
 =?utf-8?B?TkhCd09iSDkwd1IxVHI4VmxQOUpDTVBIVk43U1l4TFpVOURza2FWU2J0S0E1?=
 =?utf-8?B?TnZkamNlY3d0U1k5QmJtSVhpQjJITmpQbzlFU0kyaXY0bUg5djJ6SGhPV1px?=
 =?utf-8?B?YzZOQW0zTUhCRVAvVGovSDhGaW9tcGtqam5QY2NyM1Vra1ltMFF5ZHpOMGdX?=
 =?utf-8?B?b1cvL1BEVXMyTHAycURsZUtnWWZmYXZKYlY5ckw0VmR0UnR5YXZYVERoMGJZ?=
 =?utf-8?B?ZzVJYTN0R1ZodDRtNE9NTFduU0c0MVFRM1BJNGdVY3RXNjZ5RzFnL0FwWmQ5?=
 =?utf-8?B?VW53OFhpTkV1QW1tZ0pQaTkzYWF6VVNpdkU1KzdvU0JSdWNRUlR3RkU1RThQ?=
 =?utf-8?B?b0IwUVh2ejlLcnpuT3dPdFZ6Z3NaS0R2WUxsenAyNE9acXBrWkErdWxZcFRV?=
 =?utf-8?B?S0cwZDRaMkFlOFhKL2pYMkp2SUdVZ04xNmxabC9kQUhKWUgzVnNITTI2TFg0?=
 =?utf-8?B?azMzd2N0K3FJSjZQRWozc2pEeEZSNzh3Zi9sQ2ZlUDJjT2g5Z2FXWjhuQVFx?=
 =?utf-8?B?TEpLbmkvcVQvUS94SnhERy96ME9Gc2VHNk9KV01uY1dqSWxaQm5NcFdGemg0?=
 =?utf-8?B?S1RUYzZSSTNoelRiR3RrLzlNVDNqWnkzRElwTlpFTjJsVGhHMEx0VkRoSkpD?=
 =?utf-8?B?eVVBVGRVWGdBY0NMK0oyTmhJeGdxN0NRK1ZjSnlWQWI2TDBwSnhGZzRPKzI5?=
 =?utf-8?B?YmUyY1dmbWhaNHFXa2NHVklqYVYzSkVnQXFMR05lU2MwUjFQQVRjWXNQbmlD?=
 =?utf-8?B?ek1KNzZHeTBMOTdNZy9kTWF6d2ZvSk1sSEpUMjZjbituTWZuck03T3hRQ1p1?=
 =?utf-8?Q?SvFQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlkzbVVBSmR2dHRwdjByYTB6dFBlVjRyMjBxWEorbmtDTUJlZnAxVEN5azdh?=
 =?utf-8?B?cWVaMk4xNnR3Z1lGNTExK3NPTmZWUksyejZhUElkbHNqT1RrMSt4TE5ocGxU?=
 =?utf-8?B?eXVQRjZOcWpQeHE5VC9hUXd5OTJWWGpQbU5CMmNQSzNuL3hxSlBCaVJXeGxV?=
 =?utf-8?B?ek1wSlFaRnBXUkF0czZ1eXVObkgrNHpjeXlzaUZJNVZHdS9yQ3lVYk13WitQ?=
 =?utf-8?B?bWFhRGxNWGtWM3BXdjVVZUhNODlBSUZkOGJZQ0RmY3NEVmFtcHEvQjFjTUVO?=
 =?utf-8?B?R1BycEE5ai9hN2FpRkpVSG8rb2dNOGhOd2kwSjA5d1Y3ckNmaW00Sm5QbjhV?=
 =?utf-8?B?SU5NbUk3enBTSDhmK0lidzhkTXFjU3dzVENBWnpGbm0yTEJBWFo2Y0hnL2ZM?=
 =?utf-8?B?SFkrWXVjRXdnMXc2TTA5aEM3eTZQNGhianF1dEZzcWtVMkR5NG94L3lXTGk0?=
 =?utf-8?B?aGhGd3BKVUNsb2UxWGtHNjB5WDVEYzMyODFKQ2xNbVZ1YXJnMU1vZ0ZtcEY1?=
 =?utf-8?B?b3NBRFpXK0cxbXU4Sm8vbGVOQU00SU82VTRhRmtiOVAvY1JQZ3FVbjVaYmg2?=
 =?utf-8?B?eE5kWndTei9vUEUyQTJ0VUhQelJZMXJvbVVjU1VVWUpzczAxOVhXOE9kVmVk?=
 =?utf-8?B?YmtOQ1hiS0xwRmZYbnBxVHdVVVgzZGMwdUcwazd1b3AzdktTekJGYzg4YXlT?=
 =?utf-8?B?dVFHMDNqRnc0Ny9HR3NscEsrWE1vRVBESGsxRW5BKzVvVTBlT0NzMEpRK2I1?=
 =?utf-8?B?VjZ4SXZVd1NSTkdiTmc1NHJtSk9jaW04NXJtV042Zk9YbHBxSVJEYi9TdnVH?=
 =?utf-8?B?cW14TmNWVXJ5ME1jSkhEajVncE5mQnR6aGY3SGxUbE5UUjZLRUpBR1FKUWp3?=
 =?utf-8?B?RWVyQ0xyVjRMdkVHVzdFWDZaZDNnTUFwdnY4a2lWdi9CYTBjRDRlckw0cjJS?=
 =?utf-8?B?aktLcnZpQXJDdUh2eDFiUEhHbndmYmQvb3pHQnFKQmhkck9icUxMSEFXVUw4?=
 =?utf-8?B?M2tvQjZjMnYwNFlrRTNtRjZBays5eFpXN2d1ODhYTCtxaW9sUldveE81VGNH?=
 =?utf-8?B?OThocHFrQUd3VUxLdHQ0eGh6Q05oZGs5clFSYjhiSUNpTUZ6cWhHQTU3cWVP?=
 =?utf-8?B?eEhCdS8vNEo4ZWZuQjRzOEpqb0orZnk0UEZ6eW81dnl5d04yc2FxZnVQU1p4?=
 =?utf-8?B?THdvdlkrWDN1Y0ZyVHpUY3FFcFoxS3lIMUVBTUY0SjFtQ3IySE5ibnZxUThC?=
 =?utf-8?B?dWwzeFUyb3dIWVdmanp5amNGamZ5c280ZXJ4cVo2SjhNVFNDaEZ2RDJGNE9x?=
 =?utf-8?B?OC8vZWZFUFlFS29FYkpaQUpMT0dsVXRtSkc2dzBkVHdOalVnaE02ZW5XMnFQ?=
 =?utf-8?B?c00wWmxBNXRsUnorMGhpSUVxeVZvblZVc3ZzUjF3eUdYSVpsQ05KdS9IS3lO?=
 =?utf-8?B?c2FIS1lUYkQzb2VmdVJPZ0o3YkhSdUc1N2V5cG15bkZnOXA2TXhJRjhiL25m?=
 =?utf-8?B?NXU2UzVEeFl5b29LejhyaW5RREcwZFNuemRDMjdNci9ldm16Z2gyMmdJSlZM?=
 =?utf-8?B?MS8xNkVCWEdMK24rd1BMdmRqNHpSemdkWlcvWnRQcDA5Q1ZZR2swaWdvUmN4?=
 =?utf-8?B?RDYwZWpBcnpUTHlzWDJVQ1FIWHVZOCtXTFJPdk00YU1ZZm94d2F2N2NncGQ0?=
 =?utf-8?B?YTBzYUtqNlBNK1FEYWlmci9xUHVuMitRaW9QTkZtcEM5a0FzVVdzcDA5cEZD?=
 =?utf-8?B?ZkppVWhjamZsYlI5ZGtJRExaNnhwa1RFZmhoM2dBWU5qaUVLOUkweHFNM2to?=
 =?utf-8?B?VUhUaHhEelo3K1lDdjI2cXA2R1hTeW03Z0pzWnNLTStjL1hQN29LTHRUQTZJ?=
 =?utf-8?B?WEVlMGdHVHlsbUVNRFZXOVdBN3cyZjRqL2hwQzNiWnZHem1lNHBJNENVdTNw?=
 =?utf-8?B?K2NTL2ViUkJtWWtOT1RkUDBEWW9pdEh2NklpUXVGSDFrTlppNUlMZ2N4RGNv?=
 =?utf-8?B?ajFIRVFUQ3Z0dEpwckZXNDBWbDJYSDI4ZE16bFNtUHNGeU5iVUlORXJNaEtF?=
 =?utf-8?B?eFlXSmFITzBlc2Erb3R1dUp4UlgxaFJaRWRJd1dIYWNCQU9TQ3JKREFvMXJ2?=
 =?utf-8?B?SEZnT3FrWEU5MlZpakdheHppNStUaE5WT09lUlU1OEhqS0JibkZPOHhjdkdv?=
 =?utf-8?B?MTRmWEgxYzZHTnhOaVNCejJlL2p4SWtPVERib1hIWEI0d3JPekhqbUlPVXVz?=
 =?utf-8?B?TTI1NnZsODJMYVVMdEZUVDJuU0hDRjhLQzVrWk80N0NQQ3pHZUtra2I5ZVYx?=
 =?utf-8?B?UTJsclVaLzdXcmdOZ01vKzhzLzY0bVRaV2dqbkpPWEJUazZkdk1ZUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df01ce42-e7b8-40ee-14a5-08de540fa7b7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:25:35.0048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiTpbT9QeV/S9WrFbbd1VldWquI1E+UUITfGlmMy66neuFA1mw0NIrye7Oz4S7EWNoB5Y/pbeMsvhZHl3FplNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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


On 11/25/2025 11:23, Marcin Bernatowicz wrote:
> Add __set_vfs_scheduling_params() that returns error instead of asserting.
> Use the non-asserting helper in cleanup paths to ensure VFs are properly
> disabled before aborting.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/intel/xe_sriov_scheduling.c | 41 ++++++++++++++++++++++++-------
>   1 file changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 5e8c87755..3a0c0d438 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -371,17 +371,36 @@ struct vf_sched_params {
>   	uint32_t preempt_timeout_us;
>   };
>   
> -static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
> -				      const struct vf_sched_params *p)
> +static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
> +				       const struct vf_sched_params *p)
>   {
>   	unsigned int gt;
> +	int vf, ret;
>   
>   	xe_for_each_gt(pf_fd, gt) {
> -		for (int vf = 0; vf <= num_vfs; ++vf) {
> -			xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt, p->exec_quantum_ms);
> -			xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt, p->preempt_timeout_us);
> +		for (vf = 0; vf <= num_vfs; ++vf) {
> +			ret = __xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt,
> +							     p->exec_quantum_ms);
> +			if (igt_warn_on_f(ret,
> +					  "Failed to set exec_quantum_ms=%u (VF%d GT%u): %d\n",
> +					  p->exec_quantum_ms, vf, gt, ret))
> +				return ret;
> +
> +			ret = __xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt,
> +								p->preempt_timeout_us);
> +			if (igt_warn_on_f(ret,
> +					  "Failed to set preempt_timeout_us=%u (VF%d GT%u): %d\n",
> +					  p->preempt_timeout_us, vf, gt, ret))
> +				return ret;
>   		}
>   	}
> +	return 0;
> +}
> +
> +static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
> +				      const struct vf_sched_params *p)
> +{
> +	igt_assert_eq(0, __set_vfs_scheduling_params(pf_fd, num_vfs, p));
>   }
>   
>   static bool check_within_epsilon(const double x, const double ref, const double tol)
> @@ -729,7 +748,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   
>   	/* cleanup */
>   	subm_set_fini(set);
> -	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
> +	__set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
>   	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   }
>   
> @@ -815,7 +834,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   
>   	/* cleanup */
>   	subm_set_fini(set);
> -	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
> +	__set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
>   	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   }
>   
> @@ -923,8 +942,10 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   	}
>   
>   	igt_fixture {
> -		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
> -					  &(struct vf_sched_params){});
> +		int ret;
> +
> +		ret = __set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
> +						  &(struct vf_sched_params){});
>   		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
>   		/* abort to avoid execution of next tests with enabled VFs */
>   		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
> @@ -933,6 +954,8 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   			    igt_sriov_disable_driver_autoprobe(pf_fd);
>   		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>   			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		igt_abort_on_f(ret,
> +			       "Failed to restore scheduling params\n");
>   		drm_close_driver(pf_fd);
>   	}
>   }
