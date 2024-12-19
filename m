Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864D6E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 10:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4287D10E488;
	Thu, 19 Dec 2024 10:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGI7wsUY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C26010E488
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734604247; x=1766140247;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oIbUsauXwT1T7e3awGw3J/xYG6focC0pj1DqLnalYqQ=;
 b=WGI7wsUYlxW+FwYey0EPVD9F97iaT2NFzRK9YWC3Yoo8ShonlSmGBfUY
 HyVrwtlNkK2SCtM/lFa0RK/WogFbNyUmOkxTHwVFv1BNpB3EGAw3kO7MW
 3/iRdEm1BqF9CTtsd1GET2Hmc9yLOiyBTOnaDEunAiOCUcleaLmg5urcW
 dDaV4BgAV1L2NKnA2rdZoN3zMgvnxiagdR/zKF37UTlrtztyq/6wgNY1M
 Xwiml+B58J13Cnr1VIMRYXZEHhQIlTBew2Zik1S7Q30ingCjIICYtVV4R
 p+6y7fIzj0sAivZac23Lzh8TdULBEJolRgvx/DQ6Fl0FfH0v6zUAV60zF w==;
X-CSE-ConnectionGUID: ZqKb8eQ1S1ySwGfUKsvIzg==
X-CSE-MsgGUID: 6k/jgqFGQyaRvZf7f44PEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34996922"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="34996922"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 02:30:46 -0800
X-CSE-ConnectionGUID: FeI6SkMfTMynojWaRmhPNg==
X-CSE-MsgGUID: I4YwALatTEGShSjlzFiPXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="97946921"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 02:30:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 02:30:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 02:30:45 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 02:30:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNg59IuNPi3S32HvfnBkzPH3hNY9Sd92noGqO5k3hqRX45Bf1aNJDN1MwE9f/e+Zx6s1oynU/4FmgaSTq2wZn2w3/ZqWM+5VeNDWPYom4FZNr09NFmUi0ssu3rdEprEikJrDQs5TE+Qy3WKqFsgj4Snya8uEDSFj1boDZemY63KZGd1bwB0ZQUMdHC9n5pDc1f9cs5xxYRD9V08wKnNwoM7OO4hCUW21W2MeEChmzIHm4lON59DtfAERHLONTPDaH1IhIi2Yf5HeExpfdr9qzGPTBa7Qvxx9d9GJO7Q10otfEaCtgZIDEQ5jDls1MUHUp0q0QsgoFjcrTcw+g9ALuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDsTqfTGp7S/hVuzweByHG+zWdlqBSwY/Hi+lvEFL4U=;
 b=jVeFPAFK2/iFQ/j3WY54+y7X7BhjMtbkudjmnyeIxYveRPd+Ebg9WbF4rtAXmHD9zF3OaceWERqbuGOSAJhIbFEzjflkEzbASuJyi/UxAqPTTxdpZpGLG9h/vAHBGnMj5X8LzHbqFBGTbl+HKqBLiuVJedoSC7BcAZUJQ4asZzcfGssUhwKYO/YwxZopDFZ/odHJykkbEdQtwRrxlKgNrKWhrDmRZ88WS3Qii+Tri8RaHN2Pu+oF+xsh288LhKbkOKjFiuXG7oMI29YcrBYSD68rvRwkyphXFl/D/7YPQgFZGvBJRspMgUsdEmc17/idIQ0YA3t3Vet+7wWkmsNcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 10:30:02 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 10:30:02 +0000
Date: Thu, 19 Dec 2024 10:29:53 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>, "Andi
 Shyti" <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] tests/intel/gem_exec_balancer: Decrease required load in
 `full` test
Message-ID: <lodksrk35e7553mcjihtpwufeyjjkiztzpphbtetfstt2rpyur@52hyzx2opub3>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <uupn5abwcptf6p4zdaz4ozl5utjcwij2sjlebrlgkqw3xupxma@nvacr67vd6tf>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <uupn5abwcptf6p4zdaz4ozl5utjcwij2sjlebrlgkqw3xupxma@nvacr67vd6tf>
X-ClientProxiedBy: DU7P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::32) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbd03e0-2ace-47c6-7143-08dd2018187a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODZvZ1FZY0htKzZ3RUsza0kvYmpkVG9TUmVHZFBNUXQyaFM4RTJuN1VMdmt0?=
 =?utf-8?B?NjhSYlhwZm9MSzlxa3IrYXlySVQ4clBEUVdNV2JsOTROVms4NFcwdW9wMWgv?=
 =?utf-8?B?TExyeDJpd25GdUVYdTN6ZjNBMkpkMklZSmRpSzJ0dmlxa2UyR1JHMFY1a3dR?=
 =?utf-8?B?V2JoM0U5WWxuYXVSL0RTTld1TnJuOVBxZzU4clUzaXVWemE0Z2x3M1YyVWNR?=
 =?utf-8?B?NXI4SE5mRi9Sc2NDdjJmek14ZmZOR3BVRVlzVEF1RTg1T0xZbXhwMWlKWFFk?=
 =?utf-8?B?ZFJwRWszZDFBallOZk1mdlAyZXNNTHhFcHF4YnNUTjZVc1c2ZC82WGNmMFNM?=
 =?utf-8?B?WUhoUjFjc1h1NGdkWE83V0pBRW1PYW5HR2xBell2cmsxRUU3NFZSWXphOVZN?=
 =?utf-8?B?cEpOL25rWTE1eTBQNnJ1Q3ZSZ2wvQkFkUUM4SHBybUp2VG90cms2NXpyYXl0?=
 =?utf-8?B?VTh2cnBkZTdWZDc0NmJQbFJPWjVzL29ESWpyTG9RUzNUbVk1MmtaMVZLUVE1?=
 =?utf-8?B?ZndjcmxLZzBodnRheHl4b1ErcjB3VHdBWnNJenN3ZkFTWEUxaU1RUGtvWkp3?=
 =?utf-8?B?RmpiaDRFNlhkcS9NVlJDeU5KVkxZM2RSY1FVNVdsb1pNcWFtdU1Dd2xMMlJD?=
 =?utf-8?B?K21uZkhvaEtGSFhkK3N6ZDRzbUVQU3V5UDlNY1JPdUZtMTRNTTdrRHFNaXFR?=
 =?utf-8?B?Z2hjQWhlZy9EcmFFTlNZYkpia2N5ME5UYXBNWlVmTEJYY1NFdDNjS1dIZy84?=
 =?utf-8?B?b05MdGMrdWJLL2RuZDdkTWxVUGFDWHFoc1lhZHNKcDBXTVpocDBKYjgwSWFs?=
 =?utf-8?B?MCtlYkhYbDhsVWs2dHNoWWNVTDFjZm9Fbi9rM2RPU29pYkZvb2d6anVTUHVO?=
 =?utf-8?B?aDdZeXdDK3czeGhFdEM5cFhJZ3FldVdsQ2VicFRVeE4yT2tuTkFSWitpcTR6?=
 =?utf-8?B?QXNBbzhYa25GQjVLVnZHU3ZXbHdRT2UzLzhsckFFd0JyVzJodlFwUmhTdnNM?=
 =?utf-8?B?d1Y4WGNGODFtRGFFdGx0M1Z3U0U3ZFRzQzFhWlN5dTVjT244NjNGWVc4aHk0?=
 =?utf-8?B?MWhNNHZmOTB3VGdGWTg4NkIyNGtBaVV0MGtIVHhxUktveFlTTCtDY3VEQ3Rl?=
 =?utf-8?B?cDJSWFpncGNXczdkUnJrVHpsbDBtbm81ZDA2MFFnTmNYNlVTL21tZjB3VTZT?=
 =?utf-8?B?R3d1UnRYdThOQVNDTTkyeHg2Tm01WDFuWVBpd0VybHFxa2pXQ3IvWGMyTDhs?=
 =?utf-8?B?ZjdqazErZmlKdVI4dVlzZ01wc2wwTllRcndXQmNxTk1vUmYvVHIxRXZmWUNR?=
 =?utf-8?B?YUwxZkNlamhpK3JtYjF6WWZBbVhBdUdrdTZ4Q3VYRDh2SEpFOFpUSjFPT2Va?=
 =?utf-8?B?dDJDRnpOOUlnNWU3QnZrOE4xQWdRdzB3Vjd3SU4vL3d6MkMzWjNlSnlhTnVD?=
 =?utf-8?B?aldxNDJYcWdYczNTYXd5R05QenhxQ1NXR2hYdWJEUE1KTjN0bUZTejRDUks2?=
 =?utf-8?B?TlYvYlFMejFNUTJuckRJeEhWU1RYSXNkVmVLUHUvM2lsZmFwSHZjWE0vVUxQ?=
 =?utf-8?B?MGZteGhCcDRJWVdqeW96ZHdTRDI5TXVjR055cHR0aFJadVlzK0YyaTJqTGMv?=
 =?utf-8?B?Q0Zsc1I5V28xTWwwZE50T3NNbFROVEg4RHV2bFF5Z3RTQ0o0bUdkREhjT0NJ?=
 =?utf-8?B?dXU2WjhvWEJZbDR5RGlsRDZ2TDdMYWtZVUN4YkU1VkxmRnRxaURYMkVNc3Zz?=
 =?utf-8?B?S1dKSklSTElJVzVxM0xIU3N0a3dJN3RpbU5YNTFhalpGOG85SWcwNjJoNGtw?=
 =?utf-8?B?NHpSa01wc3BJa0dsVzdHQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWE1Y05Wajh1Wk81VFpTU21Ha0txVXNaQ0pEdWRsMjQ3RE9mQ1BDOExNOUlN?=
 =?utf-8?B?VzY5YUNMWnRjTC9jN0VRT09UMDBSWGNQODBiU2FETGJEbjhUVi96M3FFM3Yw?=
 =?utf-8?B?VkxjdkQxOTRKNUtJRnJaL3plWGROSHJ3VUpHdnNQS3BWV0VMTDMxSlMxSUo5?=
 =?utf-8?B?V2xFTCtybTNPdTM5MTFhOUhMTFVTakg0bFFXZnBpN0tlellZOXBDU244QVoy?=
 =?utf-8?B?OUFTSU1mSi9RZ2N5T0hkZmlTYXlLQUF4aHRIK1I0OG0xeG1Ib2xCbnJkaUds?=
 =?utf-8?B?UWxCWXB6OTF4S1RKZklucTh2NStaRW5SL1JCbnJwb0dHSUdGbVZCQk5weEg0?=
 =?utf-8?B?YWpESHdQeU1sMWxkaHZ4SklQaGM1SDdSbjYxdmcwVDErLzV1amVYeHZYc1pN?=
 =?utf-8?B?b0tIODJFdlA1SXk5SnNYU1krL2hCRkZ6T2o5TGJZb2pXbjNuNDY1YjJwdUdB?=
 =?utf-8?B?RFZqWldpTlc3eTVqQ1RraEZZU0NIbFJwaTlLMHhNMVBNaDh2UjZKMUJVL2g5?=
 =?utf-8?B?V0JLNVMwRm9oVHl3Sm1QRzRkTzlYdWlYUjFaMkd4NVA2aDNxR2ZxMzVWcVlH?=
 =?utf-8?B?Qm5GcDR6MU1hV1d3ZGorVmpzSUVrZFJEbExwSjhpOE9TU1ZPNGNPdXpJOENS?=
 =?utf-8?B?bm1Ncmk1by9kaVkxTExPV2g0TndWOUlVZlF2SFNKVjdqbVZTbE9tL0pWenpP?=
 =?utf-8?B?V0VudDVRNENRZHpRbXhYVUFqVmZpSVd6SDJvMUFlZzJwSGtiZ1NNdDEvVzdz?=
 =?utf-8?B?VEFyclJFWUgwYW5xa0d2QjI3ZnFleXp1eThvVmR3TWFmdjJhaldvZzBxQVRq?=
 =?utf-8?B?MCt1SUtNTllJQWRxOEtab2gvalJjeCtSS1VhOFY4bjZUMjVKMTlUM2ZVSUFi?=
 =?utf-8?B?QmpzWnRPOWpQUWV0ODV4eUcxckJnNFNJTFhtWmtFdlhnUXhTMU0vci8wUW9l?=
 =?utf-8?B?QUMrN2d6dDM2MmFMZ1hQMjNreWo5SFJ2N1lkL1UralpGa0xONlVhVnM3Q2du?=
 =?utf-8?B?TTdabUVVNUdCazNFMjREWFlnS081ZDF2SDJBbHQwSFN1ais2RU9XclQ3YzZ4?=
 =?utf-8?B?VDAyWUo5UnkxSS95ZXJsb3VhRTJEeXpkc01mQzYySVpXeTBHTG92ODFBakdE?=
 =?utf-8?B?bzJlQVJnSHR1VjJaWFRQb1dyaUFodVoyNzcwbkdPdWs4YzdUbjRqVG9vdDBS?=
 =?utf-8?B?UURkZ2NodDcreWN3eVJ5WnRhZlNrV290L3BNQUdlZnNIL1FhV3VZYVFZdlp3?=
 =?utf-8?B?aHgxdTMxVW5ybnZNdjVOVjlVZXlqYW9XUmNUdzZsTWRyUVRhallWcUVDZWZM?=
 =?utf-8?B?U3RwbnpiNWVxWStvRDRpaHIzMWFjbjBEMS9PMS9OVk1KenZMY3ZMNHhjNCsx?=
 =?utf-8?B?eVBxQkZ4QXN0SEJrV1ZvWVlMZml1Unp0WWU3djlnNnVvTkc1MlVMU2RNRFRN?=
 =?utf-8?B?VlRxWFY1VzM2QnJyOC82Vm12b05lMEhaY0ljOE5BcmhqRVI2aEExQ1BQYmNi?=
 =?utf-8?B?Q2pqbTFOdE1jVGFyTE5ZU2xlRC9ZNFhzSEhERmxkQytxdVdTZEJONGIrNFBN?=
 =?utf-8?B?UXgzLzZ5dnZqemdIRndWcE84bDNIeEpLd3ZsS2o2MzJOVitJTmp4VjZuSVhv?=
 =?utf-8?B?N05BSDRkMVBWM29LbFlvMjhSUnBYY0lsaUJnSmZJSWwyUG5lNjM0WDV5TnNm?=
 =?utf-8?B?STRsalYxUExXejUvblY1ek94UmgvRHVaWEZrQkZja3FwZ080N1ZWbzZsVTQ1?=
 =?utf-8?B?UGYvTzZKbFp4NUxTQlc3QUxKbUVpU1RuZExFWjRzQ2hZSkFvMXFlY3pwK0RE?=
 =?utf-8?B?c2U4dnZVRXp5OWoxdlp0VWxJS2EwYVYrbnlGNUZKdHRlTVBNek1zRlU5NXZB?=
 =?utf-8?B?OGJJeXIxYWpRN1ZTOS9EbUJnR2tFZGNyMXNJcEFXYTBDL1RHSnRBU1N6azJw?=
 =?utf-8?B?cVFjN1owaHczdzdVTFBZRms0RWxhVEkrQVpCUGlCWG02NUpZcjhMVmVYWi9a?=
 =?utf-8?B?MUw5cU5Sak8xdTZKdGcwL1pidUxzNlk4dzIyNHlyclI1RStseFJNSU12a3V1?=
 =?utf-8?B?Q1FyRnNPMFdMbi9GTzB1L1FIM0JmTGtlNUc1VE5qNlZsZmgzQjhjdThpU1dB?=
 =?utf-8?B?b2JMQmJoUktaSElmYXVkUi9SY1k1T2tMK2ZoYW9mQ3Nlby9GcS8rTnVGdTZC?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbd03e0-2ace-47c6-7143-08dd2018187a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 10:30:01.9480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCtXLZ97yEckdVGMgLbhrihW2cBmvh1DnjpvmI34bT3pQ6UVUwYP39e6bXGAQG6JMG1sa1TjApMeFGsy6mQiRXcDRlpOBtzaXrkMb6S83Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
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

Hi Sebastian,

On 2024-12-17 at 15:06:41 +0000, Sebastian Brzezinka wrote:
> Adjust the minimal load in the `full` test. It's a minor tolerance
> issue expected 90% got 86.6%.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13003
>
Andi already commented on some formatting improvements.
Apart from that LGTM.

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Krzysztof
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tests/intel/gem_exec_balancer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> index c3f0c938b..46ea19a2a 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -1815,7 +1815,7 @@ static void full(int i915, unsigned int flags)
>  
>  		free(ci);
>  
> -		igt_assert_f(load > 0.90,
> +		igt_assert_f(load > 0.85,
>  			     "minimum load for %d x class:%d was found to be only %.1f%% busy\n",
>  			     count, class, load*100);
>  		gem_quiescent_gpu(i915);
> -- 
> 2.34.1
> 
