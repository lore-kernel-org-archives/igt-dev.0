Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA9F606A31B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 19:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A4yUKKfV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F19510E6FB;
	Tue,  3 Nov 2026 19:21:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC83810E6FB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 19:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793733610; x=1825269610;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iAwjrvW+ZYNi85kPlVIIP5mpeow+Q9x03uTJcrfDjdg=;
 b=A4yUKKfV52WP4fhniH7OxqinEpR61rZMxItwNghKAbCfU5dvVqFPwp3T
 0TYKmyxSL5WR8fyHFmBaRxwBW2h83U29MAXxlcNJ5rWrxrq0A0JLRjb6z
 dJMKO8HvT5n+m5inmZukQy51dfj8l71jBuuHSWc2BxW4cFZmnNfUWxAmQ
 Z2yXQM6vX7QtbV0MgfHbLTNGMeipI/1sNlfhC97+XBC30iGj+ar94JVzg
 YXwY8oLbw4ERpuR/W3lDHftPcLF83knZgMtakvECGd84Uhq2mcaS6nbCt
 gBBEEBCYPQmZ7qUsogroKXgd5S3ze8wYUinzBxPg/IwldttwOn83qlfbI g==;
X-CSE-ConnectionGUID: mrbkvQMaS4iPN8DeIdwUYg==
X-CSE-MsgGUID: xSsJYzO5RxWmMd+H6n4G1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2384087"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2384087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:20:10 -0800
X-CSE-ConnectionGUID: aTcmrMq8R7qdta99plRCig==
X-CSE-MsgGUID: /TJV7HbFQgSmC6KhPeHhPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6413360"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:20:09 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 11:20:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 11:20:08 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 11:20:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvBiHZKW9gENmANPcuSpsoA5/A8J9rnntjppTaeKU2i//jzCnskJQshstf3s2nMOlpmsGxjcLTZWUUEMypZpyVZtKuYBxVcXqmjgxUCOfRUAyq5etoJf+crJ1PAX/O2Ut98CDf+jL43GsQs5AFT/MCm46iODOKre596e8AmmhNu8MLuRY7OkYrQH9YoYDppc30K3kIUSik3wM1mepBsjJDch/HnMYLw0Qhj5O9oORA7unnrdaZleyeEsAIajygsJO0nn7hUYjeh8WGxV+1l5nmJxmEkVsaChsXgU+dAhYuY7MiM9jj80Bm5TXJnwxZS21HAvRrTVH+g9JcT9H/nVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugA6+2KTsTTCcg7fyekGTTBKlObi/3NozVgigMwZfGs=;
 b=DKRFNLsICKdVNkwpZ5uMtk09vt6KSQGR8/iVJMB0VPBYSxGHjWBihabVm2uG2Thx5J5PZ756U0IV6+n0DIRfxiIDpox6WqmIPJdbeT3w13kIhHcxy/BYOJpfTlra+ghrnuuLPQl4l/LD0gMmKrreP6UVXi+k/5EXnJ6waLqwQj4fELXLlBg2b5TCmrra7h74Cwd3r7mDWrsiuSlxx4q4rCYqoX5U8RxbRJcTZ0wdWJl0P75BlXOBgVsi+rwCDVJOJ2fYG+3p/pPD68GceWZxW0eZz94ASdPB6XEoLVQLkoJJLo80UVKJrlDNn/Oa/EvzYEWEeQ5whlqaTVby7Q/R2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DS6PR11MB700629.namprd11.prod.outlook.com (2603:10b6:8:469::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 19:19:59 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 19:19:58 +0000
Message-ID: <bd32530a-0a72-46f7-8bca-50aea2c67d09@intel.com>
Date: Tue, 3 Nov 2026 11:19:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2] tests/intel/xe_exec_threads: Add multi-queue CGP_SYNC
 replay subtests
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20261027211541.35132-1-jagmeet.randhawa@intel.com>
 <auVoW83HSwsm04qg@nvishwa1-desk>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <auVoW83HSwsm04qg@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DS6PR11MB700629:EE_
X-MS-Office365-Filtering-Correlation-Id: d18024f7-b6c3-4680-922f-08df39df7366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|261021121427099003|261022105027099003|11063799006|4143699003|56012099006|261009221227099003|261022075727099003|261102123227099003|261009223027099003|261028144727099003|261026121527099003|261021123027099003|261026140227099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: TOvmml64e9tLgCzG/uC+hkq/Q3UZj76yL/Tk8Cwzgb2YgYX0HxzN1Byc8e7zqQIlW+6XsXw6LnQPA4q4y6ezd/8ONHYSpp6vS1z+wy386N2a2jrNJiTWP0OO4Ywf8y2sbmyCe/PUtB3SZ2YjKDqVkr9pBFAbVG2LB9xT7P2OYiEeCZ1BFk52zg2usWyWG+/c+AZOoF8LwpyMJ1/IurbEnItUKDAt8Jeiv/1jMtIY1Mx5FXWxlVF2wgFYEmti/RE5znfUxYl8Wy0fUoLnZSl1vpTQWOUOY/9NtbUJhS0dPf4ywfZeuZKoU6K4tmETmbOlXnII+bpj8parswUwiHSSK23YK19P4BXGM0I7eloV9YKxeNIZWqXd2DBnNa+5iFvVVEewM38dZURvcFsMG2tQYHt9sVKsjMz5R1UjtUKY+HewaIbNlSY4xsdprJXE8IkjqgMLY9PfLC7g3mDbfpsJcdaby3apOP/TDFoB20UFW62VBUVZflvG4mpBTAvLsyur7+zl4G57DkuaW8Rk6+SNUAJ0Kjjj2WCTJMAehAP2l6C0GQeDy3B8UAqvgCw1We4ahHxLGeOKV15+g/CP+uTnjCCOIKatWduhomhnhH4uSzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261021121427099003)(261022105027099003)(11063799006)(4143699003)(56012099006)(261009221227099003)(261022075727099003)(261102123227099003)(261009223027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGt3a2RBSk5EK3ovazdHMWlYZkl3U1FOU0pkYnNDd3R6WFlhUUNSSHp6enlR?=
 =?utf-8?B?WkhtS3M4VnV6V29BZ2xtRmR4dUJSYyticzlKNDVneXZCVUxJWGdNOGUvVEdZ?=
 =?utf-8?B?K2xqVTIvN0w1QzZSSDMvSVFNejJ5KzFJUFlNM0dxUE9XbVBVSms3RnJqbktW?=
 =?utf-8?B?QXh0cXMwVzVUVWRJZkQrWmZRRm5SZ2tLeExmMXBCY0ZaZXNndWVkL253UmVj?=
 =?utf-8?B?MWhrbXhyN0JMaEJwdkNmSFdWVjN0TURnakVrZ1JpazRZNWNTZXVhd3JzMXdx?=
 =?utf-8?B?c0RuQm9BMlhsUmZiRXYwSDJtZVgzRFdQTmdHZTEwRmJCSUtyWUlJblBTeE5j?=
 =?utf-8?B?YmZmZmV4cmo4Q3J1RnJQdmIwQWhqdjZKTFgyd213WWphMG5vcFozaXFHM00r?=
 =?utf-8?B?MTM3dHAwYmI0ckJrdXNWcVdtSCthN0pPM3ByL0ZsNW9pdGdPZ0RzN3o5c2Zt?=
 =?utf-8?B?VEljV2ROand1WVZZOFd1Q2dmczdqTlBRQ2tnWW0vNXdXWGpxNVZlSGRXR3lE?=
 =?utf-8?B?bnEzQWxhVTVtSjJPZ3JJSDc2ZTkxdGFtbU41aXpUSXhtdm96SFhEaTFJWDEr?=
 =?utf-8?B?cXZyVkhJMjJ6Y3JTY3MrdldiNlVwTUhzU2hIa1NoNy9xSUNRdHZ0dHI1WFZZ?=
 =?utf-8?B?V2JyaFFDYk1VenlYME40TzhxeHV4a3hwS21jb1VaMks0WkpBRC9qckc3Q1hp?=
 =?utf-8?B?ZmJ1Tzg4cEdTSUlNTExlTjU0UjlxcS9NU2d6RGREZDJGcDJLaUlWbURsUVZr?=
 =?utf-8?B?NEx4WDM0OGFleTluckN4MkNzY1I3M3MwQXRIeHVNY1JxaXpWeXdjaWJybEZX?=
 =?utf-8?B?SU9iNGZGaWlNZjRJaEdZWWpCU0hCdDJXRk5LdHIveDlIam0zZ2ovaWpFenIw?=
 =?utf-8?B?OXF6ZGtnd3gyRzlaQlc5TDdBdUN1eHpqcGFNamNVQk8xMWxEQlJvZGxEMXkw?=
 =?utf-8?B?L2Eyc2phVVVqQUhxRkhWRERBSUg2L0lCNkxlSnpDNE80OTV5K2h4Uk9Pck13?=
 =?utf-8?B?am95bjNTODdhRkxqSEZTTWdVdFRIL0dJYWZYVWRGeCtWc3h1aERzYkZrUVFp?=
 =?utf-8?B?VWQvWjdZanlpREhYQ2s4cnVoeThxaklIZWM3ZHMyTWNnOEs0RTczbURxSnNI?=
 =?utf-8?B?UVVlcmxqLzVqTXNYQVErK0d0aSt3bFkvT3FEb0d6Tk1PWWNWRlF4Ni9aUVg2?=
 =?utf-8?B?QXFqVGlFTmZHRm9JT054eWxpazBhcVNVS2ZVM1pIL1BaUzVBdUJ2SmxadkZr?=
 =?utf-8?B?Y1ErYXZpaEZtZUtnaHdJT2UrKzNXV1RZRkpIajNIWGZLb05NMFBSTWptR2hX?=
 =?utf-8?B?NFJxWHJpWGsydW9PSkhvc0h0eFZlSUFmZC90YlRZUHN1VER0VlpwSjdsWW91?=
 =?utf-8?B?UG5OdVhHaUxSVnZzbUxsWEgzQ3hxdktyRG1kY3Q4aFZSMlVaTzUxaDlRQ1Fi?=
 =?utf-8?B?MEdqQmlhS1llV0ZUZGFBdVJvRm5YT21BeVRHV29yQ2dHOWRhZHhnSTZWeGtv?=
 =?utf-8?B?RGRORTRlN0Z4SXJRUys0anlJWGkwUys4WTBBQ3l2OTFwMzN0S2JOTmlxNWpX?=
 =?utf-8?B?MlFGRUlKM2o1OWY0MWpJeldTdEhabEVqTnNzOURUZ2Q5V3NEMVo3UDROdUhB?=
 =?utf-8?B?czlrR3dCS3BJeU1DNEdwVUp3RklEYXBMb0EyL2FLV2dzNkF1YWZndGgvaE1Y?=
 =?utf-8?B?WXEzbEVBQ2ltUXlBQ0J0Q3ZWOGZFN0gzMUFmb2RWZ2xMb1E5dlZXVDduUFZI?=
 =?utf-8?B?RExuNEdoWm5kSFNOZHFtbEs5MVUvUndXa0tsN3NlZHlXVi9qUTNPMkR5NGxk?=
 =?utf-8?B?NnUrQzJUOElxaGUzUmlEY20xdEpQQ3ZvcVdpVkNJR08wSk1IaU95NWRQZ2ty?=
 =?utf-8?B?eEI0Y21HeU5TdDR4REoxQ0lwQ0ZxcTdNSHowVW15SW5YY2x6eG4wMWZaaFRF?=
 =?utf-8?B?Y1JJZWRhaWgrQk4zSExNT3RqaHZMelF0ZllyQ1M4cWZlT0FUMkhpc1hnRVdC?=
 =?utf-8?B?R3oyUEFMWjRhMGNlOXlmSGJDZGR1TVgydEdRRS9mejBDQmFqQThRUklpM3Nu?=
 =?utf-8?B?ek9zUytIM0dDZE85V3Y0SlhsdEhpajNVWi9RdnFXSjV3WUliQ29zUlByY1I1?=
 =?utf-8?B?R2N6Vlk4bnNiejhqais5T0l0WE1VWHEvSjFQNDN2VzFnSm01bDdhN0Z3ZWhk?=
 =?utf-8?B?ZXQ2NmhwN0NKMDYrL2RZY0srNy9sWFFuN0ZjSDhNK25qV0NFbVdZdjFRelNh?=
 =?utf-8?B?MXNsbG5ONjg4ZXNlay9rMS8rSWlpTjNvMksrS3daUjFkQ0huMWZCV1VhMFJx?=
 =?utf-8?B?MWYzUXMxWjFHelRBMEJBRS9MV050cGpVZTNId3hYem8rWk9temZQVmN0MkI3?=
 =?utf-8?Q?Aem9NrA+qg4gTSds=3D?=
X-Exchange-RoutingPolicyChecked: X9bG4YqTmPvLBaLWJpK0vOsTw7JyRRvD/BT5yAsJO9H6PHRRthrh/NJ3CVh1YIAzFrtaaa68CvIbFxvU2IMKmWLqHut21e9+C8z4Qyj3C4TpYa2VPM676eTfb83xhVFeYFv75nVJvhVFMcfarVmkUhbVAZvzkMOHk/1DZz9ucjTuFPtpTtV+SbZpA4/E4KLkOY5CdFhfk5O5RG78IGcKrOIOgq79WG6qOAUmNnUndQHIJNR6bDvnoNBUYx2BqQh1hbsVGWIynR6PE/cZhf9JvoIeuWptSpa9nFJkefVJ14dCN/lUeDshBL02Zj6eJADOUeV9YNlHscsPizUeD6Cc9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d18024f7-b6c3-4680-922f-08df39df7366
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 19:19:58.7806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHCjBR4eCq2V1MeNOU7P4r3ChfuSFO+RegY4IZd8ZhqPdAmOlUZ0GgcrLDF2+EdfPOTbZh4ElIhZ6GbCC6/NqAVT9jVV/eKO+cS3gurwAB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB700629
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


On 10/30/2026 9:02 PM, Niranjana Vishwanathapura wrote:
> On Tue, Oct 27, 2026 at 09:15:41PM +0000, Jagmeet Randhawa wrote:
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
>> Add MQ_PRIORITY to issue a short burst of priority updates after each 
>> exec,
>> alternating the values since the KMD ignores a set to the current value.
>>
>> Add MQ_SOLO_CHURN, which gives every queue its own group, so 
>> destroying a
>> queue tears its group down and the recreate issues a fresh registration
>> sync. A secondary cannot be replaced within a live group, so this is the
>> only layout that is safe to churn.
>>
>> Add MQ_MANY_GROUPS, which spreads the queues over several full size 
>> groups
>> registering in parallel, widening the window where one queue's sync is
>> still outstanding while another queue waits on it.
>>
>> Add four subtests from these sources and an optional repeat_secs to 
>> repeat
>> them under igt_until_timeout() with a bounded wall clock. The combined
>> groups and priority subtest runs a single thread per engine: more 
>> threads
>> there make a dynamic update wait behind enough registrations to 
>> exceed the
>> KMD sync timeout, which bans the group instead of leaving the update 
>> to be
>> replayed.
>>
>> v2:
>> - Drop the secondary churn. A secondary cannot be replaced within a live
>>   group, so MANY_QUEUES is no longer combined with MULTI_QUEUE and
>>   MQ_CHURN_INTERVAL is gone.
>> - Add MQ_SOLO_CHURN: churn now happens on solo groups, where destroying
>>   the queue tears down the group and the recreate registers afresh.
>> - Add MQ_MANY_GROUPS to register several full size groups in parallel.
>> - Add the combined multi-queue-groups-priority subtest, so a dynamic
>>   update can queue behind an outstanding registration sync.
>> - Rename the subtests to match the new layouts.
>>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>> tests/intel/xe_exec_threads.c | 170 +++++++++++++++++++++++++++-------
>> 1 file changed, 136 insertions(+), 34 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_threads.c 
>> b/tests/intel/xe_exec_threads.c
>> index 2974fc312..c228469e2 100644
>> --- a/tests/intel/xe_exec_threads.c
>> +++ b/tests/intel/xe_exec_threads.c
>> @@ -31,7 +31,7 @@
>> #include "xe/xe_spin.h"
>> #include <string.h>
>>
>> -#define MAX_N_EXEC_QUEUES    16
>> +#define MAX_N_EXEC_QUEUES    512
>> #define USERPTR        (0x1 << 0)
>> #define REBIND        (0x1 << 1)
>> #define INVALIDATE    (0x1 << 2)
>> @@ -49,6 +49,32 @@
>> #define MANY_QUEUES    (0x1 << 14)
>> #define MULTI_QUEUE        (0x1 << 15)
>> #define WQ_STRESS        (0x1 << 16)
>> +#define MQ_SOLO_CHURN        (0x1 << 17)
>> +#define MQ_MANY_GROUPS        (0x1 << 18)
>> +#define MQ_PRIORITY        (0x1 << 19)
>
> Use 'MULTI_QUEUE' prefix instead of 'MQ' here and blow, as that is
> the standard being followed.
> Rename MQ_SLOLO_CHURN to MUTLI_QUEUE_PRIMARY_ONLY.
> I don't think we need MQ_MANY_GROUPS, see below.
Agreed, will rename everything to the MULTI_QUEUE prefix and use 
MULTI_QUEUE_PRIMARY_ONLY.
>
>> +
>> +/* Mirrors XE_MAX_GROUP_SIZE: one primary plus its secondaries. */
>> +#define MQ_GROUP_SIZE        64
>> +
>> +/* Queues used by MQ_MANY_GROUPS, enough to span several full 
>> groups. */
>> +#define MQ_MANY_GROUPS_QUEUES    (8 * MQ_GROUP_SIZE)
>> +
>> +/*
>> + * Multi-queue priority updates issued per exec. The values must 
>> alternate:
>> + * the KMD ignores a priority set to its current value, so a 
>> constant value
>> + * would generate no CGP_SYNC traffic at all.
>> + */
>> +#define MQ_PRIORITY_BURST    8
>> +
>> +/* Wall clock budget for the CGP_SYNC replay subtests. */
>> +#define CGP_REPEAT_SEC        5
>> +
>> +/*
>> + * Worker threads per engine for the registration subtests. Several 
>> groups
>> + * concurrently widens the window where one queue's CGP_SYNC is still
>> + * outstanding while another queue waits on it.
>> + */
>> +#define MQ_THREADS_PER_ENGINE    8
>>
>> /*
>>  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
>> @@ -610,6 +636,24 @@ test_compute_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>     }
>> }
>>
>> +/*
>> + * Group membership for the queue at @i. A secondary cannot be replaced
>> + * within a live group, so only the solo layout is safe to churn: there
>> + * destroying the queue tears down the whole group.
>> + */
>> +static uint64_t mq_group_value(unsigned int flags, uint32_t 
>> *exec_queues, int i)
>> +{
>> +    if (flags & MQ_SOLO_CHURN)
>> +        return DRM_XE_MULTI_GROUP_CREATE;
>> +
>> +    if (flags & MQ_MANY_GROUPS)
>> +        return i % MQ_GROUP_SIZE ?
>> +               exec_queues[(i / MQ_GROUP_SIZE) * MQ_GROUP_SIZE] :
>> +               DRM_XE_MULTI_GROUP_CREATE;
>> +
>> +    return i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>
> I won't think we need MQ_MANY_GROUPS.
> The maximum multi-queue group size is 64. So, if n_exec_queues is more 
> than that,
> then we have to automatically use many groups.
Agreed. Dropping the flag and deriving the group layout from n_exec_queues.
>
>> +}
>> +
>> static void
>> test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>>          struct drm_xe_engine_class_instance *eci, int n_exec_queues,
>> @@ -686,7 +730,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>
>>             uint64_t ext = to_user_pointer(&multi_queue);
>>
>> -            multi_queue.value = i ? exec_queues[0] : 
>> DRM_XE_MULTI_GROUP_CREATE;
>> +            multi_queue.value = mq_group_value(flags, exec_queues, i);
>>             exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>>         } else {
>>             if (!(flags & MANY_QUEUES))
>> @@ -727,13 +771,32 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>         if ((flags & WQ_STRESS) && 
>> atomic_load(&wq_stress_hang_detected))
>>             goto wq_stress_cleanup;
>>
>> -        if (flags & MANY_QUEUES) {
>> +        if (flags & (MANY_QUEUES | MQ_SOLO_CHURN)) {
>>             if (exec_queues[e]) {
>> -                igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
>> -                            INT64_MAX, 0, NULL));
>> +                /*
>> +                 * Multi-queue creates every queue up front, so a
>> +                 * slot can still be unused on its first visit and
>> +                 * its syncobj would never signal.
>> +                 */
>> +                if (i >= n_exec_queues)
>> +                    igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
>> +                                INT64_MAX, 0, NULL));
>
> In multi-queue case also, we can don't need to allocate everything 
> upfront.
> It is just that we can't destroy a secondary queue.
> So, we can simplify this code as follows
> - Pass MANY_QUEUES flag in the new subtests if we need to destroy and 
> recreate queues.
> Ensure in threads() function that when MULTI_QUEUE is set, MANY_QUEUES 
> can only be set
> if MQ_SOLO_CHURN is also set.
> - Keep the condition here 'if (flags & MANY_QUEUES)' only.
> - See below.
Agreed. Will pass MANY_QUEUES in the new subtests, assert in threads() that
MULTI_QUEUE with MANY_QUEUES also requires MULTI_QUEUE_PRIMARY_ONLY, and 
keep
the condition here as 'if (flags & MANY_QUEUES)'.
>
>>                 xe_exec_queue_destroy(fd, exec_queues[e]);
>>             }
>> -            exec_queues[e] = xe_exec_queue_create(fd, vm, eci, 0);
>> +            if (flags & MQ_SOLO_CHURN) {
>> +                struct drm_xe_ext_set_property multi_queue = {
>> +                    .base.next_extension = 0,
>> +                    .base.name = 
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +                    .property = 
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> +                    .value = DRM_XE_MULTI_GROUP_CREATE,
>> +                };
>> +
>> +                exec_queues[e] =
>> +                    xe_exec_queue_create(fd, vm, eci,
>> + to_user_pointer(&multi_queue));
>> +            } else {
>> +                exec_queues[e] = xe_exec_queue_create(fd, vm, eci, 0);
>> +            }
>
> If we define mutli_queue extension structure once at the top, logic 
> here can be simplified.
> Like only 'ext' field passed to xe_exec_queue_create() will be 
> different here.
Agreed, will define it once and only vary the ext passed to
xe_exec_queue_create().
>
>>         }
>>
>>         if (flags & HANG && e == hang_exec_queue && i == e) {
>> @@ -770,6 +833,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t 
>> addr, uint64_t userptr,
>>             xe_exec(fd, &exec);
>>         }
>>
>> +        if (flags & MQ_PRIORITY) {
>> +            uint32_t prop =
>> + DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY;
>> +            int z;
>> +
>> +            for (z = 0; z < MQ_PRIORITY_BURST; z++)
>> +                xe_exec_queue_set_property(fd, exec_queues[e],
>> +                               prop, z & 1);
>> +        }
>> +
>>         if (flags & REBIND && i && !(i & 0x1f)) {
>>             xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
>>                        0, addr, bo_size,
>> @@ -1213,6 +1286,14 @@ static void *thread(void *data)
>>  * arg[1]:
>>  * @multi-queue-basic:
>>  *    multi-queue basic
>> + * @multi-queue-solo-churn:
>> + *    multi-queue solo churn
>> + * @multi-queue-many-groups:
>> + *    multi-queue many groups
>> + * @multi-queue-priority:
>> + *    multi-queue priority
>> + * @multi-queue-groups-priority:
>> + *    multi-queue groups priority
>>  * @multi-queue-userptr:
>>  *    multi-queue userptr
>>  * @multi-queue-rebind:
>> @@ -1337,7 +1418,10 @@ static void threads(int fd, int flags)
>>     uint64_t userptr = 0x00007000eadbe000;
>>     pthread_mutex_t mutex;
>>     pthread_cond_t cond;
>> -    int n_engines = 0, class;
>> +    int n_engines = 0, class, t;
>> +    /* Extra threads only where there is no dynamic traffic to 
>> starve. */
>> +    int mq_threads = ((flags & MQ_MANY_GROUPS) &&
>> +              !(flags & MQ_PRIORITY)) ? MQ_THREADS_PER_ENGINE : 1;
>
> Update thread() function to accept num_threads_per_engine instead. See 
> below.
>
>>     uint64_t i = 0;
>>     uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
>>     bool go = false;
>> @@ -1360,7 +1444,7 @@ static void threads(int fd, int flags)
>>             }
>>     }
>>
>> -    threads_data = calloc(n_engines, sizeof(*threads_data));
>> +    threads_data = calloc(n_engines * mq_threads, 
>> sizeof(*threads_data));
>>     igt_assert(threads_data);
>>
>>     pthread_mutex_init(&mutex, 0);
>> @@ -1373,34 +1457,39 @@ static void threads(int fd, int flags)
>>                            0);
>>     }
>>
>> -    xe_for_each_engine(fd, hwe) {
>> -        if ((flags & MULTI_QUEUE) && 
>> !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>> -            continue;
>> -        threads_data[i].mutex = &mutex;
>> -        threads_data[i].cond = &cond;
>> +    for (t = 0; t < mq_threads; t++) {
>> +        xe_for_each_engine(fd, hwe) {
>> +            if ((flags & MULTI_QUEUE) &&
>> +                !xe_engine_class_supports_multi_queue(fd,
>> +                                  hwe->engine_class))
>> +                continue;
>> +            threads_data[i].mutex = &mutex;
>> +            threads_data[i].cond = &cond;
>> #define ADDRESS_SHIFT    39
>> -        threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>> -        threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>> -        threads_data[i].fd = fd;
>> -        threads_data[i].vm_legacy_mode = vm_legacy_mode;
>> -        threads_data[i].vm_compute_mode = vm_compute_mode;
>> -        threads_data[i].eci = hwe;
>> +            threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
>> +            threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
>> +            threads_data[i].fd = fd;
>> +            threads_data[i].vm_legacy_mode = vm_legacy_mode;
>> +            threads_data[i].vm_compute_mode = vm_compute_mode;
>> +            threads_data[i].eci = hwe;
>> #define N_EXEC_QUEUE    16
>> -        threads_data[i].n_exec_queue = N_EXEC_QUEUE;
>> +            threads_data[i].n_exec_queue = (flags & MQ_MANY_GROUPS) ?
>> +                MQ_MANY_GROUPS_QUEUES : N_EXEC_QUEUE;
>
> If we want dynamic value settings, then should first update the function
> to accept the value from the caller and use it instead of trying to 
> determine
> the value from the flags.
>
> In a preliminary patch, update the thread() function to accept values 
> like
> num_threads_per_engine and n_exec_queues with existing callers passing 
> values
> 1 and 16 respectively.
> Then in the subsequent patch with these new multi-queue subtests, you 
> can pass
> other values as needed by each new subtest.
Agreed. v3 will be a 2 patch series: first the threads() signature 
change with
existing callers passing 1 and 16, then the new subtests passing their own
values.
>
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
>> @@ -1457,7 +1546,7 @@ static void threads(int fd, int flags)
>>     pthread_cond_broadcast(&cond);
>>     pthread_mutex_unlock(&mutex);
>>
>> -    for (i = 0; i < n_engines; ++i)
>> +    for (i = 0; i < n_engines * mq_threads; ++i)
>>         pthread_join(threads_data[i].thread, NULL);
>>
>>     if (vm_legacy_mode)
>> @@ -1483,6 +1572,7 @@ int igt_main()
>>     const struct section {
>>         const char *name;
>>         unsigned int flags;
>> +        unsigned int repeat_secs;
>>     } sections[] = {
>>         { "basic", 0 },
>>         { "many-queues", MANY_QUEUES },
>> @@ -1729,6 +1819,14 @@ int igt_main()
>>             USERPTR | INVALIDATE },
>>         { "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | 
>> COMPUTE_MODE | FD |
>>             USERPTR | INVALIDATE | RACE },
>> +        { "multi-queue-solo-churn", MULTI_QUEUE | MQ_SOLO_CHURN,
>> +            CGP_REPEAT_SEC },
>> +        { "multi-queue-many-groups", MULTI_QUEUE | MQ_MANY_GROUPS,
>> +            CGP_REPEAT_SEC },
>> +        { "multi-queue-priority", MULTI_QUEUE | MQ_PRIORITY,
>> +            CGP_REPEAT_SEC },
>> +        { "multi-queue-groups-priority", MULTI_QUEUE | MQ_MANY_GROUPS |
>> +            MQ_PRIORITY, CGP_REPEAT_SEC },
>
> Do we need all 4 tests to create those 4 scenarios?
>
> Niranjana
Two, not four. Once num_threads_per_engine and n_exec_queues are parameters,
solo-churn and priority become subsets of the other two and can go.

The remaining two cannot be merged. Many parallel registrations make a 
dynamic
priority update wait behind them, and past one second that exceeds the
wait_event_timeout() in xe_guc_exec_queue_group_cgp_sync(), which bans 
the group
and resets the GT before recovery replays anything. Measured over VF 
migration:
8 threads/engine with priority updates gave 81 bans, 2 GT resets and 0 
replays,
while 1 thread/engine gave 0 bans and 5722 replays.

So one subtest registers heavily to reach "Replay REGISTER (cgp sync)", 
and a
second runs dynamic priority updates at 1 thread/engine to reach "Replay 
CGP_SYNC".

Jagmeet

>
>>         { NULL },
>>     };
>>     int fd;
>> @@ -1748,7 +1846,11 @@ int igt_main()
>>             if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
>>                 ignore_multi_queue_hang_warnings_in_dmesg();
>>
>> -            threads(fd, s->flags);
>> +            if (s->repeat_secs)
>> +                igt_until_timeout(s->repeat_secs)
>> +                    threads(fd, s->flags);
>> +            else
>> +                threads(fd, s->flags);
>>         }
>>     }
>>
>> -- 
>> 2.53.0
>>
