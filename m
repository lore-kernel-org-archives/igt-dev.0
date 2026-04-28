Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD59CFF885D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 11:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5337A10E6D1;
	Tue, 28 Apr 2026 11:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfK56bpJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2CE10E6D1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 11:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777376021; x=1808912021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MhPzNO6zuAo9oi4peJ5tiT9Y8lc75jJVZ0ZaOnsIMtA=;
 b=mfK56bpJjHOA0+zOmcY3TgeDorSoMRz+5k7btbGc8ScO6Vn/7A1+qis4
 uhQQHzNMxIyV11akKJnND9ZHVIASMjd/aEPlknF0v0iSn/KUHRb/OucTB
 VSTwd9DOQAamqsfBJ+WMMxmL/+mbu+Bc9BRA96uLEKswfa/w61HWFdNPA
 pZ9pHnNeWdQRnHjnEyhWC7i7pxSmRaIV73ltmq0WYJSJZ0fDgJSIeHPwm
 X5jVB3vCwxsJLxK9IXfdrHl5GpEr5Gz6vMvj6CvGF1NOuUoKMS6uU05KJ
 EkwLIu/TL4zDWLpYRHm2fVyECKMehnLeU1ItLxBKWCKt2nf4nRC2SINYd Q==;
X-CSE-ConnectionGUID: rbptyDCZT5S53tmE1ZfZMw==
X-CSE-MsgGUID: 06E/RX1vTeGLIddKEqAveg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88978461"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="88978461"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:33:41 -0700
X-CSE-ConnectionGUID: z31oQKOGTaqROgJONrYRMA==
X-CSE-MsgGUID: mc2Q/3FRTmm2TpsXZbSZSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238913541"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:33:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 04:33:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 04:33:40 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 04:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIER6ZD+BoroRtSK0GBLkM2rc66Oms3EFRMfMx3kxHz0ZQ4cEJCwwbtBY4PFsuwuO3tdQvcLzcJMIzDwB8XSv2QctUHtSoJJDxOHx7uUccWDrghul9DO679C7PQ4c8fXR/I7oB6hcgBCGB08nzDCefUYXO+qVLkQtT+jVIv3a3HaN9YAwntR9Zgvm5fCpCErixFzPvTsMlcxHqQx52AML4PV08R72340Snm1qmtv6d14ypa9gW6M/pgCC+Ef9eES5geL0+4r3rZROj27ug8mB7v8IRbDVQR1JaVwLWlqQpm9/DOSf8dOU+7jjsWArO9S0UlLCYV+zgJiuL0at6Teog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0Wsj9enUR08JRKZRBvmnF+VIj/vPQtvziMQQtXW4lA=;
 b=UKkSzHMYK5NrURIMAJQ70oRhSXar9aPTCWOn96tKncikagglu8dVKXUiMNL2FYayRySl+m1Wacwc7fejm0+lAqx8KclSXuBUPJD6gqaDANLuE5lb3ZmbA5xbxEmY6431q3cLetvKxAG0wVIdhR4ePSSXEv/OAJvf/ygpuK+JUHdArl5X4v1pAyRfINR+5JhORuj97inHHP1+yr05EICWd3zcuW5/nKGt7khpEvTseiUJ25FRzr4ypwhi9nwfLTnMNyDMxr2KyqMAqdfKp3zUWYBA0UzLxnJcP/YElEdE7Oh1BwPBx2gJTdmbzcT0Y4I3qeL0KEu03X53RZ/VZAGe7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DM4PR11MB6358.namprd11.prod.outlook.com (2603:10b6:8:b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 11:33:33 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 11:33:33 +0000
Message-ID: <c1ac896c-bf97-4133-b941-de9dba3d71ce@intel.com>
Date: Tue, 28 Apr 2026 17:03:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3 1/5] lib/igt_hdr: Move HDR helpers from kms_hdr
 into shared library
To: Jani Nikula <jani.nikula@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Suraj Kandpal <suraj.kandpal@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Karthik B S <karthik.b.s@intel.com>
References: <20260417213818.2050571-1-swati2.sharma@intel.com>
 <20260417213818.2050571-2-swati2.sharma@intel.com>
 <20260420184633.sxlkomq6m4u2y65k@kamilkon-DESK.igk.intel.com>
 <033657672987bf60eab2d60756c105a8b8010f2c@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <033657672987bf60eab2d60756c105a8b8010f2c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DM4PR11MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: db3d5130-9760-4d6f-ade3-08dea519fa13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: XRINVMyGWvLF3WF76+ZHUW5/5OvXSDLImc2cH1K7gaNOqzbtgguBdD7ghd/3ZNdOXOYPw6/Z0iDVCTMuOczs3vYpIytoI0MdOliraeDy04f1l7BZQBvArfbMWNLTocHonrx9lsVEVgZXwPPW+wfFIHIr0WRUPbshXJ0HRPOvXPIsBIxGm9i/3Sw4/FvuAd3gjSLuKH1MoAMMDoExprDXHvrStVx6HfxVLKpfn58L/4FbZ4YgCXKYSPlhKafN6/6l8hwpCKzjpjHT4LiDIBmNrMEDuMUSXJM6cfUW4/BUKSMXV7fLmeHBdnhInKPVPr5gwn/GW0rGAQlXlvYBApxeS9S5dzIQIH1exu+gIwV//NLUtmBqjk+93bYbpB/Md7navnNhe/W5oA6zLNjU0az2Pzax+QHHIyQJeawGRzXj1Z0rb7ZkTlMsSy1OKbHjbrDyhLtO7T/MVJ6McRl2Kezi9ni9dAjqQ6wWNBDMCcoLnJzMgHw22a9CNUvwtpIt2l7q9BuU9JIZ+CKd3vkY0lgGqD5zkcoJ1c6cv4+7jN9kWXj+MmMOr75ykpl3PoaShY2rilncBRizWTc2Cd023NiTv0vCrwm8rV2KvDnJgH0fAj6OLMUdYcll0X2r6e4qntQK0aD8ALPhBlHZxKxfzKD8EYd36KPhbguQvx35acLv7XlC3f0Ipk5sx+hZuX6QDwJU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNoQzBMc2trcml5OWI5YkFkR0szUWh2QUZYS3YwNWcxY0JLSEU4WnBtZ2lv?=
 =?utf-8?B?alk5LzVZWFlzZmttN3I5ajZlUUYyOEIwU291VlZSc1ROdTkvYVk5dkV0bW1p?=
 =?utf-8?B?UUxoOXdDRGdIWXhXYnpjYXJIaGVSZlMzVXVNbDJsZ1pVL2ZIeVpGZ1RiTHRB?=
 =?utf-8?B?cXhuWmlmOVM0Wk5PWW9zNjd3bzM4TWJRdTI1M3JkbVhETUMrMmNuQ2IxcDZO?=
 =?utf-8?B?Smg1QTJraHZhWGplZFVWT1dTQjV2V29tQlhUV1N4WnVKcmtPMWhrMFNKOXIv?=
 =?utf-8?B?bHlHK0tHTnZHTmxsSUJieGJ5S2gyeHh0UEJ5aWcySmxCdzhRS0x5eTNsQlNl?=
 =?utf-8?B?TTdYTnN6bDc1NEZzbURLa3U1WDczOEYyUy9DeDhLekt3MEdiQU5HS3hsc1E2?=
 =?utf-8?B?UGVSbEt5aUtvZVptMXB5VWFnQ1R6OHp1Y1FlZTJFUjg5a3JPMmIzVU9HelRx?=
 =?utf-8?B?MFcyYlZoN3J4bWtJeXZSdGZ2LzZqVEZtM2o5a1k4aDFWM0RPSll4T0IwQUIz?=
 =?utf-8?B?MnhYUERMbnhrR0o1K2gweWZzUjUrTkVBOEVkcy80ampEM3dvcmpFSUJvVmRV?=
 =?utf-8?B?VUp3SXpBNUc4YlVMUWZFTmFTWGxFN25sSUU1RWJHZEhXRHdTMUozRVI0U0JX?=
 =?utf-8?B?Snh5ek1RRjVYbk1JNTRTc3F3ZlZ6OHR2R3dZK0s2VW05ajdQTUk5L0JpS2Fw?=
 =?utf-8?B?dzFyZ3dPUG5SSVFlYk5rUWlEVzYzakFsS0M0b0ZaQkVLa3NXWEorSDBxYnA0?=
 =?utf-8?B?RlVDeFZFK01kaVpudVUybm1TTjhQcEZiQmdRSUx6MVEwc2FDendZclZnSzNC?=
 =?utf-8?B?V3hUdC8vdTRTYzQ0emhsVkFIZGpIRHhINWUwSzlJT3RtaVVibyt3b2dNWFVQ?=
 =?utf-8?B?WmhGc3lIOHlFcWx0L2NJK2M0Q2NWQlVLaGZtNG54ZDlyZi9kOHJESXhZekJx?=
 =?utf-8?B?dDRWQXBEQVZOOFJ4VkFtSEYrNG4xT09jQ3VNS0ZkTmJFaGlmdzZyOXVZaWpw?=
 =?utf-8?B?T2VpbXkvSHZlTUhKWFJvbmJ1eGtPNjh4OC82QWVaNkNsakF2T1ZFOEdwbHFu?=
 =?utf-8?B?NzZ0c3U5dTZOc200ZkNEWmNoVmhGTHowd2w0bmRqQk96aWljcXpZeFFITEtS?=
 =?utf-8?B?dGVsTmE5WWhYNnpEV1BKaVdRcHB0VHQ5anNIQVNpV2E0YWlndnVXTDJ6Tml5?=
 =?utf-8?B?bWZtYWM4YkxDNEx3TWZNd01tUlQ1cis3QnJtd1JpbW1NM09UYXZaRGpsekQ0?=
 =?utf-8?B?clh3U2JJcDZOMTlBWDhoZmhBd0VEUFdjVWR4NERMRGFQeTJ6L0dha2pjTDdQ?=
 =?utf-8?B?aG0wZUVPeTJ3Um51Rnd3bDc0WGNqVzhIY3BNSlhRTWpUWHR3NGhUeTU0TlNz?=
 =?utf-8?B?Q0YzaGxYblBHWFZSL2RZVitpY0dkQjZPeldnREhkcGxtRGNuc3hGM2tHdExu?=
 =?utf-8?B?R0J6SG1JTFNwMkdPbkM5dDFzS2llSEVta2NwWW1BQzdxNWZldDBZTUY5TVUy?=
 =?utf-8?B?cFlHbitLVzBIeUwrWStRa1JFNGJLL1l5WjdaVFJ3U1d6WlkrYTdVT0lxWlJU?=
 =?utf-8?B?emhLVlltQm5JbllyYmViWXc3Ujh2ZU92S01QOFBEaDcvQVpkNmtwaExVSnlz?=
 =?utf-8?B?YXFvMXpNV21RWDU5cXVadFlzcGZscmFNUTh6QTdLSjFOaHVpZ2JJODhTWm1v?=
 =?utf-8?B?UEU0RFVFbTVJV2lWaGZxcVVMZlgvTE5udUJBNjcrczhKTkpLalFqcEwzRlYx?=
 =?utf-8?B?M3Fjb1NxQ3FFK2dqZEFWWG9JbDJORk8yUy82bHJ0UFFidzdTUDU2NEN0ZHFj?=
 =?utf-8?B?dnhZNklzd2VsM1UwbDNIYnNxUGprdCtScGNJd1BwOENhN3EvekRlc3UzckpX?=
 =?utf-8?B?RGlydHdqRmsyYUVlQjV5cEYrVUc3WGRTc0F5NEoxRmJsWk9xT2YwV0VJODNy?=
 =?utf-8?B?U05QcURtMmJQaUgrZ1psMzFzdGh5Qmlnd1JEQVVGRDM3RHVRRlc1akV4ZnE4?=
 =?utf-8?B?NXZQc3NuUTVZV0VEUEYyN0lxL0MvNWNHSTJuZ1Uya0tHUFhKVjB2Z3V0T214?=
 =?utf-8?B?aDlNYlhhZldEb2s2QmxOcW40a29OQmlxdFhsUGdQRHdkdEFZS1B4RStFM25Y?=
 =?utf-8?B?RTVSTzVwWmpzbENMOWhqUlg1TGlRREIxc1NXNlN6Q2FLdEJjRHljMG82NFU3?=
 =?utf-8?B?OUFqeFhOYkxrL0YyQ253SUttYjFOdk9KZUdFR01qQ2U0ZFdPenhmelJJOXor?=
 =?utf-8?B?VUJpMXN6RTNpbnJQQ3ptcHdjaXlQLy9CL2hoZ0RYZ0FQWU1wQXhaaklUS3p6?=
 =?utf-8?B?aGVBNTYyRlg4Y1RLT3laaHd6UVhTMmVpcTBLQm5kajBDQy9zaHI1dHBYRFh4?=
 =?utf-8?Q?KZYfXrL9JFUv/CXs=3D?=
X-Exchange-RoutingPolicyChecked: hYZhbQag8vhA/xmDyxwuKtF8q09gY3apdpVg3utvf6vtB9gex1UusUg9a+Z6Nw9sUtoQwTBQlFuWQuSVbNDtc/TM+7ILny03tW0I1roY4sFhbfei4dZWfgZZgwXRzIhd9IpyFNv2oGyqt2hWLqQnsXqofyRgxG+B2SjncaKCS91lau8OpAQwqCfuMITqitendXSJ+ZoE0JIzPkPvnbSPtqMFiFKN9+XV8v2g1gFgQ17KV1vxnMfIQe0+5veWfBFLXNvU/VngoXRyyHFYagxtXZM8GccGo+YHA3j/UN8Bg95d5NRQgOD1orPGc1/J/DxOnN/2aHz4Y4RBj4ReZ9PeLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: db3d5130-9760-4d6f-ade3-08dea519fa13
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 11:33:32.7764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKqSBcPPL4hIlNFs7t/tVDAR8Zzvf8NaKFV5wV0qruh1x+XFnMjBAS6eweqlzZ9vF2kGZs1/4EEECIneeeH57w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6358
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

Hi Jani

On 21-04-2026 06:11 pm, Jani Nikula wrote:
> On Mon, 20 Apr 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
>> Hi Swati,
>> On 2026-04-18 at 03:08:14 +0530, Swati Sharma wrote:
>>> Introduce lib/igt_hdr.{c,h} containing metadata fill helpers, EOTF enums,
>>> ST2084 construction, and blob programming utilities. This allows
>>> kms_hdr and upcoming tests (e.g., HDR support in kms_frontbuffer_tracking)
>>> to share common HDR code.
>>>
>>> v2: -place igt headers in alphabetical order (Kamil)
>>>
>>> Co-developed-by: Claude Opus 4.6
>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>>> ---
>>>   lib/igt_hdr.c   | 217 +++++++++++++++++++++++++++++++++++
>>>   lib/igt_hdr.h   |  33 ++++++
>>>   lib/meson.build |   1 +
>>>   tests/kms_hdr.c | 297 ++++++++----------------------------------------
>>>   4 files changed, 300 insertions(+), 248 deletions(-)
>>>   create mode 100644 lib/igt_hdr.c
>>>   create mode 100644 lib/igt_hdr.h
>>>
>>> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
>>> new file mode 100644
>>> index 000000000..5feb1d917
>>> --- /dev/null
>>> +++ b/lib/igt_hdr.c
>>> @@ -0,0 +1,217 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>> Year 2026.
>>
>>> + */
>>> +
>>> +#include "igt.h"
>>> +#include "igt_edid.h"
>>> +#include "igt_hdr.h"
>>> +
>>> +#include <fcntl.h>
>>> +#include <termios.h>
>>> +#include <unistd.h>
>>> +
>>> +/* HDR EDID parsing. */
>> Should this be in lib/igt_edid.c?
> Well, should this just use libdislay-info, like I suggested in another
> series adding more ad hoc EDID parsing [1].
>
> There is no point in reimplementing full blown EDID parsing in IGT. It's
> more than likely to be wrong. Like, just at a glance, the current HDR
> parsing doesn't look at CTA data blocks inside DisplayID extensions. It
> doesn't understand HF-EEODB. Etc. Arguably it's more work to fix it than
> to switch to libdislay-info.
>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/57222f9789fda352ed26606c1f80e35fcdeb3d37@intel.com

Ack

Kamil has created 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/204

Will work on this.

>
>>> +#define CTA_EXTENSION_VERSION		0x03
>>> +#define HDR_STATIC_METADATA_BLOCK       0x06
>>> +#define USE_EXTENDED_TAG		0x07
>>> +
>>> +static bool cta_block(const char *edid_ext)
>>> +{
>>> +	/*
>>> +	 * Byte 1: 0x07 indicates Extended Tag
>>> +	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
>>> +	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
>>> +	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
>>> +	 *	             ET_1: Traditional Gamma - HDR Luminance Range
>>> +	 *	             ET_2: SMPTE ST 2084
>>> +	 *	             ET_3: Hybrid Log-Gamma (HLG)
>>> +	 *	             ET_4 to ET_5: Reserved for future use
>>> +	 */
>>> +
>>> +	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
>>> +	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
>>> +	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
>>> +	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
>>> +			return true;
>>> +
>>> +	return false;
>>> +}
>>> +
>>> +/* Returns true if panel supports HDR. */
>> All public lib functions, this one and following ones, needs
>> a description, see for example lib/igt_configfs.c
>>
>>> +bool igt_is_panel_hdr(int fd, igt_output_t *output)
>> Or maybe it should be in lib/igt_hdr_panel.h|c?
>>
>> +cc Karthik and J-P
>>
>>> +{
>>> +	bool ok;
>>> +	int i, j, offset;
>>> +	uint64_t edid_blob_id;
>>> +	drmModePropertyBlobRes *edid_blob;
>>> +	const struct edid_ext *edid_ext;
>>> +	const struct edid *edid;
>>> +	const struct edid_cea *edid_cea;
>>> +	const char *cea_data;
>>> +	bool ret = false;
>>> +
>>> +	ok = kmstest_get_property(fd, output->id,
>>> +			DRM_MODE_OBJECT_CONNECTOR, "EDID",
>>> +			NULL, &edid_blob_id, NULL);
>>> +
>>> +	if (!ok || !edid_blob_id)
>>> +		return ret;
>>> +
>>> +	edid_blob = drmModeGetPropertyBlob(fd, edid_blob_id);
>>> +	igt_assert(edid_blob);
>>> +
>>> +	edid = (const struct edid *) edid_blob->data;
>>> +	igt_assert(edid);
>>> +
>>> +	for (i = 0; i < edid->extensions_len; i++) {
>>> +		edid_ext = &edid->extensions[i];
>>> +		edid_cea = &edid_ext->data.cea;
>>> +
>>> +		/* HDR not defined in CTA Extension Version < 3. */
>>> +		if ((edid_ext->tag != EDID_EXT_CEA) ||
>>> +		    (edid_cea->revision != CTA_EXTENSION_VERSION))
>>> +				continue;
>>> +		else {
>>> +			offset = edid_cea->dtd_start;
>>> +			cea_data = edid_cea->data;
>>> +
>>> +			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
>>> +				ret = cta_block(cea_data + j);
>>> +
>>> +				if (ret)
>>> +					break;
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	drmModeFreePropertyBlob(edid_blob);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +/* Converts a double to 861-G spec FP format. */
>>> +uint16_t igt_hdr_calc_float(double val)
>>> +{
>>> +	return (uint16_t)(val * 50000.0);
>>> +}
>>> +
>>> +/* Fills some test values for ST2084 HDR output metadata.
>>> + *
>>> + * Note: there isn't really a standard for what the metadata is supposed
>>> + * to do on the display side of things. The display is free to ignore it
>>> + * and clip the output, use it to help tonemap to the content range,
>>> + * or do anything they want, really.
>>> + */
>>> +void igt_hdr_fill_st2084(struct hdr_output_metadata *meta)
>>> +{
>>> +	memset(meta, 0, sizeof(*meta));
>>> +
>>> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
>>> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
>>> +
>>> +	/* Rec. 2020 */
>>> +	meta->hdmi_metadata_type1.display_primaries[0].x =
>>> +		igt_hdr_calc_float(0.708); /* Red */
>>> +	meta->hdmi_metadata_type1.display_primaries[0].y =
>>> +		igt_hdr_calc_float(0.292);
>>> +	meta->hdmi_metadata_type1.display_primaries[1].x =
>>> +		igt_hdr_calc_float(0.170); /* Green */
>>> +	meta->hdmi_metadata_type1.display_primaries[1].y =
>>> +		igt_hdr_calc_float(0.797);
>>> +	meta->hdmi_metadata_type1.display_primaries[2].x =
>>> +		igt_hdr_calc_float(0.131); /* Blue */
>>> +	meta->hdmi_metadata_type1.display_primaries[2].y =
>>> +		igt_hdr_calc_float(0.046);
>>> +	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_float(0.3127);
>>> +	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_float(0.3290);
>>> +
>>> +	meta->hdmi_metadata_type1.max_display_mastering_luminance =
>>> +		1000; /* 1000 nits */
>>> +	meta->hdmi_metadata_type1.min_display_mastering_luminance =
>>> +		500;				   /* 0.05 nits */
>>> +	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
>>> +	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
>>> +}
>>> +
>>> +/* Fills some test values for HDR metadata targeting SDR. */
>>> +void igt_hdr_fill_sdr(struct hdr_output_metadata *meta)
>>> +{
>>> +	memset(meta, 0, sizeof(*meta));
>>> +
>>> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
>>> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
>>> +
>>> +	/* Rec. 709 */
>>> +	meta->hdmi_metadata_type1.display_primaries[0].x =
>>> +		igt_hdr_calc_float(0.640); /* Red */
>>> +	meta->hdmi_metadata_type1.display_primaries[0].y =
>>> +		igt_hdr_calc_float(0.330);
>>> +	meta->hdmi_metadata_type1.display_primaries[1].x =
>>> +		igt_hdr_calc_float(0.300); /* Green */
>>> +	meta->hdmi_metadata_type1.display_primaries[1].y =
>>> +		igt_hdr_calc_float(0.600);
>>> +	meta->hdmi_metadata_type1.display_primaries[2].x =
>>> +		igt_hdr_calc_float(0.150); /* Blue */
>>> +	meta->hdmi_metadata_type1.display_primaries[2].y =
>>> +		igt_hdr_calc_float(0.006);
>>> +	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_float(0.3127);
>>> +	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_float(0.3290);
>>> +
>>> +	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
>>> +	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
>>> +	meta->hdmi_metadata_type1.max_fall = 0;
>>> +	meta->hdmi_metadata_type1.max_cll = 0;
>>> +}
>>> +
>>> +/* Sets the HDR output metadata prop. */
>>> +void igt_hdr_set_metadata(igt_output_t *output,
>>> +                          const struct hdr_output_metadata *meta)
>>> +{
>>> +	igt_output_replace_prop_blob(output,
>>> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>>> +				     meta ? sizeof(*meta) : 0);
>>> +}
>>> +
>>> +/* Sets the HDR output metadata prop with invalid size. */
>>> +int igt_hdr_set_invalid_metadata(igt_output_t *output,
>> Do we need this function in lib?
>>
>>> +                                 const struct hdr_output_metadata *meta,
>>> +				 size_t len)
>>> +{
>>> +	igt_output_replace_prop_blob(output,
>>> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>>> +				     meta ? len : 0);
>>> +
>>> +	return igt_display_try_commit_atomic(output->display,
>>> +	                                     DRM_MODE_ATOMIC_ALLOW_MODESET,
>>> +					     NULL);
>>> +}
>>> +
>>> +/* Returns true if an output supports max bpc property. */
>>> +bool igt_output_supports_max_bpc(igt_output_t *output)
>>> +{
>>> +	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
>>> +	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>>> +}
>>> +
>>> +/* Returns true if an output supports HDR metadata property. */
>>> +bool igt_output_supports_hdr(igt_output_t *output)
>>> +{
>>> +	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>>> +}
>>> +
>>> +void igt_hdr_disable(igt_output_t *output)
>>> +{
>>> +	igt_hdr_set_metadata(output, NULL);
>>> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 8);
>>> +}
>>> +
>>> +void igt_hdr_enable(igt_output_t *output)
>>> +{
>>> +	struct hdr_output_metadata meta;
>>> +
>>> +	/* Fill HDR metadata and enable it on the output */
>>> +	igt_hdr_fill_st2084(&meta);
>>> +	igt_hdr_set_metadata(output, &meta);
>>> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
>>> +}
>>> diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
>>> new file mode 100644
>>> index 000000000..0df1ac5ed
>>> --- /dev/null
>>> +++ b/lib/igt_hdr.h
>>> @@ -0,0 +1,33 @@
>>> +#ifndef IGT_HDR_H
>>> +#define IGT_HDR_H
>>> +
>>> +#include "igt_edid.h"
>>> +#include "igt_kms.h"
>>> +
>>> +enum hdmi_eotf {
>>> +	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
>>> +	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
>>> +	HDMI_EOTF_SMPTE_ST2084,
>>> +};
>>> +
>>> +/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
>>> +enum hdmi_metadata_type {
>>> +	HDMI_STATIC_METADATA_TYPE1 = 0,
>>> +};
>>> +
>>> +bool igt_is_panel_hdr(int fd, igt_output_t *output);
>>> +
>>> +uint16_t igt_hdr_calc_float(double val);
>>> +void igt_hdr_fill_st2084(struct hdr_output_metadata *meta);
>>> +void igt_hdr_fill_sdr(struct hdr_output_metadata *meta);
>>> +
>>> +void igt_hdr_set_metadata(igt_output_t *output,
>>> +                          const struct hdr_output_metadata *meta);
>>> +int igt_hdr_set_invalid_metadata(igt_output_t *output,
>>> +                                 const struct hdr_output_metadata *meta,
>>> +				 size_t len);
>>> +
>>> +bool igt_output_supports_max_bpc(igt_output_t *output);
>>> +bool igt_output_supports_hdr(igt_output_t *output);
>>> +
>>> +#endif /* IGT_HDR_H */
>>> diff --git a/lib/meson.build b/lib/meson.build
>>> index 0e7efadf3..d76a0d332 100644
>>> --- a/lib/meson.build
>>> +++ b/lib/meson.build
>>> @@ -111,6 +111,7 @@ lib_sources = [
>>>   	'igt_vc4.c',
>>>   	'igt_vmwgfx.c',
>>>   	'igt_psr.c',
>>> +	'igt_hdr.c',
>> Can you move it down to more proper place along with igt_psr.c?
>>
>> Regards,
>> Kamil
>>
>>>   	'igt_amd.c',
>>>   	'igt_edid.c',
>>>   	'igt_eld.c',
>>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>>> index b215b0e6c..eb336f14d 100644
>>> --- a/tests/kms_hdr.c
>>> +++ b/tests/kms_hdr.c
>>> @@ -33,6 +33,7 @@
>>>   #include <termios.h>
>>>   #include <unistd.h>
>>>   #include "igt_edid.h"
>>> +#include "igt_hdr.h"
>>>   
>>>   /**
>>>    * SUBTEST: bpc-switch
>>> @@ -70,24 +71,8 @@
>>>   
>>>   IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>>>   
>>> -/* HDR EDID parsing. */
>>> -#define CTA_EXTENSION_VERSION		0x03
>>> -#define HDR_STATIC_METADATA_BLOCK       0x06
>>> -#define USE_EXTENDED_TAG		0x07
>>> -
>>>   #define BACKLIGHT_PATH "/sys/class/backlight"
>>>   
>>> -/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
>>> -enum hdmi_metadata_type {
>>> -	HDMI_STATIC_METADATA_TYPE1 = 0,
>>> -};
>>> -
>>> -enum hdmi_eotf {
>>> -	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
>>> -	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
>>> -	HDMI_EOTF_SMPTE_ST2084,
>>> -};
>>> -
>>>   /* HDR test formats: 10bpc + FP16 */
>>>   static const uint32_t hdr_test_formats[] = {
>>>   	DRM_FORMAT_XRGB2101010,
>>> @@ -154,59 +139,6 @@ static void draw_hdr_pattern(igt_fb_t *fb)
>>>   	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
>>>   }
>>>   
>>> -/* Converts a double to 861-G spec FP format. */
>>> -static uint16_t calc_hdr_float(double val)
>>> -{
>>> -	return (uint16_t)(val * 50000.0);
>>> -}
>>> -
>>> -/* Fills some test values for ST2084 HDR output metadata.
>>> - *
>>> - * Note: there isn't really a standard for what the metadata is supposed
>>> - * to do on the display side of things. The display is free to ignore it
>>> - * and clip the output, use it to help tonemap to the content range,
>>> - * or do anything they want, really.
>>> - */
>>> -static void fill_hdr_output_metadata_st2084(struct hdr_output_metadata *meta)
>>> -{
>>> -	memset(meta, 0, sizeof(*meta));
>>> -
>>> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
>>> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
>>> -
>>> -	/* Rec. 2020 */
>>> -	meta->hdmi_metadata_type1.display_primaries[0].x =
>>> -		calc_hdr_float(0.708); /* Red */
>>> -	meta->hdmi_metadata_type1.display_primaries[0].y =
>>> -		calc_hdr_float(0.292);
>>> -	meta->hdmi_metadata_type1.display_primaries[1].x =
>>> -		calc_hdr_float(0.170); /* Green */
>>> -	meta->hdmi_metadata_type1.display_primaries[1].y =
>>> -		calc_hdr_float(0.797);
>>> -	meta->hdmi_metadata_type1.display_primaries[2].x =
>>> -		calc_hdr_float(0.131); /* Blue */
>>> -	meta->hdmi_metadata_type1.display_primaries[2].y =
>>> -		calc_hdr_float(0.046);
>>> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
>>> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
>>> -
>>> -	meta->hdmi_metadata_type1.max_display_mastering_luminance =
>>> -		1000; /* 1000 nits */
>>> -	meta->hdmi_metadata_type1.min_display_mastering_luminance =
>>> -		500;				   /* 0.05 nits */
>>> -	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
>>> -	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
>>> -}
>>> -
>>> -/* Sets the HDR output metadata prop. */
>>> -static void set_hdr_output_metadata(data_t *data,
>>> -				    struct hdr_output_metadata const *meta)
>>> -{
>>> -	igt_output_replace_prop_blob(data->output,
>>> -				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>>> -				     meta ? sizeof(*meta) : 0);
>>> -}
>>> -
>>>   /* Prepare test data. */
>>>   static void prepare_test(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
>>>   {
>>> @@ -308,13 +240,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
>>>   	igt_remove_fb(data->fd, &afb);
>>>   }
>>>   
>>> -/* Returns true if an output supports max bpc property. */
>>> -static bool has_max_bpc(igt_output_t *output)
>>> -{
>>> -	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
>>> -	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>>> -}
>>> -
>>>   static void test_bpc_switch(data_t *data, uint32_t flags)
>>>   {
>>>   	igt_display_t *display = &data->display;
>>> @@ -325,7 +250,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>>   	for_each_connected_output(display, output) {
>>>   		igt_crtc_t *crtc;
>>>   
>>> -		if (!has_max_bpc(output)) {
>>> +		if (!igt_output_supports_max_bpc(output)) {
>>>   			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
>>>   				 igt_output_name(output));
>>>   			continue;
>>> @@ -375,92 +300,6 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>>   	}
>>>   }
>>>   
>>> -static bool cta_block(const char *edid_ext)
>>> -{
>>> -	/*
>>> -	 * Byte 1: 0x07 indicates Extended Tag
>>> -	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
>>> -	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
>>> -	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
>>> -	 *	             ET_1: Traditional Gamma - HDR Luminance Range
>>> -	 *	             ET_2: SMPTE ST 2084
>>> -	 *	             ET_3: Hybrid Log-Gamma (HLG)
>>> -	 *	             ET_4 to ET_5: Reserved for future use
>>> -	 */
>>> -
>>> -	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
>>> -	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
>>> -	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
>>> -	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
>>> -			return true;
>>> -
>>> -	return false;
>>> -}
>>> -
>>> -/* Returns true if panel supports HDR. */
>>> -static bool is_panel_hdr(data_t *data, igt_output_t *output)
>>> -{
>>> -	bool ok;
>>> -	int i, j, offset;
>>> -	uint64_t edid_blob_id;
>>> -	drmModePropertyBlobRes *edid_blob;
>>> -	const struct edid_ext *edid_ext;
>>> -	const struct edid *edid;
>>> -	const struct edid_cea *edid_cea;
>>> -	const char *cea_data;
>>> -	bool ret = false;
>>> -
>>> -	ok = kmstest_get_property(data->fd, output->id,
>>> -			DRM_MODE_OBJECT_CONNECTOR, "EDID",
>>> -			NULL, &edid_blob_id, NULL);
>>> -
>>> -	if (!ok || !edid_blob_id)
>>> -		return ret;
>>> -
>>> -	edid_blob = drmModeGetPropertyBlob(data->fd, edid_blob_id);
>>> -	igt_assert(edid_blob);
>>> -
>>> -	edid = (const struct edid *) edid_blob->data;
>>> -	igt_assert(edid);
>>> -
>>> -	drmModeFreePropertyBlob(edid_blob);
>>> -
>>> -	for (i = 0; i < edid->extensions_len; i++) {
>>> -		edid_ext = &edid->extensions[i];
>>> -		edid_cea = &edid_ext->data.cea;
>>> -
>>> -		/* HDR not defined in CTA Extension Version < 3. */
>>> -		if ((edid_ext->tag != EDID_EXT_CEA) ||
>>> -		    (edid_cea->revision != CTA_EXTENSION_VERSION))
>>> -				continue;
>>> -		else {
>>> -			offset = edid_cea->dtd_start;
>>> -			cea_data = edid_cea->data;
>>> -
>>> -			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
>>> -				ret = cta_block(cea_data + j);
>>> -
>>> -				if (ret)
>>> -					break;
>>> -			}
>>> -		}
>>> -	}
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -/* Sets the HDR output metadata prop with invalid size. */
>>> -static int set_invalid_hdr_output_metadata(data_t *data,
>>> -					   struct hdr_output_metadata const *meta,
>>> -					   size_t length)
>>> -{
>>> -	igt_output_replace_prop_blob(data->output,
>>> -				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>>> -				     meta ? length : 0);
>>> -
>>> -	return igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>> -}
>>> -
>>>   static void adjust_brightness(data_t *data, uint32_t flags)
>>>   {
>>>   	igt_backlight_context_t context;
>>> @@ -484,7 +323,6 @@ static void adjust_brightness(data_t *data, uint32_t flags)
>>>   }
>>>   
>>>   static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>>> -			       igt_output_t *output,
>>>   			       uint32_t format, uint32_t flags)
>>>   {
>>>   	igt_display_t *display = &data->display;
>>> @@ -500,30 +338,30 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>>>   
>>>   	draw_hdr_pattern(&afb);
>>>   
>>> -	fill_hdr_output_metadata_st2084(&hdr);
>>> +	igt_hdr_fill_st2084(&hdr);
>>>   
>>>   	/* Start with no metadata. */
>>>   	igt_plane_set_fb(data->primary, &afb);
>>>   	igt_plane_set_size(data->primary, data->w, data->h);
>>> -	set_hdr_output_metadata(data, NULL);
>>> +	igt_hdr_set_metadata(data->output, NULL);
>>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>>   
>>>   	if (flags & TEST_NEEDS_DSC) {
>>> -		igt_force_dsc_enable(data->fd, output->name);
>>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>>> +		igt_force_dsc_enable(data->fd, data->output->name);
>>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>>   	}
>>>   
>>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>   	igt_assert_output_bpc_equal(crtc,
>>> -				    output, 8);
>>> +				    data->output, 8);
>>>   
>>>   	if (flags & TEST_NEEDS_DSC) {
>>> -		igt_force_dsc_disable(data->fd, output->name);
>>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>>> +		igt_force_dsc_disable(data->fd, data->output->name);
>>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>>   	}
>>>   
>>>   	/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
>>> -	set_hdr_output_metadata(data, &hdr);
>>> +	igt_hdr_set_metadata(data->output, &hdr);
>>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>   	if (flags & TEST_INVALID_HDR) {
>>> @@ -537,7 +375,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>>>   	}
>>>   
>>>   	igt_assert_output_bpc_equal(crtc,
>>> -				    output, 10);
>>> +				    data->output, 10);
>>>   
>>>   	/* Verify that the CRC are equal after DPMS or suspend. */
>>>   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>>> @@ -545,23 +383,23 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>>>   	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
>>>   
>>>   	/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
>>> -	set_hdr_output_metadata(data, NULL);
>>> +	igt_hdr_set_metadata(data->output, NULL);
>>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>>   
>>>   	if (flags & TEST_NEEDS_DSC) {
>>> -		igt_force_dsc_enable(data->fd, output->name);
>>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>>> +		igt_force_dsc_enable(data->fd, data->output->name);
>>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>>   	}
>>>   
>>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>   	igt_assert_output_bpc_equal(crtc,
>>> -				    output, 8);
>>> +				    data->output, 8);
>>>   
>>>   	igt_assert_crc_equal(&ref_crc, &new_crc);
>>>   
>>>   	if (flags & TEST_NEEDS_DSC) {
>>> -		igt_force_dsc_disable(data->fd, output->name);
>>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>>> +		igt_force_dsc_disable(data->fd, data->output->name);
>>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>>   	}
>>>   
>>>   cleanup:
>>> @@ -569,38 +407,7 @@ cleanup:
>>>   	igt_remove_fb(data->fd, &afb);
>>>   }
>>>   
>>> -/* Fills some test values for HDR metadata targeting SDR. */
>>> -static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
>>> -{
>>> -	memset(meta, 0, sizeof(*meta));
>>> -
>>> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
>>> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
>>> -
>>> -	/* Rec. 709 */
>>> -	meta->hdmi_metadata_type1.display_primaries[0].x =
>>> -		calc_hdr_float(0.640); /* Red */
>>> -	meta->hdmi_metadata_type1.display_primaries[0].y =
>>> -		calc_hdr_float(0.330);
>>> -	meta->hdmi_metadata_type1.display_primaries[1].x =
>>> -		calc_hdr_float(0.300); /* Green */
>>> -	meta->hdmi_metadata_type1.display_primaries[1].y =
>>> -		calc_hdr_float(0.600);
>>> -	meta->hdmi_metadata_type1.display_primaries[2].x =
>>> -		calc_hdr_float(0.150); /* Blue */
>>> -	meta->hdmi_metadata_type1.display_primaries[2].y =
>>> -		calc_hdr_float(0.006);
>>> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
>>> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
>>> -
>>> -	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
>>> -	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
>>> -	meta->hdmi_metadata_type1.max_fall = 0;
>>> -	meta->hdmi_metadata_type1.max_cll = 0;
>>> -}
>>> -
>>>   static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>>> -			     igt_output_t *output,
>>>   			     uint32_t format, uint32_t flags)
>>>   {
>>>   	igt_display_t *display = &data->display;
>>> @@ -622,26 +429,26 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>>   
>>>   	if (flags & TEST_NEEDS_DSC) {
>>> -		igt_force_dsc_enable(data->fd, output->name);
>>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>>> +		igt_force_dsc_enable(data->fd, data->output->name);
>>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>>   	}
>>>   
>>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>   	igt_assert_output_bpc_equal(crtc,
>>> -				    output, 8);
>>> +				    data->output, 8);
>>>   
>>>   	if (flags & TEST_NEEDS_DSC) {
>>> -		igt_force_dsc_disable(data->fd, output->name);
>>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>>> +		igt_force_dsc_disable(data->fd, data->output->name);
>>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>>   	}
>>>   
>>>   	/* Enter HDR, a modeset is allowed here. */
>>> -	fill_hdr_output_metadata_st2084(&hdr);
>>> -	set_hdr_output_metadata(data, &hdr);
>>> +	igt_hdr_fill_st2084(&hdr);
>>> +	igt_hdr_set_metadata(data->output, &hdr);
>>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>   	igt_assert_output_bpc_equal(crtc,
>>> -				    output, 10);
>>> +				    data->output, 10);
>>>   
>>>   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>>>   
>>> @@ -652,21 +459,21 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>>>   	hdr.hdmi_metadata_type1.max_fall = 200;
>>>   	hdr.hdmi_metadata_type1.max_cll = 100;
>>>   
>>> -	set_hdr_output_metadata(data, &hdr);
>>> +	igt_hdr_set_metadata(data->output, &hdr);
>>>   	if (is_amdgpu_device(data->fd))
>>>   		igt_display_commit_atomic(display, 0, NULL);
>>>   	else
>>>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>   
>>>   	if (flags & TEST_NEEDS_DSC) {
>>> -		igt_force_dsc_enable(data->fd, output->name);
>>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>>> +		igt_force_dsc_enable(data->fd, data->output->name);
>>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>>   	}
>>>   	/* Enter SDR via metadata, no modeset allowed for
>>>   	 * amd driver, whereas a modeset is required for
>>>   	 * intel driver. */
>>> -	fill_hdr_output_metadata_sdr(&hdr);
>>> -	set_hdr_output_metadata(data, &hdr);
>>> +	igt_hdr_fill_sdr(&hdr);
>>> +	igt_hdr_set_metadata(data->output, &hdr);
>>>   	if (is_amdgpu_device(data->fd))
>>>   		igt_display_commit_atomic(display, 0, NULL);
>>>   	else
>>> @@ -675,45 +482,39 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>>>   	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
>>>   
>>>   	/* Exit SDR and enter 8bpc, cleanup. */
>>> -	set_hdr_output_metadata(data, NULL);
>>> +	igt_hdr_set_metadata(data->output, NULL);
>>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>>   	igt_assert_output_bpc_equal(crtc,
>>> -				    output, 8);
>>> +				    data->output, 8);
>>>   
>>>   	/* Verify that the CRC didn't change while cycling metadata. */
>>>   	igt_assert_crc_equal(&ref_crc, &new_crc);
>>>   
>>>   	if (flags & TEST_NEEDS_DSC) {
>>> -		igt_force_dsc_disable(data->fd, output->name);
>>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>>> +		igt_force_dsc_disable(data->fd, data->output->name);
>>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>>   	}
>>>   
>>>   	test_fini(data);
>>>   	igt_remove_fb(data->fd, &afb);
>>>   }
>>>   
>>> -static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
>>> +static void test_invalid_metadata_sizes(data_t *data)
>>>   {
>>>   	struct hdr_output_metadata hdr;
>>>   	size_t metadata_size = sizeof(hdr);
>>>   
>>> -	fill_hdr_output_metadata_st2084(&hdr);
>>> +	igt_hdr_fill_st2084(&hdr);
>>>   
>>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
>>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
>>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size - 1), -EINVAL);
>>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size * 2), -EINVAL);
>>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, 1), -EINVAL);
>>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadata_size + 1), -EINVAL);
>>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadata_size - 1), -EINVAL);
>>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadata_size * 2), -EINVAL);
>>>   
>>>   	test_fini(data);
>>>   }
>>>   
>>> -/* Returns true if an output supports HDR metadata property. */
>>> -static bool has_hdr(igt_output_t *output)
>>> -{
>>> -	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>>> -}
>>> -
>>>   static void test_hdr(data_t *data, uint32_t flags)
>>>   {
>>>   	igt_display_t *display = &data->display;
>>> @@ -729,20 +530,20 @@ static void test_hdr(data_t *data, uint32_t flags)
>>>   		 * set MAX_BPC property to 10bpc prior to setting
>>>   		 * HDR metadata property. Therefore, checking.
>>>   		 */
>>> -		if (!has_max_bpc(output) || !has_hdr(output)) {
>>> +		if (!igt_output_supports_max_bpc(output) || !igt_output_supports_hdr(output)) {
>>>   			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
>>>   				 igt_output_name(output));
>>>   			continue;
>>>   		}
>>>   
>>>   		/* For negative test, panel should be non-hdr. */
>>> -		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
>>> +		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
>>>   			igt_info("%s: Can't run negative test on HDR panel.\n",
>>>   				 igt_output_name(output));
>>>   			continue;
>>>   		}
>>>   
>>> -		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
>>> +		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
>>>   			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
>>>   				 igt_output_name(output));
>>>   			continue;
>>> @@ -772,8 +573,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>>>   					     crtc);
>>>   
>>>   				/* Signal HDR requirement via metadata */
>>> -				fill_hdr_output_metadata_st2084(&hdr);
>>> -				set_hdr_output_metadata(data, &hdr);
>>> +				igt_hdr_fill_st2084(&hdr);
>>> +				igt_hdr_set_metadata(data->output, &hdr);
>>>   				if (igt_display_try_commit2(display, display->is_atomic ?
>>>   							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
>>>   					igt_info("%s: Couldn't set HDR metadata\n",
>>> @@ -796,7 +597,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>>>   				else
>>>   					flags &= ~TEST_NEEDS_DSC;
>>>   
>>> -				set_hdr_output_metadata(data, NULL);
>>> +				igt_hdr_set_metadata(data->output, NULL);
>>>   				igt_display_commit2(display, display->is_atomic ?
>>>   						    COMMIT_ATOMIC : COMMIT_LEGACY);
>>>   
>>> @@ -811,13 +612,13 @@ static void test_hdr(data_t *data, uint32_t flags)
>>>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>>>   						test_static_toggle(data,
>>>   								   crtc,
>>> -								   output, hdr_test_formats[i], flags);
>>> +								   hdr_test_formats[i], flags);
>>>   					if (flags & TEST_SWAP)
>>>   						test_static_swap(data,
>>>   								 crtc,
>>> -								 output, hdr_test_formats[i], flags);
>>> +								 hdr_test_formats[i], flags);
>>>   					if (flags & TEST_INVALID_METADATA_SIZES)
>>> -						test_invalid_metadata_sizes(data, output);
>>> +						test_invalid_metadata_sizes(data);
>>>   				}
>>>   			}
>>>   
>>> -- 
>>> 2.25.1
>>>
