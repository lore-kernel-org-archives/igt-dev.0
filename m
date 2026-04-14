Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF25EED7B82
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 08:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D00110E25F;
	Tue, 14 Apr 2026 08:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGayWPWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E6710E25F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776155490; x=1807691490;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Oue6LNz6IgoQ4YyhuqHl9a/BeJvGaE/gP576bjQUvio=;
 b=fGayWPWPSg18gOUVmx9g3I8XFnv91Ru7EfJMHFP5A1AGhCe8Ys3H6GUk
 p/WAkWhsrifcHfjoF8tEW2fPexO8Q/0CRLbTLg6KvFv22GWVOR+Xjan4a
 FfOff7KugwTKPXnXPN1HRcHFUJ6sg4QRbsNTezZ6rDIgZ04dObUBEcvU5
 3gH7Zaoje+XtJfBlhiQSvknG56IYNKVGoSGYQTYUzmlalV9bI9NPXvEfX
 l+aG2wxlM03qsPs7drwLtDQ3gxZzTCjeDfjz6DbHSuLCQqG0aMCW98zno
 Cc6K87ao4FSkG4ucZNQfiYQiV9ezM08sCuL2uJbGzrdwdOegFaIePYiC2 Q==;
X-CSE-ConnectionGUID: zV4r17C9RViNiZgimFpVUQ==
X-CSE-MsgGUID: 6gnM6W6nRRi3EmDSxKvp4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77216938"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77216938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 01:31:30 -0700
X-CSE-ConnectionGUID: gJ0xQrE3SQKhqQKz+Ncjmw==
X-CSE-MsgGUID: vxAvENIZT2y2+nd1F5OMbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="228992502"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 01:31:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 01:31:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 01:31:29 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 01:31:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4VpBKDdIObLShTXFuuroF4OPfAP3W34x6Nc1H0vjtHBpMAO37rPuMDJ3arIHCfgW3O/m20cZBEfFiy5ZFTxGV67PnKNAPDXqQVegKnB6Ar8kVZ20DpnKBv2Wiv4Of0zFei0EurpbO+ssQ6OdlwiJBOyWXoE+ARSJyM0BQLIESOTTcwrQE24OtqmS/SCKCjieCzt1pUaWGHJ/HVosbaVBB4STj52vT1VSqoFCTvWP8pGADRg9YsYURMWe5dPRPAgLU+kQ4MhINazEmor9SYJSiRsmp/86vx5cRJYO+Vd6Mw6XYkO1Z/U3Cptzv+TSInBi+g0waQsPBK5cWP66olYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUnDCx4EFH3ZeDHNpCz5H2DH7WKPNUcaj0tG1K3Us78=;
 b=NmaD2K20gdAr3hM3xKuUKlb5eYm8C2bU+WBkW+AAD0Vko51I796CiWj/8i6sj4B5+GNsHG7BvxTxsQeh8Cw5j+yxF70+jP1DopP0EwJe6KNftg11pu++ux/0FQC5hAEv7J4Xl579eT55eEJfuVrp4vnk23xA2TKdQmngcG1F9L1TJOfqAghCYYrTIN4uw+YdBK+GjuSxCTuLwGRE2FRz8LvpB6YfCVkLwTDHiGwtRb91ippbYKCR2coJjQziuhny6qYty5LuxI3vJFJQ78AGNafrahJJjIbyM94HtWoi0/tfJLyj++hqlEnmdX0se5uN2Z8VFyTVo/krPkVQhltFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4d3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.45; Tue, 14 Apr
 2026 08:31:27 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 08:31:27 +0000
Date: Tue, 14 Apr 2026 08:31:16 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v3 4/5] runner/resultgen: Add json array create/get
 helper
Message-ID: <opqavo7gtoszpmjazhgfxxelhuyxodszk72rkwcb7aeqz5dnu4@y3fr76xxzv25>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-11-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413201722.808673-11-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: TL0P290CA0015.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::7)
 To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ2PR11MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 75806cdf-8100-4776-0293-08de9a003890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 9jmuzkC/aJ69AwyoTiqZSIY2TfL8e7BVlLJ6gNyKYJLxWW8pqQEG/mCGd83imSsDzE2jf6SwZoLi50tfS3MAwHXupBqJkZU/qxwS99ohWbq5nyJbsP7waYSBQB0synyyNhnsi+GtPqjWVFrYjQi9gunH+EgRhQtqgbxLe1V2hER1lb1m3ySEC+qtZUK4auTOeC6uPyhriFEsG70rUexB2wKKQf8uGyZiFFc78bcD85S0QGj/+Ph9OpWfmPy1bte3SK0HKjuFRXs2knFieWTMvf/aRIYz1I8sEfsZcgEunGL8AbrcTwWgJby5ZEbz1Y9cAX0xl4pnKDAqjJbFqJWT8qFZdL1uguMBylzlY6OJDSD46MFpm4y7lMUwYKjK1yoaUrNeb5X3jEJaGEnBmqsdXotvX80g+THJuH0TqueF357QE9MCOGLtFtrQs9nJ9CmUbveG6mO7MYDAVOVut2l4hkaZ+T+Mnu5P2Sfz4M9p4qizZfmUQyBAlBJrwNvDBBPl74OpcVNYaD/PJjuOaeHQQkOqIA4+xVQumG7jHoSHkQvcL0Zs6GOPshM0sHgDEtPDBx4uLkvT0ghuaFP6G0W2NfvJ6bk/bwXC+P0zKaJCAlyhslaf+zyuezXfc6mBEwJjE14rb/5CvdTnWO4JGK57CEALHpzLSqxOwvSxsBFJnT+Id38ThQQU5W/m09J7I6fPemstUgowzEvSlFy4IZLRPKJomKDXlzBp1nu7kskVflc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjE0eVpxNGlWNml6OVM3M2QrTTBDRW9DRk0rSjMxNFBSWXRCZ1A3bHp3aTAx?=
 =?utf-8?B?UUxieGdieWNhOXhCOEpaS1Y3TjlpVlFUelhFYUV6NVpMV3ZubTFsTXVxVklz?=
 =?utf-8?B?RlBZZTh6ZUU3MURnc1NMaWNYbm1VTy9XNTdXbkhNR0R1K1ZlQ3A4alo2VWM1?=
 =?utf-8?B?QzlhNXJTU21XMGxFanYvLzZMT3FLVS9YNkVoNy9SL1FSK1RCbTBELzdFWXp0?=
 =?utf-8?B?Z1MvZy9oNEtUSUN6cFR0NElZZkQ4QmpROEtNMG1OR0tZbWpickdybFI0R2Jm?=
 =?utf-8?B?MWJYVkpQRU9RREtjT3JBbHdHeDFnT0NyS213TG9HRHBid1VNQTZjSCtuUnZE?=
 =?utf-8?B?bkRBNEtQdXBZZytWR1NzbHFrSnIzSFJZVnYxTHZZZTVrZnRGZVRodHgwdTBt?=
 =?utf-8?B?YXRlcHc5NExqK0FscTNSTjh3NXFFOStxRFdhbENoWmM3U0dPblNSTjNQUUxT?=
 =?utf-8?B?Y3hTaFRYUEVRTTZlK1had3RteWo1SVJIRE5FMEdQdHhrcE80Z0xaOXIvMExP?=
 =?utf-8?B?WWNrYUlkR0NiZVNnS2RQVTZ5MitDYnd1ZWlxa1FWMEhDU3NySXllRW1NUHdE?=
 =?utf-8?B?ZFZVVWhSOXN5Q3NRME1NeDJVVnlibUxBdFIvL2txTHdsT1dHMVB5S3lIV3Qv?=
 =?utf-8?B?Q2JLSTM2NjJCdkRlZGh2TmJmbSsyY0ZBUzBuWllaTnFMMmgyOUo1RnVDNlh0?=
 =?utf-8?B?bVdHKzliVlN0NjlnOFN4ZmVjamZDdFZSdkJOWVVBMkVGUkZOcXc5WmwzK1B2?=
 =?utf-8?B?TkFwaVRyb1BaaHRSZDNrVTBXcVYxaDhWRTlVWEd3OEw2TkVKWHJNQ2hMYzFX?=
 =?utf-8?B?NE9nQnFlNEdWVno3d0l4NXMzcWsxNzdnVFBkSFpzeG94UWVrWXZONDhnWFlC?=
 =?utf-8?B?WU95UzFEcjdtRXBwSTZ4S05OOVVRcVAzUUpBcTB6bHFUckhXMVptMjAvNlhs?=
 =?utf-8?B?UVVxRGY1bEhTUGI0SzMyODV4OGJwU3p1RDI2Z0h5SldJeTljelBYZWdaRFFT?=
 =?utf-8?B?dmlGalpEZ0VkVG5ZUlJKcUppenhRSzBJN2FnRTFScGZVWENIREoxSDVkSmNj?=
 =?utf-8?B?REMzM2twZUM2L3g1Rlp2cXp3MDB4ajh6SHB4U05RUVhNby9tK2RuTGRxNW5a?=
 =?utf-8?B?VkdFVlhhQVpoTjRJektpWUZIZGRsUUV6clY2bG1iU2hIYUtYTUZsS1BnRFFr?=
 =?utf-8?B?bC9qZi9Ec3dJYlBnbVQvbVdmdGpyNm56aFNkVWYrRTNhbUZxeVdGK1RWMmZY?=
 =?utf-8?B?UUdFNm9LOVoxdVdDTWk4UFIvSllqRWUxcmViSi9NSUIzQXNFOEY3My9TODh4?=
 =?utf-8?B?NHM5aDZiWjNDZ2MrTzVnN3M4czJLYzhKWnV0Ly82VWI3eVZLUER4bmFMM1RB?=
 =?utf-8?B?d1llNi9Ta09zL3p6K3Uwc29KM003UUU5SzFZUDJiYXFYMG1aZFpERHZIcjBm?=
 =?utf-8?B?L1RpaUI1RzVVUHR4dW1wSmdvaGYybWwvdkFvRDR2bzdlbjVxQ0lqc1JKZkdq?=
 =?utf-8?B?c0NOeGh5VmZiaGtvWmgwT0pLMlhwWEhTV0g4OGRmOEtYRGkrckFHdnltSndq?=
 =?utf-8?B?Nk82UWY2b21vMWZlb3VGWktlMG5oM3l6Sy9sSFZGbkFHVGlnS3piK1cvenlw?=
 =?utf-8?B?QWVGbFVjK0VpZUVjUUtJdWQzWDM1MU55YXNJdkVoS2cvdDNBd29MU2ZpMnZW?=
 =?utf-8?B?VzhzckhmbDQraStLRWdsTFVwNG9XUDZVanpWSmQ0dmhxdmJ5dFV1WU5uNzI1?=
 =?utf-8?B?bWt0MERwMWVWUzQ4UUpFRzlTa2lxNVFMY2pmZCtCNmdMeHhGMytUeFJhVi9Q?=
 =?utf-8?B?cm5BT0NqdHoyVHhVVUIwK0F2dlBxQkN5TnQ0RWRwbDB2UXJrcE5uN3FFMWZo?=
 =?utf-8?B?eTZzUUs2eEJobUJpN2V6ekQ1OHJ2QWEwZjh6dzRQMGxjN05IOW15dW05OTZW?=
 =?utf-8?B?NmlVY2I1Tm8yYkVZeEQyRy9OenhITFVTdHZsTytVTWI2b3JNM3JOQ2NORUVx?=
 =?utf-8?B?U1pIMTVSN1lmV3ZjdkZKSnlXL3dYU3dZODVuRGJrWkowVFRzWXplb1hKTWpm?=
 =?utf-8?B?SVdQcW8wNTdnR3F5M0RvTVM1UG5Mdm1Od2tCeUpCTlNSb3pVbjQ2NE5xcUtK?=
 =?utf-8?B?WGNnVXY0WksxTmlGQ2gwd0JtQ1pDQVZqL3BDMm1LZjFkdGZ2RTkvbUQ1eWlP?=
 =?utf-8?B?akFBM3NNb1J3aEs2UmIrR3hhZWlqRjg2V0l0cWZWTE53RVp2Z1JreWRDMmVU?=
 =?utf-8?B?WjJnaDRGdlJqOGk1Q244VkY2VlQvSHkrclhNdStXS243QlNCeHZvdzNFTFpP?=
 =?utf-8?B?SDE3S2NVNW1YWWlTT3RKL2RzKzBkcVdLSnMvS3htTGF0Z3RKTi9MWjZNai9q?=
 =?utf-8?Q?Yj75sEmxMUhtM0Q8=3D?=
X-Exchange-RoutingPolicyChecked: CVDF7bnWiFyeeJglVBXw+tNcCoGGwnVnPUACvVYoiZPP7GeYWoTyZpWHZY2+AZYgwqsxRzgDrZy5dReFjCUJyHkJ/tsrYtK9q7t/AbC53JoNOdi1G7ErQlIuCE+W141zVadlaT+O2pAVmK1fLfWMJMxUj0H5U7ItNIN4aghIRvKiJIK+ZwT9koUmJNDfT5vVw9zdHPYIsTM2yRiS+7tatTFM37cj9SFU/m4htdsDwn64/yzLCvQCMHJ1IReqiIty/Ddj0ASTahrFL8IqS0BjD1eMXKEE2oMYjBdmVR2QFKsVljWJNUUqnVrwrmJXVVxOGJNB1mbZ00IQOFfhyqmmSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 75806cdf-8100-4776-0293-08de9a003890
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 08:31:27.5801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIkWuxCn6FGz7RN4Y89HRfYdSXLjlqCSDoHr1TmxjWGJrX973OOGjybZ/gOkwmzy3/E7kRGXRymk53W2WM09hvTZrY2yZtIFpg97OxEE4jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7648
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

Hi Zbigniew,

On 2026-04-13 at 22:17:27 +0200, Zbigniew Kempczyński wrote:
> Upcoming patch which extends results.json to contain attachments
> is going to put file list in the array instead of key=value pair.
> Add helper which creates/finds array object in json structure.
This change should probably be squashed with the next one, so
the usage of this function is visible in the context and isn't
a standalone addition.

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  runner/resultgen.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 29fc5cbb15..f8459385c3 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -271,6 +271,20 @@ static struct json_t *get_or_create_json_object(struct json_t *base, const char
>  	return ret;
>  }
>  
> +static struct json_t *get_or_create_json_array(struct json_t *base, const char *key)
> +{
> +	struct json_t *ret = json_object_get(base, key);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = json_array();
> +	json_object_set_new(base, key, ret);
> +
> +	return ret;
> +}
> +
> +
Double newline here.

>  static void set_result(struct json_t *obj, const char *result)
>  {
>  	if (!result)
> -- 
> 2.43.0
> 

-- 
Best Regards,
Krzysztof
