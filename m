Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74D5C369B8
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 21:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC8C10E055;
	Mon, 14 Apr 2025 21:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdKoGBRs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8CC10E055
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 21:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744666577; x=1776202577;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=XpoUySQBsJPRxS0qB3+iATaAfQ9q+G0CIhHIafTphv8=;
 b=PdKoGBRsRsCwmQYTDF7x6nTwHYRCvn4YGwAZTtkga3tkpA9VSEoeTNwd
 iPizvsAHimnxX4nEjwTT7xnKY77D1g5KIw+WAiduuzJJWrM4uwszvsm5K
 y0kGysZOPgCuW7AZJug7feIZwHy7pp7hu1a8oGRRWV9BwYU/ZybkmlgAw
 Wob6P8cE8gxOxgqIdKgDAqbdbKuDTCXczfYLoSg+uDm0sjRZvSfBUZPjJ
 XFrb0GR8FiIWpWhOYCl6l5wOEZdOW3uGSuDTCysxtwU7NpaZzXr6OGV0r
 y9eqfuUinKI6vpQfyNDKiaEsSD7tIKVIaf40jYQ2uKLAu4onprWHPuVjo A==;
X-CSE-ConnectionGUID: /5jyI6XJTayG3SJb5j4tYw==
X-CSE-MsgGUID: E570FDEIQ/6wnKNQ+/MEgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49985009"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="49985009"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 14:36:10 -0700
X-CSE-ConnectionGUID: +K3CoYb7TKOsRmsU8Mtn6Q==
X-CSE-MsgGUID: +vXZ8y12SUSCci9iRtLcyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="130810134"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 14:36:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 14:36:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 14:36:09 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 14:36:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sw1nWkIRUUC+IiiFEWucY7yZjAV8xTRc+dp+DHvLPhNk4T0peugWcCouj5qSIRnHsbkWsr91IEwiSfhmNNbGlyVgkc9x+YkwAF+Ew25Ycocf3vqUbCxGCrRNSUSB/PiKKhoBd2lMt7wrRBhVfE96Dwqw9u8WuVB/qbxn/qOfbIquTvLdaPJzBzSb0FsOjJwVGIXr+g1Thfaa/lHIo9cwCd2tybO7J4ENYhNAlxdsa2m+rmDwn+z2YkcM4m/Xcn+OcogidJujpn+6lnwLR6AtEJW1tbGjuvOilWLOQMqnaaA0TaTyOfGeum0pCgYwIetLOtfgLTUjarTRBUj/j+Wetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkWe22G/TtpY48Da53gU+GBPUZ0viSaIziBNUCgaVwg=;
 b=N/9P4c5w1jd6dJTDlyCShnwMPvEDwHz5rm3YhFRmt4zVeXtdShVa4fUaTMPfvzKvMyrIEAT1Kbpydj/kho/ztDrdwhCanmp9Nyt9zBgEvUqSM5OuFIiYC/KnFiJCfy63YRsqQY/h51c25/tL/idE3JegTbf3D2hA+o1ZnvFbKfjNNCtjWzDZxsWFBX/i1TK3BtBBWBYOoq2KJMU6/ahljmnUK8cZu49cUWyLArpQoq8WEe5mp6UEWFGV9VgVVcKlm6xJhv4MYTSzoAkbvwwjkNfhry9avaFvyH+frnno3t95JlhJpD+OmeMApHx4rmHvaIu4842C/M9OJ/D99hjeqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7962.namprd11.prod.outlook.com (2603:10b6:510:245::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 21:36:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 21:36:04 +0000
Date: Mon, 14 Apr 2025 16:36:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t 07/10] lib/igt_kmod: Add rebind abstraction
Message-ID: <xfnfigwlkb7cil4wcmex4mr4pbi2niy6g7xcv7acq5lfsojvyk@tro5piy3pgqb>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-7-84b1ad0b8075@intel.com>
 <20250414180722.bnfbjuezcnyxu5gz@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250414180722.bnfbjuezcnyxu5gz@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MW4PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:303:b9::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 52fd913f-5a8d-40f8-8ce6-08dd7b9c5c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3SrymfKpn+c2Z+4bOggDVFcmBdZoFCW2CSMnIGeEkeH0SmFt8oYXbYTFyeu3?=
 =?us-ascii?Q?INO2WpNXeYwGa/N+bBWXf6H+xgXY/LS50E7JjBDMdi7PbrSeIyvYQljlfJnG?=
 =?us-ascii?Q?cXodbJ4rarxbvvCswBS2Xzwso5j3b8tTe7XLpD0fhoROlZ7mmCX1f+suMzAa?=
 =?us-ascii?Q?f0IfpESLhIdW9em4XlcZH8knw7zKLr13GOFGiy/58tkn5Z6ZIv1CzkGrBbsG?=
 =?us-ascii?Q?e2gQ5Iqgl6l+IbPbnrOstv7HlT6YuDYTZgfhEyPnsu3rutnKiDah4Hpv3HhW?=
 =?us-ascii?Q?lSMJeH0aDFnuSzTUxfgKe0cWe+OxAZYJIAYlVkcVQbJxqRzyewXwUHamhG+S?=
 =?us-ascii?Q?YMnMfzQeG6n+YcDzgXQoGAH2LD2klo4WqBWMNGE8QGG2kjt837kEoGfyLuzm?=
 =?us-ascii?Q?RkQ7W2uxJK6/71iJLTCWAjL2gFFzDCLDn3NwEM68sAnJyWOIqmZ2nRa0QjI6?=
 =?us-ascii?Q?ZSgjXRNp7YSnYRs6vQN+Bxyso1b4z5zBQMcDU2zL8pM8/1Jesy5o88WSeXxa?=
 =?us-ascii?Q?k6SBloYw56qZ0Bz0FhHbX95B1v6310t/4U+iXfFle/4+xh8mTXTcCpwbUoLn?=
 =?us-ascii?Q?fzjFv/rjpQc2ZdkAufvUZPifRKzShbRgr8H9kXJ6zklKYNV04uAKALPnfdnK?=
 =?us-ascii?Q?lNka+S3nY6pTTJclY50Z9J8jPpluHaT/QxwdwOiX9LxVzVSh4P4PvLZDpkZw?=
 =?us-ascii?Q?ydmNq+kwB/GX14UYyCIWi+H8dsRlmuULWCpDnGXwFdAl711qHEtFwGUVHfzf?=
 =?us-ascii?Q?YXp0gx7fBgNutABKISCJmKybyH33FcNIcAhFwJFujHS6ewIdyuKclQ4xL9kE?=
 =?us-ascii?Q?6WXqPnUQ+CSHf8CC5dzTzaJ9YzBAC4SRwAsWDqLzAsJ+1xbturkuDYsia673?=
 =?us-ascii?Q?GHHUt8GUcS7HerHEFwxPkIS02xpySNxy2fPcLRfiBh+n5eZbUqnwP3StmVky?=
 =?us-ascii?Q?jYfA5pYF772F/NWgrAE6lKQHv31O7yI+kBi+GVf92rQdRDvEWpbQb/AZeNtd?=
 =?us-ascii?Q?8cXwkN7pUSQkrSwGQLrfqq1yn7lvF3Mrh7nZeNIlKZMPfv3SlL45uMNRm8+P?=
 =?us-ascii?Q?t7k6AE1MmgLV6jme3aRBsaTS9/g4fJiQ1UXVpWme7LSedwjzyePhkCy5zmkL?=
 =?us-ascii?Q?Am7Zeb1XwETrwX6rzixfU1HT2R4w5OktCKcMjvSjR9hEXXfEFxTpGJaZJD2T?=
 =?us-ascii?Q?bbBMWh5fcOwhgVmnT0bAc1C9pN6XthNTpWlpW1b8RlSDyezFQm+/X8XK3f52?=
 =?us-ascii?Q?C4CrBBe550ddLdwAz35ujaMcAwkqQuy6cHStaZ8Et1mSEFp1ZDKA6zN1ovTH?=
 =?us-ascii?Q?gHWlhdg3HfIF0rDu5oz/6UuT4eeA9coVZaGmXe6piFbCUsDD/bNcLEwNG728?=
 =?us-ascii?Q?2IOQH4c4CqQla9JKyFi7FUGDlCTSmLplt9T2RUE1U8Hx72h0ZxUT8fTvyC3R?=
 =?us-ascii?Q?4kKMsu7syPg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QnLZeD4jqcstubQtOJg/6OgVyvuoIfCoslfuYubFs8NVGI+EtV2HsR63IuDT?=
 =?us-ascii?Q?2erBci4G5Hqk+wxOa04gRtMQ51seJ+dCZBAgj89zg6DfQYsPFaqxEiDFZ876?=
 =?us-ascii?Q?5+BccOuUsd7KhqKDmvZzahrhAhumEeDZ7C1dxuKCSfyDMf0PtSBRCTt+6JMm?=
 =?us-ascii?Q?gbmmA6RXK7YQVfHIkz5zFCMfRenKeno+rGLmsx8RVa3HvEOKDB99k4liKteX?=
 =?us-ascii?Q?HMLDbnYR0BGhLncRTpeHoWvzSnOJlC9tMn0gABlnfgaBA4Rf/kCXgd1JPywG?=
 =?us-ascii?Q?b1yzE3tXs6RUJ+RYXzMVU2PukOCmlcdCOKSpyKF1c/s5G5BYIN00d+rjR9dV?=
 =?us-ascii?Q?3J3axQgDo7HcGJDelhnnn4ZYWUPWern88Zjal8YbabbLvvk818gPQr4AN0xw?=
 =?us-ascii?Q?yh3Dkhnlau9SVIbahgJGXqL9A0ArJtfmcQftoikpaT332Ljc77qyfXWC/SZB?=
 =?us-ascii?Q?nJDjhhh1cEW0/QHf87Avnei/PO8TVErJGDZ5GVcYfkjS2yeiSNGxgT7azjzA?=
 =?us-ascii?Q?nJH3seP7Zx/5tRP9XO+wRhx3gocxtXR5YKZC2sekiGkURYFLY/010dfJCuHH?=
 =?us-ascii?Q?0DHKATPLRSp9gl6rKtQFlPEX0R/PvVIT9F/emDMTk8XFnlP/0jrIw0K5YApr?=
 =?us-ascii?Q?Ry6zusBhsVwJr75ehnOMUshxPbFF4VKVBT3RYpAC7/dsVUoYuZqNL3f0uCv9?=
 =?us-ascii?Q?v5P5zpkMHo2Vrl2V9NYULCX/f6QOfoPrTFzwX7OMneHUwikRLqtEyPrvpgWY?=
 =?us-ascii?Q?k3BtqWhsHOYchV//d8t+s9vPw8qr+WbWcYqm2z1lchITmpgaq/EEQRc61gyq?=
 =?us-ascii?Q?+jIBcBynvLYSGvfZG0e8mC5MZTlf/ebjVOaUDTPxZoJbBrTIO0E5ciq3x7F7?=
 =?us-ascii?Q?CWXOPWJMaNwKD0gkLkRWUDg3MoN7bpfhxF8ZRS9i3FeDopbAaY2+471KzVia?=
 =?us-ascii?Q?tJAhJqQVF5SMKxeiJd5Q3G2An7l73UeUx2k0iaPmnCipQ/Pblw+R+9DonVbt?=
 =?us-ascii?Q?dvNJ7HX7Zih505hjsEvwZWqcXTiAtWt43lVjlA+oCbxXcG8H9kzgg0FmO4Yb?=
 =?us-ascii?Q?SGmVNYrpYtM3Rd+DGVJVhcAgW8g0nTOF1EUzZWZru1Q2/kIJ2guGaOy5uhAT?=
 =?us-ascii?Q?+XCSy4KbZFAQtjEIuh020cjE/VGRNOSZ2Z/x6812Ru0/QtpoZkjMX8AFrvCv?=
 =?us-ascii?Q?WgP8uG9YY4QrP7P1ypBxQ7SXdmK1mLewdaoSqVRy0cSDnx4oHtevDOnt/KS5?=
 =?us-ascii?Q?u7hodZTYPWW4k3inaevzxZk+jWXC8dc6/8wDyIH7zOp3gi3FnH24xnHH0IoR?=
 =?us-ascii?Q?PjMGs7jkPGfrGFP+Z6FESvO7BI/mFCUJc2zHl49Phv+TYzixJKZVfAuKkM/6?=
 =?us-ascii?Q?MwXCyrGmhQxixvVcbsqczswT42ocimhoWvet2Y6ikU1XHGHMKQBZpdJBqzPI?=
 =?us-ascii?Q?maFG38ydL9n2fVaRz5p/eOktUaj6okAr/UMQZvtZLoxNQPXHJgvMflCEc/6j?=
 =?us-ascii?Q?G8BoUtOfEq0ABi7GYKQiVbuABa1RSRKrhlQeFmh3xSyUz33IWbI6I0sBxAd3?=
 =?us-ascii?Q?UmPoIStyfm3B5AbYaL2e06D4H5+s1cie/4oM8Jj7rRoLICFT8TTeyzFBt7ZH?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fd913f-5a8d-40f8-8ce6-08dd7b9c5c25
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 21:36:04.9303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3cWqMoZOaO+GLE5fQco6IwJP18I/LHgBgC6IUdm5BOinXoTf9O8C7aQb9wZlyykB5JvD8GhWPKwXETKGT641WU/j5NbMHQMuzdFlGP8BHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7962
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

On Mon, Apr 14, 2025 at 08:07:22PM +0200, Kamil Konieczny wrote:
>Hi Lucas,
>On 2025-04-10 at 15:48:36 -0700, Lucas De Marchi wrote:
>> Abstract the "set one file in the drivers dir" and share the
>> implementation with unbind/rebind.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_kmod.c | 11 +++++++++++
>>  lib/igt_kmod.h |  2 ++
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index 14b6b957a..6d7f5705c 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -665,6 +665,17 @@ int igt_kmod_bind(const char *mod_name, const char *pci_device)
>>  	return ret;
>>  }
>>
>> +/**
>> + * igt_kmod_rebind: Unbind driver from devices and bind it again
>> + * @mod_name: name of the module to rebind
>> + * @pci_device: device to rebind to
>> + */
>> +int igt_kmod_rebind(const char *mod_name, const char *pci_device)
>> +{
>> +	return igt_kmod_unbind(mod_name, pci_device) ||
>> +		igt_kmod_bind(mod_name, pci_device);
>
>What if after unbind the bind is still there?

I'm not sure I follow what you mean here, but: if igt_kmod_unbind()
fails, it simply returns that and don't executed the second function.
Was this the question?

Lucas De Marchi

>
>Regards,
>Kamil
>
>> +}
>> +
>>  /**
>>   * igt_intel_driver_unload:
>>   *
>> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
>> index e3a4ce671..905070897 100644
>> --- a/lib/igt_kmod.h
>> +++ b/lib/igt_kmod.h
>> @@ -39,6 +39,8 @@ int igt_kmod_unload(const char *mod_name);
>>  int igt_kmod_unbind(const char *mod_name, const char *pci_device);
>>  __attribute__((nonnull)) int igt_kmod_bind(const char *mod_name,
>>  					   const char *pci_device);
>> +__attribute__((nonnull)) int igt_kmod_rebind(const char *mod_name,
>> +					     const char *pci_device);
>>
>>  int igt_audio_driver_unload(char **whom);
>>
>>
>> --
>> 2.49.0
>>
