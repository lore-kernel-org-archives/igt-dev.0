Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8C1C282C5
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 11:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F05410E23B;
	Mon,  3 Mar 2025 11:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuVWnpWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5702D10E23B
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 11:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740999800; x=1772535800;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vkTzXReezIndnt4YsHw8oZK2WIHfhiUHNyvf1ZxWRUQ=;
 b=TuVWnpWJ1MVlkwiEQh3d1S3Bt2VNCUay+t/DwQfgf0Lfr6Q+zfzAPvQd
 CrKVh0x8c3mFtp/2TBwrfzoROEnIWsOM0z9ZX/6MIAWBn6E8vOWxkVl3l
 +B0h8uN0orspf3o8AoJNDLsmsMnQilhxGePsEq4fVuWz6kNWmwirNIjZx
 AWwnut+gACYst+bvbJUiF14N4GXbLqeBEWXLUWO62mvcinpdRsc8oIGnh
 vQwZlkZApCRtjarBEEcqGTvZCG7NHAL/N72yVAr6DiFUP6yCC5d/Nd0hp
 H5VTZzK60gFGmGrVOh46KWMDWJRyloAn5/WafJjHf65YDtGsofzi0Q08y Q==;
X-CSE-ConnectionGUID: VsOaj18MS1OfxJS8CrHUJg==
X-CSE-MsgGUID: S+rqZc6JT3uQkNjyGWEjtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="45521334"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="45521334"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 03:03:20 -0800
X-CSE-ConnectionGUID: HtKogF23QPSWZ7I3UcfBTQ==
X-CSE-MsgGUID: VPLbvOxIR42TWd3rsTyWbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="148870344"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Mar 2025 03:03:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 03:03:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 03:03:17 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 03:03:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxUzMLKw6ztCeB2MlERT/oorNwUI4qMzteVCn4sKgtMvezhzu7tTC3xasjE4s2BlkkADafgJgrUZJHNv+cEQiNAbwgR8YY2R/uE1gr5bqLBcEuQ5buMIuK14jrBM8vx4se+KNv42wduXKPdfXAf6RlNh/aRKrCsHvLNiCF1uL/ofRC6W1h0h8n8sQdRhQY+ThldSP9d/qKhbnLrpDdNGKW1FPjrp04oavowc0fmpyndZlMD/1vyx7aFOkZNBOsb/D8NOFYBhihZjBUNcObtSwMG6CParJNme89cHRShEmTiCNW06oDLIOauYMvnG7/T6pHpLKijLg/At8kuADSoFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFse02GRRv1X4wBTqFsRRCg6Q6f5egcQBmJY42bAspg=;
 b=Mog2cqpk4/pXtnbvFZXd0knFt8sN/4xWqKW3uJIZswFz32qCLRb6RnwF54UYrGUATE8c4QV+IoaaflbWe6cJIzlvfdNEO+Z19oeML54ZdzeUVj9G1ERHjSZMYl4eEJmKqbzouGgq1qGWfGuRbDXW8lLA72NmxFjE1Rr+sV/nlDQFhf63PRopREP4Bcksxl9pN8mGtGXgc+TRICVdd04PdMhTOyaIpPMlD2pOz+0I2poBUQf+YtIKBehdOJ0kGFRIta23cFbcAQ4dRDqbMTyKo3wGfCE3LTycM4AHFsps/yUG5vtIDqi/rT/mpbw4Fv3H53S+yF9MpMPbk2/6E5Zp7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 11:02:59 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 11:02:59 +0000
Date: Mon, 3 Mar 2025 11:02:50 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ewelina Musial
 <ewelina.musial@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t] runner: Parse results harder
Message-ID: <c5e5rdrcrmhrzscf5cgkxeupwitvn2dnxlerahjzqyhup7ihlg@cjvzgwaxv4qr>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250228171519.49523-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250228171519.49523-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MI1P293CA0009.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::6)
 To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW5PR11MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2d2e4b-fe43-4c90-acfb-08dd5a42f5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlY3U3lGZmt3RXhUTTVyR0E1SVE2NVNkRmpYVTR2TWhjbkxKSWp2Mjc0Mk1K?=
 =?utf-8?B?NGIwT28xclFhcjFSSklWSHRwUDJ5bXpkZGRmemNMc2Vjd1ViUmxtSVIzRlRn?=
 =?utf-8?B?ZExCbEpFSzU1ZXJ5dkZ1NVNiYUpjci9HbmcwdVdqS0p4OC91ZGFBMVRFbXVX?=
 =?utf-8?B?RkYxRmVHNkhaTDhDdTJicTFUSjRPUUVnSGlSVkwwRUNoREhQbjBnNmlYUm8r?=
 =?utf-8?B?R0duVVMvTUdYRVRIKzJrT3BPU2tRSFA1TE5vYkZNOUg2TnVJb1Iwb0NGYnU2?=
 =?utf-8?B?eUhKOTFFVlhRYVkvSG5hYWxrMGFuelYreVhsd2xCYUt5a2ZhbVlidW5GOEpQ?=
 =?utf-8?B?eUtSZ0tVaW5VMFo4L1M0RDJYWDlnaTd5NGlycGVlUHl3bzVtWVJnWkc0b0Jl?=
 =?utf-8?B?NGVyem8zb2FSVkYrWWUrOVJtSDRrTjhDM2Rua1dIdXZQUVB4QXJPWmtxSENR?=
 =?utf-8?B?UnhlbEpQZWlYa2ZYSGtpL3U3cTFOdXdOWWhoTTBha3B1TXE1cnB6REZhMXF0?=
 =?utf-8?B?bUtqeUNIY25jQmZscFZoVGZEcHFkdXltRUgzZEVsd2xIY3JRNXFLYWw0VzRP?=
 =?utf-8?B?TXhodWt6Uy9Bei9jZnhPQzJtL2dhUWJ4RjFjekNZVUIvN2tBUXhUaDZheXV1?=
 =?utf-8?B?MS92NkxTaFJ6SkJPRzNUVDlScFpoOGpCOWFVNDVzVXZ6Wi9DOEtlRkdkeXRv?=
 =?utf-8?B?N0dWd3JlV0tnZVdCd0YrUXB2K0VETkRWMlRUd08vcWtBRXVIRUUvRmlqREZW?=
 =?utf-8?B?UGFYMEhiYkpHc3JKdzE0VDhLQWswbnZXQlRabkZqYWpzaXRzVm5hMVJsczFB?=
 =?utf-8?B?dDA4QWx2K3VZV0l6bjFVR1ZzNFYrSXcvV2JDQ0wyNW9VSFl2Mk5JVDU5NTh6?=
 =?utf-8?B?Rk5FMlg3SWh0VkM2WC8reGdkUDJubzFzN3NZekErRVFXcWdWZEtXNDRWZFkz?=
 =?utf-8?B?SFYxaWgxQlVaaU0rd2NIQ2hXSGl5SFI5Z1VoZU1CMEl3VGxUMUVMUll2TFQv?=
 =?utf-8?B?Z1dranJSRnpvR2dNZ3VSaUxzMml2cTdRYW10MXZ0LzVjdVV0RDl4L0VIcFZM?=
 =?utf-8?B?QmxzRFJnb1ZBT1hrMDhseE85Y21vbnNJVnFQd1NsdVdSSUdyd2dCRTI0bXVV?=
 =?utf-8?B?OW5ublhoc2xHMW9pbk1jWkJ2WTNBNzhCei9RN0dBOFIvVkV3aFI5RC9WaWtl?=
 =?utf-8?B?cG55UURwaUo2VjFOakNxd2lVSTB6blZUOHRLVGs2Vnp2UnEzdjd2bXJRN09o?=
 =?utf-8?B?WGQvTmJJdDJrZ3VXZ2gyMnJXSHhvUVMrSVEwVDFxc3hxUnZTVm5RTFJZSFo2?=
 =?utf-8?B?ZXZPVVJzMUFkZjNVNmcyaU1Bc2dVcnhmL3JwUENWdXZpNGdFaG9SclpCYTRk?=
 =?utf-8?B?RVBOZHVGRGdXM0tiMkgxekRBOVZDTkhhS0FHSCtKWjdOWm4zZjZnZVcybFN5?=
 =?utf-8?B?OEtNRHJ0Nzh2ZzJSYkUyMDRWck93enRIVUU2YlQ3VnFWbEpmREg5cW4vSFFN?=
 =?utf-8?B?UlRrNjNqZm9aK3R6Ym9mRFNqK3AwMW9DMDkxaXJPNUxZY2VTaXEzNmRSMUJX?=
 =?utf-8?B?NldCWWMwZWNLNzJXS2xMMFl2TUZIM2VZblhLTnlpazhGSlRHWExUUnlxQ0VG?=
 =?utf-8?B?ZVFyNm41RFdOUlZKOU0ySU1RdlhPZHQ3Qk1DN2p5STZiaThxOGJaT1ljU3Ns?=
 =?utf-8?B?U3FPdStWc0YzaElZVUpqdE9MTTNWc2lJSmlqSlBxMTY3Um41aW12TXZhMG9n?=
 =?utf-8?B?T29pb0tXT212Y09IUktBeHJxejdFMnhqMGxZSTFHRmxlUE5td3A1amM0eUNH?=
 =?utf-8?B?eWJuOFNNbGc2OGxZT01aR2d6NlhLZHJWbHpITlNtRUFxbVpCRzdzcFRaRm1C?=
 =?utf-8?Q?zH55EJ+sxkEui?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlNseGI0S3g5NFlDSTRBdlhLU3Z3MGV2cktUb3l3NEg3cmJSSm5TSTlVa1Y3?=
 =?utf-8?B?QTEwN1VwUGxDWVBZOWYxc05GWjNZMERhQnNlRnFFTFRpaE5XejBsanNIeFhG?=
 =?utf-8?B?M1AvdkpPN2FDVGMxVzAwWExzRnVFd1NScHUwOHE2NzRYSUptYzJQQlBzSWdZ?=
 =?utf-8?B?Q2FOZkFTQVhkU3NCRFJtckFOM092S2N5eGhEMXVsaGlZVjdIOWRQZDlycWRk?=
 =?utf-8?B?WkF5SGRzNndKalAxQUR6TFRPUzZhaVo2NXhKVVRoUjNjWVZTeGlHeU00Umda?=
 =?utf-8?B?aytsODdDcVk1UWdxSHlac3NHUHZhWTMyY0hPMEZFWVU1Vk8wb0FKOEdJY25h?=
 =?utf-8?B?bE83NzRDL0JQMzBUaGdweDZVUTd5aW52cXRqc0xGRlV2cEVWVDU3K2lDSVNK?=
 =?utf-8?B?VW43ZFZSbTU0K3pmS0VmS0VLT2hCbk9pT3NnQ3JYaVFLU0JZenlBeUV3TnJm?=
 =?utf-8?B?aGZSYkFSS05vRTlrQ1hZVjArVHd5M09JSU9vbWREbE1kMlBkc3R1Q0VuU1Qv?=
 =?utf-8?B?Nm5JMS90SnJVZ1R4emRqN01xaVBjUkwyOEE2RHdkMjFEeXdHSE1UV3BvT1cw?=
 =?utf-8?B?T1hac3hzYTZIcWM5MDNlaWxKMzB0OTBubzNSK3ZQSGlDK3l2NTl2WTZxYVF0?=
 =?utf-8?B?QzVhMmgvdi95aDRJU3RISmsrajhtb2hyd0V1WU1ZVlVvaTlNZWhMazc0VDJP?=
 =?utf-8?B?dnArVlZZY0JlL3lqeEhwcDFvUkRzMmgzMEtrSzl5KzNTSlg5MzBEUHBhR1E0?=
 =?utf-8?B?cjFCMUNWZ05Ed3lOek93M1BqQUJsTitKTVF3STFFUURDTy9rNkUyMnF1Ykxo?=
 =?utf-8?B?bjBhKzU3N3VZSGJJSGdSOHpQSnBwTVlaRWE2eTFVRndnN2oxVEdUWUZlN05w?=
 =?utf-8?B?WGFUYlUwMWRzTzNkcStYNEFLQzFCalFrbXNjQmRDaUhTQjhZR2pMN1krY0lh?=
 =?utf-8?B?dFhzRzBvZjRvR3B5aEFUVC9PelM5RWtmQy9SaTlxcFZBYkVxcXJSTVJxTGlk?=
 =?utf-8?B?MUl5S3MzRnRaUkFzNlpjQ2dXYXZDSXppRW5Nb254L2x1SitoQ1M1ano2dUhw?=
 =?utf-8?B?QUptWXd1WVdaRVdzSDdJYnlVNGtyY0FlUmtTQUpYUUF6QXY2NWhoazk3WFVa?=
 =?utf-8?B?ZXNnQ3JoL3NUM3FCTmNWMk52SmRlVlRnWFkrbFhVazdJUUpXNEZUN0NPaHRJ?=
 =?utf-8?B?cFFnQ3Zpa2U2Rk1FbDh0dGNLRWErREdvKzlDZ0hqL29pQ0VKOWRQR094ek9N?=
 =?utf-8?B?M2xkaForUTVlSzU4M0VhU2NnTHpINC9XeUd1dTRBUXl2L1hvZ2NIZE56OEJ4?=
 =?utf-8?B?TkNmek9WTjVOUXRWcU5ob01OSnNZNzdiV25sVW1uUU96VUdIeUxCN3RrRWdI?=
 =?utf-8?B?eUM3aCtDOGNXNS9FdjhJMmNRSlAxMjk4Y3ZNRmgwMEE5SnBNS1RPTWNhREZ2?=
 =?utf-8?B?ZTE2UnBQRTRVMzFlTVM0WDNQOEpBUDlMeUdMS1Jxa24xaG96TTRHaEpVSjly?=
 =?utf-8?B?T3NQb3ZHL05OSWd6cHRHM21CYktxUXN3T2hpNmxmVlExWS80Y1NleFpabEly?=
 =?utf-8?B?V0FvWHdwbVNqWnFFK2V3MkJ4cnlPWXM4TE5CNE9KU3l4M3FqWVhydDFNMmlw?=
 =?utf-8?B?RVM1dXRxQWxnMkdsUXIySCtNMVhDdHhaNUNBRGR4RFBpeUVmMDQ1NWZKY1lv?=
 =?utf-8?B?VTdYZURXMG11M2prTkt5UjVZcHdDS3ljczNwdlZjUE9TZzhSV09WR3M3NWt0?=
 =?utf-8?B?SjV1c2hENTB2TUhEd1dwYUlSM1R4cFJpZVh2Ry9ndXJDaDFwN0JqSDAvbXh3?=
 =?utf-8?B?NkJ2MmhpRGNMWUNNRTVIZDBHSDhIc2lhRVNsVGZxY2xDcXEyYkdXQktnaVEr?=
 =?utf-8?B?S2dITWR6Q1VZbmNpaEJYcFppOGVsQ2p6Z3BOMmdTY2t5ZExLVXEyZVdqRUEw?=
 =?utf-8?B?VmxCSlQyM0NrSysySlB6NlRxUTZEc3lRS2RrS1g0eklIZWI4Y2lNUVZSemVo?=
 =?utf-8?B?ZW1uSjVabnp5UXE4MkIyUVdrTkRleW1zS1dQNVFtSkxFWHI3NXU5Q2VnUlNQ?=
 =?utf-8?B?cFJ6VjNJTkhDeFIyOEVJbEljajc3bkpPNHk1S0Y5YUp0ODVJalBPR3FMWkVa?=
 =?utf-8?B?RVVUSnJVUXkxYjUwZW1iV2VtRlBENTdxNDN1dElOakZqWVRES0xqOWlybjVK?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2d2e4b-fe43-4c90-acfb-08dd5a42f5d2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 11:02:59.7788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBKMx/qN1MiQlCM4cha3vqfrDLMQeQlmcRIV4N2BRjyxXCHTzQ/0R3d+OsPdaPfoKytObblAEeQKrvFf7O6U2w63kcrL6z/tEPiBtQ2+Ud0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
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

Hi Kamil,

[...]

> +bool open_output_files_rdonly(int dirfd, int *fds)
> +{
> +	bool ret = true;
> +
> +	for (int i = 0; i < _F_LAST; i++)
> +		if ((fds[i] = openat(dirfd, filenames[i], O_RDONLY)) < 0) {

You could use `open_for_reading()` function, which already calls
openat with O_RDONLY flag.

[...]

> +		if (fsizes[_F_SOCKET] || fsizes[_F_OUT] || fsizes[_F_ERR] ||
> +		    fsizes[_F_DMESG])
> +			valid_out_files = true;
> +		else
> +			valid_out_files = false;
> +
> +		if (!valid_out_files) {
> +			/* no output saved in any file */
> +			fprintf(stderr, "results: no valid output files\n");
> +			close_outputs(fds);
> +
> +			return false;
> +		}

`valid_out_files` flag is immediately used after setting and not
seen later in the code. The irst `if` could check if all
fsizes[...] are empty and then the code could look like:

if (!fsizes[_F_SOCKET] && !fsizes[_F_OUT] && !fsizes[_F_ERR] &&
	!fsizes[_F_DMESG]) {
	/* no output saved in any file */
	fprintf(stderr, "results: no valid output files\n");
	close_outputs(fds);

	return false;
}

Apart from these two nits the code looks good. I like that you
removed early returning, so now we'll be getting more logs,
even if something breaks earlier.

Best Regards,
Krzysztof

