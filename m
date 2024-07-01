Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8D7C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 17:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E05010E4B8;
	Mon,  1 Jul 2024 17:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoK5Hd9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580CC10E4B8
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719854880; x=1751390880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GRkFhPNJmAFgSolp5dz5YLe3tCI03C3s/Yz71cvLSLU=;
 b=CoK5Hd9Vd0MRjuwMBQjZ5iG9pGkuX1uVK/CwvOMEvLw8jpYC/3/lqiIs
 wen+1AfhluAkq6UTjLOr8UOk5JKZtuR1YrPi38vzHptp2JwFQEvkrCi/F
 Wwf10sBDxODUJvGFRBfxf2J8HX79DteJji2ha0ZRLrPyH8GQQ3xot+dDA
 5IXmlSJmvWrVlhGuMXELB4VV+RkQlaZKVSeqVK1p3ALO2A36NE19pcKUU
 qT2KlW3iBBZLV+Fil6PZe6WgdG24aFVAv4jVYLt9N4iLIQBAkAJdH+EYo
 NBBBJGx43YP/wYgooth1CcD7CbeYBOpvs0IE/Uxr/42fDu5VK0uEA87o2 A==;
X-CSE-ConnectionGUID: wivKDxVIRsmHzGhDQtEzQQ==
X-CSE-MsgGUID: L43ctPgHT9WCLRq+MjJDeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="12343149"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="12343149"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 10:28:00 -0700
X-CSE-ConnectionGUID: Od0kw0qKRoezlQDCwKR/tw==
X-CSE-MsgGUID: M6Hw51iHSL+6Q6wdIXA/7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="76772831"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 10:27:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 10:27:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 10:27:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 10:27:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 10:27:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYv+R+B3MxizM0TvtjDnQ+a+zIIaMVe6/uzKEQIOLM09syJGlZYTbLM4FSfw/5o6JBfQfJLCLGWY8lV5b8mQQfmtk7KsF94/3y23+e5Asg64OWHfNvaDjc7y6wg3h8KxNO/WkYsvhfDgUEebCDchc1lrIZJ/rq+XN+MgtdIWUzKiFgwS6YioxuMkF8OhUdxgyV2+d9UGgv5PkllQ4sn1X5T0xtraM8xO9uhQDkYRPPqcFy/HD1I9eGkiu4Tska187EOlnItbdfZQCYkorkCdk+QZyneMXg26HvN6wriH/YHnkBcteg3XvjbaOXTK0yjED2reFFbKUdKBPdgRU9GEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjRxYQ3fes3XwzMH/q9aJDzr+02PjamDiJk6WH71qOk=;
 b=Qstph5ZvAjTzLDA6QLfpr3gISvS/IWhHzwTe8vF19V19KjXSJRkFPAtNdBiBB0nNbH924Gzl0EdiRnF4ZbA8DaSuAJGBHm1rvXmMAGs+YhSqkto1/zZIPr2TINNGg2nkWcFplHMI/UQ5hM15zpAd+GsybELsqgM1ujs/BOo1X9wiIXivv7beW/xja8P2Ig2zBWhmbhDYdqM0tIZ5f1Sn4/3YX7lmnOGhqfRk55mAc2+VciA9Kka7enZg2arDalWlDvaSAdQjBzvYZxX6YXfuJLia8s+sXDuEhGgKsn1xsny0+oerheK8EvWpM0mnq5vOJOylmN4MVCjFzJvte2aA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4548.namprd11.prod.outlook.com (2603:10b6:5:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 17:27:56 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 17:27:56 +0000
Date: Mon, 1 Jul 2024 10:27:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/8] tests/intel/xe_drm_fdinfo: Add helpers for
 spinning batches
Message-ID: <ZoLnGiiGVLIeerxj@orsosgc001>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-4-umesh.nerlige.ramappa@intel.com>
 <hh7keiq3cvkqznczez5xqqxycci3yn3x5w7i6f725qt7f5fqgv@s5fbq5lqzlug>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <hh7keiq3cvkqznczez5xqqxycci3yn3x5w7i6f725qt7f5fqgv@s5fbq5lqzlug>
X-ClientProxiedBy: MW4PR03CA0310.namprd03.prod.outlook.com
 (2603:10b6:303:dd::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c243e2-f456-421b-d7e4-08dc99f3251b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0x0SzZBNDhmVDhLMUFFZEpSQ3ZKUkVqRnlEcHVTUjJ5WE1VODB1aVAyUnVs?=
 =?utf-8?B?WmFUYzM3QmJQUzUyQXZCM21yUTZ3R1hhWVNGU3poTG9rMW9HaS94SGRXYmNN?=
 =?utf-8?B?WGZ0N0RIWEhRY3dEbEViK0xGY1B5Y2dEc0NwWVRHL29ndFJEUjg0NmdsS1Js?=
 =?utf-8?B?bWU5L2RzYWtkT0xMRmNDMEEydnE3NmdUTFlrV3Uremkzc21DTUVCUitSZ1d6?=
 =?utf-8?B?dVBqWmZFdDVQU1JxU0hJTVBPM3VIZ1g3S2hBNFJ2eVpFc1F0SW9WMFBRVGgx?=
 =?utf-8?B?dkljTm1DTGtSbkNkMGxhVEhJWFF4S0xicC91ZDQydjc2dzN1eGc3aG9PSWRm?=
 =?utf-8?B?U2lQTG5mNlpMRHA5T0ovYTFrSDh3VjQycER2SE1DTmloZmg0SzRwMnMzMVR0?=
 =?utf-8?B?NUNGTjNyTUlYVVhhaThkNTZTQ3VZZTBRc1dTdmdiVjJZS1F5UDFmYlhqTTdT?=
 =?utf-8?B?cjAzLzBVZkdsMlB3THJLYmQrd21qOG1GVXhFaXRkWnNRSUl2bVVVTlQyUXdE?=
 =?utf-8?B?YU9RTzZVaFpGN0h0TnZmZ3I0bDlZckY2c3FkSlVSNTJxMkFMOCtQZ2lkcG96?=
 =?utf-8?B?alB2cDdUbGVpeW92QzJ3ZFBuazZNU2pFUG82aGJHRk9ndHVWRWUydWhLc1Jk?=
 =?utf-8?B?amUvcUZKY0JIT0FqS0NyS01hSnJQZE9yRmNDRC9BWlNIWDZmc0hzOUJBNjFC?=
 =?utf-8?B?QzNFanZxYjZObHpiZERXZFVaQTJFWGZhdWpIWENpZ212YmlmNVVwNFFsZSt4?=
 =?utf-8?B?ZUxxa3RPcko4RXJXenVQMnNBLzBvL0Z5eCtsQ09oNjdkRE1lU3gwNkdhWDlL?=
 =?utf-8?B?NytyT1hRNERYU0hxclVRVDltVjVFb1ZUZ1lSM1VQYUwydDVzdDA1NjlhMjZw?=
 =?utf-8?B?WHVacVQvV2RGaWIzcTJIc291QnNmRjNGVFRBNVk4azhyS3pSZ2djNFhlNFlj?=
 =?utf-8?B?Z1ZPazRWNG5DV3NnTDE3TDBLMkdSYWtGeXlZeU1BdkRRM3FDeTJ2NVlXOVZ3?=
 =?utf-8?B?TVptcDRSQ2RienMvR1l1RWRBV2JtT0RYNUdiTWwvZCtJNnlSYU1RMXFSa1Rz?=
 =?utf-8?B?RmovbzUrOVZWSXFaMVZSdVZoME4wVjFyZm5jRnBNamtzUU5hamxqbDMzNVBn?=
 =?utf-8?B?UGNXQllOc2FLc29kd281akRPYk92L1EzUTlaMGI4NDJ2OTVpTGRHR1hFb0tB?=
 =?utf-8?B?aUZQYUdlY1JtTEgwQzRSWjZiVnRVT0JSbGN2UlEvT2hzOUV3QXVBRDNsK2ZU?=
 =?utf-8?B?THRTK053bkxWVmhBdytGL29jWXJQN1N1NXdXcmZVL3YzMXlVNXFHVXc2alhH?=
 =?utf-8?B?aDJhQklpRFBnYlpISmlFVU1vWVJHenRYUXZJOXJMRE1WNGd4ZVAyNG1VT3k2?=
 =?utf-8?B?TTJML090QzdQK1UwaXdXN3E0cU5FV1Fqd3dBNWRqb1VtOHdQelIrV1JLaWxz?=
 =?utf-8?B?cEQzNS9XT0lheWZucUt6cXI2TGJrTTNKRzN2aWNVOEZDazN4bExPQW9MeThM?=
 =?utf-8?B?STlObk5kUUh1UE8rL2VGVVJxS0ZmVzM2NU5RekxyVE1zOXlNR2RjUjNOOHhr?=
 =?utf-8?B?YytTNzVkaSt0emJKZG5lUm0ybUpibGdXZC9yT2tkWGZZZ09QUkNpRmtveHQr?=
 =?utf-8?B?OFVvbjg5NFhUSnVFaVZpQXBDYUZ6WVpVckhlU1V4K0VZY0ZFc3F3ekZaUzVm?=
 =?utf-8?B?Wnk0NkdxemdNZ0pNQzltQWNuaE5Id3lYbjBvNEdlTkhDS1R6b2lrLzE5SGNw?=
 =?utf-8?B?SWVQVXJGS2M4bTVXZDJ1a25mdnJYNk9OL0ZnQkV3b1ljbEVteWEzak9FbW1Z?=
 =?utf-8?B?N0wvNUJOanE3Snh2cERRUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ZYVVBmaldmVjZtSlNNRHZJbjlzV24wTFFkZFpEMWVTNjFHS2o3ekFoWWNk?=
 =?utf-8?B?Z0xRbVA2VmJSOU1TakYza0gwVTZML3N2M2pDMnluc3JDYVNJWEIxMlU2UmFt?=
 =?utf-8?B?SE04ZUtmS2dyajc0ZzJBWnBrbStJSzFmakxWejA5YUhtN2Nhcnp1NjBOeVJ0?=
 =?utf-8?B?MGZxWG8vZXhtSC9SMVBGbzlrVHJYVjFLN3g3NFNDRHRxOXZBUVpGSlU4TUk1?=
 =?utf-8?B?Zmo4eDZ1Zmc5VmtZRU1RcHlwYmMrQTlFUk54VVlQeGNyNjJoTm5ES3NNZVJm?=
 =?utf-8?B?enEzWjRZcGZBTWFOaFJZV1JUaEI4YnlROEttWFNNMUZMcnZDeEU1ZkNoYU1R?=
 =?utf-8?B?MDJBS2ZKT3pkQy84YzVYV1ROR0Y0VktPQlNMckgzQkpKYUxMU0lDLzc1eWZB?=
 =?utf-8?B?K2tGa3FQdXZMU1dweXlpYnl0TzIxUWVPWXlNbmVLUlBBZ2JkNDV5K0hLc2w5?=
 =?utf-8?B?ajUvOFN6M0VoMHpzYk9mSFNSOVZUZmZrc3BISTRhT3VGb3lSNjlCMVB1RDFv?=
 =?utf-8?B?QXVycDRMVkpIVFJqNWZDQnNKU0NLMXBWWGhrdFdNc3h0TmxpM01QNGh6NEcy?=
 =?utf-8?B?MXI3clJFbm8zUTQzbHFuSDc3Mmg5YWVuRjFVcCtLRUd1dmVHNS9YT1RDT01x?=
 =?utf-8?B?WHdPeVBJUHI2Qm83SUhvSUwvK3FmMmVycDVLcHBWdm9xZjJzd29TcEFOT0Vj?=
 =?utf-8?B?K0ZoREpLbEx1WGYyTWhMLzE0ejZpY29ZVVZhWGFyaGZqc2E4eTNsL05pK2E5?=
 =?utf-8?B?cHJ6NjE0a3BqY0tRN3FtaUNtUk1OVlF3Zk1PbWpvUDZuR1BqMWhHeTdWcnU1?=
 =?utf-8?B?NzdOVkxsU2lQYkVlUzFvQ0kzS1lObnI3K3ExazgrUVFGa1FVbjBnYjdzV1Va?=
 =?utf-8?B?WE11OXJPS2I5Uk5CSFpPSEJwMU9sUHlLQVUwVURtRVpPVHF1SHZ1VGQrQXQ5?=
 =?utf-8?B?Wk5yRHowYTF3dkZBTFZaTnJTRFg5K3ZwK2VNZTl1WFpQSzlteGQ5Smx3TnJC?=
 =?utf-8?B?M2lub25IOHg0TnluQlRkczZ2L0Qyc2tETm44WDN1Znc2OTFvWkEwaHRHdyta?=
 =?utf-8?B?RGRJOHdZKzhseUFHV1RtZGw4U1o0NG5kaXFTMGhHSHY4Z3JyUXJXTjRXaHBP?=
 =?utf-8?B?SWxRSDNKRkpsenJCU3BWSjJqYmoydk90dU9qZEhzUFZlQWFRbUJEdGRQQThm?=
 =?utf-8?B?V0VJQ3NXNlV6Y3lGZmtBY040NlBsa1pVTmtMQXEyQkplVUZSZExybW9PVVVh?=
 =?utf-8?B?eEVPa3huaXcvb21POFA1UW0rc1Z4R0U1UTlFeXBHRHVJYjUxdmtKSWgxZFVm?=
 =?utf-8?B?SURXSW54MWk4N0ZaZGxiVFljZVJKU3kwalRlTm9Wb3Z5THVDUHFNbXFpdXI3?=
 =?utf-8?B?ZTBGdDZUTkZCSUZsb1FmcjdrTUo1bXlXQXNIQmpYRGRRVFN1UEg4cVZzdWhX?=
 =?utf-8?B?VmRMaEEvS2JPT3lnTlEyRUVvTHFqM1JhZ2hndjJDWDNOb0VlK0hVRmRDZEJs?=
 =?utf-8?B?eHlJM2t3cWFNSlVsRERER3hHbzRxa3lTeU1CTE9YUDhlSUdlZ3UyNmQ0N0Yr?=
 =?utf-8?B?Q3Vpa2Y3c0RheThFSTlzdXdKMFExNUtUZ3FLRnJaeXVtbUxRdWJPdjBOQnZz?=
 =?utf-8?B?cCtxS29CUHlKQWpubzltZENzSmJYeDhzbDkxOHRoYnFuUndvbU00MkozN2JB?=
 =?utf-8?B?UWhvNXpVaXF0SFl4LzVVcTNIc1pzd29mclhDVWJGQk9ndU5Vc3hIa3RkbndS?=
 =?utf-8?B?OTdFU0tINjJoZXdCanZSaStrM2tmK2NzUXhxSW94T3JqNllUbFhGZnltOXNj?=
 =?utf-8?B?akNOTEtGREg1NWlROTYvbitoNDFzdk8zK1Y1U1BPdzVkU1hnZEh4SjNXK2Fs?=
 =?utf-8?B?ZTFLTTJnQXpTaEtRV1lOYVVjeUY3eTRXdktXVW9iQVE0Q0ZVbE9hcEk4V0JO?=
 =?utf-8?B?M1Q1eTBJWDhOYXk5bkJITWpIRDFpOXJZV0ladnh4ekFjOUdBRGRaMElTOXFm?=
 =?utf-8?B?MnhTTEttWEJieEd1aG5sMS83ZC9zYTIxSlNiQVpIV2NlNzdEWk42bmgrM2dh?=
 =?utf-8?B?Nk9FMWZTdHVxVVdMN3Rac2ptRFdkWEc0QjZod1lRZmtjT1k3TUFUMG9CZXhp?=
 =?utf-8?B?T29XWGdpUUxKWFA4aGM3RlB5MzZVV1FPMFAvZVRqS0NmZnNpTHcxYWpTRThG?=
 =?utf-8?Q?A7xENABVMEIWrEGFRRz3IiI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c243e2-f456-421b-d7e4-08dc99f3251b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 17:27:55.9615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiMW0QcRoihDZjCyW3c9aAvAcNnCPYcP+t/FG7iwWcgLwPks/0uNa08t4UktH5lQJyWpBZJYKxFy4dDJGJSzf9IZMcZsXdHIBRp922l6CDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4548
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

On Mon, Jul 01, 2024 at 11:57:14AM -0500, Lucas De Marchi wrote:
>On Sat, Jun 22, 2024 at 07:00:57AM GMT, Umesh Nerlige Ramappa wrote:
>>Add helpers for submitting batches and waiting for them to start.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>tests/intel/xe_drm_fdinfo.c | 135 ++++++++++++++++++++++++++++++++++++
>>1 file changed, 135 insertions(+)
>>
>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>index 41409b2d2..27459b7f1 100644
>>--- a/tests/intel/xe_drm_fdinfo.c
>>+++ b/tests/intel/xe_drm_fdinfo.c
>>@@ -51,6 +51,17 @@ static const char *engine_map[] = {
>>	"vecs",
>>	"ccs",
>>};
>>+
>>+static const uint64_t batch_addr[] = {
>>+	0x170000,
>>+	0x180000,
>>+	0x190000,
>>+	0x1a0000,
>>+	0x1b0000,
>>+	0x1c0000,
>>+	0x1d0000,
>>+	0x1e0000,
>>+};
>>static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>>{
>>	struct drm_client_fdinfo info = { };
>>@@ -316,6 +327,130 @@ static void basic(int xe, unsigned int num_classes)
>>	}
>>}
>>
>>+#define MAX_PARALLEL 8
>>+struct xe_spin_ctx {
>>+	uint32_t vm;
>>+	uint64_t addr[MAX_PARALLEL];
>>+	struct drm_xe_sync sync[2];
>>+	struct drm_xe_exec exec;
>>+	uint32_t exec_queue;
>>+	size_t bo_size;
>>+	uint32_t bo;
>>+	struct xe_spin *spin;
>>+	struct xe_spin_opts spin_opts;
>>+	bool ended;
>>+	uint16_t class;
>>+	uint16_t width;
>>+	uint16_t num_placements;
>>+};
>>+
>>+static struct xe_spin_ctx *
>>+xe_spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
>>+		 uint16_t width, uint16_t num_placements)
>>+{
>>+	struct xe_spin_ctx *ctx = calloc(1, sizeof(*ctx));
>>+
>>+	igt_assert(width && num_placements &&
>>+		   (width == 1 || num_placements == 1));
>>+
>>+	igt_assert(width <= MAX_PARALLEL);
>>+
>>+	ctx->class = hwe->engine_class;
>>+	ctx->width = width;
>>+	ctx->num_placements = num_placements;
>>+	ctx->vm = vm;
>>+	for (int i = 0; i < ctx->width; i++)
>>+		ctx->addr[i] = batch_addr[hwe->engine_class];
>>+
>>+	ctx->exec.num_batch_buffer = width;
>>+	ctx->exec.num_syncs = 2;
>>+	ctx->exec.syncs = to_user_pointer(ctx->sync);
>>+
>>+	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>>+	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>>+	ctx->sync[0].handle = syncobj_create(fd, 0);
>>+
>>+	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>>+	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>>+	ctx->sync[1].handle = syncobj_create(fd, 0);
>>+
>>+	ctx->bo_size = sizeof(struct xe_spin);
>>+	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
>>+	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
>>+			       vram_if_possible(fd, hwe->gt_id),
>>+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>+	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
>>+
>>+	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
>>+					     hwe, 0, &ctx->exec_queue), 0);
>>+
>>+	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
>>+			 ctx->sync, 1);
>>+
>>+	return ctx;
>>+}
>>+
>>+static void
>>+xe_spin_sync_start(int fd, struct xe_spin_ctx *ctx)
>
>I don't think we should create these wrappers on each individual test.
>If a wrapper like this is needed, can we add the proper abstraction in
>lib/xe/xe_spin.{c,h}?

The wrappers are required to be able to control when the utilization is 
sampled when a batch runs.

I thought the general rule was to add stuff to (IGT) library when there 
are more users of a particular code. Right now this test suite is the 
only one using this breakdown.

In future single engine utilization exposed from GuC (busy v3) will make 
use of these helpers to build the various tests for normal, virtual and 
parallel submissions. In addition to sampling counters before and after, 
these tests will also sample perf counters when the batch is actively 
running on the engine, so the breakdown provided by the above helpers is 
useful. I can work on abstracting it into the libraries then since we 
would have more users and more data on what's needed for the 
abstractions.

Right now, I think we should target test coverage now and then work on 
the abstraction part as an improvement when implementing busy v3 tests.  
Does that sound reasonable?

Thanks,
Umesh

>
>Lucas De Marchi
>
>>+{
>>+	if (!ctx)
>>+		return;
>>+
>>+	ctx->spin_opts.addr = ctx->addr[0];
>>+	ctx->spin_opts.preempt = true;
>>+	xe_spin_init(ctx->spin, &ctx->spin_opts);
>>+
>>+	/* re-use sync[0] for exec */
>>+	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>>+
>>+	ctx->exec.exec_queue_id = ctx->exec_queue;
>>+	if (ctx->width > 1)
>>+		ctx->exec.address = to_user_pointer(ctx->addr);
>>+	else
>>+		ctx->exec.address = ctx->addr[0];
>>+	xe_exec(fd, &ctx->exec);
>>+
>>+	xe_spin_wait_started(ctx->spin);
>>+	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
>>+
>>+	igt_debug("%s: spinner started\n", engine_map[ctx->class]);
>>+}
>>+
>>+static void
>>+xe_spin_sync_end(int fd, struct xe_spin_ctx *ctx)
>>+{
>>+	if (!ctx || ctx->ended)
>>+		return;
>>+
>>+	xe_spin_end(ctx->spin);
>>+
>>+	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
>>+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>>+
>>+	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>>+	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
>>+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>>+
>>+	ctx->ended = true;
>>+	igt_debug("%s: spinner ended\n", engine_map[ctx->class]);
>>+}
>>+
>>+static void
>>+xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx)
>>+{
>>+	if (!ctx)
>>+		return;
>>+
>>+	syncobj_destroy(fd, ctx->sync[0].handle);
>>+	syncobj_destroy(fd, ctx->sync[1].handle);
>>+	xe_exec_queue_destroy(fd, ctx->exec_queue);
>>+
>>+	munmap(ctx->spin, ctx->bo_size);
>>+	gem_close(fd, ctx->bo);
>>+
>>+	free(ctx);
>>+}
>>+
>>igt_main
>>{
>>	struct drm_xe_engine_class_instance *hwe;
>>-- 
>>2.34.1
>>
