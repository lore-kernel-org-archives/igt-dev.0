Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB49FC4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 13:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A33310F314;
	Thu, 16 Jul 2026 13:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrZxeiFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F4A10F315
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 13:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784208486; x=1815744486;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vaesvZlzHq+hjcXi+rbe2zgWwlj9wV29LhqqDQYxLs4=;
 b=nrZxeiFkdJ8s6r6N4Lw50RFRIVk00IRh9A4QfBkCS5xZwG4NxioOLEdO
 cuhD72GranEUTtT0YYgEtRu2lVIYpdkCLPfQmZO9QDqpNXDIaqGMPdHId
 V3ukT9MpYRFOrHXir8o3nodVFNwK5dkkt4H4IY9t/h1ralJdY247AyH55
 jahzxqOeUEQb3vCq14JmgrJUkLCK4kjymcMzysDCCP4CYc0rg8qrIu9xv
 1aPwJc6GgosNFuAEdibi4ChzbBGtCpN6xac0huKLOQe6PjK6zpMXvYR07
 LUBNJPalLlY9rYbEaoY9h7lR18MwBloazvucszBrk1uf2Lje4dmO6Pvuc Q==;
X-CSE-ConnectionGUID: IUl+bkbQSwey6t8l1gPHmA==
X-CSE-MsgGUID: fga2t44tR9WUcEIGUwDIrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84907316"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84907316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:28:04 -0700
X-CSE-ConnectionGUID: 1zTXSulJTHGnlg7X8P1tLA==
X-CSE-MsgGUID: yvDR1kOaR82rK9W+c7a87Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="256537898"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 06:28:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:28:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 06:28:03 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 06:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANHi2freinZiERvB0uv7KDy++WADINscdZZ4ckuPcuaTULLZ+AnTI1XmKlqCi+Vcd89FnvQX5pmd3/EViqDkNeFvymRt2g93cAOhbVrfiHenaVmviMAxXNP9X4X7TFQOSp8qapRZGH7MTrrSPSTpu+yIt3WyLZqyMhFWotRrPTeXAgM29uoXA0Oku1eNfCOo0gsqQqMFA7AkSPPjcVP5ZgQSFfcIQdF2Z8JoNAJ0PPW0vj7Dvh4ruEyyEPChULojpgGJAwR9BbO974a1ns8N+V9NYooTutkp58mf0VCUhYvjXkEl9NlQABC4Eo4Le7kWGueYE8KRkBRtoC3f+Joepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnJSQPL2qfFXJDDJvzHDJhMHl6T6PRYqt2WQfqYwGOY=;
 b=QDsv1JjguEjh6Y+g8WJFi50i48xcfuK92iYimT+oWDqxg1a5SYrzBJR6gR1jRfKjLQzMsCNmNFrL4wBckN40OruzTyfOdLhlf0FUIG8pE4lN8QyajItEOsGcw75SJS7mLe7wUTBfDzDFXaGCaGNH5bNucB7gZwt8REYw+7ZJH79vEiiMDNQdEUo3bzbtm5jKiaEbodP4CB6DIxsDQu8+sXnYAGnX/QP0eFsorLcGgznUFK/DbnqnRcE8ZX3cozXYO5zbRspTruBdTso2fUIGb1raT4iNCHmPlJd+jDjT02xfD54Aoyg6oAwYfME5um7Hn7krr9SxtQCslyNyZhcjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 13:28:01 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:28:01 +0000
Date: Thu, 16 Jul 2026 13:27:49 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 12/31] lib/intel_mmio: introduce
 lib_igt_reg_tools static sub-library for tools
Message-ID: <bg56iupk3i4hhc4at2toi7tiaf55dwb245trrb76tvbqeybdmn@m2zbmovjm67b>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <c7be5bb1258d47a1ebdf0309b32059f441f0642a.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <c7be5bb1258d47a1ebdf0309b32059f441f0642a.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::14) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DM6PR11MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: bf55fa21-9258-41f9-93bf-08dee33e0ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|6133799003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9yGygV9IYUybo0ghXTc5aEomTI6RQnqfrNdUEZcYpUx3sjIYZ+XgY6L4fReAhla5bTZzcMPYfRclwFlrxnfo+/PIY13G/2Wybf8BxEPXEalegHZVcHmabhGZ6YNYbyuCkI2lp8oVoxCOTOcYaFR0GRPfaPJJy8QoPTgmTegSVdZ3RIDyKDXNIG3JXB2vgAIJDP3XDZN9RcnvfuLs/Y8cW2gs0NIDv63JldXRN0qSweGpslmJ+eCnB00HChaF6da3+CotApsaRw3UKx+Noicw9HatPSd+XDZbrMFgOhv2SG4PLQFAcC1FpayxhFCcm7z9KulphvYf+IGmuWpQ/ul/zvVrDtQDfsstnaPH4bFsHel1YPHgPng4Hp9nzwXGxidqUTAltaGZghNOoMZ36XlQCHAhSDtRS3m8lHjFZRvM2Tqj7ilfuimSdeqzCkRgTIV6Izmsij35czoztyOaB6i0/2tFfGjU7tSSKDKWkq3hIIMeF8sFOQl/09SS68Wdutv4+2DpHuVcai1yYsW1QmWOlRKnP2j6eRDQljZtPS3uDCjvCt9O9Y6699H5l9VDSmocgwXLYLllV3NEtceqT2u2GVff2mA3B8lkqPNvRKZbujKZIF/zkxJ4CaLl2F/nV1R2yd5i+ED2uCNvIz7nyjRE4gHNSw7yutMBw9I69mQekrE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGozS1p0Sml2R05MUnRFTm5TTFpjVVZ6LzFza2lqelF6QWo0S2VxQ2JVZTY1?=
 =?utf-8?B?alBPRUc3bkxwOHkrbXUraGtlSVRCYjlXS2cvd0k3Sm1CNllocmYvdVEvK1dR?=
 =?utf-8?B?cXhmQ2xQeTR3dXBZci9sc2hGR0hQUStiK3UxdDdpMTVJU2Y0THB1S1RZMUxL?=
 =?utf-8?B?MlJ1Z3Q0LzN1cEF1cU1nSURZbjRmY1Z6cEpMNFc5eFA5MG56VnVnUDYxSkVL?=
 =?utf-8?B?elpKV0xEMm9rY2pEQXJmL0ovQUp4anpHRjcyRThvekFtYVEvNUxRd0JGeW1j?=
 =?utf-8?B?MmxWZmFuNmRwRzUzWktha3pOL3UvaS9ROTRSUE1HMEEvTzBhei9nbmlrSG12?=
 =?utf-8?B?MllyV2YrSFlEMVdGU3JQdzZtdXFJd1NDL0pkK1pTZ3IvNXJKWTdELzZNMWVa?=
 =?utf-8?B?aTI2eFY4dStDM0oyL0h2WTRvV0J1a0p6TlhQYUs5VGlLVzJIc0pFeEdZaHl3?=
 =?utf-8?B?NWhZRjllREdzck4vSThldWRnanhXZGUrRnVKbEJhdmIxSTY0WVZPN0FMRnov?=
 =?utf-8?B?VDhZUExsaUQ2dThPTFBtMGUvSGx2WE5hbkJyZC9JaXpLNUZhWGJ3ajVFWE9t?=
 =?utf-8?B?czVidUJ4ZzhqVDlmREFtamlmZGo5NmtVS0dqbjI1TTllYlJkdENlN0ZpOVpY?=
 =?utf-8?B?WXg5NzVFdHZOSVFMS0V0ZHdid1E5cHBsNTkvK2MxNGx5SmkrTzJCbHo4QUFs?=
 =?utf-8?B?a2pKK0tuLzhlb1hFZGJ2c015aVlWdEs3L1E3UEhXVHJicDVUelVKakUrTko2?=
 =?utf-8?B?eDZrUFZ1bFZmc1dGMjlmQnM1WmhNaCtjZWtrWk8weHNtZWtCMUt2dmFGdnhU?=
 =?utf-8?B?RkwrMDV6ekpBNFUxekJqcTZwQWZuMjBZOWNZS1dkQ3hsK0JuZnNVdFo1dGlK?=
 =?utf-8?B?Sk00NW1zZlBFRXlnUjN5TmErVDM0L09FV2RPZW0wOHowRldKNmpBcmJxOW5r?=
 =?utf-8?B?Q1NaWExDQzlobFk5TXpHd2RUWXhHb0U5Y2pVTktGVnA5M1F2M044Q2hMdlRI?=
 =?utf-8?B?enBtdnA1UlNyZ0t0RnFJZ2RRb21RR1F6VVl0QjAyYldyNVVqdzA5VitOSDZS?=
 =?utf-8?B?YkFrR3FUazdCZHdVOEtOQmVDbDV1NzlZMFVxT1VXckVZQkF1WkU1UU9DR1pC?=
 =?utf-8?B?eXZCUkJ5cmladHVWbWlWbjBCYUZyc0pSNXd2STR4dmlGY2JndHExUEl5cnNO?=
 =?utf-8?B?MWdNNmJWTHpkSGxkNnJtbExYYWFSQ2xRU3o1czlHSnZQRHFyUU5mdkRZTHhK?=
 =?utf-8?B?eUkyOXp2NTlTZzd5TnZueitkVjZYaWp3VC9BUVVqQnZWTjBSalBuNEVvbzN6?=
 =?utf-8?B?MFBWRmtjV2M2UXcxYm9FYXlTVUlicTBGRWpyZVRnWS92dEtYdUx0bkd4K3lR?=
 =?utf-8?B?TVByUFhPK1diZHlHL1RVQVFXeW43STIwZXdxbi9wYzBOa3JQVnh5TjN3YnBG?=
 =?utf-8?B?VmRraFBsdDRzYjdQb1crVWJMS09SUGJyNVF0OUdQQ1YzSkJPQk9hc2UwQjF6?=
 =?utf-8?B?R3BvL2xsZkNuTmtHeXY0TzkzZlVwNWkxdEx2dW55TlpMR1U3YWlpNFVldEVL?=
 =?utf-8?B?WHR1QldyM3hlc2E3Y1psTy9kN1FlSW53cElmNWYwcVhvdGQ0YThJM2Z1Yktv?=
 =?utf-8?B?blhXZTA3VFBYVVF5M3lDWU5DZUFlS0xDRHNrNXdiMG5xNDJLMTlocnR1UVRy?=
 =?utf-8?B?K2NzZEZjM2FIUDF6YjhWaXFoWndkOXQyOTFwQ1Y0U1ppcG5UdXNESzNDQ1Ev?=
 =?utf-8?B?c013UFA3L3FGSElieGZuYXBGZnBqcE9OR0JRSWZmUnArbTJXSWIrLzNlclFi?=
 =?utf-8?B?dng0MGY0ZC9oRzRhOTRWL0d4c1kwTE1rQmMwTUVVbkk1OXZSMkVFTkhubDZw?=
 =?utf-8?B?cnFDZ1E2WUVqTGVnYlFIVUgxYStNQTZ3bzdJeCtSWS91djQzNnYxOFVJS3py?=
 =?utf-8?B?bUhWSDVDZlFNNDRTK0xUY29lUHZtV1AzVy9uWEFWVTB6eDhSclR2NHVsc01p?=
 =?utf-8?B?NCtoVThsOGYySmR3ZUZqMXg3STBod20wcFFXdUs5RlBIdmN4b3czWHlVYnZj?=
 =?utf-8?B?Um0rR0lDcDgxYi9VTU0xRGFiZ1JwQWJGR0N5NHFueVJSZ096dVpVcWFBUDk2?=
 =?utf-8?B?VWlqb0ZidkIyVndQdkQ2UjFTSFR1cEZETWxmQTJLZGdRRDdzeVRxcUl0dE02?=
 =?utf-8?B?cW12NFIydU04NVBkM08zNkhSY0I0aFQwSDJwQVdmeFVpdUlva3p3VnNXcEo3?=
 =?utf-8?B?dGxLam8vN2tKakViSjdFeDEzb0p1d3FxYVBYTlUwTkNJcmt4SXk4RDBtYmJU?=
 =?utf-8?B?UzJhTHhUNnVBNUtJcU5KeHltTGRGUmhaZS93VXl3VCsvVE5Vam52UXZkY1Vv?=
 =?utf-8?Q?Mbb+UxmInhm0Nlsg=3D?=
X-Exchange-RoutingPolicyChecked: eHUlXpiPAy1D3am6wKeWCJ3gXrpIJqanZcJTievR1VZFHYc2ulwtNMr0PipOvDDrzxRXWc2xiuokeqKT6+luJKhdyyy97TICA4np2V0nLTX9Let3nU8DWOHBWRKHlp7An4USIxd1aiFek3I6Fr/OkpAfqog+n5Ejm+1WSFi9qOmDOoicOBYR4qayHEqCLU2JqTFTMjKysvMb4QeO4Z+x5shOhIImNuaADW6MyXjZvv8bWp97B9hKXYoSN2umgW/T3wabzn1YYHYagbnwkAsZ8gNIWQ4oY8iQX2tkawZ6E7XGE1+w2tUwQKp0n9Gfe18bp5mTRc8QN16+tnRjSFM6Yg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf55fa21-9258-41f9-93bf-08dee33e0ef9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:28:01.4006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkYvDIYNIaOejADSq4KY4oFi6zvzrd/8ddCZz2wPn+9lLBA7FwlogzNRYbW8Y+dqrFSZpZ3AkUWsdHIDFzNetaRfbqMfebKIVoEltd1ns+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
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

Hi Sebastian,

On 2026-07-15 at 14:15:22 +0200, Sebastian Brzezinka wrote:
> Add lib_igt_reg_tools built from intel_mmio.c, intel_reg_map.c and
> intel_iosf.c.  Tools that need register access (e.g. intel_reg) can link
> this library without pulling in the full libigt.so.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  lib/meson.build | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 8addc8982..aa8eae68b 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -437,6 +437,21 @@ lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
>  				                     pciaccess],
>  				     include_directories : inc)
>  
> +lib_igt_reg_tools_build = static_library('igt_reg_tools',
> +	['intel_mmio.c',
> +	 'intel_reg_map.c',
> +	 'intel_iosf.c',
> +	],
> +	dependencies : [pciaccess, libdrm],
> +	include_directories : inc)
> +
> +lib_igt_reg_tools = declare_dependency(link_with : lib_igt_reg_tools_build,
> +				       dependencies : [lib_igt_chipset,
> +				                       lib_igt_tools_stub,
> +				                       lib_igt_drm_stub,
> +				                       pciaccess, libdrm],
> +				       include_directories : inc)
> +
>  i915_perf_files = [
>    'igt_list.c',
>    'i915/perf.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
