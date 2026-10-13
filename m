Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93EACC6B03
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 08:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5F710E42F;
	Tue, 13 Oct 2026 08:02:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603AD10F5D2
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791878479; x=1823414479;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4A4M2SDVXWSmbpF8wm6Lqzgfd2moZbsTnEzMkD1iJAA=;
 b=kGj9Utg1nyXulS0xBaDkL5yuptG/3A1RvEkz0AIIkMk7DIwBaqK2wsiu
 exuocPzimcmX0vPeUPt8tFo+OdM1pTwm0GaU+OEEL78tB2ZT4gIy5J2L+
 tQY0ZMTEQyv117N0pXoJeBCQu9H4iQg9haUH/YrPe00fkoL8A3Mq5Hj/z
 xATc5MTvYyeG9A2y7EnXEx0A0fhf+mVqNJzJJ3wkrnry2ScEDhjtCdJSP
 v74OwatGyopZ3GOKYC7Cf1T7Qby+w4O0eiuDDfx8RgWkKPVaKyn3wdfvJ
 xKlYV2uWR7XaMYiG8j42NesWbI8P0WC/BFxMCDH0KfIU2eOEvjPEStbuC g==;
X-CSE-ConnectionGUID: c5a6Q0VBR4eIDRmOyDJCFw==
X-CSE-MsgGUID: Bo0Ktgc4Rm+ZdP5LNLBReQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="468276"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="468276"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 01:01:18 -0700
X-CSE-ConnectionGUID: +6ZA8ZaJTvGGAIFFO3JEXg==
X-CSE-MsgGUID: 9IqeTLgdRmujnomQxB5dCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1556611"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 01:01:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 01:01:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 01:01:17 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 01:01:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTF9vxMLQ7PHKD3/ayhMlgbZq3O5OrCJb05eBHfYf+qwxDilrJnqV0IFwn93WpwSKOg0LzpdaMr/JgV2sbS6QIbgisVzjRnS4WNKaYUy5UCX8ICeuIrsADVlReg9j22k0l9obmFpri6Qr6g4kuHh/K2dXX9OKAaVDjteqZbnlNqNDTNQcd+FYKSrBzTIuDbVLUyGE5PGLXiqCYqmolg6NrurEDb6gbShns80zqatGNHG/GUHl2ROEfKXZkhmWoBOcya0UYTwGPsdnaz6W9JLxd69PGgW1/KLAnxY4i0p7iGM7xLufxt3hMdhWIlc+t5v7kKn5Wo6iMsF+TZItl5oLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nC4VpZ0eRe5SvxhlNqsbwXf4uhQjH41oPE89zhuC4e0=;
 b=PqJV8uvSbUkst3naLiqPd1sLDhchdMtfHbN1MO+R3mg+wCyG1ptg7wQMP4ub24HdhCAKOJSnruCHo/gCGqwNknJvfXPQa2FryXwKT/Ipgp2Pi46Y/9trYs1C/USQoWtEW32a4rZAY9dg2KdBVHeVXrbY4EBiglYMvQV5Vz5BPksMAPZwNBQ8hmb3PwLpQi5EYB/PetmQeTECTx7eKmnORwk3MYLbU4MI44+qLY+fbe05DJwUXITaFCU47mJO0QaTWL8OYVTsVMHwZ5bLSwm8M9rZyy6rLQTU93K94jqwZVKGJrenUeAgRbgqBoC4CEY7g5uQd6KfUir7r03JWGR0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DS4PR11MB570107.namprd11.prod.outlook.com (2603:10b6:8:4f0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 08:01:15 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 08:01:15 +0000
Message-ID: <d3fb2dc3-6200-4371-889e-68ea6e191c4a@intel.com>
Date: Tue, 13 Oct 2026 13:31:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_vrr: Let the pipe go idle before
 reading the DC3CO counter
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>
References: <20261012093308.731774-1-suraj.kandpal@intel.com>
 <20261013043228.804706-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20261013043228.804706-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0342.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::9) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DS4PR11MB570107:EE_
X-MS-Office365-Filtering-Correlation-Id: 436033a3-84e1-4309-654d-08df2900279c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|4143699003|10067099003|260925021911599003|260925021311599003|22082099003|18002099003|260925022911599003|3023799007;
X-Microsoft-Antispam-Message-Info: PSm4NdHpgY9WuyOzHYOKF9D1p8dOM8Lh8q6+Y58thT4KRrP9xxQKC/UeNUAtWCMzMqXGiP62OFzm2iMghbOBgKebkwXL/ANojpDvcZyUPaXeX13nUHzpkhZ9jy1bjp+8Re8ACewGJTMeRXFpMlRlPPb9K2qMJvOdrBuad5B8nSO6llriqyOpLU6B1IQ0Y+8iNd+TXbZn1lVP4yt2j5TxDgJ0TD1WyxA3hDO0uA2gscIn0PsyaLBwQrPGK0Ogbuob+bU77UTuSI1nWyPGhg329ovu3N7sSatVqEX+8981G1S3VC6U2OLI/SIRe2FfFYM+T/9k6D4KO/x8/SEwQVzHb06pQgA6os2mvRU4KN2YN5Ypw2UOJuiIeve69Jet0Bc5gw7Xz3eE6gzbTafAjIAUbMpFL2NrO44UHJSXj1l+D/wLktTUKKbL3jPIxOZBFeoQ9s9Q+9HDwYh7uQ5udzVj653//2HPYTgciB76DTWdorivP7PguSLf9ywkqc1DWvR/4clzySRwEidnD47cyXaM3z7uz2JjVlcCpYzANu05z6BDg0HfMpzFq2/H2HFwTJVff03/q5NpMEBQKWmCktsmoS4+uE58D0gBqWL7qHImkvYKLEW/IypztWshbhfohJT5loXeTGLk3jkGWdWxrZ0GKCUbU+AVuquILP/LCCLVx5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(260925021911599003)(260925021311599003)(22082099003)(18002099003)(260925022911599003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmdvWkZhOVNUMVZOc25HYmxzY3haSUFhOXBGeUVmbGhBd0UvKzE4c1NJdnNn?=
 =?utf-8?B?ZG9mSitiT3cvcGhxZmROWXdBWElQUitsYzBlbmwzRHNiWGxMaXc1b0pkQi93?=
 =?utf-8?B?bzNURVowSHZFdG4xM2c0NHR3Vk50MHAzU2Fwd2NZSjE2QlZJNFkvMFoxYU0w?=
 =?utf-8?B?Tk9iM1hOMnAzMGNWakZEamJMSzEyNTRpSFZBR09rMmRzK3Z2MlJxaTA3OW1i?=
 =?utf-8?B?Z0RQUU5MVitpQTdyZlExRkxRVkxPTGw1V3VvNmc5Vll3UjRkVFN3bGMvcU1Q?=
 =?utf-8?B?ME1EWmpTZ0t3b3FFcjdLdzJoNCtFNDl2RXZzOUo1WVdQS2N5cDFuc3dReFJk?=
 =?utf-8?B?cCtoREJLRmVtVFlRNE1XR2k4NWNLb0FuTDlJOEpZOCtITStsSE94eW9UZ2xy?=
 =?utf-8?B?NCttcW4yMVlnRnZrRmlQaTl6Q0MxbVA0UDFnZEtoWmVicW50OGlXT2ZhK2xq?=
 =?utf-8?B?dXQ0Q2p5NnhHNi9NcGQ1L00zQkMrdWRSbTd6SVRkb25CcEVpekpvbDVQOGR6?=
 =?utf-8?B?Y29aOHExdktEc004RWcyMXM5WDN4WWlBbUxGaEhQOWdSc3FzTUtOanhaZ0E4?=
 =?utf-8?B?NTdVeGdOWXprVkpTdjlPSFM4RlNMRUlDZTlPb2pxN3Y1ejNaNkNRY2Q0N3Y4?=
 =?utf-8?B?Ti9uajhYUlFRaVhpNGUydlZ6QjEwSUxLRURGWHl3R3k3YVAxbC90bVlFWHdU?=
 =?utf-8?B?eTZORDZtZjQzU1dSM2NOMnpLQVpPdmhuMGF3RWgxUWhEaEVKSFB4OEJVZWdE?=
 =?utf-8?B?OWhnQjRhdmtpVnpQalZqeGdxdEIvNEdyQTRkdVZMVXNhTUNYQjV0c2ZkUVVQ?=
 =?utf-8?B?WTBSelBDRDVOTUdOb3VOQUhGTUtoRnA0aVpqem0vSW5PcjhJcmY3VVhjaldr?=
 =?utf-8?B?bTg2UjVRbWsrbFdMZjJhSjgrNk5qN0pjOTF0dFlncmROWTlpVktRRnNnKzBD?=
 =?utf-8?B?Zlo0NHkzQjI3RGJZeVJBcklsRWN0d1M5WnQ5UjZDZ1UzMlBZWDl0OFhqZ0pq?=
 =?utf-8?B?L2FsNXdCSWNDVEs2b1I4L3NrVzgxY1BxcmxtOUwzOVBVcEs1TW1qWGxDLys5?=
 =?utf-8?B?cUM4NVVHV2FPSTFEclpWaFBxQlgzR2J3VUtVaW9wY0x4SFJiVXYzMkVLZWM1?=
 =?utf-8?B?K0FjUXNtRkZDTWt0VmRHT3RwTE5VNjNDcCtvbDFBd1RUMDI2MlhmV1l4eFVj?=
 =?utf-8?B?dVZBbFBLa3RNSGNDajdEUkpDN3ZGWWwvVE15Wm5TNWlUckt5dlYwdTVzWm52?=
 =?utf-8?B?NE9EQU0ySkFMRlVQM0QxbkhUSHRnSlpWSktTT0tJVDFFZ3FYKzlzeXdpaDJB?=
 =?utf-8?B?cEpSODgyU2g0MjVnQ0p5L2JxNjBOUGZ0QmJNUUhTZUhYZjZ3N3ZhQm1IZlhq?=
 =?utf-8?B?clhXNGw3RTlnbVJPcU5JWFNHQUNCazdCWExjK1NCanphTkd1REZWWnJaR0Y2?=
 =?utf-8?B?eTNKQnRHRjFKbjdTL0JaWGt1UWQrYTBKM01VOXhTdkZJdGlqN21pZFlONEhD?=
 =?utf-8?B?aUZic1hTaWRhR09scDVYQy9IVTdBTVhVNFh3cEtkYlF0VEdyekdFWHNpajI4?=
 =?utf-8?B?TUNaNFVVanFtdWRNYjY4Vm5iZHo0VG83Vi9DenNuNFJXcmNveDcxVGNMQ0xD?=
 =?utf-8?B?UWNPamtBcXFCQVpOZHRuaVdVRW9ZM0tjRkNCZCtWSUZtNGEzS2V0cE5zM3Jy?=
 =?utf-8?B?elFKdVdqSzlPVzMxaW5tL2V2U09JOU5UbkZrZTdLSmpYa25aNnoySUo5UVFt?=
 =?utf-8?B?VGlBZlJPQkZOWjhKMng2TlZiK0J4UDhLWUhvaFdwajZsRlNGSXFtYVUxT2Zp?=
 =?utf-8?B?OGV1SHNSQW9OWTRibDFnd2FtV3BIaU5jTnZvdU9Ya1l2cUkrOHFWUjY5cHVu?=
 =?utf-8?B?RFk4M0NJcVdlM3c2dEM4WDNtZjdaK3RsbVluMTVzd29FdmxkeDZPdElybnFB?=
 =?utf-8?B?V1BPbDVlN3hvNTNOYUpsMUtReVRENnlpejY0aWQzYmdGZzVCS3VpS20zbURj?=
 =?utf-8?B?cWNuS1dMNElaSkFjMFdCNTNha1BpbjQrYm55UHNsdFFVSk8xQ2ZSWU1USFFs?=
 =?utf-8?B?QUFvQkdJeTBNcGFMMWtqZE9FbzE5OTQ0ekJDc1owalR2eGN3M3owVDZ4SFpp?=
 =?utf-8?B?c3ZYUGxrYWdjRUhLOG44VU5rMDJpSmRibzJoaFRSaHNxa3Z0TGpvaUhFTEZp?=
 =?utf-8?B?R0h5Z0hZODJFakhKS1Y1L2dsdCs2MFpZSDlMM2cybi8zVzBSMi9GQVN5Z1hK?=
 =?utf-8?B?MGtzZnIxVG9rbnl3cTJnWmxKRG0wR1FFQ1lVQkJ4bU9nRm5mYXR2cDJKeUla?=
 =?utf-8?B?Zm1ySnM4bzdKUFNHbDh6Qnp2L3JwOVJteDR3cmtEQ0ZBNHVlOUw4azgwbmdS?=
 =?utf-8?Q?B8Gid/VDotsePNaY=3D?=
X-Exchange-RoutingPolicyChecked: rMb1XB4REgiwwVj7iGEm37T70RRuwgkfqLWcCeutarNBuZxALgNGW3BEHf/uE3MxDijs3BjYgLTfiem+sfTlt4tPfJhr8omID3MUoXfu9wRr1uP2YaJkijYOJz/XfqEf09rUqqZQZogFwTOu5hls5j1b0LE9k1UFWRMpoEnkwO5BG0/5FTS+SktOeDaP2CkFbZDWSy4WJbUbfS6ZtiH1KpVMbiPrQKRkrVCIdFksM8yC9EstU6VHPvswUemXFwLavF5oZkDs4r8K/9SkeYAtbN8beSw7qCzD/a4tkmhiLeLy4tHd+jaqvaetHX3UW5nDSz/BBv/ZzAsfzE/mLQg7cA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 436033a3-84e1-4309-654d-08df2900279c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:01:15.3390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNFOWWuJO3Bz/DUvgAAvQw9NauJb6+tZtMgm3e2qudVGHPcChXYiqDCYXa2v6aO/o8AT7YY8l8HjTh1dP2K5fc34umuA9g1R+ejpuSWmvDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB570107
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

Hi Suraj,

On 10/13/2026 10:02 AM, Suraj Kandpal wrote:
> Every atomic commit holds DC_OFF until a frame after the flip, so with
> flips arriving every ~33ms DC3CO never gets a chance to be entered and
> the counter stays flat for the whole measurement window.
>
> Flip first to confirm LOBF comes up and stays up, then sample the
> counter across a second of an idle pipe instead.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   tests/kms_vrr.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index b41c58539..a02106fa7 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -106,6 +106,8 @@
>    */
>   #define TEST_DURATION_NS (5000000000ull)
>   
> +#define LOBF_IDLE_DURATION_NS (1000000000ull)
> +
>   enum {
>   	TEST_BASIC = 1 << 0,
>   	TEST_DPMS = 1 << 1,
> @@ -1158,6 +1160,8 @@ static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
>   
>   	test_lobf(data, crtc, output, flags);
>   
> +	usleep(LOBF_IDLE_DURATION_NS / 1000);
> +
>   	dc3co_count_after = igt_read_dc_counter(data->debugfs_fd,
>   						IGT_INTEL_CHECK_DC3CO);

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
