Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B018C79F9E
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 05:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2838910E06E;
	Tue,  8 Sep 2026 05:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3AHJ2wh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C725B10E06E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 05:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788846899; x=1820382899;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WWUvKfMvd26GeI16b5g2bvsngzKoneNMIrux8Ctk5g8=;
 b=V3AHJ2whfd8qZ5Ekef1JdBOray/FFLWxhLv6kmwnRpL/VPkQb4cFZO2O
 6tyPv/SWkwait3VTXNko9ebSs8qToQCRUSpoAh9WZKT6GvGwsp+hg2S+g
 7VKqDpDohzVgJQeVe1iBadxTGLbYIXSt/awEuKeaN0PAbVsVjwVie6bGj
 gIjnqhO8CcYb/zOTVecR4XI5YahbczM3jWFIJ+v3Xtx9FnHtgKBBgi7HU
 hEo1X46gR8+OIBVH/mWUE8OrRjEIOA5m26iYwkNyv+Sk3f25lwpzPunRM
 5DVN30gvKwBbDMqbIvgI4DprcQKugMMGsLPg5hJPYoc0P5huby9tLwYOO A==;
X-CSE-ConnectionGUID: nIsSZucmSEu4LZ/2YMoiHQ==
X-CSE-MsgGUID: pmDcJRJ5T/yCo+zrLD2m9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106609908"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106609908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 22:54:59 -0700
X-CSE-ConnectionGUID: 7EJTkc+NQXSTKWqrh5Pldw==
X-CSE-MsgGUID: QuO7KzvfT867zsLW0Lq6yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274672128"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 22:54:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 22:54:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 22:54:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.30)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 22:54:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kf8E9BbA2ybs66B8GlhPMGnBqmItCMM3wCOlzS3c9rGCoJvCOHyedImuvgwvZk0lFMPZZQY4bJnbeDX4hiTXIvnr4DbFCxGFkez9IlIJRR2DkRyg9J/eZ5xhJoj/VPhFQr7XgaD5a11BMt+u4h0jnSpGEyj+UQQ0K7NxeOD6WACgz2mqov7dWM53H4iUcSlrdROq7MvqkiB+lAeKGH2yvguD0HqX6GUzqdMO59/JPP3Cf+klyE5afo7vZTJFZ43ZS9CWO46mNY6GN+J2CshZlGJPPTSVtETXl1n0ufVNAtungtyJlXJol8AOz4uVXVInjlVbYksBK0nBWRgv/G1hOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m89GKQYKvG7FOieqNi2x8lNprJ9zyTO6ij7g11YI0XY=;
 b=mxIHEnPPrKjtllE9WhV7bmbMgVaYRg2Wk9QfP5heWNPnSuAY86secsfwDRhNrNaUqZR/yFg49DkBG3mHzWa8qgkzJmPRtn16YuhoENjff3oUSIEOW8Tkoh3E+Muv0iauK1nb2CVg1wg/wPZEO97KYr2DKFywVVonRTS47IV093PX0JDOnDvsTGQgrQd/8AyInxuyKnmebu2mWjTuHthqlPANe+tIihHcsoykP7u+PorXYQxZ6z6LHcy2PJH0QIut62I6ufFQ1aLe9CZ+g3OEiwr1S1BDJMvW9fA2SuhxRsO/+Jowtje/GRSjmwnIx+8zXFXfJydYVhsDtQflLArffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB8187.namprd11.prod.outlook.com
 (2603:10b6:610:160::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 05:54:51 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 05:54:51 +0000
Message-ID: <c75228a2-bc25-4ed0-8e39-588193e71f9c@intel.com>
Date: Tue, 8 Sep 2026 11:24:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V4] tests/intel/xe_mempage_offline: Add fault-inject based
 page offline tests
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260904125932.822044-2-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904125932.822044-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::8) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: ceffed9f-d2ba-4be9-cdc7-08df0d6db2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ol7BVxqjV9cw0NDBtellsweMQigynZVE+8XpDbiCIT5P1u6DEtGbAwXLgJAuEu9sxFhIFq0rDXZzUKNDqT7Kkygz/4yxeAVnRP5+mzA1do9TMVMddQJzuc6H/AwcXSK667DYPQKOd+f4hoJ7+MC5K7ZVmgXIlFO3pwBvyARQ5FtMMv04/asN8TC6OGywOW/U2sCd4NqK/gkXZWVBzW6orSmSzF3MsPnx3R4BoUwzFlFhqEV9iITLVwyqxACS3bz2wU/8rJCPXWonoRlhNqIhCFS/Klp0XR+4fm1RH++f2rWpYyiwlPjRR7kuw04eGBqzxllpOSEIOVZzLNXbU3PBm2za6uJjHOgDBxgolatYrQ4LiKmvjNwu4zpWkFDgpWgc8uCpoAzo10heaELKBcs6KPwuKZTgl5tsJkPde1/3zvNCqWiT7q1zXX7Qy3n4iMsjfLqnstwv91XgWhVMp/vLhcqdI2g150/3tfkq5jNd7Y0xkpn2MWK3GnTokzoSGFNNiJpYzU+Gid/8oq4Coz4IPlzrtCmDU+AwLVABBVBxTf3P0MpZKFeaAG0L3jNpxciOgeqZi/Htkx0qV/7eVAUarGpNcR9jzGfw3BtYsCOI4IiAT8MYN+2AqqW5dOUQZFu3HgQlmbZuNDIdte0I+iTVuwMHgnwKYJtO4Zz73Dm4pos=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emxLTzFKM1cwc01WVzU4Wit3cDlqeHcwcmlHQkl1SE5hTjRxRFRYZlFFeXhV?=
 =?utf-8?B?d2JTRFpwU0s0cFE4Unp2ZEFpR2JqUkVhWTNVVHpyNjdRSnQyN1RkWElxNXNw?=
 =?utf-8?B?TE9rZmo4TjV1enRzNktEd1BBNnpVVTN2NkF5WGozSVV4bVVvYWVzUHVaK1M2?=
 =?utf-8?B?TVd3Rno5S2pId21UR1NueW1CUkVuZmNBNDFRek9pdi9CZnIrRndXUk10YWdS?=
 =?utf-8?B?aE80YmpyZW9FelN1OC9SbWRxQzlNNVJDZytqSmlBbGNWL2p4em9WRS9oNzJl?=
 =?utf-8?B?aWNac2p4QUpKMVZxVGEvd3ozUEdSUm9PbTh3WEcxbUF2cmwwRVZ5NVhoQ0xr?=
 =?utf-8?B?ckFqcW9TOHRoY0Rkam50YTcwRGc0L2pzbkpQRTZZYmR5elFyd1FsTEdCdlli?=
 =?utf-8?B?Mzk0R1RKMHBGaWgxUFZKeVZWdnpkdXRNc0NnekFpbnh6ZlBFczVuUmVWb2xt?=
 =?utf-8?B?QmxlRmh1Vk04YW9ES2crQlJ1TXFhS0NrRDVtSXpkZ1NCR0RiWEJ5TEhSRjdX?=
 =?utf-8?B?a2M0aTRVNTM0WkI1VnkzbXpqbXY4QTR0M0FsREc5eWVjL1lLSVRSRHFIRmtM?=
 =?utf-8?B?V3h4SmUrcE1uWFQ4MlBqR0R0MHo5VVdUdmt4S29XaDlFM2l5bC9XMnFGSFZy?=
 =?utf-8?B?clM5SUtoOTVTMDErdU9SRW9YZ1RWUG4rTFp2dndlUkFMYWRubXNjVU4rdThr?=
 =?utf-8?B?bUR2eGNQaVpIR3pmNTVEUVdvejA1ZTFRR1g5OGNkSkR5MTJXKzFrKzEzSlNP?=
 =?utf-8?B?eExJNTlkeG0wL0dRVUoyUGFlMENXNU12VEpTYTdVb3pjS2Zuc3Jzb2JIaTJp?=
 =?utf-8?B?Sk1qNmRJbTY1OFBpQ0tQeU81N0VGckczeXB0K28vdEE1KzUvOG91RDE3VHlT?=
 =?utf-8?B?L1NyUC9KVjdvL2JHRHZacWdVUlhhcmRkKzNQL0RaOUk3RzR3OEN1eW45STJz?=
 =?utf-8?B?OHA5VXo0R2VLZDZzeTlqNElWc0x6RldrNVFUWnBFaWtwempGRjN0Y3A1UHZ0?=
 =?utf-8?B?NWpDdTdzOWxXUkEwMUJHaXNvY3pBZ3V6QTloQkU1UFNCZFp2a3BwL3RINXpH?=
 =?utf-8?B?aVppNnc2MFMzTk9UM2xFYmhRcjhyMjJtSDk5ZzdpaFJzWldGS0x4eThXcE5u?=
 =?utf-8?B?MHVHWTNBb0p0aXgvQVhqT1VGbWQ1K2pyd0VITXpDZ2ZKWUI4bnhsakZQMC9y?=
 =?utf-8?B?NlhMa29sb1dmMVhRMDd5eTMyWHloU3FBSGtPWDFmQ3F1bUNNb0JqQ3E2WDdC?=
 =?utf-8?B?RWFIRVZyRU5XdENCTkZZbWlXRHdJdUh2eFBJWE1LNWRaSFhHaU4vUS9xMVov?=
 =?utf-8?B?QTBqYkJlVTJxUGd3aWphdHp6N0U3SWVwMHpUZUEySXdTdkF2NmlndUE5WUxt?=
 =?utf-8?B?UDhydUNDUlhtMmx1NENUdVhWNzhiOHN6aXJiSzFmY2V6RHhIZ09ZeEc4NS9x?=
 =?utf-8?B?U2pYaVh3b1kzQ0JFdnNDR1hCd2VWajNmYnZ5THFmY21qb0tDd1QwRWovU2tS?=
 =?utf-8?B?SWt0dXRCWmFlRDBmWmZrekc3M1lXcTVjeWs2bHBXcFc2SEkxb0p5QmNreFVm?=
 =?utf-8?B?WlAzQmVYU3FtaUU5bkhUM2s5SmtTVUZjTHpYbXR0elBUK1didEl6Y1l6V082?=
 =?utf-8?B?NFMzTit0a1hPVGV4c1l0alhqMTRPU3dLS0ZxMFN1RzNFTFFDa3RWc3JjcVFC?=
 =?utf-8?B?MFpMSVMvZGoxeEhUNW8vYnZjMlYxb2R1YjFwc05EaEdOZE1uY3o3YmJrVExj?=
 =?utf-8?B?ZWxTVWZ4aTVSRnFwU1RVNGVNOEM0YmVXUkFRYnZHVW51NldoWVhGYUtJL1ZY?=
 =?utf-8?B?S1JwQVVXbWx4cXNaZ2FNQTQ5WkF6REZQY2RKTHowTytLanVhWWI3eXFHVWNr?=
 =?utf-8?B?dWZZOU5XMDZOSDdCcng4REkvVi9HKzBwcDljK0duSFZSVFdEUVlIZVhNd3Fy?=
 =?utf-8?B?b2FuVDRSRW10cDZJYmVGdmg5SkhvZ3JiTFczb3pLYlREN21YS1lLUWM1clBN?=
 =?utf-8?B?RGpTZTZTd2FUanpWYjZvM3JEMGJwSGNDQXV4enNGdDhuZ0FicnU0Z3hzVkxi?=
 =?utf-8?B?WUFlNDd1ZlR2OUZEN0JzdnhucGFQdlpXcU5RN01MbTJVRFlEZ0pFYnV6eGoy?=
 =?utf-8?B?YU1BeHkra1NXUVA5QmlqUWNUUFprdENsUjZvNEZQZ2s1RVpIU3hJZVEydG1x?=
 =?utf-8?B?RkhpakY2UFNnRTZXUENZSjZPREthU2FoYk1lZlRJL29nb3FTekhJeUcrLytL?=
 =?utf-8?B?c3RkR0dEaXlrOGo3RmlwUVZhbGRRM0ZYZ1NIREtPZmdxZFlINkdFRS9aL2Fk?=
 =?utf-8?B?RTN2NmFKN256VW10ZFE1WW4yczNhQ1Z1UHBSQXVuSXhxbklWcTJXWkxDMzQ2?=
 =?utf-8?Q?gQBYDFDjD0Me2K+/No9ER0gN/Vp8o55S9i1fU?=
X-Exchange-RoutingPolicyChecked: ni6k9mmD8YHHP4FNN5QS1hbTUuMXUeWa3f8cS55UJSYdReIQ+waeo+NGPfXHKGriouXnCB7OFCkOBjxXPYLFE7NuhQgSa49sFQVwnTHNAeU/OwZzAQl2b3g8S+pvXai723G8iJXjCdxIANc2P6qnAwqvvA4sTdmHATADR0DdhvfYjKGtA/bECGpZEDudotKpBSqw6CbRfNrixqNMWVlRpNMZ77HlZB68efeAdNpjQjcC2oMv3sP0SJ2pg+ci83YfmzcimYjoGTcrH9PNBcnZuwvbBPsjWAtAGglL9ZF7rYW5N130NBWlJa/sNacGp/LPXuuyfUz6I+9TTwqskBqvtw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ceffed9f-d2ba-4be9-cdc7-08df0d6db2b1
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 05:54:51.4506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxEszsdQOfGtXUhbCJ0eHFQFt6gEHtWKr2WA0sUiPCcZqDsvHGUhwUn3VzOqBDuRCg60mBDdrqGHITpXjl3MxNKhdGv7pRA1sPuWLDD/PTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
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



On 04-09-2026 18:29, Tejas Upadhyay wrote:
> Add IGT tests for VRAM page offlining using the kernel's fault-inject
> infrastructure (inject_mempage_offline). Tests exercise:
> 
> - inject-single-page: Inject one fault via auto-pick ("0"), verify
>    page appears in vram_bad_pages sysfs with 'R' (reserved) flag
> - inject-duplicate-page: Re-inject the same PFN, verify soft→hard
>    promotion returns -EEXIST and page count stays unchanged
> 
> The trigger file (inject_mempage_offline_trigger) accepts:
> - "0"      : auto-pick last unallocated VRAM page
> - "0xPFN"  : inject fault at a specific PFN address
> 
> Requires CRI platform with CONFIG_FAULT_INJECTION enabled.
> 
> v4(Himal):
> - Run test only if CONFIG_FAULT_INJECTION_DEBUG_FS is y
> v3(Himal):
> - Unload/reload driver post test suite run
> v2:
> - KMD moved from sysfs to debugfs, align with it

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   tests/intel/xe_mempage_offline.c | 197 +++++++++++++++++++++++++++++++
>   tests/meson.build                |   1 +
>   2 files changed, 198 insertions(+)
>   create mode 100644 tests/intel/xe_mempage_offline.c
> 
> diff --git a/tests/intel/xe_mempage_offline.c b/tests/intel/xe_mempage_offline.c
> new file mode 100644
> index 000000000..f1f7765b1
> --- /dev/null
> +++ b/tests/intel/xe_mempage_offline.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: VRAM page offline injection and verification
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: RAS
> + * Functionality: memory page offline
> + * Test category: functionality test
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_debugfs.h"
> +#include "igt_device.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe/xe_query.h"
> +
> +#define FAULT_INJECT_DIR	"inject_mempage_offline"
> +#define TRIGGER_FILE		"inject_mempage_offline_trigger"
> +#define VRAM_BAD_PAGES		"vram_bad_pages"
> +
> +static int count_bad_pages(int fd)
> +{
> +	char buf[4096];
> +	int count = 0;
> +	char *line;
> +
> +	/* Read file into buf. It automatically null-terminates inside. */
> +	__igt_debugfs_read(fd, VRAM_BAD_PAGES, buf, sizeof(buf));
> +
> +	/* Check if the buffer is empty or could not be read */
> +	if (buf[0] == '\0')
> +		return 0;
> +
> +	/* Each entry line has format: "0x%08x : 0x%08x : %c\n" */
> +	line = buf;
> +	while ((line = strchr(line, '\n')) != NULL) {
> +		count++;
> +		line++;
> +	}
> +
> +	/* Subtract the header line (max_pages : XXXX) */
> +	if (count > 0)
> +		count--;
> +
> +	return count;
> +}
> +
> +static bool bad_page_has_flag(int fd, char flag)
> +{
> +	char buf[4096];
> +	char *p;
> +
> +	__igt_debugfs_read(fd, VRAM_BAD_PAGES, buf, sizeof(buf));
> +
> +	if (buf[0] == '\0')
> +		return false;
> +
> +	/* Look for the flag character after last ':' on entry lines */
> +	p = buf;
> +	while ((p = strstr(p, " : ")) != NULL) {
> +		p += 3;
> +		if (*p == flag)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static uint64_t get_last_bad_page_pfn(int fd)
> +{
> +	char buf[4096];
> +	char *line, *last_entry = NULL;
> +	uint64_t pfn = 0;
> +
> +	__igt_debugfs_read(fd, VRAM_BAD_PAGES, buf, sizeof(buf));
> +
> +	if (buf[0] == '\0')
> +		return 0;
> +
> +	/* Find last entry line (format: "0x%08llx : 0x%08llx : %c\n") */
> +	line = buf;
> +	while (*line) {
> +		if (line[0] == '0' && line[1] == 'x')
> +			last_entry = line;
> +		line = strchr(line, '\n');
> +		if (!line)
> +			break;
> +		line++;
> +	}
> +
> +	if (last_entry)
> +		sscanf(last_entry, "0x%lx", &pfn);
> +
> +	return pfn;
> +}
> +
> +static void inject_fault(int fd)
> +{
> +	igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "100");
> +	igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "1");
> +	igt_debugfs_write(fd, FAULT_INJECT_DIR "/verbose", "1");
> +	__igt_debugfs_write(fd, TRIGGER_FILE, "0", 1);
> +}
> +
> +/**
> + * SUBTEST: inject-single-page
> + * Description: Inject a single VRAM page fault and verify it appears in vram_bad_pages
> + */
> +
> +/**
> + * SUBTEST: inject-duplicate-page
> + * Description: Inject two pages and verify both appear in vram_bad_pages
> + */
> +
> +int igt_main()
> +{
> +	int fd;
> +	uint16_t devid;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_assert(fd >= 0);
> +		devid = intel_get_drm_devid(fd);
> +		igt_require(intel_get_device_info(devid)->is_crescentisland);
> +		igt_require(igt_debugfs_exists(fd,
> +					       FAULT_INJECT_DIR "/probability",
> +					       O_WRONLY));
> +		igt_require(igt_debugfs_exists(fd, VRAM_BAD_PAGES, O_RDONLY));
> +		igt_require(igt_debugfs_exists(fd, TRIGGER_FILE, O_WRONLY));
> +	}
> +
> +	igt_subtest("inject-single-page") {
> +		int initial_count, after_count;
> +
> +		initial_count = count_bad_pages(fd);
> +		inject_fault(fd);
> +		after_count = count_bad_pages(fd);
> +		igt_assert_eq(after_count, initial_count + 1);
> +		igt_assert(bad_page_has_flag(fd, 'R'));
> +	}
> +
> +	igt_subtest("inject-duplicate-page") {
> +		int initial_count, after_count;
> +		uint64_t pfn;
> +		char pfn_str[32];
> +		int debugfs_fd, ret;
> +
> +		initial_count = count_bad_pages(fd);
> +
> +		/* First injection — auto-pick unallocated page */
> +		inject_fault(fd);
> +		after_count = count_bad_pages(fd);
> +		igt_assert_eq(after_count, initial_count + 1);
> +
> +		/* Get PFN of the page just injected */
> +		pfn = get_last_bad_page_pfn(fd);
> +		igt_assert(pfn != 0);
> +
> +		/* Reset / override the allowed fault count to 2 (or more) */
> +		if (igt_debugfs_exists(fd, FAULT_INJECT_DIR "/times", O_WRONLY)) {
> +			igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "2");
> +		}
> +		/*
> +		 * Re-inject same PFN — should return -EEXIST (soft→hard
> +		 * promotion). Write to trigger with the PFN value.
> +		 */
> +		snprintf(pfn_str, sizeof(pfn_str), "0x%lx", pfn);
> +		debugfs_fd = igt_debugfs_open(fd, TRIGGER_FILE, O_WRONLY);
> +		igt_assert(debugfs_fd >= 0);
> +		ret = write(debugfs_fd, pfn_str, strlen(pfn_str));
> +		igt_assert(ret < 0 && errno == EEXIST);
> +		close(debugfs_fd);
> +
> +		/* Count should not change — same page, not a new one */
> +		after_count = count_bad_pages(fd);
> +		igt_assert_eq(after_count, initial_count + 1);
> +	}
> +
> +	igt_fixture() {
> +		igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "0");
> +		drm_close_driver(fd);
> +		igt_xe_driver_unload();
> +		igt_assert_eq(igt_xe_driver_load(NULL), 0);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..c7c614e7c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -318,6 +318,7 @@ intel_xe_progs = [
>   	'xe_live_ktest',
>   	'xe_madvise',
>   	'xe_media_fill',
> +        'xe_mempage_offline',
>   	'xe_mmap',
>           'xe_module_load',
>           'xe_multigpu_svm',

