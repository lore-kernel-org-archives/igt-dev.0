Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D98FCD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 06:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145C810E051;
	Fri, 15 May 2026 06:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jb6QigGV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F6010E051
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 06:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778824979; x=1810360979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=afz0CdZJrcZOStLx9CiYLl+ilzJT/46Y1VFVKKPXegY=;
 b=jb6QigGVDFysymeANuJWCOaHtn45WVeA5Tieh8qhaNB5TJKbE2xXDVXT
 FHV12Jh4pdol9k4ih7YAnPdXtS8C5h2uAvPjY2T/WQpN5aHYglaTjgEOm
 41As8dQpp8o9ijVvG9eqRH5r3+t9eKVFPbaZwgpSr3r+zgUsPEvqf73Up
 MwcDtlScxH8qJ+0q2EDMoop8VBoLQKyefh5f1RrShDqFmtfAD2PBgxj2k
 zljF+ylz1pLCtO6ugkSNKP6ZZUF7fESxHOaFKT6jweHgHVksfKsSO8Q1o
 QQc3m1VytsWtB6h+tr8AcrefjiWy+gP0oeoa0O4X3Efe5UR1eKnjBvW2w A==;
X-CSE-ConnectionGUID: mY3oMZ/tSR2wTXsoKdi/PA==
X-CSE-MsgGUID: 2MIEBlGRSnO110MoCt6eQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90879176"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="90879176"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:02:58 -0700
X-CSE-ConnectionGUID: 88A3SuvxQ12MOUhV6PQaGA==
X-CSE-MsgGUID: DffivImKQfa9kYTOSMW/OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="235556548"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 23:02:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 23:02:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 23:02:57 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 23:01:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfTgFupbabBKISm7RouDuAElEo4w8dEC8D2E7RwnQzSPlh6YtCXev3sKXLo3qvU3+bmqQPtqvw0epaAoved13gbqdUU/hy3/FccPD9RgLx+lCMVpW4MzNVrviGjnb9mwknE0eLhuWFzkIxhVyYk73WET7HtiG8JNMXkf7Oo596g41nEKeoxZNBMKyXmLmef2c6jd/N31qS4DKDCK/bKW84ghQI/9UU741N/lLWS3b1UlGFEUR0mucohpb38Acw1yZ9ZHpuFcSSh7lcaywD8Cw/cpRNMw9NdHSkZZSorMmC1Sy7XYnp0UNwas4HNiq6o9KheMmIOpILKywgbnsF5oQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cs3HnVWALnvIPog4WcaBYrWVKo7IPDGgPRAI6PwP4hU=;
 b=g4O76mlhNYypacoI/vnn3ziWSfZ8ImDBF0cesJamyJq754jvkcvgdbCkvvU7Hq8Gr+NSwzc4yzajpvMGmRJnV0oEuQwEtCJVFZMIyX54xhr+p8czac1T8EVZ+WSCJy8/CCYf2QXgA4uD1JIy2ceFTUQl2KIsnFAgDC/1oeQrTekOHuToqYqMlB+6DcbxqNrTKiEOUaCx/bIw87tvSFLICI1DpNY8wEj25nYZSRYNyfZVYHiOGFpIWXxLp5ff+YvqNew5lI1Jkk4sAxkdkXtinGNtjg+r4WAHjvU5AHdXuMMSiXtG53av8IOV7JpPVtNTpAR4LaCzHTHctGxLqQugdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DSWPR11MB9690.namprd11.prod.outlook.com (2603:10b6:8:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 06:01:57 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 06:01:57 +0000
Message-ID: <80306d21-0df5-40ca-9a76-3ad59d326f50@intel.com>
Date: Fri, 15 May 2026 11:31:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_pm_backlight: Add
 brightness-with-suspend subtest
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <suraj.kandpal@intel.com>, <swati2.sharma@intel.com>
References: <20260513062208.683004-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260513062208.683004-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DSWPR11MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fecd61a-bee0-4af2-7ece-08deb24778bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|1800799024|22082099003|18002099003|3023799003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 5++EaYGCKgEM19OD4LODehi+Hpfy5TR3ZDIaUFIgHaSQEeHIFtSepguAx+cuNdTg/sKjgPIErRZOcbzm/eXFjRbfgzudgKQagPtz5Wnfk5lVeBDuiHLyxZYhUSAu4vvL8gvpDBha0SB9YMul0C6Mcbjdl5XFc4qCCmvrbD6mHyKH9NXEpO1efBwQDSohwdWiJEOgrjb2n361mz73Hs2aWm9Al8kP890Lfc3VIkyNALIAO8W1ATQa46YKWUHCncstZUD4dQHXIi/8Hev/+rbdaKgToedUr8kBsWXHlTvn4v/2ylGR9zZ9jv26iFST8Z0u2qjoXfopmVB+vriB4yhwnPF+HJe6kaGT1TPPPQS0n0wJSJj18dTxCZdRA3f+PWeB6uHiOT+IExjGFv0o2srtvmSCPKiv0o72W5fpTx86CtD6Ng43iqZ5+Haz4CjLWBX5YOH8e2TUHQh1Cf6TDBEzK3FfB629+HlyzrAE9GNHnQottemEQ8qGdlmjVJwWEEcxD68zyHZZWxBxLSNe1AX/XbtDM+gzeOH/meNjXXx4DrEyMdp+4thYd6TwK8NuHshewQ2fIgQNwH5R8N0GBZKEVDzBdHCOg1Vfwr8l7c2FK10MneJ9pSbTA9zw05ksDX5PqML5PUeBHQgnja8eygrlvAMwgtnEnVa6WSYfnFrWA98i2rWaDtIL282/KFIaI6nu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(22082099003)(18002099003)(3023799003)(11063799003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVlOZlBVdTZ5UGVKMFo2RnFyL2FBd2o2YlBTVDFpaHJ5OEtwVXM0dVg4Yjhm?=
 =?utf-8?B?RnRXMVlZK1B6c0tnbDNNeGVZckw3SXJwbTRkTDdIM3VwaVY2cmFHS01lTys1?=
 =?utf-8?B?emxmRWp4YThIQ3JkME43cUJTQXFTRVJLZ003MGZSSFVDb2U0Rm11ZDNKM1NS?=
 =?utf-8?B?YWt3TGRpQXMrUUxzTHZwKzNGRGUrTE9Rbnd1TmMwU2J3dUxmeURLUjVLTWlz?=
 =?utf-8?B?QVdkNkpNTWt5TVFhcVpsMGY3U0crM0EvRU10YzVIblBBQnBIeXBoNHJJMjFa?=
 =?utf-8?B?UzZRT3dwOTFHQW9nRW5teWRPckJqMnlseTNEZTBOMElzNTE4eW42bWhRb2ph?=
 =?utf-8?B?M2pMN2x0ZFN1cDZiMjBBUUV1SGpkUjJBVlpJS0tvcVJ3dmNaT0JQWWc0T2NN?=
 =?utf-8?B?SGQ2dlpNTm1MbDNSek1UWUluaUpLRER1d0dla2xwVThOZnJ5NXJ3NTRuRGdu?=
 =?utf-8?B?RkpZT21scXU0dStsREE4T2t5V3ZXOGRaemIzRm1OT3llQUswUUhYN2ZZZXdn?=
 =?utf-8?B?Qng3ajZZRG9ISEs3OG9MalBGYk1XYVF3ajB4MzZuWjd3VlRoOE9SbVVRV3Jj?=
 =?utf-8?B?NGR0SkZPR0l3a05KN3hSUXIxYVBCdjlBVDFhZHRZNGxZdEU2elUxZS96dGJJ?=
 =?utf-8?B?Vy9uOE50c2NrRHBlVU5VR3VzNTVJZmUyY0psRTREcU5wTW1lU05ralVsV2do?=
 =?utf-8?B?K0VOMlJKMXdzV1hsNExEV2gyQnJ2a1dXaEtCaDFORWVrYlh3RUg5QmkvQmc1?=
 =?utf-8?B?Y3Foc3NYZ1BUZmNvenVYMys5eFYrZld6b0drOWhhQjd2QjBhU3h5NTFSUzRX?=
 =?utf-8?B?K3NVRDlrSzBwM0UrVzdha0pkNmttNm9sVEV3WERmaWlYamE1Y2VmT2grU05q?=
 =?utf-8?B?WVRRaHdNZnloaFROSnJqYnV4RUxFQ1BFeE5MVWR3NjJSUC91a2w1VE0vUlQv?=
 =?utf-8?B?QmJDTk9BV00wZE40d2tWU1lrem8yQ1MrTCsyS1ZENXJBQ1lxMDRNQnNITWJO?=
 =?utf-8?B?d096VVFmNHlZaXBoclJVV3djTVNUbkRxcHE0TW5yT2s2R0pmVVEvSGNkdUwy?=
 =?utf-8?B?a0N0ZlVIbjJqeVg3amxBdExqUGZ2THQ5WmJkZFdBeFlLUWxvNXVPUnRheHhV?=
 =?utf-8?B?SURXQW43YzFLaDQ5aFJMWXIwOUFYQVhvV0tmeTc0a1VaUXpuMGlTRnB0M280?=
 =?utf-8?B?VzVvQXpYV3dJOCtHd0JZNzdzRFFiLzdBRnFVdlU4RWsvOEVZZHppZ1NPMi90?=
 =?utf-8?B?d0JIQVVUSi9laEFjNVF5RGtQWVNBUHFwUUJoUGpSMmw2VVAwWmxCcnBPOHk2?=
 =?utf-8?B?MjZZY1hRd3BvVjJIYXJqdmJ3enhOaTNtVkEzalVvK0FyNjZmSGRsaS9nVFJh?=
 =?utf-8?B?L0laRGorVjFNZmYwNlE0NGtxdlIzL0lXV2N1dlo2UXNUYjkwL1lnMFg4QmI4?=
 =?utf-8?B?d09jV1hwVHY5Ui9KZ3cwNlgxeHdCcVVsdTQydzNzL2xlVDJzMVNtUVRRZnBv?=
 =?utf-8?B?NTVvMFV0MG9uU05zL3NFM2hMVDB3dllqK2FRcjJGcWdTR1p6UGMyWTdybS9E?=
 =?utf-8?B?ano4R2pkUFYvNCtwZ256eFczcGc0dHk2cERsMitzMmtLV2VINW9sWlpQRDk3?=
 =?utf-8?B?OElBZFQ0Q1gyUGZyKzZmL0tMTFdvNDB1TGlIczhGTFVXMWNUOEtmOWhrWnEz?=
 =?utf-8?B?ZCs0ejkvbkxIMGI4cVRlR01JQURLUDVLVFJocENiVDdTMWMrVWlmd1dqQ29j?=
 =?utf-8?B?WFZKNkN6U2ZKdVVZbVVwdnUreTVONUlnMXVldWFWWlhNcGFDMzFBcURXbG0v?=
 =?utf-8?B?Vm1LNDQ5cmN3U1hOdlphVnRqejdKRjhaUGJORlpyVDBBRjV2YTg3czQwRVhL?=
 =?utf-8?B?NTFZU1BlalVRUFFhUDlVNzcycjkyQWU3UThKZ3lHYnZUeW5ZczNFTmhSRlVp?=
 =?utf-8?B?NUE3WXdOc2diZUhPLzBwNldtaUxORHhTTVdtcEp5dXFwNS9VWExZM1VtUGNz?=
 =?utf-8?B?YkQ4ZUFxWHBmOFVueFRpdFR2Z2NHYXpUWVpGMzlBMVdmUE5uTWRNUXV1bExq?=
 =?utf-8?B?WVQ0Uk53NU9PYzBtcDZKRjhCNmN0Vkl3N3lRYTJGb1dWWkJ1eTZVMGFNTmRq?=
 =?utf-8?B?TFdmRExtQXBHZVNDcW5aeDVmbk11c0JGNHkyWE9RZHJPMDZEek1heDZ2UzEw?=
 =?utf-8?B?SCtNL0prOFdBUU1SbXBjTmh2elB5dUNkVG5GY09uR01iWkdXcTA0ZkhObHpM?=
 =?utf-8?B?T1lyTjYrRkl4Q0NMeHhFTUNSN3NLSUxUSFlDUkZoMUJjSnJnMUZIYnBvOWlx?=
 =?utf-8?B?WEJSbzZhYWh5OGdDQ3lQdTZDSVoyeE5LYmtLVFdLOWtLWGJUNStVQT09?=
X-Exchange-RoutingPolicyChecked: mGzXJUHpyYnhWSakZdZCWamjr9Bq71XYaaPuEJpAtNBgKksPq7U+wiXNScczXyXfj94nEjLGHwnRB3wmOSvIM4Yo9gjUAAGNpna77Z8ajyEhlRV9wXzJaq5Gni7rVPBvZsDMTJZ7OKrxpOEa1KTZO+T8Y7TPmPdAXK9cP6M3L2xgx6e15H9BXeVE9jklwrXNQJ0Mwmq5OXU47PxG8mjtuQUgOqnlY4wu0PsruCHDT/Uste9UzK9lcah2J54Kbqj09fKfgUUeOMWPPHo4jtqgT6KGfFA8NkRnKMG57qaK5tBUqSnL5XTrRk1hndx+LlVztpMNIrdYxsyGvcA4+C99kA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fecd61a-bee0-4af2-7ece-08deb24778bf
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 06:01:57.5048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5fHtggLyaJDt5EPqp9I4dJcLWucKDOz7OqWxXAnbJB/X7SztsvtKe5l0W6UpU1QhNh875057yJ+lyZNOJ+jhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9690
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


On 5/13/2026 11:52 AM, Santhosh Reddy Guddati wrote:
> Verify backlight brightness is preserved after suspend resume cycle,
> The test sets backlight to  a value , suspend the system and checks the
> brightness value is preserved after resume.
>
> v2: Remove unused enum and use TEST_NONE, remove locally added prints
> for debug (Karthik)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_pm_backlight.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 58c0b4427..0e35aeed0 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -65,6 +65,9 @@
>    *
>    * SUBTEST: brightness-with-dpms
>    * Description: test brightness with dpms on and off cycle.
> + *
> + * SUBTEST: brightness-with-suspend
> + * Description: Test that brightness set before suspend is preserved after resume.
>    */
>   
>   enum {
> @@ -206,6 +209,24 @@ check_suspend(igt_output_t *output)
>   	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
>   }
>   
> +static void check_suspend_cycle(igt_backlight_context_t *context)
> +{
> +	int max, val1, val2;
> +
> +	igt_backlight_read(&max, "max_brightness", context);
> +	igt_assert(max);
> +
> +	igt_backlight_write(max / 2, "brightness", context);
> +	igt_backlight_read(&val1, "actual_brightness", context);
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +	igt_backlight_read(&val2, "actual_brightness", context);
> +	igt_assert_f(val2 == val1,
> +		     "actual_brightness after resume [%d] does not match value before suspend [%d]\n",
> +		     val2, val1);
> +}
> +
>   static void test_cleanup(igt_display_t *display, igt_backlight_context_t *context)
>   {
>   	igt_output_t *output = context->output;
> @@ -273,6 +294,8 @@ int igt_main()
>   		{ "brightness-with-dpms", "test brightness with dpms on and off cycle.",
>   		   check_dpms_cycle, TEST_DPMS_CYCLE},
>   		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
> +		{ "brightness-with-suspend", "test brightness is preserved after suspend/resume.",
> +		   check_suspend_cycle, TEST_NONE },
>   	};
>   
>   	igt_fixture() {
