Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12596C5B552
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 16:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C180A10E3C8;
	Mon,  9 Jun 2025 16:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTZ5FDUc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD2310E3C6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749487162; x=1781023162;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hx0rTD45ddf36nkr6mNASsMwICJ9VMg+zKPkytcYdZc=;
 b=gTZ5FDUcMlWHGopHInmy5AqSm7HRJZRUSE8Mr0rvl3S0iWMFIZsXy7oc
 i/cICUsXktw5I1ZzRNn1uqtFP8Fqp4jD8Ngri7XBB6KNg+eV+xJsxN03J
 FYTbUb6qsZpaDIL5SPYXkws32GT5wupvYsW0xhr8A8etiTsjU/ItvuI5L
 zYRn+Pg5Koq5wlZveIriwgvSImB4TgPBIbxsC+to5JJM7FvzKBAc3eNDR
 jZAmEapNKd6lV6HA9boJo9t3t5gUj4i8xwF7NpnCGrjh0XIN0FsvDTy1Y
 70B1OFzTfxwGIE/LbI7FpH3VyJOAPVpvpbEXUdYYaXgzNmx9qf/IIwz9Q g==;
X-CSE-ConnectionGUID: p0E1VFesQBqqUml0GezyNg==
X-CSE-MsgGUID: 3o++UldqReKLddXC6w0QXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51712024"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51712024"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:39:20 -0700
X-CSE-ConnectionGUID: FQGaE0czRgmlqQDPdRldvA==
X-CSE-MsgGUID: Cqr7upp+SaG7/wRvpZ02Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="177502361"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:39:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 09:39:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 09:39:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.41)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 09:39:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpnosGXyY3S4dPkOoCJQa35Zy+rPOO4hP2CAOzXCk/chA61svMsRHriiiiU1EI5179sxCIPrEUF9uyPJVhNTNePKF1WWgc0uNWn4FMUyOE34m+21a0RBSJ0ffzHPpi/6P7AK4Cnc567mWKVkrGz0t/4Uvg9qvohF8fzD+LNM58uejElz+hwxutL1eeyITQW6X/OTS8M3GsEWwLBSzjXR3dNWRPUU/jbdM3vwseMKV5H6Twh3/y12VVxw690bKVaMnLjccj4fQnyDVT2mp1qpv+Uw3CTcZd2ylr5BAO7bnhBou1ZK3wBKRDgAbSXcs1n4zV0hjBMwhZErnIzCkX+trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRLBCaPm2mNKgA9iXWy1YLyEIv9WqXIdyeNEuSwoP+s=;
 b=qoLehXc7pw26Ke16+hNiAPKkhe9XM/TB9PWS2wQHWupZx/4hIqT8PKvj5l9CUvTWx0iQ7GsiH1rm/NyR/N4nKL2gO3Z3fH7oXYv2szvjUssagsEib6y94m3BPiKEs/KcPZpUDMM5FpdmTNmVXKhJs1CijX9iM4OdW8hbCjC0kbvEyKCghly3Cxs6zfzcBmC4aC6e8LZV2kWShpvwhmyn0bZEh/fbk515d4Qa/Jq0v2JcKHxTzLoj/usBoOrhCUAhI+enmeDEMw2koZV/1aunh5lRAsaDoFLjrq/ryEEI6LGd3w+Ku+c0ab0EKDYL8zNWFT5MobqrPULFA40HUfCwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS4PPF00BBED10C.namprd11.prod.outlook.com (2603:10b6:f:fc02::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 9 Jun
 2025 16:38:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:38:34 +0000
Date: Mon, 9 Jun 2025 09:38:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v3 2/5] tests/intel/xe_pmu: Validate engine
 activity after suspend
Message-ID: <aEcOCFH1kP8JzwwR@unerlige-desk.amr.corp.intel.com>
References: <20250606101008.1949955-1-riana.tauro@intel.com>
 <20250606101008.1949955-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250606101008.1949955-3-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:a03:54::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS4PPF00BBED10C:EE_
X-MS-Office365-Filtering-Correlation-Id: f6564ae1-e310-43f6-1c02-08dda77413b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFB6SG9ncTEzcWZmWkJzNm1HNktIRC9iNnA2MTFKQTJwYnZpZ2diOVBNS0c3?=
 =?utf-8?B?KzY5Q0hiUGRUVDV5UU5SNVNXdlR2UWhZcGVVcXZSMVkwc01NcXNWRUNUOUFU?=
 =?utf-8?B?bm9IVEtIWTdSajF0K0VFU25ydmRZSjR1UUVTQWVscGpDc3VEY1Q1czlxZFNC?=
 =?utf-8?B?SUNrclFWSmZCblJvWFhkSTAvZGVQb05LS0IwbSs1NHVQWGwydzZUcFNZUmRK?=
 =?utf-8?B?c0RFV0F6Y1JJVU5BdUo1dlFUeEhMTDBQdTRVRi96Qzk1RDc5Z1VLa2U4U2NB?=
 =?utf-8?B?UTR3Ym9WQW1YNWZaN1cwaWxjaG5pR2ZZQmZGQ1pMcWJMUG1Cd3kwZDJlY1hQ?=
 =?utf-8?B?MG9icS8xQUY4UlkyOEZTUG5kanl1Y2dsMWYvbldvN2kyeld4ekh6NmN1V2NX?=
 =?utf-8?B?MEN6L1dOZmdvY2xsai9OSlh6Skg2dndaaG1JMm55Vlo4SytaaTdWOE5ycStO?=
 =?utf-8?B?bEE3SnhBV3M2Rkc5endHUzVtUUhocTdOdXg3MjBlMEFRa2hCd3FqYjIyOUxZ?=
 =?utf-8?B?RHlTbEI5b1FRUHg2WFNUNFYzQS92dG0yNFFRT0pGMURGRTBoaWExWHk0dmpp?=
 =?utf-8?B?N0ZsLzVveWJFYlRiT1VRaHAvdEdXK1NhU1YzMVpzNjNSM1Y1c1FjeDR3QTN1?=
 =?utf-8?B?V1hDbVY4REsvME1DT0ZWRk1sZWdQVXFYMktyeFY3andKdVdLWEM0NHVaclIx?=
 =?utf-8?B?OE5Vclp6Z1RyVHJ2TGRQb3NCcU9NVStoSkVSVzNuZWxqOTFpaFptSy9rbUlO?=
 =?utf-8?B?aTIrS0huU01JNEY5ZFY2aDUwS25iVE8yT05KSlZsY210VHNKc2oxenFrcnhy?=
 =?utf-8?B?SCt0OEtmcUUwQzJ6MEJGODN5Rmdrbi8wZ0Y2aDR0dzJabmFtTHYwOGFDSmdi?=
 =?utf-8?B?bkNLQm0rM043UER5SDZrSHpwODJ4cnhUZ0pwR2lSQlB3UDk3d3lLWkdFbHZM?=
 =?utf-8?B?blVEQzY2OHZWemxhV0JFdzRoZ0Q0ZE5Wd0p2UmhJMDJlRDEyZmgvUEE3OUt3?=
 =?utf-8?B?cDhzdVI3REhWT1YyeTBENU81cUxjam0xQmwwL0tjZ0M3VEJMV1JvSWo4U0Zs?=
 =?utf-8?B?RFc5NGRRRVE3bzk4TXVCajlyTUpQdE9OcXJRMENDZVl5VWVUbElEcmN4cnNK?=
 =?utf-8?B?ZHhTNjNrT0M0aFN2Wm1uT0FIczRXSitkeks1Qm9RdW5obVprUGg5SFA1SFNr?=
 =?utf-8?B?OFJaL3hlWUkvY3o0R0ZxOG5Eb0xoU2lRaXgycUxWNmUrdTlLangzN0dPUXp3?=
 =?utf-8?B?U2xPM0E1blljZWxKdE1HdGp2NStEeVlrTysxdjNEZ04yRXdQYmJ3MU9vTDVv?=
 =?utf-8?B?aEJGTXZYaVVNRWxVbFY1bmhFUUdsVXk3VmlYZzd0TitMWCtlNjlCMEYrQWRx?=
 =?utf-8?B?NkNySWNsWEpYS3JVRFptc0hQeG5peU5OQ0ViS001N3EwejJwZzRHREVUdk9S?=
 =?utf-8?B?MWhSRnYwek9iRTkrV2lCSzd5SFg4NzRCU2lXQXpkejVkUjNQVUl3aFBaSy8w?=
 =?utf-8?B?bENZalQrME90bXN4ckd1WlFkS3ErN0dWRDhiWnlCcCtpMk9LMXFHL29lQmx0?=
 =?utf-8?B?RzFoZVFEMEFtNlFXVko5V0Y4emJoMzJFUnZqNU1lbnp3bEhhS3ZoMlJQbmlt?=
 =?utf-8?B?ZXAweHhZRk1BUDY1WlVwQ25lMGtNWGFWbWZTdUd4eW90dERwejdUMnRqck9z?=
 =?utf-8?B?ajJ5ZWlUeWdkR0VRdkZjbFZ1WWx3NmgrVWFvbThuYncrSmpCRWlTU2ZUclJs?=
 =?utf-8?B?MTgrQ3ZCM3lmUnp2czZ5OGFOQ09ma0U2NkFJMnhvcXloM3pPRnlOSEhLVXRu?=
 =?utf-8?B?YnJaN1VSY2NBNGMxWnJCYzl2aWZ1emdiQmdvOXBBYkcwY3RHU0hzL1FXYm5Q?=
 =?utf-8?B?YUR4dFFwZmFBTU9pTlhZSkxEbUF1Z0pGaVo5ZjFXby9HaGhzK2l1bnV1L2dP?=
 =?utf-8?Q?gqSmXuCu+so=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1Zmd09qSmZtcVAzdlZ1Y1R2c0tpUUEyL0R3TTBWU3ZkY01MYlQrRWd5cVF3?=
 =?utf-8?B?SHNPSitERjRRY3E0YWhpb2ZVNEtxa2IvcWluM2UvUWRVZWEvY1BYQUZFZGZX?=
 =?utf-8?B?ZkIzc3pUNkhPWFFCYlRmQk1PY2E3Q0tHZHl3d09vNVVYVGJKUG5aSVNTRWlS?=
 =?utf-8?B?UkRTMlduNVJrQm9qeEJEcUpTRlpCU1RZMmdaL1o5TlJtS3hFUzlEeWQ4MzFy?=
 =?utf-8?B?S0JFQmptL2JMbUt6b1ZWbVo4YkRzVXZtK2M4NHNxK1o0MS9zVU5tZkJFKy83?=
 =?utf-8?B?R0ZhRFY0VHlYME1uYS9QeHVlRTlEYk9PZ2RkNHZ2MFNxTFBReUw2ZFN4Wm9t?=
 =?utf-8?B?RGRaMXpheGN1bkxUSGsveFBQc2lOZ202ZUl6RjZZOUhERjVoNGZZUk9LRVNj?=
 =?utf-8?B?TGtJSWhMTlhpOHpPR0VuclVzOGR2aGl4MTZXOGhZdmxBS0QxVnpCWWQyZG91?=
 =?utf-8?B?Zlh3QWlrSFF4ZEl4UXBaSjlreUZQTDlueEVFczJCeWpPUVRxd0FiQzZBTkdI?=
 =?utf-8?B?Rk9tQzFqekJKUkFXWHIyYTU3dzdIeGlKV2NZZG1mUDhnNXEwdkNEb2QrU2hm?=
 =?utf-8?B?M3U5RWF5Z0x0dnArWmtKQ29nektacXI0UDQyaHBzOW1VTHBqZVF4UHJyTXA2?=
 =?utf-8?B?UldTQ2c1dzYxQ3crdDR1WkhTNEhGUFd0ZUhOMXN1MXAxSWpxdE9RN2I4VmZ5?=
 =?utf-8?B?QlQyVUlIK2JTenYvSlIvc3UxdE9wTC9kZ1VqRkoxSUxkL3o1NTZvSlVNcStm?=
 =?utf-8?B?TlZDeVBBVy8zRFBwcWpxMm8xOXF6ZE8zVzM3U2g3d0FjSy9FTkg2aXlwN294?=
 =?utf-8?B?NTNoai9ZQ2dzazQ5Wmp1VjR6SEhrT3hMbkprTDN2Vm1sdmRXOE80NlQ1R2t4?=
 =?utf-8?B?NjJxWFFPRDhuckVVeWpGM1VEQUNrQUo3eVlvVjJzeUE0VUxRVldGM01rOVJp?=
 =?utf-8?B?U0JCb0piYTRRdUxIMzlqUHovVWNnQnVOVlYxQ2lhd3BSZkpqSjRCQ3BTYWI3?=
 =?utf-8?B?Y0d3dEtHL3lQa1NrVXM3Si9QSmY0WHBXelIvTXJ2aDFwbHcwTE4wMnhFQkdl?=
 =?utf-8?B?T3BtemRrMmpPenArYnI1SjNyV29NRXF2b0RsZFNHQ2tKY0VHMEtMU2ZJV0o1?=
 =?utf-8?B?SCtCVi8zOUZsd2t5S3p6OHR1OFBoOHEvNWFKYjJLcjc4eFBUQVA4U3luT3kw?=
 =?utf-8?B?UEVnUk5XZk8xM3Y5bUlOSzZsVldTdEJLK0xXeGFpcjRxV25Ta3djT3JLQVRY?=
 =?utf-8?B?Z01xQXhNeEZxeGdrYzYxdTdRRkZtV3l2Wlg4ZlFrbGZRd2pyRitsRDV2UlFS?=
 =?utf-8?B?bEwzanE1RFJHMWNmN3JPSjRQZUlwSFNGRFdQcVZsRkVsdFdpa3lZb3dGa1Zu?=
 =?utf-8?B?am9EVHh6WXY4VDJYeXRWK0xIN1lqc1JhcXdpbUowRVp1T3JLaFR0RzRQM1VI?=
 =?utf-8?B?dEg0RFpCbzc3bmdoRHJoRTh6WmNrOUtxeTdUcjgrQzdhazFpUEg5elZjQTNk?=
 =?utf-8?B?dE44WCtrWnlMUVVGSjdjNXB3bm1ncTNNMmJzS0psZmt0dkNnZDA5ektucDlm?=
 =?utf-8?B?SXQ2WUN6d2JRRk8xUDB3eWxieHR4ZnRaZDEyR0xEMURiU3ZkWFJTNm9BRFls?=
 =?utf-8?B?Zi9BVUE3Ui85QlQwaXZBNzlQc0dxZ1BRUHFCS3JocWsrRUlIUVFHckxxV0ZR?=
 =?utf-8?B?OE1ZVExGN21xM01DMXUxQ0FjSnkrbnRhaTBGWlFkbDZOb2RWdGVhcVZ3OGVT?=
 =?utf-8?B?RytYZXpkeFdyNTRTL2ZqeGlnbjhzTzFKTnVvT3FkNElZS2xGV3BUSEJqcWFp?=
 =?utf-8?B?eEdhcTZleVF1TjhFMFVhaHczRFZQSDM4bUh0QWlDVUZXMW96bWh6eFI0V0Rr?=
 =?utf-8?B?bWpMOXRKNDRUWjM2MVhzTXk1WTR6RmJIekxjTmdENURXZm1OMFVKSlVnQlJp?=
 =?utf-8?B?akZYVGJoNFFyWjJ5TSs4R3ZjaVlQcGw4VGZQTG5ibTJaMXc3cjZwS1JORi9J?=
 =?utf-8?B?Y0dsbmV4MUtxOWVNMXZhOXRwdnlvMGxCc0RjbTNYV1V4RjBNVGVlWXdzUGpF?=
 =?utf-8?B?NWJOZ1FER1JXc3ovMW9tY2xoeXRMMk9DNjZFZXIrOXh4S0tqcWM2ZkpmZmpE?=
 =?utf-8?B?TXplNGdUMUYzV0Uyc1J6Q2FIZXU3cUd5QkN1RGJuTUhQSytPMmdyQU9DQ2FJ?=
 =?utf-8?Q?PmB3FDYQiR3ksPszfPucsS4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6564ae1-e310-43f6-1c02-08dda77413b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:38:34.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QXyXoHteNDbDllzELKHyIc6f7kS+iTB+QBxFbuGKLa9hyjjYGRx50tsPkvnPRLDh/yI/hf+l48W8/DzmPvynY7ANKwK7ZVNLSE5eRRfsE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF00BBED10C
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

On Fri, Jun 06, 2025 at 03:40:05PM +0530, Riana Tauro wrote:
>Add a test to validate engine activity after suspend. This is
>to validate if guc action for engine activity is sent after
>suspend
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_pmu.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index d9b0d2c96..e6afca9c4 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -46,6 +46,9 @@
>  * SUBTEST: engine-activity-gt-reset
>  * Description: Test to validate engine activity on all engines before and after gt reset
>  *
>+ * SUBTEST: engine-activity-suspend
>+ * Description: Test to validate engine activity on all engines before and after s2idle
>+ *
>  * SUBTEST: engine-activity-most-load
>  * Description: Test to validate engine activity by running workload on all engines except one
>  *
>@@ -847,6 +850,13 @@ igt_main
> 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
> 	}
>
>+	igt_describe("Validate engine activity before and after s2idle");
>+	igt_subtest("engine-activity-suspend") {
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
>+		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
>+	}
>+
> 	igt_subtest_group {
> 		unsigned int num_fns;
>
>-- 
>2.47.1
>
