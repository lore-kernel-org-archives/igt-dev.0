Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB22CD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 05:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF95310EC95;
	Wed, 13 May 2026 05:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBw4AZ9D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511A710E0DF
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 05:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778651018; x=1810187018;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EgMc3aKh7/eZsZivFbdwZTAGJP5SDJb1GlFDsdQy54M=;
 b=JBw4AZ9DJw5s79kQ0VSzOAWMDVMueKxefuDZTJ6Xyx6Ow4+LvgD9b2SA
 LgNojRUeIDlYv3XFpnbrzYzMH4zxueWnlBh7zr0YLP6p9Yvulo7irclSD
 AV4rVQgVKmi8wTllg/gYMSU6EbXj0gMSBSAuno8DJDODPlNZhqLT7qZsL
 teMsykTxwqXveMxxuO3W0sFevApxqo7ao7ik7yeyH0CtAJgMlldY/C6Fd
 Hsi6Ua5sb8jgm+iRKP9iIUkJoL0Wrpgd146jYJcvPA94yyeWqbb40B3+N
 4Hb3hK7sMR4K7vR38vEynBw8RnBR5+WA3N1ZfowF45ar8GXV4zzr4SiVb A==;
X-CSE-ConnectionGUID: 4O/XO0WCSCm+I+ncuFyKGw==
X-CSE-MsgGUID: aSpTn6I3Tgm6l7EzfEeqew==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79522963"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79522963"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 22:43:36 -0700
X-CSE-ConnectionGUID: KwiEUU1fRdW3sQ90jRYasg==
X-CSE-MsgGUID: 7jQyWpUNQAWZv4niI1iJTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="239793679"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 22:43:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:43:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 22:43:36 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 22:43:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln3X1CwrXdZRodSgkTiYRWcbBhsqMaYysiMrMo0mWoO8OTg3oS+J/rRoP2XoVH4WLRYkoU/GhSMR3eKIEsCVQKQr6rg67JN1T7bfCWR96LQJIM/gCPyNnA05Y0Ds+gHuktKkJ65ubVXNOATF64XKO23JG/sS8Bm7gzX1bO2UJHOYwqt1jWVJAsLXD2ghlxLP89CyI2ZjtnShrnRgGWDjo32zFsTk3uy7hUy9OeMZ9S8DAn+Gi07Yppml47fPLnbnRJXHImEnMCcER/5E0BnHkfeu2rq0AeX9TQ59HMEM40H4MNCJpeRgMOOdnDnb1tqTSIgtWRvNuhn4V9zSSpAe1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1oUwy5gZefYU0sfPi8AVCVFZjyGesi6hkPjdeIFH4O4=;
 b=EeMazM2qfBct5DEhOLB2fa+C2514q0ZlgIeY56447Koz+Sg3+psVzDxkyShNt8CIRo4QTokL8rhGdWJTlInZ7K4uJglYbOEq5FZ53joBvF+WybYkIRn+Wme+z82v6AjTMunXVwSkwto/zcL+Rlo83ZuQNSJl8aynLPvzYnE/Od11vV2RJ7Huqvzb3EPhLDhpWKlFqNmtkGI3YuYLZWm0cJcHTBgHHMFcF+qdOfThO4c6IQrA0OcgfGk3q5OvzkKALCo+fC5G1GXDt2nCkghK5QL1MGM2TL+1NnblyjXhdBx3gkNWbf1SG95x+WxI/Ce9HtFeZzG/IlgrWxPeKTJq0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8137.namprd11.prod.outlook.com (2603:10b6:610:15c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 05:43:32 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 05:43:30 +0000
Message-ID: <fd796c68-2f9f-43cd-9be7-236aac1f4f22@intel.com>
Date: Wed, 13 May 2026 11:13:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_chamelium_color_pipeline: Add plane color
 pipeline validation
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260304093718.513512-1-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260304093718.513512-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0360.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::11) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed5d78d-a467-4a89-2eeb-08deb0b28fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799003|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: wgpg2ITULIQzZ637imtoUMPOf1VuSxZLx95iSx3hE2mjcEA4y/aAIyoxudrx+sEtTSLBUP9BAub57z7jCEQvMkbrkIqAwApkkQlaQGsGlp1XZzN68rbDAjQaUTLJmp6Zcm8A7bWCnXM6y3Ea6DNt7Thohf5iWl79ehirVfl4AWCCJz22kLzu71nTFmdq0BeNBe5oqOxvKJDDQi2UzBXEzy20aN5MZuZ4cXLJpj7uwelhfyM7QajbfMc0ZRisPjOyS+JXXq97LHpVsp4XEhWtoM2saKHEYzoD1Vdlkw04kDxx7U5gaSffNgbPDyi/hkwqOG0Ic6vpwj+A7LVV+kZEQpHAF9ga7IAqIvE9zXOVi6j17PWsA7STWK/QQ4/GF91mb2Ta/pZ4is6k56dSYrIDxUDuRTOOL8AfAI6hWVteVKbscBWRXwUdaBgvwQWAov7fPAkpIFDGsXpInbAigio/lm8hMydrxzkMXB+hNFmG2JShsWKsPDz3j+IvIbAOR2WBwmcOtDzTLaIXi4Fagpu6LjurwQJoLLfySWEJFVGyL1LbuUuIBq/oij7Ua9wYiFgrsOorpnZOeYkflZsZagi2e6Xek01QQjXha9kRGsuVe+VkiKI+NmLaBVH/tTBYHQzRaliAnzNsExPHa/mpw+f+HhWZhEOsHZbMHuUvrYXs0rXSknk0wRjcQJ8CEH6LQ6pW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799003)(18002099003)(22082099003)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzRuT3VCNmdlcUdGZzJZNGhmbHVyUTFBbkdFcXpGTTZkQXRseWdxT2Yza1pV?=
 =?utf-8?B?emZUOGk5aEx3bGlFYnFrVktaMk5qZVdLeHhUYTVjTDNac0JIL2tZcGJtT0E0?=
 =?utf-8?B?ck5HdEplVHUrU1NWSmRqSC9uYjNxbVpNZENxMWNjS3FMT1dSak5vWGU4TmFu?=
 =?utf-8?B?b1VTTHRaY1dhL0x4UERhVmpMcmJOSzh1WnBEU056U2R2RUU3US9BSUlpeXFS?=
 =?utf-8?B?eWt1cEw3OTFDQzhObEZ5M2hOWkVkMnZ6NkpFS2pxRlA4Z3cwTU1MT3N2emRB?=
 =?utf-8?B?T0l1UGpEUXpyOEt2cmxEcHYvMldIYVcybjZaWkpFcDZqRlZOekU4bTJ0L2tP?=
 =?utf-8?B?UXFjWFFYeE1nbUZXUG0rcERwelJsQ3VRaXZ3L2VsOC9VS0F4c2xiWkNSUU1y?=
 =?utf-8?B?UTBqbC94V1NudkovQW9kQUdjUFlYSEFYSlIreS9nQjRjOVl2U3JqOW9GOUpE?=
 =?utf-8?B?TTV1c3ZlMXJCTHlWODNKQkpadzdKWWpHekM0Ulg0OEZQVzN3Zm5qTzNPcWlE?=
 =?utf-8?B?aC8vUnVuSWI2YlZmcEd5UUVXRDJMZy95QmZ2RzYyenlEVEZOU3lVRHppRTBJ?=
 =?utf-8?B?SU5Ybm9yNXpWQkFQTWZrVENweWdmVlVwWmRqaHdPeEFQbWxjZkVZUmlOQ2VG?=
 =?utf-8?B?S2NjM0pvVHYycW80dmhxdnowWnRFZE1Lekx6TGJCVktpTHpUV1lDdmNTbnVx?=
 =?utf-8?B?SXQ4T0RsU2FyRmNIMitvQjJ3SW12TTAyYTB5UVBwZkhZa2tsbFhXSk96SEVQ?=
 =?utf-8?B?Q2xCVXNGYThaZUEyYXdORWtJcnlnTVN1bmc2bHNNcFA2TzZTRDhmQjJtNjJQ?=
 =?utf-8?B?Ymw2VGxpT1d6T3cxNGhsNkxZdnBZTGptREJXUmsvZDI5OU5NSEJQajgvTEtv?=
 =?utf-8?B?TXUxVDhVRTZIbDh3cEt0YXNIcWo5ZVdzdWN6V0dLZFJOb0RZRC9vcXgzcnhK?=
 =?utf-8?B?TXZCaTVBUGdxRmNEZjdOa0lGZVVpU0IvMkExMVhaQzV5SDNjb0tOTUJFK3U0?=
 =?utf-8?B?a2dyZ3JGT0hNWmhvaTFtOVkxOVRzWXVlYjZFNDgzYlE0OHRWek9DcVhac09r?=
 =?utf-8?B?NjhCNi8rMDNEem5sd1VMeTlyYjZ6Q05VZ3hueDRwUVNwaXNSbHg1MEtJbU9n?=
 =?utf-8?B?b0daZzVKM09IL05mRW1JU2h4VFVBTGszWjFCREFtWmhlWGorWklwR2ZvdXpn?=
 =?utf-8?B?MmVCZmRFT2QvWlZ5ZHFNelQ0SkdGd3QyK21tZmdlb2R5MTFVRU5jUkEzSDEw?=
 =?utf-8?B?em0xUlhOVnFDekFHV0pLb0ZJVXhqVnRXcGxWWVE4eDFsd2JzZHNJQXplSHJu?=
 =?utf-8?B?TW5UNlNzUU5RSFYrVTY1eU4rMHBuWHlUTVQ0RFRRQUlUR1J5R2hiTWQrelZu?=
 =?utf-8?B?dmdjR3NvTy8vcUNDRStFckZCZVlNdyt2b2UvWitNVzRZd1dTMXNBbmtsdlBG?=
 =?utf-8?B?bzI4ak8rRnoxc0lHWXN2MkU4YlEvc01oakFJM0FwU3FXOGR2bjRLT1kxNm8r?=
 =?utf-8?B?d0JmU0pnRmVNRENJZkxCUmpPM201UTU1YlRhNDFmZlZyNWVQZEF1OHdtd1JM?=
 =?utf-8?B?Y1dNZmtpRS96WVBjOFE0M2tEQkdMZEo5dWxycnpxKy9RYTJidzRIUWhGYWFu?=
 =?utf-8?B?bjRkcjM3RExTeFJsdG9IbHZ2Tk15ZmZJTkdWV2FncDhndm1pV3BOOEd4YnQ2?=
 =?utf-8?B?TE83NmlrWlR4VyszT3krL2ZNeHQ3N2dEdGZySll6RnQ4S3U3R3Q2aHFadkdo?=
 =?utf-8?B?NFBwSXlwa21xcGY2NHhhNWJOMEduTURaT2trclBwMnJtMzBRZE9POHRvMVdE?=
 =?utf-8?B?QVV3eVRVYndOT0Zhb3ZRNkNuMFhiM2NVN1RHSWVkWXVpRXBUNWg0RDNLM3dm?=
 =?utf-8?B?Sm1JcEZHTkF4WUE2VHh3cWtEOEY5TVdrWDFZUmlUSXNhRmx1Z05kMU1QY09X?=
 =?utf-8?B?OUhlVUs5bGp6eWdBYXphT2gvb0Y4RUo4ZWh3L2dsT0cyc082dm5hWjQzOXV1?=
 =?utf-8?B?cUtLZi9MeFNsU1B3Nkh4eUlYaDZ6MmZuKzdyQ2ZzL1RqSUU0bzh4TUtubXVN?=
 =?utf-8?B?WnB5Q29tWm84d1hwUStYL1ByL2RJUGRVV0NhRE9obWx3by9jYlNkeFJ2STVr?=
 =?utf-8?B?TytEWlJsNEpHa0VjTm1UVGJDM2FSODNpN3g0SkZTTThJa25CbXlGMmFaL0JS?=
 =?utf-8?B?RERydTdIRjIvdTBJUHlFUE5LWFR0bUR5dlE0TWpQVVo4ZXVaRU5SK241R2s4?=
 =?utf-8?B?ZW9LWkN4dGN1QjhHV2RzV0JvS3NJeGdXSWRDazAzVjU4N3J6UzFETzVqanpj?=
 =?utf-8?B?TnhtTjlvcTcrVStHM2hXRG9XK2NTQUE1K0pvcXFsdEcxZnRycVJPdG1VMUow?=
 =?utf-8?Q?ifwNhj7/qUSlniT4=3D?=
X-Exchange-RoutingPolicyChecked: JvuFkknlAi8I2WdoLNA9VXIh+4h5S6eHMAr3XAK/dgHYcQvRuggnBxERBsYZg9Iyb/lF3uQa7DhoVo0o3UviSBazLhbnC9c1fF2OP8nqj6jT1I1StQrSe1EGG+CBfr3yf6QFy0AMn3s2u+BEChqDbzwla32IoIrMYq/086AIPMpEPD3NkRWQ67sySoPXtraePwlBoELg6oOvGrCbYNdFrVrUzuBPabPCRjXIyolH3/Q6CpnQAibKrFxmwzyLTFJZg4+fw06brpKSe02zcsD2grOOo0UQUOaAkngXXIVcsBFUubev3VwRhEaRimIIlTqsu8heLn7ZLxeHqwL6+DNntA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed5d78d-a467-4a89-2eeb-08deb0b28fea
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:43:30.0104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plociyou5nNitzimwAWhcf7kZ5Gyzxcf/1DHxOleem9iqHVTxQTEulPWF4FskmtUwLuBuBf8S2B1hKbcsVNDV4jtx455ml8YBTau5/k1M2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8137
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



On 3/4/2026 3:07 PM, Swati Sharma wrote:
> Add a Chamelium-backed test to validate DRM plane colorops
> using frame capture instead of pipe CRC comparison.
> 
> The test generates a software reference framebuffer by
> applying the expected color transformation in bypass mode.
> It then enables the plane color pipeline in hardware,
> renders the input framebuffer, and captures the output
> signal using Chamelium.
> 
> The test passes if the captured frame matches the
> software reference framebuffer within the allowed tolerance.
> 
> The test fails if the captured frame differs from the
> reference, indicating incorrect color transformation,
> pipeline misconfiguration, or hardware output mismatch.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   .../chamelium/kms_chamelium_color_pipeline.c  | 401 ++++++++++++++++++
>   tests/meson.build                             |   2 +
>   2 files changed, 403 insertions(+)
>   create mode 100644 tests/chamelium/kms_chamelium_color_pipeline.c
> 
> diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
> new file mode 100644
> index 000000000..19828c5f3
> --- /dev/null
> +++ b/tests/chamelium/kms_chamelium_color_pipeline.c
> @@ -0,0 +1,401 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms chamelium color pipeline
> + * Category: Display
> + * Description: Test to validate DRM colorops at plane level using Chamelium to verify instead of CRC
> + * Driver requirement: i915, xe
> + * Mega feature: Color Management
> + */
> +
> +#include "kms_chamelium_helper.h"
> +#include "kms_color_helper.h"
> +#include "kms_colorop_helper.h"
> +
> +#define MAX_COLOROPS	5
> +
> +/**
> + * SUBTEST: plane-%s
> + * Description: Test plane color pipeline with colorops: %arg[1].
> + *
> + * arg[1]:
> + *
> + * @lut1d:			1D LUT
> + * @lut1d-pre-ctm3x4:		1D LUT PRE CTM 3x4
> + * @lut1d-post-ctm3x4:		1D LUT POST CTM 3x4
> + * @ctm3x4:			3X4 CTM
> + * @lut1d-ctm3x4:		1D LUT --> 3X4 CTM
> + * @ctm3x4-lut1d:		3X4 CTM --> 1D LUT
> + * @lut1d-lut1d:		1D LUT --> 1D LUT
> + * @lut1d-ctm3x4-lut1d:		1D LUT --> 3X4 CTM --> 1D LUT
> + * @lut3d-green-only:		3D LUT
> + */
> +
> +IGT_TEST_DESCRIPTION("Test DRM colorops at plane level using Chamelium to verify instead of CRC");
> +
> +static void test_cleanup(data_t *data)
> +{
> +	igt_output_set_crtc(data->output, NULL);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +}
> +
> +static int test_setup(data_t *data, igt_crtc_t *crtc)
> +{
> +	int i;
> +
> +	igt_require(crtc);
> +	igt_require(crtc->n_planes > 0);
> +
> +	igt_output_set_crtc(data->output, crtc);
> +
> +	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_require(data->mode);
> +
> +	/* Disable pipe color props. */
> +	disable_ctm(crtc);
> +	disable_degamma(crtc);
> +	disable_gamma(crtc);
> +
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	/* Find matching chamelium port */
> +	for (i = 0; i < data->port_count; i++) {
> +		if (!strcmp(data->output->name,
> +		    chamelium_port_get_name(data->ports[i])))
> +		return i;

wrong indentation.

> +	}
> +
> +	return -1;
> +}
> +
> +static bool ctm_colorop_only(kms_colorop_t *colorops[])
> +{
> +	int i;
> +
> +	if (!colorops[0])
> +		return false;
> +
> +	for (i = 0; colorops[i]; i++) {
> +		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void _test_plane_colorops(data_t *data,
> +				 igt_plane_t *plane,
> +				 const color_t *fb_colors,
> +				 const color_t *exp_colors,
> +				 kms_colorop_t *colorops[],
> +				 struct chamelium_port *port)
> +{
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_colorop_t *color_pipeline;
> +	struct igt_fb fb, fbref;
> +	struct chamelium_frame_dump *frame;
> +	bool ret;
> +
> +	color_pipeline = get_color_pipeline(display, plane, colorops);
> +	igt_skip_on(!color_pipeline);
> +
> +	/* Create HW framebuffer */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +				 mode->hdisplay,
> +				 mode->vdisplay,
> +				 DRM_FORMAT_XRGB8888,
> +				 DRM_FORMAT_MOD_LINEAR,
> +				 &fb));
> +
> +	/* Create reference framebuffer */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +				 mode->hdisplay,
> +				 mode->vdisplay,
> +				 DRM_FORMAT_XRGB8888,
> +				 DRM_FORMAT_MOD_LINEAR,
> +				 &fbref));
> +
> +	/* ---- Software reference ---- */
> +	set_color_pipeline_bypass(plane);

This is a no-op as we never commit this (which is alright).

> +	paint_rectangles(data, mode, exp_colors, &fbref);
> +
> +	/* ---- Hardware path ---- */
> +	set_color_pipeline(display, plane, colorops, color_pipeline);
> +
> +	if (ctm_colorop_only(colorops))
> +		paint_rectangles(data, mode, fb_colors, &fb);
> +	else
> +		paint_gradient_rectangles(data, mode, fb_colors, &fb);
> +
> +	igt_plane_set_fb(plane, &fb);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +
> +	frame = chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	ret = chamelium_frame_match_or_dump(data->chamelium,
> +					    port,
> +					    frame,
> +					    &fbref,
> +					    CHAMELIUM_CHECK_ANALOG);
> +
> +	igt_assert(ret);
> +
> +	/* Cleanup */
> +	set_color_pipeline_bypass(plane);
> +	reset_colorops(colorops);
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_remove_fb(data->drm_fd, &fbref);
> +}
> +
> +static void
> +test_plane_colorops(data_t *data, igt_crtc_t *crtc,
> +		    const color_t *fb_colors,
> +		    const color_t *exp_colors,
> +		    kms_colorop_t *colorops[],
> +		    int port_idx)
> +{
> +	int n_planes = crtc->n_planes;
> +	igt_output_t *output = data->output;
> +	igt_plane_t *plane;
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
> +			_test_plane_colorops(data, plane, fb_colors,
> +					     exp_colors, colorops,
> +					     data->ports[port_idx]);
> +	}
> +}
> +
> +static void
> +run_tests_for_plane(data_t *data)
> +{
> +	igt_crtc_t *crtc;
> +	igt_output_t *output = NULL;
> +	int port_idx = 0;
> +	static const color_t colors_rgb[] = {
> +	        { 1.0, 0.0, 0.0 },
> +	        { 0.0, 1.0, 0.0 },
> +	        { 0.0, 0.0, 1.0 },
> +	};
> +	static const color_t colors_red_to_blue[] = {
> +		{ 0.0, 0.0, 1.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 },
> +	};
> +	static const color_t colors_red_and_green[] = {
> +		{ 1.0, 1.0, 0.0 },
> +		{ 1.0, 1.0, 0.0 },
> +		{ 1.0, 1.0, 0.0 }
> +	};
> +	static const color_t colors_only_green[] = {
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 }
> +	};
> +	const igt_matrix_3x4_t ctm_red_to_blue = { {
> +		0.0, 0.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0, 0.0,
> +		1.0, 0.0, 1.0, 0.0,
> +	} };
> +	const igt_matrix_3x4_t ctm_linear = { {
> +		1.0, 0.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0, 0.0,
> +		0.0, 0.0, 1.0, 0.0,
> +	} };
> +	kms_colorop_t lut1d_linear = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.name = "Pre/Post CSC GAMMA (linear LUT)",
> +		.lut1d = &igt_1dlut_linear,
> +		.transform = &igt_color_linear,
> +	};
> +	kms_colorop_t lut1d_max = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.lut1d = &igt_1dlut_max,
> +		.name = "Pre/Post CSC GAMMA (max LUT)",
> +		.transform = &igt_color_max,
> +	};
> +	kms_colorop_t lut3d = {
> +		.type = KMS_COLOROP_LUT3D,
> +		.lut3d = &igt_3dlut_17_green_only,
> +		.lut3d_info = {
> +			.size = 17,
> +			.interpolation = DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
> +		},
> +		.name = "3dlut passing only green channel (RGB order)",
> +		.transform = NULL,
> +	};
> +	kms_colorop_t ctm_3x4 = {
> +		.type = KMS_COLOROP_CTM_3X4,
> +		.name = "CTM 3X4 (red to blue)",
> +		.matrix_3x4 = &ctm_red_to_blue,
> +	};
> +	kms_colorop_t ctm_3x4_linear = {
> +		.type = KMS_COLOROP_CTM_3X4,
> +		.name = "CTM 3X4 (linear)",
> +		.matrix_3x4 = &ctm_linear,
> +	};
> +
> +	struct {
> +		const char *name;
> +		const color_t *fb_colors;
> +		const color_t *exp_colors;
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +	} plane_colorops_tests[] = {
> +		{ .name = "lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-pre-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_max, &ctm_3x4_linear, NULL },
> +		},
> +		{ .name = "lut1d-post-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &ctm_3x4_linear, &lut1d_max, NULL },
> +		},
> +		{ .name = "ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &ctm_3x4, NULL },
> +		},
> +		{ .name = "lut1d-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &lut1d_max, &ctm_3x4, NULL },
> +		},
> +		{ .name = "ctm3x4-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &ctm_3x4, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_linear, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-ctm3x4-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut3d-green-only",
> +		  .fb_colors = colors_red_and_green,
> +		  .exp_colors = colors_only_green,
> +		  .colorops = { &lut3d, NULL },
> +		},
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
> +		igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
> +		igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name) {
> +			for_each_crtc_with_single_output(&data->display, crtc,
> +							 output) {
> +				data->output = output;
> +
> +				if (!pipe_output_combo_valid(data, crtc))
> +					continue;
> +
> +				port_idx = test_setup(data, crtc);
> +				igt_require(port_idx >= 0);
> +
> +				data->color_depth = 8;
> +				data->drm_format = DRM_FORMAT_XRGB8888;
> +
> +				test_plane_colorops(data, crtc,
> +						    plane_colorops_tests[i].fb_colors,
> +						    plane_colorops_tests[i].exp_colors,
> +						    plane_colorops_tests[i].colorops,
> +						    port_idx);
> +
> +				test_cleanup(data);
> +			}
> +		}
> +	}
> +}
> +
> +int igt_main()
> +{
> +	int i;
> +	int has_plane_color_pipeline = 0;
> +	data_t data = {};
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		/*
> +		 * Plane color pipeline support requires atomic modesetting.
> +		 * The atomic capability is enabled here as a prerequisite;
> +		 * igt_display_require() will reinitialize the display state.
> +		 */
> +		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> +			data.display.is_atomic = 1;

we don't really need to set this here as it will be re-initialzed 
without ever being used.

> +
> +		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +			has_plane_color_pipeline = 1;
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
> +		igt_require(data.display.is_atomic);
> +
> +		/* Chamelium init */
> +		data.chamelium = chamelium_init(data.drm_fd, &data.display);
> +		igt_require(data.chamelium);
> +
> +		data.ports = chamelium_get_ports(data.chamelium,
> +						 &data.port_count);
> +
> +		if (!data.port_count)
> +			igt_skip("No ports connected\n");
> +
> +		/*
> +		 * The behavior differs based on the availability of port mappings:
> +		 * - When using port mappings (chamelium_read_port_mappings),
> +		 *   ports are not plugged
> +		 * - During autodiscovery, all ports are plugged at the end.
> +		 *
> +		 * This quick workaround (unplug, plug, and re-probe the connectors)
> +		 * prevents any ports from being unintentionally skipped in test_setup.
> +		 */
> +		for (i = 0; i < data.port_count; i++) {
> +			chamelium_unplug(data.chamelium, data.ports[i]);
> +			chamelium_plug(data.chamelium, data.ports[i]);
> +			chamelium_wait_for_conn_status_change(&data.display,
> +							      data.chamelium,
> +							      data.ports[i],
> +							      DRM_MODE_CONNECTED);
> +			igt_assert_f(chamelium_reprobe_connector(&data.display,
> +								 data.chamelium,
> +								 data.ports[i]) == DRM_MODE_CONNECTED,
> +								 "Output not connected\n");
> +		}
> +	}
> +
> +	igt_subtest_group()
> +		run_tests_for_plane(&data);
> +
> +	igt_fixture() {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 7f356de9b..3f50a3b92 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -359,6 +359,7 @@ endif
>   chamelium_progs = [
>   	'kms_chamelium_audio',
>   	'kms_chamelium_color',
> +	'kms_chamelium_color_pipeline',
>   	'kms_chamelium_edid',
>   	'kms_chamelium_frames',
>   	'kms_chamelium_hpd',
> @@ -387,6 +388,7 @@ extra_sources = {
>   	'kms_colorop':  [ 'kms_colorop_helper.c' ],
>   	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_color_pipeline': [ 'kms_color_helper.c', 'kms_colorop_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],

