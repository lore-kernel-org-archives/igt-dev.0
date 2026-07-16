Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48749C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 07:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D9910E2B4;
	Thu, 16 Jul 2026 07:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFZcR9CU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05DD10E2B4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784187622; x=1815723622;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=73Shhfb89xXMBy3CRE4+4CV71b2CDzGv618/vEtFFlU=;
 b=HFZcR9CUhaQI8OhNuAOHKJEMVgZaMLosLaWUt28fPzXi2D+uStCEKX3j
 18tqhh2oFvuIlsAr5M9PeG1TZzVFOIKIaKAvBx/3F4AGJo2osvIuyNUkN
 jcXeL4lrVsB0S4YzES8Rjt3aYS3zn0P++wPqVQhfw4xeumK5cqSSm9cxb
 bmp0QrEbeITa02+aqkSRXhcw206fNCxkeylTpJRjKwLzmf2Xz4EtoQ9rX
 bUtWFMlZdIrx81Ydu5UECZxhSDaR67xX5owmfB9uXxmHUAcc/lv7PaCVz
 GXzwG+Rp6gFWerpz7xLlwf3RuMux+C5KzICoexm0DaZeMrM9NXfb1wecR g==;
X-CSE-ConnectionGUID: T3m8XVIIRTmUq3oJhwEhTA==
X-CSE-MsgGUID: zZab+EFvRqiwKkgGQGtC7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102265734"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="102265734"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:40:21 -0700
X-CSE-ConnectionGUID: raApRY4eQKqfjn+uprc7Fw==
X-CSE-MsgGUID: AZyCve0iSYOtkHJmw6XZPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="260232348"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:40:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:40:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:40:21 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:40:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTF9omVzSijc5OmC8iGiKi5raXc7gx3QQ/qsWGZ1tBMk079hlLvWDiT5Igi3GjjRPQDI53dKxv+uCDj449HtkBsta0mRQg4g+B3FRx0un3ryR8Zz+rYHoXL5xZFPDucl+BEylNDW7sEM1nmbLRalImijrT3z17bLf/HfJYz41twVmXXXmU4kGmJSV70wCOBrG7ukTO7a+9dSDaqEBw0x2BfW5boxERgyhd9SGzb+g44CsqYqhph2i2N+0FsBoq8a3UGVixm+fFzS1YPHlmEC9CbV+F6Fhj8aTblxZKq99x0o0uV4MQHo9jmL0OykJSRTaTc3qq9r2VyLyfWrSaGDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qij2FsVuRT9VZjcx1bLcoqxg7a18A6dR/0bxtXqZebA=;
 b=vhS1t+okDja/2LTm4hETPfq2DQHvoNfWW9fvFLKaYGW29tIp1U7AaLWQYgVS0Kbeh30Wp8wBNV2N77EfbAhlaDkSGYTXTnl1OFMseF6iV7oOpaemfC22HrPtAqSvKEsOytxG70YqsLr06r5nhvEhFg9ltcIpJi/ZnRCYrcfY2I6N+iCfnm7DPdZBiMqFNugrp2lALDH/NrZCjnwtuWi+Er5scAZ2q1lh4jtClg77USZga9TbU8Bouwh4TMAcUgb0fbRhSEz0tEuj2T3We3OK25ZCR0o/H+5uuvZPcXdjocvezNq0Nnsoe+3cOjC4mMKLTcw7MeFSW3z3NmGCzzrTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Thu, 16 Jul
 2026 07:40:19 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 07:40:19 +0000
Date: Thu, 16 Jul 2026 07:40:09 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 07/31] lib/igt_device_scan: wire to use static
 sub-libraries
Message-ID: <ysrawyzji6hx6kbbjz5ymzvesri7hajwknqyuw7y3mtehnndvq@uru2nntxw4rm>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <2c6063b9fe9ba076bc3d7b86045dee13639bd9c4.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2c6063b9fe9ba076bc3d7b86045dee13639bd9c4.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0027.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::11) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SA2PR11MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: 134d7d49-009b-4358-9ed4-08dee30d7c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 66F4D1/D5SjD30D/5B0BLekKyvUSGrzMUcMOzJbMH/cjfVW5ajKa4R84rQiaNEa6fcrgouz7/JL+3cCD2vMOk4/7frWXpdtFUtUyLdZywd+Hjtc1eSZwPDkXk/H47mdY9WUD/H0PjvW0+o7mgSf1PyBNs4/MfR9Zg51TkAALyLv1sIgAbXadrSvVgddlCIXUof2wwsc+VYCq1kiIiAt+Hu0RkCr86m37GqHT40YJUcbbcfK1GYNCV7Z1ktSdi3PslKtYimLXJpI/jzdSC6z8ZirX9TRjyNU1wXmh9CweZ1Mnh1XUw/opmSQS86bkZSsl4aZWhBJ4ezjT0HqdjYauK7YCjrgZzsSQUq2H7bqga4HbnMeq/SgRudNA1ADLKClcqGFTKkQeFVY5cd6V8NOVSXM2IV2FF6Oc6nSg3EY9pe8A2MWNxgOr5NQc16WVySY3tdGNpfg1eZRJm7X108mKhU7lbh1LhWN54u+HMQvHJiekVq9IiM9kCZe7L5i3gbL7A/0Ch3yfUhXDNrtf3owGxfmgmC//osI9je0v+oXy25Pa+2XzyFhrQMGgm8+sdH/hkwNjypz6JnAsJQZiiGXj3mJLlaeC/+L0sBOxBdJwGEq94GmpUeQ2rfCIxY7R4tozHOe2Qj88fRyshTsTQUYYR88/OQq82NZVntr4rOG14EI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0dNVWxXK2c0WEJ5cmhQQWlCQUhySlBwbEQ0c0MrRU9RMWU4MUVvZHR4Ykov?=
 =?utf-8?B?N0l6R3g1MTIvSUN6WW1IWmg2NkQreUI4N2ZiNUk2RnEzNnNIMG5rcGdLbnNR?=
 =?utf-8?B?TUdaTzh2RDEwTTZqaFRwc094VnFUK1VtUkZQb2psa0Y2aW1oRG5mOVVxUWJw?=
 =?utf-8?B?dThlbTZXV3dscElERGNBWGtReUhlM1lsK01GNGhRanQrSnJPdlVuNWxrdGtz?=
 =?utf-8?B?SG50OU5QeEJIQUt2QnRxQ0dwRS82WHo5M3RoallEeEkxK3REakFLL0VNVDkv?=
 =?utf-8?B?dGZxeE9HZlUyREVTL1VJWHY0VVVjYVhtMGxuSDlZeUZ2WTVSR0p4VjZHRENa?=
 =?utf-8?B?NkJNUXJsUzVTS3Q2c3c2NHUxVmpUc1lsZlhKYXZMQm9nL2lCM1ZHMEVHQnBS?=
 =?utf-8?B?Q2JoNmthZHZwbnNGTWROakQyQzFCaC8vSHMrc3p4Q2FLWlowNjhORGtCazMy?=
 =?utf-8?B?VXRJbjlSazBMaXJGZVZrRTlCYXZjaHRjeTJkMDdCcitBVUNIUkN2dllvQWRi?=
 =?utf-8?B?MGYwRDkvRGRzTHlRbXh0TFVNMGFlNjQ2OFR3TnR5V2FCbFBod21SOS9ORjI0?=
 =?utf-8?B?dHBRa1ZkUnNuLzNuRmkzdVhOTzdUSjNaZG0zelU2WjBPVmRLZG8zVlF1cU80?=
 =?utf-8?B?RTNGVkU4K3FnaFVrUDM4OHIyT0pZL3N3ZThMd09OWnFxUWFBOTZ5VnhLLzBT?=
 =?utf-8?B?RlZwWC9mWjVpYWEvUS9tRFFNMVF5MXNMUHJRZ215cDZYNGdzbVdtMnBWMDV3?=
 =?utf-8?B?ZGE0TEQzUTRsY0dDSnJqNmYwNVg5U2c0U2xwRjZsQmo2LzJaUFdscnQ0amlw?=
 =?utf-8?B?QVF3d0ZHdU5OZjZwTVliQjZkeEM0SEprd0JSUnJSWEYreUtMZDdsdGpySU9m?=
 =?utf-8?B?NnArRUl0b1k3b2pvWGZvREhDcDN4MkNDUU1UQ01uY3M0cWI4MGJ1KzhtN2hW?=
 =?utf-8?B?QXkwUDRvSlUvbys2M25LMmhlbVJLSDlyU3c5K1lWaDJ0K1l5dmRMVk16dTF0?=
 =?utf-8?B?bC8raVhUQ1FsWmtNN1NCRUVoMjJzSm9SUFdzRThZQlhOMnRGTVNyNm1JNGNa?=
 =?utf-8?B?UDNrSmMwQXFLU2tPdUxKS0VJMnNZcWQ3dm1Eek1JbmphZms1ZkdwWHMrZ280?=
 =?utf-8?B?a2FlY29sU2NzUzNtcVY2aUlwNUhKN0ZqVXdWMjJpQ29rSEFGNU9LM2tMOHd3?=
 =?utf-8?B?VTJhTFJwbGRCQVhpRmZLUkR4QkxKazZyZUIwdVFxZEJtRU8xeHRvTXcxbkZk?=
 =?utf-8?B?WDQ3UG85UFpVZUhjMHBRQTRVb1UrTjlsT21vRHorYXBGcmE4VU5qM1ZSVFZs?=
 =?utf-8?B?anBZd0tQRHpGQTdGSWl4OFdOSVFBd0NZSXZlSWc4SWREV0xncnlaclF1YTQ0?=
 =?utf-8?B?bm5uSmRyWVBiZ1l6QWQvWmFJYTUwVngxcTVlOGhMUFI4MnhjbTJ2WHNDcURy?=
 =?utf-8?B?NnR1dHJNam9Hb1dwSUgrN1FrejBDTmMvUXdJNUowazVaaFlhUDc5Ui80Szd1?=
 =?utf-8?B?OVFmUnY1WTY0cjZ5ZW1TdGVhMXB2M05kR21KMmRxQjY1eG4yU1BVQXRHUWN5?=
 =?utf-8?B?WVdWZXdTOUM2UDMwSGpxdHJwcTNDRmVqeTF1Vm5VNXU1YkJDN2YxMGNqdC9R?=
 =?utf-8?B?ZThiTnZleFNKNm5zSFFVUksvZFVHcndKanZPdHNJdnprQUtuR2o2a3ZqZHdq?=
 =?utf-8?B?UEtFMnhuMUdYU0l6RkRRRHNXaVIrUlgyeVRuZEM3SnpyWmEwcFp0U1pqdkw0?=
 =?utf-8?B?VEFBR2MxdUFaVjMvOElGNG1FQkFOdGZLYnBvZ2VaREN6dEZLOXhHWVlvU2xv?=
 =?utf-8?B?UzZEYlpvbERpSkhPaFlsYlhRT3h0b3UzMDJnaFpMbGNjWVBHTHVHbGpPckh6?=
 =?utf-8?B?OVpVNE1DdW5VbDkxdTlpMEpMeTkrNG92WmthMDRGYllUV1JZVmV0N1FZWGty?=
 =?utf-8?B?RzRlRWgxUnRLWEtVY1RHQ05BaEppcGdTN2U4cVU4TnVNNmhoejl6Q09ybFZu?=
 =?utf-8?B?OVFpNGxMVUg4bUVhTm9lUXpuQXJ3TTNPMFlNUWFZNWl0MEJTY3BIcmxpckVj?=
 =?utf-8?B?TkxjWEFSaDI0aG0rOTFlQzNTenZpQW1qc0UrdE1Va3FleWZETUFMa2VzZEg4?=
 =?utf-8?B?QmVkQ05NSjNkSnF2bTF5cGQ0eSsxU0RZNTJJdGFPZnc2SWhmTjdTOTJscXFv?=
 =?utf-8?B?emNPYk1SbEdnSEdyZHhRVHFycjBpYWpMUUxZN2p4K3V5djlTcU13R3ZMY0lK?=
 =?utf-8?B?SGJpQXhKa3g0Rmp4V1dWU1cxOFZPRzd3cGhXL1FOYkx1aWhjUGduVktNYVlh?=
 =?utf-8?B?TkJPNVY3SVhLWjRndm93MXFZcHlHREx0NjlZM09HSTdOZlpMVGkxOWYyT0hy?=
 =?utf-8?Q?asDJe8+PlBPuwMVc=3D?=
X-Exchange-RoutingPolicyChecked: sdTIwUpkWw8Q2Qtn4tKiT/tRM9nGUuTAe5K9ZhI3FaxByAgrw7bF1hPaWnPSN96B5++DdAphMGT31RX0TH3pGIpjeGkhrwEmr3x7c1085MkGY2rgjtLapniW5S6umk0HDWewjBUvKzE+cgKs8201jol5atJNSaWaOft3oWZD+m64iqGvg7wnOzwFAO2WMsNGYr+F58ysgjTMJJnyaDNI7kR3l0lXagUuC9MIQTS7ocBRQ0LfxyTdJB3ETkJgYE2Nf/bVA/PhOnjiyvJglEJxxwOm3PuvoyOA6fy7ljnIXc8vB6rFTYerxMT0wvpU7If39pEAZhNspXIxG9O+rb+wxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 134d7d49-009b-4358-9ed4-08dee30d7c1a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:40:19.0394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMP3dJjqykPjpnj3HDLnuhmGs5xrWx45yCk8Nju/+dRnvNYXFuDn10BMAPRhPWwvoLCIdhedihmLUr6n+ukDy2Nlokps5hB6kUDHjOL6IW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
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

On 2026-07-15 at 14:15:17 +0200, Sebastian Brzezinka wrote:
> Drop the directly compiled igt_tools_stub.c from lib_igt_device_scan
> and link lib_igt_tools_stub and lib_igt_drm_stub instead. Compiling
> igt_tools_stub.c directly would cause duplicate symbol errors when a
> tool links both lib_igt_device_scan and lib_igt_tools_stub.
> 
> Add libdrm and pciaccess to scan_dep so tools linking lib_igt_device_scan
> pick up the right dependencies.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  lib/meson.build | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 484a912d7..2c1fbcd43 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -367,22 +367,24 @@ lib_igt_drm_stub = declare_dependency(link_with : lib_igt_drm_stub_build,
>  
>  scan_dep = [
>  	glib,
> +	libdrm,
>  	libpci,
>  	libudev,
> +	pciaccess,
>  ]
>  
>  lib_igt_device_scan_build = static_library('igt_device_scan',
>  	['igt_device_scan.c',
>  	'igt_list.c',
>  	'igt_map.c',
> -	'igt_tools_stub.c',
>  	'intel_device_info.c',
>  	'intel_cmds_info.c',
>  	],
> -	dependencies : scan_dep,
> +	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub],
>  	include_directories : inc)
>  
>  lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
> +				  dependencies : [libdrm, pciaccess],
>  				  include_directories : inc)
>  
>  lib_igt_drm_clients_build = static_library('igt_drm_clients',
> -- 
> 2.53.0
> 
LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
