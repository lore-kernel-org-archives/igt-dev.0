Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708CCC43458
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 06:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDD310E2B3;
	Thu, 16 Jul 2026 06:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNP8D6QX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE2610E2B3
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 06:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784182206; x=1815718206;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y7aQPCIPTezFLbIvtVVobScKk6Bh8K49vtUziuDkiv4=;
 b=YNP8D6QXySsrb7AIdrbc0Dm2nhLpScE/uWUdT0M7UwgGMlMbyMCab1bt
 bXLEL2C7/PhHVMlBRcN6CngQZtwsvEhm8NpTxDHxcbI4/adJZVfqCbpct
 LsGrT4l7IU2wq8zqtEKuAJsI4H24u3g0OG8ldozl5Br35CqiNtailrtGj
 C/zTL9dUEWFI2ChquWIreTQ7b4PEk3MheaYm4Hgv1VquCvCMyoy9vw67P
 7T2dIv3IiE9xLv0iBqTZFkgLuaLZFKVyOSn75P/Zh2Jv51bzDxrH/ZXvv
 U53WxZJm4tQ2Z9HR4MPWRS1q9dVWzA4UdQtJDp7aV7T7Y15n2FCYpc6m+ w==;
X-CSE-ConnectionGUID: qO8s3fQnT5KhuddKYvjeTQ==
X-CSE-MsgGUID: lZL2I/wRR/OSNOYEeg/2IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95972908"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="95972908"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 23:10:06 -0700
X-CSE-ConnectionGUID: T6TAXDTKQy+Jw0X0b/V7fQ==
X-CSE-MsgGUID: Kh6YvFe5Qr6Ej2k8ysmcnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="252430338"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 23:10:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 23:10:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 23:10:04 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 23:10:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixnWXxw6gdMmEgED6Jzdw/35UsXLKuugaBXvMdR6FoZgo0owqat3prHBvhYSenJaCQ6DGi0JMCPOfhfT7O0X3bRcv2FJLxuML7DVU5Yx50nCY9145FFdbpVsTx+5lz/t2StfbcpfkX9mbA9yE76ogsA2N0VPaZkrj5BQuzDr6J1yE4nzHMyFxjumVkbyAlBAKmE3ZGp6pX3FCKl8vOmheJXk7k5riClVnJmaP4q5MMdZqWKsmAqFxvI0sgqzn2wMFRHHpEKAJz/sCqp8JCKO2R6FOaDlz90gduTrY+VEACaN0ryD8vYB7mVq4GU1/9vz9Hi7Snj05HMUD4v+c0NGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPaRYMNmBiJz8hE2AqwS3Y8Ncc0D/YXZ8k2b4lgyPPA=;
 b=jBe94kyzd4gpvhkunu8R2Q+RY4wjtOtLQ0u9mKA23Y9PilsAqgM8R6+Nfac/JBkHJdukvG2m7o0X9sSia8cHSEZl+9JoF7QNX8xOUoH2OCN+Z9KfJCWuPiEB3sn0E3lrei4mQF3fQzV9SaQmuhiX6eYHH1o/a2PyYIrzDhkckD6IsC9kflmsAVUE3gm/3j+wlulCbs8NfpsXEa2aqAv++qoQVdwKTHYkYDwh1NKR+4eRIz49QhqfiGoEXgOC9sCfKbNFpWhkDfQupNBno51FadfYNIRe5eMIvzyI2l2bExNX5bKrqFvIw9Pg83m0OPamQvlHfoyZMt/Vu9dLiMiYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Thu, 16 Jul
 2026 06:09:53 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 06:09:53 +0000
Date: Thu, 16 Jul 2026 06:09:42 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 05/31] lib/igt_tools_stub: add stubs needed by
 tools
Message-ID: <puhkn5xjeoh2ds6f64tfihuenvcze5jvkz2dq6kabsrlqp2ize@uvws2lsm55uk>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <7f05cdb527300126c8cd32363f5cb961846bcb42.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7f05cdb527300126c8cd32363f5cb961846bcb42.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::18) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 5439a2df-f733-4c5a-e428-08dee300da20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|3023799007|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 5sZg9VXl9dUwgCEG+ceKPmw7+RAGaGITIicFKNhCRhvzyhn+vHOsjsBr3vRaZZVsvGBtcwmgadZNOxgrvC/xSUc76R35mxMsb0w3dIROomtBp+V0Fra97HEmsyLXmZaKGnITG2Q8znhpfIpO5aBUdlssbZPfMAu1ZAptb7VvaScbUe/p5uJSd5PyYxk/URrAjNSpIFnXWcmuf4TjfN1TwejSSK6MWmg9Yg2yXRhGIWTLHPRSE99IuXEqyxfiMuE0KZ5zcW1tXOU8PVBoP6LzyNjSZ5QnaUGD3Qr0yx6fHMlkhXz5GHskttt9pqepsfiPhEVJZPprLAFfAP4vUwLElwWJjDWcW7HM0nAHCK8dXG45mfx1uy0E99gkBVOXIZ2xgFc+tR51X0kxasmDdPUeKf5mYFWXy4HXo5yJr8eL+7kDVqVKAnfa24OE/X7IYOrecFzh5X/OvXI6GHSBvF5Hllxc/GCzfxmzn3n0WR3RhsfOwQAAJgkGfRoVkmGXFGcu3yod/p/jGJoM6uVmxBcgz6bB2fcpCRwFdjYHHO9w1YPWBpXmMJbiKV2DF1vyd3lqPdlobt2/MyIR9TPCEP9YNFh1F9n1B/pXcrINM4Xg2qDpcc6H3Obzf8s7KnNmWYNzv1G1HyXdsP9gUyKLfgHvczROi7vr93vRTbv2peVVJCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(3023799007)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkYxL0hXTThtVzZwL3RhZVlYSTVQSzA3dkRiazhJR0k5QUJEVGdhLzNZL1R5?=
 =?utf-8?B?T2VwS0tOYkI5NlFaaXZEWmNUVXBWNTRsd0FMUWNnK1Uzbi90cUhmMnVQUS8w?=
 =?utf-8?B?NlExRUZXVzFIbUw2amZWa0ZTNUk1RXVhTEJQOWdaa3dvZEgwbzZmbkpTVjJC?=
 =?utf-8?B?dkJqUlRHUVdNS1NtZUZqa1FFOHJLdXB1Ri9xNzAraE4xNW1ySXpoYS9KMEZu?=
 =?utf-8?B?OElvR3VmNy9ZMzBUTGp2VGZ0Qm1BRTJwMTZkOFN5N3dIV2xvNUJoeEIxZUQv?=
 =?utf-8?B?cnoxVXM0OFdZSmNnWkpFVDJiZjl2OHdZNU5JWlRyV0VyZU1LR3IrR3BJMkk5?=
 =?utf-8?B?UkFzenZ3S1lOVmxTUGhtMllXbkwxbkJKR3UrN0s5Tm9NSFIvK0pIYVo4em9r?=
 =?utf-8?B?SWpnVU1yUXhwTExsMVRXdTBBVWI2KzN3azYwTVlPUzZVdWN3SEhqbFJzRjZN?=
 =?utf-8?B?UVgwYWFDSmNPTU51UDZ6K2MvWUREd3l4UkpJenJxNzhPRnp6WmpjWHVoY3Vw?=
 =?utf-8?B?T0VtbE1EVm4rRnIrbVF6VkpVRi8zVEpsMktPNTVQYi9aZHM3ZktmY2d5d1Y4?=
 =?utf-8?B?VVFkVlZVcmYrejJQRzZXbWlCS0NiUzluZ25UTHBUOWhxaTZRMmM2bDFPL0Zy?=
 =?utf-8?B?OEJrbDBQWW5yUUo4UGRNaUkrQThZWHMwUEMvUkFJTy83ay9OWG0zdkYvUDV1?=
 =?utf-8?B?bHNmMXZVc041NWNiSmFZYTBxTVBKNE1HUUhCbWxURE5YenFtMzVYakxHUzNS?=
 =?utf-8?B?Vkt4RU9pbHdIMjVuVWJVRTlCYWlDQWY4QUVCeDZYeDNDeDhCMlpuT3k3TDgx?=
 =?utf-8?B?dFMvaHN5SkVob1RBaFlzb0Z5eTM4YjJyOEp5Nm9MeG5YVTVENDJGTXF1NDVD?=
 =?utf-8?B?UVBSTFhGNnVkYXhzUXFCOHJ6MGZNMkdDaUNiR0M0UksxVUZ6Zjh5eVBVTVAw?=
 =?utf-8?B?NUZWQWdSb3RlVExzSy9sMTByNDBJc0prYkh3VHRMWmF6YXRoaStuTHQ1ejZw?=
 =?utf-8?B?YjlsYTUrcFIyZ0xWdUE2WWt4U2FVdTZaNEpWRVNsTm8wYUlMTjRVVnJ5b0xp?=
 =?utf-8?B?V0RZZW95ejFOVXBsSCtEK2kyL2pGUFBmZ2VyUjRRZHg3THQzOExNaDNLc0Ra?=
 =?utf-8?B?UGVxZFI3YkdWT3RZZi9vWXpvOEE0NWJGL2lXOE8xM1cyNWhEbHdUSlBsblRr?=
 =?utf-8?B?M01PUHVJaldkUmVjbkRhS2xleFp2MG9mb3YwSTMxandLZTBxNEY0M3VlM3BH?=
 =?utf-8?B?V3haVzIzRk9CL3pNSm01ZERYL3VEU0ptejFuZUtJK20zclV2a1ZBdFczMlpK?=
 =?utf-8?B?N21UbnBWWjVDWTE5QmlLdGRIZXVabW9sc25ybCtBT0NOL2daQ291RkNhaVB5?=
 =?utf-8?B?TjVPYjFUZFk2L3YwNFVrdUgyTTdLZkI3bU5BNHAvUGVhbEd0cHd5NjRBemJl?=
 =?utf-8?B?a0h2ZUxtWEJaSHBwN2VQVGtXNDJnbFVHVEh6eXkxUVlXWFlnU241cmpFRW9N?=
 =?utf-8?B?cU85V3VITUNzeWowd0tJL0NsVGkvdlBIZlZlSytrcGJ0dEVGa0svR1kxVEl0?=
 =?utf-8?B?clZ1cm5oMzNzV09vbFJQc0p5aEE1Q1pCSjFIQlgrcFBxWUlURElkSUtCT1Ir?=
 =?utf-8?B?cHpub1ZtbTdSL3hvbzFpZ0ZqRXNCUFJTdjBvTTRwWGtUK05oMUNHci9TTkJE?=
 =?utf-8?B?R3MzaXBsTkMraVpMN0FnRjJWVTZwWWt5TGtzZWhkZ3d4cTJIWE04cU1GY3dq?=
 =?utf-8?B?RWNrU0lKbGkwVkdMK0hLeWFaQ3VYdHRxV1V6WDMxQk96SXdtbmNSTnVsK04x?=
 =?utf-8?B?ZnJBRnBWVnJTTFFvYmN3NDZ6dHpOeHF1NDZqTlM1dVpEYU5DckhUT1c0Mkx0?=
 =?utf-8?B?M0N0Q3ppTXVuSFZ6Ry8zbVJNRnJQQUxIUE5WZlAyd2FMbEVvOHFYR05aZUhF?=
 =?utf-8?B?YTdhWERwTFk5NGhHNW11NVNiQ0pBQjRPeEthamVZZTF2dXFCc1lQbGVsQi83?=
 =?utf-8?B?TXo5ekJ0bzZHSFRteVRDNS9YTkp2T0NZTlhndnVkQ0Vwb2tSbEVURWloNWdp?=
 =?utf-8?B?OWpuNFRUai9zaURYMUo1MXhWeFJmZ3Q3clZwZEFYYWI1UEFnNnhjL045eVpD?=
 =?utf-8?B?ZTRtUk5pblp6ZVA0aTZJWm0rSnhlUnFaTEtERjB4VkVaNllQL0lXS0loeU1T?=
 =?utf-8?B?RUtla2lRM2xWQm5SejRVTGFaRnNLSE5qeGtpTFdOYlhhTGFydlo5Vzd4OC9M?=
 =?utf-8?B?dDA3VG5KZ0dTdUZqcGFSRmM3aUZpVjdJTDc1WEJXb2t3b0V4UXcvMyt5Z0pY?=
 =?utf-8?B?dFVIZ0tBQnZkUHFWM2NjMDltaE1yUU1nL1RKU3JvQ3NJQ2dRYkNEOTZkQzkx?=
 =?utf-8?Q?nwuYIq0lYYoGOpSQ=3D?=
X-Exchange-RoutingPolicyChecked: AzBuPZvrhyKVdDqWT3KFVC3A+N9tyHEYZKV++T834tdqH32xrwvkqP4A9SWbpQmx22acw0+T/BE+YEbwqXT8HYx1QP9UR/cdAG6TpCAzvktF9bHf35a3Etx/n6l9VYOTrL3fUacA6ygDd1J+r/yAubWlPSgPovDfbsdXgv5TwXYLAxgdh6DLZzwIRpdn4cph8aNfRvB/Fw8/6QpVnnycZsFS1rRi/hpQdq5DUEd9LaJFdOTCYoI5e+ROa6LdYrIs249vj9X3qc+wOJ6ORctxRv9uoeLgtssUZq2nUXV6a4gfFUoQ3LU3F1VQ/8Q0mU/eo/M/vn9Ksga+kL75l6jG/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5439a2df-f733-4c5a-e428-08dee300da20
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:09:53.3889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUcOGU9y8qOKEhVyD4T1V/MdvjpU2oJ63hjngKiRWJ30FovUN1YLaom8poKvSU2hizy3CGLcOsHEV+dEbOn2svEg7k6zvEmcdkKECyk6seg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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

On 2026-07-15 at 14:15:15 +0200, Sebastian Brzezinka wrote:
> Add stubs for functions used by tools when linking without the
> full libigt.so: __igt_skip_check, igt_exit, igt_debugfs_open and
> igt_open_forcewake_handle_for_pcidev.
This patch does more than that: it unifies the comment style in
the file. This is a nit though, so consider it only if you would
prepare another version.

> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/igt_tools_stub.c | 83 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 76 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
> index 9a0ec6217..21dc53f3f 100644
> --- a/lib/igt_tools_stub.c
> +++ b/lib/igt_tools_stub.c
> @@ -21,12 +21,27 @@
>   * IN THE SOFTWARE.
>   *
>   */
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <stdarg.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/stat.h>
> +#include <sys/sysmacros.h>
> +#include <unistd.h>
> +
>  #include "igt_core.h"
> +#include "igt_debugfs.h"
>  
> -/* Stub for igt_log, this stub will simply print the msg on stderr device.
> - * Domain and log level are ignored.
> +/*
> + * Forward declaration only - avoids pulling in the heavy igt_gt.h header.
> + * The type is used as an opaque pointer; this stub always returns -1.
>   */
This is a nit, so consider it only if you would prepare another
version of this series:
The comment should be moved right before the function declaration.
> +struct pci_device;
>  
> +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev);
> +
> +/* Stub for igt_log: print message to stderr; domain and log level are ignored. */
>  void igt_log(const char *domain, enum igt_log_level level, const char *format, ...)
>  {
>  	va_list args;
> @@ -36,11 +51,7 @@ void igt_log(const char *domain, enum igt_log_level level, const char *format, .
>  	va_end(args);
>  }
>  
> -
> -/* Stub for __igt_fail_assert, this stub will simply print the msg on stderr device and
> - * exit the application, domain and log level are ignored.
> - */
> -
> +/* Stub for __igt_fail_assert: print failed assertion to stderr and exit. */
>  void __igt_fail_assert(const char *domain, const char *file,
>  		       const int line, const char *func, const char *assertion,
>  		       const char *format, ...)
> @@ -49,3 +60,61 @@ void __igt_fail_assert(const char *domain, const char *file,
>  		func, assertion);
>  	exit(1);
>  }
> +
> +/* Stub for __igt_skip_check: print skip reason to stderr and exit with skip code. */
> +void __igt_skip_check(const char *file, const int line,
> +		      const char *func, const char *check, const char *format, ...)
> +{
> +	fprintf(stderr, "%s: %d %s Skipped: %s", file, line, func, check);
> +	if (format) {
> +		va_list args;
> +
> +		fprintf(stderr, ": ");
> +		va_start(args, format);
> +		vfprintf(stderr, format, args);
> +		va_end(args);
> +	}
> +
> +	fprintf(stderr, "\n");
> +	/* IGT_EXIT_SKIP (77) is the exit code igt_core.c uses for skipped tests. */
> +	exit(IGT_EXIT_SKIP);
> +}
> +
> +/* Stub for igt_exit: tools use exit(0) rather than the full igt teardown sequence. */
> +__noreturn void igt_exit(void)
> +{
> +	exit(0);
> +}
> +
> +/*
> + * Stub for igt_debugfs_open: open a debugfs entry for a DRM device directly
> + * by path. device == -1 follows the igt_debugfs_path() convention of
> + * defaulting to the first DRM device (dri/0). When a valid fd is given, the
> + * DRM minor is resolved via fstat() so the correct dri/<minor> directory is
> + * used.
> + */
> +int igt_debugfs_open(int device, const char *filename, int mode)
> +{
> +	char path[PATH_MAX];
> +	int drm_minor = 0;
> +
> +	if (device >= 0) {
> +		struct stat st;
> +
> +		if (fstat(device, &st) == 0 && S_ISCHR(st.st_mode))
> +			drm_minor = minor(st.st_rdev);
> +	}
> +
> +	snprintf(path, sizeof(path),
> +		 "/sys/kernel/debug/dri/%d/%s", drm_minor, filename);
> +	return open(path, mode);
> +}
> +
> +/*
> + * Stub for igt_open_forcewake_handle_for_pcidev: in tool context the driver
> + * keeps the GPU awake; no forcewake handle needed.
> + */
> +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
> +{
> +	return -1;
> +}
> -- 
> 2.53.0
> 

The code looks good to me:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
