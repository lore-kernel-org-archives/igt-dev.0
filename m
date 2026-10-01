Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB5CA5FA5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4C310E20F;
	Thu,  1 Oct 2026 07:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6nDmMOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4182B10E036
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790840976; x=1822376976;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E4t8IEoNoTaxve7VYo2EmFU0Dcqi55ZPT0wFIZBUKtk=;
 b=j6nDmMOYMNd9oaoz+SqJrUrP5AacnjBd8GKxJyzqrYUGjGgP1kZe1+aS
 q4bDRcxqJcQ+HZ516Y50Noxvca+fuWlTroZwM2vRUzb9HUrp94PqVlwbC
 sXg8bfSWIh9X0WnSnH0aWxv3YF2IgCYCWBw7TgB2ivs1kzyoR/P/iNNV2
 NryiE4e0OyllqyAkrMZpqSYW7Sbu3o5i5rhDEyFut8kubTTpjjau4Pqtm
 rlf8D6YAmhDe3Tb7nt3y6p8fzj6+1FcLECXF01hRRNryEoM2e9Km9P2W9
 m13F/0mcZs73SbdZn0rFqtQbJ4HsmL0XkbZva6QIGkztl8frOv+ePSxcA A==;
X-CSE-ConnectionGUID: V95adkfiSGCmgdHOG+afjA==
X-CSE-MsgGUID: 39XhcCdHTgGYg+LhsHFoCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102115197"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102115197"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:49:34 -0700
X-CSE-ConnectionGUID: BXGY3xK9RQ61bXletnOSXQ==
X-CSE-MsgGUID: vcmwf3OERBubchLYLaD0qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275128878"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:49:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:49:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 00:49:18 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKvliZEXqi6GJJ8f2uxYAPc/E8Cr7iajIDrO9It59WwajmEOmziuv1L5rT5urqtzhus7IbnE+6+5EltdT+iNK65Bp5JyQcbzPW2+6IiQk2G2GR+MtUwwnsI/NRyyQdmxaKZhOUwScge8PTRm+FEmWtoYjfu6f+HFfh+IeIAj3ZkFP6/JBAhfYSIu/v3k3XDRHd3wrg02ho+gniiXuD+qrEVWD29IySsEwM8jCBJ08uoLd+ZwtXD3N7Na3lE5JGctFjCJI2WAGkUGrcVkKDXjpZTJI2cTgunz+HNrZ0AcLERj5JRWBQwlAjM/13dvXT+NT1rU+2qBZH+f0N0dEsQKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3Th1fm08XQwX+1fVZ5raZXnxSHShgnGG1keTuqh1Ro=;
 b=paN7c6oxX++4dOAZ8vucE/168nxmYnxJSXrRVc14Jvyt2VWo6Zp3EAk/QZietvvkd8vwctoWhC6Qpw/isy8bWyCV65vDCUsi7uxsmrBj5TWgabFUP6aWeH0/6tYrHLh0QXE0rUSfzZHcNW4yFucMiHQz+mwPj8E18lotiV+rW8YL8B6GYKUMsBZYtXiYIwhz5l7zRKlQ+BgqS8TVbt53yUZjynRYj6pAfyvsvWjL8uukQvn6N0kIbaF8p3UH4h0RalvZf+TZfMWur0jxOp9gCvR119HN+k9KEidMfDWOChDqPkcWbZ8JC5OpfYmpv+WY/cZgYvq9vdeH0RSSMuQh0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 PH7PR11MB5983.namprd11.prod.outlook.com (2603:10b6:510:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 07:47:45 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 07:47:45 +0000
Message-ID: <3c6abafa-ddee-4b53-8691-0cace6e2702a@intel.com>
Date: Thu, 1 Oct 2026 13:17:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
 <33037b1d-95a4-4eaa-b64b-c7169e0c1fb0@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <33037b1d-95a4-4eaa-b64b-c7169e0c1fb0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|PH7PR11MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cd45e0-5170-404e-16d5-08df1f9047d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|4143699003|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: SHTj22Lzbn+aPuaUWxV03RUyV9AGh+acJU3w+KG6CxwSCwXwwX9MaLmrDCqxBFiUQn+8LcWJWDHTVaFWyFSlV2bSKW+oJW9rtJeGq25F9aufeBTWMv8Nz1NE2tYCko6mLwCdUaFGhRmieS3qbhPb1VRguW+S8rSf1VGxV9/gA4HCRse21dqSLBk6ORpDZJjGQJOA91yy/E3HnrRbbv5s3p9pgSSCv6EctNWDUtSasnf+d9sTBv8Ss77FOqHN7yqqyulR6Vj61yT3VoVYIJ5MYjF2o4fIigf32Y3quKMa2YTV1DmjMYFdE/IbJQ470dR7KjoIFczXJPEqkwZAvsynBsCNILnLXORnUBUARv470M7/0B2I5jNPTK+524BNYqwhXjG6DMU4Bur/Aah2giXL9mR0E3ekxAqnciIz/7RV6d+s8o0ciDPLgdKiWukt1osm8Vmv2IEFsJK/mqE2wPtR/Ky7dqwpzQrfOomngtJs7RJbi8zo69WTT9s845DqD82jd1Qj3fmSyvl3mgYBdvTKYIN4Yfm74GGsYwz5mkTm6Dz1ZVRJqXORUHgrP97FobyMKIm7KZEmBFIWOZbMH4Wyyr0Gw5Sp03AVFBjUT4Geys/XwcSaBOVDeDQcE5SfzpQvuirOxHED+ABslW85PPmUjNoauOOBm5GXoi3BLztX3hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2oxM25HamNxZ1YwQks1cnVDTjR5WU94ZTNHeGNVWUlram5TSzZScG1jNjVQ?=
 =?utf-8?B?UHBxV1R5U1FoLzk5RjBNK1cxZUhkSC9lK1FwNW5ONXBiNDFoR0xnbVhoWWNN?=
 =?utf-8?B?UkFMWGMzODlVVkJkUlFOM1pHcGg0cXpDUW11TDd1d2ZxVk4vRUtGMzVRbUZz?=
 =?utf-8?B?eWk1YjkzUTJlak5zU0Y0MW5kbVBGWUI5WmVNRTd5UjdqWDF3ZXRWam5wdTdj?=
 =?utf-8?B?ZkhSd2hpVTBLdnNSSkJuNExMRjlTWlhJcWt5VDhJTXExdGtUUDJJOVBnTWhP?=
 =?utf-8?B?R1JkTlBGZ2lraGIvTURLNi96UWVCL0J1MU5xSlFRMjJVOVJKMy9sbE5EQ1d1?=
 =?utf-8?B?U0FseElGS0Z0cHBaRmppMEV0VnVBQ0F2UDAxY2JHREF2MWRUUks3Tk16ejZS?=
 =?utf-8?B?Nk15SGZUS1NHOWRVL3dXZUU1WlViMG1wQ0JlSlNDTG5Xb2kwVVE1NUhFTTNq?=
 =?utf-8?B?d2tZaUFwL3JmcVYxbUh3RTFGZGlHT21uV3h6UWhkdlMzdXZtVFlpbFNqa1ZF?=
 =?utf-8?B?Unc5N1poanVSL3BMWmVIY3JBOHQyQ1RxenZld25kNk5PTzh4OFJyMGFjcVZX?=
 =?utf-8?B?NlIyZFhRVEh2Z0NSYktVd3BUcG14RU9pRmVoK3RTSEZ1Vkw4OExpZXV1Tmx0?=
 =?utf-8?B?cEl4NjB5eTZZSjBkN1pzeDNTcnhDaWRlMkc2R2gwcFhySHFua3R5N3JKb05C?=
 =?utf-8?B?KzYvYzY3Q1dNb29yRVJWbW1ZanBHdWkyTFFkUzl5amVYWkhDd1RxNFB3SFk2?=
 =?utf-8?B?RnNnWWE5RDJMVkpSTEE1RmJMRGJMNjBLZVdFMW54WXdRbldpOGdPU2JiNnph?=
 =?utf-8?B?bnQ0dnh0RDltRjFmNzQ3NkRNZC94alY1NGxvU3Jidk1OejlSU245ZS9MaHJU?=
 =?utf-8?B?WEpmVmphVndReENEWkIwUi9rWWdIai9FelhzN1R4Y2htamlBMUlWRDJBZ3Jy?=
 =?utf-8?B?MVdlMVBFRjdrZFVDQit6YllxU2pQazZkNTNnZE1XeTFQWGNHMGtUcVJPWW9o?=
 =?utf-8?B?YWZ6WkVJenBmbXlHb3E3SzVUTFFjeWlncDl4eWFUMDh5UWtVeGlCeDBycDlZ?=
 =?utf-8?B?QzdhNHdmdjlWaUpJeTgyWWVmVVc2NUpPdTZxaTdXaTNBeGYzTHpZV2lVNWNG?=
 =?utf-8?B?WmRjTFgrcWg4M2FIbC9qVWx1NnRnVWMyZlh3VVVwUnpYYkJHWDBET1Jjc21j?=
 =?utf-8?B?MTY2czNaQzB2ZUNIT1RoNU9iODFQdU9meEVCTkpQUVZGL2lzRTAxS29nV1VX?=
 =?utf-8?B?U0hBNmtLeGdxSGFqS1lJMnpMTHZva2krUU9lc0YvcS9xN251UEQ4UHk4Ynpx?=
 =?utf-8?B?aGxiY1dneUxqUGJmczczVEZIRXlnK2FCbmJWSGNWQTJoQWt3Y0lEcysrZTB3?=
 =?utf-8?B?NzQ3OVE2OFZNSWdyRUc0UEFqRzc1bHpXUXBXY01telZSSFh1SjlqeTYwU2Zp?=
 =?utf-8?B?ejgraDFuRjRJNVgvRTN2enFTajlBQlVYdlB2OUgvaWNWQnZia1pZbmVobjFh?=
 =?utf-8?B?NktabDE0eFZOb1J1UEg0dWZ0ODJXck5lWHQwMDBMVEhVNjV1L3p1TXMvRGZ3?=
 =?utf-8?B?eXh4SFZOS05LMGNTRHY2OFAxZkJWQzQzMHZsTnpzRDhHVjdCQjc4Vy92cW1l?=
 =?utf-8?B?YWNaOWZtQmdaczdGME1xd1BnVkJzTTV4ZmdDYk9aYTNGWXFaS3V3T21qOHI2?=
 =?utf-8?B?T0hsWDhYRjFRZVc2dlBEbXRQQlhPYlR3ZXU4SDU2SUpxdCtpMWkrcStEQzZS?=
 =?utf-8?B?MUw5Wll6VlZ0eVVqRjFYMnJlemIwUHRCUEM4ckt3Zyt2VnVzOEQvVnZpbndl?=
 =?utf-8?B?MzBMdjdOV056RDZtMmZjQkloT0gvdVBWekxxRlkvNkZaMHZVNCs2Z3lnRXdI?=
 =?utf-8?B?WFF1QjNUd0NXM2RmWmJ1VTZvQksvZi94d3FJakFRVFlIMXVhOFlCcnFFaEd0?=
 =?utf-8?B?TmxPdGtmK3VqUHN5SVMxeVdObUV4NVhHUFJSNmpIWmdlcDRBbUtRT1k1Umcy?=
 =?utf-8?B?UnNSalpLR2ltUi9Nd2NjNDNLdUxGSVVPaU9PVzhpQkVQSU9TYnM0Zkt1d3RH?=
 =?utf-8?B?WFUrZS9KZ0tScE1nTVBJYjRucW1XQmZzUnVkV1kwRVduUnVHWng0a0dKTzI3?=
 =?utf-8?B?UUFZUm9MY0poVmNTUGUyOXVEeGIrNXRLeWkwbFlvZnRnN3FTVENMUGVmdVBG?=
 =?utf-8?B?U095VzQ0aUhpMVFKbC9pZ3RibzBpaVN1QlF2SVc3bWtZWGt5dGl0ZDI0OVBI?=
 =?utf-8?B?UGQzY1ZXdWlWVGRBV0w1N0p4YnpUYzhvaEp3blF0ZUo0Zjg0WGU3UjkxN1ox?=
 =?utf-8?B?Rjc4bEEyZ3hPZzNDK3JWSVZySjZKQTdlUXhwUmQ4OC9jYXFiMGZDWWpCNGlx?=
 =?utf-8?Q?iglziOmgSir7BK9qMUoE7PS/yUCLX09Ph1dyk?=
X-Exchange-RoutingPolicyChecked: csz+1g8zRoMCn1ouTvA+EzPWkMTaP5g28aKTP4VFDzIBACzTebq3KwNCY2c3aD/caAzKtapLMCrG/dbcVWneEmlSvcrLogtW1esJXvai6nQtd97dOyPJcW/+S9Hfdy9QtShGdiGP4YIvPV4K2GaMr+5P1eyAF790b/5JQLRgTUIFLxPsAhsFlm9D7Ulzto/F926ZcDXTbs9/yPcOq9tVPQH48yvCmkA1XQaBhO8lrFxJvGg7HbJgE2oeCPMJLT/VaI42P9yEeAu+JE9k38Up0H/xBqkBocLfYBMEjGkr3LwbtPlSwrqOp4D7UJIHQbWcXX+9hibFeS7svZ6YySbFYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cd45e0-5170-404e-16d5-08df1f9047d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 07:47:45.4799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ih/qiDNaNASk+qKSqqooPh/iI6J4HceRYEaruoXT4ZHF6DI0spsTE4vuS+/OaONZswh1sbrd9Xvmcmr0eMEKp5O8uslafMBi5LKJzmpcsALROIn1iifMPGt6D4xVyGM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5983
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


On 03-09-2026 22:15, Purkait, Soham wrote:
> Hi Ravi,
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
>> injection to verify the Xe driver error handling and recovery flows with
>> the help of DRM Netlink API suite
>>
>> Cc: Purkait Soham <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Jadav Raag <raag.jadav@intel.com>
>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v4:
>>    - Added Steer Semaphore for disabling and enabling multicast
>>      operation(soham)
>>    - Increased device recovery check timeout from 5secs to 10secs
>>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>>      Jani & Kamil)
>> ---
>>   tests/intel/xe_err_injection.c | 342 +++++++++++++++++++++++++++++++++
>>   tests/intel/xe_err_injection.h |  31 +++
>>   tests/meson.build              |   1 +
>>   3 files changed, 374 insertions(+)
>>   create mode 100644 tests/intel/xe_err_injection.c
>>   create mode 100644 tests/intel/xe_err_injection.h
>>
>> diff --git a/tests/intel/xe_err_injection.c 
>> b/tests/intel/xe_err_injection.c
>> new file mode 100644
>> index 000000000..683994d1c
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -0,0 +1,342 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: MMIO based Error Injection
>> + * Category: RAS
>> + * Mega feature: Telemetry
>> + * Sub-category: Driver
>> + * Test category: Error Injection
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <time.h>
>> +#include <fcntl.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_drm_netlink.h"
>> +#include "lib/intel_reg.h"
>> +#include "lib/intel_compute.h"
>> +
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_mmio.h"
>> +#include "xe/xe_query.h"
>> +#include "xe_err_injection.h"
>> +
>> +enum {
>> +    RECOVERY_SUCCESS = 1,
>> +    RECOVERY_FAILED,
>> +    RECOVERY_TIMEOUT,
>> +};
>> +
>> +static void run_xe_compute_on_all_engines(int fd, bool state)
>> +{
>> +    struct drm_xe_engine_class_instance *hwe;
>> +
>> +    if (state == POST_ARMING_INJECTION_WL)
>> +        igt_info("Running compute-square on all engines post 
>> injection\n");
>> +    else if (state == POST_RECOVERY_WL)
>> +        igt_info("Running compute-square on all engines post 
>> recovery\n");
>> +
>> +    xe_for_each_engine(fd, hwe) {
>> +        if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>> +            continue;
>> +
>> +        igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, 
>> NULL,
>> +                                    EXECENV_PREF_SYSTEM),
>> +                                    "GPU does not support "
>> +                                    "compute on engine\n");
>> +    }
>> +}
>> +
>> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t 
>> value)
>> +{
>> +    xe_mmio_write32(mmio, reg, value);
>> +}
>> +
>> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
>> +               uint32_t bit_mask, bool set)
>> +{
>> +    uint32_t regval;
>> +
>> +    regval = xe_mmio_read32(mmio, reg_addr);
>> +    if (set)
>> +        regval |= bit_mask;
>> +    else
>> +        regval &= ~bit_mask;
>> +
>> +    xe_mmio_write32(mmio, reg_addr, regval);
>> +}
>> +
>> +static void acquire_steering_semaphore(struct xe_mmio *mmio)
>> +{
>> +    uint32_t regval;
>> +
>> +    while (true) {
>> +        regval = xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D);
>> +        if (regval == STEER_SEMAPHORE_MGSR_3D_VALUE) {
>> +            xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D, 0x0);
>> +            return;
>> +        }
>> +    }
>> +}
>> +
>> +static void release_steering_semaphore(struct xe_mmio *mmio)
>> +{
>> +    xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D,
>> +            STEER_SEMAPHORE_MGSR_3D_VALUE);
>> +}
>> +
>> +static int acquire_forcewake(int fd)
>> +{
>> +    int fw_handle;
>> +
>> +    fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> +    igt_assert_lte(0, fw_handle);
>> +    return fw_handle;
>> +}
>> +
>> +static void release_forcewake(int fw_handle)
>> +{
>> +    if (fw_handle >= 0)
>> +        close(fw_handle);
>> +}
>> +
>> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
>> +{
>> +    struct app_context ctx;
>> +    int ret;
>> +    uint32_t error_value = UINT32_MAX;
>> +
>> +    ret = igt_drm_netlink_init(&ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to initialize netlink socket for error 
>> command (ret=%d)\n", ret);
>> +        return error_value;
>> +    }
>> +
>> +    ctx.node_id = node_id;
>> +    ctx.error_id = error_id;
>> +
>> +    ret = igt_drm_netlink_get_error_counter(&ctx);
>> +    if (ret < 0) {
>> +        igt_warn("get_error_counter failed from error command path 
>> (ret=%d)\n", ret);
>> +    } else {
>> +        error_value = ctx.error_value;
>> +        igt_info("get_error_counter: node_id=%u error_id=%u 
>> value=%u\n",
>> +             ctx.node_id, ctx.error_id, ctx.error_value);
>> +    }
>> +
>> +    igt_drm_netlink_cleanup(&ctx);
>> +
>> +    return error_value;
>> +}
>> +
>> +static int check_dmesg(const char *marker, int elapsed_secs)
>> +{
>> +    static const char * const recovery_messages[] = {
>> +        "AER: device recovery successful",
>> +        "AER: device recovery failed",
>> +    };
>
> Make this as static global and keep the name generic, something like 
> "dmesg_status". Better approach would be like :
>
> static const char * const dmesg_status[] = {
>     [RECOVERY_SUCCESS] = "AER: device recovery successful",
>     [RECOVERY_FAILED] = "AER: device recovery failed",
> };
>
> To be on the safe side, make sure these strings remain unchanged in 
> the future, since they are used to detect the corresponding status in 
> dmesg.
>
> thanks,
> Soham
Sure Soham. will update.
>
>> +    char *buff = NULL;
>> +    size_t buff_size = 0;
>> +    size_t i;
>> +    ssize_t line_len;
>> +    FILE *fp;
>> +    bool marker_seen = false;
>> +
>> +    fp = popen("dmesg", "r");
>> +    if (!fp) {
>> +        igt_warn("Unable to open dmesg to check recovery status\n");
>> +        return -1;
>> +    }
>> +
>> +    while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
>> +        if (!marker_seen) {
>> +            if (strstr(buff, marker))
>> +                marker_seen = true;
>> +            continue;
>> +        }
>> +
>> +        for (i = 0; i < ARRAY_SIZE(recovery_messages); i++) {
>> +            if (!strstr(buff, recovery_messages[i]))
>> +                continue;
>> +
>> +            igt_debug("Found \"%s\" in dmesg after %d secs\n",
>> +                  recovery_messages[i], elapsed_secs);
>> +            free(buff);
>> +            pclose(fp);
>> +            return RECOVERY_SUCCESS + i;
>> +        }
>> +    }
>> +
>> +    free(buff);
>> +    pclose(fp);
>> +    return RECOVERY_TIMEOUT;
>> +}
>> +
>> +static int check_err_recovery(void)
>> +{
>> +    time_t start_time = time(NULL);
>> +    time_t timeout = 10 * 60; /* 10 secs */
>> +    int time_interval = 30;
>> +    time_t elapsed_time;
>> +    int status;
>> +    char marker[128];
>> +
>> +    snprintf(marker, sizeof(marker),
>> +         "IGT xe_err_injection recovery marker pid=%d start=%lld",
>> +         getpid(), (long long)start_time);
>> +    igt_kmsg(KMSG_INFO "%s\n", marker);
>> +
>> +    while (1) {
>> +        elapsed_time = time(NULL) - start_time;
>> +        status = check_dmesg(marker, elapsed_time);
>> +        if (status < 0) {
>> +            igt_warn("Failed to query dmesg for recovery status\n");
>> +            return RECOVERY_FAILED;
>> +        }
>> +        if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
>> +            return status;
>> +
>> +        if (elapsed_time >= timeout) {
>> +            igt_warn("Timed out while waiting for error recovery\n");
>> +            return RECOVERY_TIMEOUT;
>> +        }
>> +
>> +        sleep(time_interval);
>> +    }
>> +}
>> +
>> +static void print_aer_recovery_status(void)
>> +{
>> +    int recovery_ret;
>> +
>> +    recovery_ret = check_err_recovery();
>> +    igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
>> +             "AER error recovery timed out\n");
>> +    igt_assert_f(recovery_ret != RECOVERY_FAILED,
>> +             "AER device recovery failed\n");
>> +    if (recovery_ret == RECOVERY_SUCCESS)
>> +        igt_info("AER device recovery successful\n");
>> +}
>> +
>> +static void log_status(bool val, const char *err_name)
>> +{
>> +    if (val)
>> +        igt_info("Injection: %s Success\n", err_name);
>> +    else
>> +        igt_info("Injection: %s Failed\n", err_name);
>> +}
>> +
>> +static bool gt_uc_wkr_parity_recovered;
>> +
>> +/**
>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
>> + * Description: GT Uncorrectable Unicast Walker Command parity error 
>> injection
>> + * Functionality: error injection
>> + */
>> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>> +{
>> +    int fw_handle;
>> +    uint32_t error_counter_before_inj;
>> +    uint32_t error_counter_after_inj;
>> +    /** TODO
>> +     *  Fetching node_id and error_id dynamically is pending to 
>> implement.
>> +     *  For now, using
>> +     *  node_id=1 (uncorrectable_errors) and
>> +     *  error_id=1 (core_compute)
>> +     */
>> +    uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
>> +    uint32_t error_id = ERROR_ID_CORE_COMPUTE;
>> +
>> +    fw_handle = acquire_forcewake(fd);
>> +
>> +    error_counter_before_inj = get_counter(node_id, error_id);
>> +
>> +    acquire_steering_semaphore(mmio);
>> +    /* Arm the injection sequence. */
>> +    write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
>> +    modify_reg_bit(mmio,
>> +               WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
>> +               WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
>> +               true);
>> +    modify_reg_bit(mmio,
>> +               MC_PKT_CTRL_MGSR_3D_ADDRESS,
>> +               MC_PKT_CTRL_MGSR_3D_VALUE,
>> +               true);
>> +    release_steering_semaphore(mmio);
>> +    igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity 
>> error\n");
>> +
>> +    run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
>> +
>> +    release_forcewake(fw_handle);
>> +    print_aer_recovery_status();
>> +    error_counter_after_inj = get_counter(node_id, error_id);
>> +
>> +    igt_assert_f(error_counter_before_inj != UINT32_MAX &&
>> +             error_counter_after_inj != UINT32_MAX,
>> +             "Failed to fetch valid error counters: before=%u 
>> after=%u\n",
>> +             error_counter_before_inj, error_counter_after_inj);
>> +
>> +    igt_info("error counter: before injection=%u after injection=%u\n",
>> +         error_counter_before_inj, error_counter_after_inj);
>> +
>> +    igt_assert_f(error_counter_after_inj > error_counter_before_inj,
>> +             "GT Uncorrectable Unicast Walker Cmd parity error 
>> injection "
>> +             "failed: before injection=%u after injection=%u\n",
>> +             error_counter_before_inj, error_counter_after_inj);
>> +    igt_info("GT Uncorrectable Unicast Walker Cmd parity error 
>> injection successful\n");
>> +    gt_uc_wkr_parity_recovered = true;
>> +}
>> +
>> +static void inject_error(const char *injection, struct xe_mmio 
>> *mmio, int fd)
>> +{
>> +    igt_info("Starting Error Injection test: %s\n", injection);
>> +    if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") 
>> == 0)
>> +        wkr_cmd_parity_err_injection(mmio, fd);
>> +    else if (strcmp(injection, 
>> "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
>> +        run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>> +    else
>> +        igt_info("Invalid Error Injection specified\n");
>> +}
>> +
>> +/**
>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
>> + * Description: Run a post-recovery Xe workload after parity error 
>> injection.
>> + * Functionality: workload validation
>> + */
>> +
>> +int igt_main()
>> +{
>> +    int fd;
>> +    struct xe_mmio mmio;
>> +
>> +    igt_fixture() {
>> +        fd = drm_open_driver(DRIVER_XE);
>> +        igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
>> +        xe_mmio_access_init(fd, &mmio);
>> +        igt_require(xe_mmio_is_initialized(&mmio));
>> +    }
>> +
>> +    igt_describe("Inject GT uncorrectable unicast worker command 
>> parity error.");
>> +    igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
>> +        inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, 
>> fd);
>> +
>> +    igt_describe("Run post-recovery workload after GT parity error 
>> injection test.");
>> + 
>> igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
>> +        igt_require_f(gt_uc_wkr_parity_recovered,
>> +                  "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
>> + 
>> inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", 
>> &mmio, fd);
>> +    }
>> +
>> +    igt_fixture() {
>> +        xe_mmio_access_fini(&mmio);
>> +        drm_close_driver(fd);
>> +    }
>> +}
>> diff --git a/tests/intel/xe_err_injection.h 
>> b/tests/intel/xe_err_injection.h
>> new file mode 100644
>> index 000000000..a70e6af22
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef XE_ERR_INJECTION_H
>> +#define XE_ERR_INJECTION_H
>> +
>> +/* Steering Control Register (MC_PKT_CTRL) */
>> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
>> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
>> +
>> +/* GT Uncorrectable worker command parity error injection */
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
>> +
>> +#define POST_RECOVERY_WL 1
>> +#define POST_ARMING_INJECTION_WL 0
>> +
>> +/* STEER_SEMAPHORE_MGSR_3D */
>> +#define STEER_SEMAPHORE_MGSR_3D 0x00FD0
>> +#define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
>> +
>> +/* Node types for error counters*/
>> +#define NODE_ID_UNCORRECTABLE_ERROR 1
>> +
>> +/* Error types for error counter */
>> +#define ERROR_ID_CORE_COMPUTE 1
>> +
>> +#endif /* XE_ERR_INJECTION_H */
>> +
>> diff --git a/tests/meson.build b/tests/meson.build
>> index a62f447df..0f090dcee 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -292,6 +292,7 @@ intel_xe_progs = [
>>       'xe_debugfs',
>>       'xe_dma_buf_sync',
>>       'xe_drm_fdinfo',
>> +    'xe_err_injection',
>>       'xe_eu_stall',
>>       'xe_evict',
>>       'xe_evict_ccs',
