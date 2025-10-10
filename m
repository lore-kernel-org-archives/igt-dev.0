Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC597CCD185
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D4710E28D;
	Fri, 10 Oct 2025 22:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+M9A8Ay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C0910E28D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760135157; x=1791671157;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BDt5eSA4Qp5KDbXTxw3BQgiwareYk5UIolL0asSeZZw=;
 b=m+M9A8Ay5EHg9VddRSd3KX67I8je/gHrxp+YHBRNdsmv45bP/bibroZP
 KHOpwxDzqHE9V5DUQMNunI1GN7br8kNmBTNFAnIini9zRbmJ7WGRlOcC+
 IRZEw8enlaAjmkdAk51sVRlA+fdSToF9dAUemCNYiJbC2qQqdWk9pV394
 UdgrA+jk4KddqOMr6LPtxQtnRoOHdX9tvXo51C0y7evVWnhDt2llvsQLw
 w8lR8jmkamXle44yDo4sjYMeW5G2NXyuoBMAEf8OQ1MacPPKyiROQlwWK
 F9Z9GBCMjujiuEPbpHUieWFpQ+iF3GXj4NQCVLkFPi+CUueWyNBX86kZM g==;
X-CSE-ConnectionGUID: BrZeTCFcSmS9EZcJbkVmtQ==
X-CSE-MsgGUID: d5rGXxgJSI60QieAgGwkrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62278753"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62278753"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:25:56 -0700
X-CSE-ConnectionGUID: TejSoi42RIeMphRiZOkgzg==
X-CSE-MsgGUID: A2JNXTDdTU6Hcagkz/oBog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="180665187"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:25:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:25:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:25:55 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:25:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmVGD9P/Jee4/UHKhwIFiJs293k4CBEElofirbUqrVOF0sHtbwl8zYw/MF3Lraq3ylHJIi87HsquhPYRs0HvOYhqSsmVJ6aAeee+SKSd+oCB0Hn/u34rS25Z3N5Hd3lQzqDEwzmhcO4So0O/wq4jAqrnKtaTu8bNlUVyNN7MYB+OU4MBZ3ZTSnS3HWVAGuLTMDNf2BiLE6wHwUn+oXzdDDRUMNxWGKJM8lLajl5hVh9VUUxOFRl/ZyLprkrwjWb1zENFEmBNIf6QnCuExwpW485VTP5ixL0SNewbCAXz/8k3Xm/K8emrijWaF0BaBwqUGtsVC2sh2sP4IxWJn2Gaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzDKMm2McXd+H+0jGT7ZRMJatrEISqTx44cs+fqgZo0=;
 b=UipriODV/d59Tz836xuh1hjJ/pUgBcM3uagaX//xTMBfCY/4jzcmJeHX/x9fCU8bqiYPMsriWy3i88S2DNqUuoeZYy8d8i5Elw7bGNlvtB5poj7XrMrrvtRz1qfW2u7b37zAODU0nN+RsiKcqmLmloPDImAGScwdi/enr7k6DgEzhZWsaGQ/CZueuqG5N0amM1SRg17hFTPyoWGxb5JKYScqFdD2gdP0dMFJqpunB2eu3zmHiiBMcCEWCh/kI6Ma+YINpSwjx5Lgtb+tceYX5tUxIRlowe/i9GDydZuriWGMaVQe0FtgnyFGD6y8cMh5bSM4uwSwkFf2nCkgqUDAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:25:53 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:25:53 +0000
Date: Fri, 10 Oct 2025 15:25:51 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 10/18] tests/intel/xe_oa: Convert blocking/polling
 tests to take OA unit arguments
Message-ID: <aOmH749YJq2sS815@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-11-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-11-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0357.namprd04.prod.outlook.com
 (2603:10b6:303:8a::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 4824e236-58f1-4d7d-5714-08de084bf98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGZOZDJTZjdNeWNDSnFQZE5ZVHlYV0U3ZGdLQWh2Z01QQnk1ODRXT1JEWGNC?=
 =?utf-8?B?ZXhCUWIydTdtTnNkcTFKdW1CbGNJbUhDTlpPTC9rZkk3eldrVWIwQklEQ1dT?=
 =?utf-8?B?MnRUcm9NV0VLNW9jRXJOcUpockdCQ1grVUsyN1ZYM2l3WnpIakVFa2tHRnBn?=
 =?utf-8?B?ckpwam1VU3hiQmNBNlU5MUJadHF5aVZPUnRBOTZ5OFVGQXZCZ1hPMFlZNFBN?=
 =?utf-8?B?RjBEQ0JrK1hZbzRPUmxJKzZJYUx6MzNlWGRUNERRQWpsY2tCMzRuSE9TZEJa?=
 =?utf-8?B?Mk5xdGR1bEY4U2Rub0xmd1B6WTREVHBCVmVweWNxUzJUcmFWcVEwSkkwbjB2?=
 =?utf-8?B?MTdjS1Q4T3EyR3Nqa1hEOVpmNXpMbVlKK0tUbGZPUmx4SUVBZkJITG5HL0Mz?=
 =?utf-8?B?S1NUUXluRmJLOFkxay8rak0xV0lLR0o4UWZVeGlSVXRJbzFOS0N6Tmt3NGxn?=
 =?utf-8?B?R3ZPZjVLWUNrdGFjMXgrOEcvWlFLRmN4ZS90M1Y2MEdOMTZaYjc3MG90K3RX?=
 =?utf-8?B?VTJ4dkVHSGZpZlkxTTdyVjhVYmFNRGs3bkxuL1dWNVhmSVgzZWZPRlhYY2dC?=
 =?utf-8?B?Y3ZFUFFneHNJT1VUWHhlcTJhaGV6dEhOdytWN2RnTFppck91TGNFY1FqdEQ5?=
 =?utf-8?B?ZUx4WUZaZUJyRzd1Y296a0RkV2RUL2pVWU5EZjc1RTc1TDdpckRiVzJnYVVk?=
 =?utf-8?B?ZWZBd2RNWVdlOWt5bXJQaThuUUQ1L2o1VUhyMW9venhJUm1Hd3BOVDdUcHc4?=
 =?utf-8?B?RE0zQWpFM3RnZVhzMDBBWWdPR0ZiWFFEdy9ZNmdmalY1RHUzZ0pQanhZbzlZ?=
 =?utf-8?B?eC9STWVBa25LdE82RGZrTXR2SVBjWTVHajhockZkUFcza05HV0V3a3BTOVhR?=
 =?utf-8?B?NTFMbGtnUzkrcXU0cWtxak15RVExbGFmZ2FjNzlTNEZRdGMvcXA2eDVFWjh6?=
 =?utf-8?B?ajFYRStCUEJNQmlGazZVQUV5OVJSai9hSGh3STVSNGNOcHo1Ui9yc2p6RS9Q?=
 =?utf-8?B?L2JBTEh3Z1NueUJPeFpQd2VrNXgzQ1ZCeS9iV2ZVSXl0Q3kybDRpN3liZ0lK?=
 =?utf-8?B?cWtxaXUyZGhNb28waHM1REd1bUIwVzlQZ2VvK2dueldDRGhsVU1NZmZxejJF?=
 =?utf-8?B?T3BDaEd5UzdSTGZCcGs3RmpUZEhXMnZTYWhESjN4YmhwY0VYbUJSejE3ZC9i?=
 =?utf-8?B?dUltcWpiMktLWnd6N2pBT2ZFZXB3RWdkNlBkZkdkeis1dk1zRGFyWGtCUjZM?=
 =?utf-8?B?S2lWMDlZdXBEb0Z2VDFPN2hiWVp2enBxNkdZWDJ0MEw0RUJIVW5oKzVrclZB?=
 =?utf-8?B?blE5eS9IL3pMZjB5TitzYStwSVVrcWV3aXlkRGxpdUgwSVJ1dFlpdVQzejRo?=
 =?utf-8?B?T0tpdEJKYUNlbHFTcDRUKzBhRFA1b1h5OWJRbzBpUEZpTjFxZWNyQUE2L0VM?=
 =?utf-8?B?N2RBN3dDU2NpR3ZJK1FaUUgxUm5DRS9yYnUwNmxWWlNWeWZ5SUlTa2NPTVFo?=
 =?utf-8?B?MlJxbXIwV1FucU5NdWNOQ1YvcDJXYm9CbENuS0g3TkpMa0hSS0pjcnZhclBD?=
 =?utf-8?B?UUFPOUtzY05ZeXJjaWxWMCs2R3o3MmhNczR1c3M3NmdWRFhMbkJwL2VFQmI4?=
 =?utf-8?B?L2ZZMjlSVTVoNkVEMzJZcXhNdVNqTVkxQWlZY2tVOGZZZTRJSmJrUU92U25E?=
 =?utf-8?B?aXpDUUo5QkQwWmE3bndTWWZKOUI0VGRFbm1CQk1TaERqaWlpZUFtcFBnM2J2?=
 =?utf-8?B?YjdqQjhRZHhXUjRuT3h3Q0JBdk9DSFpOcHphVVZwQklaSkpsV0Z6TEJNa1F6?=
 =?utf-8?B?elNVdjI1VDBUZVNJRkVoeG9icFI4a2Zuc2NCYTd3dGpxV1JNcjlZLzFTVHE2?=
 =?utf-8?B?eWthREpBbjE0QUpOcHFxbzE0a2RRQ0N1aGQzYnh1S3BBTHdHRCtUR1ZNQ3ln?=
 =?utf-8?Q?5VXtPob77Upmm3P0nJLX+6QmIMWSmtJE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWxtNGRZYWllZlJwY0pqNmVSM3duRlZHamsyejg0S1JwMnFWakNoYnVGSCth?=
 =?utf-8?B?OTRBbmVWcFhocVMrTncwL2ttQzhUSk5rMnBtTjJzQ09tZ3dMRzJ3YzUxbW94?=
 =?utf-8?B?c2xSc3ovY3l5alpSZ1l2S0RnSVJocTdpTGxqcC9lakUydTFqTzRMWElkZjhH?=
 =?utf-8?B?cnRZb1lkVnNUK3NkeFljQXBiZmhFT21mZnBCOHhJVlhwOC9hOW5lMVJwaHpt?=
 =?utf-8?B?WldHUTQ2SVpuQ2R1Wko1YXVBa0RKSWUxNnMva01jbVJlcDdCcFdQYVl3Wjdt?=
 =?utf-8?B?UVVnNE8zcitZa0czR2I5OHBqLzBSemFFQ2srNmI4OWk0dDRCaUFIQXR4bXZy?=
 =?utf-8?B?eTFBMStsaXNvVnd0OVZrL09BS21rYS9rSFZXdUwxSmowcUFpRExrOS93S1Y0?=
 =?utf-8?B?ZFNvMmIwSjRwNHJ3UHVqeUxpMkZvUlBZOWV0elUxbW16bVdDK1pnK1FZdmNT?=
 =?utf-8?B?TnIrSG9rOVRubElqNytoeGdOMituRHhvdUpwWG44WlVzanhyWm5HTTZJd05t?=
 =?utf-8?B?Z2sxWEp1UEJtaHo5dzRGc3Q3MkVlN1dGVHh5U09STzBKNnJKUGs3T1FZYi9D?=
 =?utf-8?B?VzIwL0lVcGRpUXEvdWY5Wis1MHNMUkFvMG9JMnlndjRoUnVqMEp6NTZDZmNk?=
 =?utf-8?B?NS90dlR1YTVlMGZveTZGYjFXaEhTdkZxNHNidldKcUw4QWJ0TUYrbXBjcHNO?=
 =?utf-8?B?UE5zMVV6eVh3Qk5YaUJtdXoxTmd1UDZxZ09FR1pKL09UMExUNUJzK1Q3UHox?=
 =?utf-8?B?WGhSNGxhcXRONEF0NlIrZHZXWHV1R2NrZEVVRUJzem9GWkdVNG5CbGxIZ3Jn?=
 =?utf-8?B?cXJwNHpPTi9xOW9xVVd3TUNRTWlPc25kK0FEc2w0UGtLZVBQbmRxaUsra3dz?=
 =?utf-8?B?dlFzZFpnZHIrV0J3ZE5ta3VPcG10cDFVdXdkMW8xV3RPTlpFQ2p5cXRPT3hq?=
 =?utf-8?B?YW9kQnJvSzRqWGZiMTRNL3JxRlhENTZGdDNuSXZRcGpTcFJLbHdJY2hxTHVP?=
 =?utf-8?B?OTVLaXo2MThLNGJaTVdxcjAwMjlvb3duWlBGaXZDdU01cW5KVzZFMFg0OXlW?=
 =?utf-8?B?ekNKTytNNyt5QS8rZktjekFZMGc0a3VVTThDeTZuTjVwQk53QnQxWEhPZWYw?=
 =?utf-8?B?bjQ2TWVBaHl5WVhwL1NLMWplZmpFVVRna2I2LzF5QnlBQ1Y4SWgvMWlranZj?=
 =?utf-8?B?aHZaN1N4NHdmNFhSODdQTU9VSlYweGlvTzV4UG0rSTV4NDJ1d3l3ZWtDV21K?=
 =?utf-8?B?Qk9sSkF4RCtwUFNBdU9kaDc0SU93UzZYRGRQVnVVTUF1b3RFZFRJak9EQmt2?=
 =?utf-8?B?blhuSnlKZHljOElQbWpMQy8xK0lKMllhVFdSOElhWDlRdC91NzVXUGl2L29W?=
 =?utf-8?B?Z2RnQ2IzQUZQWFp5Qm91NzZOL2pQdWNFaHFCd3pabGF5cEFMZlIrSWVSelpT?=
 =?utf-8?B?RVRCSDJQUzZ1SWtKN0ZIUHZMUU5sb2wxNTNIRXg2Mm9WZGt4TkhKaHFkUVpi?=
 =?utf-8?B?RHJ5cHcvNFlKOWUxYjFBYkhyTHRzQVVwZlY0cHNaUzI0MDFGSUlHVVFjS3cr?=
 =?utf-8?B?STVYK1JhM3FxQjl5N2lsYXlnQUZIZFFnRUN6QUtoOFkySmV0a1U1MXNrUVda?=
 =?utf-8?B?ZlZQSU5ua3BrbGRxclFqK1Vic2NUMEl0RzY0cDdjYWd5TUdja3NQTzNrc0VD?=
 =?utf-8?B?ZEs5cW9saHNEUjJzcFJseGRITndNOHZBMzRSUEdHa2RNemdvZVJzTDlMQXZj?=
 =?utf-8?B?ZGFOcHNJZS9MdVI2c05sdVZHQjQvelpqdVdZSUtwdzBtQy9Gd3NJeVZueW9R?=
 =?utf-8?B?Y01TT3VkM3kyY3hIendQRGpwekt1bG5lVmRYVU1OM2kvTEJqTkxaZytyZTYy?=
 =?utf-8?B?d3pMc1NJc1pjeC9jNEsvbHZqSFk1U1B1cEhsZXNCZHVST3FHL1VIUW04ai81?=
 =?utf-8?B?WGJCdmVEVklNRldYLzQydDZLQ3VZYm1GbzVTc0d1bTAzOGxHSjFZNGRXT3JH?=
 =?utf-8?B?R2NsWmFUNW5YS3N4SzBvUzZHOGpiNjh2VHJhTkdkcXRyTzhTK2F0RjZnQnJI?=
 =?utf-8?B?cGRrNm83c2FRTG9PdllxZURvWTdDYklxQ2d2OG1lMGFTSkI2Q3FBUGtxaFVq?=
 =?utf-8?B?bVdNbS9lWm5oUnVJcVhaMlQ3YkpFQ0tPRW80N2lUZ0lYSHJzdERXUjdmY2Jp?=
 =?utf-8?Q?J0MZ75cucWyBTxIrxZTQUxI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4824e236-58f1-4d7d-5714-08de084bf98d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:25:53.7054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbbTkszEi7anWXQUED4VUcmpzDUwCv57Rny/Cj+RnSL+V+9W+56At4JUK5P5gAqNLzVQ/qJ7R4sMOvDeh/aTo2N4y/ZUFrf04F52GbRxyEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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

On Wed, Oct 08, 2025 at 02:17:57PM -0700, Ashutosh Dixit wrote:
>Convert blocking/polling tests to take 'struct drm_xe_oa_unit *' arguments,
>to enable these to be run on all OA units.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 26 +++++++++++++-------------
> 1 file changed, 13 insertions(+), 13 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 8ee8a85ed7..739da370ef 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -2099,7 +2099,7 @@ get_time(void)
> static void test_blocking(uint64_t requested_oa_period,
> 			  bool set_kernel_hrtimer,
> 			  uint64_t kernel_hrtimer,
>-			  const struct drm_xe_engine_class_instance *hwe)
>+			  struct drm_xe_oa_unit *oau)
> {
> 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
> 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
>@@ -2128,7 +2128,7 @@ static void test_blocking(uint64_t requested_oa_period,
> 	int min_iterations = (test_duration_ns / (oa_period + kernel_hrtimer + kernel_hrtimer / 5));
> 	int64_t start, end;
> 	int n = 0;
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
>
> 	ADD_PROPS(props, idx, SAMPLE_OA, true);
>@@ -2136,7 +2136,7 @@ static void test_blocking(uint64_t requested_oa_period,
> 	ADD_PROPS(props, idx, OA_FORMAT, __ff(test_set->perf_oa_format));
> 	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
> 	ADD_PROPS(props, idx, OA_DISABLED, true);
>-	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
>+	ADD_PROPS(props, idx, OA_UNIT_ID, oau->oa_unit_id);
>
> 	param.num_properties = (idx - props) / 2;
> 	param.properties_ptr = to_user_pointer(props);
>@@ -2242,7 +2242,7 @@ static void test_blocking(uint64_t requested_oa_period,
> static void test_polling(uint64_t requested_oa_period,
> 			 bool set_kernel_hrtimer,
> 			 uint64_t kernel_hrtimer,
>-			 const struct drm_xe_engine_class_instance *hwe)
>+			 struct drm_xe_oa_unit *oau)
> {
> 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
> 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
>@@ -2272,7 +2272,7 @@ static void test_polling(uint64_t requested_oa_period,
> 	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
> 	int64_t start, end;
> 	int n = 0;
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
>
> 	ADD_PROPS(props, idx, SAMPLE_OA, true);
>@@ -2280,7 +2280,7 @@ static void test_polling(uint64_t requested_oa_period,
> 	ADD_PROPS(props, idx, OA_FORMAT, __ff(test_set->perf_oa_format));
> 	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
> 	ADD_PROPS(props, idx, OA_DISABLED, true);
>-	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
>+	ADD_PROPS(props, idx, OA_UNIT_ID, oau->oa_unit_id);
>
> 	param.num_properties = (idx - props) / 2;
> 	param.properties_ptr = to_user_pointer(props);
>@@ -4389,13 +4389,13 @@ test_oa_unit_concurrent_oa_buffer_read(void)
> 	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>
> 	igt_fork(child, qoa->num_oa_units) {
>-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, child));
>+		struct drm_xe_oa_unit *oau = oa_unit_by_id(drm_fd, child);
>
> 		/* No OAM support yet */
>-		if (oa_unit_by_id(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>+		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
> 			exit(0);
>
>-		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, hwe);
>+		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, oau);
> 	}
> 	igt_waitchildren();
> }
>@@ -5153,20 +5153,20 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
>
> 	igt_subtest_with_dynamic("blocking") {
> 		igt_require(!igt_run_in_simulation());
>-		__for_one_hwe_in_oag(hwe)
>+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
> 			test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
> 				      false /* set_kernel_hrtimer */,
> 				      5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
>-				      hwe);
>+				      oau);
> 	}
>
> 	igt_subtest_with_dynamic("polling") {
> 		igt_require(!igt_run_in_simulation());
>-		__for_one_hwe_in_oag(hwe)
>+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
> 			test_polling(40 * 1000 * 1000 /* 40ms oa period */,
> 				     false /* set_kernel_hrtimer */,
> 				     5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
>-				     hwe);
>+				     oau);
> 	}
>
> 	igt_subtest("polling-small-buf")
>-- 
>2.48.1
>
