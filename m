Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68466C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 06:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6B810E530;
	Tue, 28 Jul 2026 06:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFh3eIyl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4DD10E530
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 06:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785220869; x=1816756869;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o3WcYz1dPj3vbpsuINhDo8huL9s2hB7j7hX70mZNq10=;
 b=KFh3eIyl5OY+bCNDSFkxVDCnfmO55M91Wej1c/LE8G86Q8uih/fyexmt
 vqD0blnxWXC6C+X05ruZYSyWAp+OTXGcQqYDxT/ZNny5dLURFSHZF0HuI
 mUuTkHzvPC3aZCNZonuaVx11ywOXBUQjK6lh9pIvd64/qhZKfL7XaR+Jf
 F7obj87OWpi6pjLa6I2A1T238Rdc4akIcf8754s+kyifjobNtbCXoKT+o
 0J5c4tF7/fxn4aj5ozCYSwj6pgL1AU+sODoN2KpXoaQSpwsv2nlLKdpNk
 /kOkzwvZweYqvAJg00Ri9eucJK7Oj4tn8YDNd7tosPJTaIHbF8opXk771 g==;
X-CSE-ConnectionGUID: LP3m+WjjR9Sg3V55xiCl2A==
X-CSE-MsgGUID: abLhH8QnTkmDAYyqF7K5yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84776240"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="84776240"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:41:08 -0700
X-CSE-ConnectionGUID: ZOTFy0LpQxKucSuVh+ldEA==
X-CSE-MsgGUID: kaMTR+0mSL+KGrRzQai7Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="289577617"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:41:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:41:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 23:41:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:40:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTYM6aAK7K5xbawQdlmMdWSwA5WQJ3LSqrQ3D6p3ps4CWOMFT1gtLAUBZ75sZsGIupNxxSscSyXTwSs5/lN0gnKwJu6R3n/2G6FnA8FVbGrp3wDzBA/VTAacLHBN5ngVt14/HFX9tOKNP9XBYoTvRdPCjk0qNpdt1UzJekURZDYqj1nANfPDklUPwYqQhHWZ1dfs4a2KhA+Nr6oH/FsK7AOz4xfIFExAmyj7UY94Sykp+J/ddaFBeWanzmiYkGhuzXdGCcJjJyyFx6+btN7EoomOdEtpST/Yl96xwcS3r8BrwCIIO/+I8SSsD3pAtCgpVRIrizgEJj3/GSjwebpQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buxR1pubZqfBLjCsQXhl0rkTeToD2P2LnoxTEow70r0=;
 b=Q+8dM+Cqyg+lsuWi6fxtAEZ8m2asOzxlQSCQO8hyCC9DnADUs578ABZSc66c9RS4MC2ktqWSvCXLwkV4dFkvDAIB2wXSMtSNp8ykdME6OTNVAsvZOYtBo+sTUQvojMv/9kKpwZhSIo8sgcPVIBksDof+EC+SQ7L0HRwSrrsakhCPP/vQphrFtSrlhMmD7h8JvjyYB0Ymc3DHd2GnhlsPjTqpICF9u9YOT+U34fWuOaBrDNQx8gS2WabyaODZlsOMAuaKg9aC2xH4w9vHVUnMGDu8DeltIM2IBFobv6sHrG0916d6oeF1YaMPQcmsreNgIpnbjqWlGJTMuHk4+MyLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:40:56 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:40:56 +0000
Message-ID: <715ff9f8-217c-4ac6-818d-e79aaa4a4758@intel.com>
Date: Tue, 28 Jul 2026 12:10:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xe-perf-recorder: expose some OA stream open
 properties
To: <igt-dev@lists.freedesktop.org>
CC: <ashutosh.dixit@intel.com>
References: <20260728063606.2874276-1-shekhar.chauhan@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260728063606.2874276-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::15) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: b8649938-8e45-45dc-0694-08deec732d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Y/jUIqlfRjfas6w62k5KphEDhAQcLCfxKxJfgRXmv3wlFle8PuQ6YVkQS8PHIQ+/5Qnc5aDCJ+zWGrJGDmMRXlIWcMOPT5n6YozYgGFbg4YMYlnyOKLenugYqTRcTUOz9bnwkpe6VMvOuZ4gb678bxeaDLeq3CZROTMuz+5NoNVDUm3/rB9mQQQTeFkrBrF+VJrcCVnEvbz89Q5z30AAjZ/ZrQygb3u8EbQuSUBOKFu8ZAWyRra8CGK9xqA2L0u9d4JhZ5IQ4a+rVSegzgabZd+C9d6G/qtHkW5qfEUunbuDEH1fcmEF0kvJwMqT+kE2kAqld+4IxSn8juv0sHILu+Xa49NMatxEx2gw2CV+co2bmzcpwkCEsppjNFiQuHLcur2YYBonAk+SaBHTTD4L1NFcvlUFh/NnKhnoLMdCMuiYKRDseoOympO+n7MASAYepazwg+uWS8fYP9iwaAkO0waBTEcBnQ0fnQOVx66LLw/RA+KjfBFVfWFWQxZojkChOG0ssf8C1lSYn4omHG0t6v2QfBmHQ0YuZHCFOlWsDdIzRfWPrbtfbSRUK0SvfrJv4P5l2+aXc0KaXEBskItqAePbyNRBhl9XsAjN6o+udZ+34qX8evuJE9VoqW8ggLn4D9cWk3vSREip6/CrElCOI+aN7Cl0OMaL8ysSUf7FQsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVAxeVhsZEJsSVRzdCtzTERGVUYwbDRzUHJQS0VLeEdVSHlwZGRlUEdkbUxk?=
 =?utf-8?B?SnJGSnRnT0Z4bE1qSFgwUHNVU1l1SGw1UDRUaDNDcFlxTjI5a0ZJQkJsTkQr?=
 =?utf-8?B?Y1RPK3RyU2ZCcGJCNlFjZCtXTWpITGFIQS93ODFqRUNrZUVXT05td2V6WDBU?=
 =?utf-8?B?bWJZUHJ6NEFjK20wN3p4VFBJaFhzQUdySHoyNDlMclV4SU5HdFBYeGc0UGtt?=
 =?utf-8?B?dk4wNW5QNUVBNVgxRURiVmxMQkp2bmZ4RmxMMlErQTR4SDUvby9NQnJNeUlG?=
 =?utf-8?B?dUtsU0pwVnVpaVU1cHpTY1o2c1VITjlXNVVreEwwM1gvd24vcnZGemlrTURZ?=
 =?utf-8?B?Y0hWWGJOTk0yNzZScTdIYlJpTDErU2d5RDJOWlpvcFQwQ29HTVZZY250cEtk?=
 =?utf-8?B?K1hlNmtaSTJoRm1yRC8yMzRqSXI4ZFlhdUxGbldydXduTEFwcE5jUXR3NUs1?=
 =?utf-8?B?TjRnRkJDWWhwVi8xZzdWMU9iVzB4UVEyM2trcGh3WVlDdU02MnRUajA0UTZD?=
 =?utf-8?B?WjNoL2NSOE13T3RvMkx2aXZ6QmRzREtqQ2dtN1Q5dUNQMnNEU3loOGRJdDly?=
 =?utf-8?B?RXZ0VVdNYXRub3lmZzVDRVgxQkhqclRTMFRFeHc1SnVqM0QzQVI2c0drMU50?=
 =?utf-8?B?NXhKcWhIRlFvdzd6UnY2RnlkMFNnVmRWVUczR0JKK3lUYkEyZE1iaTQ1VG52?=
 =?utf-8?B?cHBsM1NYakp6dDBTR3JmYUpiVkVMbFpoK1R0b0lFUTVRdlh5QXRraFg0NmhE?=
 =?utf-8?B?dWtOWUlsQ3RTdkFlcG12bklLcnFHZ3pZVDdKVjVTUXZOY1Z3ZlIrVDNHY1ow?=
 =?utf-8?B?SXREU3BCUXBvMHJHRmtQZXp4ZXA5M2hsU3RaMyttaUltaHB5UDhxNFJ4eDQz?=
 =?utf-8?B?NzV5YzdpREcvenlZalhqZ0Zobm11bXgvemdHVXRaQmF2akRBM1VEU2VnTDJr?=
 =?utf-8?B?Mmp2NkxQV0t3SXAvWkJPT1lRVEV2QldDeVArRWxuOEVXcStvNGU3QnRIbXQz?=
 =?utf-8?B?RHBSMTJveTd5dGVDTEhMbElkajdSMjYrRDlyMHA3ZmhjTlducE1mZTM1VE80?=
 =?utf-8?B?U01aYkRoWitBQzRmeFpBWnZjN2hIU0RFTWJiNnU5bElJVFZqMElpUGtqVk5r?=
 =?utf-8?B?Ylk4MWJpZHpub1dDOUhWVXBzOE0raS9vRGFRelpvYktNM2x2N2FEL3JMa3ov?=
 =?utf-8?B?YW91LzAvR1BvUDIvKzVPcDluQ2dXbzZnUTViWEIxb0c5b3BYYmVpYUZKaEV5?=
 =?utf-8?B?b2lvY3RpcSs1Y081eTFFR2pEcGdHQU9Ja0ZTZ0VjZS8raWlscGx0T1dwUXZX?=
 =?utf-8?B?ZlhlY2I3eVliY2ZHRUlBd1FLbk1uZmRRUEpaUXVNcmhBVmptSTJYU0dVNE9M?=
 =?utf-8?B?SkF2Ny96RG1nY1oxVGpEYjdhSmhwR0xNNzRQT3RqL1FXYzAxQkVmZnZycGRX?=
 =?utf-8?B?RlJ5VVc0bitPdStBT0UyWG0xUm16Qk5rOUVtR3pQVm41WVNmSzlBVzl0UlBu?=
 =?utf-8?B?a3pkYXRFWlNKZVc1bitBbGxpVEd3clIzN3pXcmhDWmU2QTlHUVhGbGEwckg2?=
 =?utf-8?B?b2hTeWNKOVorVFlhOUEvR3plRWpnUHVBRzhoT2FJdlVzelR5anR3eXM3UTl2?=
 =?utf-8?B?SHJSTzZOc0tHZmd3b2RSTXJZaTZNUHZNTE9UN2tidzNBdmVhMURUQVRETFdv?=
 =?utf-8?B?WC9panJzNVRiU0daTUlDYUYzNXl5cHFURGNDNUNoc3laNHV6azArSkNsQUE4?=
 =?utf-8?B?azB0c1dockhoTWVQWkF5WVdBZDMvTmg0dm93ZHl0bWl6emNYSmRqejRrbCt3?=
 =?utf-8?B?TWNjVUlGOTYxNk9udlYwdFZFVjJicXErb2ZVZ0UvcjV0Nmt6ZHE5dEltdlBi?=
 =?utf-8?B?c0ZVd2lLSUl4Vld1ZGVUNzF1SmZjelpoOFhNcTB1dVZxR01KWnJyemdpcWkr?=
 =?utf-8?B?cndYM3kyR0JERytmWCtCVU5UNWJINXd2bUVIdDFsSzRGdFZZeGlSalpIYlNt?=
 =?utf-8?B?bFYwK2FNL2NUOVdCMDBYc1YyaThVUnREMFlOUEFIMEJ2TmptZU1BY0JmdStS?=
 =?utf-8?B?RWovS1hCeGQ2WmdSV1BNMVM1U09hZmNNeWlOWUdFa1BGL1hZNDRQS0hRUGNY?=
 =?utf-8?B?NVE1OEJBWi8xQkEwU3NsbU55bitORTEzQXUxQUV1d0N4Q0FheXlDdUZWVFA1?=
 =?utf-8?B?M3dlYSs4dnh0RjRiODFiS3FhbXowYUdJdUZ3TURXOW81SmxROGxET3BMLzJm?=
 =?utf-8?B?aG05WG8xeXZRZlJjTE1VTDJaWnN6aWVMay9MVVlodmxnVmUrZCtSaTA0MWJ2?=
 =?utf-8?B?bFowRUxpbmNxVU9tSGRMRzZjZzJ1MHhQWVBmN2VMUnBFTDBPYm1PUnpORkRk?=
 =?utf-8?Q?03VBfkgJW3LYNx7E=3D?=
X-Exchange-RoutingPolicyChecked: qwu7ElufUn5ew3dq2vBJnb7WgAdIs2MEBZzBiPFW5WZWO0i2tAfNf23mMBAo13BHY6NvAwDB6iGcPHBsfEJXre+IM7rzp//swfWBl4pZrprIGx2S+7r3orDz5z3b0edPPGsPlzmOy2XlporwFjXUrTyXg64ZecWR/L64k2NyaQsNZtx4s5XjZXbLTXDQV6r6FHI4Yh+c8ltnGqupAtgt9ws639t+XmHSnn6SfBGvNjFTFbjrxH9YBeuy7/OA8ys6L1C66GAc3n0eTgtEvhcfZYjOcyCTAY3nX5lOLL/8XwFipDc7lgHJf7bshfJ3vCaQTuIb7cMiGbl3SUERd+30YA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8649938-8e45-45dc-0694-08deec732d67
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:40:56.2106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5mCGv8XY33aEtiLyiFWms390fDQ15dHG8qNm9hPusYmuJGzGT/I8gqpI55xBwfYq+sBXaXeopZCGInXzJO48eknUBk/24Ene+Srtol3Q2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

Couple of things to note:

On 7/28/2026 12:06, Shekhar Chauhan wrote:
> xe-perf-recorder only passes 5 of the OA stream open properties to
> DRM_XE_OBSERVATION_OP_STREAM_OPEN, leaving the rest without an open
> source consumer. Add few of the remaining ones.
1. I missed out on adding "PATCH i-g-t" prefix, I did send it with a 
subject-prefix="PATCH i-g-t" hoping it'll append that, but turns out, it 
didn't, so I think I should explicitly do that while doing a git 
format-patch. I remember being told to add it in the gitconfig, but, I 
didn't wanna do it for all the patches that I send, so I didn't add there.
>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   tools/xe-perf/xe_perf_recorder.c | 105 ++++++++++++++++++++++++++++---
>   1 file changed, 98 insertions(+), 7 deletions(-)
>
> diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
> index c69050b43..06d1016a0 100644
> --- a/tools/xe-perf/xe_perf_recorder.c
> +++ b/tools/xe-perf/xe_perf_recorder.c
> @@ -26,6 +26,7 @@
>   #include <unistd.h>
>   
>   #include "igt_core.h"
> +#include "igt_sizes.h"
>   #include "intel_batchbuffer.h"
>   #include "intel_chipset.h"
>   #include "ioctl_wrappers.h"
> @@ -364,6 +365,16 @@ struct recording_context {
>   	struct drm_xe_oa_unit *oa_unit;
>   	struct drm_xe_engine_class_instance *hwe;
>   
> +	/* Optional OA stream open properties */
> +	bool oa_disabled;
> +	bool no_preempt;
> +	bool exec_queue_id_set;
> +	uint32_t exec_queue_id;
> +	bool oa_engine_instance_set;
> +	uint32_t oa_engine_instance;
> +	uint64_t oa_buffer_size;
> +	uint64_t wait_num_reports;
> +
>   	uint32_t vm;
>   	uint32_t exec_queue;
>   	struct intel_bb *ibb;
> @@ -477,7 +488,7 @@ perf_open(struct recording_context *ctx)
>   {
>   	int stream_fd;
>   
> -	uint64_t properties[] = {
> +	uint64_t properties[32] = {
>   		DRM_XE_OA_PROPERTY_OA_UNIT_ID, ctx->oa_unit->oa_unit_id,
>   
>   		/* Include OA reports in samples */
> @@ -488,10 +499,39 @@ perf_open(struct recording_context *ctx)
>   		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(ctx->metric_set->perf_oa_format),
>   		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, ctx->oa_exponent,
>   	};
> -	struct intel_xe_oa_open_prop param = {
> -		.num_properties = ARRAY_SIZE(properties) / 2,
> -		.properties_ptr = to_user_pointer(properties),
> -	};
> +	struct intel_xe_oa_open_prop param = { 0 };
> +	uint32_t n = 10; /* 5 mandatory properties (10 u64 slots) set above */
> +
> +	/* Optional properties, only passed when given on the command line */
> +	if (ctx->oa_disabled) {
> +		properties[n++] = DRM_XE_OA_PROPERTY_OA_DISABLED;
> +		properties[n++] = 1;
> +	}
> +	if (ctx->exec_queue_id_set) {
> +		properties[n++] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
> +		properties[n++] = ctx->exec_queue_id;
> +	}
> +	if (ctx->oa_engine_instance_set) {
> +		properties[n++] = DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE;
> +		properties[n++] = ctx->oa_engine_instance;
> +	}
> +	if (ctx->no_preempt) {
> +		properties[n++] = DRM_XE_OA_PROPERTY_NO_PREEMPT;
> +		properties[n++] = 1;
> +	}
> +	if (ctx->oa_buffer_size) {
> +		properties[n++] = DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE;
> +		properties[n++] = ctx->oa_buffer_size;
> +	}
> +	if (ctx->wait_num_reports) {
> +		properties[n++] = DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS;
> +		properties[n++] = ctx->wait_num_reports;
> +	}
> +
> +	igt_assert(n <= ARRAY_SIZE(properties));
> +
> +	param.num_properties = n / 2;
> +	param.properties_ptr = to_user_pointer(properties);
>   
>   	stream_fd = intel_xe_perf_ioctl(ctx->drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
>   	if (stream_fd < 0) {
> @@ -924,7 +964,14 @@ usage(const char *name)
>   		"     --output,             -o <path>   Output file (default = xe_perf.record)\n"
>   		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
>   		"                                       Values: boot, mono, mono_raw (default = mono)\n"
> -		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n",
> +		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n"
> +		"     --oa-disabled         -D          Open the OA stream in the disabled state\n"
> +		"                                       (the stream is enabled right after open)\n"
> +		"     --exec-queue-id       -q <value>  Exec queue id for context scoped capture\n"
> +		"     --oa-engine-instance  -e <value>  Engine instance for context scoped capture\n"
> +		"     --no-preempt          -n          Disable preemption (requires --exec-queue-id)\n"
> +		"     --oa-buffer-size      -b <value>  OA buffer size in bytes (pow2, 128K - 128M)\n"
> +		"     --wait-num-reports    -w <value>  Min reports before poll()/read() unblocks\n",
>   		name);
>   }
>   
> @@ -1038,6 +1085,12 @@ main(int argc, char *argv[])
>   		{"command-fifo",	required_argument, 0, 'f'},
>   		{"cpu-clock",		required_argument, 0, 'k'},
>   		{"oa-unit-id",		required_argument, 0, 'u'},
> +		{"oa-disabled",		no_argument,	   0, 'D'},
> +		{"exec-queue-id",	required_argument, 0, 'q'},
> +		{"oa-engine-instance",	required_argument, 0, 'e'},
> +		{"no-preempt",		no_argument,	   0, 'n'},
> +		{"oa-buffer-size",	required_argument, 0, 'b'},
> +		{"wait-num-reports",	required_argument, 0, 'w'},
>   		{0, 0, 0, 0}
>   	};
>   	const struct {
> @@ -1068,7 +1121,7 @@ main(int argc, char *argv[])
>   		.oa_unit_id = 0,
>   	};
>   
> -	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:u:", long_options, NULL)) != -1) {
> +	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:u:Dq:e:nb:w:", long_options, NULL)) != -1) {
>   		switch (opt) {
>   		case 'h':
>   			usage(argv[0]);
> @@ -1119,6 +1172,26 @@ main(int argc, char *argv[])
>   		case 'u':
>   			ctx.oa_unit_id = atoi(optarg);
>   			break;
> +		case 'D':
> +			ctx.oa_disabled = true;
> +			break;
> +		case 'q':
> +			ctx.exec_queue_id = strtoul(optarg, NULL, 0);
> +			ctx.exec_queue_id_set = true;
> +			break;
> +		case 'e':
> +			ctx.oa_engine_instance = strtoul(optarg, NULL, 0);
> +			ctx.oa_engine_instance_set = true;
> +			break;
> +		case 'n':
> +			ctx.no_preempt = true;
> +			break;
> +		case 'b':
> +			ctx.oa_buffer_size = strtoull(optarg, NULL, 0);
> +			break;
> +		case 'w':
> +			ctx.wait_num_reports = strtoull(optarg, NULL, 0);
> +			break;
>   		default:
>   			fprintf(stderr, "Internal error: "
>   				"unexpected getopt value: %d\n", opt);
> @@ -1127,6 +1200,17 @@ main(int argc, char *argv[])
>   		}
>   	}
>   
> +	if (ctx.no_preempt && !ctx.exec_queue_id_set) {
> +		fprintf(stderr, "--no-preempt requires --exec-queue-id\n");
> +		return EXIT_FAILURE;
> +	}
> +	if (ctx.oa_buffer_size &&
> +	    ((ctx.oa_buffer_size & (ctx.oa_buffer_size - 1)) ||
> +	     ctx.oa_buffer_size < SZ_128K || ctx.oa_buffer_size > SZ_128M)) {
> +		fprintf(stderr, "--oa-buffer-size must be a power of 2 in [128K, 128M]\n");
> +		return EXIT_FAILURE;
> +	}
> +
>   	if (dev_node_id == -2) {
>   		print_intel_devices();
>   		return EXIT_SUCCESS;
> @@ -1291,6 +1375,13 @@ main(int argc, char *argv[])
>   		goto fail;
>   	}
>   
> +	if (ctx.oa_disabled &&
> +	    perf_ioctl(ctx.perf_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0) < 0) {
> +		fprintf(stderr, "Unable to enable xe oa stream: %s\n",
> +			strerror(errno));
> +		goto fail;
> +	}
> +

The above 3 ctx.no_preempt, ctx.oa_buffer_size and ctx.oa_disabled 
blocks were suggested by AI to improve error handling.

-shekhar

>   	init_mmio_trigger_ctx(&ctx);
>   	emit_oa_trigger(&ctx, 0xc0ffee01);
>   

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

