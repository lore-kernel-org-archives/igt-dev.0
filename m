Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A694C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 08:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4E210E1D5;
	Fri, 31 Jul 2026 08:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlGa0G8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8481710E1D5
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785486450; x=1817022450;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+5ACLW1a+8FJ3UEX0XDcpZETAo+rV2A7iSjeHjW/CuQ=;
 b=jlGa0G8MVS1LwV+YyKSoQ3bxvrvrlPF2zgE8E458sc6ggImWQ0sFpnvs
 p+H5nLy+52sAUprcjj586uL5fJsPEJnCR9Np2a97dT1I4ozjqf8aeN8bt
 s50VLob1Yl1xfFF7HjcmUX6G3BMBR3uEzPTCXqXLBCPixWUVv/kv/e5QQ
 n5ATgs89Jr/zREO8x2Oqm4VCkYbKtOMLlZm9J2uQPf2E4BGn5uf0wyLiX
 2V3kIW2M0Pk/4zdfK5MAsXtYWNMaIYORutxurIVNQBCgRU/hQwZCS3Dbm
 k6KNOIZSeoTuLnJ5TjfJ/UlDJIcZJlcJI06oNvWqdlMgH5tL97WH4m8xc A==;
X-CSE-ConnectionGUID: FUKGjmzeRCKQW8sXxNLA9Q==
X-CSE-MsgGUID: XDwdqaCRQX+bHFz3FXuDwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="111656992"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="111656992"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 01:27:29 -0700
X-CSE-ConnectionGUID: sZol2LGvSo24z0FdLXAiWQ==
X-CSE-MsgGUID: QghqiU4FR/y6BfmcVhkqKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="258736201"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 01:27:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 01:27:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 01:27:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 01:27:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrU1PHFLqw5BkN/9xfbIowxo4g6SThUidzONC8Dy4GFCgbQSSlvkZ47r5CQ4qIbqLHT8fC7KRUOtUYajjAFU0RzONlpBf17+dB62W40UY+ayXm0QLRDEWejmrMHJpyort2pJc0yHSj7SKQwjVmBBz7pb8Ub71UY76hE09bLrFPZM1BAZhW8d/5NwiZJjCP1T7tRvFNH7+ucUyfsTO+g9BmWHO1Qwe0hw3+CeWIrS7mj5DRFJJGBLSK8swACTDFiuIurq7L7rG5wMEeG3LU/gu25oYRF1Zeb7XN3JOIc5De3+s//qwdV/Inx+htvj2qGFh2PMk3EAOi4CD47Ss48KEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lk5vX7bksW3UvgMBXGT+APFoX6gUV7ITebaeyYktDsE=;
 b=jeoU6it5RRN2yZM/BHqFqwIwU4URI6WLdzoVvy82EEGQxqOxlXw4CucG4EtjRtaI5JzqI5U+8aCnYTCbJv7DuUAPyqxb2D5dDYH+LyHITBPuEWsASHbZ1Gi+9s9rvyIKcfQnJB0enVMTfc0s0yWdm5ueBYt/pHxr60hbOQI7FUOUW59fKX7qermpIQ5mYs8nDYk0W4SO6VV0Q0YoSJGWoV7qmUaxY7fQ+Skqp7TCpcHAKvwRWQl6jB8ymtmB+tghHjDnYPbn/H8cINa/35MpcCoSPKwZLCstsPnZmFkE7O5VjSTt5aeP95w12H6GJ2NS9+YCN0bAZOtxwflLthFyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB6920.namprd11.prod.outlook.com (2603:10b6:806:2bb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:27:21 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:27:21 +0000
Message-ID: <5829921c-ff2e-4bd7-be70-b1bc1ed07061@intel.com>
Date: Fri, 31 Jul 2026 13:57:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/4] tests/kms_properties: check colorop
 properties on active color pipelines
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser
 <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>
References: <20260602211259.898147-1-mwen@igalia.com>
 <20260602211259.898147-4-mwen@igalia.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260602211259.898147-4-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0344.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::10) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c50e8b-31c3-42dd-c1d4-08deeedd8a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|4143699003|11063799006|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: HO2FsOKwNzaUgviLvxURxesJdgUJt17C0RMoobeeBwiep9IDL9zVoChTUfaZbqKlKsibpFcnR7O2kzl5xNkfKyS5Hbv0OLgBqdlxGD+nIPqBUWHJ3kblNGIlfsF9EwtyDUJXY4Xn9scaFghPqz6DPGDoKYebmWdZqFxir1LibyR/Drhbc+FXRMmx1fgW/ASWO0x7MVxnBcl8S2pKReNN02KfNjRL35UsatC912+pC38391O5rziw3mt37a6TjK6K78yB/14rfgWpNwJqOMC65qRD7zJdiQ73jqt/O3uFWpknIa0Q6N2PNjuDXv2PHSGX7IJlDRiyaWA4bsOXt+W1+nJpELSTobePQpcYnRP4rT0zpf+UPun3ntl+5WXUpMMb2j4s63j63RuyQ7CIO0R3LBMno4L61ngK1byCFlkInw+hyaTqLXT6QuLxroJcF6xiZt146IK9rwwSiw7H8NqQqH+9ZWsK1qUXEc80n9gcfdjdkgGTFGtF+/XZpbwSGPyoKt+Ksg8RkpozFjGtl0nrJlykfRALdC0+psB+XS+pBnXdnAhjP0D36c20glIvL/C10lQfreTAT8neI5o6bqAOhQaSTG3MErJimCjkP0wqjbMuA88nC1ETQUYzhUscX8m1QGQuGC3yQpZWCWX2olBgrkh+VWctq51mBwQqOL6eFEY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(3023799007)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXdjZXRpTlNGSVVVa2xSS1N1dXdEV3ZWYnN0cmZHYUVEa1o0THFVTzdMQ2dO?=
 =?utf-8?B?ZGt6Rm0zcVZLVUJ6emtNaDBabnA1ZzdiNktXVnVWQW0vSnFackppR1pRc3hZ?=
 =?utf-8?B?TmlvdDZKS084ZjBlU1ZZMitzUkxicFRMWjBUajNPYWp2aUJRZ1krcCs5Sk5F?=
 =?utf-8?B?SXl4L3g1b2FGc2pLUkttRnpIL0Z0WmNGTXdVRk1yNTg1anFhNkNrWndmWGhQ?=
 =?utf-8?B?ZmVUaThvc1dFODdnZnAvT012dDFvWkkzUG5YbGpGNW1uYk5HQXNGMUV0UU5m?=
 =?utf-8?B?U2YwNlkyMCtISjh3ZnZkME50TW9kWlN5R1hyc1VQZG5zNUlIZnlMSzNLd3A3?=
 =?utf-8?B?cDdSekR3bHhJd0szUmgrVklSZnhGcmp2TENSczNQQTRuU2Q3MEljME50ODRT?=
 =?utf-8?B?TGpRZGNqMTdvejdnTDIzSngvSmp4OTgreTNEcmtFUnFHVGpoRmdYWTYwbnU2?=
 =?utf-8?B?N250R0lXR0xWMGt3RUpPL1JlQUtFWmJNdmR5Qko2R3RrNDVUekQ1NW4zZ2dQ?=
 =?utf-8?B?VUk1ZVcyZ3F4dDlNT1hFbldiWjNOYzBLOVZpK2NOdTdON0JHb2VUZEF2Yklk?=
 =?utf-8?B?a3Q3aUc0S3FpUzJCL1h5UjFJcC9VZnN2WDU5cU1vUlEwU3FXdUY4STJ4NW5m?=
 =?utf-8?B?OVZ6akc5UE5WdVpaSGR5bk5OeU1tR0ZoYzR3RG4va1ZoMlhTMGs1V2JBOXBB?=
 =?utf-8?B?TlhBTHUza2wzc20rTGVTckUwdVdnUDl0bUlBZjQrNTlDTWVQNzJxazJTRS83?=
 =?utf-8?B?bm9qK2VwcmQ1eklwMFBUeHI0cTluN21OeHV2ODBXaU9pV2I4NnVMd1lFNkJu?=
 =?utf-8?B?SDhydll5b1VqdTNhSDRoS1Bac1N1SmYyYSs0MTJVclh4TzVxcENQM2xTWFNE?=
 =?utf-8?B?VmtlYkhQTWNjUmE2cG1GdVhSRU01bThETmhtSWdTRjBSWHF5djhtUWJpb2Rp?=
 =?utf-8?B?UHcvRUtIMGdaOTJhRmpKOU9TRldOVktQT0FOWnpaUW82VEZ1Qjl1SU55UmFY?=
 =?utf-8?B?U1gwSHRJbmN6M0lQUkRmTFRmRVN2cWNra2R3eXNXMk1aYWJhRnNQWGJDS1px?=
 =?utf-8?B?TmppRHhMekM2WFRsRFB1K2ZmVWxzbmJQcDdwTWExWjhFc04wVUR1cE1DYlJU?=
 =?utf-8?B?NU91Y1ZBeDlBaTZHRzJuWVJVVG0vMDdETWNWRUdTQWlGdExuWHJqRnNMdk5G?=
 =?utf-8?B?L1pmVjUxUDVpY256RVVTbVRMT2tNR0tZL21TSzNtNlZ5a1UwSERKY3hlTitU?=
 =?utf-8?B?OVpId09iNlNvaVkwMm04K29VaUVrNjlDbW04bjdxVHcrNmhpdmJSUUI0K3JR?=
 =?utf-8?B?bnRoK3pIY1FrNnFXVjBnNVBuQnhBUTFpK213YTlSSHVOSmg5Nk5TV0tieHlz?=
 =?utf-8?B?d1A0NytaTk9LNzlYcS80RUtYMUtsdkdqOGZQWjZRNXJ1RFVQS1hnWjFVUDg4?=
 =?utf-8?B?NWUrVVdPMjZWT3NUYnpZbWV0c2tIc2xPWThiaGZQcGRmRmp4QkxDUG5QSUIz?=
 =?utf-8?B?Yk8weGptSXhYNlk0ZHBXWUkvUGIyYSsxdS8yenVucDBHSGtUb2lxVzJ4RTFO?=
 =?utf-8?B?VDZWZlljSkhtMjBhc24wMDJES1F1Rnd5SG5EaE9GSkMrVVpNOFV6Q3VmQVFR?=
 =?utf-8?B?L0U3ejVPWWIyYWdFZkdpWTFad3JwU2lUL1UwUEZNTkFaWHJCK3RYaVhnOVlY?=
 =?utf-8?B?NWZqNFRPVWZtMkpQL2Rrd011bE93Y3JGSStIOEF5MVJ0Y1YreUVJWnFuakc2?=
 =?utf-8?B?VG13ZHdFZHRxRTA3NXU0QXRHZlMvYlVoSFI3cW9EQ05lQk93VDNwYjI4SlUr?=
 =?utf-8?B?YXoxRGFxRkhrSFFaWisrd2ttQW4zUVc1dGJVbXhZdldEOUJBYzNaN3dab0N5?=
 =?utf-8?B?U2R3TkRPSG9DUmw2UW1LR0h0cHJrbXdPZGJXR2ZvcE9LcUtGaWNrb0RKcXVW?=
 =?utf-8?B?VWJCQzI5ZTV1K1RGZi9ST2pOSHRqajZ2c0ZMdzB5NWFTczVXQTRyYzNjN0FY?=
 =?utf-8?B?OVN2Tzg5VHZvbEtpM3FkL3RhK0p2Vnp3NXg2dGs4bEx0ZTJWN0RPNW5jWDcz?=
 =?utf-8?B?a3RqdXdLaUJ5YUkrazBVZk9tLzdWUlVhSUFQaFkvTFpKQzBtbWVBV29BTjl6?=
 =?utf-8?B?Q3BaQ29SS0JwVXhIajc0U3FINGUyRTB2NUkxZVZ4TVIyZ05uWHZVOE12VmpN?=
 =?utf-8?B?QzFvS2VDeHNFR1hzVHJ1TUFCeEFGMk45RmczTjQvZmdGSWRnb0IvL280bmh2?=
 =?utf-8?B?VGRlK21Fa2JabjZhczJ2aHdKZGRWckh4UXJ3ejlDZUNHUkY4ZC9wZHhJR2tE?=
 =?utf-8?B?WHpLZ2xwcU1VQmYxbGk1WjJOWVdyRVBQQStvM29McmFJRFBSREp0cG5MaEtC?=
 =?utf-8?Q?Lp1xcPJWR3/HN/FQ=3D?=
X-Exchange-RoutingPolicyChecked: LA4YpxbCzEhobDFHSlO/jBhjl4tlWwMPtQlDLo+Tq3jYPo9tkVhSZ9DHiQaRB1RB+hRZrAHs0faecprw90UJrFGAtDwp4zq5Yf55k1oJ9h1K9ZTS3ig9uLC1cW9ueuh3VFf+KeQlygimgKCPtHN8JEE+a0Zr6F4G4XndqMdLMNwYtUmksUI+iPmhgGbbWwS1Yc6MZkCb1mBZYJdAquxFnFRxAzH2qmIeJBTi9dDkW916xZIPKuN4izRSOIkE3SmWgvNxSWmPhKeXzhmvpiKKVoejAMZ+6OjL+wEXagsgAJgYHe7ExHdRejm0tyUpNFRug4Uab9EptLmVW7w79qvcMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c50e8b-31c3-42dd-c1d4-08deeedd8a62
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:27:21.1165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avAej4K2FfVRhbg/QhH0lew+94q98AsupXPOzCZ4QCuJ9vwvZUt4BxPYjmEs2CuT7+6l9PI3qdVkVtk2BGTjTJZ0wsjwsC9Y5FeDCNj+nUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6920
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


Hello Melissa,

On 6/3/2026 2:36 AM, Melissa Wen wrote:
> Colorop properties can only be changed if its color pipeline is active,
> i.e. the colorop is in the chain of the color pipeline set in plane
> COLOR_PIPELINE property and its plane is active. For AMD, a CRTC must
> have a primary plane active, so overlay needs its own fb and cannot
> reuse primary fb. Also, color pipeline cannot be enabled on planes
> without COLOR_PIPELINE properties.
> 

The patch is doing two things together. Can you please separate them out?

==
Chaitanya

> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   tests/kms_properties.c | 26 ++++++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index f735839da..79d691448 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -237,7 +237,7 @@ static void run_colorop_property_tests(igt_display_t *display,
>   				       igt_crtc_t *crtc, igt_output_t *output,
>   				       bool atomic)
>   {
> -	struct igt_fb fb;
> +	struct igt_fb fb, afb;
>   	igt_plane_t *plane;
>   	igt_colorop_t *colorop;
>   	int i;
> @@ -247,14 +247,31 @@ static void run_colorop_property_tests(igt_display_t *display,
>   		     &fb);
>   
>   	for_each_plane_on_crtc(crtc, plane) {
> +		/* don't check colorop in planes without support to color pipeline */
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
>   		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
>   			 igt_crtc_name(crtc), plane->index,
>   			 kmstest_plane_type_name(plane->type), output->name);
>   
> +		/* AMD requires primary plane enabled to keep CRTC enabled */
> +		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +			drmModeModeInfo *mode = igt_output_get_mode(output);
> +
> +			igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
> +					      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &afb);
> +
> +			igt_plane_set_fb(plane, &afb);
> +		}
> +
>   		/* iterate over all color pipelines on plane */
>   		for (i = 0; i < plane->num_color_pipelines; ++i) {
>   			/* iterate over all colorops in pipeline*/
>   			colorop = plane->color_pipelines[i];
> +			igt_plane_set_color_pipeline(plane, colorop);
> +			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
>   			while (colorop) {
>   				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
>   					  igt_crtc_name(crtc), plane->index,
> @@ -268,8 +285,13 @@ static void run_colorop_property_tests(igt_display_t *display,
>   				colorop = igt_find_colorop(display, colorop_id);
>   			}
>   		}
> -	}
> +		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
>   
> +		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +			igt_plane_set_fb(plane, NULL);
> +			igt_remove_fb(display->drm_fd, &afb);
> +		}
> +	}
>   	cleanup_crtc(display, crtc, output,
>   		     &fb);
>   }

