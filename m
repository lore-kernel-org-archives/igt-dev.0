Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8F2606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HRHzCWBE;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DhIhZa2m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF7C10E785;
	Mon, 23 Nov 2026 09:29:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E29910E0F5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795426080; x=1826962080;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TI/7T4x2h5H2fIlQTCoQX1PpeQtwWBBls9gF+doCuMc=;
 b=HRHzCWBEHKO5lgud7Ab/cLwso2uzWqdwPqXPq5aeaw0RJ651OU/C24rX
 PgiWULwc5iESaXjohXBKYXv+OAxugxA7KMSk3DzChNE8d5G1uG0y5p4AF
 olmpcM59SSExvA79YZcfuNphIfy+fSXaZSc8FK2ywPrtsSMEK5WxkdXpT
 LDd/hJhVY2O/k6ZZV+ZH5xN0yNmSNb9RrNOF4/+UYbrGLO3QlqXvDm1/x
 BoxEFvHcNnRNMnqwgUWkGb2bEColDb7lozLtIIUYohDxEsnSGzuOB9eHQ
 3i12XbQ2/PdEEskEe22HuWwYBYHjfWudNu6sBFpeh6laAUbb/EM36pLc8 w==;
X-CSE-ConnectionGUID: Cog392YnRhWF2EjiR2Cv5A==
X-CSE-MsgGUID: zler4KPjSX6Xv8xkb2lLTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4206314"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4206314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:27:59 -0800
X-CSE-ConnectionGUID: z3anCosgTJKCJYY8v/KLcg==
X-CSE-MsgGUID: JQzgK1/4RxiHZEg1R1A3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11560412"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:27:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:27:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:27:58 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:27:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFN5sr4PQfb1GsHP0yn+PxUUW3cQSmS0itSoZMlOKGHLXtfyGcRk6RBUIjffIj7rp70n2OWWMt4i3e1wFtaOl3OI7v5CDoiT5o0AEpj6DG50nrNp4x6d22YbnyGT0iBgZq5FeUWPbNS9NHmF5s+MoJj9ZBa1j37TNF/ulw8bEqXSM20220lOJba/XB10kGPb5ITFJuzIJvczSPpcRJxPTyHaxYQZhGTb4tQXFtNo8/7TdNWxKpmPaSzylxVxCOnXA0nCiH4WbvOgBGmq5fzssuvygHc7yodYu+OyOb+K3n0sJGjOKMcwsUigXuuEJ8RrMnnmlmeS9QEorbT7RD4tEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQVicbL0I5J2VBFCf8NSa1uNWN0wO418QduLe3iFLYI=;
 b=DqNcoVP2RmNG1N+oDZknl5X/Ce+aUf1UDjuQuhkkPkIGxwK3LayKWapYwV0SH69Nwtq+Zpt0tnYBUhd4sSRgC1oO0IYhVY5+hFq88z5IAl1LHEtO/ShJYeQ4WmTVmUmh9i061CiBuqgLBREm+mAZFriV1cWm/9B3zjjgZ/ylXmvHgvUrcX/a22IUyMK22NddyIJmLWL6Tc1xsTmBbWXCnbKu6q7r7eygLdE0k5YkrDxvfcNNUOtV/dWrAZVD6VCU991QqKRfmxwpdAEzVJDY7Q1WJtpUcuAqVvNfAkOa/a4KHnPX8Y52JlTMmXDJatmJIfgqCSP5im3WxoFdAA9NrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQVicbL0I5J2VBFCf8NSa1uNWN0wO418QduLe3iFLYI=;
 b=DhIhZa2mzxc4/eD78DU1AKbffBuwpoql58SLBijVaZMtM6scv5/bPUVbOD0kq7JOFSwrSU3bb8fpp3a7VKyhu32//Y4M6ED5ndP5EOVcGrX231XOqOkm0zda1wDGR+0o3G9BMqrKp9FQlVF+HW7uJh/X+DTTxPWxAfL/RITmnc4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by DS6PR11MB851541.namprd11.prod.outlook.com
 (2603:10b6:8:4c8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Mon, 23 Nov
 2026 09:27:51 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Mon, 23 Nov 2026
 09:27:51 +0000
Date: Mon, 23 Nov 2026 09:27:41 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2] tests/core_debugfs: Create listing while reading
Message-ID: <zccetwpjqeumadrgproin6ifvtw7qqprtonamfnn3ddp5s6yzn@a53yhzlkksg2>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20261120183707.35596-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120183707.35596-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DU7PR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::21) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|DS6PR11MB851541:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e0418f-e065-48b2-d842-08df49440bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|11063799006|261026121527099003|56012099006|261022105027099003|5023799004|261026140227099003|261102123227099003|261021121427099003|261021123027099003|261022113327099003|261009223027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info: HwtY8JS6fKtrbp3qq51tBUUXBeu7lngUSt1dH/DcR9rEfFedgSI7Xpqsx5POBJwKvRoSEycr+V3y3cyHeD7GcnmsiGtnsk5nyqxPVpbA2wz+4MrFiS1HdNpPn5xEf6/ApgZW9aK2Jpf0aEfWUUtKpZ65xUKFoU1rwHxH83xuOTcGlNMRxKWuc3FHuYAZLROOAlT4hiboVLGW7C/yKLSgj98TuUQdWUggPrSBDdKud/Jmdj+xrzQNN2B9lNtfJMPqLUYz/raBlPOL8/JnoveW3kew6VeOZPoBZ+FYouIkD6DZSmybz5uVbvxGi4OQlJSh1wCrmwXh0rsIf+wx4+9vY+Eou78lzW+JbuqcOMlvEsZlAdNeAf+4P0s5eK32/XwApsvED29OvjAKBeJYZBY0mgkGdWZJeyunJlN4bh9R5NlJJ7vylEsMB9QQd9LCqZpxVNfLMQ5/NKROW/gL4BL1cS95ZLoDLFSlxQqeZgV4x1PK487vVATcxkvoFQ15die4z6htzGGHzczLVfqoLMMFzpQiqKSbIdOwnxE9tXgos/tQyflsIypEofiap204D4A7Q1Fd42sdgoBhU1sw+ii+k7msw5kz9uA8j1m7AUn/Y9d1Gt66iqOFwmRzXtsvHs/4mV80W6lsraUG7q+QfMR5bApOHeLSLl4//336wtN5O9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(261026121527099003)(56012099006)(261022105027099003)(5023799004)(261026140227099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022113327099003)(261009223027099003)(261028144727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFBRRWx5V2NPUTVleHFHV0xDempCZzNybXNoN1ZzYldOM2EyN1I2eFlZTTlC?=
 =?utf-8?B?dEJhaStxdklLaFoycFZkV0NCYnBlRGlhWnVydjN4SGNtNzdYU3lUWHFvY3RH?=
 =?utf-8?B?MnVpUTBCa0hFV1lqZUlUbzhNQ2V3TnZzd05BOEkxbnQwdUdhWWRiOTNPT3RW?=
 =?utf-8?B?MEM4RzVlKzBEbTJYMzVYN0x4cjYvWHhlWVFzQ1FwQmlqVXV3dWxzYjB0ZWpM?=
 =?utf-8?B?TElwTC8xcld6NXdDU1NoMHVlVHdtVHB3SGVQSUozMEpxeXFNa09wSXZKRG9p?=
 =?utf-8?B?ZDltUDUyU3pydnlkQ3YzSkZ4MFVQVFc0RHV0Y1lrVVJlYlB6L3JmNDhSQW02?=
 =?utf-8?B?ZzVqL1dlTUlzNnp0dURtdk1XeGxxSTFhaUdVOXlFT2JQcmxHVm5lTHVVamtG?=
 =?utf-8?B?R0dnY1c5ZktNRHRnbjA0cmhJVUkza3ZaSDc3K1ZBYkZSVHM1NllxaCt4aWRY?=
 =?utf-8?B?bGgvRkdETUo1V2NBWURFajZNdGwwcWRaWGhTanh5S2tsRHowMGRSWWpQbzFt?=
 =?utf-8?B?bjY1ZVB1RWFBQ1ZkcFA4S2k5S1p1R1ZNdkJ2SVRDaTMxcWZiOUw3TWJpWDZm?=
 =?utf-8?B?c0NvZDMzVEJkaFpXQ1ZmaE82a3ZiTGUzNHlFa1FBdTJJam1wTGlRMWsvWUpn?=
 =?utf-8?B?bUZEUXFzcUVMNXMvSmc3Z0FnTUxHY1ZWa3pWTWFEMFBKUXd4YkZmRHdzRGcx?=
 =?utf-8?B?L1VMT0pNbHlCRVlEZ1ErWXp6dE05a2hjdUxrUGVTMVlBUC82ZG13aUQ3VkdW?=
 =?utf-8?B?ZFNtUEN6MnY1N01NcHNXZXdRU1B1QUZkbDZYbjc4cm9pYmJYU1l4QlIwWmx4?=
 =?utf-8?B?NkxlMWRHUjF2NU4vUlBWM2VzSVlWTVp5MkJLK2pHdmsxckNnQjBlZG1vM0ZK?=
 =?utf-8?B?WS9YUVY1MTJrdUQyS2xGUmlWT1NaeTZqcjZWWWdnMlN3SCtacDZDbUprZlJ1?=
 =?utf-8?B?UTJnYmlsT2YzbFE2N2NheXZLM3ByTHZwcDVvaUpyTkw3Q1hISGV0cHFsUExN?=
 =?utf-8?B?VEpoTXliNlUrK0tsaThrZ28vN2lweXFVanpRTGVpUUZZL0RBbVJ6L2NaQ2Nh?=
 =?utf-8?B?NXlycDk3NHNXaS84SStJRWRxb1V6ckZxN0JiTmFURThJRG82RVRHSXhiamxU?=
 =?utf-8?B?ZVFxSnJlSGVWKzV3bFdqT3IvMkswTXRRNVNXV3VOS1RMV2NGaGV1ZnFQNDZJ?=
 =?utf-8?B?UWkzK3NNcCtuRXJsZzV1NlpaM2pjYmlrTG5haDRKTHpMOFhhUzNyUkx6bkdR?=
 =?utf-8?B?Q1pvSWgrVmRzc1p0Qmd2ZFczNGUrVldWRmxhNnRNSGdQeXhPbUlibEwyTVNR?=
 =?utf-8?B?YzBUbVRwQnpEaFlMcnZKR2dZckxRQ1ZqTTJzbXRtNncxUVBOcjVubVd6K1lu?=
 =?utf-8?B?WG82OTVpamU1cTgzTUZuNmorNWZrREE2TU9xc0tDTVdUR3RuYm9IS3EwRlYv?=
 =?utf-8?B?K0xPUTR1WkNteWZlZVBvREFjcFh5QTVNUFB5ZndJdWdZSUIzL2NLTUZSQ0lB?=
 =?utf-8?B?ZXBnY2ZFWHlIekF5d1FDMDZ3LzZHNi9sbkI2V1pUVlp6TlRQTzlPZTg3UEpS?=
 =?utf-8?B?a3hBd2NFRWVlQ1B3UVd0YkNFM1IzOEVvd3ZRRDY2U01hNzJzZ1RFKzNueUdN?=
 =?utf-8?B?UjdXdjNMSlBDZXRGSUo3MnViMmdpUUZaL3ZHSTd6amZpVHNPOFZUNEtOZjJJ?=
 =?utf-8?B?bW1YcDlIZ3RXYldETlVweXg1S201Y0l4UW4rZFREM1d2dHI1dTBFVkFzUE9W?=
 =?utf-8?B?RkhBL1Yvenp6dm43V3JRU2ZvTGJlUjRGRHMwb3gvcDU4aFZOd2MzRCszL0J4?=
 =?utf-8?B?ZU5OL1QyVzlENE02M21MWjJNbzkxZmhFcXdXek1BVVdKSTRxRUc1VVUyTDRX?=
 =?utf-8?B?SERuU3RZOUhoZmlibWtHb2U4dVBlZnRVUGRwUWdsZXcybzk4UWdQN0dON0s5?=
 =?utf-8?B?bmxRUmxtTmM1ZFZDcjZUK2dnaDllMXI0MGtyYTEvZ0dLUEEyTWs2ak40cjFZ?=
 =?utf-8?B?RjI2WHBMMU1qeW13OHRUUyt6cG15ODJuZDNidWJPckY1ZHIrQklhUFFTc211?=
 =?utf-8?B?S0hYTmN1MG9NbzZYR1NYYjdQSTJSb3c4bDFmcXBTSU4xbHZ0Z0NOa0tyQmY2?=
 =?utf-8?B?WUJ4dmozYWozVDZJV3pNYUs5ekprSkhjeUxWTkk2aVA0MFlnUnJZbTdCU0Fa?=
 =?utf-8?B?Um8rbjNlVGJxMGlZSTZ1dG5tWCtnSVJFWnkrdnFydmJXR25UUy9hcVhpY243?=
 =?utf-8?B?ZS9qdDJkS1NsMUM2QTlRM2FKT1A3cG8yR2dRUm5wODhLTmxzQ2puc3NjTU5x?=
 =?utf-8?B?cndQSldhZjFtMGNLSnlXOGRER3dPaEdMUFNUKzE2VVIrbmV5Sld3RWkya2JG?=
 =?utf-8?Q?XPbYmqfVfYGDnDVw=3D?=
X-Exchange-RoutingPolicyChecked: BbUMb1iU0p/lCtqsi7fV+GjrouA51iZsElqLCSGnTzFSCE6z+9Adr6LmEfg8NdKHY97xaWYDTuvWJLt0YKuhCIUectviZrg5bxvYRpVFKBFe4/oDTCgD9hFFRNHrXGIhBoRzuqaq95GsWLx5QwnvKf+ryWjFZQQvDulr4oEx/O0xKEDghKdvJM6I8f9Aj1BX5G9QBMx9v6ONMGOJLLHfc21y/FeK/7tvD0uIrqHs4ImAAxx/izgHmi8gr+OfRDDdWFaLDbxYYtemFRAMw7+vF1B1Q3sPVIKb3NkX5zHXdpABfkJWNb/9CO3Ik+u6wz7jmxmwQqQJbuQ5p4iJHf4J8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e0418f-e065-48b2-d842-08df49440bc4
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:27:51.4614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6IgYL0y1JXMHb5nXaQl5Uj3bNrAXkZi9RzmQ83MZ3OB3VC1uP8ayYk8K0d+/hXrdtiAgUFGqUeMA3cRjkxAxwbvz1JGQ8jwaCjkSGlE/Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB851541
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kamil,

On 2026-11-20 at 19:37:05 +0100, Kamil Konieczny wrote:
> Create a listing of processed debugfs files while reading them.
> Debugfs can have some pre-required conditions before reading
> a node suceedes, so fail only when stat is impossible or no file
> was present.
> 
> v2: add O_NONBLOCK to open, add prefix ok to prints (Kamil)
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_debugfs.c | 98 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
> index 0e654c3e3..a74d211a7 100644
> --- a/tests/core_debugfs.c
> +++ b/tests/core_debugfs.c
> @@ -3,6 +3,9 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <fcntl.h>
> +#include <sys/stat.h>
> +
>  #include "igt.h"
>  #include "igt_debugfs.h"
>  #include "igt_dir.h"
> @@ -23,6 +26,93 @@
>  
>  IGT_TEST_DESCRIPTION("Read entries from debugfs");
>  
> +static int not_read_count;
> +static int ok_count;
> +static int stat_fails;
> +
> +static int read_debugfs(const char *filename, void *data)
> +{
> +	struct stat sb;
> +	ssize_t bytes_read;
> +	char buf[4096];
> +	int len;
> +	int fd;
> +
> +	len = data ? to_user_pointer(data) + 1 : 0;
> +	if (len < 0 || strlen(filename) <= len)
> +		len = 0;
> +
> +	if (lstat(filename, &sb) == -1) {
> +		igt_info("Stat fails errno=%d %s\n", errno, filename);
> +		stat_fails++;
> +
> +		return 0;
Zero returns here instead of errors are so that
igt_dir_process_files() continues the loop, right?

> +	}
> +
> +	if ((sb.st_mode & S_IFMT) != S_IFREG) {
> +		igt_info("ok not a regular file %s\n", filename);
> +		not_read_count++;
> +
> +		return 0;
> +	}
> +
> +	if (!(sb.st_mode & 0444)) {
> +		igt_info("ok not readable %o %s\n", sb.st_mode & 0777, filename);
> +		not_read_count++;
> +
> +		return 0;
> +	}
> +
> +	fd = open(filename, O_RDONLY | O_NONBLOCK);
> +	if (fd < 0) {
> +		igt_info("ok open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
> +		not_read_count++;
> +
> +		return 0;
> +	}
> +
> +	bytes_read = read(fd, buf, sizeof(buf) - 1);
> +	if (bytes_read < 0) {
> +		igt_info("ok read fails errno=%d %s\n", errno, filename);
> +		close(fd);
> +		not_read_count++;
> +
> +		return 0;
> +	}
> +
> +	buf[bytes_read] = '\0';
> +	igt_info("ok %zd\t%s\n", bytes_read, filename + len);
Maybe, "ok read %zd bytes of \t%s\n"?

> +	ok_count++;
> +
> +	igt_debug("File %s\nData: %s\n", filename + len, buf);
> +	close(fd);
> +
> +	return 0;
> +}
> +
> +static int process_debugfs(int dirfd)
> +{
> +	char debugpath[PATH_MAX];
> +	igt_dir_t *config;
> +	int ret;
> +
> +	ret = igt_dir_get_fd_path(dirfd, debugpath, PATH_MAX - 1);
> +	igt_assert_f(ret >= 0, "Cannot get path\n");
> +	igt_info("Reading debugfs files from %s\n", debugpath);
> +
> +	config = igt_dir_create(dirfd);
> +	igt_assert_f(config, "Cannot create dir config\n");
> +
> +	igt_dir_scan_dirfd(config, -1);
You could also add an assert for `config` here.

> +
> +	ret = igt_dir_process_files(config, read_debugfs,
> +				    from_user_pointer(strlen(debugpath)));
> +
> +	igt_dir_destroy(config);
> +
> +	return ret;
> +}
> +
>  int igt_main()
>  {
>  	int debugfs = -1;
> @@ -38,7 +128,13 @@ int igt_main()
>  
>  	igt_describe("Read all entries from debugfs path.");
>  	igt_subtest("read-all-entries") {
> -		igt_dir_process_files_simple(debugfs);
> +		process_debugfs(debugfs);
> +		igt_info("Summary: reads=%d stat_fails=%d not_read=%d\n", ok_count,
> +			 stat_fails,
> +			 not_read_count);
> +
> +		igt_assert_lt(0, ok_count);
> +		igt_assert_eq(stat_fails, 0);
>  	}
>  
>  	igt_fixture() {
> -- 
> 2.55.0
> 

-- 
Best Regards,
Krzysztof
