Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6336EC5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 12:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF0F10E2A2;
	Tue, 18 Aug 2026 12:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1Wy/nWK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DA610E2A2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 12:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787055173; x=1818591173;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w3T9Fj11sXaTcSY8+VaMyIPFQbe0Ng42ootkFMrs5ms=;
 b=Y1Wy/nWKZNg7T2/P1HhDn6tnTpWrhpT9YzWJD5ZHWjo+r1QW1cEt850Y
 DOinmD13lFkqoyk8TTFMJo9YrlHJQacTbnKmOMYP/Wseqisa0KJ+y4IeG
 f6/HyB2yoxV7AAUaGikGn3lykCdCzGY/6hDTaOCZ6jPQGaLaEALC03WEj
 deHJcz1TYBCUh65+7EY6H2wRWpbGpbzsvNlNlLPwCcee7cmKbbW4lBSUP
 nfVTCZewdR5mlj6b+PyaLrm/n3RTq7zfGd4W/TjPeu1t015Zh4xY5cTMh
 /s258FBdud2h+B/AKprdFnUICNNvFDZ3qZQkAlmaUCSG6ZzVZWuYUQa3F Q==;
X-CSE-ConnectionGUID: UZ4gYoiyQmWx/o6fxsf7cw==
X-CSE-MsgGUID: DPwUrrJATkiT1CLGNQ0B6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91228944"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="91228944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:12:52 -0700
X-CSE-ConnectionGUID: rWUgFTr9R0SvHHj7OLMZMg==
X-CSE-MsgGUID: 2vPEZDcVQcGKJ+6iYv6upA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="259012109"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:12:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 05:12:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 05:12:52 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 05:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc811z2JsYtEsnCuSc6Djotgo4yqWys/Fi37F6PO2srxhOvLCDVV4ZrPjCZNbyfa9h12sJvBG87xxcgwb+YLtOmy6ZMzf3K2ai9WBv8b4w8+N/cvzuHX27XY6mgGJrZkNUCPATj2vuamUbFvwzyjd8UPkKGj5crFkQkGkdT4ZwUkr+fw45YtsCyJgiAl7pe85RJLQ0MytjQIcV9kfsC0/u/FsKv7zini3iW/AVJFLntOJHFBgj1TyBz6AUm9m87JZUvlHkfJwW2kXlZTpX6lp/5eN/7VUjdyDIXvfumee3fDfsRxbJsPaV/+dpiK2IpqcfvD66vFkVk9keWDparplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvWIcdMsMvzb187D40IQDOmAalER+sPCelfGwlaBaWU=;
 b=bNhqeKC5xF4SxGVDzbAVKNlpr9JodN9SqbJaTdMht+DxHis1J5D1SpwkczfCW9ihFZiyWrlsSOFAZkNeOI175BOhFENojDO5kfWu7yL5DXJtagCmZP5S2MF/i1psZiItMBpGX7uW5I+bgUnNUtaKOqCjUWq8ZVvQmgp7RVvdGUX3DOo73YgonqXYpVzNHzs0tIrQ04NvpiFrhaYTRhBSzbnS+sXufF70TMZa9hn2v8fMClfPWLmS2JFkqgoMpwTOmWA3/4D9lsPvOFGB90snTgzIjSL7fOtFnXpf9UrGOldcXUNN2iIb7k7ZJI6qO6cF1KH2pdaQ1ORARziDZq5PJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by PH3PPFB6E746C59.namprd11.prod.outlook.com
 (2603:10b6:518:1::d43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 12:12:47 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::8e8e:1eb:d7f9:5d7b]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::8e8e:1eb:d7f9:5d7b%3]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 12:12:47 +0000
Message-ID: <c47b98b3-6250-45f5-b4ef-554990495bd4@intel.com>
Date: Tue, 18 Aug 2026 14:12:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_prefetch_fault: add L2
 prefetch fault subtests
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <priyanka.dandamudi@intel.com>
References: <20260818103543.231667-4-varun.gupta@intel.com>
 <20260818103543.231667-6-varun.gupta@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260818103543.231667-6-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::26) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|PH3PPFB6E746C59:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d73280-783e-45ed-b42d-08defd22041d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qxkzNHi0U1HsQ4WtxzCcK0kNwy64s/GrZABk9RD4Nc+yLvojgpqi24dO0aZ6aryh5QaoQt2mFDtv9ZdVsivqb/SWz6+TPJRA0rB/C1RdPHa240Sm8nFm+XVAVP3BZr4pwmPghy7sVDPbONkzBRT/DT2/TO2wKBS0XIpS9cyMZ4RnIoM7JQgRCParicP4o9wt/qJ6uDoxTybgOr8yvMDr2MeC/UxOID+vf8OdDuZhGnboXqpOwOhuj8ZFVXgvQHZCI1yfTcDvADfBVG8zgt/3XnjB//MeB5hPFMHkGUoQ7f/ABHEQzhpwM2mDf+hs3m18mWewz0r/Hmf4zEUhbH1uvL0dU+6jelXqBbsapV8k68f3utDgFUd5RQk1vIB8Nvt+hQ3p4YTd9fRN5jMz7mxvSQxrAuiuZtAMCmbDN+B2HcITFJp3lAVzYaaTZGSRF4JjRmUYMh+JAxRkNwVhPQYePLr21mnMQ/40TRx+YzioUFHcBl4G1ymqgFc+/WO17/lSb1ALcSbA4muVeV4S5oBz1w4qeXcN435VsTaqs48yHmm8o2b3dF2gkU/iibiG/pw9oooI0mdc/aNCan90NGu9Hrny3kqDZDbLTCYCzrVIzuZPjgUTCNo8UfDx4q60eCeEXSJfaiYSy3mvvfU0CBGJK3g3qCznZkRkXu/sHYFEGFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlM5eDFncUhBQU54MGJpUnBSc0xQTG5wckd4S3Z6Qm5sN3R5enpSUDBqNXNT?=
 =?utf-8?B?eVNMcHpraDBjZHNqSzZMdng0SzR1QVJBS2srQUVGQ2lzejJ4R2ZQNTl5Rkw2?=
 =?utf-8?B?YmNSUzdQQzZEL1J3dzZMQ0dQQ2pSeWY0azViZ1dxbWpGN3dNK0U4NEdVaVNJ?=
 =?utf-8?B?bW5DZm5yQTkrbzRrMHI1MklQQUFxNEhPWk5xbFRqR2F1QmRQWHJVRDk5WmFE?=
 =?utf-8?B?V1YreGtwc3dPc3NsNVlKUWdFS3hrODVMbDl5UDZPYnhZVVBUUHNiK3I0bEpx?=
 =?utf-8?B?U1lsQVBrUzBNTTFNSS9vdVdjK1FwNzNCMC83M1FhRExXc29iWFR5YU1OSzJO?=
 =?utf-8?B?THYxdXJOeUJtc2dUY0pvSTRKYW1GQkJuOXFFSFY3L3BzWVJZQjRLRUIvZ0M5?=
 =?utf-8?B?cHBsQjMrajRuT3R2amk1OXZZZkl3RzFOYWFkdk5VemREYTl4aytYUDBpQzJ2?=
 =?utf-8?B?VlJHWXAzSWxoSjVrUTJxakVLUzNKU3hjRENOSzRUOXAzL3NvU0lCbFBYTnUw?=
 =?utf-8?B?dmZyTnhkd0hUMndrb01QQXAzUTFiY3JvT3lrZTBCblVNWTE5aXUvalBpNzNp?=
 =?utf-8?B?blFSZUFubmQyU1NXeVF6NlJPTGkrQ2hlZWM2Yk5FdnBLS2JGSWJoUGtUTC90?=
 =?utf-8?B?WW9zRkVxVGE0OUpMRmJaYnF4TmR5ZXgwaDFUVm0wTk1CN1pvKzVFQUxyYzB5?=
 =?utf-8?B?aUMrMm16bmExRkF3czVLbjllMVJFVG5mdzM4MzhyTTJ4NWtkdU44NjNvUEJ1?=
 =?utf-8?B?dGFmWlFlTnZPdXdSaEFLdUNINjFTNVdIVnpEMXN4YzFoVHFGb2lMUHg4R2ta?=
 =?utf-8?B?Qml3L2VSVUEyeGZKT0N6Z3h5RUhaWmFOUStFdS9neVV4M3VkTzhZaDdHRzd2?=
 =?utf-8?B?eXl5dlR5Q29TYUt0ZTNMU2NYT24xRnFPUGhmRlFoenJTRHo5MzA5ZkpyMVFI?=
 =?utf-8?B?NWdjRXVVQmpNNkVmc0NKdXVsQ1ArT2l4UmtqRlVRWUZqajFBOVpiMTZDUUNK?=
 =?utf-8?B?eGdianpjTGpiTk85S1A5S1F3ZGhreiszY1lmYVp6L1gwcUhKWlNnR2l1ejI2?=
 =?utf-8?B?bkpiU2d3KzV3bWRPdkk1L1NqcGVUN0RGRm5vTjlFa0JCbUVzUzRlUGFuZHRh?=
 =?utf-8?B?S1NHU3BVTEIzZWZodVd5SFZ1VHIzQmg3aGlodmJzY0JDdkh4WS9nTXRwbExt?=
 =?utf-8?B?Kyszc2JJTW5mNW1LREVFL3hkN3dZeUc5d3JvWjNXTmZGUXU4Nm5WbkZucGFN?=
 =?utf-8?B?MzcrT0NkdE9TcG9CSkY4c1FzMTdaYm5NUHVnRXFyK0t3QXgwMSsrM0lGTllq?=
 =?utf-8?B?ZENSNnFHeEpTK2N4MGJnME5UdUkyUWEvUzlCOEdzeTNJU2orU0ptNzZTQ1Ur?=
 =?utf-8?B?eWNHMlFnbVdqZVRrMDNZazJ1TmhJeUl1S2tEL0laU294c1QzYkg1K1RyMVIv?=
 =?utf-8?B?Yk8rSGk5TENrVlY4eWRudCswSm5kYzk0Y0craGlqNnNVWmw0TnZRbnQ5c01S?=
 =?utf-8?B?TW5tWEVGZGVBTGN1eWF0QmRwRW52ckNBS2l3K2VTcUtrN3JBZHNSYmhTYU5Z?=
 =?utf-8?B?QUFNWklEc1VZQUtjaXJTdDRBdXcxOVhDMktrRUJldk1PNVZjWjB3N2dEdVpP?=
 =?utf-8?B?N1UyY3ViYVFMbVFLOWFUa0hmQWNqWnhMUmVsdzJxRk53YVFLYnpuVFI0dFZ1?=
 =?utf-8?B?L2M4Ni9HRXg1S3NUYm80RmZwb3hMZlRyZW1Tc08zbnAremhYL3FjaGFBK3Nj?=
 =?utf-8?B?bG0vT2lmYTZLdDI4eHZsdXZRZXp2NmJkZTltbjJwYTZaOVh2M3RseFBTSlZT?=
 =?utf-8?B?dDE5enkzUEVIemM3RFJzeUlYb1NvWVlOYXhHTFkxU3Z3OGJoQm1DVzFOM21M?=
 =?utf-8?B?bjIrWndxVnAyQU5WQXNxSVljVlk5T2kwUlltcWFNcUVwZGJQT2RzL0dnTXJT?=
 =?utf-8?B?Nmg3ZFF2SGFBQ0tzeFZGeFQ3bi9iWm92V3JyNkR1QVE5UTRBdk1QRzFsUmxI?=
 =?utf-8?B?c0MyanVmMnVDWFo0OU1GajQ5ZGJtcUUrY2g0NlhkT0Vmc3k0MDZNNzYvTDYw?=
 =?utf-8?B?SzZXeTFGdVcwSzhmemw1ZXRPRnFFSXVmNC93UktXeU5SekQ1SFFTWEZOZWNO?=
 =?utf-8?B?blR5NHpIRVl4OWZKeE9DMXhEZUltU25hdkxlalJaaE1zYlRLRnpCZ3c2UnNz?=
 =?utf-8?B?NDJya1EwSEVQMm4zRWdkRmoyVmdVRUowZXJDQzd0bjdSMW95bUFvSnhBOTVD?=
 =?utf-8?B?SzJWQnI5dTRVU0gyR0pvT0ZKM21QRHpoaWNsOEQ1VEI2RTErV2c5clJpM2pa?=
 =?utf-8?B?YjJsVFlNN3liZXRKMmFyQjFDUHlZaVB1MmdKTEFTSmxlSGJQazBxQT09?=
X-Exchange-RoutingPolicyChecked: hwvlwgOoeDH99rHEDGkI/TAF689ZscIyeVe4Cz+hxfq4pAQCRT9MdS6Zz4CzflflhtkQKhEF3mkRl3lxqrog2iSuz8jlpKTb8YEA6cmSIQ6x1x8yEuVyU1qyQbfOMm10ysm77FOsWgdfpAqYkdz9AEqEV2BQwtfdoERK5FGbJqPX5dbKJDzke6qaBeRxnsthsydznAayLl68ul7wzGn4Ecxo6YsytUbLgUMtKwpBaDZNo1eLhhJ5ri5i6aSvwevvdXygZMLSUkSBYL5lf/lBffc4XgCzO+7KPVmEJ3MbSAWrLX+x8Pe6kG+IhDRz2MMuJThuLmGJekQ2nOTZZpliVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d73280-783e-45ed-b42d-08defd22041d
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:12:47.6455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhXDWp95zivAO5/g0E9dxqOYZrB5jtukVLNnAM2PaMOQiQUMAaVaHYrI1goaIWT0K/Kvbl5RYS0Oph+Egb6cgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB6E746C59
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

W dniu 18.08.2026 o 12:35, Varun Gupta pisze:
> Add L2 prefetch fault testing. When L1 cache policy is
> set to uncached (UC), the prefetch bypasses LSC and is sourced from L2
> instead.
> 
> Add a new shader gpgpu_shader__l2_prefetch_fault() that uses message
> descriptor 0x49C00 (L1UC_L2C_L3UC, cache control value 4) instead of
> the existing 0x99C00 (L1C_L2C_L3C, cache control value 9). Only bits
> [19:16] of the descriptor differ.
> 
> Add two new subtests:
>    - l2-prefetch-fault: validates L2 prefetch fault with unmapped address
>      followed by hit-under-miss with mapped page
>    - l2-prefetch-fault-svm: same as above but in SVM mode with HMM-backed
>      CPU page table resolution
> 
> v2:
>    - Include generated iga64 codes for the new shader to fix compilation
>      failures (Kamil)
> 
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   tests/intel/xe_prefetch_fault.c               | 97 +++++++++++++++++++
>   .../xe_prefetch_fault.c.gen.iga64_codes.c     | 17 +++-
>   2 files changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
> index e86cd68d9..4843f56fd 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -81,6 +81,56 @@ L0:
>   	)", lower_32_bits(addr), upper_32_bits(addr));
>   }
>   
> +/**
> + * gpgpu_shader__l2_prefetch_fault:
> + * @shdr: shader to be modified
> + * @addr: ppgtt virtual address to raise L2 prefetch fault
> + *
> + * This shader can only be used when in efficient 64bit mode.
> + * For a given arbitrary ppgtt virtual address, it raises an L2 prefetch fault
> + * using load instruction with L1 uncached + L2 cached cache policy.
> + * With L1 uncached, the prefetch bypasses LSC and is sourced from L2.
> + */
> +static void gpgpu_shader__l2_prefetch_fault(struct gpgpu_shader *shdr,
> +					    uint64_t addr)

Please use emit_ prefix, gpgpu_shader_ should be reserverd for 
gpggpu_shader library functions.

> +{
> +	igt_assert_f((addr & 0x7) == 0, "address must be aligned to QWord!\n");
> +
> +	emit_iga64_code(shdr, xe_l2_prefetch_fault_prefetch, R"(
> +#define IGA64_FLAGS ""

Why do we need this define? Without it assembler should generate proper 
dependencies without hand crafted ones.

> +#if GFX_VER >= 4000

Please drop above check, in upstream we support up to 3.5.

> +#elif GFX_VER >= 3500
> +L0:
> +// Set base address with scalar register
> +(W)	mov (1)		s0.0<1>:ud		ARG(0):ud
> +(W)	mov (1)		s0.1<1>:ud		ARG(1):ud
> +
> +// A64 offset
> +(W)	mov (8)		r30.0<1>:uq		0x0:uq
> +
> +// efficient 64bit Read with uncached L1, cached L2 and uncached L3
> +// sendg ugm load - L2 prefetch (L1 bypass)
> +// Message Descriptor
> +//      DP_LOAD_STORE_STATELESS_DESC (HAS:2209865465)
> +//      DP_CACHE_LOAD (HAS:2209865465) value 4 = L1UC_L2C_L3UC
> +//      0x49C00 =>
> +//      [45:44] Offset Scaling: 0 (disable)
> +//      [43:22] Global Offset: 0
> +//      [21] Overfetch: 0 (disable)
> +//      [19:16] Cache: 4 (L1 uncached, L2 cached and L3 uncached)
> +//      [15:14] Address Type and Size: 2 (Flat A64 Base, A64 Index)
> +//      [13:11] Data Size: 3 (D64)
> +//      [10:10] Transpose : 1 (enable)
> +//      [9:7] Vector Size: 0 (Vector length 1)
> +//      [5:0] Opcode: 0 (Load)

Whole this message descriptor is too chatty and too general. You can 
drop it in favor of much shorter: load.ugm.d64t.a64.uc.ca.uc, see below.

> +// Prefetch operations are implemented using a NULL destination register.
> +// L1 uncached forces the prefetch to bypass LSC, making L2 the fault source.

Above comment is nice, specific to prefetching.

> +(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x49C00	{A@1,$5}

You can replace it with two liners (after removal of the whole message 
descriptor comment):
+// load.ugm.d64t.a64.uc.ca.uc [src0]
+(W)	sendg.ugm (1)	null	r30:1	null:0	s0.0	0x49C00

> +
> +#endif
> +	)", lower_32_bits(addr), upper_32_bits(addr));
> +}
> +
>   static struct intel_buf *
>   create_buf(int fd, int width, int height, uint32_t color)
>   {
> @@ -130,6 +180,17 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
>   	return shader;
>   }
>   
> +static struct gpgpu_shader *get_l2_prefetch_shader(int fd)
> +{
> +	struct gpgpu_shader *shader;
> +
> +	shader = gpgpu_shader_create(fd);
> +	gpgpu_shader__l2_prefetch_fault(shader, xe_canonical_va(fd, PREFETCH_ADDR));

You can incorporate body of gpgpu_shader__l2_prefetch_fault here, I see 
no more users of this function.

Regards
Andrzej


> +	gpgpu_shader__eot(shader);
> +
> +	return shader;
> +}
> +
>   /**
>    * SUBTEST: prefetch-fault
>    * Description: Validate L1 prefetch fault and hit-under-miss behavior with
> @@ -140,6 +201,16 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
>    * Description: Validate L1 prefetch fault and hit-under-miss behavior in SVM
>    *		mode with L1 cached, L2 cached cache policy (fault source: LSC)
>    * Run type: FULL
> + *
> + * SUBTEST: l2-prefetch-fault
> + * Description: Validate L2 prefetch fault and hit-under-miss behavior with
> + *		L1 uncached, L2 cached cache policy (fault source: L2)
> + * Run type: FULL
> + *
> + * SUBTEST: l2-prefetch-fault-svm
> + * Description: Validate L2 prefetch fault and hit-under-miss behavior in SVM
> + *		mode with L1 uncached, L2 cached cache policy (fault source: L2)
> + * Run type: FULL
>    */
>   static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe,
>   				bool svm, get_shader_fn get_shader)
> @@ -296,6 +367,32 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_subtest_with_dynamic("l2-prefetch-fault") {
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> +			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
> +				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_prefetch_fault(fd, hwe, false,
> +							    get_l2_prefetch_shader);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("l2-prefetch-fault-svm") {
> +		if (!svm_supported)
> +			igt_skip("SVM not supported on this device, skipping.\n");
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> +			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
> +				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_prefetch_fault(fd, hwe, true,
> +							    get_l2_prefetch_shader);
> +			}
> +		}
> +	}
> +
>   	igt_fixture() {
>   		drm_close_driver(fd);
>   	}
> diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> index 0df7fe20e..acbfa7a75 100644
> --- a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> @@ -3,7 +3,22 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS 153c8c0a5a3ed448d86f86bb51e8d140
> +#define MD5_SUM_IGA64_ASMS 0cd443620cdd553ad899b68d685d15ef
> +
> +struct iga64_template const iga64_code_xe_l2_prefetch_fault_prefetch[] = {
> +	{ .gfx_ver = 3500, .size = 28, .code = (const uint32_t []) {
> +		0x80000061, 0x60014220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x60114220, 0x00000000, 0xc0ded001,
> +		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
> +		0x80012033, 0x00000004, 0xf0041e0c, 0x9c000000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gfx_ver = 0, .size = 0, .code = (const uint32_t []) {
> +
> +	}}
> +};
>   
>   struct iga64_template const iga64_code_xe_prefetch_fault_prefetch[] = {
>   	{ .gfx_ver = 3500, .size = 28, .code = (const uint32_t []) {

