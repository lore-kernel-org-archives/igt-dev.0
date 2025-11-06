Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5892BCCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 22:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B601110E9E7;
	Thu,  6 Nov 2025 22:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfOUH7o+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7A110E9E7
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 22:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762469363; x=1794005363;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rKuczH6DXI211HzQHQVtg55vOHZYy8HcEcD3e1HWilw=;
 b=dfOUH7o+ubwbAe2hPnc6lsS9EbWL+nPCt2y2w8jiuBiIb6pkgIRTQm1G
 qCJvji+zT87Qr4n7qY1KHEY4g/MNs/2VQyt4OYIsPlKTv8QZZizm6mspd
 smd12w0gKsHvXOhmI9sQbprwQSYEAvQXjmSF0REFaSDSj766tEnhu5LCY
 JOnf4HdpWsn6zDZq+NhlNG5lj+DmLQ344komwOEKyaFfXLHhmr6bUM2nW
 DCvgADDlOZvqvit2A3fXqT9WRBO3K1XgC/2fMhd6ARoec6DOHdw9PQ/so
 /13pISi8IQBuSIH31sgJFbrxVAZDyRAlgynjyIcU5f29SjQ5gbVoQpu7v g==;
X-CSE-ConnectionGUID: FviVJsn1TVSwibqC0zUmxg==
X-CSE-MsgGUID: 4JqfHVLlR6GqSA2nB9ORoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="87249908"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="87249908"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:49:23 -0800
X-CSE-ConnectionGUID: YV+3reqBT3amDTtFevRwHQ==
X-CSE-MsgGUID: fdu/t5HCQtOGxxsXq4B9ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="211333546"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:49:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:49:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 14:49:22 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:49:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGJQV7JHcPSyV79/5Is81HQPKLFDsN3pSlw6gPFzy9KrADTqVq1gXReTpM4CSdyXHluEi7Mm3aoqsaiRnEt6xbK6s+on9vRiopjPLhuGKKE99ls0JXYc+5JYTVbujw55Ejn/hNAYymvSlLgmu9I7HizbG7GUiXxJr1+VVvkXmgxpvRbiQl+e9D/Y5cUbdARqtZ4qe5R55hgqShgP4tw/SnuFu5fEEtYMIPsp5rcWQkodBl2hRnAteeXb6GaPNibOxLuyC65fQkoZmIimHBpv8odHrX5URlXEhQqPaqm/7xTnDQCc39G0EfgiaVhaz0BXZscf814NSSBUR4ghJEPk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKuczH6DXI211HzQHQVtg55vOHZYy8HcEcD3e1HWilw=;
 b=RVc/80IrYV0wKSgaycHwb+bgdpncVvnpNUVj52IoZ90+87XvgSSbttYYrhjQGfyk2kI9WhfNduFruwRVAJKqjAd8ATUM0UI1A5tV2P3nbGeRnpXQEpEyXn5Dsn0VoO1jv+v5aAqyaRgfI66PgSWQEOCtbU46bRBG0XaVb6G/8K3/VYJhD9fkyG8IvwSIsAtag1v1gRt7r68ibNhwGxjS0db1pEun5VUQtn40p2wVMnwvzN+BOk3BvMDsgeeWS1J8I5IfBn4v18UpY0eTI763WgR/atqqzZwhaePs6Bk9NVdrAd5gJc8OGoa7NqqkIb0oNKpEp5Nq3oYSXb8gvGKpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by LV3PR11MB8693.namprd11.prod.outlook.com (2603:10b6:408:215::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 22:49:20 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 22:49:19 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
Thread-Topic: [PATCH] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
Thread-Index: AQHcT2qDxYM03RnHx06xurPFJcMu77TmPHgAgAABEAA=
Date: Thu, 6 Nov 2025 22:49:18 +0000
Message-ID: <BL1PR11MB54459B3FFDAB26A4BE217932E5C2A@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20251106221248.260255-2-jonathan.cavitt@intel.com>
 <45313f47-c6dc-4fba-87e2-ec7a7e71f7b1@intel.com>
In-Reply-To: <45313f47-c6dc-4fba-87e2-ec7a7e71f7b1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|LV3PR11MB8693:EE_
x-ms-office365-filtering-correlation-id: 4ab257cd-eb51-4fb0-50fe-08de1d86b88e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?aFcxcWtMMGlNRS82UnhHUWwxNWl3cVl6YjQ5aDNLMWloZUc5OVRWRHhrSFRy?=
 =?utf-8?B?R1M5NnBtQzVETEJVcW9PaUtGaGg5TGlFZ3ZjYWh6OWp0Ty9tb3NYU2lyRWNu?=
 =?utf-8?B?ajFhUU1IYWE5WXBTQkEvRzFmaU5yc1VQaS9iaHZoeVI2bWx4V1N1VVg1d1k5?=
 =?utf-8?B?SVBLeGVBSmdrR0kyS1ZpTGhubTc1anNwNVJlNW9lSCtwcTc0dVoyTExUcmZS?=
 =?utf-8?B?VWtWdEp5ZzV3ck9xMzVQbVdSbjF2cjBoeWhCK3NwL3FOS0ZUL3IyMDRHUEkz?=
 =?utf-8?B?cDVVRWh0ai9rR1NQNk5lUUs3OVp0cG93cjMwYjBJdUxleWRMZlVuaFh6TS94?=
 =?utf-8?B?cnpKdW9JeXVueDNyMHlIbVUxMlVsanE5RXdJbnlTbHNTc3A5ZnRLaUJ2bDJt?=
 =?utf-8?B?bEZMSUxkd3J5UmFmZU56eGtROE90NDlKYlB3aVFERlZKQldzSlBueFowYk5J?=
 =?utf-8?B?V2oyNGxucmRHbXVRWUhLbCs3S0hiRXdJakpzbEFZYWxhRWU1bDZRMkNFazZI?=
 =?utf-8?B?ZVdyRFl3T3F6WE00bURoejZncERwcFArQzk2L01PQjBtSGFnUFNTaExyRFVh?=
 =?utf-8?B?Q2M3Y0pSSmFNNFBDeTRFZEFxbSt1WFVIZWtOUXlRaTJhM1ZVMHNKbzUyT0gz?=
 =?utf-8?B?MktsYmUrM2FyQTVZSWUwbHJ0RTljaHdIc2xvUnpjVzJhU0dMdW05UE5IQUVv?=
 =?utf-8?B?Y1ZSUDF1YVpVSGJhYlduRVdzd0c2K01WS2VsQU5KVE1kZjU1Qk9qbVdNTFpB?=
 =?utf-8?B?SmJqWHFRT2dBdUR3akRobHBER2Fkd00rSitId0hHdmVQZHFCb0VSOTBUb2Ri?=
 =?utf-8?B?RjB1d0FsUmJTdE0rMGQ2TnFBRWlOek9MT0ovSEtOUkM1aHZYTTZLaHl1L1Nv?=
 =?utf-8?B?Si91Tzc1eVprckcraFdhajkxNEZ5dERFa2VxV0xRUDVYVExYSVF2TFY0QWQv?=
 =?utf-8?B?YmtVeWg5R2I0SGJHdy84UitydjcrdFZQQmhDRWs2VkpGR05CYzl3NFF6N0VF?=
 =?utf-8?B?SHRLQmw1OHcwaHUvWVozT2FaUHplZDEvMTFUQzlSWG1YenBGNVI0d3pWZ0h3?=
 =?utf-8?B?a1hUTkw4Nzk0eDVYUENhNlJ5L3gwYzc3eG1JZTlqaUhzMHdxbUQ5NUlnSTlI?=
 =?utf-8?B?YkhIUzVYRHBKbk5Rd1dkZVRDL0pSckZKVnBmeFBaUk82Qk9NR1BubHJPOVVW?=
 =?utf-8?B?NndTUitScjM2cWw3ODBHeFdCZWFxSUd3UnUzRmN4VUFKcWE4SUt4NXFsUXlJ?=
 =?utf-8?B?MFFteTZVUll4b2tLeitRN2lQQ0w3Ukk4bG9aOTV5WTBnVzIwK3VHbzdvZzBR?=
 =?utf-8?B?MEw5RlpqUDU4Yk9saUFaZnAvcE5QaUh3OHp6d1F3MDQ3VnY1eWhzSk1KOXRR?=
 =?utf-8?B?RHkySWhJK0FaeEVkditNcE9MbFVxN1lBU1dWZllLbGY4VTdWNk1pdW5icGt5?=
 =?utf-8?B?UjMwaWJ2SGVoenFLYnBTeWlzNGZiOEFZamNWZGU4UURRdm00eTM4OElwUm4z?=
 =?utf-8?B?UXpSWGxXUGxtcWN4K0llckY1VVBraG1TR3AxTlRDcHhUSExiZEdLa3FMUnJX?=
 =?utf-8?B?ZGlXWFNvMnZ2V1hIa2NTVWRCdnFyM3R6Vlg4NklmbGJ0N21TR29UNHR6K1NB?=
 =?utf-8?B?Z0JRKzNLMHNYeVZMVEpoQkRKNWd4cjlESyt4bmFOQ2JZN1JkM2NnTUJqT2F2?=
 =?utf-8?B?WWFsVmxIQ2haQ1FhV0s2WU02RnF0cisrUlBWUFltSUdQbjR0ODd6ZUc4Wlps?=
 =?utf-8?B?OGpZcnJFeXEySWxDRDQzRUJIZ3plSFpOU29YRjAzK0gydGU3ZkR3ZFRQVUFC?=
 =?utf-8?B?R2hMM3ltb25UUnRNcC9qd3VDYm9GckhVa1l6MVplcFdKVExrVFdXSlpBa0JR?=
 =?utf-8?B?ZU1JVkdSU3k0blN5Q011NlBhclhNbEFGWmdScTM2RFpIZ0c2MzY1d2I0a0hI?=
 =?utf-8?B?RHJqWDFIVnBPcEQwYVpJbk9ubERCUzJDODdUbmJYR1drYkdCd2MyM3Yzcmk4?=
 =?utf-8?B?WGw3Wk9Gb016cDF5SDRlQ0dWT2VtSVduRzZKYm1ZNG1ab3pubXJxVkc4ZmQ3?=
 =?utf-8?Q?a+POMm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckVMdTdOWGQ1K3ZhK3ppWmU1NEZLdlFwRjVKUm9OWXk4WFVyTXRwcjF4dkt0?=
 =?utf-8?B?N2J2dWJOLzNheVJwVzB5aWNWRnRQbVZRdFY5OE8wN2tJU0tCU3k1d3ByK2Rh?=
 =?utf-8?B?ZUFVRllhcCtHcW1wWld4OVlJVG5pcGV5ZGV2c1hpMjk2dVlDV3ZKQ2M5QXVt?=
 =?utf-8?B?ek9wN0dCVE9NVXAzdlBuV0ZLUGwvd1VFWlh4L3M3Q0R0TXBVbHRQLzdvTUlG?=
 =?utf-8?B?Nk10QitrQ0t1Vms3aEovUTdPOVp4YzBMYmsvWmliVm5uNnlyazdYa21lT1ZK?=
 =?utf-8?B?YmoyemlmQWxiRGI4UzZDRGRtK1AydGNqRmlvVC9ITG8yOVdSTzdoWnNtbVpD?=
 =?utf-8?B?c29MbmdrN1hHbllMdkt4d3RhZCtWV1FBWERWZmJPZVVyRk5oSmRXR2FQMGd3?=
 =?utf-8?B?L2RxMnpWZ2xiUWhKdUgwNWxyL3I3cjFOZUd6NWZuUWQzVlZVMlEvQ0V5NmFB?=
 =?utf-8?B?NWxwdUNBQVQ1RVAvSWFWSERJNlBieWFTMXRvSDQ0TGx1WDZYVG9DODA5SnZ1?=
 =?utf-8?B?T2N3NDAxbzhrUk5NVXdVdWl4ZW5HZjVOaEJlTU9KSnRGSnAvTHdVK3JEODVO?=
 =?utf-8?B?VUNBTXVlejdSVXl1UVBCV1o5aDJiVm5CYkcxNkc1Zkw1Umh5M09yb3pacEhD?=
 =?utf-8?B?bkRzSE1jOUR5bEM5VytwQzJUREVQdGgzRmtuVnJMWlhsVVdRWlgwUkh3VmU2?=
 =?utf-8?B?R0xaT05GbGg3TnA2em05RnBxcWpla0tQeDNVM3E1eWhEMERxNFF3RVd4c3BD?=
 =?utf-8?B?a3JtVUhXRHhzQmdzUHVDUGJXWU1MTmdGT2pwdjVWNTk5dlZMbFV1WktTMVh5?=
 =?utf-8?B?d3FxU1RYQmM1dWZ5TjlHQzZHS0hLa0Y2cnhMQ0xWL2dybndFVDZic0I0L3l2?=
 =?utf-8?B?QnE0d0pQZXQ4d1lsak9reVFqR093amZZV2pNVVpraTdnRFA4ZmdTOHVlSzIy?=
 =?utf-8?B?RytTZzZUQjNWNlFrUWlEVUtybHlydTVvd0JKL0MzR2ZuQmVPNjQ0MDR2Qitt?=
 =?utf-8?B?QTBLd0hHUFMwKzVJRkZpS2hZZ2JqTGdLYWNZT2llMkExRU4vK3FaNnlXUE8y?=
 =?utf-8?B?VEphazR3U2J1WUhndkplZjFQQ21vOHc4QStxZC9IdEhRWGhWUGJiSWNXK2pk?=
 =?utf-8?B?NDcwZndkYVlmRDRwUGNNQjBZa1JVVmxuOXIzVzd6aFVxc3YrdHVmdDVnS09D?=
 =?utf-8?B?cEkvQTEybWpyVVE2SkhxeU81M2NDZ01aTlRCa1Q0T0NOMTBwUWhqdjVDVEp5?=
 =?utf-8?B?eURXTmhiRGRPL1Y3OWUyb1VmVU44QTF0YWhSYjQ5REhPYlpNQUEzWVl0YWhH?=
 =?utf-8?B?bVpmempVQWJSV0Zha0o0Y0FKMkxMTGVMVnErbUFDTjZ0U0I4YVo3eG1NcFJJ?=
 =?utf-8?B?Z3Z4TkRFaTgrQnFtdWF5M2haVEJsMm10UHVZVjVFRW5PNTNMYnBiYlBUNDhL?=
 =?utf-8?B?MGtwNmVYTEd1V2JMRmg0Uk1QaDhkS3crMExjUUVwZWgvbVJSS3FVVzhpR0JS?=
 =?utf-8?B?eUZCSHp6N3BKK2Qza1kzUXl5UU4wdWdxaERybDBEVTlveHVXOGJpUGJzdTdw?=
 =?utf-8?B?MWVyd1JVS3BmOWttMDdXaVhVcHNKYk9vTmI0NFhyUUxUSTVScGFrR3ViYm9n?=
 =?utf-8?B?QUpkRDN3Ykd1UEFVeFlRVHYyeFNNL1J0T2ZSbm1GYTl3dHVBNTNBbGVJZjhE?=
 =?utf-8?B?OGRnVG5EZ0xoUVoweGtmZzJ1L0pWcnlFQTNUOTZxbGJGU2hsZGdHRFV0Wmk3?=
 =?utf-8?B?YWJhb1U5b0NqaTNQRVVvYU1xMVlzS2Z4RTNmRHVtRXlnZGJ5L3BKbmVCR2lk?=
 =?utf-8?B?cEZlSk5ZdHZqZjgzOWRGN21XUWk4WFRKcldhREVDODl3NDVoY2R5UkVUbGx2?=
 =?utf-8?B?cnNTRHptMUI1cUY2WUJBRC9VaU5VcGlyZ0RiZ0F5RWtMMVNrOVI2R0NYQUlv?=
 =?utf-8?B?cURtV1hXcWcyMmtSVytTV2RYYU1HT2U4YnliNXhyakNYc3FLcU4xRjN2MUdh?=
 =?utf-8?B?c0YyeENhWFl5bGZZclNudFNHemZBZzk4enF5YUlkbUVPeXlDVGdrbUhjVE9R?=
 =?utf-8?B?NzhZZ0ZvU1FxaUZXam51MTVNRVBSNDQxK3pETFRrSEZoNDJVUVo0b2RidjR5?=
 =?utf-8?Q?l0aRcZzzZgE7qjsHibDYQv3Ub?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab257cd-eb51-4fb0-50fe-08de1d86b88e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 22:49:19.0617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tVNR861umD3vIVa7N1dNoCH0kwLglfIGd1QIGXqoFG+ytcWK6TdprkCjiTO2ZJaU4pJVSD2SLyKNNwQRf+pNzWzDlFgG9r3Z/xVn2zIOEUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8693
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgNiwgMjAy
NSAyOjM1IFBNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNv
bT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEsIHNhdXJhYmhnIDxz
YXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT4N
ClN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRlc3RzL2ludGVsL3hlX3BtdTogVGllIHByZWVtcHQgdGlt
ZW91dCB0byBleGVjIHF1YW50dW0NCj4gDQo+IE9uIDExLzYvMjAyNSAxMToxMiBQTSwgSm9uYXRo
YW4gQ2F2aXR0IHdyb3RlOg0KPiA+IFdoZW4gdXBkYXRpbmcgdGhlIGV4ZWMgcXVhbnR1bSBpbiBl
bmFibGVfYW5kX3Byb3Zpc2lvbl92ZnMsIHVwZGF0ZSB0aGUNCj4gPiBwcmVlbXB0IHRpbWVvdXQg
dmFsdWUgdG8gYmUgZG91YmxlIHRoZSBleGVjIHF1YW50dW0gdmFsdWUuICBBbHNvLCByZXNldA0K
PiA+IHRoZSBwcmVlbXB0IHRpbWVvdXQgdmFsdWUgb24gdGVzdCBlbmQgaW4gdW5wcm92aXNpb25f
YW5kX2Rpc2FibGVfdmZzLg0KPiA+IFRoZSB2YWx1ZSBmb3IgdGhlIHByZWVtcHQgdGltZW91dCBo
ZXJlIHdhcyBjaG9zZW4gYmVjYXVzZSBpdCdzIHdoYXQNCj4gPiB3ZSd2ZSB1c2VkIGhpc3Rvcmlj
YWxseSBmb3IgY2FzZXMgbGlrZSB0aGlzLg0KPiANCj4gd2hpbGUgUFQgPSAyeCBFUSB3YXMgYSBj
b21tb24gc2V0dGluZyBmb3IgVkZzIGV4cGVjdGVkIHRvIHJ1biByZWd1bGFyIFdMcywNCj4gSSdt
IG5vdCBzdXJlIHRoYXQgdGhpcyB3b3VsZCBiZSBhIGNvcnJlY3QgdmFsdWUgZm9yIHRoaXMgcGFy
dGljdWxhciB0ZXN0LA0KPiB3aGljaCB2ZXJpZmllcyByZXBvcnRpbmcgb2YgdGhlIGVuZ2luZSBh
Y3Rpdml0eSAtIG1heWJlIFBUIHNoYWxsIGJlIHZlcnkNCj4gc21hbGwgb3IgZXF1YWwgUFQgKGRl
cGVuZGluZyBvbiBhY3R1YWwgV0wncyB0eXBlIHN1Ym1pdHRlZCBieSB0aGUgdGVzdCkNCj4gDQo+
ID4gDQo+ID4gU3VnZ2VzdGVkLWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtv
QGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFu
LmNhdml0dEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX3BtdS5jIHwg
MTQgKysrKysrKysrKystLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3Bt
dS5jIGIvdGVzdHMvaW50ZWwveGVfcG11LmMNCj4gPiBpbmRleCA5NTI1NjU1YmEyLi5lN2MyZDgy
ZGE0IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3BtdS5jDQo+ID4gKysrIGIvdGVz
dHMvaW50ZWwveGVfcG11LmMNCj4gPiBAQCAtOTg3LDEyICs5ODcsMTggQEAgc3RhdGljIHVuc2ln
bmVkIGludCBlbmFibGVfYW5kX3Byb3Zpc2lvbl92ZnMoaW50IGZkKQ0KPiA+ICAJbnVtX3ZmcyA9
IGlndF9zcmlvdl9nZXRfZW5hYmxlZF92ZnMoZmQpOw0KPiA+ICAJaWd0X3JlcXVpcmUobnVtX3Zm
cyA9PSAyKTsNCj4gPiAgDQo+ID4gLQkvKiBTZXQgMzJtcyBmb3IgVkYgZXhlY3V0aW9uIHF1YW50
dW0gYW5kIDY0bXMgZm9yIFBGIGV4ZWN1dGlvbiBxdWFudHVtICovDQo+ID4gKwkvKg0KPiA+ICsJ
ICogU2V0IDMybXMgZm9yIFZGIGV4ZWN1dGlvbiBxdWFudHVtIGFuZCA2NG1zIGZvciBQRiBleGVj
dXRpb24gcXVhbnR1bS4NCj4gPiArCSAqIFNldCB0aGUgcHJlZW1wdCB0aW1lb3V0IGZvciB0aGUg
VkYgYW5kIFBGIHRvIGJlIGRvdWJsZSB0aGVpciBleGVjdXRpb24gcXVhbnR1bS4NCj4gPiArCSAq
Lw0KPiA+ICAJeGVfZm9yX2VhY2hfZ3QoZmQsIGd0KSB7DQo+ID4gIAkJeGVfc3Jpb3Zfc2V0X3Nj
aGVkX2lmX2lkbGUoZmQsIGd0LCAwKTsNCj4gPiAtCQlmb3IgKGludCBmbiA9IDA7IGZuIDw9IG51
bV92ZnM7IGZuKyspDQo+ID4gKwkJZm9yIChpbnQgZm4gPSAwOyBmbiA8PSBudW1fdmZzOyBmbisr
KSB7DQo+ID4gIAkJCXhlX3NyaW92X3NldF9leGVjX3F1YW50dW1fbXMoZmQsIGZuLCBndCwgZm4g
PyB2Zl9leGVjX3F1YW50dW0gOg0KPiA+ICAJCQkJCQkgICAgIHBmX2V4ZWNfcXVhbnR1bSk7DQo+
ID4gKwkJCXhlX3NyaW92X3NldF9wcmVlbXB0X3RpbWVvdXRfdXMoZmQsIGZuLCBndCwgMjAwMCAq
DQo+ID4gKwkJCQkJCQkoZm4gPyB2Zl9leGVjX3F1YW50dW0gOiBwZl9leGVjX3F1YW50dW0pKTsN
Cj4gDQo+IG1heWJlIGJldHRlciB0byBoYXZlIHNvbWUgdGVtcCB2YXJzL2NvbnN0IHdpdGggdGhl
c2UgcGYvdmYgcHJlZW1wdF90aW1lb3V0IHZhbHVlcw0KPiBsaWtlIGl0IGlzIGRvbmUgZm9yIHZm
L3BmIGV4ZWNfcXVhbnR1bQ0KPiBzbyB3ZSB3aWxsIGhhdmUgdGhlbSBkZWZpbmVkIHRvZ2V0aGVy
DQoNCkdpdmVuIHRoYXQgdGhlIHByZWVtcHQgdGltZW91dCB2YWx1ZSBpcyBnb2luZyB0byBiZSBh
IGZpeGVkIG11bHRpcGxlIG9mIHRoZSBleGVjIHF1YW50dW0NCihleGFjdCBtdWx0aXBsaWVyIHVu
ZGVjaWRlZCwgcHJvYmFibHkganVzdCAxIGdpdmVuIHlvdXIgcHJpb3IgY29tbWVudCksIGl0IHBy
b2JhYmx5DQpkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSB0byBkZWZpbmUgdGhlIHNhbWUgdmFsdWVz
IGluIHR3byBkaWZmZXJlbnQgbG9jYXRpb25zLg0KDQpXaGF0IEkgY2FuIGRvLCBob3dldmVyLCBp
cyBkZWZpbmUgYSB0ZW1wb3JhcnkgdmFyaWFibGUgdG8gc3RvcmUgdGhlIHRhcmdldCBleGVjIHF1
YW50dW0NCmZvciB0aGUgZ2l2ZW4gZm4gbnVtYmVyIGFuZCBqdXN0IG9wZXJhdGUgb24gdGhhdC4g
IFNvbWV0aGluZyBsaWtlOg0KDQoiIiINCnhlX2Zvcl9lYWNoX2d0KGZkLCBndCkgew0KICAgICAg
ICAgICAgICAgIHhlX3NyaW92X3NldF9zY2hlZF9pZl9pZGxlKGZkLCBndCwgMCk7DQogICAgICAg
ICAgICAgICAgZm9yIChpbnQgZm4gPSAwOyBmbiA8PSBudW1fdmZzOyBmbisrKSB7DQogICAgICAg
ICAgICAgICAgICAgICAgICB0YXJnZXRfZHVyX21zID0gVkZfRVhFQ19RVUFOVFVNOyAvLyBWRl9F
WEVDX1FVQU5UVU0gPSAzMg0KICAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0X2R1cl9tcyAq
PSBmbiA/IDEgOiBQRl9NVUxUSVBMSUVSOyAvLyBQRl9NVUxUSVBMSUVSID0gMg0KICAgICAgICAg
ICAgICAgICAgICAgICAgeGVfc3Jpb3Zfc2V0X2V4ZWNfcXVhbnR1bV9tcyhmZCwgZm4sIGd0LCB0
YXJnZXRfZHVyX21zKTsNCiAgICAgICAgICAgICAgICAgICAgICAgIHhlX3NyaW92X3NldF9wcmVl
bXB0X3RpbWVvdXRfdXMoZmQsIGZuLCBndCwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgUEZfVE9fRVFfUkFUSU8gKiB0YXJnZXRfZHVyX21z
KTsgLy8gUEZfVE9fRVFfUkFUSU8gPSAxMDAwDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICB9
DQoiIiINCg0KV291bGQgdGhhdCBiZSBhbWVuYWJsZT8NCg0KLUpvbmF0aGFuIENhdml0dA0KDQo+
IA0KPiA+ICsJCX0NCj4gPiAgCX0NCj4gPiAgDQo+ID4gIAkvKiBwcm9iZSBWRnMgKi8NCj4gPiBA
QCAtMTAxMSw4ICsxMDE3LDEwIEBAIHN0YXRpYyB2b2lkIHVucHJvdmlzaW9uX2FuZF9kaXNhYmxl
X3ZmcyhpbnQgZmQpDQo+ID4gIA0KPiA+ICAJeGVfZm9yX2VhY2hfZ3QoZmQsIGd0KSB7DQo+ID4g
IAkJeGVfc3Jpb3Zfc2V0X3NjaGVkX2lmX2lkbGUoZmQsIGd0LCAwKTsNCj4gPiAtCQlmb3IgKGlu
dCBmbiA9IDA7IGZuIDw9IG51bV92ZnM7IGZuKyspDQo+ID4gKwkJZm9yIChpbnQgZm4gPSAwOyBm
biA8PSBudW1fdmZzOyBmbisrKSB7DQo+ID4gIAkJCXhlX3NyaW92X3NldF9leGVjX3F1YW50dW1f
bXMoZmQsIGZuLCBndCwgMCk7DQo+ID4gKwkJCXhlX3NyaW92X3NldF9wcmVlbXB0X3RpbWVvdXRf
dXMoZmQsIGZuLCBndCwgMCk7DQo+ID4gKwkJfQ0KPiA+ICAJfQ0KPiA+ICANCj4gPiAgCXhlX3Ny
aW92X2Rpc2FibGVfdmZzX3Jlc3RvcmVfYXV0b19wcm92aXNpb25pbmcoZmQpOw0KPiANCj4gDQo=
