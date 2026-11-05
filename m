Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08634606A31B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mR9AI3Lh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A998F10E952;
	Thu,  5 Nov 2026 18:38:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD94310E952
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 18:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793903874; x=1825439874;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=44M9Y5AAxq9UhDegIkQo1JvrpgSYnsrQ92rSvVkYubo=;
 b=mR9AI3LhvgafJ5Tv0w+Mf8uxtjk/MFqOePdZPa7/nX6hyaLZmSoxAlBf
 hYy/LlXJdFj96K5Uk4DZkrWgegmk05Pjh/oWSwpCq+ddeg2D19evifk3v
 2gkXPW//JBzYFwadHAR+tMfz8TNXd+7P//Lgk9IV6M3cqDMKnWg9tWpqw
 nRWa70kF02sdFo0TFL7UldJOphw5x+4La/tlYW8MpjKVlzmTbgtL6Bfbw
 h/TAR5XsjzdFdj+8Q/whiuV3pGhbWbyHwRsV+qBOpTp+pKCLSurjB630L
 fDL70temYMY4IWLrflRO8FMx7pDSysMlr+hFYPH6Efbh0rQ/r8GcbjLNG w==;
X-CSE-ConnectionGUID: yd1B0KURSLe1fctRMuRmSw==
X-CSE-MsgGUID: wT9eXvZcRJSXCuY2AY4iHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2591729"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2591729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:37:54 -0800
X-CSE-ConnectionGUID: C6dZkUZ0TbuQuIsA9fLd/Q==
X-CSE-MsgGUID: 33iGjfG+T6Cc/LIomt3muQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7248461"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:37:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 10:37:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 10:37:53 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 10:37:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JR4mgJjNYi5qhOH6F/yuT59eRa2wbACzBOwTlio2VJUFoLJEqFsUuhxO5H5QM5kMnpCHC1nTrh+fs5Rs41aff/OldIupRhK5h3IcdCc+PJ+cmJQXYqeQtf5Hg584SSlLQKOq+Z9Qn4sD354ddfTrlcDm9xQnS8zud9TDv0hUXGD9VSzYhsc7PiE3Jv7hI2/ArVAs7ggXhSgvGJiqgR+FV3EJEAwMHbMxdInLv2Xi+IYWz9acUCR7G+BoqYTC6gGlTy0B8uXZXQ9Sfm97cBopUuRc8ZB1XrL3ZyQ8FB9C61Vx7wKfkg9W0BWTch5sijo1q3YEwnoMems+qfGjShyRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmBUUxURCCyNmfTlUltFHZ4DhxVpOSBWMP1h6x2NqHg=;
 b=BgT0cviwtXD6pLwUCrNrQJioN0QtM/XtI+6X8e8U5FTav0i2JhGiAY2Gu2+832v2JXzuZeJrRYxXK7GkqOHcEIZ7CNTEBWjbpDEG4ye5Rjwfk78Hav8PJpwcaIqOD5m0BE2bkOl00HZZH4YL2msk0xOO8TMOV4ZT6oEmwGXUdF5kepWjXiGBqAo6LUCALkzFwQpBoihcI3Tu5DWT0UXIlpn9E8OsuSl2RJAcOIxUpJEW14gHaBSqCc3F9SxawCuEtPenztFPkDaX8IuKTtvXEihE+Y93LIgob3ZTDu83rHnu2Lp65T+Cn8kFQRRLsUQOcupyV9zxvs05ckScliKdzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by IA4PR11MB8943.namprd11.prod.outlook.com (2603:10b6:208:569::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 18:37:49 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 18:37:49 +0000
Message-ID: <3d48b710-e230-4152-84e6-e8da3001eb90@intel.com>
Date: Thu, 5 Nov 2026 10:37:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] tests/intel/xe_exec_threads: Parametrise
 worker and queue counts
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20261104201119.14137-1-jagmeet.randhawa@intel.com>
 <20261104201119.14137-2-jagmeet.randhawa@intel.com>
 <auvoIUnk8NEJlCWj@nvishwa1-desk>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <auvoIUnk8NEJlCWj@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0388.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::33) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|IA4PR11MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: 14936b95-5929-4932-adc5-08df3b6be4be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|10067099003|261021121427099003|56012099006|11063799006|261026140227099003|261028144727099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|4143699003|261022075727099003;
X-Microsoft-Antispam-Message-Info: 78OxJhO4YpYyup+YgELQFOJH4fc61gXXtKt20j9oNLqXcN3NhtxNHC/e3Gt7U9srf0dNeKHAVIE+sWyUK8UpZSCbSL4HzewyVpkmhxkWoxJarTkEpU9jsKquRmvbQmLs8eehIF6B+sGmM3NXccnNIIqwXEaxCQ/rWIX7J2/JkCBOPEhnkMzwQ2NwRgUb1ddWZqtwRYT1TK+9QxFsvjSiFaDbXmfdBshfU4gu53PBFspUaqhEcNrSS5+D19RThMEGLhkzD0e4BQQuFIF+aFBpz7sgB99XjgU2eja02Gj7Rg85l4Enuxo99Hp4HItbb57uZXuIbtvG+WxlhN+4H4kSfjC/HxaB7scivagSQ+216/ae5e71pooPvOEw3Eyda/NQHGcIxNwTavk1rKOdjop81Yjk2e2rNoY7pAybAGxTTqWabS0ZFrTZNHtb0b0KXFvirX9CSG3zTZe7+ACtnD5mD212uO+VsQcPB/lK+YgXVkxLEkzldlfMXx9HLJnxjKw931LkjkGeFmkNEO5BsMZ560InlKyWPZIS6UyLuKUQ0gBg6cIJLCT0IsO6GTX1M/72zGwN2B8/Rp9VTPjVa+3MMNcnS2DQ8eYQKkLRq3H1aP8xjdzRsi67XR2kpzUwBmxFanK0HOhVATOKnyCU7Lv+/RPket0768Xn0jBdr+v75F4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(261021121427099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(4143699003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1ZZY05Ka2lHaGx6MEhHSnhzRlBoMHdqWVV0VzNuUmdFdDJlczI4elR4eWN4?=
 =?utf-8?B?UVBRWHdpOWl6RUFXNm01R0hEd3g0aVN1bmlPNHB1cWdXdUd0TW9vU1FZVTVF?=
 =?utf-8?B?WEt6aHB4V0ZoV3ljenBDNi9WMHdUbDVYSzM3Z0g1czlEbUwrSkdtNVlxbEIy?=
 =?utf-8?B?b1QzaHlqUzkyN3o5RHVMQlpDU2NVaXc3RDlSOUlvWVkreEgrT05hNGhpeEdC?=
 =?utf-8?B?b0pVcEtpKzFiRDE4THpibnZKT0gzeHpMNHl6U1J0cG5HTlFlZlNrSjBuZFlm?=
 =?utf-8?B?UHprUTRJSXhtUTZDbHBwenFWVVBjRitJMjhxZTc1a1M2dVlpTERuV3J1cVhT?=
 =?utf-8?B?VjdIcFZ4L3h2MFFrQlZCUWJGaFFvYitLVEhKZ2R3T2VSYU1jTkVsK0ZkZEV6?=
 =?utf-8?B?WThDR0ozb3dkRy9qRTJ2UnBwS0VicUNJVVFlQnpyMHlJWnlaR3dXUlhodTIz?=
 =?utf-8?B?RjJBMklvelVmcVNVeEtTbDhNWjNnWU9UZlFPeFNPaiswQUVrUi85emdMTHdE?=
 =?utf-8?B?ZlZ4QTRTTGNPYWt1d3VrTWJpV2JiNFQ3THQ4VEhYSG1QWnNjTEVIa25pMndh?=
 =?utf-8?B?THdBMXl2VDlGQlZoTzlYVGltcTRSKzIzdE9jZTMvQ0JsUjJUOWQ2ZHkrWlZy?=
 =?utf-8?B?V1FscTZ2NXZXMW95TlRFMWlBRUZzNGI3ZHdrcFNLSlB0QXhwTCtnckdpaTJv?=
 =?utf-8?B?QkpEZmRFMENhbTUrWSs1SU5EVW80cVNUTDhrNnlkbGFxQUI0R1JSZmQ4Y0ND?=
 =?utf-8?B?QWk5bGJBbEh2aXgxRDREWmZ1TXRhSDF1V3h5YkZTUHVzZXAyNXZsQXk2aktm?=
 =?utf-8?B?WmlvVGZvQkJjRStyYnZWdUJuTmx4ZTFRNjBOWG1EWTBkSXhNTkVlaUxGamRR?=
 =?utf-8?B?WUl3RCtTZVcwQmlsdWRmQWt0azg1dHRWZ0lQOEVFQUVvclNIT2pKdmdUZGl2?=
 =?utf-8?B?eWdiK1EyWExKbEpCSjRqTXFXR0RpT0tFbisvbjcyU0RhUWI2aHAvYldydEVs?=
 =?utf-8?B?OW1TakIrcm5NWWI5cDJWUnlXS2JtZ0hJODhBeFZ0TlNsTzFKWlZMeThCS2hz?=
 =?utf-8?B?YWlDSm8zRDB3U2xMM0QwNEVaSklWLy9HVzRJVXFFeHowK1J3T3dZZ0MxYklp?=
 =?utf-8?B?T1BLUHcwQ2VCOHFVbER4UTUwcHZzK3RHQ25JNFE1Z0NMUkN4YzJtd2Z5a0s4?=
 =?utf-8?B?OXRUQ1pyT2UxUjNIMmwraU11alVIMzJOcFZ1aHNzMG1BSTZoSVN6WjIyamt6?=
 =?utf-8?B?NXFSSXBOWHR4cDVDaW93L2RIdnhNcWI3MXB1STM0RGY2UHNCeEpndDlsQkV2?=
 =?utf-8?B?aUpkVExQQVVoNG1Gbk56RkU4WGdLVHJoL3VyTjF1TmFXY1JkcjJuTlgyQmFO?=
 =?utf-8?B?Yk1mYjFXNzZCbFZJeUZGV3pFbTlnZWQwUlRCU2c4NkRmVjQ3K2pndnlDU1Vn?=
 =?utf-8?B?RGRVMzNCY2I0aTI1R1MwMGE0VXUrYW9DcUFaMUptQXJEQUt1MFd3NTBjL1Rj?=
 =?utf-8?B?NGdpN3hvclRiVEVtS0pZakNqY2d1Z0plK3IvTVJxbmRVcmVRdWZOU1NsTUJL?=
 =?utf-8?B?ODdzais4d2l0R0hTMitvVVVjTnluV2xDRDZjVzlRZm45ejdCMkprdG5POElU?=
 =?utf-8?B?SHZabTRFbzJmcW84bXNDZXUwRTE3dHNlekJvZGhOL3VRZGZpRHJiakZCMlhW?=
 =?utf-8?B?VCtHbUdibFVsNzl3ZVJmRmQvY0xvU2xxSjBrYTQwVTBYMFprTWl1UlBhQ1Na?=
 =?utf-8?B?S0xvZE5GTCtjbjdmZ1RzbE1jNXREUy90S2ZnU2x6clJrbHIvckdHM1Z0eUgz?=
 =?utf-8?B?c1VCYURNekYrcjlWc3Z5NkdRbHhqZzVZcGlXUFNWMkZFZ0IvN3F2MVdrcGN1?=
 =?utf-8?B?SFpZL1Y2MDhiVWxvZkhEYUc4QjYvcTNDSEIxZ2MzMDVhclNLM0F5dzVPWGxK?=
 =?utf-8?B?SzdZK0hXekdyWXZVSlhDM2tRaGVJUmE4c0lvRUhJYTFFS2N5Ni9DTGl6ZUxL?=
 =?utf-8?B?S25DN1o2V3NQcFVHOSs4RFdMNU5aYThrdGpkT1Z5T3NYVGx5Sk5wRG9BVU1Z?=
 =?utf-8?B?RUc1WEVKamNjTFI3VmRXV1JVRGYwOUhYZUd3bGcwa1hqYXhzMVBWQVVDNjdY?=
 =?utf-8?B?emJrOHNCeUFQOVhrRXBCRFAwdW8vTWtIUzBUTUY0b0VBV0VYaVJWNE84ZHRT?=
 =?utf-8?B?SkxHSXl3UXd1bjJTSWYvaU5KclhZQXc2VXlQMkxxcTFvZnp5ZGRpSGczWGFy?=
 =?utf-8?B?RnhSSnA4Mjg3WWtrYkFERkt0WGtWbWMvU2QwS1NVQUxSZmk1bU5NMFQ0aU1k?=
 =?utf-8?B?WWRGTU9RUWtqRDhMRS9lUFUxQW1ZTU1sUkFwbS9Xd3MvKzdJZkJHRFI5bUdU?=
 =?utf-8?Q?w9lAX6XK/WScD1dY=3D?=
X-Exchange-RoutingPolicyChecked: YOTOkizV4O9yy+Exv5FW0ga9XkfrGRx3Gv90ZDo6gq5SAL6rJp4AqddBZbVEf4cTx2/zvuqM3NW1LaXLQtOfoosS0EWfHpUNV2elu+ATO4R7FroV503FtVcNTrU/jsjbMsK/aO5KXLaelsf5vn4apIjMZOJV8u6fQ0HKdFeLJalIz4h24mXhTRCZo0+uroh/IpiNBXVtBVB4YgHU7NU4TPyTglewFFbLo7jebSrIJJ0kBjrOgL1JxIuESzqA4Cj6n0sDKYFD6AyGrB8+ONHd4S0hdmmTKbQG9UOL9mgXIOyPCrbBGhuYZBU3pp4vga2OS/G7urOaXWrzwcwE+1nSdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 14936b95-5929-4932-adc5-08df3b6be4be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 18:37:49.6186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPRXSgFnRr+clXVgCQflqvNTaQbKMaALyZ3au8bJFoQTzOuL8cJd2XqoZEeSGZY9txOEedcpiLQemX1l+tNFXDfrMx8rBAUqfEedbcpEvBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8943
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


On 11/4/2026 6:21 PM, Niranjana Vishwanathapura wrote:
> On Wed, Nov 04, 2026 at 08:11:18PM +0000, Jagmeet Randhawa wrote:
>> threads() hardcodes one worker thread per engine and N_EXEC_QUEUE exec
>> queues per worker. Subtests that need a different shape have no way 
>> to ask
>> for one.
>>
>> Pass the number of worker threads per engine and the number of exec 
>> queues
>> per worker as arguments, with the existing callers keeping the current
>> behaviour by passing 1 and N_EXEC_QUEUE.
>>
>> The balancer threads are not created per engine, so require one 
>> worker per
>> engine when BALANCER is set.
>>
>> No functional change.
>>
>> v4:
>> - Actually use n_exec_queues for the per engine workers. The previous
>>   revision still set the fixed N_EXEC_QUEUE there, so the queue count
>>   never reached them.
>> - Nest the worker loop inside the engine walk, after the engines that
>>   cannot run the job are skipped.
>> - Assert one worker per engine when BALANCER is set.
>>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>> tests/intel/xe_exec_threads.c | 71 ++++++++++++++++++++---------------
>> 1 file changed, 41 insertions(+), 30 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_threads.c 
>> b/tests/intel/xe_exec_threads.c
>> index f03f20142..e5056192b 100644
>> --- a/tests/intel/xe_exec_threads.c
>> +++ b/tests/intel/xe_exec_threads.c
>> @@ -32,6 +32,7 @@
>> #include <string.h>
>>
>> #define MAX_N_EXEC_QUEUES    16
>> +#define N_EXEC_QUEUE        16
>> #define USERPTR        (0x1 << 0)
>> #define REBIND        (0x1 << 1)
>> #define INVALIDATE    (0x1 << 2)
>> @@ -1343,7 +1344,8 @@ static void *thread(void *data)
>>  *    multi-queue compute mode fd userptr invalidate race
>>  */
>>
>> -static void threads(int fd, int flags)
>> +static void threads(int fd, int flags, int n_threads_per_engine,
>> +            int n_exec_queues)
>> {
>>     struct thread_data *threads_data;
>>     struct drm_xe_engine_class_instance *hwe;
>> @@ -1351,13 +1353,16 @@ static void threads(int fd, int flags)
>>     uint64_t userptr = 0x00007000eadbe000;
>>     pthread_mutex_t mutex;
>>     pthread_cond_t cond;
>> -    int n_engines = 0, class;
>> +    int n_engines = 0, class, t;
>>     uint64_t i = 0;
>>     uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
>>     bool go = false;
>>     int n_threads = 0;
>>     int gt;
>>
>> +    /* The balancer threads below are not created per engine. */
>> +    igt_assert(!(flags & BALANCER) || n_threads_per_engine == 1);
>
> May be also add an assert for MULTI_QUEUE and MANY_QUEUES are also not
> set at the same time (not supported currently).
>
> Niranjana

Added next to the BALANCER assert in this patch.

Jagmeet

>
>> +
>>     xe_for_each_engine(fd, hwe) {
>>         if ((flags & MULTI_QUEUE) && 
>> !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>>             continue;
>> @@ -1374,7 +1379,8 @@ static void threads(int fd, int flags)
>>             }
>>     }
>>
>> -    threads_data = calloc(n_engines, sizeof(*threads_data));
>> +    threads_data = calloc(n_engines * n_threads_per_engine,
>> +                  sizeof(*threads_data));
>>     igt_assert(threads_data);
>>
>>     pthread_mutex_init(&mutex, 0);
>> @@ -1388,33 +1394,37 @@ static void threads(int fd, int flags)
>>     }
>>
>>     xe_for_each_engine(fd, hwe) {
>> -        if ((flags & MULTI_QUEUE) && 
>> !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>> +        if ((flags & MULTI_QUEUE) &&
>> +            !xe_engine_class_supports_multi_queue(fd,
>> +                              hwe->engine_class))
>>             continue;
>> -        threads_data[i].mutex = &mutex;
>> -        threads_data[i].cond = &cond;
>> +
>> +        for (t = 0; t < n_threads_per_engine; t++) {
>> +            threads_data[i].mutex = &mutex;
>> +            threads_data[i].cond = &cond;
>> #define ADDRESS_SHIFT    39
>> -        threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>> -        threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>> -        threads_data[i].fd = fd;
>> -        threads_data[i].vm_legacy_mode = vm_legacy_mode;
>> -        threads_data[i].vm_compute_mode = vm_compute_mode;
>> -        threads_data[i].eci = hwe;
>> -#define N_EXEC_QUEUE    16
>> -        threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>> +            threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>> +            threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>> +            threads_data[i].fd = fd;
>> +            threads_data[i].vm_legacy_mode = vm_legacy_mode;
>> +            threads_data[i].vm_compute_mode = vm_compute_mode;
>> +            threads_data[i].eci = hwe;
>> +            threads_data[i].n_exec_queue = n_exec_queues;
>> #define N_EXEC        1024
>> -        threads_data[i].n_exec = N_EXEC;
>> -        threads_data[i].flags = flags;
>> -        if (flags & MIXED_MODE) {
>> -            threads_data[i].flags &= ~MIXED_MODE;
>> -            if (i & 1)
>> -                threads_data[i].flags |= COMPUTE_MODE;
>> -        }
>> -        threads_data[i].go = &go;
>> +            threads_data[i].n_exec = N_EXEC;
>> +            threads_data[i].flags = flags;
>> +            if (flags & MIXED_MODE) {
>> +                threads_data[i].flags &= ~MIXED_MODE;
>> +                if (i & 1)
>> +                    threads_data[i].flags |= COMPUTE_MODE;
>> +            }
>> +            threads_data[i].go = &go;
>>
>> -        ++n_threads;
>> -        pthread_create(&threads_data[i].thread, 0, thread,
>> -                   &threads_data[i]);
>> -        ++i;
>> +            ++n_threads;
>> +            pthread_create(&threads_data[i].thread, 0, thread,
>> +                       &threads_data[i]);
>> +            ++i;
>> +        }
>>     }
>>
>>     if (flags & BALANCER) {
>> @@ -1448,7 +1458,7 @@ static void threads(int fd, int flags)
>>                     threads_data[i].vm_legacy_mode =
>>                         vm_legacy_mode;
>>                     threads_data[i].class = class;
>> -                    threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>> +                    threads_data[i].n_exec_queue = n_exec_queues;
>>                     threads_data[i].n_exec = N_EXEC;
>>                     threads_data[i].flags = flags;
>>                     threads_data[i].flags &= ~BALANCER;
>> @@ -1471,7 +1481,7 @@ static void threads(int fd, int flags)
>>     pthread_cond_broadcast(&cond);
>>     pthread_mutex_unlock(&mutex);
>>
>> -    for (i = 0; i < n_engines; ++i)
>> +    for (i = 0; i < n_threads; ++i)
>>         pthread_join(threads_data[i].thread, NULL);
>>
>>     if (vm_legacy_mode)
>> @@ -1762,7 +1772,7 @@ int igt_main()
>>             if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
>>                 ignore_multi_queue_hang_warnings_in_dmesg();
>>
>> -            threads(fd, s->flags);
>> +            threads(fd, s->flags, 1, N_EXEC_QUEUE);
>>         }
>>     }
>>
>> @@ -1863,7 +1873,8 @@ int igt_main()
>>             atomic_store(&wq_stress_hang_detected, false);
>>             igt_until_timeout(WQ_STRESS_DURATION_SEC) {
>>                 threads(child_fd,
>> -                    REBIND | BIND_EXEC_QUEUE | WQ_STRESS);
>> +                    REBIND | BIND_EXEC_QUEUE | WQ_STRESS,
>> +                    1, N_EXEC_QUEUE);
>>                 if (atomic_load(&wq_stress_hang_detected))
>>                     break;
>>             }
>> -- 
>> 2.53.0
>>
