Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03078CD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 10:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DB310F5BD;
	Wed, 10 Apr 2024 10:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2DufQT8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976E31132AF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712746279; x=1744282279;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DFiJaOO8c7dYFAf/bkuc5eQyhSmq0pJJW/4n/187AO4=;
 b=e2DufQT8I1TpnbPTPKPhTvVdgEky2YEt8OYKifTNWQz0Ayag3PdFMUlj
 pxyEmyTkBCgt0Ay0+L/nPnx9tCXRlpotZvO04eFGO4meoq2Iz4xwgL6Ii
 5rO8Oi6fAWTHWdQL6M5IrpsWjSixF12hFxZNH7b2VqgOVGwGWoP6g0IVy
 fadtAUSzVd6jOVPvcV0tNwVRU6BnQBUnB6jWsO5tYXCmof8sk7cNnfxlw
 gBM99NQNu62dMbbeE7+9vtIHsGkYy4oWN2iNM7TlzzByMVR3/YDFljXH5
 lbOIGxMxJptM9Sg6Y9lvzOiGvvSUHGghc0DMZwOIt10JT4gNlHlKrb0VW g==;
X-CSE-ConnectionGUID: wgSPP1zuQd6/C2cGu3741A==
X-CSE-MsgGUID: Q+jQtfauRa+lsNFvCqmrcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8277225"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8277225"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:51:19 -0700
X-CSE-ConnectionGUID: ZBIjDNtmSUm/dMQNuLugcw==
X-CSE-MsgGUID: UubNKRkkRfKbGTzT7ZbyGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25291127"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 03:51:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 03:51:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 03:51:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 03:51:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 03:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzW9blqQUx2xTC+6lhWHY+MpSvyFOR0zWx/lTmRqPyKNEyz9L2et/+j3gmuYnPrRwhDyK+aeLGhePS4y2WCV9u9h4vshOiBS+KCK99iNkJ9ebHEDwFyAcL20Z5MxFHee2xsrwB3tqP2YFjR3n+IIyeRy5r98ZQ3UaZ9uYR3UTZRQ8sQNLOir/piRDjk+G7q/ewxyHVDfTycyooeKN8v3WBUwO17cDTmP0QS3NNu0GJYcv7JqCE1E8LuRRIJ/qNj0l5swskD/0Nb1ClFX7orWjL3RVUJ2KWVAUrSUPBSy0d00cQcbzbEzU5nfiX/JV+qNlQV31KfjLppEJoF0XLSl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tz2SY1ipuONDZ6kzOE361Acp+BP1gQ3t47g0AWDEms=;
 b=TKW3uzppH0zUY15tqSqbr+QD8th08iSeDJhwXMVKMFOwScvO+21b3mbOOp2anj8nwENTgtC+8xZwuuivMYzcoqRah5JZLTiXSmZbrpJhH+LozenBhVl+JFsDx4sEpPservVjEgPrCrnbz0mlxHtPVNSbfNyDRm3VFo3AVrGcUnStnUh5VQ3RPaKAS/Xo9btN/HckRj351Vfz08s/WPaQGNI+JB+ZnhEq97WsEEXulRQp+jCTcXlhg6NvPGQljW+oYetP10RptDT94BYyhVVxbgrCmXAoVX8GfIviIdeA577wXt9Ku/R9qKPM2GutY6kUWJhmwy+l4IMuSXV+Z6G8YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 10:51:15 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 10:51:15 +0000
Message-ID: <999399c3-b702-4a79-b7a2-3c96654938ee@intel.com>
Date: Wed, 10 Apr 2024 12:51:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/intel_blt: Add functions which extract
 and check object ccs data
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <20240410100915.48541-1-zbigniew.kempczynski@intel.com>
 <20240410100915.48541-2-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240410100915.48541-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0288.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::21) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|DS0PR11MB7192:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1iMNCOmrePNLtOiEKX6z+uGFyHiXr5IbMg7PkeyKfOTekoB01ZoMGAAJThynQlQBrA4ekqMgTCnUHzplWbMe0tZIbcqDfylknx7gWy+/dgnskF3q2O35zIE78+RTo+6BhIejIUsa+JCAuKtYPv6YXGpc6gSETvrnoh29U7wBpzEZVb+zhQUEBHQENtjWVhh6YEqlfCJLu4AsDCBBvHcnkln0+Bw95NGhMUdpqbnzImfDRASYltBcmDIM5RxdwfofZxglmF33rgn1wITjo4c85MgX/KzkgjI85lZHerL2edLfk1HQqhiwADEPT1QbO1ZsI1FhdcgHkaYYeu6DpG2yZe52spfShhqH7vzDAdu+Df//xTDoE4xkT8L5GfZdcS/w8uEqKRWNiZCqmf229uFdFWMT958nQFNwhnuF8JkUtlPJn9jhxL0GCBpkpMWsBdAqpREJHQMHXdg4d4X/XT+zMAVBfi9XkwKQ4ZTcsHv8SGT3zUqk9qNqjl5T+txV4uTjwn4CMHFh9lzGt4HUPa7GXmom3PAz1FB+xvXEptr3fbk46iaaqibrpDEhaSEjLEbVXn/+oPHAnSPz5CdIplSgxipA4rXWE/sWykpXlphI7U6zlQ4OmCfHRwpxjaHU1u/gQ7F0UggJwmmPa49uMobJtcfRCCN/sLoU3omwgdPTFB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUFUSm4rT0VYWk96SkZoNElpbmlKOUhOVUxJSVJ5Qm5QYkIzZkpLUnI3bFA4?=
 =?utf-8?B?WTVaVHdiaUFIK0UzdmdNNldzK1ZwaUtaZU8rcGpGclo4Tm5SSXVkdW5VcHlX?=
 =?utf-8?B?UGI3SnZ4NUlKVnFHTmlMWThXS0VWQTZjTWhzYnoxOEQrU05TdGJLcTdEVERY?=
 =?utf-8?B?Nk5GRmV5dUd3Y0I5b2h5Z1NvcFE0cEdCMnZxektMdzNHT2dyWXlVTDZ6cGla?=
 =?utf-8?B?STJiTTk3eVh5Y2FQd3prbTE1OWVUcEh5aTdFVmU0WU9uRkduL0RteVBxaHBL?=
 =?utf-8?B?eXFZbUdCM2J4R1NJTUR3QklocUUxT2M2RzEzU1ZaVmdJYkNvUEQ5d3V1aldI?=
 =?utf-8?B?clhYUUlYYzVJcS8wMUlnMldoT21UYnZINFJ1cGJEVTFjb2ozaGJ1WkZURHlT?=
 =?utf-8?B?RFB4TVRVTk00MXVzRFlHR0UzcXVSY1NQQXdic3ZqVThQb2FoNy9Da1RYMFUx?=
 =?utf-8?B?eTlmSWVDTktKL0huSWttT0FsNzUwbk1DTHQzdXp5NjFnMGl2VXhFSGViMzk3?=
 =?utf-8?B?UmJTRzR5Z0lNUWhSSFVLbW92QUlydUE2ZmxkWVhhLy9kcmV2UjF6Y1ZhVkgy?=
 =?utf-8?B?dUh4U3VabnR4d0hNOXIxaW13Q2wyU0h1STNUS2YvNFh1Ykcvcml0aDZtUlVu?=
 =?utf-8?B?ZlVHZU42Y1VFNzFkczUrZ0h1bzRmeHJyZDNZKzZaTHNnN2ducTdNQUg4b2R4?=
 =?utf-8?B?MjNmcGdHanlQVEJvbW9ZMkhTeDkvcExEc2wxaDZZMnRJWG1iQWdmV1pUQXkz?=
 =?utf-8?B?RVhOYndrMWhXeTIzV2xjNWM5SGRLUzhZYy8wbFpYZlBGRE04UEhJOW15eGN5?=
 =?utf-8?B?TElYNjRhNW9LcUE2QlpRbUpzdzZIcjV5Vm8wQzNOYXBGRFdWZ0N6L3JmNkFO?=
 =?utf-8?B?VjhoYmZqb3FTTWJUNWpNY2tlQm9Xb0sremcyazdhWXptODA5ZHdiSjRGV3di?=
 =?utf-8?B?OE44SkxWQWliUnpJNExLTGdxRWFBTVNDTXRlTG8wZUZXcll4cVhKL0RiS0ts?=
 =?utf-8?B?eWg4ek5MTlI0RHp1bFcrSUpWcUNEQ0Zkam5Na1VXZ3hvMCtKbTFQNG5zSS9x?=
 =?utf-8?B?ZWJxYTJsRDhVaWJDa04reVdDYVMwZklkWGxFcUk5eWVYT2c2TnMrcXFRTGI4?=
 =?utf-8?B?VU9EN0UweUtqbnlVZytnQ2Fqb1NqRHd4RU9Db3JMcEUvanhMN2xXN3dETlBk?=
 =?utf-8?B?Zk5TS2U1cTlrL1psT2pXUXBBaFRmd3U2ZC81ejhnSmVFSmpkSWw0cTRkaGxM?=
 =?utf-8?B?Y1c2ZCtibjlVdXNENEtaMUxVQndJQzZzYU02VVFPd0pFZFlza0R0SENjWFpi?=
 =?utf-8?B?czNwYmhIM3ZoSFBPRzBqcCtTTkdxakJmazNqckZ1bjBIeFg2M25tNVl4TStY?=
 =?utf-8?B?RHFZazhKLzZSeW5pNlNvV2ZvWHNXSlBLWTI2M3Y5ZEJPcEIxQmhYUHdGV0dl?=
 =?utf-8?B?Ky9hVVFGSG5YV1BQMXYxaC9wc05vWmRzdG1DUFFQSk5ObHVKUURraG9OQWFa?=
 =?utf-8?B?OGhYWGhkanJXelBDZy9zMGUzQTJyVEQwUTI4VHIvVXF3U0pXTTdtdGh6MDBJ?=
 =?utf-8?B?UTBpODlockJ0anNlZ0hsNFFTd1paTUI5Vyt3RE1FcmQyWGF6QndycVNWMTdu?=
 =?utf-8?B?aHlsM3E4N0ZkWmtMMW5ab0xiL3pONndBS0ZMRkNsaVZUb0F2R0tuazF6U0NT?=
 =?utf-8?B?aHo2MGh1RGpZWDlCTTNEem94c2pjSzlIVzVkQmR6cWh1NWRONllHM3BNc0hV?=
 =?utf-8?B?bExoeEE3WDZUMm9mN0J2VlFkNmRlbzlnOUpGYTdaNUcrS2ROWCtId2RUTlJJ?=
 =?utf-8?B?aUJjOWhOUk9IeExBMTZob3dDMjJmK3JKYU8yL1pMV3JKTEp0U2NlODVLbzVX?=
 =?utf-8?B?dXlaMWxGai9RbVhmVklyY2NkUk51UFdsUlVUd3JCYTJFMjNmaG5mQjkzWlhY?=
 =?utf-8?B?aEZDN05pVDhsSkFsUUxzU0F3blo2Sm9URllMaWowckZMMzNUbFRveEtRaXVD?=
 =?utf-8?B?dHM2bCtOeUwwc2xjZHljUUVmQW51a1RMYnhuMTZ6VDJ5NnJJNDhqYnIrcDhX?=
 =?utf-8?B?RGZIWFpkNnFINkRhaTZ2cUFFOVpNZVBidy9FcXV4cE9aVGVad3gvaytvbS9I?=
 =?utf-8?B?djN5VjFvNnNsa3d6VzFoVFdKUlVOMUVuVDlpYTMwb0NZM0Q1LzhCc29MVTha?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afdef73d-e5c7-48e6-d766-08dc594c24dd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 10:51:15.2463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UmgIAhuHEQHtJN0NGlCFvjiDBT6jBw8godNMC6Akzmh1ti7ugPcMyoQf0htJx+v9Sb2mHChB399qhgJ+i91EA1E9J+E8ainPgZQgqFWM2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7192
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

On 10.04.2024 12:09, Zbigniew Kempczyński wrote:
> In tests which use compression we did very naive check in which we
> compare source and destination surface. For linear we could expect
> differences are related to compression, unfortunately for tiled data
> this attitude is not appropriate due to natural data layout difference.
> 
> Lets add helpers to extract surface ccs data and check if such
> surface is compressed. Function which extracts ccs data is defined
> as public to dump such data to png in the future.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Looking good, thanks for addressing the comments I had:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
(applies to both patches)

All the best,
Karolina
