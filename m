Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5585CA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 17:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6427910E1F4;
	Thu, 14 Aug 2025 17:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJ6SU26E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511C610E1F4
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755192240; x=1786728240;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FwqAbpT8kOFFwZLtjB3I0Vcng67gQvSmqRcHZGqObEI=;
 b=CJ6SU26EBF+xi5llGYL4aSTCIPyBhVfE3HPEndiwr8HF4QrzqIHVr0CX
 oVpQiUYjPlH5lUKseAwjElv3bHCFW3o7FFkT1rOzrDCZR0qWmVG5C21aA
 FoS3YKpom5ISCmVVxrMTHm8kDcsVl13IVna7ca3h1303fC1aL1rTEO3NC
 WzTfrRKFO++EeepOwGbzX26lNsUtLmzjDx0KtVqpKAMtEbveYZTOkKV6q
 eTYuMK7ScJyWfsSYRRqmUkVrvX78+Ds3lwDIJmAZKELaRY3AhHuxsM7bj
 SZM6F/9vkBF4wYSyPg94CYj4ausjjbzvCBiF0wdqQh7DpsBWeeY/KHyoQ g==;
X-CSE-ConnectionGUID: y88YPmB8S32zamDdbPNn5g==
X-CSE-MsgGUID: IRibnRVDT9mmjrbeywcVaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57469522"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57469522"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 10:23:59 -0700
X-CSE-ConnectionGUID: bQ1a/Lt7SO6RkWvnzjqcIA==
X-CSE-MsgGUID: HURsNh21SWGqvew0NHp6mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="167179080"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 10:23:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 10:23:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 10:23:58 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.72) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 10:23:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ics+82badGuYPGQxkDeloEUizsVaxeXTJ35eqwZY8kbkLu727Bi514Yl2Zmfx6URj44VD2JHc8SHudAxrhdHqjHzTkonlJRMiqYcRDTq+vMO4f8eiDhyJH7zMbe1vxd2wAQ1tUeKJsTohvbM4atJjJvJgFN8T6/jmXUjzDvVCY4WrjiyHHorxNlArzhmtktiALg7Iqrb0WVsj+tz3ErZWJnpKlUWKJ/0G7lrGEef+hDBBzcI9yMXU41eLtOB584FZvtUZ9YppOM8EFx1gBxmw0YPbVSCdA6KlvpBeCPXNIAgNJDhe+zQUGskVGKWqyNtw7G24V2fkGDS7kweUbMEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyey4hTvfAuy3q4PgIX2Cu+gUtTCpaptYNlSXh4SwIg=;
 b=qQtXqJ5p+AU774UVjhsofIMUSffAuJps/VIL9t+rNTcLYYpDM9NvHGTChD3Yv40VgKgy51yttX0wDZAKAA6v3iESv1NNNgThYchJjZ0kIHkqdy9AhbKSQ1DpciYsgYdwXHGRseE0BJg/2RxS4ZwhUgeNXzcBFR1k8F3nBRMIf6A3apfb2YEzEIQA41CNZDoJsD9gfEPKt0auXwVAs8F8hw71PYmw67nInW7MFDMbWVQxSvCFUmIJzsekxfM5Yvq/eHhsqZyNQN4AEYqZKOybHTYh8qIBBZM8tMLllmGpAe5wKxZcxK7pP4p6XXCeUtRGYRADafTp/MxN5fi6S61Pkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB6692.namprd11.prod.outlook.com (2603:10b6:303:20e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 17:23:56 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 17:23:55 +0000
Date: Thu, 14 Aug 2025 10:23:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] lib/xe/xe_spin: Add switch point for preemptible spinner
Message-ID: <aJ4bp3G6L1518vrr@lstrano-desk.jf.intel.com>
References: <20250813155935.87329-2-jonathan.cavitt@intel.com>
 <buzrxspq2t2eoeeh2rverullk5o3qk6yfy4mgsrb6gmy52jf7r@z5h7ituni3hu>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <buzrxspq2t2eoeeh2rverullk5o3qk6yfy4mgsrb6gmy52jf7r@z5h7ituni3hu>
X-ClientProxiedBy: SJ0PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 703e36ea-46e9-4a1a-e9c5-08dddb575880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1ZvOFBveXR4LzlVeXdwWlIzeSs1UkwzRkZxc3k2YVByRHl6dXh2UUM5SWh0?=
 =?utf-8?B?eEZ3NGVPaE5pQUJ6QmE3Q1VwUkZyUjRHODhlcytnMkg3UmZJWThCVXR0cm90?=
 =?utf-8?B?TEJVN3dKT1ZTb3FQZzgxc1FJMlkvQmNuRjJuYU1YT1kyRTBmcW5mM0hvQ3Bs?=
 =?utf-8?B?Vk1DaUdWSzZRSCtDbjBIQnEvNUUxcjVqNW94UVJyb3AyZ0lyMnNJb3QxMkYr?=
 =?utf-8?B?UVVwOGs3elA2V0N0aUgwejlYcGlOSVpKcmJyK0xrRjhhMVZGeHg2RXBCR2NQ?=
 =?utf-8?B?Y08vc2xKcmxtNzhMdmthQndKQUVxWkV4bUZrNFRVNFhOWDRYTzlkekMrWHB2?=
 =?utf-8?B?bm81N25uWGlDUzNMa2dCcEN4Y2tXd2lFSlNPcElMTUp4aTQ5ME02UUdOWjIw?=
 =?utf-8?B?bkxmMjRZQmxKb2tOWWRPY24vYWNXMitZVHUwQVprckE1d0phT1RQTEp3NGwy?=
 =?utf-8?B?Q0ZKRElkT0E0dUEwbTBjbUh6V3JPOVd6NHVRU3ZtZ3hmWHFUVVJycDNOck9a?=
 =?utf-8?B?RC9JdGd1eVNoV2M0VkVHeWJWS2R3dHNNY1Q1N0w3NTZ3aEExWFFsOHVyZHN2?=
 =?utf-8?B?bUVKWDMzbWVqQmwvZEFORDNOMncwK2s0bGtkK1dXbGtyZ0pMd0g4OUdISTFs?=
 =?utf-8?B?cFRaVEFqMXFjOWMySVdrK3R4ZytMcTVEcG51M3hFMkMraTJDVVo4Z1d1OXJV?=
 =?utf-8?B?NmlxNmdWUlVoeEpvSEYrRUpwUWs5ZXpwK0tTa1ZnUGZKRGhzWUkwckE0UjFp?=
 =?utf-8?B?T2NONGtET2x5VnladTVxZFlNWUM0RER2K0wrRFRDdEhhaUtkYlB0SWRDaFlC?=
 =?utf-8?B?MUFnLy85MXYvZ3lOZ0NndEgxTnJLOThtUklvWnJIME9SVFlWeVI3bHBmcXpD?=
 =?utf-8?B?MWIwQW9CeEFzUUhIQmx5TDM5RWhlR3J0d0IwbVhlUVdEMWdmdGs2aXRkUkxi?=
 =?utf-8?B?ekZNUi9URG1hMnhmTUoxK0VDaUZyVlBpay80aHlvNXIyUHRmTEFQRW9CWVdw?=
 =?utf-8?B?QWdkU0hFOHh2YWRHYVY2T3NJeGlwQmRyL0tsMWJ2UlZwekZlRzcvblJtSWxL?=
 =?utf-8?B?dVlwaGFQd042TTJzQ3RxN0RsYUJER29oNkh2dTVaOCt3c0w3dm9lc21jWURz?=
 =?utf-8?B?M1VVaEtmOXEvY0tYMEZHbzZEelNTKytPaHV4MjhMQ3M5c3dLR2VRWkduZkVL?=
 =?utf-8?B?cTdnaEhCQjZ0R2gyY0RhRUlFNTVPUHZUZ0lnWk01SC9qZHpEQVlxU1l5dzgy?=
 =?utf-8?B?TG04SGNaNk5Qak1Nd1RPQmoxcDhjYW1mM0svekdjc0RBeHlzWEpCUUNPZUpo?=
 =?utf-8?B?U1JiVzllL0FwT1cweUg5YjFnQjZvanVoMkRTYk1JTzRpZ2E1QTV1TDdpYkRD?=
 =?utf-8?B?ZlppZHQwZ3hmRTNHVy9BMXVuZnhRZ3JDRDNQS0xYRUVSanVQbTJ5S1VjMkZ2?=
 =?utf-8?B?VzM0eUFQRzBmbm1XWlpkU3VhMkdGTC8xS2pXTWpNYXV6SzBrOEJqM3FWUGxw?=
 =?utf-8?B?Y0dVdDV1ZzhSc3RxSWFMcTFxOGdLaUlYWDBydG9KZURuVWZOSTRkQ09ZbXFY?=
 =?utf-8?B?dTE0alQ0a2N3RGs0cVNDYXlwRzVOTXYrZEZPMzFxcDBTUjkyTHExc0NCcHl0?=
 =?utf-8?B?TmhDZXlmcU1aaDIySGtMSnFGWDlldHI4ODQzNDlOSzhCeFNrbkNqaytjUTFW?=
 =?utf-8?B?a1JmZXh1a0t5NlhUM1hLdkdVdWhJMHRpZXpxejk2WUVjcXV0eFNvcEs4Qm1p?=
 =?utf-8?B?TjZxbnd1b3JjeXh3TDFnUXlXcWVWVTRLVThSdDg1V1Ixc0lpWS9jTHI1WVFN?=
 =?utf-8?B?eG1SSDA5OG1jRml1TDgzdXRMZXJxRGxDQml4cWZVaVlEQmhPdUdFN09WYkc0?=
 =?utf-8?Q?EcUFJq9mD5ATY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXB3cGlCd0NOdFFzUmd0aXlXL0JaM0F6dkNGRDBwZVhtRDN1OWF3Mk5XSXdY?=
 =?utf-8?B?N2dTYUVpZjlFR3BvWVZqdzgyV2ZWZjVDYVVObC96cjlkMUsyMWxrb2dYRHl2?=
 =?utf-8?B?SHA3SkpodHV0ZG5QaWViaitacHkvRXJpd0EvSi9SUEx3Q2h1anArMnllUG5m?=
 =?utf-8?B?RjRhbklsSmV0QXlKODZHWnUzMVp5WW9sQkkrUWNHNVRaSU5jWHBPb3JRV2Za?=
 =?utf-8?B?Vmd4ZHR3dzhONW9iUTVQMTVhcVRtcTFtUzBEcmRUV3NMYmhYQ3dDdnVrMU5F?=
 =?utf-8?B?QXNMajNEVm5UZjYzdTRVU0RWM0xWcll6VkRGMXRscTByY0dBVFVDMmxhL3Ex?=
 =?utf-8?B?V296aXdXTTJEQVhOOVRYaDNQUGMxQ1lER0l6SE5MakhDNEVvUUxhTFZLWFJn?=
 =?utf-8?B?cnFwMkExd3UvVTBkRlUwZGFrRlptRTd2ZkNpTEhRVG05YU54N3g3VzYrWDR0?=
 =?utf-8?B?ektIbTJySUU4dlRxa0k1b2t4NWZhM1FjUTluUTlVMHJqOEprUERiaVViSG9s?=
 =?utf-8?B?cXpJaTJodjVJSGhJdzdZdGlNNjE0Y0JyTDUra3hjRzN1NkJ2MTBnUzJIREQr?=
 =?utf-8?B?REhwMVRTZDBvT3ovdmhKT1NrUUE0emQ4S3VtVTh1Ym9RWnNyaVVEMzlicXFh?=
 =?utf-8?B?TjJ0WCtUVjBqcUIvR1doYm9rNks1bXJZTUx0dm5wd0xveGsrcGd3WkFLZUk1?=
 =?utf-8?B?emxVZ3dKMzV2YjNKc2pWKzZ0OHZ4UnNjMlF2ZDBIUHJqcVhhOUo0TzdVRzVT?=
 =?utf-8?B?U1ZtS1pzWWkzVVFyTitsWUhFVjkvVlUvR3JvY2JuNmpTazRKZ0tFT05PajZW?=
 =?utf-8?B?YjFaMzdMYWVRTDk0RXJBbWpGU1M1U3UyWG5TU1hIWURSOG9VQXpLbUk2U2h2?=
 =?utf-8?B?QlFWRUZRaTdDWGJsaXp4MytHQ2Z6U0tROUJYNmNueWw3YWtXdEJMVy9USFQ0?=
 =?utf-8?B?UkMzZWx5aEIyRjJvMjJBTGVqeDBFL1BuNWNnQU9qNXNLWk1TaThvZEhuektW?=
 =?utf-8?B?UXlCYkcvemx5TkRSSURWTFlmaTUrWkw0RUs4WjNYT1FFK2FXTVhyNU9JT2Zx?=
 =?utf-8?B?ems0RjFaK2tTM2lnV0kxVnVud2VzUzd4QVo4ZHMxUzVYbnE4SnFJeDJZWnNL?=
 =?utf-8?B?U0p3WXlJZUNMcnhNQ09iVkNaMjYzbmZDYWdiUldyaWpBTjhvaHNCRFNsWjZE?=
 =?utf-8?B?enNNWkZkVnM0a3ZObmpGQ1BnNFNKZFM1d2h0Y0FrZlJ1bDVBbjdWQUp1TEpZ?=
 =?utf-8?B?eWpSS00zbXh1K0NtMHhIN3RablpGejBFQ0IwUkRJT0lPQ3NRb0lTSHFVckdY?=
 =?utf-8?B?RzJzRkUyKzRvZ0JQM1hOR3JMQ3FYYXJTTEdsUGpDbE4yY2RvdWtvYlZoaUs1?=
 =?utf-8?B?Ylo2ZzZ5dTlqSXdqNGZ4dlQxU0N1cFhZUTZJYnF4ZmhjNUlWbTBreC9NdTR4?=
 =?utf-8?B?T3dtSW5WQjdySTZ2R0RiWUNHNUJnTW1jN2grTW9ldnplY2ZlMnRkRnJvQitB?=
 =?utf-8?B?SFpSUDVFaGdJKzJkcUxFUUkzYVRHYVlGVmtFREhPeUtJQmFRRlhqd1l2blZB?=
 =?utf-8?B?dG5BbzU4R3FFZ3NzbUNRS1VpWUhhRGs5ZWNCMUoyQWxqZTlPWUI0TEFoZzJ4?=
 =?utf-8?B?aVBEYVNMeDhxTGp2Q0hvL3NlWFZ6aDJUYXVTOW5rWmdaSnh0ZGdhQ2pSbUZm?=
 =?utf-8?B?YU9NOEpFekRhMFZGTnp3UjFZOTZLYTliK1JqUEJaQkk1bmFHeEdMalhTV2Mw?=
 =?utf-8?B?Q242QWF4cGVPY0xzWjFTeWxyN2Q4Q0RaMzRzT2JJanc5NVNIRE5OMDI4VDU4?=
 =?utf-8?B?OU9xWENUdzJpZlFFWG43c2s5NENVS2ZvbmRJMXVnTk8ydjBFNVgxWnFFK0pP?=
 =?utf-8?B?TG96T0U3Ujl5WExrbnYyQ3hveTJid3dUcHNUUmxPeVZnOWVSRzJmdDlndnNh?=
 =?utf-8?B?L2xOT284TlRmK0xrenFqNFlkNWJjang0bTVRWmYwMWRFOFVLQUQxZlNseWpF?=
 =?utf-8?B?djZZL2F3N0kzUTZaMjNmTldIWDYxdXNYcXZXbmxOUlZURHJVaFBlNXBEd0lR?=
 =?utf-8?B?ZWlxRWNQYWowc1FqNmJCRWFlbE5TOG81UC9CVWxBL05DaHpmdUt2dG54N1Vi?=
 =?utf-8?B?Mzg4MzhLVEJsTnRpcTdqUTg4dkJBZEtwamd6bWdwWWJqQk5BZHEycTh4Ynky?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 703e36ea-46e9-4a1a-e9c5-08dddb575880
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 17:23:55.2626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xccNS2XSWPHZT6uDyFGU9eVHlMpkCcPVJGO4EkjIYxZJtEwTYixygBMNFaNq0j5kmUQcrVebLXRZO44q5I5VwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6692
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

On Wed, Aug 13, 2025 at 07:51:31PM +0200, Zbigniew Kempczyński wrote:
> On Wed, Aug 13, 2025 at 03:59:36PM +0000, Jonathan Cavitt wrote:
> > From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > 
> > When 'preempt' option is specified, insert a MI_SEMAPHORE_WAIT
> > command in the spinner batch buffer. This provides the switch
> > point for preemption to happen in multi queue mode.
> > 
> > Additionally, allow the user to control the preempt wait condition.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5783
> > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  include/intel_gpu_commands.h |  1 +
> >  lib/xe/xe_spin.c             | 42 +++++++++++++++++++++++++++++++++++-
> >  lib/xe/xe_spin.h             |  3 +++
> >  3 files changed, 45 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> > index cd281ba89d..5158bb0ea0 100644
> > --- a/include/intel_gpu_commands.h
> > +++ b/include/intel_gpu_commands.h
> > @@ -123,6 +123,7 @@
> >  #define MI_SEMAPHORE_WAIT	MI_INSTR(0x1c, 2) /* GEN8+ */
> >  #define MI_SEMAPHORE_WAIT_TOKEN	MI_INSTR(0x1c, 3) /* GEN12+ */
> >  #define   MI_SEMAPHORE_POLL		(1 << 15)
> > +#define   MI_SEMAPHORE_QUEUE_SWITCH_MODE	(1 << 11)
> >  #define   MI_SEMAPHORE_SAD_GT_SDD	(0 << 12)
> >  #define   MI_SEMAPHORE_SAD_GTE_SDD	(1 << 12)
> >  #define   MI_SEMAPHORE_SAD_LT_SDD	(2 << 12)
> > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> > index 25f7555e27..d62952b539 100644
> > --- a/lib/xe/xe_spin.c
> > +++ b/lib/xe/xe_spin.c
> > @@ -30,7 +30,6 @@
> >  
> >  enum { START_TS, NOW_TS };
> >  
> > -
> >  uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
> >  {
> >  	uint32_t ticks = xe_nsec_to_ticks(fd, gt_id, nsec);
> > @@ -57,6 +56,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
> >  
> >  	spin->start = 0;
> >  	spin->end = 0xffffffff;
> > +	spin->wait_cond = 0;
> >  	spin->ticks_delta = 0;
> >  
> >  	if (opts->ctx_ticks) {
> > @@ -167,6 +167,24 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
> >  				   opts->mem_copy->dst->mocs_index;
> >  	}
> >  
> > +	/*
> > +	 * Insert a MI_SEMAPHORE_WAIT_CMD instruction with condition controlled
> > +	 * by the user. It also acts as a queue switch point in multi queue mode.
> > +	 */
> > +	if (opts->preempt) {
> > +		uint64_t wait_addr = opts->addr + offsetof(struct xe_spin, wait_cond);
> > +
> > +		spin->batch[b++] = MI_SEMAPHORE_WAIT_CMD |
> > +				MI_SEMAPHORE_POLL |
> > +				MI_SEMAPHORE_QUEUE_SWITCH_MODE |
> 
> This bit is not documented for previous platforms so is it safe to
> set it?
> 

Yes, I'm looking at bspec 45749 and not seeing bit 11
(MI_SEMAPHORE_QUEUE_SWITCH_MODE) defined. Also I though SEMAPHOREs were
always preemptable too. Got a bspec link to exactly what this new bits
does?

> BTW similar effect was adding MI_ARB_CHECK (in term test is also
> passing here).
> 

Yes, arb checks are also preempt points too.

Also in general I'm just confused by how xe_spin_preempt_wait / nowait
functions would be used in IGTs. Can you explain?

Matt

> If my nit is not applying here, code lgtm:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew
> 
> > +				MI_SEMAPHORE_SAD_EQ_SDD |
> > +				3;
> > +		spin->batch[b++] = 0;
> > +		spin->batch[b++] = wait_addr;
> > +		spin->batch[b++] = wait_addr >> 32;
> > +		spin->batch[b++] = 0;
> > +	}
> > +
> >  	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
> >  	spin->batch[b++] = 0;
> >  	spin->batch[b++] = end_addr;
> > @@ -207,6 +225,28 @@ void xe_spin_end(struct xe_spin *spin)
> >  	WRITE_ONCE(spin->end, 0);
> >  }
> >  
> > +/**
> > + * xe_spin_preempt_wait:
> > + * @spin: pointer to spinner mapped bo
> > + *
> > + * Make the spinner wait on the preemption semaphore.
> > + */
> > +void xe_spin_preempt_wait(struct xe_spin *spin)
> > +{
> > +	spin->wait_cond = 1;
> > +}
> > +
> > +/**
> > + * xe_spin_preempt_nowait:
> > + * @spin: pointer to spinner mapped bo
> > + *
> > + * Make the spinner do not wait on the preemption semaphore.
> > + */
> > +void xe_spin_preempt_nowait(struct xe_spin *spin)
> > +{
> > +	spin->wait_cond = 0;
> > +}
> > +
> >  /**
> >   * xe_spin_create:
> >   * @opt: controlling options such as allocator handle, exec_queue, vm etc
> > diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> > index c2199d0aa2..eaf2a409e0 100644
> > --- a/lib/xe/xe_spin.h
> > +++ b/lib/xe/xe_spin.h
> > @@ -64,6 +64,7 @@ struct xe_spin {
> >  	uint64_t pad;
> >  	uint32_t start;
> >  	uint32_t end;
> > +	uint32_t wait_cond;
> >  	uint32_t ticks_delta;
> >  	uint64_t exec_sync;
> >  	uint32_t timestamp;
> > @@ -76,6 +77,8 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
> >  bool xe_spin_started(struct xe_spin *spin);
> >  void xe_spin_wait_started(struct xe_spin *spin);
> >  void xe_spin_end(struct xe_spin *spin);
> > +void xe_spin_preempt_wait(struct xe_spin *spin);
> > +void xe_spin_preempt_nowait(struct xe_spin *spin);
> >  
> >  /*
> >   * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
> > -- 
> > 2.43.0
> > 
