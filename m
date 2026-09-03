Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AB6C61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 13:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1062D10F601;
	Thu,  3 Sep 2026 13:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igQyd6CY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A018510F629
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 13:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788443928; x=1819979928;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B3jrM4+g1Atw6c4qnQNYQ+mFsZcCdmCNfoy5ebE+NX8=;
 b=igQyd6CYVWvIjKjOsVOFX6VHZtd7V1ylYzn9IXTMVsrJpvNanBm1Ctrs
 v1hq7GnUI970uaaykGCx0wb8uKd35/aEjXQIqjA5TTR3lt46VTaM+EItU
 npPA8rCPOBu6jFpJg7c6Z8jUYM+gMdxugFk0nh3ytmpZlQtVOG5oR5wsv
 VF+pTvCL4kWESsmn3JPKugj6YzvN250Xoa8aYtAVU/umRopq+5+jhZiXm
 eAhOS4VuMg4JKDuf4tSgj8KjOSyYNZlVLvzphg5l+SZYdP4MSVD7g5gTd
 is2igW50GO8qyC6EKDpZ3h/a9CXVxmpKfF7SYumpUCyp+aAqq+rtp3RA3 w==;
X-CSE-ConnectionGUID: JiBbCLLDQc614nZ1sYmrfg==
X-CSE-MsgGUID: RlPyZR2CRACOEqd/t2g+eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88950400"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88950400"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 06:58:47 -0700
X-CSE-ConnectionGUID: BzyYQXtsRb+p+nFArypKQQ==
X-CSE-MsgGUID: YPNSD5GcQemK5MEVMfvnGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="307945875"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 06:58:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 06:58:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 06:58:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 06:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkjKcYzicaGNUP2SOA8bRVb/58cqbwU4F0rXO6GFvXLxNBa7M5XKvnX5kInuGGlxg9ZWunONAgJuyakq0omRKHYqsmuSqHzfYKJ4+ywdREhfByXnFBvlCsPaDF48/DFWILhoB1DR8VFYKnm5ps/VuPFOWS360KR+5T2n/9I61skVbJftEOEchTR5oL4SMcqGXgElPKPpD4f+4Rco3kMDb9mJMFBPrhM5SmDor1RziOc2PBfQVxMKZR9d5BWcTnzLysQcGluNmBb0trbDbtn15CGSxJb9pySA2TITjjyM/UcTSp6sv+RNnQi1YSWFMH0eHgYWXy0r0oBBgMXJAbAXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpMfwyXZjzbptalhBXGMReriTUXoMvQWtCQtr5TMBd4=;
 b=UHUP90kziMVCGG2+GV32Y4nDwVBdWegPF/acJlJ7Uz4TlLJDnT4qjeT2BQIGfPVuyWF+d/5Tnss/ckurgR/l9+BnhGNKoeS3zB9XzjVJ0n6l55cLtVnfv0CSHjwI+dwRU/11j1XEfeiHYTLyUQo/73YT//exwjg3moHks4MPkLWs2FLFmoEDmndYnze+IYcitBchKYbubi+Ju/uKYBGOj3QZbKvg9ictWKGV+UI9AfRMOg2mvbwlj73Z3chzfwM2kBRKFC8QbOWCz8gbGJwEW8VmI02tFFTiyMcfRkQFOWsaIWPka/Mk/Q/Pwns/K+sWh062dUlPAODjJE7yPsI1mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DSVPR11MB620494.namprd11.prod.outlook.com (2603:10b6:8:37c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 13:58:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 13:58:43 +0000
Message-ID: <95dd0231-8023-47ee-8309-9d098280936a@intel.com>
Date: Thu, 3 Sep 2026 19:28:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel/xe_ras: Introduce error threshold
To: Raag Jadav <raag.jadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260813080513.254848-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260813080513.254848-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0062.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DSVPR11MB620494:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff1818a-83b7-41ee-09d1-08df09c3775f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|3023799007|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: DnQ90HB/MsXEzkO3S8wE8ilVXHFY+iyYqnN5Lgr/gs46yHNj5021PD2BiBsiU8FTEsee3G0JISoEDhKFpdb8PFBiNoTo/+4ot/4jjaHsjGJNYOxWX412QoglVe79vZYwDndSYEJwYrbESE8dd2N/XqUOjGTcLS3Sg933CXkV5aK8gpYh+jzrEY0hwz7zu9wahknXRAqbNEqcVYEj4AkzDvVbTcfN7hWqVHtnDpeJ8h+cRcqLCqzJR6T7/DBgx8Sd+7yfT3JCkMHEfgQmBuo6QpcFao0hlMdJ2FZUpO9YH7ncrehelIMHlsg1aUZ+6ECg834n8LK53Mh+nIWPc+c+LIFlDgzImnL2k0J2TT1mF47pvLeMhFcvdeY8bLwq2Y93HFq7J6ZuKktQgACE3m9IwBeUdgfVMxVjS2B+Kr4JliT/AYofmc91xqQdwzIakDSgbdVaNdumTpxmbfU0siaBKZc5RZtn6EIk56TG/RSp+eeplHLpLdoWcCoRkBQfO08etPWZcJ6fLWkJ2Qi4Rdf3hQ1QtTN1hWrjjEQ82K1th7EGmTSMkl6ithmvFgMyNWFENmSgDKmYMItdNqLXWh/BwVqPa7d1VEFVFAduDrFvHxHVjqKtmyOno74Hh42nqM0y8NOztrTWs8PiboGhDE0vJb/zcxwYKjfxllPumqjiWGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHpPTEhEVUw2N2cvWE9aWXZuTGhPYW1ZNzgrNGFtNWpENG15ZkVrWGZPNEZW?=
 =?utf-8?B?V04zU1VZRmdiMzlWL0pZZXQvcWJxbm9Vd3NMZ2NRM1BjUjZJNkI0YWp1NmRP?=
 =?utf-8?B?U0R0aGNIQy82Tm8wVDkrUVNCbjNnQ1FWZXQ4RllqQkhKNzAwRmNTckVKMnpy?=
 =?utf-8?B?Uk41NXpSZDAvUnF0S2NzSWtZZStVWG9yMlVDSCticSsrNlYrSWpGdlVtVDY1?=
 =?utf-8?B?Z2VXblZNLzhkSk1xb3RDRmozZzY0bmQwZmdmOXViQUpkbjYybEdLTWZLV0o0?=
 =?utf-8?B?alA5Nm5hSGZibWNCcDNxYU1PaklqckFCNnJqak9oTW01TzZrZ2xpUkRUOStB?=
 =?utf-8?B?T3VxbGhTS3duWmhudUJPMjV4NU1EaWRLWmxXbllKNmtwaWxHdkZ1RWFiV0VH?=
 =?utf-8?B?cGdCMEZrT0loZGJxYVdRVGEvc3VSSjV3KzdvbjFyU2pGbUpsUlArSTJpVXJ2?=
 =?utf-8?B?ak9mQmUyUlRobzFINFpoNjFFK3VTYytGUUZpYXAycWppRE9GSWl6RUx2Nnli?=
 =?utf-8?B?eEFjRi90T3RUZVlGWEh4V2RUTVlDbXhvYUNUeXhnNmE2QXV5eGhsTURHZmdS?=
 =?utf-8?B?S0llc1NRUmtSWWhPQzR2cDBtQ1A1K1dTS1JuQi82S3VUVkFnMXFHdHhkVno1?=
 =?utf-8?B?eUxtK29PZ1VneXV4eEY3cENsdHl5bWRmMUpWa0FMWVRWdS9lTUUrMzl1ZmNH?=
 =?utf-8?B?WE52cXFjSldMZkFFUHNkenJMSms2Y1k2TERBYkZqcHk3V0xOMFpldFhHaGRx?=
 =?utf-8?B?K2RqemNxcFlPL1daUDR4cllDNFR5cHRibFR3KzU3S3dFL3BkSTMwNUgzSFRG?=
 =?utf-8?B?ZjFra3JjZUo5R3pOeEpIalBMZXpaa29JU0dwWWVDRHVacnpURFQvSDZ2eTdk?=
 =?utf-8?B?R1VTRE84emlhTkR6Y21tNSt0bHdJZ3RxVzFzVWZuSytTK1BSSDVJclQrWE1H?=
 =?utf-8?B?bGlHLzQ5MVJRck5oeTZqcnBOTmJ0dGRwYWx0YXpScG4rWWUrK3FpTmcva1E4?=
 =?utf-8?B?eWNKWnlPNjJrVjlGZFhZTmc5WnVkKzA2enEwTDk4bjBqTDFYVXhYSmd3WDJj?=
 =?utf-8?B?RkFWOVFENUxTMjVOWlZZd3hPanZzRnRkTnJiZ1daVVpKWjY0Ui8wditmWldY?=
 =?utf-8?B?S3A4UDlIOEVNY243Ny9ONVIzUE1OMFVVZnl5cFRLV0wrZk9rVk1QN0E5a2xF?=
 =?utf-8?B?WmZNZ3BZNHYwTTdYT2JJYmxRdEYzcW1mNzlUYkhSdkpWWjVQTFR6TWI1aTRu?=
 =?utf-8?B?bkpGVllEY0o0R01zeEs5SS84VGgrbVRRb1N6WWNRa2JkQW4yZ09qOG9VeHpP?=
 =?utf-8?B?a1FGUmZ5MGhyN1N6eVVjRnA1YmhLbitseitFdHNGUmVERWhpUXN1TGJ2TzV4?=
 =?utf-8?B?VUJYR3Jmb0VDMG1naFpWR0ZZb1YwWTB5OGhyWFlNVTVQTXFRZEhIclNONTJB?=
 =?utf-8?B?bERjM1R3MGo0MVQyT3htbWhRaGNXa0JpV1BKSFJsQUZBQmxmVWVqSXRpVVZx?=
 =?utf-8?B?WUZLNjVUZkY4ZlR3SmFwelhUQXFScGd4aFMvdEpGZnQwdVZKUGhtc3pmYXdM?=
 =?utf-8?B?T3dwVEJlUTA5UXdldmFrYWdtcDhMNVlLbEx2cWJBTDRlaTdZSlphWFlVSTBE?=
 =?utf-8?B?N3VZbXF5VTNRVHJFSHJ0QXBMWGVnZFQ4SU1aNWdjcm1jaDNvTVI1V2pnbTZk?=
 =?utf-8?B?czlUT2JWajlqYlMxSjFOcHZ0T29VelVWTnFSdC9nY1laSUQvNU81eCs4cmZz?=
 =?utf-8?B?OUxrSjB1U3o4US8xN3JwNEtBSXdraFBDNUNMUFZJTEJac1pCMElwQXFPeVd3?=
 =?utf-8?B?RTVQSXBWWWp4UDFOeE5BOGIvTElid0IzMXNuamF1enZHeUpRd0tWeDBxZDRt?=
 =?utf-8?B?WnpmQ29nMUVWREtiRXcrWUxOMlIxc0hNZlJEaGovbTRCMnZuR3hZQmNxeWQ4?=
 =?utf-8?B?OTZ1UTlzV2U0ZDdRcDdaamZMU2UzSkxPOWZvVURBN2lIbXdtbURQR3laVm9x?=
 =?utf-8?B?ZUYrRys5NzF2Qk5XSDl3eDA3Y295QVZwVm02bXhMeWxGaDh0RXN3bkVqdnFS?=
 =?utf-8?B?OGRLU0hsSjUxNGhPQUkweWgwZzIvTGdoWllsTEFCNzlyMm9WY29Ga0E1V0xY?=
 =?utf-8?B?NGd1NlNpUVB4THJSMGd5bTRja1BGME1yOUh2dVJUaEVhbURtQVpyZnQrL2FM?=
 =?utf-8?B?ZU9pWmZwY2NBWTNrM000S3pzWHVtYkQwZUhNdWtmdVlsTmdjM3l6cTNJNElz?=
 =?utf-8?B?dVJTdmNoOHIzRk9pajJwa2g4UzhiOUFBaGNHRW15ZTlVVmNBcXZocGRHVXVk?=
 =?utf-8?B?Z3NlQisxbnV4UXZ0RDBCby9EUCtKZHIycDd4Nk1XaFM4Si93NG5LUT09?=
X-Exchange-RoutingPolicyChecked: K1tGxeaxGplzHJt52TLPFuLjb/NILHUvM09m++aW4OaZgQIBqp0CjzumTNADc+CPSjG/KqFD1H4yeTRn2NiHiPQkQWtbywjfPokxGwbIBgzPA0WkOup4HA1jsg4oPnnjZav4UQU/iZwOOxTCrRpeLzdv+HrJycC9SPImpyifkOav3fnnS2/bcwBmvHjLCzStKDT9weAiFzGWgPBVBaW3DDKlN/XNQIOR8hOwfIdV4BDGaHfmmy97AYUMg8UQ71yDfAKYySefR3yhr9Nn5vNIFYi6LbfkS8IESa/pMsZgBh6QZj5jBfQ4a5WakoUHnuouvfnwtY1bJCTqPRn0wnAK4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff1818a-83b7-41ee-09d1-08df09c3775f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:58:43.8073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gidg97ENKshjs7+8kW9kNB72r6ksECU12vN4NthPjanAULx3uxifX3Pthxp0KxnD3eoz13qjeCFRyxO50aSFNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB620494
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

Hi Raag

On 13-08-2026 13:35, Raag Jadav wrote:
> Introduce error threshold test as part of xe_ras. This will serve as a
> foundation for all RAS related tests moving forward.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   include/drm-uapi/drm_ras.h |  53 ++++++++
>   meson.build                |   3 +
>   tests/intel/xe_ras.c       | 242 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   2 +
>   4 files changed, 300 insertions(+)
>   create mode 100644 include/drm-uapi/drm_ras.h
>   create mode 100644 tests/intel/xe_ras.c
>
> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
> new file mode 100644
> index 000000000..27c689564
> --- /dev/null
> +++ b/include/drm-uapi/drm_ras.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN uapi header */
> +/* To regenerate run: tools/net/ynl/ynl-regen.sh */
> +
> +#ifndef _UAPI_LINUX_DRM_RAS_H
> +#define _UAPI_LINUX_DRM_RAS_H
> +
> +#define DRM_RAS_FAMILY_NAME	"drm-ras"
> +#define DRM_RAS_FAMILY_VERSION	1
> +
> +/*
> + * Type of the node. Currently, only error-counter nodes are supported, which
> + * expose reliability counters for a hardware/software component.
> + */
> +enum drm_ras_node_type {
> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
> +};
> +
> +enum {
> +	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> +
> +	__DRM_RAS_A_NODE_ATTRS_MAX,
> +	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
> +
> +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_CMD_LIST_NODES = 1,
> +	DRM_RAS_CMD_GET_ERROR_COUNTER,
> +	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
> +	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
> +	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
> +
> +	__DRM_RAS_CMD_MAX,
> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
> +};
> +
> +#endif /* _UAPI_LINUX_DRM_RAS_H */

This should be split into a seperate patch and should either be 
generated using ynl tool
or copied from kernel directly.

> diff --git a/meson.build b/meson.build
> index 980fb6421..5ef0b4edf 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -153,6 +153,9 @@ libpci = dependency('libpci', required : true)
>   libudev = dependency('libudev', required : true)
>   glib = dependency('glib-2.0', required : true)
>   
> +libnl = dependency('libnl-3.0', required: true)
> +libnl_genl = dependency('libnl-genl-3.0', required: true)
> +
>   libtsi = cc.find_library('TSI', required : false)
>   
>   if libtsi.found()
> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
> new file mode 100644
> index 000000000..91f624d9f
> --- /dev/null
> +++ b/tests/intel/xe_ras.c
> @@ -0,0 +1,242 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: Check Reliability Availability Serviceability
> + * Category: Core
> + * Mega feature: RAS
> + * Sub-category: Error handling tests
> + * Test category: functionality test
> + */
> +
> +#include <limits.h>
> +#include <netlink/socket.h>
> +#include <netlink/genl/ctrl.h>
> +#include <netlink/genl/genl.h>
> +
> +#include "igt.h"
> +#include "lib/igt_device.h"
> +#include "lib/igt_sysfs.h"
> +
> +#include "xe_drm.h"
> +#include "drm_ras.h"
> +
> +static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
> +
> +typedef struct {
> +	int fd_xe;
> +	int sysfs_fd;
> +	struct pci_device *pci_xe;
> +	struct nl_sock *sock;
> +	struct nl_cb *cb;
> +	int family_id;
> +	uint32_t node_id;
> +	uint32_t error_id;
> +	uint32_t threshold;
> +} xe_ras_t;
> +
> +static void init_ras_ctx(xe_ras_t *ctx)
> +{
> +	int ret;
> +
> +	ctx->fd_xe = drm_open_driver(DRIVER_XE);
> +	ctx->sysfs_fd = igt_sysfs_open(ctx->fd_xe);
> +	ctx->pci_xe = igt_device_get_pci_device(ctx->fd_xe);
> +
> +	ctx->sock = nl_socket_alloc();
> +	igt_assert_f(ctx->sock, "Failed to allocate nl_sock");
> +
> +	ret = genl_connect(ctx->sock);
> +	igt_assert_f(!ret, "Failed to connect nl_sock: %s\n", nl_geterror(ret));
> +
> +	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
> +	igt_require_f(ctx->family_id >= 0, "drm-ras family not found\n");
> +}
> +
> +static void cleanup_ras_ctx(xe_ras_t *ctx)
> +{
> +	nl_close(ctx->sock);
> +	nl_socket_free(ctx->sock);
> +
> +	close(ctx->sysfs_fd);
> +	drm_close_driver(ctx->fd_xe);
> +}
> +
> +static uint32_t nlattr_max(uint32_t cmd)
> +{
> +	if (cmd == DRM_RAS_CMD_LIST_NODES)
> +		return DRM_RAS_A_NODE_ATTRS_MAX;
> +	else
> +		return DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX;
> +}
> +
> +static int nl_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct genlmsghdr *gnlh = nlmsg_data(nlh);
> +	struct nlattr *attrs[UCHAR_MAX];
> +	int ret, cmd = gnlh->cmd;
> +	xe_ras_t *ctx = arg;
> +
> +	ret = genlmsg_parse(nlh, 0, attrs, nlattr_max(cmd), NULL);
> +	if (ret) {
> +		igt_warn("Failed to parse nl msg: %s\n", nl_geterror(ret));
> +		return NL_SKIP;
> +	}
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_LIST_NODES: {
> +		char *device_name, *node_name, pci_name[UCHAR_MAX];
> +		struct pci_device *pci = ctx->pci_xe;
> +
> +		if (!attrs[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME]) {
> +			igt_warn("Device name attribute not found\n");
> +			return NL_SKIP;
> +		}
> +
> +		if (!attrs[DRM_RAS_A_NODE_ATTRS_NODE_NAME]) {
> +			igt_warn("Node name attribute not found\n");
> +			return NL_SKIP;
> +		}
> +
> +		if (!attrs[DRM_RAS_A_NODE_ATTRS_NODE_ID]) {
> +			igt_warn("Node id attribute not found\n");
> +			return NL_SKIP;
> +		}
> +
> +		device_name = nla_get_string(attrs[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME]);
> +		node_name = nla_get_string(attrs[DRM_RAS_A_NODE_ATTRS_NODE_NAME]);
> +
> +		snprintf(pci_name, UCHAR_MAX, "%04x:%02x:%02x.%01x",
> +			 pci->domain, pci->bus, pci->dev, pci->func);
> +
> +		if (strcmp(node_name, error_severity[DRM_XE_RAS_ERR_SEV_CORRECTABLE]) ||
> +		    strcmp(device_name, pci_name))
> +			return NL_SKIP;
> +
> +		ctx->node_id = nla_get_u32(attrs[DRM_RAS_A_NODE_ATTRS_NODE_ID]);
> +		return NL_OK;
> +	}
> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> +		return NL_OK;
> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]) {
> +			igt_warn("Error threshold attribute not found\n");
> +			return NL_SKIP;
> +		}
> +
> +		ctx->threshold = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
> +		return NL_OK;
> +	default:
> +		return NL_SKIP;
> +	}
> +}

We should have this part of lib so other tests can re-use.

> +
> +static void prepare_nl_msg(xe_ras_t *ctx, struct nl_msg *msg, uint32_t cmd)
> +{
> +	int ret;
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_LIST_NODES:
> +		break;
> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> +		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD, ctx->threshold);
> +		igt_assert_f(!ret, "Failed to put error threshold: %s\n", nl_geterror(ret));
> +		/* fallthrough */
> +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
> +		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID, ctx->node_id);
> +		igt_assert_f(!ret, "Failed to put node id: %s\n", nl_geterror(ret));
> +
> +		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID, ctx->error_id);
> +		igt_assert_f(!ret, "Failed to put error id: %s\n", nl_geterror(ret));
> +		break;
> +	default:
> +		igt_assert_f(0, "Invalid command: %u\n", cmd);
> +	}
> +}
> +
> +static uint32_t nlmsg_flags(uint32_t cmd)
> +{
> +	uint32_t flags = NLM_F_REQUEST | NLM_F_ACK;
> +
> +	if (cmd == DRM_RAS_CMD_LIST_NODES)
> +		flags |= NLM_F_DUMP;
> +
> +	return flags;
> +}
> +
> +static void test_cmd(xe_ras_t *ctx, uint32_t cmd)
> +{
> +	struct nl_msg *msg;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	igt_assert_f(msg, "Failed to allocate nl_msg\n");
> +
> +	msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx->family_id, 0,
> +			       nlmsg_flags(cmd), cmd, DRM_RAS_FAMILY_VERSION);
> +	igt_require_f(msg_head, "Failed to add nl msg header\n");
> +
> +	prepare_nl_msg(ctx, msg, cmd);
> +
> +	ret = nl_socket_modify_cb(ctx->sock, NL_CB_VALID, NL_CB_CUSTOM, nl_cb, ctx);
> +	igt_assert_f(!ret, "Failed to modify cb: %s\n", nl_geterror(ret));
> +
> +	ret = nl_send_auto(ctx->sock, msg);
> +	igt_assert_f(ret > 0, "Failed to send nl msg: %s\n", nl_geterror(ret));
> +
> +	ret = nl_recvmsgs_default(ctx->sock);
> +	igt_assert_f(!ret, "Failed to receive nl msg: %s\n", nl_geterror(ret));
> +
> +	nlmsg_free(msg);
> +}
> +
> +/**
> + * SUBTEST: error-threshold
> + * Description: test get/set error threshold of the counter
> + * Functionality: RAS
> + * GPU requirements: DRM RAS feature should be supported
> + */
> +static void test_error_threshold(xe_ras_t *ctx)
> +{
> +	ctx->node_id = UINT_MAX;
> +
> +	test_cmd(ctx, DRM_RAS_CMD_LIST_NODES);
> +
> +	/* drm_ras is missing */
> +	igt_skip_on(ctx->node_id == UINT_MAX);
> +	igt_info("node id: %d\n", ctx->node_id);
> +
> +	ctx->error_id = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE;
> +	igt_info("error id: %d\n", ctx->error_id);
> +
> +	test_cmd(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
> +	igt_info("get error threshold: %u\n", ctx->threshold);
> +
> +	test_cmd(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
> +	igt_info("set error threshold: %u\n", ctx->threshold);
> +}
> +
> +int igt_main()
> +{
> +	xe_ras_t ctx;
> +
> +	igt_fixture() {
> +		memset(&ctx, 0, sizeof(ctx));
> +		init_ras_ctx(&ctx);
> +
> +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +		update_debug_mask_if_ci(DRM_UT_KMS);
> +	}
> +
> +	igt_subtest_f("error-threshold") {
> +		test_error_threshold(&ctx);

We are only checking if commands are supported here..
Why not set a threshold and check if we get the same back?
Is it planned as a follow up?

Thanks
Riana

> +	}
> +
> +	igt_fixture() {
> +		cleanup_ras_ctx(&ctx);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a62f447df..2ebdc74da 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -333,6 +333,7 @@ intel_xe_progs = [
>   	'xe_prime_self_import',
>   	'xe_pxp',
>   	'xe_query',
> +	'xe_ras',
>   	'xe_render_copy',
>   	'xe_vm',
>   	'xe_userptr_pressure',
> @@ -429,6 +430,7 @@ extra_dependencies = {
>   	'xe_fault_injection': [ lib_igt_xe_oa ],
>   	'xe_oa': [ lib_igt_xe_oa ],
>           'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
> +	'xe_ras': [ libnl, libnl_genl ],
>   }
>   
>   test_executables = []
