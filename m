Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E36103A9A8
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 11:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA0B10E6C7;
	Wed, 25 Mar 2026 11:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BePB+GQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFC610E6C7
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774436784; x=1805972784;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=NsFNbrrDnzxXD9GSbUgCSoaM98//Xr+bG7gP5xwnS9k=;
 b=BePB+GQEOsynJ5R+QRpEWc3ks0GZ9s5PCLya5TkkUxLMy4HvIPdAQPnl
 3ieETvFpyrwaXz9b2fwoi5BEXRQppavCkUtlMw+2dDY6dj4IQQzvA/hZu
 FxP5T/ISQJzE0kNZVYjxzj6hOv/1CJEaZHD8eEnx8ZeUtwungsxvaIDTP
 1/WgbQQPQw1R+6eEjwdMq0FJRWfQ+EMZenaiGbuFFZtBmWa2ByjyGLd9X
 grFj7UX+cv36HlZdQ4pvG6GzOGYKDPyM2lFVIDr5iAdFxd6Tg4o1wzWyu
 ivwwYoA/dnK/vXdR4a39xDYsuhdnxLcYVY3pAgXrK9ZvPaeBK0z0Wvew+ Q==;
X-CSE-ConnectionGUID: TpLJ+fKeSCKZcBgI4pyOXw==
X-CSE-MsgGUID: WVCHSS/xQ8eAMi0nvfB3Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75352721"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75352721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:06:24 -0700
X-CSE-ConnectionGUID: GL1Jm862Qw2LKheFbf5sSg==
X-CSE-MsgGUID: GFArb3LpRPSLcLP7JMjj7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="255151055"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:06:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 04:06:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 04:06:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 04:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAQpyNczpDfhi062GifOYn0d40vj0jhfzAvMlVJldrT1tc72oX+9/nmx99OImJgsKenk+vpFf0d7ytMighy5yI+rKDZ8U/3EqSi7NgObymG/pOgRNsXP2GfTfZU3PAzquAF8mFxcBCDex1TeNN4qKXVQ6D7m4EZuO839sAWjU11567dBaAn13lXtfV7GG+ya5+cOz4RqYx7BeINYXudKsW5cXF1VB0YSks3tRebhmiDm52mtrz74ixPXc6iyxFZHHgjKPBijLcJXhpLM1PK/L41UqmdIuW8EkA9vLOZVT2dQjgOExciAyTOCNuzZhxXpSn+98W9nJ8xvmwviRP2VPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d12Y/2hk5cGlj11vV0QRonVhPmq0hHWeZZFXq31GOGM=;
 b=DlD3UpsW//wcLcPE4MR6M7IRiJdyLq4zd8cduX233enWYEWl81ZXgtujy2rLv75B7/fQTtdRSBN84BFZH+bIoOjExrtTecrkWrpj3X9H1U2PY9sn9RvflEY8UmYhKAauJ38sATEhCDtNnDP5Npddio77aHxrhD/Mnx2a6DTwuqUHUOmq0T9PamVjfpp5+NmJQufkocyKQN5ED9u918fr8jG3DbR4WyVCc3rYIR/cL0UJ0uvyacAz47w5qxt+kAXSRLfJ4VwyVCxnJIKveUkYKtzcZUMri8R3JtKXkRip9jgq8G4iBErG+MOkyYX7T1zFlHqrBHLCqfcsaKDZEiWnFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:06:21 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:06:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 25 Mar 2026 12:06:37 +0100
Message-ID: <DHBTCJFALZ0Z.3GOX4M735FWGI@intel.com>
CC: <jeevan.b@intel.com>, <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v4 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260316114708.3342278-1-mohammed.bilal@intel.com>
 <20260316114708.3342278-3-mohammed.bilal@intel.com>
In-Reply-To: <20260316114708.3342278-3-mohammed.bilal@intel.com>
X-ClientProxiedBy: VI1PR03CA0052.eurprd03.prod.outlook.com
 (2603:10a6:803:50::23) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA1PR11MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 07bd96ac-7965-403f-8d4e-08de8a5e8bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ZVaxRnQ9W+sdMK0RdmRjZDtHGqWlap5T2y/6a2kbvY8SOu1FHsLbebj9tuXyQoVPzNDWQb/aR3DdMpVxYPEPPCMV+Wj7w0EfBjiRWNQGJ+ui/3yrjrKZ8R20DM9Msu/cZypkuLQ35vz7GkBz7eTPjEmvzi/hGie4+fWVOZdokvDZz6sI8NLbE74x1I6FddyQ9mqz/RsskfufOmWisjs0KIWDgh5jrhV0rmgR0KlxuY+SIKRdYnh8NDEvCPTYXHF2ALrzf/8R56C08ZNzP1ixVFMSV9EnhmMvSb7gmyrPs4zW9qVS1MAe2ezKHFJI6vcDHG4tdOUD5mDHa2r/eHv2ulN8ZYlZHlgiSKqcOb0KMeerJ3lDnrgQ5GIFDC03Km2qKLoSHY3/tR1C+gwORA3lhnno2DKy4yX9a2zKn93gql/77pLnnuyAg0yaTyPIdMW1ZTclgMitSIE+z7MIsrasRfEIYGcIHipzBMYQNwAdw1jUkXKLtu6VbrTm1iX3GcGgmjvS+M4omn/0kOBhmknvmlWKSAl2Gzo0Eolu9VXaBkwrQ9D9aU8bWdVPa1IILZ4F0NEn21/Fqj5iKmqlk1350MHCFf6HrdZapzIwE0QDKgLMlKFrgcEmtO0xsISAp0CIt9Buwbn8iaJnI6Fk2oVR9pefHFsNsb8QNhm1EzzkeDoZOlpIZ3IFhND5K6DuHKtK5DozweVL5Ft2k5YrWPubGeX0S+I12ho4TOSo2WESqUA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1NWM3dwMmV3STNGMHZsRVZPaUo4VklPLy9NR1k1TGVFUkRCMmFWdXNKWnZk?=
 =?utf-8?B?WUlrVi9sMnJDaGIrRlhMNXRidnc5bjlVTDVrMzZmcVBoN2FQUkdoZkZORjBC?=
 =?utf-8?B?ZDRidFBtTjEramppK1dyRU9qM3NJMmJvRWlSdU5pWFdVQ1J3Wjk1eU1YZmxn?=
 =?utf-8?B?SnVjd1ptYThOd2ZnTWhtMTRJVGZBdG9ycVM5NU1kZ3NxbGhvdW1SZHkxMnh1?=
 =?utf-8?B?ejBMSEpyME5tRkFLcDcwQ29hQ1lPbnl0ZmNFM2RNZDg1OTU4N2paQUw3NkEr?=
 =?utf-8?B?WU9zdDNUUWF5UTBhbVh6czU5cTRzN0owSUpXRjVtdkVxMFA0VkdITk9LMkt0?=
 =?utf-8?B?UUZTdXpycWFFU2NIMUNuYkMyZ3VsdEY2RTVsTnZPOElFN3BaNkN5MlBnYUcx?=
 =?utf-8?B?eUxlRkFlbHRwTm9hc3hoQVFWaHN2MkZOYUtVNTBzWFkyQmF2bndFb2VHQVkr?=
 =?utf-8?B?ZVVCOUlXSUlyWVo3ZHVtVDhpdXFrSGo0SjZ3cmU4V21NY1RCS3F1SW1GR0Rm?=
 =?utf-8?B?VDgrQWEvZDM2UzN6WmEveEU2bTJwT3laWTF2WTluS1YzblBkVDNsdVhyQyt3?=
 =?utf-8?B?cW5rVjhqRXNWZklrTnV3UUJzMmQwK1JiRWswTWRkeUJLUHlRcjIrdXg4REFx?=
 =?utf-8?B?MGZsTGtxbzl6Y1QwMHZmaWpvQndYRGU3L01KM3pSNjVxVGFLaTNaYlFtdW5n?=
 =?utf-8?B?UUVuMnJRMkpWempsZllycjdTZ2pzRXRRVVk5ekF3OXJ6YnVOR2hIZlVQTHly?=
 =?utf-8?B?MmRYeGdvb3lGb2IvOTVleDhsMDRJdS9qckdZTjV6SzVzblVBV1NGeGNxRE1N?=
 =?utf-8?B?QUJxemlueFFuQmt4SUowT3piY25kaENtamRxRFVWb0FWU3FxbjBsci9CbkxV?=
 =?utf-8?B?TnNJQnl6MEpTSkpwTlo1TTMvSE5MU3pVaTZkQ2NhcG53ZkVBWmJlR0dYdHg1?=
 =?utf-8?B?V0VoVUdoc1I0d29tb0JhbTVHSStONDZZejJvMUxrWEdPRjhpdlpRVmM4dXpW?=
 =?utf-8?B?VnZRY1k3RXIzZzdLNFZWTDFIT0VtcjJmZ0RpSW1PeW5SdGNUbTRZbktmbTZr?=
 =?utf-8?B?Y1lENGI1STQ0Rm15b3Mwdkt2NW96ZGJFSDZlNkFPOThjT2QzazJpWEdBa3lr?=
 =?utf-8?B?bXdJYW50UGcxOWI2TnA2VFJzWEZxSjVGMW9iN0lLMllaZ3ZFeURwcE9JcjJo?=
 =?utf-8?B?V21WY1gydEtPVXhuQzRUSG8vSEZuazZSdzNVaVBBM0xYLzUvNTFUU1FTMG9u?=
 =?utf-8?B?NFR0T1NrWUJ2ajFtQTB6WXNZWnU5dzVENGJxTVI3bmxySEVBZVN5UFRVRWtX?=
 =?utf-8?B?Wks5cVVwZUNDNTBkTHM1eU9TMnYzZTV1K0U3c1BVNlRKSG1CVkFVVE9WTFFa?=
 =?utf-8?B?aDRVYnVTS2lCZXlZNmV6L1pFanpyN1lOOEdnc3FWdlVtOWZHekE2aG01NFNu?=
 =?utf-8?B?bStZSnFlS280aDRDVE9tS3lvQjEzQmxuTDZ6L1BXakE4clZGNS84YkxZaE9j?=
 =?utf-8?B?UGUyK095b09JcVczWkcyOWRacFlETjNUSDlQZ2N6Q2RsRk41enBTeUlETTZs?=
 =?utf-8?B?TURrUFVDR3lzZnNhK2lnWkc2NlVpSnRPUHhTMEJIRHVpUmlBVS9YMGhWc0Q1?=
 =?utf-8?B?Q2dyYUovbTdFeWlMREtDUnowcklGOVQ2WDB6ZUQ0b0tWMmRGdmdDYm9XZXRs?=
 =?utf-8?B?VllpWmtoYzlTVlFteWZHTGlkRnppcHZ2citsTk1XRVJqdm1IWmlQRGNoNm5r?=
 =?utf-8?B?Vzkxd1NLQ0pqNXc0ZVA4amdxMHAyZUJEU1IrdmZNbUlHeFV4Rk9NWlJ0ZWNV?=
 =?utf-8?B?cGtXU3JBQmJWOFNncXUwL0xZMjVRSm44SW9ITUFXdEcvOXBIbGtUNjVtd0Jk?=
 =?utf-8?B?UGswMDNSakhxUUlmeTRzWElJSlV6T1hpV1hiOVFrSlVDY1lxQmlGdnVGaDQy?=
 =?utf-8?B?eVoxcy80Sld5RkpQaHFpUllsSmhoNDR5eTVqa1V0MW8xalNudHc5dEJ6RW9r?=
 =?utf-8?B?UzV1dWNmYzE0MGtMeGhWR3NFclFQb1pWSUhyUjJGWDNtSTlSYUlBdE12VHFl?=
 =?utf-8?B?djliTWk4YnB5ejRCZTdwTWE1bFpLaC85WVpjb09HaCtDdU91L1k3OERMLzBl?=
 =?utf-8?B?WnhWQmlVY3U3bW9rZ2RRempHSlBpV1RybDRXREx3ZnpwdGk1NFFHNnloaUU0?=
 =?utf-8?B?dnFlcTg4bzJhTjBqNU41dEdydWFuRWJLcVVEOFJPWVJnaHJJMllmT2pZQ2tj?=
 =?utf-8?B?SkZLbUY3OXBqL1dBZWQyemRWUlZoUGcyQURJelNxS1VybUFKS2tmK0dLaXVw?=
 =?utf-8?B?ME96MW0wZnNLbjlyTXNVVkhST21hdFdnL0lGOUFZWGhTR3VhTVJGSk9hdGtR?=
 =?utf-8?Q?gecyG+7KXBaBRTls=3D?=
X-Exchange-RoutingPolicyChecked: PeqSgn1fEg8BVRCoOrhHiuFXRpGRelZ5/o215sytiPNKxAgCoI5JqxU4RBE/Up/35zG6nYAyzlrsya+RUi0QIm3+02HILZKfQ+5feeTnSGSSagn38UdMSEj2v82DWhZVWr2cOjV8GqsnbEAEc9YbJrXj5SSiPJHpzzzuTCfGjuP5HxnvaJ4d4bKdUGjP3nW04WJyX7borq0ZGubZQKz+3c0NqrAz2s96AZjqmLuaMUxRjd8sj4fW7ceYY9PlMl1JbJa0gh/jKUX0kCayolLjGC2donJoFVJiXpmlVBPl0mTJdJQIEYMI7ORJGNjC2ADcu6fshhrvFxu4xBPfDgL6EQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07bd96ac-7965-403f-8d4e-08de8a5e8bd1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:06:21.2322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qH9xrT8C+XzRyOPvGkPDoB0CviLcxNisNOPZfoPNpbuyZAbUM07kTNPAnoJvMdS3NUCjVPqHGy5zgp7MSGqsbzz2M1rGeAWZlNaALdfCy9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
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

Hi Mohammed,

On Mon Mar 16, 2026 at 12:47 PM CET, Mohammed Bilal wrote:
> Fatal assertions can bypass cleanup paths, causing resources to remain
> unreleased when failures occur during audio tests.
>
> Replace fatal assertions with non-fatal checks and route failures
> through a common cleanup path to ensure proper cleanup. Exit early
> on first failure to avoid testing remaining combinations unnecessarily.
>
> v2:
> -Refactor check condition (Sebastien)
>
> v3:
> -Update assert logic (Jeevan)
>
> v4:
> -Fix memory leak logic and update commit message (Sebastien)
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 56 ++++++++++++++++++---------
>  1 file changed, 37 insertions(+), 19 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_=
chamelium_audio.c
> index 2967e3c50..2f17ad91a 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -389,11 +389,11 @@ static int audio_output_frequencies_callback(void *=
data, void *buffer,
>  static bool test_audio_frequencies(struct audio_state *state)
>  {
>  	int freq, step;
> -	int32_t *recv, *buf;
> -	double *channel;
> +	int32_t *recv =3D NULL, *buf =3D NULL;
> +	double *channel =3D NULL;
>  	size_t i, j, streak;
> -	size_t recv_len, buf_len, buf_cap, channel_len;
> -	bool success;
> +	size_t recv_len =3D 0, buf_len, buf_cap, channel_len;
> +	bool success =3D false;
>  	int capture_chan;
> =20
>  	state->signal =3D audio_signal_init(state->playback.channels,
> @@ -426,9 +426,12 @@ static bool test_audio_frequencies(struct audio_stat=
e *state)
> =20
>  	audio_state_start(state, "frequencies");
> =20
> -	igt_assert_f(state->capture.rate =3D=3D state->playback.rate,
> -		     "Capture rate (%dHz) doesn't match playback rate (%dHz)\n",
> -		     state->capture.rate, state->playback.rate);
> +	if (state->capture.rate !=3D state->playback.rate) {
> +		igt_critical("Capture rate (%dHz) doesn't match playback "
> +			     "rate (%dHz)\n",
> +			     state->capture.rate, state->playback.rate);
> +		goto out;
> +	}
> =20
>  	/* Needs to be a multiple of 128, because that's the number of samples
>  	 * we get per channel each time we receive an audio page from the
> @@ -447,10 +450,6 @@ static bool test_audio_frequencies(struct audio_stat=
e *state)
>  	buf =3D malloc(sizeof(int32_t) * buf_cap);
>  	buf_len =3D 0;
> =20
> -	recv =3D NULL;
> -	recv_len =3D 0;
> -
> -	success =3D false;
>  	streak =3D 0;
>  	while (!success && state->msec < AUDIO_TIMEOUT) {
>  		audio_state_receive(state, &recv, &recv_len);
> @@ -460,13 +459,21 @@ static bool test_audio_frequencies(struct audio_sta=
te *state)
> =20
>  		if (buf_len < buf_cap)
>  			continue;
> -		igt_assert(buf_len =3D=3D buf_cap);
> +		if (buf_len > buf_cap) {
> +			igt_critical("Buffer overflow: %zu > %zu\n",
> +				     buf_len, buf_cap);
> +			goto out;
> +		}
> =20
>  		igt_debug("Detecting audio signal, t=3D%d msec\n", state->msec);
> =20
>  		for (j =3D 0; j < state->playback.channels; j++) {
>  			capture_chan =3D state->channel_mapping[j];
> -			igt_assert(capture_chan >=3D 0);
> +			if (capture_chan < 0) {
> +				igt_critical("Invalid channel mapping for "
> +					     "channel %zu\n", j);
> +				goto out;
> +			}
>  			igt_debug("Processing channel %zu (captured as "
>  				  "channel %d)\n",
>  				  j, capture_chan);
> @@ -489,6 +496,7 @@ static bool test_audio_frequencies(struct audio_state=
 *state)
>  		success =3D streak =3D=3D MIN_STREAK * state->playback.channels;
>  	}
> =20
> +out:
>  	audio_state_stop(state, success);
> =20
>  	free(recv);
> @@ -587,6 +595,7 @@ static bool test_audio_flatline(struct audio_state *s=
tate)
>  	recv =3D NULL;
>  	recv_len =3D 0;
>  	amp_success =3D false;
> +	align_success =3D false;
>  	streak =3D 0;
>  	while (!amp_success && state->msec < AUDIO_TIMEOUT) {
>  		audio_state_receive(state, &recv, &recv_len);
> @@ -595,7 +604,11 @@ static bool test_audio_flatline(struct audio_state *=
state)
> =20
>  		for (i =3D 0; i < state->playback.channels; i++) {
>  			capture_chan =3D state->channel_mapping[i];
> -			igt_assert(capture_chan >=3D 0);
> +			if (capture_chan < 0) {
> +				igt_critical("Invalid channel mapping for "
> +					     "channel %zu\n", i);
> +				goto out;
> +			}
>  			igt_debug("Processing channel %zu (captured as "
>  				  "channel %d)\n",
>  				  i, capture_chan);
> @@ -661,6 +674,7 @@ static bool test_audio_flatline(struct audio_state *s=
tate)
>  		}
>  	}
> =20
> +out:
>  	success =3D amp_success && align_success;
>  	audio_state_stop(state, success);
> =20
> @@ -776,19 +790,23 @@ static void test_display_audio(chamelium_data_t *da=
ta,
>  			audio_state_fini(&state);
> =20
>  			alsa_close_output(alsa);
> +
> +			if (!success)
> +				goto out;
You've slightly changed the logic here, and the test now fails fast. Since
you've explained this behavior change in the commit message, I'm fine
with it.

>  		}
>  	}
> =20
> -	/* Make sure we tested at least one frequency and format. */
> -	igt_assert(run);
> -	/* Make sure all runs were successful. */
> -	igt_assert(success);
> -
> +out:
>  	igt_remove_fb(data->drm_fd, &fb);
> =20
>  	drmModeFreeConnector(connector);
> =20
>  	free(alsa);
> +
> +	/* Make sure we tested at least one frequency and format. */
> +	igt_assert(run);
> +	/* Make sure all runs were successful. */
> +	igt_assert(success);
>  }
> =20
>  static const char test_display_audio_edid_desc[] =3D

Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

