Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03F4C624A4
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 16:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D15810F619;
	Thu,  3 Sep 2026 16:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUDSIYEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672DE10F619
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788453917; x=1819989917;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IVZWgYT5yVyAXPxbps0ljh/KhEm6T7r/5KHV4qsnhUQ=;
 b=fUDSIYEZ+zOaIpIgwGfsfky3sIz8+DpG6TVxitRgNf1hojsAnggJ8d34
 dgF78tlsT6UjNz4E4X9CUXYuhwIwCXOY3Ma1dwAviGKtnUyOlw4XqQ1Ss
 q4JjmbXNOUnSFk8DKCk4yioXxXkh6a1OF41EWT/FuvNNwJyPtR9AYidN2
 rNmpWaN0GqmW64GFU4O64i+t1gu37vdwns1H6pWsuMIXPy0ASoGucdcQo
 q6oyxozAwPNSJRvNTV1410Cr7x3dU2cbAsZK8NGBRY6vpoQ+6hU332xYb
 /rzdpXXJMsO1kbQk5OyiXVgD5a9Db8fTzFGei2v1S5zk3zd1TycVoM5Vt g==;
X-CSE-ConnectionGUID: rpOtb0GQSDCklQtUemIn6Q==
X-CSE-MsgGUID: BPDIWGbxTjCFfEEepxHcTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87883114"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="87883114"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:45:17 -0700
X-CSE-ConnectionGUID: nFLdtGvrSXaIREhOKTW/8A==
X-CSE-MsgGUID: BBuPPV+DRv+CJhaP4Xuo8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="266538654"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:45:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:45:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 09:45:16 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:45:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQWjhPCWzBA1E1xqgtWwcltRQMlZcHAEJ8NSxR65HSqFmHgcWALGPYlZQ46xTaeHFYPtYOovh72u/q22AIO+mTRMZh4rlC6lnLk/KXgt1l0TCoHQzKnVTF02IDFKFkUOKfzuAWjO8hb/ePqhuQorqoImmLN0xDM1/LaXZu9++i5hMShECnlCiS5TCZDC4F1j0OlNhEVlwQxGuSFOXDbelsqysGi2HRJrIqWF89P7x3Kuf4OzO8eXZqckXjoKdvzXVglfz/b1o4X5uA9uT5TXq9AZV5f9b2N4u0fXGALF1KzET34w6k7bv6Y4OknI96rUHaBUa09VAxjFH3oNo7nztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjJNzQZDVGpI8OzR5GngJsfRkYegTjb4TOKCKE3+HIc=;
 b=rqxqUuXN3gMgIwg/aLdmM2w1OitCVSeJQsCykIoYK9nx/sSxdgXkB9tw0vqN5BYkGJu35d4prASk8GppA5NwOVBklWVnpqbUDjiP5aDmKvltTzktwZJxkoNjE723C0KYrvBhE4y0UdmCxVn+6dD8Ug5EP0ePbSoaAcDikfm2docUWcjETEUHFJ4BgxhJ7oxUXFlFwm82IyFKx1Xdqtlp7Qd9+/ucbFHZi2aeIvu/ex39Aczq59A8PL1jPlmClbQiFRnMxILBLAA7vRXz+tXhsMd8UTXJ1ELrON3B7VDW1weGsaO4ODlD4NPj4iQGKXM9AZ4bLzdA8Mn/bdMSObDHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by PH3PPF4EB9556A6.namprd11.prod.outlook.com (2603:10b6:518:1::d1f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 16:45:13 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:45:13 +0000
Message-ID: <33037b1d-95a4-4eaa-b64b-c7169e0c1fb0@intel.com>
Date: Thu, 3 Sep 2026 22:15:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0196.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::10) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|PH3PPF4EB9556A6:EE_
X-MS-Office365-Filtering-Correlation-Id: 71026762-26bb-4fd2-d0ec-08df09dab986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|6133799003|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UnYjTNGwkVgmqOn6t94oC067fdyB+xyHYU33uc2SG08gzNgEFI4s29V7EHBrShBFLaTxnMK5UZJvvt6AW+BDrJ0qnaKgzPBhPij6rM9INUmFTtwUG4d8/wWF0klaMfIa7g2tOh0yDhkBM/bkmu5Md4qYHt38b2F2mnHc/EsOF1lCiG/yIsz8/Z4Bxzs9+gSiwBzRFFQwF96ftzCd6hIpmBVumPlJmuGqbxxfbeP7cCIpQ/GygIoW0HCr8N8gNIHfo+FezjVZDvAa0KoHKV3syVJD1QEasPT2KNKxtsMFmgW/W5zag0c31v4xHzgmIKtjbT+Ii08ueKzxnQTbQhL7KPvmozvueWOpDHXitl+AgcV95maKe3TdveD/MWUY9mkOwLEeM1/vxOnYVd59MLEbqSF3LNEPckkIYNJp/4EOlI5AzbWo1V2rkNqjc8g8tucoOJQ/bpmQtNUsXn1MUXZdKQgQYEAThCYSFF0w771uGkQTdn0QKEotiePPP2Iim66oEGfJoGwr9XMbNrsO3GLarOO9m7S/A1J+FjIhYyWlo1MjFYfzLe/fDergGERInY5z03wh9MjJakqt8m507laFHLG9TwjqHnlevTS0L3QzuWdRbEsxXsS6gudJq1A40xD9quYVo5IzT4vkc5AGIs5otV4GBBpNkgS+fCR/2yBk+iQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(6133799003)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bExNeUhadTJkdkl5c1J5aEh5M1EwdHZ3KzVqc21uNGc0ZXJDWEg1MFk4KzE1?=
 =?utf-8?B?UzFFRGR1UVBIYmd2bjJMZDY0UmNEbk1KNS9yUWQxeGN4MXZac09ycmdLOUNL?=
 =?utf-8?B?OE1ycnB1UXdxaWFuMmxnOGdBQ2dlOVhwU2t2NXVhUHJwV2ExM2lldEhVUEM4?=
 =?utf-8?B?Vm1pYTNjSEQvdFFrYmRrWlk2S0o0WGwxU3dYdHIySkRqZk9SU2lvRW1tVlZy?=
 =?utf-8?B?aVlZTXVTaUl0MWtRc0lXMmpxR2ZralFzWmJQaVJTVnk2eEVCNWd6NmtYR3Fv?=
 =?utf-8?B?UFBibFY0RytnbTdVcVdUc3JqZWJOb1JQc1NmVFlwby8wWnRFZWEzb0k3Um12?=
 =?utf-8?B?R2dud0wvYVB1ZmtqTTNZUGhpeW15VzlLK1Z1S3RqcjhET1dyNWNqNjMwN2ln?=
 =?utf-8?B?SUJpc2tYd0RBaCtKQ215c29QVjFmekRiQWU3c0NqTmRLMllnUExJWTQ0YXIw?=
 =?utf-8?B?SzhLbGJkZG95enNwVGFPU3E1WXdVd1JRRmVyOW9jSyttc1IzM2ZOYndsT1VE?=
 =?utf-8?B?cnhjSnBVTmp6WS83a3dMRFNwUGVNalVsQTEwN3lpY09VaEp6c01zMWJLZi91?=
 =?utf-8?B?cCtkK1VMTTgvalNUWFd3dHZyWHNNSFMyMSt6THZSNzRkdkpockl1NGZnc0Rn?=
 =?utf-8?B?M3dLTVVhbUF6QjRyemwrRlJDMUhPZjhFZFdzTXlzNVhnN1VHek92NnpCQ2FU?=
 =?utf-8?B?K0RKUzQrYlhSTTNyZGFSeVV5MEw3SDJCQnY0OFJnSEVSR1FWRGNSdzBoWHEz?=
 =?utf-8?B?TlZab0xEdHNRZHZnZ3pzcDd2Z2VuY2RSdlNoOUluc0U1WXRwdktMSWFxVFow?=
 =?utf-8?B?aTBDQklMSjBpQVdYNEhqaWZocTRCcFBaNTkyczNRVXNxb0NKajMwVnM2dFZI?=
 =?utf-8?B?Ymx5KzJrK05UYlVIcDgrdFI4MEd5UXhrQTF3YjdMVXcxQUtFOVBNdGp2RGVh?=
 =?utf-8?B?OVdiTlN5Y1B1OFMwVFBEN2FyQTFBNmkxQ3FsTnNUK2IwU0VsS3MxLzBmOUZk?=
 =?utf-8?B?SHdNbUg4Um5ZbW13aWVaRm9OcnpOeklBRmp6OXFSK0pCRExlanVXZHBDbzdL?=
 =?utf-8?B?Y3FpRjJ1S3hydnBpWGFZVW50emkyRmxxTCtBeW9icGdiR0tLU21kQXRyZnls?=
 =?utf-8?B?a1NNbDhaOXZRdjM2WHAyL0ZFTVhLS05qMTlEMEM0UDdFV2xIaFYxUEV3VW8z?=
 =?utf-8?B?b0tJZmhQcTYvekZKcVZCd0JqMklZZW1aaS9Od2lEWU1PTTBVTkppc2FWd25k?=
 =?utf-8?B?QldzTllYSDAyM2JwODUxeEw1emF1UXBMZVYwb2hFT0l5VzU4U2hyVWRndk9y?=
 =?utf-8?B?UXRmUkxOeml3NzNkMDV0cHBlV0lZbjROTmhzWjJYakN5UzVTU3VWWjdjOFRv?=
 =?utf-8?B?YlRsUjh4SGFYVVEyZEtnamVoR3Z0SHU0OGU5NGpoblhqY2IxcFFWMmkrcFRP?=
 =?utf-8?B?WWZBWUVzRmpaQytNRmJrZDVvQ1RpNVR3VFlFU2pweWMzbms5eFdDMkVES01J?=
 =?utf-8?B?Q1JXUzQzRWZMOTBPY3lwOHdwOHFnbUswYk9xcFEyNjgrMHkyalJLeFpXVk5w?=
 =?utf-8?B?eUthOGZ4M2RvSDlUNllzQkZIOWw4SW94MVBxUHErMzVoaXZXcmFITlhKSHA3?=
 =?utf-8?B?cko0WThna01SOG1lcnJaKzA2NmU3eUVkaTU4WWdZcmNTTWVxYjlQYkpWNlFr?=
 =?utf-8?B?dzJoTUx0VHppRW0zTnBiVGdqQjg2c2NrNnEweFJKRCtlT3BGRGNIZVlISXNl?=
 =?utf-8?B?WUFxVXFPbnZPQUxxbENYOWNRT3dHY0RaRlp6dDVMaXpUeFBtNHJwUE10QTdw?=
 =?utf-8?B?cHFSL1F3ZEZwdXVNQ2pJaE0zblBHMDdxNGJwbGNtY252ODVSNVVjVmJia0Rl?=
 =?utf-8?B?YjVlVUN4M0hwVWpjaVo5L3J1Ukl6VTV3RnQvZG9uK2tOUFY1bzJKaU1ZMWlN?=
 =?utf-8?B?eG9DZHV4UlljS0hjU1hDWUg3aE5kWnY2eVFOL0pURDd5SGtYSU5PdWVpMTlk?=
 =?utf-8?B?S1RIcUo2NEZaaDgvM09oVzQ0S2JJcG81end0ZHp4d3VyYWpNSjBxeGVaSFZI?=
 =?utf-8?B?S1NiYlVrdHJQOEtjVFBJbjlSTEEwS0hCaUNxa3M2RHRTZjJBdFFlbDY4RTJP?=
 =?utf-8?B?dnBYYU5NdjloZERwOFBOQ0pQK3ZxODVhUDVHdlpCWFNpOU9DZnRjM2lFUDFE?=
 =?utf-8?B?WCtYTC9hbU41WHJXdXV6T0ZjU0J2bTRFd1F0NVdMaXo2ZDRIZzJmb090bFhy?=
 =?utf-8?B?UGJBQzJvT1h2eTNnSko3V09QYzBKNm9LUW95Q3JZYXhwQW9LRzg5MkRDc0J6?=
 =?utf-8?B?d2VhMUdNN25pUkZOZWJnMk83LzJkQkJVZ2ZHdkdlcmE5bmVTMGxtRWdrMERL?=
 =?utf-8?Q?4chAE4Upsunzv34s=3D?=
X-Exchange-RoutingPolicyChecked: Isdjbeief3fZfelY4nAKLlye4RWVMOnzkfxjMhalK50NA+GqDYASrhXSk9+eUeDq/1Mal8nHuqER/31KgljcprnMyqWT3qs3uTTQNZ9jTZ2ZPOcptSbGsjhxY59gtxEaC9u+a/aqYMGi23j77MYeLFJLgpl24AZpz9wFsfLSXom9tJrhZKAwaN+6UcCICeWwiBefFlWwg77Kz6el6V0C1cZwAkiqda8LX02+2hEBGxsOYcAmZVlqR2lRPVl2FSltf8Hoj/3zq9i/Q+8BRkR+n1V1/PSF0HLBClUE7Fi4s+24T9cRuMUNIDBotq+gMGOnUz2g5eueBXKjlMnOaH4cjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 71026762-26bb-4fd2-d0ec-08df09dab986
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 16:45:13.3002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JeUZwIrsHGZmPe+dgwgBC6JuOlPrAeRgsVGV6z3NDzcl2i2whXDYWNYPBbajelugSYXrnIHTaAOuORIgYSetg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4EB9556A6
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

Hi Ravi,

On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
> injection to verify the Xe driver error handling and recovery flows with
> the help of DRM Netlink API suite
>
> Cc: Purkait Soham <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Jadav Raag <raag.jadav@intel.com>
> Cc: Nilawar Badal <badal.nilawar@intel.com>
> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v4:
>    - Added Steer Semaphore for disabling and enabling multicast
>      operation(soham)
>    - Increased device recovery check timeout from 5secs to 10secs
>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>      Jani & Kamil)
> ---
>   tests/intel/xe_err_injection.c | 342 +++++++++++++++++++++++++++++++++
>   tests/intel/xe_err_injection.h |  31 +++
>   tests/meson.build              |   1 +
>   3 files changed, 374 insertions(+)
>   create mode 100644 tests/intel/xe_err_injection.c
>   create mode 100644 tests/intel/xe_err_injection.h
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..683994d1c
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,342 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: MMIO based Error Injection
> + * Category: RAS
> + * Mega feature: Telemetry
> + * Sub-category: Driver
> + * Test category: Error Injection
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_netlink.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +#include "xe_err_injection.h"
> +
> +enum {
> +	RECOVERY_SUCCESS = 1,
> +	RECOVERY_FAILED,
> +	RECOVERY_TIMEOUT,
> +};
> +
> +static void run_xe_compute_on_all_engines(int fd, bool state)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	if (state == POST_ARMING_INJECTION_WL)
> +		igt_info("Running compute-square on all engines post injection\n");
> +	else if (state == POST_RECOVERY_WL)
> +		igt_info("Running compute-square on all engines post recovery\n");
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
> +								    EXECENV_PREF_SYSTEM),
> +								    "GPU does not support "
> +								    "compute on engine\n");
> +	}
> +}
> +
> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
> +{
> +	xe_mmio_write32(mmio, reg, value);
> +}
> +
> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
> +			   uint32_t bit_mask, bool set)
> +{
> +	uint32_t regval;
> +
> +	regval = xe_mmio_read32(mmio, reg_addr);
> +	if (set)
> +		regval |= bit_mask;
> +	else
> +		regval &= ~bit_mask;
> +
> +	xe_mmio_write32(mmio, reg_addr, regval);
> +}
> +
> +static void acquire_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	uint32_t regval;
> +
> +	while (true) {
> +		regval = xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D);
> +		if (regval == STEER_SEMAPHORE_MGSR_3D_VALUE) {
> +			xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D, 0x0);
> +			return;
> +		}
> +	}
> +}
> +
> +static void release_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D,
> +			STEER_SEMAPHORE_MGSR_3D_VALUE);
> +}
> +
> +static int acquire_forcewake(int fd)
> +{
> +	int fw_handle;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	return fw_handle;
> +}
> +
> +static void release_forcewake(int fw_handle)
> +{
> +	if (fw_handle >= 0)
> +		close(fw_handle);
> +}
> +
> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
> +{
> +	struct app_context ctx;
> +	int ret;
> +	uint32_t error_value = UINT32_MAX;
> +
> +	ret = igt_drm_netlink_init(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
> +		return error_value;
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = igt_drm_netlink_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	igt_drm_netlink_cleanup(&ctx);
> +
> +	return error_value;
> +}
> +
> +static int check_dmesg(const char *marker, int elapsed_secs)
> +{
> +	static const char * const recovery_messages[] = {
> +		"AER: device recovery successful",
> +		"AER: device recovery failed",
> +	};

Make this as static global and keep the name generic, something like 
"dmesg_status". Better approach would be like :

static const char * const dmesg_status[] = {
     [RECOVERY_SUCCESS] = "AER: device recovery successful",
     [RECOVERY_FAILED] = "AER: device recovery failed",
};

To be on the safe side, make sure these strings remain unchanged in the 
future, since they are used to detect the corresponding status in dmesg.

thanks,
Soham

> +	char *buff = NULL;
> +	size_t buff_size = 0;
> +	size_t i;
> +	ssize_t line_len;
> +	FILE *fp;
> +	bool marker_seen = false;
> +
> +	fp = popen("dmesg", "r");
> +	if (!fp) {
> +		igt_warn("Unable to open dmesg to check recovery status\n");
> +		return -1;
> +	}
> +
> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
> +		if (!marker_seen) {
> +			if (strstr(buff, marker))
> +				marker_seen = true;
> +			continue;
> +		}
> +
> +		for (i = 0; i < ARRAY_SIZE(recovery_messages); i++) {
> +			if (!strstr(buff, recovery_messages[i]))
> +				continue;
> +
> +			igt_debug("Found \"%s\" in dmesg after %d secs\n",
> +				  recovery_messages[i], elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return RECOVERY_SUCCESS + i;
> +		}
> +	}
> +
> +	free(buff);
> +	pclose(fp);
> +	return RECOVERY_TIMEOUT;
> +}
> +
> +static int check_err_recovery(void)
> +{
> +	time_t start_time = time(NULL);
> +	time_t timeout = 10 * 60; /* 10 secs */
> +	int time_interval = 30;
> +	time_t elapsed_time;
> +	int status;
> +	char marker[128];
> +
> +	snprintf(marker, sizeof(marker),
> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
> +		 getpid(), (long long)start_time);
> +	igt_kmsg(KMSG_INFO "%s\n", marker);
> +
> +	while (1) {
> +		elapsed_time = time(NULL) - start_time;
> +		status = check_dmesg(marker, elapsed_time);
> +		if (status < 0) {
> +			igt_warn("Failed to query dmesg for recovery status\n");
> +			return RECOVERY_FAILED;
> +		}
> +		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
> +			return status;
> +
> +		if (elapsed_time >= timeout) {
> +			igt_warn("Timed out while waiting for error recovery\n");
> +			return RECOVERY_TIMEOUT;
> +		}
> +
> +		sleep(time_interval);
> +	}
> +}
> +
> +static void print_aer_recovery_status(void)
> +{
> +	int recovery_ret;
> +
> +	recovery_ret = check_err_recovery();
> +	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
> +		     "AER error recovery timed out\n");
> +	igt_assert_f(recovery_ret != RECOVERY_FAILED,
> +		     "AER device recovery failed\n");
> +	if (recovery_ret == RECOVERY_SUCCESS)
> +		igt_info("AER device recovery successful\n");
> +}
> +
> +static void log_status(bool val, const char *err_name)
> +{
> +	if (val)
> +		igt_info("Injection: %s Success\n", err_name);
> +	else
> +		igt_info("Injection: %s Failed\n", err_name);
> +}
> +
> +static bool gt_uc_wkr_parity_recovered;
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
> + * Functionality: error injection
> + */
> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	uint32_t error_counter_before_inj;
> +	uint32_t error_counter_after_inj;
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=1 (uncorrectable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
> +	uint32_t error_id = ERROR_ID_CORE_COMPUTE;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	error_counter_before_inj = get_counter(node_id, error_id);
> +
> +	acquire_steering_semaphore(mmio);
> +	/* Arm the injection sequence. */
> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +	modify_reg_bit(mmio,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
> +		       true);
> +	modify_reg_bit(mmio,
> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	release_steering_semaphore(mmio);
> +	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
> +
> +	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
> +
> +	release_forcewake(fw_handle);
> +	print_aer_recovery_status();
> +	error_counter_after_inj = get_counter(node_id, error_id);
> +
> +	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
> +		     error_counter_after_inj != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
> +		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
> +		     "failed: before injection=%u after injection=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
> +	gt_uc_wkr_parity_recovered = true;
> +}
> +
> +static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
> +{
> +	igt_info("Starting Error Injection test: %s\n", injection);
> +	if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") == 0)
> +		wkr_cmd_parity_err_injection(mmio, fd);
> +	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +	else
> +		igt_info("Invalid Error Injection specified\n");
> +}
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
> + * Description: Run a post-recovery Xe workload after parity error injection.
> + * Functionality: workload validation
> + */
> +
> +int igt_main()
> +{
> +	int fd;
> +	struct xe_mmio mmio;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
> +		xe_mmio_access_init(fd, &mmio);
> +		igt_require(xe_mmio_is_initialized(&mmio));
> +	}
> +
> +	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
> +
> +	igt_describe("Run post-recovery workload after GT parity error injection test.");
> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
> +		igt_require_f(gt_uc_wkr_parity_recovered,
> +			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
> +	}
> +
> +	igt_fixture() {
> +		xe_mmio_access_fini(&mmio);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
> new file mode 100644
> index 000000000..a70e6af22
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef XE_ERR_INJECTION_H
> +#define XE_ERR_INJECTION_H
> +
> +/* Steering Control Register (MC_PKT_CTRL) */
> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
> +
> +/* GT Uncorrectable worker command parity error injection */
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
> +
> +#define POST_RECOVERY_WL 1
> +#define POST_ARMING_INJECTION_WL 0
> +
> +/* STEER_SEMAPHORE_MGSR_3D */
> +#define STEER_SEMAPHORE_MGSR_3D 0x00FD0
> +#define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
> +
> +/* Node types for error counters*/
> +#define NODE_ID_UNCORRECTABLE_ERROR 1
> +
> +/* Error types for error counter */
> +#define ERROR_ID_CORE_COMPUTE 1
> +
> +#endif /* XE_ERR_INJECTION_H */
> +
> diff --git a/tests/meson.build b/tests/meson.build
> index a62f447df..0f090dcee 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -292,6 +292,7 @@ intel_xe_progs = [
>   	'xe_debugfs',
>   	'xe_dma_buf_sync',
>   	'xe_drm_fdinfo',
> +	'xe_err_injection',
>   	'xe_eu_stall',
>   	'xe_evict',
>   	'xe_evict_ccs',
