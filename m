Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D14CCD185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 07:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F04010E262;
	Wed, 15 Oct 2025 07:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kq6tqonD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C6E10E262
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 07:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760513455; x=1792049455;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rL5pQGK30gy9InJD/Otr5NoecEVW4vlwRkzGRJluqbc=;
 b=Kq6tqonDkVh4L4Q2WYIf9M8RZST2L0jsD1d8CbqS2X4DAG6khunQCscc
 7FOmUXGIE1EH67+l15qhP7/VvmVJc4SEvVk4hODxBHWl9SLQA9n4HVF9x
 v3eymgkEzqs5RmDHbgkoPIarc8XKCJnA/qbuq5/Q+NHFjfH5py056Svs3
 Y+TP9J3drdwcDowgqUk56FF06TExLj9HuB20eM3owwYED05i5ZTVf5nLI
 D9J8q7PO3jaq0ofk1oag5P25mBJdVOyVhxRii9sMkQZIdmw2o0iwC/qbA
 FIJL1+Hu1kehQv2cQ3PbnDYhxPJu471rfwfLVKFAg+Lvz4KxenBPWXZM7 g==;
X-CSE-ConnectionGUID: WbeFhVg2RfS3GI0Ug1sJZg==
X-CSE-MsgGUID: oW3CVYA6RZ+uPcFXCcAgvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80313633"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="80313633"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:30:52 -0700
X-CSE-ConnectionGUID: RWugbhyzQJeWWKELe5yG7w==
X-CSE-MsgGUID: E08I2ctPQym/REiWGRPUsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="187395891"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:30:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:30:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 00:30:49 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 00:30:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALrIjxpFcqqX8EDR3waTzBKMED3PTHh3fN6IRZ6jpFZ/p5GYVyR5qydYcB25lHKupnFoKVJs7BcFfeQaXttozZmaBG4Xe6kzP5yLzbyLhqoApKWBN7GPr/dlCSsohW41SRKVH2wTxjGEDiSoDqKMQNmI9K+Sk242L3edYzXZkNuUv1IFjfwxpF7GJneRkTFt5GyyuQlEoTx6r4yh3Hbi0cUkj/WIXmfCZ9Q0K+hGA/iesTtmW/EB+6p71hZIMJwdvkR5GMzrRsihglmZAiT5sKkMn3O9egSQHbwOMSAzDVNA1WhHew491sfcAMf8uwaBxMhx+eB4DqiymeWJx1GPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHw3AJEgbdNTTv1C6cMb7tv/QE+DzTukntltk2uMPB0=;
 b=su9ZKZI+/MXeCgf+eAggkrugkE2s/9v1aRHAijVD+Xhpkh3fo/py3/M+L8HMly9iRnA9xidvrevlOxpXKSIvtQQopWUAlZ6ynR9swf+zJEPzDndfKtxV57zgyaH3sNUtW2C/oSnjTfzcjWmEJB29D52DTNEQkdbJdMdF9MrZPfLCBMnpV8Uug8TGhGNzpPeudsa66Qu+zPaLHk6JdV6cb9QuplRS4GOVhtrYnIjYEv0RiPx2dYmv5wkY4dXox3DWo67nWkJw82+jOHQuNdqF9Omy0NKVq55u/jnu/MlnV/9FM+i9piR4TPocN3tVVq7RnsLpHGELzBXDsVp0Rl5aBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by BL4PR11MB8823.namprd11.prod.outlook.com (2603:10b6:208:5a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 07:30:46 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 07:30:46 +0000
Message-ID: <b3c1688b-e3c7-42cd-bed6-c0b4fb23c5be@intel.com>
Date: Wed, 15 Oct 2025 13:00:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/kms_vrr: Dynamically verify LOBF
 across vrefresh steps
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20251015062922.447336-1-ramanaidu.naladala@intel.com>
 <20251015062922.447336-2-ramanaidu.naladala@intel.com>
 <DM4PR11MB6312764C6B5D00900F07F47590E8A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <DM4PR11MB6312764C6B5D00900F07F47590E8A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::13) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|BL4PR11MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 3747738f-75b4-4533-26d5-08de0bbcc12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTNuY0dGSXFZN1VzNnAvUXVtbkpKU3g0VkJNNHdEZUpmbmoxVllqZU00Y1Q4?=
 =?utf-8?B?anlaN0hOQlVTcldvQTNKUnpwbVFIcjNpMnRXaDhTL0hYd2R4VnZGeFhRNHZq?=
 =?utf-8?B?aDZSSDBRY0FNNU5RTlNFMXRXeVhQaTV3RlZoc0k5dmIreGFWckQ0OEpCclRy?=
 =?utf-8?B?MlFqVlBpcThOaURoY0hzWkJsQjd6RFhmN0w4a3FUUlZ2MDRBR25BWTY2anBl?=
 =?utf-8?B?dmVYQ2tWVy9xUnZGT2x0eEJWUEtMZEZMdzc5VzVXbEVFaGNhdmVwQzlvZkRY?=
 =?utf-8?B?SWhpQTgxUFdSNEpLRGZ3QTYrYXhQRnh6Uk5TSGk2dFhkcXZ0VWhqdE96NE1Z?=
 =?utf-8?B?RCtKL1VMRnMyVEVvMkdQVHRvbTNtc0FUb2ZvYTUxS1NQSy9hSjdBTzdUQ2FO?=
 =?utf-8?B?ZVNsVHRjb3F6SkVUTXVRWk5LMVlrb2YreExhSXc4YjVGUGxvV2ljNzFyTEdL?=
 =?utf-8?B?VjAyRjJnTjc0L1hKYUI4bEhOb2x0bW5VMjU2OXExdjFySm1kalhCd2JqMHJC?=
 =?utf-8?B?LzVOSmJBSUxxTVdLME0wL1h1cVVzdVJvbXh6YVF2aDlLWmswbHlkeEdNZmRu?=
 =?utf-8?B?WFJ2ZnF6OGlaSHJPbFBkQjFkNHlYRmE2dE5CR09Yc3M1czMyWE52N2ZycVFa?=
 =?utf-8?B?NjhqYlM4M1NmVDZxVUU4VkplQXlROXJZYmJlTldBSlNWeVZENG9BMnR5Wjh1?=
 =?utf-8?B?Q3FUU0xNS1U0Y3lyMGQ0eEREQmVnTUJpOWxQQkp3SDg4a0N6S1dTZCtyTGpq?=
 =?utf-8?B?ajIxTkk2Y2lMa1h3Mm13WFdON3dwYW4yWGt6QVUwcDAzOWMya2V2RXlzQ1JU?=
 =?utf-8?B?NUZacVM4d1VFTXovU0J0YkRaWGQycWV5Wm5TTzJHcFpPTU40UG1QK1RSNEUz?=
 =?utf-8?B?bElqdG4wSjF4aVdCZTF0YnhrSk9mT2ZodlVXbkhJRmZ1clhFSnN1bFcvcE55?=
 =?utf-8?B?RlBhMTFKU1JqaUk0RzhqQzFISlBCWHc4UGhpTDg2Yy8wcUF4cjIxZkRCZ0lM?=
 =?utf-8?B?VXFJTjBYQVhjM244SHN4aHZDc0hiSjhRdXhPSEZBeVk0MnlEekM4djA5bndz?=
 =?utf-8?B?ci9rZzlvK0cvZ1NZbDV5Q1ArOTY3WUlSY3FUWUxDcFJCRkNRN2hIdWp3YUNE?=
 =?utf-8?B?MXZMQzBaL0ZXSXkrd1BHbUZlZGFPc1R3QmFVdDZtejcrT1BjK2Q1SHh2R0d0?=
 =?utf-8?B?UnQ3T2svVWtPMEkrTHo4MmNEVFp3Z2h0V01naFFJUkpqbE1rRTBzRWR0eFBl?=
 =?utf-8?B?VmQ5UGRNcklVUy9tWVdjOGVEenoxNmhxd3pPVW9lVFFMTHFxaVExNHdMYitY?=
 =?utf-8?B?VVVSSDg2a2EvMFRSaGZDS1pqajFQaEY3cS94UDVVYnlGSy96NEx2M21rbURv?=
 =?utf-8?B?OFZncnQvOHhsS1FtNzkwaXVZNTZ1SkxlYmFyK1NXRGZ4YjRHc3ZqSUgraUZU?=
 =?utf-8?B?UElkZk5OK3hHNCtINVlsVUNKQzJybkNVNVVrMk1OdVhxV1RpZXphL05pelJT?=
 =?utf-8?B?dERXVklBdHV3MnBVY25paGFST3JQc0dzMlRXcEttL3pUQ3FqUVd2QUdtME80?=
 =?utf-8?B?NlMzYnpSTENQei80ZDlwamY1QUt3M0JhZ2Vpd0l6TStWMnFFckhNOFN0dm9R?=
 =?utf-8?B?VXdCK09hY2cwNzIxS0dkcURUeGdqZzBqcWRSU1FFdWRPRmlFTXhlVm42Qnht?=
 =?utf-8?B?bksxclVlMHBRdG52WWdWVTMyVXZneDVTbGJMMXFzOVJGdUF2Qk1qMlhucE1m?=
 =?utf-8?B?TTBDd3JkcEFOWk4yMTJFMDdLc1Y1VUdFOVNVV1pmYkg2MlhHbDV1VituT21L?=
 =?utf-8?B?WTFCL0xhRVhlQ3VvYkdnVEQ5b0sxN3pIMjJLVXcrQ0RFRXhZbWJyemVlZ0JF?=
 =?utf-8?B?STEvLzRjR3ZCay9OWHJoS2FTNjRHcVo3QWRBcTFGR1V0YkpNbTRZc0JJL3k0?=
 =?utf-8?Q?KsKHbfwOU2ThTczvL9Lcx7aFhlwjbxdd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THIvVmx4Sk5RMlRJVjZEMTNLM0NZV21sZjd6NVplaFR1R1ZNNjBhSm82cGhi?=
 =?utf-8?B?VXlzdFJ0MTdrcXNET0xNdDRKVkJBVEdRUkxVUEg5eXU5ejJ4UHhIK3NwRUZh?=
 =?utf-8?B?Vlc0U0NJbzM3K2d0VzNJS0VpRVczcnMvYkk3S1RUZUJNVVBLWHBXR3d4d2ZB?=
 =?utf-8?B?RHo4QllabmY3cjNmN2x6NmJNdE9KajA1RWNLNGdNOVhjb3poOTFqSUthSjl0?=
 =?utf-8?B?bk9HTGZCd3h1eWZQUDlHL2JVU2txTnNJWXh5aTFibnJqNzV2aXRGc3VnazhE?=
 =?utf-8?B?clVvZjhWc1FKWHVJUXc2ckVQWUtsMk1XcC82TmJtaDQzM0tEdi9FZ2RUQnU0?=
 =?utf-8?B?ejhldi8xaXpsOWhHb0cvZEdDcGdKNnZBTkVscU5JU0hnTFFNVURXaVlMdGFN?=
 =?utf-8?B?elM5cVV1NkZaUGQzenAzSUNsZnFGQnphd2V6UHI2M0NQZHNyd09jNVp0RDV3?=
 =?utf-8?B?cjN6Q2QzemZuUSt3cmtnU3M4UlRqTGVkSllCcFVqMDVTN2l4c2hrdkRNWW0y?=
 =?utf-8?B?bHloajFOREhwOTVFZWdQUFFPNmdsN0ZoYnlWZVluSEY5cEd6dlVvVytMQVV1?=
 =?utf-8?B?Vm9hVEduOUFGaU81b2RQcFpzWUlYd3ZWdmZhY0pqNkJpYzNmZkZaV2gzRGdt?=
 =?utf-8?B?MzlQaE5VcjIzRnU0WXhxc3lmTEFHYUdzMHBGYzgzcXIvSituUTdjWmRMVGw5?=
 =?utf-8?B?Y05OVFFidHREMk8zN05rODVnZUxwK041QVc2eEF3NzFsWm9QVXhITEt3azNx?=
 =?utf-8?B?Nko5QUladW9YMTh6c0NBYWN0dUg2R09RSDVya1h2eWZCTjJPREJYMm5VNml3?=
 =?utf-8?B?NEJMQm5KNWFweDVRdDFtTDNHYjhzVlFFTlREZ1ZvTWRCQ2RoQjUwM3UwODlw?=
 =?utf-8?B?UEVNdnByRXZYam14azhsTzdadHBTcHlYaGxIUTJ0TnFKT2luYy82Y2dndGVX?=
 =?utf-8?B?bmJScjhvTStVWUREUExnSUlnREdWNTU0VmxnYnBWNGVpYkFMeVRDSHpMS3VZ?=
 =?utf-8?B?alo5Qk9YSjMydnVvWHViZUZyaWFVVjR2cDhoQlphSDJqV0RRaVl4NWMvVXpN?=
 =?utf-8?B?WWhpZWF5M1ZaekxPS1pVbWVVNk1XZWIvRy9nUlhhbXF0VG5tNFdkY3ZnbmFX?=
 =?utf-8?B?a2R6bDJoLzA0R25JNjlDWHJkcTVVUEZYY0loVHZaSjJmcUpIbWNhTDE4ZzJr?=
 =?utf-8?B?ZlRXUkpkQWdOb0p6cW5iVTJaSDBLUXl6VXRwWHhKcTlZb29GUjlPTk5heHlK?=
 =?utf-8?B?TTNXSzA5S1haR1FZWlY0b2VRbjdjK2FsbXNSRXRJZnl5QXdkWEJaeStoYWd1?=
 =?utf-8?B?R1Y3VGdFMlIvWno0WHBKRnhFY1F4ZDEwdkJoeU8xNk02SFM1S082NnZiRXgv?=
 =?utf-8?B?QnhaaHVZVUI1anJVdWhldGtZREdLd2t5WHE3QnJBekl0TS9wYkVKVldjUGoy?=
 =?utf-8?B?SFZkZnlCVzZnT3FtbEJIenN0dnRpQTI4ZGViTkZPY1gxcXJEZFpnM0ErTSty?=
 =?utf-8?B?d05Scmp1bDNBaVNFV0Y4K2Q3Tndub3ozRjdlWTBxdHd2WFB1YjlwQTZWR2tr?=
 =?utf-8?B?WFVBdXhwa051RW9XbkJoaEE5ck1WalIzWTNTL3RPK0hReXRmZHZ2MmQ0OUta?=
 =?utf-8?B?Z3hpWU1QUityOHljZWdmN2grc05BWUlsSTFTZzYzNUQ3c2hSbytXRHFTdmdR?=
 =?utf-8?B?aURBeHByS3RFZXJHYk9nWmpiclhWVzdUMGM0cjRnT0xTRWlXUitWMWdQemxx?=
 =?utf-8?B?RlJIbWVHVkpwaDBZUFpyK2hZRWMreDZzM21va0lxaGVYWnFwREdEWXVrdFVi?=
 =?utf-8?B?YzVuLzYxck0zcEptOFFvVmJQd2o1WTRPVWNkM1J3SnQ3Uzh6TU5WU3FURkVM?=
 =?utf-8?B?US92bFA0cmJBK0RaRms3bGU3cTVmbUFaRGVRVVdxK1ZTeE5NUXZDZ3NkNFdD?=
 =?utf-8?B?cnhBUmpyc0Zsc0taLzFPTmFxMXFkYUNMQWtGSDRTTE1BaStjc2xwS3h0RTJK?=
 =?utf-8?B?aGtKTjBhcm1JeUY0OFFrOWlnQW5DM1UxNEZrY3ZpNC9qaTVMRWFuZWpZYmUz?=
 =?utf-8?B?VVBtNmpZY2JiYml6UzhxWDVadDJYb0VsdTAyMjdvQWZubUlBc3lXQ1p0QWlD?=
 =?utf-8?B?N2JSeG1hTzBWKzZtYm9YbXVUWHNCZEVnc1hMckVQekpTMUJsdmoxUGNKa3ZW?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3747738f-75b4-4533-26d5-08de0bbcc12b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 07:30:46.0993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZYHEO6BacuFg9N970w9gzkoyVgRuwOwnN0qeNyyATPMWRGsfGUUH+2DYIYgoobKayjPkM7mpIxiL2uY3GoSZ6TpicH4WbZNjYYqdbkwKBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8823
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

Hi Jeevan,

On 10/15/2025 12:51 PM, B, Jeevan wrote:
>> -----Original Message-----
>> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
>> Sent: Wednesday, October 15, 2025 11:59 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B, Jeevan <jeevan.b@intel.com>; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v3 1/2] tests/kms_vrr: Dynamically verify LOBF across
>> vrefresh steps
>>
>> Replace the static LOBF check with iterative vrefresh stepping to detect LOBF
>> enablement.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_vrr.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 704620a7d..1e4d9cdac
>> 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -870,6 +870,8 @@ static void
>>   test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>> {
>>   	uint64_t rate[] = {0};
>> +	uint32_t step_size, vrefresh;
>> +	bool lobf_enabled = false;
>>
>>   	rate[0] = igt_kms_frame_time_from_vrefresh(data-
>>> switch_modes[HIGH_RR_MODE].vrefresh);
>>   	prepare_test(data, output, pipe);
>> @@ -879,11 +881,21 @@ test_lobf(data_t *data, enum pipe pipe,
>> igt_output_t *output, uint32_t flags)
>>
>>   	igt_output_override_mode(output, &data-
>>> switch_modes[HIGH_RR_MODE]);
>>   	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
>> -	igt_output_override_mode(output, &data-
>>> switch_modes[LOW_RR_MODE]);
>> -	rate[0] = igt_kms_frame_time_from_vrefresh(data-
>>> switch_modes[LOW_RR_MODE].vrefresh);
>> -	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
>> -	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output-
>>> name),
>> -		     "LOBF not enabled\n");
>> +
>> +	step_size = (data->range.max - data->range.min) / 5;
> If max and min diff is less than 5 or equal to 0 this might enter into infinite loop can we handle this scenario?
> We need to still run once for the above case and then fail or skip based on the result.
Good catch. Thanks for highlighting corner case. I will fix in next rev.
>
>> +
>> +	for (vrefresh = data->range.max - step_size;
>> +	     vrefresh >= data->range.min; vrefresh -= step_size) {
>> +		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
>> +		flip_and_measure(data, output, pipe, rate, 1,
>> NSECS_PER_SEC);
>> +
>> +		if (igt_get_i915_edp_lobf_status(data->drm_fd, output-
>>> name)) {
>> +			lobf_enabled = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>>   }
>>
>>   static void
>> --
>> 2.43.0
