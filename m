Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70717C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 06:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190DC892A6;
	Tue,  3 Jun 2025 06:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXh7oozI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A070892A6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 06:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748931329; x=1780467329;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7GBWThl9qDWmxoOk26x2ltIM6R2f07483szOj/y1xis=;
 b=bXh7oozIrgynmF7JSyJxR6Cdj76KFSOGNityxssrl4M+Ko0XN4GlTm89
 glTzVEsy4nLvZXx/EGDn9am4bhWLhPhZi4JZzWlzzrKTr4lyi+JlHhTzU
 HEmow0yR/XqJef1rR7W2S3jtLzpYAW0Rg8K/TeXQw717mkkbZo9eCjakK
 sfkzrNebPpU1c2IASL/zejIn5a9yq+zSYsERraXZbD2tWf0bkHu9hhYov
 fQtSr575sRJV7VjvhUgCAnIws1CSmAm9tl/vFQsxTDajpXQrvw/cL0KcO
 MtqFC6pGGt6HGuUyz6SGh7lQBDZIET0sZH6RL3RUtiKyOLFY1lk8231B4 g==;
X-CSE-ConnectionGUID: lmWmOtXCQ2usKyr4f4seAg==
X-CSE-MsgGUID: zDdbY7/aR66K8bT4gXoRpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62312883"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="62312883"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:15:28 -0700
X-CSE-ConnectionGUID: 1j7OOiioT1qdtirJl+Udbw==
X-CSE-MsgGUID: ilTIEBxfTxWiA0ZQbCzSfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="175712443"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:15:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 23:15:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 23:15:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 23:15:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBcgeO6eVbSEY09St4EUXIS4jYGaDdZZRSnE/zySzJXmDouzQ8NNBhOvZuZUUv7Y8aHzr3A5SBEDYih1JGcxgRXrsd8DOWyjhfnH4qA2KHyCmeD2bjeuoLyRs1C2pXhcYO7vp29zkVTsj5GQzxgQBVkzs+WZUSrj1ThqRUYpIMugxurHJtxRcxN5qpUIqEGTfyeV+vNfbE9UCpvQ1xU53cGYEcgyo5emtCeSrGA90Xg+N1yThWWcxYizHA8U2/Eh7wiTM11mat71KzNb0UL5o1AlGTRdJ4Akz4pmRASx8wvkyJcORmLT3TXjD3/bxBe7/1j/PK5oIu9jCEm0JIRegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3x3/HhNZjpCXdg8OwP4xevTF4PTQ4HU6cA1IXi38zw=;
 b=RXHvIrLrddaCnD0sFZSGc6wQ8M0LzOpkMwEMIccT0R5oeD7lfPd4BGVtc3FJgG5jdkbK6rE04ptr9xBxzUf8ufMymAk/999dobSWfrauERCcTZhqU2wFoRbx4HRFtAf+cf2UQ1mvYIVpjYUkQBxggC+nRqnF7mgP3YH6FsjljHwg/UXhB+b3grXQ0d6nVxzHT/BrMsdy/+FBAyToYleClltVpOU2JUP8Z60q4tyvFhKnainYdYuHF29K5tFOzrQL9ZN8tn+V4KlBkDV0i//vo3RS6c8fFerJZgDGAVHtz3vORdWNeJ3Q3/ln5JNPSOhB+tRCToXISpO6EV9SNPorMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Tue, 3 Jun 2025 06:15:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 06:15:26 +0000
Message-ID: <886273d8-b3ac-4ecc-ac14-15a1e4887bb6@intel.com>
Date: Tue, 3 Jun 2025 11:45:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_configfs: Use openat to
 simplify check
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
 <20250602-engines-allowed-v2-1-52bffe717766@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250602-engines-allowed-v2-1-52bffe717766@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 94865006-e37e-4b58-0dcd-08dda26607cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0JwVEQyeGlEbTVnN3dpRnhoaWdzVGJXN3Vtc21qbHVoZTI2SHVwNVN2QlU5?=
 =?utf-8?B?K1RUakZvUDNZa0EvcG13TlNaTjJMalE3dGJBdjVibFdIbTdFeUJ3UDFDMWFT?=
 =?utf-8?B?cXNSQU0zZU1DSXptTmwwaGo3OTg4TTZjVHFXaDl4bFk3UmR3a1V4OGxydmFx?=
 =?utf-8?B?YjgzOFl5QXhyUkY2d1A1Tkx0bTE2ZStnWHd4OTNNWkdOZmI5ajRQRXlFZ0xz?=
 =?utf-8?B?RDE2TDVVUnVhQ2w0ZnNjNjBXcGlxVkFpSWJVREd2TFFldFZTVFpiR29ySUVC?=
 =?utf-8?B?emRlMUVaeEc4OGk3TUp6VDFka0FteWdzb0VPbEFLb0NGWnk5ZVdwc0U2MUNK?=
 =?utf-8?B?MUhoSkFpdVdML0I0YklWSXhTeGdvL2tRYWdXbDJnMUQrNTl0YXBacEQycmU4?=
 =?utf-8?B?L0VmemRFWWRkQXp3aU9tZERYSmJEaCttZS9uSTc3Z1VlWlRkVFdXNlJveG9a?=
 =?utf-8?B?TkVEcUJHOENNUkRldWx1ZnhtY3p5eHFXQ094N1dIb3NHQUZ5TEhQT0lmODlF?=
 =?utf-8?B?azZ6YkRudVBJZGhXZjdRUytvWXRjb3Z2UklhTjNpai8wUG5EOVA2dWhzQjY3?=
 =?utf-8?B?cm5jbytYcXl3OXNtQnFyL1hZUzFVL1hqVCtkWUVJL2FPU3FFWkM4WFJ1WWx1?=
 =?utf-8?B?dis1NEc1TjFrWHBHVnpNenlObWpCR2lWSWc3WnFlSmh5UnJScXdKaUtGZnNG?=
 =?utf-8?B?dVFjRkNtWWIvYWpjQ2lvMGFWck05b2hjRkVIbHZ5QVNNVW9OdnFzNWJQd0Jj?=
 =?utf-8?B?Tjl2ZzFZcmN6bDh4MjBKeG9rOVFtSDdTa1IwcHF0Z1YxMmdjd1RjYkkxT3Jk?=
 =?utf-8?B?a3QxWFFrMjhoZENldTlvUFZlV1h4WllHaHhVUG1xejZteXNYSEF4QnVzOUpO?=
 =?utf-8?B?VTBiMklNZ2Z6eXJUd1JCSHI3UzdpMG1kazVzYmJYOWtneW85Q3ErejRJOUdS?=
 =?utf-8?B?WWtiVE8yTHIyM3NMN0VLUi9VL080WnhBZ05QZnc4ZkN2OUViWGRQVVJPVmYz?=
 =?utf-8?B?UUVwZ1cxTm16cmhwMEFzNHNHR3hwZjVjb3ZmcVFmRERvMjYybmovand0cGUx?=
 =?utf-8?B?NmNDWXZzcHFCeUc1ekFqeVlsSkZIYVBsVGlTZGxUNmk0MWFYSlhOL1lnM09n?=
 =?utf-8?B?MUNiTG1hMXZnd3UrdTNkTVpydW1odHRLUlZOS1NydzNpa3h5WDBKWnFSRmZi?=
 =?utf-8?B?TlJ4NHJZWWJUd1lVMGlwaUk4T3dhQ2dtMDhJZ0xIdk5zZDVXRnExMjdZTitH?=
 =?utf-8?B?Q0tBUFcyb2FmTTUwa2VFaFVGK3lXSlFESGQ5bUJZRncyRHk5QmhCbVphSC9r?=
 =?utf-8?B?bkpzbXJNNmcwNFRLelYwV3BZZkY4cStIeWdlSEoyRGV0c0hmenRzczYrZWtI?=
 =?utf-8?B?cVFSclJ4cTBYd3FpQzBqbEpoUk5aNGJTSFVoV0ttNXhoaTFPelFONnVsdXNC?=
 =?utf-8?B?cTRSQ3d0SWRUNXRxQW54azAxdStIV3BtMlhZYzByQ3JUdEZNcmMwY0FHN2hy?=
 =?utf-8?B?S2R0d1AyM3d0cEg3ODZVZjZnR1lGREh4L1VySkN4bUIvdWRmNXkvUU9EWCs5?=
 =?utf-8?B?SC9zTllmV20vTDZJQ0VzMWJIZFlCRFp0YXp4Wk4wa1pSTThKOUpEYlNzYWZU?=
 =?utf-8?B?eHZVVUNzeEwxUjNudGJiYVY5TGYvUkdhUmNQYjV0ZjFpb0F5czZDT2RKU2hC?=
 =?utf-8?B?cjdkelhlZzQwRUdqcllndjVaL1JhcWx1Ni9WQmJtWUszME5KYVJaVEl0aW5i?=
 =?utf-8?B?Y2psR09VL0RkVUZsMndhaTR0S0dEOW81ZUxlVTVlbW1OVnVBMURraFRWU04z?=
 =?utf-8?B?K0NvZ2V1enljcW1CaStFaTg5T3JrdGZoaHVpL01pMWhyRjhFVDNRQ0tCSWhj?=
 =?utf-8?B?ZTRhWVZWQTR3OEF2MnNtcEY2V0YrTXpCUStiVDE1eFZ5elU4SEwwQ05qZWZO?=
 =?utf-8?Q?e75py/DJbb8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFlLeEVJRGx2VTJtbDcwWjFJbE84SEVJcGpFQit6Nmx6Zk1lK2JuNklpaUhI?=
 =?utf-8?B?NjdTcWk4R0Y1emtRQVJLWjV1ck12b2FwbTZNeEtCS0NLRGFTMTNUSENlTm5N?=
 =?utf-8?B?OVRNT0d5MHYrM1BEaFpRRmNnMC9YRjI3VjdlY3VuNDdKNXA4R2hNdGZQdTdm?=
 =?utf-8?B?OHAxcjZGVEI3VFRMaGhvWHZ1Z0t3NHJ6WE0zeWkrQnBpSHBSc3U3UmhkNmJ6?=
 =?utf-8?B?enk4SFRqSytRRWVRWkhzL2RacmtjeTZRTUk3a0dDMWtMdWVOeW1GcDZTUjdm?=
 =?utf-8?B?ZTczYTBoZUsyTmRsbHJlbW9uU1ArNlpUTUVBMUVCdWtQaWI2YlBMb2gyRyt1?=
 =?utf-8?B?Q0ZwTTczWGhIZXFTTTZ5Q2Ixei9PSHY0UndINEJocE5aaHRrd2dZUE5PMTJB?=
 =?utf-8?B?ZTcvdHc2aldxU0JrcUZZd09pdjJsZFB5SmVwWXF4QmU5b1lTaW8xSDJINUpa?=
 =?utf-8?B?UGFEajEwMDUzK2hXcEdnUHUvalVvM3Jnb0x5cFhwOWZSLzU1SzluWThIdzNI?=
 =?utf-8?B?cFVENkJqWndOTEhheW5MQzFld0xkL0FYS2FpMVVhUnF5blZVWVlWSXRwcFZv?=
 =?utf-8?B?OFlSdEZIOUg4K09RRHo3MEgrN0NvdTRhZTdGYzNxL0UzZklWdDhHM1J0U2py?=
 =?utf-8?B?ZnFMR20zZ282OHFDV0JvVFlSZWErOW1JVWdWUVcyYm14UzZEZnV2WjJ6c1dK?=
 =?utf-8?B?NlkxMDZUUXc4YkJWbmdGV3U5N3NHUGFlWnFCamNOUmVSd2tZaHVZVTM3R2U0?=
 =?utf-8?B?Zjhtak1yeDlrTGhuMWlSTnVYZVNEbFBhT1lkVzFveTZJYjByRU1GZEFSaE8w?=
 =?utf-8?B?U2pNdm95cGl6dzBLNUJoYXFHd1NacnhBb2l5ZjJHcFdibVVkOCtnVzZRQ2Y0?=
 =?utf-8?B?WW1QTG92ZUV6eGovWXpnWjhJdENNWno4RDBRTmJLTGtYYWkvVjBVWndTVjN6?=
 =?utf-8?B?Wm9YY3JraldYalMwVFdCVGVDaDJEaFJaQWxMd2VNejdhSzMvMHI2V1lhaU9z?=
 =?utf-8?B?YzhrM0lyYVdyNW0wYmV2OUxwT0dkYVBpR3RtbVRnajQ5cmJZYk9ZdEVWRUxo?=
 =?utf-8?B?dGVLYS9zK3c2ckM2cWRZQUVqNi9hR2hzWWpUT3RONThxUGJCa3ZaL3ZtbmNp?=
 =?utf-8?B?U1dkdjBUcGx6bVBVSWIrRmxMNi9vMDNoSkNIN3RDVFdIQWd5OG5aZlpWMVB6?=
 =?utf-8?B?czFhSk85YmVWWlVmOHJkMGlnTVBQMVg1SVlSTldVVDcyYm9acFUydk5VaXBT?=
 =?utf-8?B?M3UzbDdjRzJhaXlRTUE3dElMMm12U0lueW9PK0h0dFBXVnE3NC9ua01BMVI1?=
 =?utf-8?B?UnlLRHJkTFNBcDV1bklNVWJsUnZwQlR3Z2ZtWUhuSTljT0JDa0tZZG1nTDF6?=
 =?utf-8?B?SUJFSlR1eWpiZEYzUW9YM2hBYzVFRW8xUjAxb0VGSnVLNnZHc09LMGV3Qm1o?=
 =?utf-8?B?ZDU1WVRUNkpmZGxsdktjSGlXbnZUVWpsSkhweU9HMGdoY0N3L1J2eHFoVEJk?=
 =?utf-8?B?Q25MSStDT2M4TjM3OXpQaVdwN0toMFRSdGFESktRS1VWajVVMXhjck85NWZE?=
 =?utf-8?B?d2szVFlNeFBMODh0SXRaV3VRcndsUWVhYS85RTZoUkFOODB0ZkNvMU1DZ1lR?=
 =?utf-8?B?RVB0aHYxKzM3UHpLMk5PWXliWXJJemFLS0hxZkV0eXBmay93bXFIRDBQNHBt?=
 =?utf-8?B?bVJEUldVRXB1T2lqWVd0d0d1SkIyU250Ymx5b0xGemN5SVp5L3lFUEJqaFpi?=
 =?utf-8?B?M0ZBc3d3UUNqTnc0ZmNjYVpHTCtILzZTcVZESTdPQ1U3TVFNa1N6WGlSMk13?=
 =?utf-8?B?b014MExZU3Uwemtnek9ncnIwQ3ZETmpaN3A3VlJBc21rWjJld29pSjRIMkh3?=
 =?utf-8?B?MWxXTXZLanM5eE5mRmU1UE9qZFhubW5rK3RjNll6TWN0MWMyQ0MxR0RFWHNG?=
 =?utf-8?B?SjdxaERpODFuQU1VUkdwSm55RkRhQjBXTUxqMDRlcDEzQTdIcm9odUZoNE9G?=
 =?utf-8?B?Nkc2Qno0R3VCY1JsNnlPV2JkTER4bDYvUE93UU1DM1Zta281WWJxbllJS29Y?=
 =?utf-8?B?RWJaMmwyUzhBa0xzV21RMzZNYmpXRzJka25UamdCeHVGZjRXcDJYMk5KSW5R?=
 =?utf-8?Q?a/UvknKFRR6CNwYTJJmF6t9t7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94865006-e37e-4b58-0dcd-08dda26607cd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:15:26.2347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hh8cIC5EKbdLee59ycZjo7XRpavHjJmlF9c7oelWXCaJpm2Iy4mK1T8/8xtO9bi8RpLlpwtYoKSo2bTWQGHajg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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

Hi Lucas

On 6/2/2025 9:54 PM, Lucas De Marchi wrote:
> No need to create the path again. Just make sure there's such attribute
> relative to the fd passed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   tests/intel/xe_configfs.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index e5701b7d1..074cd04d9 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -43,16 +43,13 @@ static void set_survivability_mode(int configfs_device_fd, bool value)
>    */
>   static void test_survivability_mode(int configfs_device_fd)
>   {
> -	char path[PATH_MAX];
>   	int fd;
>   
>   	/* Enable survivability mode */
>   	set_survivability_mode(configfs_device_fd, true);
>   
>   	/* check presence of survivability mode sysfs */
> -	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);

This is the file that indicates that the device entered survivability 
mode. This is under /sys/bus/pci/devices/<bdf>/ not the one in configfs

Thanks
Riana

> -
> -	fd = open(path, O_RDONLY);
> +	fd = openat(configfs_device_fd, "survivability_mode", O_RDONLY);
>   	igt_assert_f(fd >= 0, "Survivability mode not set\n");
>   	close(fd);
>   }
> 

