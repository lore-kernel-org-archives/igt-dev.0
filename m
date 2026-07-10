Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E779DC44507
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 05:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B97B10E129;
	Fri, 10 Jul 2026 05:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hj8u7E6B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D8F10E129
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 05:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783659994; x=1815195994;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GmI0BLfgHRnjfOk37J1FDQbAn+z6CLIYWZ3NFNkm9A8=;
 b=Hj8u7E6B79ccF9oXOr99H5H8n5MvBlehJ2eq7U38uhyKbIinrtzffyBL
 PF+scdZ6lGyO4idZoiRbk7oDKL71Uf9gKe1zq3HFDvzQumdfYYzn/npEq
 L+R5Ge8JXbPv2Dr9Jxd7Y6j9hSm1KEBcsUQsZljRsHwOA+zBDI6oK7mv5
 cBOsBkDmzK98B1tbhQHshDFvC5J6xdSAIkWnZnXBbRPY3hkRyCuYszsB4
 kCJX4Xcf4mAc9pZNlSjMlr3/lBgcaAbvR/xm89KsYW/cXyUAU++k5l5nr
 Xx/I/XT6frL5lqeFDdDhzKGwwNuTIqf/R15TZzOubc+aDfb1AnkcN9B2J w==;
X-CSE-ConnectionGUID: 0t/MMDvHRsqNjnSatGsSGA==
X-CSE-MsgGUID: YwjTpTAASIOyGT/KMSrcZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95869652"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95869652"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:06:33 -0700
X-CSE-ConnectionGUID: edVlAovOTOmAWgbKSg80IA==
X-CSE-MsgGUID: RLDX99+eTPSE/NTtS53lmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258395761"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:06:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:06:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 22:06:32 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:06:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agvOKvZcV6jhvv52EYziUxitcZpqTz9m7WbOTcbLDi7Tm+VMzeWA+ivGY+FhV+bvzL7toOibh09ijsI5CV1uQQGLA4eaF7B1Tc13yC6rGS6KTYfZSDnFxwY+uuafYg3sz98jmVc4hHO9CIxfAmfc+elviYR41OYOpa3IqFcm/l/exF3t2cKm7vf2Dqnpif86jiic2ZumJ4Yib5AsFDXsKd/PfJMkEdByOWhxBsu6GOMd/NOjVW+tgQtyEOshzs56UyFE7gj0k/iCEEsz493IERx+FUbSvIB5H3GwhcTZaugdokYtiSgox9TrDeCwS4cUOfGKXHl6P2Wqwxl5jOSbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2d393BVoprcMYhzaH8JJ2JCRUMrhLaBfUYub5vVWP0=;
 b=vBCjjb5kPk0UgNW53NkQ3yejN/dOEPTdLiGEus7ZmM+A57untLj9dB71uEvlNghUO09farcZkW6VtaaWuYwapwF7fRiCjKr73l+qcx5S5KIuZv0ZEBpDct4vvB8TMzqKvSXq5qCSA1dbR/CDzXFG/6pHizKcHu7E3223/TNzVgimGLtao1Fou1RusjG0Rx/RRkfQEqihhcwe4CelVpbrOKZZROfcwYBaAy/Tq2+Imv/7b1yHOeRdQfYn4DmrJFE4kOvCwTdbvUDVB+z6ucikOnthAJ1kET5doyPTE0vwsJlOWFguZDA1CcLIeVHi7kj2+3cPR3t9kKoKasw5DwPhtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.17; Fri, 10 Jul 2026 05:06:29 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 05:06:29 +0000
Message-ID: <7b6991df-9fc1-49e4-92d9-ef3c04988e25@intel.com>
Date: Fri, 10 Jul 2026 10:36:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 12/12] tests/intel/fbc: detatiled debug info for
 unsupported plane size for fbc
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
 <20260601204407.39934-13-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260601204407.39934-13-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0348.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::6) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: 552037a2-51bd-424c-3fad-08dede410027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|3023799007|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CJqNCFd4R+qDxytHMEhyWA5fk+Hj0SN5mOjV8WnWEJ3ivM25ka8U90lcAJCcGg6BxqZDYpOSpdO1f7Coh7OcLN/EF0+61NJ842tLrBXl+Mf3nLSGTULDNgsVcR5Yvm4u4jLvhcmC7nmnzJ5jY2W1TfE4iYSeSM8VAVu2g/P4TuSD6Fu4Ixr++kvIjEJHyHQ6TEP0JxTGxHxhdRGGyMsCLYqpb9ojhEkyM4DPjqiEIAsSWS+YC7FlNuepjRJLjfchQ/coDDwWhY8h7qtHd6cfpsJrTYK6seE7zgY/vP/4ws606tkyLEMsJfTIcvKGsJm8rxLFGS5eY6t6a0u1x/KJZySl2kcgmCY7ZiND6kbCDMhF/GQ6KsYLNQryZ4C4uh/g9Z+PeMuzRpd9ExfURO3vpUxWbWe7O++kEaM94vlYELqFVfeiabfpoc6dsBDxtHdrL9Dky1uiMYJTcISLRPTa8GhH+6+FPrTPwpVlTypJlFuVN/EnG/3h5HFLCUvbG/vicunQqogLyJkqlJB2cTf1yA706N4rL79V9v0gfs0H/nld6VFZ6P5+rUvqiRk45BqnLtrKxDi9pYjQwcZ4f157bsAAxlD9WUzSA1RlVDYPEDgFfY92TM1Mmg56YN84Re9nYIwzRyGNX2D0vydGqKcWLdVt37it1J+Wz0wNBgolSLM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(3023799007)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0RxQ2NJMnpMZzdENngyVFlQY3NJTUVXL21BNUJCQUJMVEdGZFM0eTNud1NE?=
 =?utf-8?B?YkpBUStsNDBjekZIZWNBTkxmOVI5cFRzMWFKQ1VmS21qOGNiN3B5MFhWakdK?=
 =?utf-8?B?UC9hNEtMMXIxMHl6Sy8rYjZUdGdYcm9Iak1hZVJiYzRZWHltYW02Qk9VdDF2?=
 =?utf-8?B?V1MvOGlPRldyS1U0L1BDQnpqTGZhUjVKMkxIZmFnaWxKUUY5SWt3aU9kNWdl?=
 =?utf-8?B?Ui9ZbHhGVlgxMXZ0Yk9rNEV0Qm5vVjhVWitQQUZUejJhTGNEUUk5U0lhdk1S?=
 =?utf-8?B?VFJGNkVyVUx6SjZhaEVqeTBGcVI4bTRqekxmamVHalVsbm1kSGtpZnFudGdi?=
 =?utf-8?B?SVlxWTFYMS9aeHVONTJxRGo3Um9mUkJDOVdvTHV6NjhxNmZCMWpYTG9GMjlh?=
 =?utf-8?B?WUQ3TUhqWHFFWE5id0pmTzRCU2xZK2lwNSt2T0hrdGowaHY4TjZha0l2Rm5G?=
 =?utf-8?B?VzBlbm1VTFZyeXpGYUsvdWtzVmpUMEZ6Yi80VEx2SzBMNmJWcHN1cFlkWG9s?=
 =?utf-8?B?YzVZV2JmNy9zTFdJbnhMUjNYa3BmRDluMW0zQ2VtbWF2bisvbzBoTEIzc3lN?=
 =?utf-8?B?MjY5ODRxRnZCZnd4M2VkOEk4amVyZmY1YXhYRWd1bHdXczY3SzZaZVJBcnd4?=
 =?utf-8?B?RFM2ejRLM0p0TG1XZnNicWJPa2RRTnp0Q05YNkI3WEhlZ1ovNUt5MW1uWVhv?=
 =?utf-8?B?eVc4M1RjRyttME5xQjBFQkNlZ1QydU9tdXd1NUo3UWI5U1phT0U4emdLUXNS?=
 =?utf-8?B?SThaMVR3M3JZSDdlczBjV3pkYlRyMlo0RWFaYys5cGhuQTdmMnFjVXBpdlF1?=
 =?utf-8?B?T0tycTNhQmlmMHdPSlVlTTRNN0JTVitlbDRERkJ0bHk5MGlCVjFOOSsveE5L?=
 =?utf-8?B?dFlWZytsOXhiZXRUd1ZsYUVXWWlBTlBiSjhCRnc3SkF6VnFUUFQ5Y01YcC8x?=
 =?utf-8?B?QVY2SUU5QkJaSlVDeEVzVWhlVjhMaUliOHVTSmlkUEdTb1ZuU2NBdUthRzcy?=
 =?utf-8?B?Y1JNeXp3cjZBWW1PZXA1bVdoRWZzTW9NVGFwZUt6NXBNQXRRRGpCZXA1TkV4?=
 =?utf-8?B?RmcyalptcUYreXFBYVJ5M2w2dTdJUExyY2NvcTB6STFodmFiTGNVVnJ2R2pn?=
 =?utf-8?B?eXU4S1k5bG9RRGRWN293Q0sxMUtHZUtvQ2tIRC9hdEphNE9zNVVpSE96Rm5C?=
 =?utf-8?B?V1Q2Z3BrUDRuQ29qNll6eElLck1zY0l6cjN3bzF2cVFrYVcyY3llTW9hWnR5?=
 =?utf-8?B?OHNVWDFYN1NQeUFiTWNWUXo3bjRhN0lOOUZOUFh3RUIwUEJjQml0ejRNdGsx?=
 =?utf-8?B?SDhNY2F6T2g3RmhsWUc2VmlwbllDTXlwQ2pHOVgwd1BOTS8xT2hJSVpHa3hv?=
 =?utf-8?B?OWJ1R0dMRjdVTXlKWENKR1B6ajZ2OUZVWU9VNWQ0OEIzcllrRGdYRjhvWnZP?=
 =?utf-8?B?ZVBvWlV5VWc0WHlCVksydWRRM1BVdFZmVmxUVDZ2QXBQenA1eEVKdTJQdzJk?=
 =?utf-8?B?MGhMWHZGRUNSK0pYdm1SQ1YvM2dBUUE2S29XMFdvOHBXeVBpWVc4T1haMnNv?=
 =?utf-8?B?ODF2cno2UFhjMDUrNnVjWVZOTHRpNGhwVGJBSjJ4cU5wOXRmcXh6UUM4NmZa?=
 =?utf-8?B?YWo0M2ZobTAwcWxwanZWdEptNVAvK29Ub3Y4bmRlWjl1MkUvQit3NGN6Z0xu?=
 =?utf-8?B?OG03cjRRZGdwV0E1ekc3VDg1ZlV5eEZlSVkvOVc3U1JrM2hCcFdtTkdMQnhX?=
 =?utf-8?B?VWJsdExYeDFqcXZhQUdLZ3E1Y1RaWDU3S3lXNWRvVnFLbWdJekpUNDJRZEVW?=
 =?utf-8?B?RXdSa2hOVFdvajNpNmtqRWk0dDZVT2VscFo4cWtHNEN6elZhR3VYQ2JaVWx0?=
 =?utf-8?B?Nm10SjhFNXVhQ2RXYXlFMm1lQ29QVmFKaVRLaGJMMUdDeTdCL2hTM29IVklq?=
 =?utf-8?B?REx1eVpsK0RTUUxDclpvNHZ1OUZ0WW5Na3pwOVEra3dydWcydVR2TFl6KzZG?=
 =?utf-8?B?dGpvWjJrWEFHd0Y2QjR5SGx1KzhKd1Y0SGZvY2JxUFJiSzdFY0RVTFU4enFR?=
 =?utf-8?B?M3VKLzFDSEZMemtpZHhyRU5ZYUphenBnT2tmVVhwZXZnZ2JoTmQrZXlvNnJh?=
 =?utf-8?B?UWs3VXZzaDJtVlNSUmlXQnpwZStqaEZmSDNhVlREYTB4OTNOUURqQ3BScGlW?=
 =?utf-8?B?bWI0SkR5YS9pUGQzRDA2SHAyYUNRQUxJY2RRUlNpZktQaWx5d0pVRHNkRmFX?=
 =?utf-8?B?MGdvWG9OUmRwQVZvSUY1aHVmRVRWUFJ6Y2xBRFBuZzJsSGw4ZkJRSjVVRnNN?=
 =?utf-8?B?MGJBbzQyc05iVkE5aUVlbDlpVDg1MHg1cFJHNDhsY1FobEZvNG0zY1pBcmZU?=
 =?utf-8?Q?la9JPNqUp/Dw6lJY=3D?=
X-Exchange-RoutingPolicyChecked: Ga7WPjeKOAZFHMc12JT0iLACrZip+76/Xd3ke/QPvneUH/8nlFSlsbPVv64wT9e8hjEVwiym3+3bfxPiMsXfbhLUUHpMZdBOmEa7xRQPkiOZUFy1DLGy4m4vu0VXvWE3S0KW5eM/gzocrs7MGBjVQ6RO/N7t60xl4sLrAPUn8dBMBGEJXIRBJJyx8h0lTcSwB+qb9SNvvLL6yMrzUcIHhGgjyMDHleZRIXRtRRC0duM361/yDsYv80ewzViewL3dawS/pAcDbNUaAcuI4r8CGICkXUqWEto0xDW56lX6whs65yinhOgkN91xzR6UjH8Y76WhfhgDO0WPmubYZZH6Gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 552037a2-51bd-424c-3fad-08dede410027
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 05:06:29.1071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPzWvPgeXOIqiZ6WhGP7ue2hGd7fGB+w7um6o+n4eXEEZMP/wco3d0+dwPALtxqRgH6Ws6WIzvbFyZ+a5I+MGVyTa2RaVTOFZ8oBejW2YT+IKkyw9KK9YXylZS5oH3es
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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



On 02-06-2026 02:14, Vinod Govindapillai wrote:
> When FBC cannot be enabled because the plane is larger than the
> display  supports, log the attempted plane size in the IGT info
> text for the skipping reason.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

nit typo /s/detatiled/detailed in commit message , rest LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   tests/intel/kms_dirtyfb.c        | 3 ++-
>   tests/intel/kms_fbc_dirty_rect.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index b5de63350..48fcb6c61 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -108,7 +108,8 @@ static bool check_support(data_t *data)
>   		if (!intel_fbc_plane_size_supported(&data->display,
>   						    data->mode->hdisplay,
>   						    data->mode->vdisplay)) {
> -			igt_info("Plane size not supported as per FBC size restrictions\n");
> +			igt_info("Plane size (%d, %d) not supported as per FBC size restrictions\n",
> +				 data->mode->hdisplay, data->mode->vdisplay);
>   			return false;
>   		}
>   		return true;
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
> index 4187ee072..f025a57ae 100644
> --- a/tests/intel/kms_fbc_dirty_rect.c
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -410,7 +410,8 @@ static bool check_fbc_supported(data_t *data)
>   
>   	if (!intel_fbc_plane_size_supported(&data->display, data->mode->hdisplay,
>   					    data->mode->vdisplay)) {
> -		igt_info("Plane size not supported as per FBC size restrictions\n");
> +		igt_info("Plane size (%d, %d) not supported as per FBC size restrictions\n",
> +			 data->mode->hdisplay, data->mode->vdisplay);
>   		return false;
>   	}
>   

