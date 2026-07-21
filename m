Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB35C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 07:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB8210E64A;
	Tue, 21 Jul 2026 07:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kElvthDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D8D10E64A
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784619474; x=1816155474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9c+E1L0ZA4/p6Rmi5x8oAWp+aGoNZ5UZa4nZThC4nMY=;
 b=kElvthDqzZsYGE0x0NtOF67gJHG5BSUaoODRoD8f7m61Lx+DOyhxzHWo
 Eeu6uXsHHSDgXQRLKUelvn2csuSDvL0Z+htWL8ln0nmZ4Fu6KdYwkHPSC
 as7fD2wbm9oCGxYhitZt8yxpjm/XcewgZsLFvXNdylR52arAQI9gf1kjg
 BZBTOpFIUkqoAOcInYItlUCQe+DJDkcQmlj5dcFJkdb2kAt07IA1rkAjc
 FKpl33rUBrZ+P4zBi92Th+9hdQVlcBYeuzR9A9kzBRE5BrxvBRFjbphgN
 k2Kculk06EiSrdiVYXBqw8IAVE7pIWH3T78WYuHW5lgUnscYZj01frT8m Q==;
X-CSE-ConnectionGUID: qqdiulKQSpaML5aMQWSlgg==
X-CSE-MsgGUID: HxlROxF1TDSQt0I541KGPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85087279"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85087279"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:37:41 -0700
X-CSE-ConnectionGUID: nZLo7aHyQKmsLjFZSyvV1A==
X-CSE-MsgGUID: nsxHHUMOS++7Y6DtIepkWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="280958680"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:37:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:37:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 00:37:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.16)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:37:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnH1INa6wDeOErroARJVM4ZMCLKFtkz0GPiVOaUC2hBG9kaLuf0HMaRHL6/NBbVqwbenLYmI0VvFZX3DCyKxEBX+6qt2XUySmM6fO2pKulpcLViSirrgS+S6VkyCts6BktCAD2npgGsDBF8/MN9q0H2xunCHKsff9c7jz+aG0Ku+PCnjRBYbjsNpXDjy1rZ/mbZCLoZBcU0M5PEOhvb3FHzwKHnXVqHFDvioAGYKc7Jv7F8BA8haLgAlxRJGjh2lxil0KlJY2/0zQ+qErJzEAfYXUUv1iEaxqA5bam/seOpK1sGxuFokdnaoZ9qdg93vJD9hCex5bd6QKAdl7M+66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXtxYOTL3b8c+XrUfILe4sUSpgB9kdwRRRvUzw/hnbc=;
 b=IZDZwD2kgWeCiRietMkTz50Y6nFWTMY++Jz2tcmYLP4qdbmU4bQ3WHdaLs0Q8LiLvviAmbXcxDfa13y8+DCWvFVuaJSNzT2f/997ZZGOveN87zTMr3CU6wyMxWkLuEqzed8jaIFT2CqvXfky3aiUv+srkHLo0BaopBS/aIQtE6EGHwa8FSaVp+zDdYxpBM+VqMbuMzy8XRrPmTQ5vLV4272tU1qqs5ijqnnA86IBs4PcDGcV5xXJuFg07LNzBd/Im4t7VjEOFEOEIxCs5CDppKe4FbzcEwjbZ7PimhSSLtwyarnDQa3RFVwlGRAcag/efHaNGebujk7qxuoeSBdd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:37:36 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 07:37:36 +0000
Date: Tue, 21 Jul 2026 07:37:25 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 29/31] tools/intel_gvtg_test: link with minimal
 sub-libraries
Message-ID: <6qlytk3gz5eiloadmw6ufqmfmtgfvl4xkxc47kweqf5ggu5cyy@7iwhkkjfazkh>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <9b1b3b0e767528df7b888bbd2e285401b023f57d.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <9b1b3b0e767528df7b888bbd2e285401b023f57d.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f8a966-6ddf-481d-06ad-08dee6faeef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ipBNKov9XF5HFg/dQijbjsqDo4hwiwcV+CKA4WlNymvsCbfFQPbwoGzgEDXjuIsjcoidnJLPk3fPVVfPvTKDR50uYrEDfUAnh53XZdVzIywOiUqvR9JC3uOa6IknsFZGp3DfhlYPpAJisltMzBV9RuJGXLde99vdVa7DstMprazMtqWEk9a1oqp3e67pizHx4+sUOx4DycOtR1KEvy3yKlzhx6a2tQY2CC7etsHxf/YX905fjQJ4Af5vSjlibvhYJ32VaVPYIzh2+ZutOnvBytxOpXaObTB7TVvW5lI22xgohmBJ7/966QOsohDLOC2Wu/U/k2hdkm+AzpQxs9gWVgGVKyL29MOpA4399ElGtG67e+F8djozI/qdvg0a9QV57VZJg3BG/oxJ5ToaBBuDTuhlBLiyxqCVhr3+OcGKI00d+Il+LTJ6kxxUZbJp7iFqKprGFiTt2ihgG04xnqFOL3zxF0iqVqEcra0ATSpdO6nC2Zv6JM+izcXEfReRPRN9OptjhF/TsIkNyA4lfHwpqqV+FqEd4c/XIB6Kn+D0Bk6nNO7uL6MUSufRcqZ7kHawbyLTKdL9SalCZkbid5Rk/T6tO16tVPFmfPOSb2GpJqHrQ9kuQsuOaxKINy0tqr0N5gML2Pfabe+RqbpxsPBdFMyFoUlXQCDUex+v6ffwQhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjBkZk5ZSDRmQkJOdjYybG4xZHpZQ0dTWStISVh1VW1jNnVJK1NmRm9Kbkgv?=
 =?utf-8?B?aEhTWTMyV0hBb2lSSGxLUmFWRTBtenNHbHBiRWQ1YVcxci85Q2J2bHl5dnZM?=
 =?utf-8?B?NFpiczRMeVVFdHNiWHppNUI2QXJSUGxsWFJNbS9IdFZuYjRZQUh4QjQzeCsy?=
 =?utf-8?B?RWcyd01QcmVtWkp2VktWN0VSTWZFZzZRN2pQZWtlazA4MlhLbDRwc1dBQy90?=
 =?utf-8?B?c3RhNWFIN1VwUTNQakljajZPN3EvQWpiakg3Yk5zMCtNdHZuY1I2OEdlTFIx?=
 =?utf-8?B?aG5ibnV3cVVkbG9pWEJLdW1oeHdtWTg3dy8zam1ucVlBSTdlSWVId3RLRDJa?=
 =?utf-8?B?b3QwWVZpVkFpNUFZdnEreXYzTlNtZWNqbjN6Q0NXR3U5Y1JCdDdsVk9DdkRU?=
 =?utf-8?B?WlBlTG5iNFdwenZZajk1NDhSZTVFbFRFUm9uZGpJQ2NmNXM5ZkxUcFllYmQw?=
 =?utf-8?B?bEdyUHR0NE9lQTFrclB1WUkvVEVwOG5rL1J6Y2Nqc1NPOTRxbEhPK3NBeW1k?=
 =?utf-8?B?cmMvVElZTlZ0NlRwd2FieHFmbUxSU1VpcXZpVDNGMmhNaHo5QktLbGpjUkFq?=
 =?utf-8?B?RC9qNFY3VzZYL0ZlTDBPcmJ1eVFKaU5tcDRxVnVDekVhN1pYZ2FhNU5HZkRj?=
 =?utf-8?B?ZUZ4SEttZDQ4aG9QeWFwcUovY2JFODhZbDdiUS83QThDSER0Ulh1SFMyZUZi?=
 =?utf-8?B?MnQrRnNVVmNKd1doRzFoMWNnNmtSdHBFTWNwZFl0OURCei84bnlLcCtjUnJU?=
 =?utf-8?B?UEFVN3pEUXJIV2MySENtQnRvZWE0dnplQlkveUZUYjJUd0pvdmRKaExxajZD?=
 =?utf-8?B?TVJqdk9RQmw5cXM1SUw4NnVKWVFVMjYzYXUyMjB6UjlQN1c5amdTaC95Mkpm?=
 =?utf-8?B?OFhqbmt4elV3RFJKQ2ZFbnRUUisveUNJREFnL3RGeTRBb083LzE3UzdaYWZT?=
 =?utf-8?B?RU9oL3hydHVLUlpMaE55Y0U0aDBnMXliZkxXaFlmaDRMOEcyYWNJMDZ0RkZS?=
 =?utf-8?B?bTZxYU8zU2FlUHB0Yjd4ZHlKRGMwL3BUK1dSb0lMcXlsVVdvdWJVL29kZUg4?=
 =?utf-8?B?eXF0aG9FT2JZbXRZZGI5NTdXNkVvVFdKM3dlZHVnaHVya2NvcC9qM2dFNC9u?=
 =?utf-8?B?RjUvWXZSKzd2YVNjZUxmN0EyKzdpTkRVcXJ0QTR5b1BrSjZoWVh2MjdiZUtM?=
 =?utf-8?B?bGxJNWU1VE1ETjZjRWpPR1ZOSVM0TE5ENWNxUXZzdzFjWUkxUE1DcXhoYVBh?=
 =?utf-8?B?WjhwTkdUQUttbkJBSTh2TWFUMzFnTFpIWXdxNmhmSjFjZVM2ZWl4Nkg5NzRW?=
 =?utf-8?B?ZHhlRjVqN2xPRDd1aXA0UGh5OFBXMFZHSjJscWxGbGFXdG1uK1B6S0s4U2VU?=
 =?utf-8?B?aiswbUJwYlVEQktGN0hTME95QzZKb1ZrWnpPK2FZNWtFb2p0Q0YzWXBoVkNM?=
 =?utf-8?B?RnptNG1NelZvNGQvMDUwY2I2OTNkRXZBTHdDRTZFS1hjb0pRRXhOUnlQTUlk?=
 =?utf-8?B?Y1M2RHFla1gxbGN3elJ4QjlhLytaOGt0TkROaThjTzk0QS9LWVk2cWNMbHFT?=
 =?utf-8?B?RVVuUlM1cmFJWmtWRERvWUZxMmJIL2tWNk42SDNIQllBVTc4Z1pRS2RENGxq?=
 =?utf-8?B?akUyZFB0ZFAyeUNrb29DV0hMWUJEQ3NiNlNRT3NjVXMvRE9NNFpzK3pvQVFo?=
 =?utf-8?B?SCt0cXFtMFVwVGZ5UHBCMUxMejYvcndIR2V6djNIR0kzbUx5OFJVVkxkZGFo?=
 =?utf-8?B?bTg3YVRac21pTVRRS2gvNU9MS3F1Nmh6bDVjUGZKSnhoeXl3cmNtb2JrRlJY?=
 =?utf-8?B?VnJUR050N1FFRWgyaExLNHoweHFaOFJYQ0s1UHlyTnRGKzhhcDc0VHZzdzBl?=
 =?utf-8?B?R1VxQnNURHZ1NXp3WnlPUmhKSHRzSVgzUkJ2OVVUYlNUOWtDelZ0V1lnQWxP?=
 =?utf-8?B?eU9BSXF6VHhGR3RZNjJUcjZYVXd2T0hqZ05oYVV2d1JKcFk5amEwNjBIdWF4?=
 =?utf-8?B?YmZnYWNlRXNPa0lKV0FkYTNhbVdXTEFOb1k4cGhmbHc5RklMeDRTSUpxY3dn?=
 =?utf-8?B?RElmc2dnblJIa1dLUkpqa24wSkdNaVVQZnVlRy8yQkxzYUhTTXBkTUo1YmVG?=
 =?utf-8?B?WlZlcythTG9HUWpXckd5VFVaZzFsMi9lbFkvNVFRTGxPazJ3a3g5TGdtbDY3?=
 =?utf-8?B?RGFQWERYQm4xUXNYZDhKUS9MdlpXMjBYNUErZWFvQTNBUFlYVFl2VXg2TmQ0?=
 =?utf-8?B?L1VuVDd0UlNla1B3d1VUZ2pvQmR0N2pZb2lpY1QzY1RraDYzVjBRKy9DcFhI?=
 =?utf-8?B?MXUvTGViWGQxTExpS0FDTVVReDdiSWNqY3ZKUFVUekc4NjlDb2s4K0RyTE92?=
 =?utf-8?Q?FYjVGLnotHA9+3Xw=3D?=
X-Exchange-RoutingPolicyChecked: hU1jI1pwFTWlW127P6tmiggXUG08r4eFi8iaisjJqAEsVYnbpwicmmkEhnYwW0G232tr2WLpbzl99/qAUP9LTmL4fD9lEvKhCeZWm8TTGL2h0KB633vsLdYLtvFPf2Xmr+42eg1j4wQ7lunqKrdJ/CjIMRVC3W4RTcrqKDFY15sliq24522p3wrnvMCO3g6nUDp0wQS1JW/iTg5ZzdBP8EEbYxev06o3UWsOLrJx+tobYRMQO/Tv5PyLxG4CoqiQB/g8gZUPou0d3kcOKSJ7r8ZolU/O0NafADbTEFFXOK2CoO5qX8Iy+HRASQAsYvvj1FiEUusf6Oh+ZO2uiN+g0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f8a966-6ddf-481d-06ad-08dee6faeef6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:37:35.9741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJPVXcopd39RYvO3vMppTmXkovdEF4A+pxh0pSEF2PsqU9NIk1cnDZ5cquN1D1+EDbRhoAb8KBmTeQi3AUs64fh5c/CVmIUeqbw9lI/ZnLI=
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

On 2026-07-15 at 14:15:39 +0200, Sebastian Brzezinka wrote:
> intel_gvtg_test only needs the core assert/log/skip helpers provided by
> igt_core plus the lightweight tool stubs. Replace the monolithic include
> with the minimal header set and stop linking against libigt.so.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   3  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/intel_gvtg_test.c | 2 +-
>  tools/meson.build       | 6 +++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
> index 408e703bf..fe8f7a599 100644
> --- a/tools/intel_gvtg_test.c
> +++ b/tools/intel_gvtg_test.c
> @@ -30,7 +30,7 @@
>   */
>  #include "config.h"
>  
> -#include "igt.h"
> +#include "igt_core.h"
>  #include <errno.h>
>  #include <getopt.h>
>  #include <math.h>
> diff --git a/tools/meson.build b/tools/meson.build
> index 2a084a0c4..6e694164f 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -26,7 +26,6 @@ tools_progs = [
>  	'intel_residency',
>  	'intel_tiling_detect',
>  	'intel_gem_info',
> -	'intel_gvtg_test',
>  	'dpcd_reg',
>  	'lsgpu',
>  ]
> @@ -132,6 +131,11 @@ executable('intel_display_poller', 'intel_display_poller.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_gvtg_test', 'intel_gvtg_test.c',
> +	   dependencies : [lib_igt_tools_stub, pciaccess, libdrm, math],
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
