Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159F3C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 07:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB4310E64A;
	Tue, 21 Jul 2026 07:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SY2cnAOe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A87910E5D8
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784619405; x=1816155405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e+IC/SPgrMEaURvy5uoQp9ZS9AgO/5Lra5KR7o3+hAk=;
 b=SY2cnAOeQBY3Vg+iN8PkHPo9sKFCFgtbpTkQ1vsHnIM3qHajqGxt3jb+
 SxsQfL9LjKilbnVe7+NEvrwLq4cm6VQNRWJN/p4arU3mA4QLUq5pk63vN
 ciXx2KVWM2kY16eIeXEL6OdzRehGgd4pnhr8dgQ0yIpp+wEEevoQWLcuO
 afBkoj1xooEUeWMNiWWQo+T0syG9l5qpjG64rfxdIqGpM7HTN8XPfZapq
 vDxe/ExLrZ1hUA3BiOgRR51WNoRsoniUhn43kBTjqM8adTok1jmA9+OxX
 KecOIavGhzvRX4Qrka+dzOFDo+qtshLd3rtmSUFV7asgAQJDCNhsuIyil Q==;
X-CSE-ConnectionGUID: iiO30pu0TNOD0cH6BZz+2g==
X-CSE-MsgGUID: hnfuHpNJQdq5e1g9R8+YDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="84190423"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="84190423"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:36:45 -0700
X-CSE-ConnectionGUID: HilCLCT6RXuVK3OlMBC/bw==
X-CSE-MsgGUID: IpyC/tfYRSOCCo4E84pApA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="256485157"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:36:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:36:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 00:36:44 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:36:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/7qfYo/uCet8bwp2412gq/HqGMtI6KN6DG6JrEVqvsRxTilsTzvgKAf4OcvUvlURt9lNFe/9hbx1cI+5R8QEgaXpq6E9nZt0VgBGhjZd94O7e/DQvDOrQKX6y1H01gMwf02WIBwWW0aV+pDufIQV6HBNlciyV6zS4gq3/3tQKaQ3LReZr6pQWm2VgVzpBNsxhInmwA2YLnhRcouKQkRoQjqmGjMd1M0I1aPcK0cW8aF2R1ZiBqfjxgc+BK4cc/CHE/Ez01AhN86FT+tUtfUkLJDqgOuiq56rDg2MZj5vnQz70bDdAb44Gpiy6vwurdE6lKNlE35/rW38R7oiGQFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGI+iZN4TMJo3oKF1YTEAuzo64cMZAKZrs+wQACGE6o=;
 b=eNoTa3NJ2g/xg+9OIfp6eafNZEHHoDIHPlB9Ygtmk0ZTKdTZL3BCHRGRiRr8F/9NCR9YfRNwEKYeQGQWqyJkWAVYsuh8V1iCA3kyTxd15S6dnWRTiCMhzOT75IEN4ZMCM5CVzUX7bscDOXy04+KdNp0jr80HSQ4W1KoYb80XCUyA9o6TfpqThfVJuY1ZTBneOh/6L1MvDO3ssukCZ1RTlQDOCcf5pmgZHCIIO600PAYd7Hj4/PWUr2+OdumdVM48Gc/OAHyDMJRWi10tLYTFgeQTUXVICk2D4I8E2Vpy+X5jLHMRk6y1fg1SwNU4EVgQsoHXl9PpdZVFfXp/fgmhtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:36:41 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 07:36:41 +0000
Date: Tue, 21 Jul 2026 07:36:31 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 28/31] tools/intel_display_poller: link with
 minimal sub-libraries
Message-ID: <ijvyej64efgyvwla22pw4e5qnyoymckeawk66fhisf2wgufeiw@ekfjmcjiafte>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <65f023400809dcabcf9079dd1872180a23089447.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <65f023400809dcabcf9079dd1872180a23089447.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0021.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::15) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 386f61bb-77e1-47f5-92bb-08dee6face77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003|27256017;
X-Microsoft-Antispam-Message-Info: pVSNVFUvtkGDBGcVlUhXtI5LZdcYaNoSNecq1WYBolLLOaDyIV1AVEMaj3bchNvn0QSvpsWTo8HdmastmA9WTIrm78v7mx0Ktd/thZSX5JVslOv0UDx88flGe3c9iUoNBVXJGqQ8QYJp6vA2mZ13qN/UdJLpCjtmkSAz9nq8Yk8y04JM/aneXryYbySvUjdX9PRx65auapj29HUxGdA9UZmIHf9RFnRzF1+0SKPm5Bv3f2FQYJ2vm7iaH3MFN4CZ5S1ZinbKyX2y/oXWMqn3tmo3ibp9SzOdP3C9X104/I0kwgaUOGoMjyjPOd5SNPJ7Uru+rWomiv/JbiglujISHaeN35vaD1tAEqhOLKrUHkqu6WlI9jDYJyD2xZNXcnMaYCXsU3P/bTZ11iXkqAJJ7viycF+t2mDof4qY8mehraLqC1fJskejwq0qgs62Sl2yg+vFEhr5TI/txEtK2merKZeuW3uipHIhaVBAbn7IAmigCyEnNVT8qBXrCdzIwpk5AN/+8snWc4y+NJYu4NP2lssJ33Ee+RKaUc/qKNVAE7EmFQ/JdDSsdP9VQ+qql6+hqkOXrO4ndn7K/2S90Ih5qzD+2uq/ttPqZrKJZX20epkNmNd6t4in5ySM7InRR/fJGpc9Ej26nMY282odu2isINu/HvvYT+B2TtSPeizDzBpb0iLjvGBdx13fQqCGTVdAwElL3mp+UdmVWwKXI8PYoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SitRVWYxa2F0WFkxaEYrbTJRelRJZEtGeTI4UlNkdHF1eFZUaDYydHk0dURz?=
 =?utf-8?B?dDNUcG5ySEdkaFpTRVlUY1pHWkxNWTE1VXdlSjlLeTdYWEtBZTJNMjVVMjdD?=
 =?utf-8?B?VVZkbHV6UHdXZzUxcnBIcjV3RVN4WURNK1BxczBMZWQ4UkdBd254OHRPV3dW?=
 =?utf-8?B?MFBrNHltUXh0d2MrZG5rOHVRaXd3MUxvaGJoQkIrSHRYREcvWVBVRVM2TnBT?=
 =?utf-8?B?SGZSWExGMVZub2ZEWlNHOFd5aEh0TVc0NjZUNjNVNmI3TjNHQTFyeEVWYnZV?=
 =?utf-8?B?NWxPaUt1ME4xc2d2UER4QkRUNW9nUHFyVXZmRlU0V2VsUTNsZWtaU1o2WXdq?=
 =?utf-8?B?M0ltcWMwbDNURFNkMmxJdm1rSGZreXo1ekFzdlFjeit0YXVIbjd6aXdQOXFa?=
 =?utf-8?B?RWxEZWx2bGhManREdUQ5cW1RT0ozVVoxdStWbytDV0ViTXVkbGtRT3E0NkY0?=
 =?utf-8?B?WUVmMkF3TlkvdVFmS1czc3grNjNVMkhjckFPVllyU0IyM0Z0ZmFaMlNWMUYy?=
 =?utf-8?B?Z3dlZVU2TVdQTk9SRGVtb0J0bEVTK3dERzlTU2ZXdE8xbnFnL2U3TVI4Sk5V?=
 =?utf-8?B?WkR6V3VtM0RSTmlONTEwOVQxcGxxbFZ0bXVZYURSVGZ1bFV3UHhraUlETmZj?=
 =?utf-8?B?M3VoU0hTejhWTzkzNVdJRjNlaFZIVFlaNWNUN1U3RFBxRDhkTTQwWHZBSkYw?=
 =?utf-8?B?alVOL3VSc2JQWnpoR1V1QzU5b2kwbnowRTZZQlhoWk1IZGlmVTZlczlUYkVN?=
 =?utf-8?B?eVZSZlhqT0NCM01DTEJ5SHRjM1duK1Q2NVNXYngxS0FwVGpMaEpNOVh3R01Q?=
 =?utf-8?B?WW5jK0p0TDlOb3Bnbm1yTkNQdTdjSEtadElONE1OcFNITnEwcWN1QXRmMEw0?=
 =?utf-8?B?eFA2T0dweWVraUpUejRibEpadEZVT0YweVI2cEp2dXErUHFCd0JzaWwzOCtH?=
 =?utf-8?B?ZU1qUzVmRE9lR0NhUFpQMkEyZVYyUFZ3N0pjSmozS3dHcXlIZWd4UWFmeklV?=
 =?utf-8?B?R2FzVWhpQ0szQjRObXJLUDVWd2w1eGN0THF6NFpmRW5Id096U0phbm1pTzJT?=
 =?utf-8?B?MjZHckZWOVBwQytOK0o5QTFSOWRCRThpMGxhTEY0TVV4d3FEMnhaUXI3dE1s?=
 =?utf-8?B?ckFzdm1kb044V1dEbERZZU4zcGVva3JvVm1xMWlRYStJK0JIclFwL0lLQ1Jx?=
 =?utf-8?B?M1l1V0R4U0ppUS8yYTAwOWJZZDZnd0hsdEJiK3FnZ1ZTVTBRLzV2QktyWTdu?=
 =?utf-8?B?VE5Sd2FPRDFCTDVrU2YyMEQ5VzNYL1ZXcTZWNlJyM3RDeGVpNVc5aVpsOFBs?=
 =?utf-8?B?SThERWU1QTMyY3lCYjFSdlFDYURNTlpiMU1hYk0rRS9CWGtONVIxTUhhb2lX?=
 =?utf-8?B?em5SUnNLZVhwOU04N0VWdlFJWjJ3S0haV21wRitwQnhtblVXNi9vWitST3Ax?=
 =?utf-8?B?aWhoODJYcXZlL3QxVkRSNUhIeU9Tdk9MajVnVFh3WDl2RHZQcm9EbFpTODJz?=
 =?utf-8?B?TTFBcTVETHVpQjZkR3JJYXZ3N001N2ZjRUdEVTZUTGhTdE5sN284SEFxOTIr?=
 =?utf-8?B?cjEwcHRmRjIvdC9VUlJ3VGZlTkk2RVJmeU5GQU53YWNBM0JXZ2xQYmh3OGl2?=
 =?utf-8?B?ODFGOGE0cEtqUlp5Z2ZKRzNIVHU4aldCRTZuVEEvc3JIQ05mZjBIVUpFWEpU?=
 =?utf-8?B?dWRxV2QrUDY1ZDR3L0ZkazFaWmVvTC9oalZGVDgreTNYL2htclZ6VW52WXFX?=
 =?utf-8?B?eEc5eHNVR3lFRjFQRXpTUnRYSGhCR2E3MkJNUER1QU56Qk1uWE04NWlwSUwz?=
 =?utf-8?B?cXBkMWJQNnY2b3dSV2RlNWV6TDJkZ2kza1c3Qzh0a2w1SXJRL0NOaG9CNWdB?=
 =?utf-8?B?VHVkNmZQOFJLeFFqRFNQMEpyM3J1Mmp1ZnJFczE3c1NHbDkxYm8rdGdkZGx6?=
 =?utf-8?B?aGpFcndpR25DbEVtS3NCMFJaRzBYUXNGMTc3N3hGTys0TzkyMEZ3WmRjMWZr?=
 =?utf-8?B?ck1KT281Wk5ZejduZ0F2VUh3U1FtbFc0VDM3VmE2N0FlbXhTNm9Qb2wveGRw?=
 =?utf-8?B?NnRLVUY4aFJVaXorNUxEQmVnaEVCdHoyUEE3WXJyMllEdnhnbFpYZkJHQ2M0?=
 =?utf-8?B?bGgvaXUrTjEyVG9BbmF1VUcvNkZuczVvRGhhVnU3S0YzVm0vOWQ2QmVBRC9R?=
 =?utf-8?B?eE42cFFnN1RPTGdwSng4RHNvRUpkN1FMd25WcU10YkpYanltVTBQb1pCNndn?=
 =?utf-8?B?cW1kc3REZUNGUks1NjNlY1RVUmovZVo1bzdLYWhvV2dRTGhtL0NlbmpDR1ZB?=
 =?utf-8?B?Zm4raXh4cnhZWW9zZ3pOVmdhbWFjYW5LN0wxdDhzWTFHV29lNnVDOXk0V1NK?=
 =?utf-8?Q?PKgF2IqmuM+cqKQg=3D?=
X-Exchange-RoutingPolicyChecked: qVyu0Km5OzmJErFcX7CrCDfmN9QMEtaFXda/Ilqf7S7JvkGuXedcz2SF+wp5BWevJjSoM6yg+AzOtk0qADlMdsiGhKvmioiOpRx+15xvTHfg0zhR+h0tV6KFIwLCNbOLu8ADadIUTaI2bu/XhT970VLCizQ+p01aNeDsAm+Vh4RP3mIQnLl9Q5HqEErOhKsDs9112j0KumS6ScldfL1k3fZLEFZjay11IpBCrE8WJSs1fmTTzMpmQbJJOT0WvFJnowiQ1pMX64KwvX0RtfN+oHOXy0AbSEnBJNB+tVxOkUfdqKqdG10In0sjxj/Z+XO/NUz5RMIm+GAkMj00k7aXYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 386f61bb-77e1-47f5-92bb-08dee6face77
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:36:41.5095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UX8NPesx6qPsQtHd7SlEjYnGhTw11qcVDyfDdX4oIYvalaN38dEICvbZbmU+0anxQoYSW17qhcNaPoK0h19cWgK2sIHircFSh93FImbKpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
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

Hi,

On 2026-07-15 at 14:15:38 +0200, Sebastian Brzezinka wrote:
> intel_display_poller only needs the register/MMIO helper subset, not
> the full libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 0cc62b54d..2a084a0c4 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -17,7 +17,6 @@ tools_progs = [
>  	'intel_bios_dumper',
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
> -	'intel_display_poller',
>  	'intel_framebuffer_dump',
>  	'intel_hdcp',
>  	'intel_opregion_decode',
> @@ -128,6 +127,11 @@ executable('intel_watermark', 'intel_watermark.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_display_poller', 'intel_display_poller.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
