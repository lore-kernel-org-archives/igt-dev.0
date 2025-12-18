Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04600D68BE1
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 06:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988C910E63D;
	Thu, 18 Dec 2025 06:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsJdrh5l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DF110E63D
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 06:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766039773; x=1797575773;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=utKT8GuqMce7XQ3L6r9Q9vRfsz9aTQSQAQLChZxRfb0=;
 b=EsJdrh5lMmu0Mumc4Ci/2MZFfXJAv1vEB6f7GvPRz8oWHfp5cFXqsabi
 JfzDiol/D2SHJlq1LSu5QFXJ2y9REF97lojzp0XRSinxH5t0r/YDGghg1
 YmiyX64+Tivdv3VfaFLENW4Sl8k35jf5fUdhb/w+ILnIiCXH+k+TxjAJM
 tiVvs/N0lkTNy4DXkoGKpnlU+lkBWpuEnirIz3iIKqZkGfNwrS0OLOlaP
 uwkG1Qg21VbO01e4Ms+wCZ3tSaoSd5FUWKrCccwBoDlre3VlECYqf6A31
 87Qe8FOJqt7ya8Z2qToBJeC0nRE1W1PBt0yr2Xr/yKd7AAWToTBvsJpeC Q==;
X-CSE-ConnectionGUID: PaQfpOoNQvKFtPAKDkkS7g==
X-CSE-MsgGUID: qjDLnEdQQbG5TFMfDDzhEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="93462212"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="93462212"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 22:36:12 -0800
X-CSE-ConnectionGUID: KdvDD7DfSByRf6Yyv98VmQ==
X-CSE-MsgGUID: 6e1RRLYzRmqzv/wi7EAktw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="197660901"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 22:36:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 22:36:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 22:36:11 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 22:36:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVVp+wO29NkmeaHuAvGwpQu9FtAvAhE6J5/bHONG85nVyDYNR623h9qHJk4N6Q9yp1ISX/ARrULoODDijyRqQXt9vHpyzHl/J74vjSjqBqOioP7CCcHdg/spjjm4O4NIPwuErU/o0EqXMwmVLg1rupuFb6lr5KKJuj4UPOCaAia78Y2cLLtiu4e1BXTf7Bb/l+gsD4Ix84yTU1XF2qO3B/bTPleoj2ahUVHvjvE9DkXN0ik9mCe+qU6gInH9sEabF0T9gxrwDt8GnCpgXoUkfQhINJN2yvYskuvtupmb0uQswQjjxV1mvFuCl6MNlcln3IuXC/OV5LXYGqnkFs/B+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrCREiWV0MftKVxc1+4SxBD7y/N7rA99YDuppfsQXG4=;
 b=gA78hHV+XLnhg4osuwBcKOWFcYBUzgs/gYjDZkHuXkdRKj/A3bcAhnwHk31E1qosFeGSFt5JH3cK5tcL9d9E/fTIsCeUQIuUUpPVGWK0/HX2M65iDlZP8yZPsryRUJxgJEUxjHmavOlDZSPjs9CU2Xv2brl7r9S84WiulXTghcl1HrXG7ZY0b4e9i0Lgf5XvOxs3cX4a9JAGsWTPlkzDdCuRHoobv14q2eqZ1fxg9ygtMdDyJEtZUtGTlHf2Sv5lr6DaVJrAynEzz/lIEd6bFSfopXpS7GWRD24ZEnaGrWGnARp1MFpuszuFb8FyJPae/HMoT3eu1pCKb9I4lI7qrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPF8622363CD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 06:36:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 06:36:10 +0000
Message-ID: <30dd6ab8-7a55-4be3-b309-cb11900826b9@intel.com>
Date: Thu, 18 Dec 2025 12:06:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/3] tests/intel/xe_pmu: Refine engine activity
 accuracy test
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <igt-dev@lists.freedesktop.org>, <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <kamil.konieczny@intel.com>
References: <20251113124936.3878794-1-soham.purkait@intel.com>
 <20251113124936.3878794-4-soham.purkait@intel.com>
 <cf076e76-10b3-46c6-a4b1-a6835fcbabc8@intel.com>
 <9180ae12-d7ec-4a1f-96bc-c610cc20a287@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <9180ae12-d7ec-4a1f-96bc-c610cc20a287@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0196.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPF8622363CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 33876174-8793-4eeb-84e1-08de3dffbaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0krZDdRZUtoa3h4RkJNenpNbEhrWndFNWJiOXBmTzBpTktNRFZaWUVYN0Nj?=
 =?utf-8?B?L1BYSWljQUdkcXg5RjVmNG9EVWp0aE91SG9rSG5zZnZ1dkt4RjhrWkVVeUsw?=
 =?utf-8?B?bURSbjBLK292SUZJbUhpaFZyeHFKclcwS05acWlSbjgrVm1DemRvVFlpOW0r?=
 =?utf-8?B?UWhPRnBDK1czOVYvS1BFd3lLc2M1NDhOUDAvR0JnVmlQbnRyUy9OTVpEb0M0?=
 =?utf-8?B?V0toSWdrQ3J1SGVKdEh0RzJtR29FS253b0pwMi91bXFML25nV1pYTUxVVXhK?=
 =?utf-8?B?Z2FFS0R4RHNOcE9CczJCOGxWa1JBbEFidDJWQmYyWFlFMFdNRFNsRWlVbVRM?=
 =?utf-8?B?T291OGhMcDJXQ1ZCU1JNdFpNNEgzQVB5RExjaVpEOFhVa2o4aHIzUGdQMEEx?=
 =?utf-8?B?YkNheldvREd0V3RKSkU5ZndsU0FWTUxDSld3VllRM0tYMml3UTZJb3RGeGgr?=
 =?utf-8?B?TTl0MXdIdXR5Wlh4Y3JwdENvQ1Fjb1JmNUlVakI5b3RBdHU0WEtQb2JRTWIy?=
 =?utf-8?B?L1FrL0tDRS8wMDI1bjZ6ZnpFVDgrYkE5VW5oT2pQUzcweUtIK2dHZDBmL2U0?=
 =?utf-8?B?WmFFbjU3cThPVWcrSERYSDN1SU9jUHZaODRVYUdoRWx6NG9BTHlCdVJ4SDd3?=
 =?utf-8?B?V1RWeitCclFOalNKUGVMTkRTVnl6Z3dmSHZDNlV3VmtTcGNiODE0SElKVWxP?=
 =?utf-8?B?eHV5ZjlvMVN1ZnZEN3lkRUdVQjdlb093YUxZaGdhcWJwbDlkN2p3Tm9hQVRl?=
 =?utf-8?B?UmpFd2ZYN3NrcGNZb05hM1dZZVBKemVmUlQ1VFFxN0hpQTJKbVNiYXh5Smk5?=
 =?utf-8?B?aTVGUXh4N3hvRU94RFdadVVmQzZ6aktOV0lKdVdHYk5WWGZNZEt3OGVtcWw5?=
 =?utf-8?B?cjFiUEhzQmFOZ21pVnV2aXNCZ1hUa3RRZVBzcmhFTWRlYURvZzRHRU50RGtE?=
 =?utf-8?B?NGV2NnU5ejhFd1B1VE9aNEdiNmIwWjkxOVVYenJ3MVVERTJ2TVJOUWJ4L0lG?=
 =?utf-8?B?aUtsNDhjdkJiMFV2akNaWkZxVDlSMlpFUEsrZXhyQW5XaVhYQmNKb3dCNWdh?=
 =?utf-8?B?MzBabTBDWHY5Y25RZDUrcmQwdWhSRXhOaUIrM0NSVWlCT3JqaUp1TmQ0cnVL?=
 =?utf-8?B?eUw1SHRadEh0czBYaCtaczRMOCsyaFM0RDNZMHJUOHdmOEFoUWdLRzhaVWFr?=
 =?utf-8?B?RERVWDVsZlN4SjUzMWl6azJDTVRlWGtWalZMQ3Y4dXVxa3Z6ZExqdWh1djZV?=
 =?utf-8?B?ck54dUNCZVdOaTlnd2szZTFnZU5HWXBDUmR6cWtBeFJqY21OMDJLSE1RMHZm?=
 =?utf-8?B?d1ZCMXpjWGZETHJKSWNnLy82VGY3WWxWbTJ6MUJxZ0RoT2VZd0VMOG91V3NB?=
 =?utf-8?B?cFkzQ2U1U3JWUDRVY0NxOHRzcGFtSzFJaGtzc25ZWjFreHUxQXc4Q0NDMmtZ?=
 =?utf-8?B?eWsvS2FqMk5qeUxxa0N6cHNwejZRbFVRc1R4bU1sRFFDbDdpcE1Ic0p2ZWNC?=
 =?utf-8?B?SzRaT3EwQlFaS1VVdHVKbXRPbERVcmd6bElIQ1k2eW5IbWsvRVI3N3dqQUc4?=
 =?utf-8?B?Y05ONTMzbWdLeVJmQXJzOTJnTFUvYXpoMFdLUFVnZmVGM1dYTDBwV0RMdFVl?=
 =?utf-8?B?N1E4QTFPNnJwNGJrYlM1Qk45V0srdDk4WWwzVEI2STk3Q2I3SGM4MzR5WWhR?=
 =?utf-8?B?S3hiU21ZQTQ2czFxYjdteHVUcURXN29BN0tCQVJiYkRud2pHR3hsTU96NkV4?=
 =?utf-8?B?eHFtQWVYa21GK1BDc2J2RCtwdVlJdnRaTTc3OFdXbzdCS0Ywem9CczlaUk9k?=
 =?utf-8?B?a3NkdE9nRHVyN3pQQVYvNW0wNGpKbm1yNjl4QzFReVdCeko3SHFhN2ZnWHMx?=
 =?utf-8?B?RG42aGphMGFoS1JyNWFnQWMrKzJ6NXpjbzJwc21iSEx0Sk9lMmVSQTlrazhO?=
 =?utf-8?Q?NQX+6w2Lx9+FtFIgwmMOo2geV4n6am/H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0xYaDBRUHQ2K2h6T1JJRHRCWE1Gb2lKRlBaN0RLbUJwY2E2OGVBbjEvamZS?=
 =?utf-8?B?WDJpbGl3aCthaTlSUGp0MHFXb1gzVXlXWEk2RGVCTG9oSDhBdGgxaklGRGh2?=
 =?utf-8?B?OXk0SWY2RmROTEdlSHZRWllmVk5pTWRDa2tjSVlYbU9RK2R2aU9rc1RWdTRt?=
 =?utf-8?B?dytXYUc1VzU1UUVnLzNhK1hITmFLbHBuL2cxZmJURGl5c1dPRC8vUFJzTkZQ?=
 =?utf-8?B?eEx5bXU0cVVRR3BKUG1QRFNyZFUwOEZ5amhNTDZDUG1SZnJ6QkE4TXFWT1Bs?=
 =?utf-8?B?bW9JZGZjeW5vM0lUbnBWYytFSkZvMUtDVVVTeDNHRjNwN3dxMEtGU1pqQjZ6?=
 =?utf-8?B?VTJwWERDSnpMMmRtalgyQ3I1NmYrVXZ5NElRdXVUbUZOWVF0cXJsay9BRm9Y?=
 =?utf-8?B?alo3WS9NNnRuajNvWE9MVitjMDNYZ21MN01jM1EwYmdQbWMwcjlGVEZrbG0x?=
 =?utf-8?B?Q0RuZzZveTZlcHRDQWZCb2xyMTlhOGJZVmxWQWNyenhxUy8ranF4MFJRTGZH?=
 =?utf-8?B?a1BpbDduV1BSbXczZWVhTjloUDdZYm5ZSmlybXlzZFdBc2h6dm1FeFVjdkVE?=
 =?utf-8?B?YWdvenJhS29WeUZPbkN3ME81TXRJdENQZkVCWUxHYmFOMk5OVXpCM0ZSMnht?=
 =?utf-8?B?eHdzSVBsN3AwNGVrM1VTcC85THpXbVRWbzQ1dGQrT2VubUVWOHlrbGcwOEtJ?=
 =?utf-8?B?dnlZWXB0bVFQZHZ5Qys0U2pwYWVxV2dqSVI2eEhWem00UTZHVzZrOHV1VDRY?=
 =?utf-8?B?Si9naVkzRnFMaDVOSE56RExUYUk4UEJXcTJzRlFZcXo3dVF1RDlxbzlWR3Qr?=
 =?utf-8?B?ZWN5WE9YWVRIRDhtTW9HMm53REN5bm1keE9RU1lFUi9hUjJrUWFncUhEUyt1?=
 =?utf-8?B?TmppYjQ2YTJVZ3N6QStHSk15Q25lbWZWdDIwSFdlbkhzT0FLcDQxNDZWMkxG?=
 =?utf-8?B?N0ZYVi9tcXB5M3huWGhHK1NrOEhXRks5dEFmdjJhZTdwdWliVDRaUUtHdGVP?=
 =?utf-8?B?M3RvYm41ZWNIakZSOGsyNlVLRnhzd2h4Vmo1TEx1My9kYTk1R3RQc3pJYWMr?=
 =?utf-8?B?TTVDSkF2eWdobmpGRDZ0SW9oUFpPdXJvT21EaXZSS0xkN0QvSE8yTTBtOHFQ?=
 =?utf-8?B?Zi9MTHRkbkJMMW1KS3lOc2VQbjZRMkk2WFRGRWxKTDZyaXBBZWFIZmdicnpH?=
 =?utf-8?B?UldYbXVWS3BYVTFDRU9JcGY3ZkVZcVdWNWlVQVdBYnVIdFliWXZaenRTbndz?=
 =?utf-8?B?blBuNG5kbnQ3VFU5akNObHM4YkJDbE1zSC9kSXNJZmhhc2c5SkpSSmJkNy9u?=
 =?utf-8?B?TDdveHA3c0c0ZzRGWnFyNDlBWnYrQjJnSXZPa0JFejdlZDVQd1p5bkdpL243?=
 =?utf-8?B?d3Fwckkxek5LUnNHZlFweTZ5dTkwenMvQ0JBejcvdzZFeWV6RWg2N251S2l3?=
 =?utf-8?B?ZzM1bHF0dzliRFhucmVuelpOaTN1bXZHL0pla0dxS3A1UzZTOVBQWjVRRm5q?=
 =?utf-8?B?bW1yZzJFc0VabEU3V09PQzM3aWgxN2JvNERpbzVhZ29JcGZObGJMNDJYTzNU?=
 =?utf-8?B?S3VBREhoNTV3dHpzU05LSkV5RG12aUN3ZWJlZTJDRFRJNU9GTFVuelZYK1Ns?=
 =?utf-8?B?VS9WRXMxRUxORkJsemFRZkgzMk1FSURaZGVrS2ZENDdzczNyYWNuYjFSenhi?=
 =?utf-8?B?Y2Y5RWREOFovak5yRnh2OWYzUlZmMmhucXcvQ3ZYSTV3SzRpczNHSm1UNGR1?=
 =?utf-8?B?UzRBR2drNWJQYWFGbUFxakkxTzBYK2VSNWVkenk2cjA0RlIxSkdwS0xqbTBk?=
 =?utf-8?B?KzJBTGFVSEVzb202V3hiTU5KcU1EZVdqRXVyUXpncDc5L01ObVg3YzdkUlNB?=
 =?utf-8?B?S1FRQncvcXZsQUlXSXhVRjBTdWdKYmhOMmNLNFdrVDIyLyttMC95T3JhQ0lN?=
 =?utf-8?B?NEh2NWIwVlV3dS9udm95MGgyRy8wUk13MmZpSmIwYW5QcUh3VmZLZ1JXYTdF?=
 =?utf-8?B?SWdUQnVyVlg1MlBQOUpZbk10bGZYU1k1TnhZOUc0U3dZcEhwaEtNZzI5Mksy?=
 =?utf-8?B?QjgrdXIxMGlUcnh4eWFOandGMzJOeXNqVWVXaFh4Zm9vVkNlV3Fyak1tL3dD?=
 =?utf-8?Q?ZrzfSSVT2LUVVwoyfZjSrYiuP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33876174-8793-4eeb-84e1-08de3dffbaf8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:36:10.0104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIDbyfPQmuko/WmJcgZ8GPRLTby6E5Y7nB3oY8qJgiffU4fNNeyyXi9IDVeoUvph5mYHoWQ2iva76o/oPl7mGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
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



On 12/3/2025 3:09 PM, Purkait, Soham wrote:
> Hi Riana,
> 
> On 28-11-2025 14:56, Riana Tauro wrote:
>> Hi Soham
>>
>> On 11/13/2025 6:19 PM, Soham Purkait wrote:
>>> Instead of creating a new spinner during each pass, it's more 
>>> efficient to
>>> instantiate the spinner once and reuse it by properly ending and 
>>> resetting
>>> it between iterations.
>>
>> Give an overview of the the issue and the links in Closes
>>
>>> This approach reduces the overhead associated with repeated spinner 
>>> creation,
>>> saving time across multiple passes. By eliminating the cumulative 
>>> time spent
>>> on spinner initialization (i.e., creation time * number of passes),
>>> the spinner's active duration more accurately reflects the actual 
>>> engine busyness.
>>> This leads to more precise measurements of the percentage of engine 
>>> busyness in
>>> terms of spinner running time.
>>>
>>> With this change engine-activity-accuracy test result clearly shows 
>>> the difference:
>>>
>>> Before spinner reuse :
>>>
>>> Starting subtest: engine-activity-accuracy-90
>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>> (90000us/10000us)
>>> error=-2.90% (81.03% vs 83.93%)
>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.598s)
>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>> (90000us/10000us)
>>> error=-2.81% (83.06% vs 85.87%)
>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.684s)
>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>> (90000us/10000us)
>>> error=-2.04% (83.83% vs 85.87%)
>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.667s)
>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>> (90000us/10000us)
>>> error=-2.15% (83.99% vs 86.14%)
>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS 
>>> (1.647s)
>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>> (90000us/10000us)
>>> error=-2.00% (83.59% vs 85.60%)
>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS 
>>> (1.664s)
>>> Subtest engine-activity-accuracy-90: SUCCESS (8.264s)
>>>
>>> After spinner reuse:
>>>
>>> Starting subtest: engine-activity-accuracy-90
>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>> (90000us/10000us)
>>> error=0.03% (89.45% vs 89.42%)
>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.560s)
>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>> (90000us/10000us)
>>> error=0.02% (89.56% vs 89.54%)
>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.559s)
>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>> (90000us/10000us)
>>> error=0.02% (89.42% vs 89.40%)
>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.571s)
>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>> (90000us/10000us)
>>> error=0.01% (89.28% vs 89.27%)
>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS 
>>> (1.581s)
>>> Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
>>> calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% 
>>> (90000us/10000us)
>>> error=0.01% (89.37% vs 89.36%)
>>> Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS 
>>> (1.583s)
>>> Subtest engine-activity-accuracy-90: SUCCESS (7.859s)
>>>
>>> v1:
>>>   - Add how this patch improves the engine activity accuracy test. 
>>> (Lucas)
>>>   - Show the numbers with the said improvement. (Lucas)
>>>
>>> Fixes: 477154cbad2c ("tests/intel/xe_pmu: Add tests to validate 
>>> engine activity accuracy")
>>
>> Add all gitlab issue with Closes:
>>
>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>> ---
>>>   tests/intel/xe_pmu.c | 11 ++++++++---
>>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>>> index 9525655ba..af0c2dfe4 100644
>>> --- a/tests/intel/xe_pmu.c
>>> +++ b/tests/intel/xe_pmu.c
>>> @@ -534,6 +534,10 @@ static void accuracy(int fd, struct 
>>> drm_xe_engine_class_instance *eci,
>>>           intel_allocator_init();
>>>           ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>>>   +        spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
>>> +        xe_spin_end(spin->xe_spin);
>>> +        xe_spin_sync_wait(fd, spin);
>>> +
>>>           for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
>>>               unsigned int target_idle_us = idle_us;
>>>               struct timespec start = { };
>>> @@ -552,10 +556,10 @@ static void accuracy(int fd, struct 
>>> drm_xe_engine_class_instance *eci,
>>>                   igt_measured_usleep(target_idle_us);
>>>                     /* start spinner */
>>> -                spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe 
>>> = eci);
>>> +                xe_spin_reset(fd, spin);
>>>                   loop_idle_ns = igt_nsec_elapsed(&start);
>>>                   igt_measured_usleep(active_us);
>>> -                igt_spin_free(fd, spin);
>>> +                xe_spin_end(spin->xe_spin);
>>
>> Should there be wait here?
> Yes, ideally |spin_sync_wait()| should be used here. However, to my 
> understanding,
> the amount of time this call consumes actually defeats the very 
> objective of the test,
> leading to a higher error percentage.

Why not take the readings before the reset and wait since we are 
calculating the busy time?

Thanks
Riana

> Although, in my opinion, as wait is not used, the rest of the block 
> compensates for this.
>>
>>
>>>                     now = igt_nsec_elapsed(&start);
>>>                   loop_active_ns = now - loop_idle_ns;
>>> @@ -590,6 +594,7 @@ static void accuracy(int fd, struct 
>>> drm_xe_engine_class_instance *eci,
>>>                         sizeof(expected));
>>>           }
>>>   +        igt_spin_free(fd, spin);
>>>           xe_vm_destroy(fd, vm);
>>>           put_ahnd(ahnd);
>>>       }
>>> @@ -622,7 +627,7 @@ static void accuracy(int fd, struct 
>>> drm_xe_engine_class_instance *eci,
>>>       igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
>>>            (engine_activity - expected) * 100, 100 * engine_activity, 
>>> 100 * expected);
>>>   -    assert_within(100.0 * engine_activity, 100.0 * expected, 3);
>>> +    assert_within(100.0 * engine_activity, 100.0 * expected, 2);
>>
>> Is this tested on multiple platforms?
> 
> Yes it is tested on BMG, LNL and PTL.
> 
> Thanks,
> Soham
> 
>>
>> Thanks
>> Riana
>>
>>>   }
>>>     static void engine_activity_all_fn(int fd, struct 
>>> drm_xe_engine_class_instance *eci, int num_fns)
>>

