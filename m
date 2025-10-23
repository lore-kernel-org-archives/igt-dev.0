Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A8ACCD1BC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 09:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6471910E370;
	Thu, 23 Oct 2025 09:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxGwr/aR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE7410E370
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210645; x=1792746645;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7v7MhAeCPl5L5Qw/pj1w5aeEzaL2ERqQjeyNxY3xHh4=;
 b=QxGwr/aRMA8YBI2Cd7cBoBMQfDy8aesQwDzt3RxV9XrLO+IcXPLhgyaQ
 Q2oz3C4HdNuXO6zoaojSldK9eHvZlwzrdkcfWlaw3hFC9MadndzMDy76q
 +ERAnpTjfd9QNvv/mnGM5djwWSCMsRC8X15Cl0fYUSlSNfjIQRVQmxUGn
 KySXMsA2bwry/H5ktIUX9MB/jV/zNlPJ7c7Gi1OMVIb4r2mtDXntC35bJ
 iKSMpGW/T7e14en37FlkhawMr92DjCimqnfYuzV6uZrvdFwhM0awGPf9V
 id9D9sSCw5TryFfXSH+phnzgsuLo5WWCfs6WUxzn1QGq7Xj3dloYPihpu g==;
X-CSE-ConnectionGUID: bPaKP5xrRJ2x2bHbEusqDA==
X-CSE-MsgGUID: kt9OOFoHS2GBMdMnCx2tjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63413875"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63413875"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:10:44 -0700
X-CSE-ConnectionGUID: VRdnLxa5RySsoNeswwVfOw==
X-CSE-MsgGUID: 3MUc9TmiRbuPZ1Afq7qMMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="189237232"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:10:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 02:10:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 02:10:43 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 02:10:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJ7JICjM6iMJim6thZ5RX0BEaPcFwRyW0SGy88GSJ57MY4WVVtnIAXBWRemm2zXY5sM9rhDJ4T2o1gemEIaSnxrzNi2YGu58k/F9UA39sVnQ/Mv6NAy4hctEsO69tlMPwRsUYbsEkgbQWmY6aWvhyFCWEq9Ihs7t+AsreQkl0lBGMh/n+kqy3hlJKkFasQ+lwJVAPtsoeDZqvlPQrecfPkVsdvayILIygV0z/Bho8xJOQBXIIzwMoVFtQOOKy92swF99fuIe6cFQpGUGtfDu1bMuSefKaj4BIYIzGxzUZWg/9ZYwzP5UWBfDQcGdGS8SosdvxgD2sYJqNRgSGhNWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzleeXJtC33u7GniHrV8SJruZ+8TW8Z2j7iM20NeCnI=;
 b=QdjzJYw2hgXo87UA8GkcqS0lSpj4tOjBfdcshf/Q5X0kg8DC4wj68xzkDpiAm7uZKCCoZGPQ2XcMxvjjtEAjB5KUgbFzBCm0jrD+0Sf6vzczodQZIj/esZvJuRwzdyiXNBsFsPooPGY3sjumSQ16ukBXhrlTeEMgF3WHm25KJe8ZEUVfn4tNSQPzN6XLK9/Z/DdKOLGifzFoCwAmpQF/tEkPbHnzaWyDuoTqTnKzxnWykXtxr70lGOO5lNhf+RYT4OsDCcIqS/1fE89/wUeiXg55ILrwndt8JvS8BSFRyK1Qew3zQaUH1X4v6yVQGDhd/HCDjeH+ws6WSgkpME9t/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL1PR11MB6049.namprd11.prod.outlook.com (2603:10b6:208:391::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 09:10:41 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:10:41 +0000
Message-ID: <5c496e23-242c-404d-912e-3b38b34459f3@intel.com>
Date: Thu, 23 Oct 2025 14:40:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v6,1/3] tests/intel/xe_survivability: Add new
 xe_survivability test for i2c adapter
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20251013194910.1065392-5-sk.anirban@intel.com>
 <20251013194910.1065392-6-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251013194910.1065392-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL1PR11MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: e47da006-49dd-4240-c729-08de12140a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGwrQUpLemhUZFZWdlRXcWJ1cVhmV09hbWFnaXYyMVU3bnE2NHR1ZGIyajFz?=
 =?utf-8?B?QjhuR08rYXNZdVVJWDFiQ21CLzZXWEJYVWNHbnZHcHdQNGNkZzFUbFYrZEJh?=
 =?utf-8?B?K3VLRzluQkNHZ2VSTlZKNHZiRUNwNzdLaFVpYjhTM2Z2NWpacVI5UlZkdFgz?=
 =?utf-8?B?RFkxeHplWWg3dmFUTjdwcjljSU41K2s5NjdEbDJVb21jcnlEcmFyc0ZWU1pm?=
 =?utf-8?B?aWI3ZGc4TVp2b0VQaGV3V1BrNnBudzE1b0tEZXBwcUppMXI1SkdldndoVXdq?=
 =?utf-8?B?RVcxUjFYdjFwQUZldFdoOUI1Q0ErRUp5RWsrTW5TWGJ0bFNCUFV3N2FqbHpR?=
 =?utf-8?B?NDAvVFpDSVNRdDl4ZkkvSkFEL2pvN0ZYcWk4cDEvbC9PNkRITG8xWFV3a0Rl?=
 =?utf-8?B?dGZlRU12ZjJsVXg5L3dMQXBVWHBxT0JPMUZXRG1RYkxJVXRULzhJMm1qUXlw?=
 =?utf-8?B?empkL3RZMEVlV1hxNWdmSFFyRk9qWlExU0I1NTJOMkYrMXEweDByU1ZIWEZN?=
 =?utf-8?B?SFFJRkVjdTJ0bDVkWXBGM3VLWW00bWdsUVZXQXVhTDdYSVZKZ2N1cGVkamVG?=
 =?utf-8?B?ZkswVGVGUHFMR29XaGgyR2xYdVdxai9SQWJieGZLR04ycWxWNEFJUTlsWElE?=
 =?utf-8?B?Zy93MVRvSHJFeWxQTzRMV1VtdWhZQi9BY3d2TmhuZGFDeGhyOWNKd3R3SCs0?=
 =?utf-8?B?VHFYVks2TCswUkpxQ3JFRXFVbWdHd0J6UzVoamJBM253a29hWWQ5Mm9LcXFN?=
 =?utf-8?B?bHpvemR6RU5jVjRrQk9ISENHR1FsVktYSjZPd2Q4dFhudTB1ckdqMHY5cCtk?=
 =?utf-8?B?eGZWeXpxRnU2Nk9VM1FNTkQrOVJaUGNRbTNFbTEzbnJvanJiYW13QXpzSHpL?=
 =?utf-8?B?c0ZQZTViYnc0WExBa0pDRkJlRU9OVm9IeThkRS9mMithR09tOEtNZGFpeE9Q?=
 =?utf-8?B?OFBNcGNmcDdQdW5jczhDeHpOeXhJRGRzTnU4dlVNMlEvU01ZUjRzOTJGcjhr?=
 =?utf-8?B?Zkh1TDZBeDhVcGszWEhWQS9LVGdtVUFQdHBtcDNPRXNCdlZIT2QzV3ZMWUtH?=
 =?utf-8?B?S0V0OFkwNmJETE1ISHpJSlVMcHhHR255YU03NzY2ME0wdDRsak5jWnNJUVZk?=
 =?utf-8?B?OVQ0TktleFB6ZS9DUmJKQzRhSTQ0OUg1eXJ0N1JXV1A2eGhaQi91NWtMbkRp?=
 =?utf-8?B?aUtCS2o2RGZURStFR0YwU1VTVGFGUDF1QzZWc040TThKYkZrSG1pYkpmWFYw?=
 =?utf-8?B?THdEQTZGODIyN2tOc2ZkZmhLSlM4L2Z5eXJxK0RWRzFsblE1UHFXdFlKaGsz?=
 =?utf-8?B?SVY3aHgxMEFrbmZ6Y0M5dW9HVEs2a2RFZTBQemRMc29mUVp0L1FkTDQ0bHov?=
 =?utf-8?B?WlVtNG1tbXYzNjh4a0kzN0pYREMwTWtTejRFTVQ3cHZyZXljTTQyYS8zMVlX?=
 =?utf-8?B?ZVRvSWJEMWFlaGpUeURWUXFJTU5nTU5KR0RoY3h1RnZHbzhmK2VqM0w3bjk2?=
 =?utf-8?B?VWV4K3FRYXllQS9HN2pUM3VUbHFST2FQQjV4UitWbEZReWllWm5hS0l1OEFK?=
 =?utf-8?B?OHZtQnF2OWhMTklaNEZDMmVvTkFiL05jbWx5OEhYR0RXZG42QVFna3FPd1Iv?=
 =?utf-8?B?bFQ5bWMxaFhoRUpWTDFsaG5PcnZnYzNCNXRacjFBWVhTS25pRlh5aVVrRUQ5?=
 =?utf-8?B?LzBxY0M1b1Y4OGRySDVxY2NyLy96V3hKS2lacm5ZOWkweU9FN3d0dmxQV2dl?=
 =?utf-8?B?dmprS2tqSE02VzZKYzhyU0t1V3oxb3JpMTM1c3ZHZzF4VytJUDhrTG4zUGFB?=
 =?utf-8?B?NlBReFJRQW9UR0xNOHhHYXRlMjNKUVVKb0dXWHRFcFhmdzBnZWl1TVJXb2Vo?=
 =?utf-8?B?TnRxOVVBczcwMXpWdFNnZDh0UUpQK2NHOEJrTEJsa2ZuUnRmRFh1VlYxVnJK?=
 =?utf-8?Q?vmoTQLrx9whxoEle9u7KOBf46nQYY/PJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0F2eVd4ZkQ3ZlBYV1pqb2NlVDJKRXNNaDIxN1o4cVQyakIyREhEV2owM1Av?=
 =?utf-8?B?UDNKbUdCanQ3WCtCNktzemtiZFBWaXRNUWk0Z0E4T1psUHNVQWFHVkh4ZWRn?=
 =?utf-8?B?QmQwNWZsaTRXYkNXSkVGUVF0Z0ZuMW0yNXVOOXJVd2VYOTQyTmlSWmNpWHZo?=
 =?utf-8?B?WVJPNGNMdEtCS3JSd2FFS29Qa0pjVE4xSVVFSE1mM1ZOa2E4VGNQVlI1MjV6?=
 =?utf-8?B?U2R5S01ta2E1RFlGd0xRdEFwaDBVajRVb3lyQzhsRlNlTmxGUXhDUXNIYnIr?=
 =?utf-8?B?dmZyRDltbFNDRm5mcFBoS3FLTDFocGF4bnlGUU9NdVlGeU9SUUxZSHh4ZUZi?=
 =?utf-8?B?TWhCVVlybUlNK0lHaE1kSncybmU3cHowZVE1NWlmcERxTDlZVnJ5RzY4OEZ6?=
 =?utf-8?B?YW1MZGhXaWpEck1IRVF2dE1rMXM3NUNURktOSEc4NzVVM1crcWZLbmtwM1dY?=
 =?utf-8?B?Y1hPck1CMHhIM0lCS05LWlNCNU53MHU0N3hZY00vbkRJNUt0bFoyWVB2c2RD?=
 =?utf-8?B?UThqeUxxS1ZsaGdEQ2Q5aU5jWElXdWplNGd6cUt0NVUwTWhvTmtFdll4WVIx?=
 =?utf-8?B?ZjhPbW5vbWh2Q1pqUTRLZUI3RndqNlZvU1NOZmhSZUpxY1hNdzVEcEc5OW1q?=
 =?utf-8?B?UVR4L1BYdkhJMEdIYW9UQ1d2WEJhVTNBVzdtTG41RWdpZFlwVW44UUUvdnRO?=
 =?utf-8?B?Q01UM1dvemhJNVkyejc4VG1KMzhZeDhaKzhjUUlqTDdYY2YyYnZESlFNNjBK?=
 =?utf-8?B?RzdET1lXcEhJYlFyOTk2UzFvSlJrVW5sYng0enFvNUlHYkJwUXdMR0E2YlZl?=
 =?utf-8?B?R0tFLzlrb3o4TkJ5elFWSFNiMUE2QXJzMlBNNy8wdTY2Ui9EQ2JlMUZFaUU2?=
 =?utf-8?B?T050R1hWQVFsRklhOGVGT0IrcVcxNXkvZXVMblNPVzQwT3pMcUVVZE5tMUg2?=
 =?utf-8?B?ZjRPcWJHMkhsOEoxRS94TjNXOHFBejlzR0pVTmlHTmRMNUZSbHFXUHNyNkl4?=
 =?utf-8?B?ZG9HS0t5RDhGdEhBbVJ3RWZwUFY1NjcrWHBTVVR4QnRjU1J2MmRJM0Nsdjl4?=
 =?utf-8?B?US80cDZkb05LS2pnTTdsdTZINTF6dklSSUxuVUdFVmVmZTRNNzFJV2tQVDBn?=
 =?utf-8?B?US9NQ2JOL1l2UkxOcVJJWlZQVmJodjYxM1NXVTJIdnltdUNwQjhQOXBSa2M4?=
 =?utf-8?B?RkN1VjJuYThRTHF2VUV6T2x0SnNuQzFBemx2OGhXeUIyRkhyZlpJQStmclZO?=
 =?utf-8?B?VExIUDljU2xpRVM0UXFBaWJWYmtRcEcwUDVhZDQ3bXcvMGxrQmNYNFRndDRk?=
 =?utf-8?B?VXEwMVliTHhXWld4WXl6WE9SQlJsNmI4NFdFdGVZbEIxVW4vQ0E0UmZrMDJn?=
 =?utf-8?B?aTI1N0JVM0pPTEl2M1F1QUxBcUdqYVJBZHowbzFlTWpIaVAwUFdleEM2MHhB?=
 =?utf-8?B?eEYveFNmcHNpSXowTGVNTjh6YVpXMFNBVytndFZLTzBxQ3hNdDJDT0pDSUZt?=
 =?utf-8?B?NEVzRWNPVS9jT3M3bG9NMjFoOUJ4dEpvOUNMa2x2SExaa0Y1SURzWHU0aHUx?=
 =?utf-8?B?dVkySWRvbmZXNWZxVFpZSjRkbFZmdWFBY0crWWRoWGJOc3A1L09BbldldTdv?=
 =?utf-8?B?WUV0d3htcjM4VW1Qc1hWYnlvakVET0dmYVd0Znc5Nld2Mk5nSS9Zc0k3MU1t?=
 =?utf-8?B?NU1BM2FxREFaa3lQMk1hRDJNOEQ3QnN1Ri9kbmlrR0JETkZORFdGRGxwKzVn?=
 =?utf-8?B?TkhWYUNsT3pNeG9MRUNJbnM5MkRrY0MxaVVtdjRsSVZhMW5UNFVOamIwUVlm?=
 =?utf-8?B?WXlDaXZTemhOYTQxb0grdy9ZSVFnWENPMFgya3NHYnZibitleWIwT1k3bEFv?=
 =?utf-8?B?NTd3RzMxUm51d0lIV2lXQnA1NVgxVTNLcm8rOWZVRk5oSlI3Y0hZb1BJNWho?=
 =?utf-8?B?V1JMYWY3bEhpVWRuSWRaeFJzQVRrcUtYeGVrNnhObjhpUll4Nk1tUGJTejZK?=
 =?utf-8?B?Q3JZdEViaVlXeGxhM2k5UHk5RFhoS0MvckxRaFJHRGt6SWxaRUw0bTBDak1j?=
 =?utf-8?B?WnJlRUpQK1hIS0tUTU96WG9FUnBXQlNKL05FdE5xL2IwSGN4T1k1cFVMRXVK?=
 =?utf-8?Q?ljWo9/w5ahTe3DrKqPwTWXvvY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e47da006-49dd-4240-c729-08de12140a22
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:10:41.4038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42yiIlLp9LF4W267Z0gt62vz65GudZrVFcleD31UIDvjUPpxk1BPN4fx+Ql/J1sspMgnFWTk1Vek6xYgf+LZhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6049
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


Hi Anirban

On 10/14/2025 1:19 AM, Sk Anirban wrote:
> Add i2c adapter presence check in survivability mode to ensure
> the Add-In Management Controller (AMC) can receive firmware updates
> when the device is in survivability mode.
> 
> v2: Create new file for test (Riana)
> v3: Update subject, description, nitpick (Kamil)
>      Use drm_close_driver() (Kamil)
> v4: Update test details (Riana)
>      Align with xe_configfs (Riana)
>      Create separate function for sysfs (Riana)
> v5: Remove duplicate close(fd) (Riana)
>      Modify fixture (Riana)
>      Move assert to function (Riana)
> v6: Move VF check (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_survivability.c | 155 +++++++++++++++++++++++++++++++++
>   tests/meson.build              |   1 +
>   2 files changed, 156 insertions(+)
>   create mode 100644 tests/intel/xe_survivability.c
> 
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> new file mode 100644
> index 000000000..e4418361d
> --- /dev/null
> +++ b/tests/intel/xe_survivability.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +
> +#include "igt.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Comprehensive survivability mode testing
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Telemetry
> + * Functionality: survivability mode
> + * Description: Validate survivability mode functionality
> + * Test category: Functional tests
> + *
> + * SUBTEST: i2c-functionality
> + * Description: Validate i2c adapter functionality in survivability mode
> + */
> +
> +static char bus_addr[NAME_MAX];
> +
> +static bool check_survivability_mode_sysfs(void)
> +{
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +	fd = open(path, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +	close(fd);
> +	return true;
> +}
> +
> +static int find_i2c_adapter(struct pci_device *pci_xe)
> +{
> +	char device_path[PATH_MAX];
> +	struct dirent *dirent;
> +	int i2c_adapter = -1;
> +	DIR *device_dir;
> +	int ret;
> +
> +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
> +
> +	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
> +		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
> +	device_dir = opendir(device_path);
> +
> +	if (!device_dir)
> +		return -1;
> +
> +	while ((dirent = readdir(device_dir))) {
> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> +			ret = sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
> +			igt_assert_f(ret == 1, "Failed to parse i2c adapter number");
> +			closedir(device_dir);
> +			return i2c_adapter;
> +		}
> +	}
> +
> +	closedir(device_dir);
> +	return i2c_adapter;
> +}
> +
> +static void restore(int sig)
> +{
> +	int configfs_fd;
> +
> +	igt_kmod_unbind("xe", bus_addr);
> +
> +	configfs_fd = igt_configfs_open("xe");
> +	if (configfs_fd >= 0)
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	close(configfs_fd);
> +
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void set_survivability_mode(int configfs_device_fd, bool value)
> +{
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pci_xe)
> +{
> +	if (find_i2c_adapter(pci_xe) >= 0) {
> +		/* Enable survivability mode */
> +		set_survivability_mode(configfs_device_fd, true);
> +
> +		/* check presence of survivability mode sysfs */
> +		check_survivability_mode_sysfs();
> +
> +		/* Check i2c adapter after survivability mode */
> +		igt_assert_f(find_i2c_adapter(pci_xe) >= 0,
> +			     "i2c not initialized\n");

Clear survivability mode here once you are done. Otherwise any other 
tests running after will enter survivability mode.

> +	}
> +}
> +
> +static int create_device_configfs_group(int configfs_fd)
> +{
> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +	int configfs_device_fd;
> +
> +	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> +	igt_assert(configfs_device_fd);
> +
> +	return configfs_device_fd;
> +}
> +
> +igt_main
> +{
> +	int fd, configfs_fd, configfs_device_fd;
> +	struct pci_device *pci_xe;
> +	bool vf_device;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		vf_device = intel_is_vf_device(fd);
> +		igt_require_f(!vf_device, "survivability mode not supported in VF\n");
> +		pci_xe = igt_device_get_pci_device(fd);
> +		igt_device_get_pci_slot_name(fd, bus_addr);
> +		configfs_fd = igt_configfs_open("xe");
> +		igt_require(configfs_fd != -1);
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		igt_install_exit_handler(restore);
> +	}
> +
> +	igt_describe("Validate i2c adapter functionality in survivability mode");
> +	igt_subtest("i2c-functionality") {
> +		test_i2c_functionality(configfs_device_fd, pci_xe);
> +		restore(0);

If we add another configfs test here it will fail since you are removing 
directly.

Add close/rebind like runtime survivability

Thanks
Riana

> +		fd = drm_open_driver(DRIVER_XE);
> +	}
> +
> +	igt_fixture {
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +		close(configfs_device_fd);
> +		close(configfs_fd);
> +		drm_close_driver(fd);
> +	}
> +}
> +
> diff --git a/tests/meson.build b/tests/meson.build
> index 73edd3e71..31487f62e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -329,6 +329,7 @@ intel_xe_progs = [
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',
> +        'xe_survivability',
>   	'xe_sriov_vram',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',

