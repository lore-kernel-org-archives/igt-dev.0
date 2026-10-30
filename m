Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31987606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hFP9299p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9106112673;
	Fri, 30 Oct 2026 07:31:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CBF112673
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 07:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793345451; x=1824881451;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yycdRDcqLOL703NThRn8qAqDMz06XNK0tA9hgzrEsfc=;
 b=hFP9299pgcsjqTRbdJswzKxXVFIBG9GVp4oJDuGmMLMbexchDZBYkbKn
 zhS6eq6fTfoZw7XV5MNh5J83Gt2EG48K1IAHicaTQ4FJujQ0M9NcAj58X
 656q3SwzIRWGhBDHmMDy52GnO1TIkVNrKffyBnbeAM0kHJYsRGsQaw9vK
 qXyeJMic4aiGqCabqzFZhlyS/BZfljCTXUjQyhUdj1OdmH/Y34OkKWPyn
 3duTeA1dS83loLo6otHEMbcbtimZ4b5Wf+BYuRH7QGXCRZTVu9ERJvb/w
 jS14XyZwQTE+doF+IOBkzKtB3nehzJ49+0O8d4JNcVTWTxTigmhBxeLtc w==;
X-CSE-ConnectionGUID: ToTdgbtXQm+Ujyd8Cxo7ew==
X-CSE-MsgGUID: EqhegQnfQTSXySiA/xevvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2133901"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2133901"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:30:51 -0700
X-CSE-ConnectionGUID: DPyPOSp9RCqnRg7bak7mlw==
X-CSE-MsgGUID: 7/AN5noTTvG0XwSgbwG8QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5334113"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:30:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 00:30:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 00:30:50 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 00:30:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VX9Ous8WI4U5bSr6fckrKF692UXx3DSKzMqsJSJWI6IWuv4GHg9vzZuEit6nBRNb/FmGXfUsAMmD1NllO8iIUuwyOfTUjyElm9DbGOoGPBjfFndhbFOYDIb+xNaBehwz5Lf+KHRS0OfXOuIxk9v6twEtGNJoowoJS2vCYABbKSdaD8RmLZmuvBy1ADWNCkI9+rp1HC9lD0GDW5sUZf6wVG8KOPJfFvZQ65mNaqGhteAB7NpHF8wLqET+kMIuSzzajeX15cMFDuf8rWmLK9xMSWU5l6VUMkkgmtrokFkO83770mU/ho0c9QCcZ9sQRizyITC2Aqk3CAusBTYpuasGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lvXgGdElaFGs7zgqUuz/zOWu7EH6frwW40bjio0cdE=;
 b=MWKEoLvdi1WkoNjHkXGP5BnXyue4jR1j93EgfsnVialU4Wi9MLpcQdvkuGbTCWMa+uYl8KXKf4BaZblAEGtpdEZ2Kr/7iKwE0xddVBQxZfA0v2tOoek2uxu0Bmc7R67iQf3iYWVFMCbA7PgkKjC/qTUXjqXVaLVh+EPSpp1m3xrWWirg3b5S3vIC0S7ZsJ/4AoTi/6glI6efyNtnjJ4FoUt69hTzwNWM2QPI1s5kfSLLdb7wMc5btp+AOCCnskzl/t4h9RB1wBO4+03RT/mAcElLbkkZISfUFbGNNQt4uFgBJ0rCSqEhZWZa81+RwEepWzI5O08luXVNucYY6skMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by SA1PR11MB7698.namprd11.prod.outlook.com (2603:10b6:806:332::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 07:30:45 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 07:30:45 +0000
Message-ID: <90bc9be0-75bf-4cd7-8095-e6c5c7f97c3a@intel.com>
Date: Fri, 30 Oct 2026 13:00:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_oa: Add unbind/rebind test with an open OA
 stream
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>, <harish.chegondi@intel.com>
CC: <riana.tauro@intel.com>
References: <20261026233036.1589204-2-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261026233036.1589204-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0347.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::19) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|SA1PR11MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 0443f1f0-167e-409f-5105-08df3657b5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006|261026140227099003|261028144727099003|261022113327099003|10067099003|261021121427099003|261022105027099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: qs3pWjTWkWr8GA2ApiQLtj6LQreANu6fjc+i8Dffj7bjXeGWGonGnkDxq9XdGqQ27my98lxZdRvEgEoAcIYUzstW7HsiKpUfJhSQ0XytHUlZTa0oPL0Uxvj/5+jESj3yPat+rJ3oeQWDVrF6RsQ5dnmuKbCJ0Iu5lh42lqp/wO/vbpr5uvqt5WQ7zOKRSL9ZOLccZebTSyXj6vUbSM2o7XtqkGKUQVroU0LhYjK+nMA7ox7NX8Sm6a3vUiQDQrxlE8Htt4SpRCYRZw8vTMYmHkq6+9lQ94WIYTZ2QFSAuTos4TTH7AxuwswLofHg+ifFMrNwu077i3N8pzaT7tuFPxXYuHO6+NkOB+QON67IdvSWt7mLaUmvaOdSlsBLkCG989og4wQLc/sSo3RqpyLGLg2QNMhPUHmwQrOOylUfw8Nz71HorWPDaVglGDqHxuh5J2wNtxSHG7iwMfqrZL0OG0mfACq7UuZmWBQ3zegn4ZRMDkskqSThFQXcknTdbzM6nnRxLJTJ//yZdBi56S/UoVsTuZK0vhfyQ9675iqo0phfvpMbmP7ujPRTrXBne0cgFV+Vy5HMQFVJbU7sGhvVDfewsLHsH7408kmxm7TRIfjoKAjrtc84rbFFkPvQ9NZHfZERvrKiQogea5O3SUxWhFZHFhRSe6djR3ROB092cc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022113327099003)(10067099003)(261021121427099003)(261022105027099003)(261026121527099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlZocloyWU13aGZTUmp0eStVU21vRldKNmNIU0RPL09aemxrWjdXQ3ZoanVI?=
 =?utf-8?B?eisyN0dDKzhqQXd5dzdveU9DTzRnVWZYTFMrUThYNGh0SWVKUWQ4SmtNaGFi?=
 =?utf-8?B?VFVWYTdRS0ZXVUw2VnFKR1lyRFFJRGorZjlaL3Q5eHZFYTl1TFgxS1NYUzcv?=
 =?utf-8?B?djhuNkMxZ3RkKzQyZEoyY01KdHZWbDhvdExtSk4wWHZpa2N1a1RmczJyOHlG?=
 =?utf-8?B?VW1TN1UvTVN4aTRtMmx0elREOFNLZTVCRHpsMGR4WWMxYlJXS01XQ2Vsc0Qv?=
 =?utf-8?B?aVREY3pFUVJlZjBOZHZnd0F6clc1alJzUW9wU2hBa2xWRjJQZ1NoUy84aWhV?=
 =?utf-8?B?dzFyN1hZN0I1c2Q5TVVGQncveDFhTmsvUUUvaHR1RWlreE44Ni9scjdFVFZ1?=
 =?utf-8?B?QXlGR3ZTeEhUY1pjS0tlMVA3b3hXTzR0aFlQZlBsekcrYXdIQWdyeVdYcTZJ?=
 =?utf-8?B?YmNWQ21sM25RU0ZTUGZjMWtFVEJQQi9pRHhONW1VY0ErbVdpNU15TFdKRnJU?=
 =?utf-8?B?ZjF4UTAzN1hVWDgvczEyVWRXNHg2d3drcHk1bEJGUDZFMUZ3ZldVa1QvZXZT?=
 =?utf-8?B?a0M1M0l2ZG9zYzFINnRzc3NFSTBML1NaYjhrS2g4WDFYM3Iyb1NsWHg5a3hC?=
 =?utf-8?B?eVR1enBvZlRtMjJjVFlBd1ZucWNIRzFRU0FoUkpJZ0QreEhiNGNmOTFxTjAv?=
 =?utf-8?B?bkoza3RuNFMwWEh3WFpkcVVSdDhuNmpLalBmaGhwZ3NGZytUVDI3L1lTMGlq?=
 =?utf-8?B?Y3RRZ3ZQVHczSUY2cmlDMXJycFRoeU9DdUZpa2xwSmVrUEozZ2Y4WTJFWjc4?=
 =?utf-8?B?dUp0K0pnUnJsWHBPTE43R0gxM0wrUVVPSVUzV3RGc0ZaRVFSNGpSSmk4Y2cv?=
 =?utf-8?B?aGdTODl3VXFhbnlKOUladVBxa25FQTRiNFh4YXgzZWdvVVh5R1pqNElObVFV?=
 =?utf-8?B?cXBROWswb1F5WSt0U1llTzhzTXRtQlhrSEtLa3pQQ1ZMOXVRSTJwdWhMckZ2?=
 =?utf-8?B?YjRLYnlJdUpXWnVFQkptb2tFN0xNR0o1WVFjY2ZLdUI5ODVWRi8yMlppYkVE?=
 =?utf-8?B?OE43QytTUGdyTjlOdUN4aDZHdWRjN0FuUjluS2kyQnFGMXFNNFl0aUp1VUM2?=
 =?utf-8?B?cWZBOXUzT1RTTWZaYklqY1lzRVRGdjlLazZURWxhZ3ZmY3hlWitoRG96REtu?=
 =?utf-8?B?eWZVaEpHejVBeWYrQitVVW5GeFpWWVRSamE3SzNvSmtyNGtyOVF0V3ZQTllP?=
 =?utf-8?B?U2ZuT0V2OVNRWTJQbnpxKzIwcjFsUDZRd2pPMGdJZzhEbDl5TmxNcGx1QTJM?=
 =?utf-8?B?N3phWXpCZGRMcW5DNm9jeFBEbk8vRkxqdmNDTjNLRG45S3R5VEtuRktucnZD?=
 =?utf-8?B?UGpmczdSR3hlVzA2aSt5dHZQR1BLYzJ3MSt3T2FOYlZhdlhHbjkrSktQZVlV?=
 =?utf-8?B?VDEwL0huaFNFdlFlT092VmdQTHlqZ3hMU0J4RWttdWpoR25udUNVMkxGRlNt?=
 =?utf-8?B?VG5kSERDeVJneDRqSlcremlybWVsM3k0bkFrdXE0RldMRGY1bVJPZ0FpUmZ4?=
 =?utf-8?B?djk0MSs0eXU3WktnWk41eC8wQUtiQUNqSTd1eGdsbDBPS1N3Q3ZEbTY0QUUz?=
 =?utf-8?B?KytaSXRCVzJ1UkV6L0laYms2THg3SVhDZjlrenNMQU1FQjZrd1J0MnU4S3NK?=
 =?utf-8?B?cndiOHhiRW9Xem4wYVNzV1FIc0ppbzRDVWY0T1BEckM4S1RFemhOZndOSlM3?=
 =?utf-8?B?Sk94aTFxamhMWUtWLzJaZElSQTY3Q3dIN3ZJWS9BOUQ4YkFjSnhMc1ZBVGpq?=
 =?utf-8?B?MURucE5GNno1ckJlR1FrMjBhc1dTTUtNTzUwMmpSclZ0L2dzaHRUbS84d0FF?=
 =?utf-8?B?L3VtUVlpWTRQaGJNbjl1TjVSajlFaWJtQ1piMWkxU1Q0L250aGJvalNxeThk?=
 =?utf-8?B?M3VhNCtDczZFYjEwV3RJQU5aaXpSVzFESGJFTWJuc3ozMkFMOWRVeTZpdXBG?=
 =?utf-8?B?bm5ZZXhnaXhTdFdzaEVNb2R6ZTVjQ3pVY09VbC9WalBqWUdOZlJvdkhpbVI2?=
 =?utf-8?B?SFRncUJLUk9TSS8wZDc0NzlHa201WUFyaWlSM2xZQm82TFRGaldlMW1qRCtJ?=
 =?utf-8?B?VldZSE8xSHFaNzhMVlhEVFZCYmdCN3dJV0h5d2IyWU9HUHg2WkFJQ3Q1ZHdU?=
 =?utf-8?B?Umtscy9UN3N0bzZXcHdWYkg3T0Y1aEw3UGNDV2MzdzJSOGo2bVc3ekgxazVt?=
 =?utf-8?B?QXMyLy9DS0VseHUzbENKSDF1eHdJQng1WVN6b3Rwek03aHdQTTVnODZRdWdV?=
 =?utf-8?B?YWV1OUN1aHFua1NpVHdwRGNaOWlPZ2pSbGdlVDdhejJ5STlIZkU3UjRNWlhG?=
 =?utf-8?Q?QrMHNnL1KuJ2dtx4=3D?=
X-Exchange-RoutingPolicyChecked: Boa9Qc+Lfa5VlPV6QLdD/yPj1uqpiyGE3ymYscandGBnd2zXz3TggTsFEe3RvK4ARh2lBhsbK45GmjvvnXZZk6FG9Ql2MI1W1YR60uO0uCkRKFuFStkWJCKmj5xqVQujuTmraz2UGhZRaj0flgxbZZg3wTJUzuTJMGJ9ThAPISuiL7oAgwIyl51lsVbKx2UtaAhnN6//ndnLPJ0F03RHJtuGxAuF/jEMKUbvLWZos9TW6Wv1ntuXxgB5K4SR6KECcNn2BAiDyj87IDpxd52kEvSpyrUEg+y5sEyg7oWvtdo+2/CRVnv1Ni3ohdlFZwnQbfTcqkCV0jTo++fIGmlDew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0443f1f0-167e-409f-5105-08df3657b5e9
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:30:45.3188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaXQY1ZBiPI68c2W5oan6SzRhEOqCW/iuaJRXKpXQkUll80w8FxAlWxFmDUrACcMvkH8uQ+8v+Ss3SZkBudTg3/bM7OmLlT+TU2kJgYRq/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7698
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/27/2026 5:00, Umesh Nerlige Ramappa wrote:
> Open an OA stream, unbind and rebind the xe device, and log the state
> of the stream fd (poll/read/ioctls) after removal and after probe.
> Close stream either before or after the rebind.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

The test, in itself seems fine to me but there are certain suggestions:
     1. After close/rebind of the GPU, we poke/check/probe the IOCTLs 
from probe_stream_after_removal() but we never defined what the expected 
behaviour is.  I mean, how do we know that this is what is supposed to 
be the case, at the end of this subtests execution.  Can we have some 
asserts?  Although, since this is a new test being added, I do not know 
that the kernel is even addressing something like this or not, like, how 
should the XeKMD respond when we re-poke/probe a stream after it's 
device is gone.

     2. Because we have a random decide between close and open in 
main(), I feel not everything will be tested everytime CI runs this.  
Maybe we can have both of them run definitely.

     3. (AI-Suggestion) If we unbind the device, we did not update the 
primary set-up of the device for this test in igt_main(). Right now, 
it's the last subtest, so no one uses the GPU after this, but tomorrow, 
if a new test is added after this test, then that new subtest might fail 
without cause.

-shekhar

> ---
>   tests/intel/xe_oa.c | 127 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 127 insertions(+)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index b9f62c1154fe..8a56efa43dfd 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -22,6 +22,7 @@
>   #include "drm.h"
>   #include "igt.h"
>   #include "igt_device.h"
> +#include "igt_pci.h"
>   #include "igt_syncobj.h"
>   #include "igt_sysfs.h"
>   #include "intel_wa.h"
> @@ -2725,6 +2726,125 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
>   	__perf_close(stream_fd);
>   }
>   
> +static void probe_stream_after_removal(const char *when)
> +{
> +	struct drm_xe_oa_stream_info info = {};
> +	uint8_t buf[4096];
> +	struct pollfd pfd = { .fd = stream_fd, .events = POLLIN };
> +	int ret;
> +
> +	ret = poll(&pfd, 1, 1000);
> +	igt_info("[%s] poll: ret=%d revents=0x%x errno=%s\n", when, ret, pfd.revents,
> +		 ret < 0 ? strerror(errno) : "-");
> +
> +	errno = 0;
> +	ret = read(stream_fd, buf, sizeof(buf));
> +	igt_info("[%s] read: ret=%d errno=%s\n", when, ret, ret < 0 ? strerror(errno) : "-");
> +
> +	errno = 0;
> +	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_INFO, &info);
> +	igt_info("[%s] ioctl INFO: ret=%d errno=%s oa_buf_size=%" PRIu64 "\n", when, ret,
> +		 ret < 0 ? strerror(errno) : "-", (uint64_t)info.oa_buf_size);
> +
> +	errno = 0;
> +	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
> +	igt_info("[%s] ioctl DISABLE: ret=%d errno=%s\n", when, ret,
> +		 ret < 0 ? strerror(errno) : "-");
> +
> +	errno = 0;
> +	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
> +	igt_info("[%s] ioctl ENABLE: ret=%d errno=%s\n", when, ret,
> +		 ret < 0 ? strerror(errno) : "-");
> +}
> +
> +/**
> + * SUBTEST: unbind-rebind-stream
> + * Description: Open an OA stream and test the effects of unbind and rebind
> + */
> +static void
> +test_unbind_rebind(const struct drm_xe_oa_unit *oau, bool close_before_rebind)
> +{
> +	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> +	uint64_t fmt = test_set->perf_oa_format;
> +	uint64_t properties[] = {
> +		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> +		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
> +		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> +		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
> +		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
> +	};
> +	struct intel_xe_oa_open_prop param = {
> +		.num_properties = ARRAY_SIZE(properties) / 2,
> +		.properties_ptr = to_user_pointer(properties),
> +	};
> +	size_t format_size = get_oa_format(fmt).size;
> +	uint8_t buf[format_size * 4];
> +	char pci_slot[NAME_MAX];
> +	int ret;
> +
> +	igt_device_get_pci_slot_name(drm_fd, pci_slot);
> +	igt_info("Device %s\n", pci_slot);
> +
> +	stream_fd = __perf_open(drm_fd, &param, false);
> +	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
> +
> +	/* Make sure the stream is live before pulling the device */
> +	{
> +		struct pollfd pfd = { .fd = stream_fd, .events = POLLIN };
> +
> +		igt_assert_lt(0, poll(&pfd, 1, 2000));
> +	}
> +	ret = read(stream_fd, buf, sizeof(buf));
> +	igt_info("Pre-unbind read: ret=%d\n", ret);
> +	igt_assert_lt(0, ret);
> +
> +	/* Guard against a wedged unbind/bind */
> +	igt_set_timeout(60, "xe unbind timed out (wedged?)");
> +	igt_info("Unbinding xe from %s with stream open\n", pci_slot);
> +	ret = igt_pci_driver_unbind("xe", pci_slot);
> +	igt_reset_timeout();
> +	igt_assert_f(ret == 0, "xe unbind failed: %s\n", strerror(-ret));
> +	igt_info("Unbind complete\n");
> +
> +	probe_stream_after_removal("after-unbind");
> +
> +	if (close_before_rebind) {
> +		igt_info("Closing stream fd while device is unbound\n");
> +		igt_set_timeout(60, "stream close timed out (wedged?)");
> +		__perf_close(stream_fd);
> +		igt_reset_timeout();
> +		igt_info("Stream close complete\n");
> +	}
> +
> +	/* The drm fd also refers to the removed device */
> +	xe_device_put(drm_fd);
> +	drm_close_driver(drm_fd);
> +	drm_fd = -1;
> +
> +	igt_set_timeout(60, "xe bind timed out (wedged?)");
> +	igt_info("Rebinding xe to %s\n", pci_slot);
> +	ret = igt_pci_driver_bind("xe", pci_slot);
> +	igt_reset_timeout();
> +	igt_assert_f(ret == 0, "xe bind failed: %s\n", strerror(-ret));
> +	igt_info("Bind complete\n");
> +
> +	if (!close_before_rebind) {
> +		probe_stream_after_removal("after-rebind");
> +
> +		igt_info("Closing stream fd after rebind\n");
> +		igt_set_timeout(60, "stream close timed out (wedged?)");
> +		__perf_close(stream_fd);
> +		igt_reset_timeout();
> +		igt_info("Stream close complete\n");
> +	}
> +
> +	/* Restore state for the remaining subtests/fixtures */
> +	drm_fd = drm_open_driver(DRIVER_XE);
> +	xe_device_get(drm_fd);
> +	igt_info("Reopened xe device after rebind\n");
> +}
> +
>   /**
>    * SUBTEST: short-reads
>    * Description: Test behavior for short reads
> @@ -5221,6 +5341,13 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>   		}
>   	}
>   
> +	igt_subtest_with_dynamic("unbind-rebind-stream") {
> +		bool close_before_rebind = random() & 0x1;
> +
> +		igt_dynamic_f("%s", close_before_rebind ? "close" : "open")
> +			test_unbind_rebind(oau0, close_before_rebind);
> +	}
> +
>   	igt_fixture() {
>   		/* leave sysctl options in their default state... */
>   		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

