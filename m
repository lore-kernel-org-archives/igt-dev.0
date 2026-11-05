Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C564F606A330
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XFXeqBq7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A8310E95F;
	Thu,  5 Nov 2026 18:43:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6ADE10E95F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 18:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793904124; x=1825440124;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2pRzJpNoowUjjBC8sWA8J7oAFzaxDzcd9fGRrWENVUY=;
 b=XFXeqBq7TRpOcLgKcFS/vmXVfo665+TjOHUXfLSsMaO1XOoMITN+PWWc
 XyKQmqBC0JiLY7r2cWphgOwQq76vMCcT8+h51mayHh4vbq2tuYad6RWfz
 Q1/ik4sEqA7980srhDsjFGKkPrOEoPBnSgGO977+08rbOFnzIVwzo140q
 g/JJaPUBP8TaGuD18LgcA0SdVF8+2jz3SdlzqcaYOQewri0OFeBM6OCDO
 r24cY6R/9y5TqljIaP9vKPBxCb1S6+qAn4qRgbxnFIUzsOUMQAmxjdYwA
 Emv41pcw52HQupJr4V3CxjXjCyUeqpzNbKdbVtuzdczgTLaSqHV8RikSY Q==;
X-CSE-ConnectionGUID: iNP9lrmVS4G3bEjLShOpdg==
X-CSE-MsgGUID: K14C1jmsR1eqLvFR8o86VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2578697"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2578697"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:42:04 -0800
X-CSE-ConnectionGUID: D4PLR+iMSOGnGp5Ki7cT+A==
X-CSE-MsgGUID: V83z7WzeSNC4vgfkRFiEYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7399838"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:42:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 10:42:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 10:42:03 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 10:42:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+GymxrkLsgZUytZZRI5AchXPkq/jBCBBH7UYQbC21PZvYs423QyplfeC7Wk6ntJTwIgcK1IVBaYUjjOBjgSqOqt/NzcOjQ2m68HHu7GEWkAL2TvR0sOT/G5Oz/yzpuYdpcr/NExu79X8fAiMC66ycpOA+qZjApgpb+Yow0UJZQzPQSfOL9Jo53Ax+gFwquuTg4Nh37BRBqr/pECYWhObauWiYbXDJTdn9v1dsyYoapD/DgHWQnMPUwag2LMLEfZ/wHSR23p3a3p/F/2ghlBnmKfbPe4CtCKgSXJtR3EoX3LpcBCMykKVEKP8esnGfKOJxzwhW0BLxso9KBHJiFL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DM0e1q4y1VfyQFvZpG/Xr5KN9LYV385OvEypiNqy7c=;
 b=oNsvTf3U2zpG5P1kWJGbHZXx6/hhRzvkxTGGgnM1yoB9/q1nUnepiB2DwIszcljFo4PsQy87sBY4GS+BPCNfACKF5WYlfxyaG2FqPgDErZ7kyQPYd1XH9kDWTh7v3DN6Mof38mDFFCEJNr1I/rXLhIirjF9ZVGER3/c8YA2cvLczuNSZTVpt9Vj1pD3G9ZuMPuyexkQCEz06mrlF1UBW4bEPv92Wz1S0zJQY90crbUzYx0eul2zi+LXjr9RDpiCZP+0U2h+4fAQaKoq4OcrJBG9z4fzGnqjbEgaG6Z0DfFKdxBEQQynUH70f2wrHVjW3dQmHMLkhaOp0JecUOaiFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DS4PR11MB675443.namprd11.prod.outlook.com (2603:10b6:8:507::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 18:42:01 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 18:42:01 +0000
Message-ID: <45935f67-9b5e-4638-9d9b-07bf67fe712d@intel.com>
Date: Thu, 5 Nov 2026 10:42:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/xe_exec_threads: Add multi-queue
 CGP_SYNC replay subtests
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20261104201119.14137-1-jagmeet.randhawa@intel.com>
 <20261104201119.14137-3-jagmeet.randhawa@intel.com>
 <auvqSoR7W7bi8vAW@nvishwa1-desk>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <auvqSoR7W7bi8vAW@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0373.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::18) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DS4PR11MB675443:EE_
X-MS-Office365-Filtering-Correlation-Id: a5664f5f-9e06-46f8-7ae2-08df3b6c7b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|10067099003|5023799004|11063799006|56012099006|4143699003|261026121527099003|261102123227099003|261028144727099003|261022113327099003|261021121427099003|261009221227099003|261022075727099003|261009223027099003|261022105027099003|261021123027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: dNDcDifGmpHv55pI/PNdIU8xmq2Hk9mGUKhyf3po5Dsmsb0hfIvfsnRpbxfOYum9/D41KMZSWw85IwYrp/izrnF37ZmKJpiYu7+k1rDbfled9HocOIggGAZ+QjLSm4MTBIHC7L6AtGEffXIKGTT1rrxhRb65SSwYET4JSBZ08t+8hXxbw/KLon0J5PCh+ijYsfeSEXS/1dlPbp3DZ9pVpPhKBu+NF81mAn7OBt+WNP9ZezLqXh4noMC42ZKbVxt5O6mgApMyz1ArnPBDHpo0a7n9ecug4flVERCI9g2GQT7I8MWoXpHTEqDAn/+F2gzgDoizrROYBnwqQfbi/TnwjUeiEfDVgmqV+oVMitjRpefSzKYxJ4ITSge3xKMl5bXiiDNlMdCyy2KemMC3Hv6RAXBxQemMMUz2k9QqXrEifENcgF9QAjL53J4YZIf5tM8SK8vp5fToBPZ4uJ8+8SES8gqQuWSqypCR6CfwjkxrQpq/MAGIQkfmiOtCr2N4PwyJD++hRFicdEieNmmGJirmW7OnAKBiDrlkri9mM2XRdITMHaVQU3XN9ONd3EBrPQzi0P/wU6zojCmiJ2yvwPvAUC8o1Vb6h3iHkXyxo24DU4CPnc+ajZjr65vZjrLnY7jS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(5023799004)(11063799006)(56012099006)(4143699003)(261026121527099003)(261102123227099003)(261028144727099003)(261022113327099003)(261021121427099003)(261009221227099003)(261022075727099003)(261009223027099003)(261022105027099003)(261021123027099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VktrellqcnFCa3UyWEhZbmNFTjhyUFB5b3l2U09vWHJETXlobGg0MmJaVWlu?=
 =?utf-8?B?WnVhcWlPUm4vc1BSOWo1cnZkaUVmc2R6cDZ2b0M4Y3pOcGFZZVo5bVkxL1lC?=
 =?utf-8?B?N2k4S3NIeGJ3dHFnQU8wRE1qTmRoU0hYUS9zeFFtbWRzY1dIdXZxWXJUZXcx?=
 =?utf-8?B?anFIVlQyelNtZ2l4T29NWU5sYnIzTzN2aDJUOVJCdlRHM0NKc3p4aEE0dEMw?=
 =?utf-8?B?VGV2WnI3MlFYd2wvNUU3OTJTQjNlQjdMQXppMDZXZ3JobkV4WGZQYWFNRUxw?=
 =?utf-8?B?dGtLNXhVdytrbnJqZHBXSUZVNEVXR3BSSW5KM01haVQ5cWxCcTFWK0NwQmVw?=
 =?utf-8?B?WDJSeVZZZDZjVkxSSjJpYnc2anA2Qmh6cFVlekNxeEs3ak44SlBpTzlkYzlq?=
 =?utf-8?B?OXdVbC9YSHN0SFRLeWJMRzFyMXc1K2ZLdThucmV6RFV6K2ZjNW5rN2YyRXho?=
 =?utf-8?B?clpBZ0tvZ0xMM29OYW9lajFvbllJcHMwZWk2V2JtWjErK09qMDNYUjIwS2Zz?=
 =?utf-8?B?UWsyTk1NbkVCNUVhMnJmNFEyU1BydVdMVnVnUlVQck9ZUnlJUTY5MEpEdlB6?=
 =?utf-8?B?TjB6NTBvaXBrVVV3RXBUM2UxeFp4dlNIRkpndGs5WVBQZEUvZkljc1FBblNa?=
 =?utf-8?B?T1lZNCtKWURFbitKYlVPS1lRYWljbkZ5NTY0cnJadzl2czF3UnJMWEpzVHZw?=
 =?utf-8?B?blJBdXNOb3BnalJhQzZpWWRhRzI5dlhhc3UvTTZmeTdlNElITlBpSis4QnpQ?=
 =?utf-8?B?bjJiN2U1akZQVjY4KzZ4N1F2UmtaK3JOYVBYR2pPZVY5YUo2dXBseWlaaG8r?=
 =?utf-8?B?Z0pveVBkK1VXcWpoSzhpa1RWTFVXc1dXQ2hKS1ByWGo5SnYxM0pJQU01VlEr?=
 =?utf-8?B?S3FrQkwyUG5Sc1JrYTlkcHlnUXJkRlQ5SkRlczFBdVJBdkxFSGJaZy9neThj?=
 =?utf-8?B?ZFIwQ01vbnJDdG9ySzdvMmE5VE9qQy9uZThwSzR2RytRYWNOVHVnMFdQYnhL?=
 =?utf-8?B?blpJWmNDUFp2QWVKbnpWVXlpb0xPY2EwNlFrL0VTMSs4dTA0OTNOYUozckNC?=
 =?utf-8?B?R1lQWjU5UWdpUEhqOHlCbXl1aVNoV2M0UGxaT3JwOTI4K2NhSk81cmhKTWpU?=
 =?utf-8?B?K1lzL2pwLysyN1M5ZDh6SkxvTWozMlVEQUV5Q3JwdGI5QWVRRjZXWmFrcmFK?=
 =?utf-8?B?MW13NGpGSUZVakllSmZkQ0VWanBJaHhmU295dEhtL1ZYejc3ZDBmc1R0ejYv?=
 =?utf-8?B?NnMxd2oxTjZmWHFJandsUzE0TTZQM0lPWFgwbVRCZG1nNHhKRXFJRktlT2lH?=
 =?utf-8?B?VHdWNXo5WUJnSXZKakhJRlRENCtNc0I3Yno1c0ZrMURzMnc0UjhZa2FNb2NR?=
 =?utf-8?B?VVVEYUNiWXY4VitMRDhIS2ZWRWh6T3NEcWFWbDVOZUQremRwVGpsZGhYdC9q?=
 =?utf-8?B?Z2FNNFN0bENudlUzNEppQUpLSFJJT2pLeHdnWXYzNTI4RGp4bVNZYzBPMy9t?=
 =?utf-8?B?VUhGSFFJR0RKNjhPSXFkNmQzdmNQRFBoWmdqRHlmWXIyUGQ3V1JZZHpqTVd3?=
 =?utf-8?B?WWw0amZ3bWtiZ2RrVjNpaVkza1hVUHByS3JmWTh2QUMzYXdGMVdMTnlhUDVU?=
 =?utf-8?B?Y3c1ZlI0Sis0MS9CNGlkOFNLN2JjYnV1YkRKOGxlTUNuSlhlNy9xMDFReEc4?=
 =?utf-8?B?a01XQ2I5UVZUSE5PNzRnN3pYMGR4Q3ExdWZ5MjlzNHpONUtCL3pyQVEveklh?=
 =?utf-8?B?UjZ6clFTKzNlVTJxN1FxVW12RGl6Z2tvZVpTSVRIdlgzenZwaTRTbTJxLzdO?=
 =?utf-8?B?NEVkRVFTaEJ5N283T0VEd010L1V1VzluNE0rYzIrcUFjUm81MVR3SlByWldV?=
 =?utf-8?B?c0o2bktGRHVDY3VRSFA4K0FzVm8wcnIrZ0hDb1RpaDZJaXQ0bmxNdU52M0ZI?=
 =?utf-8?B?NU15TlM0OUtBWWxySW9NaUdXMTJPdXJRZ1RPTU5wSS90cGgwZUJTSENFRk1G?=
 =?utf-8?B?Z1I3OWwwMDVQOURMYmNuT3JzUFNrVkhvSTk5NnhaSENHaDlKQWx3aVhqRzNN?=
 =?utf-8?B?NG0wTW42TXVMbWFlZkgzK25LRnRvaSt4QmVqcXlTVmsxSy9Rb2hKQTdFc3M1?=
 =?utf-8?B?UXZtS29MV0QwdS9sa1dlTXZ0bmdaVTU0eFQrTndmNFpQM0NubEtERm94dDVu?=
 =?utf-8?B?elUybnRPaVpLSEtNTkpYeDlZSDhEajJJb2d4ZFdtdGl6SDVIelJTQWpUTmM4?=
 =?utf-8?B?ZWtCR3NXbU83M1ZoYWtYR2dWb2U4WWRFQXBJK2dsMkNXalRsZHBKYjNxUUpj?=
 =?utf-8?B?SnRCZ0VxR3RENlpHMEF3aTBaVHZsSDRMK2JWb1liKzhNQkt2dGc0a285Vm5B?=
 =?utf-8?Q?twaS6voq+uJrOEM4=3D?=
X-Exchange-RoutingPolicyChecked: n3sJp1MJUK1KQOUx/h0ES8HPw5PiF0+f7xu6/W8b7jtqqlcpMaugSQTzmzmdYQ5oq4ibM+7HpaOk7NC1gmZZy3wogHEu5XGi6LXcSv62gD6L1bdjyRwtYYrQEIIvjaV0+GtKdjsBFqaRzm4AuGxmCoeYOmhIWPWhxTSg5Aw+fYvDX9+L0jdFMEKI30nE0KnhJSQhxmSQB0+0RID6zdJAOrQ2yC1r/bqLcqquhxPlYmFKG/EWa094+GXUM7BNBFuM0W5cX+dtCZtjBHuwDBKm2D6PxVJ8tIi3E/miC5znK3rBaJDA9xCXyBBGDZPA3A7P/BQKiTuxzoeN6S+eaZ9B4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5664f5f-9e06-46f8-7ae2-08df3b6c7b07
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 18:42:01.7492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4ZC5gPpv/hIwtYYzivLn7/nYPdfd6T24tEpvWlKdHSO09tNStia2CvF4wnYbpp0jk5E5TIbR+0dT8mbXRc5SzzJuohBCVz9FpYtFazS0LU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB675443
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


On 11/4/2026 6:30 PM, Niranjana Vishwanathapura wrote:
> On Wed, Nov 04, 2026 at 08:11:19PM +0000, Jagmeet Randhawa wrote:
>> Add coverage for the replay paths introduced by "drm/xe/multi_queue: 
>> Handle
>> lost message during VF migration":
>> https://patchwork.freedesktop.org/series/165324/
>>
>> A CGP_SYNC message can be lost during VF migration and is replayed by 
>> the
>> KMD on recovery. Exercising that needs a CGP_SYNC queued or 
>> outstanding on
>> a live multi-queue group when the migration lands.
>>
>> A group serialises on one outstanding sync, so both CGP sources are 
>> needed:
>> queue creation for registration updates, MULTI_QUEUE_PRIORITY for 
>> dynamic
>> ones.
>>
>> A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
>> queues than that spans several groups and registers them in parallel. 
>> The
>> legacy mode queue arrays are sized to the request rather than to a fixed
>> maximum, so the larger counts cost nothing for the tests that do not ask
>> for them.
>>
>> Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates 
>> after
>> each exec, alternating the values since the KMD ignores a set to the
>> current value.
>>
>> Add two subtests built from these sources, repeated under
>> igt_until_timeout() with a bounded wall clock:
>>
>>  multi-queue-many-groups      registers several full groups in parallel
>>                               from multiple workers per engine
>>  multi-queue-groups-priority  drives dynamic updates on those groups 
>> from
>>                               a single worker per engine
>>
>> The two cannot be merged. Driving dynamic updates alongside many 
>> parallel
>> registrations makes an update wait long enough to exceed the KMD sync
>> timeout, which bans the group instead of leaving the update to be 
>> replayed.
>>
>> v4:
>> - Size the legacy mode queue arrays to n_exec_queues instead of raising
>>   MAX_N_EXEC_QUEUES, which would have grown the stack arrays of every
>>   other test.
>> - Keep the multi-queue extension at its only use site.
>> - Mask instead of dividing in multi_queue_group_value().
>>
>> v3:
>> - Use the MULTI_QUEUE prefix.
>> - Drop the many groups flag and derive the group layout from the queue
>>   count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
>> - Take the worker and queue counts from the section rather than deriving
>>   them from flags, on top of the preceding patch.
>> - Four subtests down to two. Neither remaining subtest destroys 
>> queues, so
>>   the churn flag and the queue recreate path are dropped entirely rather
>>   than renamed: registration traffic comes from the repeated runs under
>>   igt_until_timeout().
>>
>> v2:
>> - Drop the secondary churn. A secondary cannot be replaced within a live
>>   group, so MANY_QUEUES is no longer combined with MULTI_QUEUE and
>>   MQ_CHURN_INTERVAL is gone.
>>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>> tests/intel/xe_exec_threads.c | 88 +++++++++++++++++++++++++++++++----
>> 1 file changed, 80 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_threads.c 
>> b/tests/intel/xe_exec_threads.c
>> index e5056192b..393ab8d75 100644
>> --- a/tests/intel/xe_exec_threads.c
>> +++ b/tests/intel/xe_exec_threads.c
>> @@ -50,6 +50,30 @@
>> #define MANY_QUEUES    (0x1 << 14)
>> #define MULTI_QUEUE        (0x1 << 15)
>> #define WQ_STRESS        (0x1 << 16)
>> +#define MULTI_QUEUE_PRIORITY    (0x1 << 17)
>> +
>> +/* Mirrors XE_MAX_GROUP_SIZE: one primary plus its secondaries. */
>> +#define MULTI_QUEUE_GROUP_SIZE    64
>> +
>> +/* Enough queues to span several full multi-queue groups. */
>> +#define N_EXEC_QUEUE_MULTI_GROUP    (8 * MULTI_QUEUE_GROUP_SIZE)
>> +
>> +/*
>> + * Multi-queue priority updates issued per exec. The values must 
>> alternate:
>> + * the KMD ignores a priority set to its current value, so a 
>> constant value
>> + * would generate no CGP_SYNC traffic at all.
>> + */
>> +#define MULTI_QUEUE_PRIORITY_BURST    8
>> +
>> +/*
>> + * Workers per engine for the registration subtest. Registering several
>> + * groups at once widens the window where one queue's CGP_SYNC is still
>> + * outstanding while another queue waits on it.
>> + */
>> +#define MULTI_QUEUE_REG_THREADS    8
>
> Though we are using it for validating registration time cgp sync drops,
> the test itself just creates this many number threads per engine.
> Probably better to rename it as MULTI_QUEUE_THREADS_PER_ENGINE.
Renamed.
>
>> +
>> +/* Wall clock budget for the CGP_SYNC replay subtests. */
>> +#define CGP_REPEAT_SEC        5
>>
>> /*
>>  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
>> @@ -611,6 +635,18 @@ test_compute_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>     }
>> }
>>
>> +/*
>> + * Group membership for the queue at @i. A group holds at most
>> + * MULTI_QUEUE_GROUP_SIZE queues, so a larger queue count simply spans
>> + * several groups.
>> + */
>> +static uint64_t multi_queue_group_value(uint32_t *exec_queues, int i)
>> +{
>> +    return i % MULTI_QUEUE_GROUP_SIZE ?
>> +           exec_queues[i & ~(MULTI_QUEUE_GROUP_SIZE - 1)] :
>> +           DRM_XE_MULTI_GROUP_CREATE;
>> +}
>> +
>> static void
>> test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>>          struct drm_xe_engine_class_instance *eci, int n_exec_queues,
>> @@ -620,15 +656,13 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>         { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = 
>> DRM_XE_SYNC_FLAG_SIGNAL, },
>>         { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = 
>> DRM_XE_SYNC_FLAG_SIGNAL, },
>>     };
>> -    struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
>> +    struct drm_xe_sync *sync_all;
>>     struct drm_xe_exec exec = {
>>         .num_batch_buffer = 1,
>>         .num_syncs = 2,
>>         .syncs = to_user_pointer(sync),
>>     };
>> -    uint32_t exec_queues[MAX_N_EXEC_QUEUES] = {};
>> -    uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>> -    uint32_t syncobjs[MAX_N_EXEC_QUEUES];
>> +    uint32_t *exec_queues, *bind_exec_queues, *syncobjs;
>>     size_t bo_size;
>>     uint32_t bo = 0;
>>     struct {
>> @@ -641,7 +675,11 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>     int i, j, b, hang_exec_queue = n_exec_queues / 2;
>>     bool owns_vm = false, owns_fd = false;
>>
>> -    igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>> +    sync_all = calloc(n_exec_queues, sizeof(*sync_all));
>> +    exec_queues = calloc(n_exec_queues, sizeof(*exec_queues));
>> +    bind_exec_queues = calloc(n_exec_queues, 
>> sizeof(*bind_exec_queues));
>> +    syncobjs = calloc(n_exec_queues, sizeof(*syncobjs));
>> +    igt_assert(sync_all && exec_queues && bind_exec_queues && 
>> syncobjs);
>
> This change is also not specific to MULTI_QUEUE and should be moved to 
> the
> prep patch (patch #1 or separate prep patch). This patch should be 
> multi-queue
> specific.
Moved to its own patch, the series is now 3 patches:

   1/3 parametrise the worker and queue counts
   2/3 allocate the exec queue arrays dynamically
   3/3 the multi-queue subtests
>
> Also, I am seeing this change is not done in test_compute_mode. Looks 
> like
> the new tests are not compute mode tests. We should make similar 
> change in
> test_compute_mode() also and add compute mode/mixed mode tests also.
Done, patch 2/3 converts both test_legacy_mode() and test_compute_mode().

test_balancer() still uses fixed arrays and keeps the MAX_N_EXEC_QUEUES 
check.
No balancer subtest asks for more than N_EXEC_QUEUE, and BALANCER cannot be
combined with the new subtests since patch 1/3 requires one worker per 
engine
when BALANCER is set. Happy to convert it as well if you would rather 
all three
were consistent.
>
>>
>>     if (flags & FD) {
>>         fd = drm_reopen_driver(fd);
>> @@ -676,7 +714,6 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>     }
>>     memset(data, 0, bo_size);
>>
>> -    memset(sync_all, 0, sizeof(sync_all));
>>     for (i = 0; i < n_exec_queues; i++) {
>>         if (flags & MULTI_QUEUE) {
>>             struct drm_xe_ext_set_property multi_queue = {
>> @@ -687,7 +724,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>
>>             uint64_t ext = to_user_pointer(&multi_queue);
>>
>> -            multi_queue.value = i ? exec_queues[0] : 
>> DRM_XE_MULTI_GROUP_CREATE;
>> +            multi_queue.value = multi_queue_group_value(exec_queues, 
>> i);
>>             exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>>         } else {
>>             if (!(flags & MANY_QUEUES))
>> @@ -785,6 +822,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>             xe_exec(fd, &exec);
>>         }
>>
>> +        if (flags & MULTI_QUEUE_PRIORITY) {
>> +            uint32_t prop =
>> + DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY;
>> +            int z;
>> +
>> +            for (z = 0; z < MULTI_QUEUE_PRIORITY_BURST; z++)
>> +                xe_exec_queue_set_property(fd, exec_queues[e],
>> +                               prop, z & 1);
>> +        }
>> +
>>         if (flags & REBIND && i && !(i & 0x1f)) {
>>             xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
>>                        0, addr, bo_size,
>> @@ -942,6 +989,11 @@ wq_stress_cleanup:
>>         xe_vm_destroy(fd, vm);
>>     if (owns_fd)
>>         drm_close_driver(fd);
>> +
>> +    free(sync_all);
>> +    free(exec_queues);
>> +    free(bind_exec_queues);
>> +    free(syncobjs);
>> }
>>
>> struct thread_data {
>> @@ -1228,6 +1280,10 @@ static void *thread(void *data)
>>  * arg[1]:
>>  * @multi-queue-basic:
>>  *    multi-queue basic
>> + * @multi-queue-many-groups:
>> + *    multi-queue many groups
>> + * @multi-queue-groups-priority:
>> + *    multi-queue groups priority
>>  * @multi-queue-userptr:
>>  *    multi-queue userptr
>>  * @multi-queue-rebind:
>> @@ -1507,6 +1563,9 @@ int igt_main()
>>     const struct section {
>>         const char *name;
>>         unsigned int flags;
>> +        unsigned int repeat_secs;
>> +        int n_threads_per_engine;
>> +        int n_exec_queues;
>>     } sections[] = {
>>         { "basic", 0 },
>>         { "many-queues", MANY_QUEUES },
>> @@ -1753,6 +1812,10 @@ int igt_main()
>>             USERPTR | INVALIDATE },
>>         { "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | 
>> COMPUTE_MODE | FD |
>>             USERPTR | INVALIDATE | RACE },
>> +        { "multi-queue-many-groups", MULTI_QUEUE, CGP_REPEAT_SEC,
>> +            MULTI_QUEUE_REG_THREADS, N_EXEC_QUEUE_MULTI_GROUP },
>> +        { "multi-queue-groups-priority", MULTI_QUEUE | 
>> MULTI_QUEUE_PRIORITY,
>> +            CGP_REPEAT_SEC, 1, N_EXEC_QUEUE_MULTI_GROUP },
>
> As commented above, probably adding compute mode or mixed mode tests 
> also here
> would be good. I would suggest probably adding one 
> 'multi-queue-mixed-many-groups'
> would be good enough.
>
> Niranjana
Added.

This also needed test_compute_mode() to place queues the same way as
test_legacy_mode(). It put every queue in a single group, which exceeds the
group limit at these queue counts, so both paths now use
multi_queue_group_value() and the helper moved ahead of test_compute_mode().

On NVL-P the mixed subtest takes 10.5s and produces the same 16384 
CGP_SYNCs as

the legacy only one.

Jagmeet


>
>>         { NULL },
>>     };
>>     int fd;
>> @@ -1762,6 +1825,11 @@ int igt_main()
>>
>>     for (const struct section *s = sections; s->name; s++) {
>>         igt_subtest_f("threads-%s", s->name) {
>> +            int n_threads = s->n_threads_per_engine ?
>> +                s->n_threads_per_engine : 1;
>> +            int n_queues = s->n_exec_queues ?
>> +                s->n_exec_queues : N_EXEC_QUEUE;
>> +
>>             if (s->flags & MULTI_QUEUE) {
>>                 igt_skip_on_f(!(xe_has_multi_queue_engine(fd)),
>>                         "multi_queue is supported on graphics version 
>> 35 and above");
>> @@ -1772,7 +1840,11 @@ int igt_main()
>>             if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
>>                 ignore_multi_queue_hang_warnings_in_dmesg();
>>
>> -            threads(fd, s->flags, 1, N_EXEC_QUEUE);
>> +            if (s->repeat_secs)
>> +                igt_until_timeout(s->repeat_secs)
>> +                    threads(fd, s->flags, n_threads, n_queues);
>> +            else
>> +                threads(fd, s->flags, n_threads, n_queues);
>>         }
>>     }
>>
>> -- 
>> 2.53.0
>>
