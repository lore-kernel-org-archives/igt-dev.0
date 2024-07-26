Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D2CC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 17:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098C510E9EB;
	Fri, 26 Jul 2024 17:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1i1utFn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B5310E9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722015613; x=1753551613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FMTjEoyG0OrnNkjpK30m/iwq/N7Bd7UxQTpywC5zVlU=;
 b=G1i1utFnMpktgHLJfB1GnJyuHro7oeAYWcXPSH6UBR/URJBEGWKhSTHo
 NGX0KHJd8Q88BMRxFU9cnqzBY5he9/CnIwv2LIIgygawYeKzicPSNIeiE
 SdbE9aJMvwLBAdKOYa+aqZbX+l5y9BZWAwGDA0lSAGH/GtzZY1+DToa0p
 pn7lelHb42Yf+QlJSfEqb9ifzzSFP9mqeQdAg6+r0lrvxZ5NB4EChjfZ3
 pV7nuW4Q6jdXaWyhI3eIGhcdNx67iNBtNVzhpdkBkBJn9IQbcaooezcLD
 djRfXSvPq3FvUNgaYHyGy+zVfs6FT6tc6acDgptj7d/ytpV89EtbGy2yz w==;
X-CSE-ConnectionGUID: jOx7tIBeRPWsBe2h9r83LA==
X-CSE-MsgGUID: 1x0ZMNOZSYqYVdlhoMjqqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="30481947"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="30481947"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 10:40:13 -0700
X-CSE-ConnectionGUID: 4DWzAFHTSLKqN2ybZRHQaA==
X-CSE-MsgGUID: /LQr0UokRCaxVNv8LFX55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="84296751"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 10:40:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 10:40:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 10:40:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 10:40:07 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 10:40:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuB8ae9BcAxdmAv5Dh41M+ETISj1gQOFOjgr/353k25I/Q0o/yw3DNTfKpZJLG8tSsufPpu6jWudz8Mf5G+Kytk5WdUBPhowBd0do1PCYb2ohrO8J4zL6KG845+rtoDi/2x0PvXV6EzCkkm4hEpg7dvzb6oEisGMB2oklFIoQtGsLa+68AqxsgRqrSLQ37QAuPy5nPB7U0qWxKqmQjM9PqBhjAvtT6DKhSC7JjmafZ6PrFSl8EcgWiwlnVKi/0fzeHvv4vx1W1gnuEnU+RNslGC4rkWBr+l8dYAqGoxPYs0JPO4J+k1n7hN/KrKT68UX/em5LyPOVXZBw6gAHhSGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06lPtGbOr66IY/DvdlYZsrts8R9vnnAwiqcbEN7lt9w=;
 b=N953j7gJHGuNUqXyk0+NKngp9T/GGhW69BnHtVTtywZvi3REM1AhF288OkJ70IANFIqEnzsGBfNwUappVbqwi6AoputuKf0ZGWzZP+toCUZ3sA+k6Fp6a3fjzEzrYrzBqZ3cphB6tSV/lmEMdPi/2lJhaR97GldMr/DM6MVNCZT7HFK5Atvon2nv32RpaJd9zWDzEksRbfuw74H0uFictn2pChAuwTEBlSyFRV8b3OK0T72QAHNjkseX7hi0XdbyyoHKpT5p5rZsyexTxwxDmGGML4rpGJD7m4+lLOXhPXOUjUPvEGYKHMV8pxs0UHBlpH5QDNsbnooVshSJsfQpYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.31; Fri, 26 Jul
 2024 17:40:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 17:40:04 +0000
Date: Fri, 26 Jul 2024 17:39:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v3] tests/intel/xe_vm: Add test for 64k page corners
Message-ID: <ZqPfQS5HGuQKsqXo@DUT025-TGLU.fm.intel.com>
References: <20240725184538.1938050-1-matthew.brost@intel.com>
 <20240726170303.vakxowgpabzwpchb@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726170303.vakxowgpabzwpchb@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0174.namprd05.prod.outlook.com
 (2603:10b6:a03:339::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f6db3a-c003-439f-4546-08dcad99fb83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NStXdFhWd29CRWpueExLc1lvMTdOVGNDa2RLZDFndUR1WUZUdDQxT1pTQ0M1?=
 =?utf-8?B?NEVudWpaYm9RekgrN2pNYUM2UGtkc0ZQUVQ4Tm9ZUUVOaFdmOEVxeDkvaXhJ?=
 =?utf-8?B?UEhIa2k3b2ExSFQrKzB5ZTYxTWVuQ1l3SGhhNkV3bnE1OEErcTZhYWhpMGg0?=
 =?utf-8?B?UThpbmxFMGwzUVVSNnBSZWxlR0pQQ08rZm5SKzZwN203NVM0ay92RUZxUW5N?=
 =?utf-8?B?REQ1TmlFcnNWNjNMWnI0UVkyd1JLeUIrSFBPOUNXWU1nbW1UN2Y1U3hGeTVi?=
 =?utf-8?B?cHZrakM1ZzlxbTYwWTBkWUF3QUV2YTZCZkRZUkJURGRxL0JWY0xkSEZveG8v?=
 =?utf-8?B?UGRMOWdFcHBUM1Y0QjVlOHBkM1hqSTdkQXRqVDZWUXcxRGhRc0x2SzV0a0s4?=
 =?utf-8?B?TXFaWDNiRlFTVkJBSEVwNWoveW5KQXdqRmsvTlFra2lKcUcyc2Nvc3F3ZXhV?=
 =?utf-8?B?dW5TN3NranJkTFUzejRZaTBFZkl1VXFoQ1AwVEl0dHRPS292TWZseU84cHR3?=
 =?utf-8?B?bGx4UW9rVEI4dzRpUm4xQzlmeWE2bjRBYXAxZUNtUkN0cnZwenY2UnVwRlB5?=
 =?utf-8?B?U0VBVTVDYUZvZjdnVkMzUThRVHpwcy93UW1ETDJtZ1NYUWYyM0xOci9OYWF2?=
 =?utf-8?B?WWk3QXRyRXcxdi9CUnQrRGhleVB2d2xZbk10dE81aUdQRXRMaTI4YXBZcm5E?=
 =?utf-8?B?MXJ6d2dNV3FDR0FJRjA0Tmlkd2ltMTgwc1ZuTlZqQXh5QWUvMjh0NEZuRmls?=
 =?utf-8?B?ZDZCM3l1dU0wUmZPL0xhcXQ3STREbkRtdHk2VVZnekJHUmxFa0xjakxySCsv?=
 =?utf-8?B?Y3lNWkoyblFUSGlKQ1JzVjNDME0yTUdWTTY5eFYrYVhjMWppb3QxWm1ORnpl?=
 =?utf-8?B?QmlEZUphUy9TQ3JnYWJ0SjkvUml2VUUzSCsxWGZybTNFNVYwK05vU1BTb0lR?=
 =?utf-8?B?eFZ0VHgrVlhYZ0E0U1RTRFgrbFVNWWpKK0hQekhiTjdzczlSWGRmdStOOVZI?=
 =?utf-8?B?YWE2eEF1MzRIaDBpU29qUE11Q0hvcnk5STZMU3k3YmNRKytmVjhhcWRxZHI0?=
 =?utf-8?B?VDE4YnZzNEZmYVZQSjF6by9ETnlvNkNsTnRtOXY5MThWYnBRSURjc2k3MDIz?=
 =?utf-8?B?VjZmeVNkMFBjV2kweFg2VFR4WmNCV1RQcXNQanRxd2tnRHNRN2RUcnZ1N1Zm?=
 =?utf-8?B?ZXNCSmduTWNhaXZNTStxVWhQVzFWT3lFNVhZK3hJR2t1YytsZ3pTK0ZYdHlt?=
 =?utf-8?B?TU9GTkhBcWpiWURCSkk5Z2h4TEFJV21lZFRQNHRCSHY4L2NLb2JGT3ZZTzNX?=
 =?utf-8?B?UWpaRUFudndDUjcreXhPdzZtYXlSdHhIM3Baa0JTRzNvSzQwblEvOEV4Q3Ey?=
 =?utf-8?B?OUR4QkpBUlhUZ2tqQWhoYlg0R3pEcmg0VjZZSWlncC9aWGJ5Q1FUNk5wMTRa?=
 =?utf-8?B?MXVTMzN0WXJNaFNDSmJKK256MFd3WGhDeHhaZE1iVUxiR0FKcUdhS1J1QlZh?=
 =?utf-8?B?VzFPTUxPOURnZmRxQTV6Z0xwTG9jcS9xV2U4Wm5PdXcvUU8ydG91S1F4WlJq?=
 =?utf-8?B?Y3F4NEhHc1FGZjZBU2tzVXh5aHRnMmRDRkZKMUZsR2JPamVvRWNCZ05iNmQ5?=
 =?utf-8?B?R2Vwc2lGeWJsS1hRY1dNOGNjcXBxcStwM2xJQkxRd21XQTVWVTFvanRrb0Zp?=
 =?utf-8?B?OUtPQ3gvOG1DSm9udzVrM1hPM3Z6TStnSERTNGNtWlRyNFIyRG1NWVJkRldo?=
 =?utf-8?B?dnRJUEJLQkVVbGxFcVE5RGhiWmpJRW1QZHdmWG5CbzBGb0JGUisxZTR6ajZS?=
 =?utf-8?B?SHkrc21lT0FhWHAzcERsUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDVRM0poYWozQ3I2RkJobkdwRGd3RTB4RHpvT3BSWWlNbUwxWU9WNGMvNEVL?=
 =?utf-8?B?bXJwbTNpTFdrWXhBTjB2OXJiQWpzTkxpOVdxcHMzbS9PZUNzL1hocWc5RFUx?=
 =?utf-8?B?RXBweU0xQ2lhcml4QTViN25XbW00THJaT2JCSVA2TDF4MnZsWTI2RjZxUmJW?=
 =?utf-8?B?eCt2UmZCTmVrelhYZC9nUml0UDVBTHRTb3c0NE56QkJzRW1SVjcvU1Y0a3A2?=
 =?utf-8?B?aWlHUGpoN1hIUnVWQTdYK0hLK2VRWnRBZFZodDR5WSt2N3VXY1NCY1BsTmMz?=
 =?utf-8?B?OStoa29aR2ZGSHpKT2F3VVdUQW1FRnBSUFd2VkZpMVlBaFp4b28yZzdRTm0v?=
 =?utf-8?B?Y2VsNGNFV1ROOEFHNlRsb1Zjc0JlYnViR2EzWEJQSmRjU0lncWJtbkdGd1p2?=
 =?utf-8?B?T1YxbWp4VVV5WFFvbHRlRFVvdHBSbnVOWG9wRVlLRmtKNmdUeTd0bCs3YWpT?=
 =?utf-8?B?TXlsbTdob1NOUG9GMjk4Nk5VSCtkVWZ6dFl4dzZMZzdjeWVtRW1vSS9vU0t1?=
 =?utf-8?B?NGRQdmRtOWRQS2ZQNEpTYjdLU1AvZ0VIWWxOTlk4YTl3YUcvZUtRU3NZTjBL?=
 =?utf-8?B?UGhXSUh4c0NINVJEa2lKZ080eXR6cmVtcTZiTndCcXhHV1ZKaXZZczU4Q1NP?=
 =?utf-8?B?MUExd1FXa0ozMFNJU05CaTB1Z3NkZGxBb0p0TXB3eU5KK2k4RjhmeTZ1WC94?=
 =?utf-8?B?MXhtcGxSWHROTmNuVFBpZUc4TEJiT0Y5MitsYzJ5YnFpQzNZV0EyeXJlUks0?=
 =?utf-8?B?cktTK2w2QldmR0xKOWNEUGpBa3p4alBqR05aQnpHSnF0YUJHM3JoaDZmalFW?=
 =?utf-8?B?UCtZT0dsNkpoQ0JWdzNqNUQ3ZFJGY1BDNHVGMGsrdmhRSFdQSlI3RXVtWXR2?=
 =?utf-8?B?N2RYZ0ZoTHhseXgzYnlwWHMyMlllUXU4S2lGaU9NVC9WM0ZlNlR6RmpoWHZP?=
 =?utf-8?B?dXcxV0h6RG1FZGJiUlV1NC9kQlA5MW1UazkyaUxKNHVCb3FGOE5FT28ybE01?=
 =?utf-8?B?RGQwUTZ0dHpyQnJRaWt5MUkyYUJZN2FtcUREa1l5VGhiWlVOOWgyYVQ2bWk1?=
 =?utf-8?B?em5NRWVySzRjUTVWbkhSVVF5NWwwaE80bDdMQm1KMzM0MGF0WCs4RzVEQ1dD?=
 =?utf-8?B?ZVZaU2lweEowWWk5NG44Z3hDa1VnQzVPRHpkNVRXRXZkcWt0YmwvazJ5czFF?=
 =?utf-8?B?SHJIczJNRnNXMXFGMVlYaTloMzNWQk1lekxvdTcwU1Z1UTF0K2ZLaENsQTJM?=
 =?utf-8?B?OTI3YTVEWWV2ejBKNUVFQ0NxRkZWWFNNeUJSKzNMYUVZMW9ZYnlLb0lvUlVr?=
 =?utf-8?B?OFZNWGR0RlB0Rzg4bU4wVmxYbDZkRDVuREFLc00weDc4aFRYQmRocjRyS3Vt?=
 =?utf-8?B?U3UrcEN3c0IybGp4dlY0TEdlNnFVWFlWNWRnRm93R09iZHNnMVJ6bW55OHhv?=
 =?utf-8?B?ckVtOTgyK0Y0UjBUejdqT0dqS3VUNUpPdkFTa1kzc2JwdTd4NlRjNmxqdjFt?=
 =?utf-8?B?VE0zK1hKUXhGOEJtM1h0RFdNVmhqU2IvYkdmRkg3dHYyTDJYTHQyUEd3WkRw?=
 =?utf-8?B?M0EvSDhtelB1YUw4NWg4QWVFYWVZcWRtWnlWUVp5c0tFQzlIQ2Z6NGNVejJW?=
 =?utf-8?B?QlV2SXhMV0dpNnFKd1N2MVFscjJ4eUdteWNVUnZTQ2Zzc3EzSnoyaGlVL1hG?=
 =?utf-8?B?Zjd1ZHZkVkxpQkI4TitGZlBlV0MrZ0ZQM0lUMUJDM0toOXpuTXh6b1dKdXFz?=
 =?utf-8?B?UHpzV0JCRFM3S2xqS0RQZFdGcUtQTVVtUExlcG5saUZab2E4eUl6bURqV0lY?=
 =?utf-8?B?VUFWMUlJRzNsKzlPT1BjKyszMUhLZTlXbGdTaFhwVS9hMVdWcUJ0ZjZEbXlw?=
 =?utf-8?B?Sk1KQkhIWVI4L0hSMW5RK0M5VlcyQlp3dXBlMnhFbDFFaDlmQm53RUJaU0lP?=
 =?utf-8?B?MkNvY2h6S3Y1R3gvZnRDMng3YUYxdVJSaDN4SmlLMHk5SHRFQ2VUVHVhT29E?=
 =?utf-8?B?bjBGT0Q5amJnakNDQzYyaHU2Y0FSZERIM2VuT0t2UFBkaXhJL1R4ZTB2cU9q?=
 =?utf-8?B?Q1hiUyt3aEsxN25IZWhEaHNvajIwa1k3cGJkSWRFVzIwc0MwUzZQNUdPaE5r?=
 =?utf-8?B?N2I5bnhPbW04WjRlMlRBcldmU3E0RFFkYUxYajR1cllHZ05qeTJyN2JqWnl0?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f6db3a-c003-439f-4546-08dcad99fb83
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 17:40:04.2340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igU2Q6NaP43mQuk8N73zZwDh0H8nQs2BpexpOSI1CUeRH/+9kYNyv7qFHK1tORDhGn1eke1eh5h09zo0A2aouw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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

On Fri, Jul 26, 2024 at 07:03:03PM +0200, Kamil Konieczny wrote:
> Hi Matthew,
> On 2024-07-25 at 11:45:38 -0700, Matthew Brost wrote:
> > Add sections which splits 64k pages in 4k pages or splits compact 64k in
> 
> Should this be s/splits compact 64k/compact 4k/ ?

No. A compact 64k page != 64k pages. Also compact 4k pages is not a thing.

Matt

> 
> Regards,
> Kamil
> 
> > 64k pages.
> > 
> > v2:
> >  - Use SZ_* (Zbigniew)
> >  - Remove clock block (Zbigniew)
> >  - Update commit message / comments
> > v3:
> >  - Send correct version
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_vm.c | 125 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> > 
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index a4f6c7a0b4..f41c6aca53 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -366,6 +366,125 @@ static void userptr_invalid(int fd)
> >  	xe_vm_destroy(fd, vm);
> >  }
> >  
> > +/**
> > + * SUBTEST: compact-64k-pages
> > + * Description:
> > + *	Take corner cases related to compact and 64k pages
> > + * Functionality: bind
> > + * Test category: functionality test
> > + */
> > +static void compact_64k_pages(int fd, struct drm_xe_engine_class_instance *eci)
> > +{
> > +	size_t page_size = xe_get_default_alignment(fd);
> > +	uint64_t addr0 = 0x10000000ull, addr1;
> > +	uint32_t vm;
> > +	uint32_t bo0, bo1;
> > +	uint32_t exec_queue;
> > +	void *ptr0, *ptr1;
> > +	struct drm_xe_sync sync[2] = {
> > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > +	};
> > +	struct {
> > +		uint32_t batch[16];
> > +		uint64_t pad;
> > +		uint32_t data;
> > +	} *data = NULL;
> > +	struct drm_xe_exec exec = {
> > +		.num_batch_buffer = 1,
> > +		.num_syncs = 2,
> > +		.syncs = to_user_pointer(sync),
> > +	};
> > +	uint64_t batch_offset;
> > +	uint64_t batch_addr;
> > +	uint64_t sdi_offset;
> > +	uint64_t sdi_addr;
> > +	int b = 0;
> > +
> > +	vm = xe_vm_create(fd, 0, 0);
> > +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > +
> > +	bo0 = xe_bo_create(fd, vm, SZ_8M,
> > +			   vram_if_possible(fd, eci->gt_id),
> > +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	ptr0 = xe_bo_map(fd, bo0, SZ_8M);
> > +
> > +	bo1 = xe_bo_create(fd, vm, SZ_8M / 2,
> > +			   vram_if_possible(fd, eci->gt_id),
> > +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +	ptr1 = xe_bo_map(fd, bo1, SZ_8M / 2);
> > +
> > +	sync[0].handle = syncobj_create(fd, 0);
> > +	if (page_size == SZ_4K) {
> > +		/* Setup mapping to split a 64k PTE in cache */
> > +		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SZ_64K, 0, 0);
> > +
> > +		addr1 = addr0 + (SZ_64K / 2);
> > +		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SZ_64K / 2,
> > +				 sync, 1);
> > +	} else if (page_size == SZ_64K) {
> > +		addr0 += page_size;
> > +
> > +		/* Setup mapping to split compact 64k pages */
> > +		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SZ_8M, 0, 0);
> > +
> > +		addr1 = addr0 + (SZ_8M / 4);
> > +		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SZ_8M / 2,
> > +				 sync, 1);
> > +	}
> > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > +
> > +	/* Verify 1st and 2nd mappings working */
> > +	batch_offset = (char *)&data[0].batch - (char *)data;
> > +	batch_addr = addr0 + batch_offset;
> > +	sdi_offset = (char *)&data[0].data - (char *)data;
> > +	sdi_addr = addr0 + sdi_offset;
> > +	data = ptr0;
> > +
> > +	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > +	data[0].batch[b++] = sdi_addr;
> > +	data[0].batch[b++] = sdi_addr >> 32;
> > +	data[0].batch[b++] = 0xc0ffee;
> > +
> > +	sdi_addr = addr1 + sdi_offset;
> > +	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > +	data[0].batch[b++] = sdi_addr;
> > +	data[0].batch[b++] = sdi_addr >> 32;
> > +	data[0].batch[b++] = 0xc0ffee;
> > +
> > +	data[0].batch[b++] = MI_BATCH_BUFFER_END;
> > +	igt_assert(b <= ARRAY_SIZE(data[0].batch));
> > +
> > +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > +	sync[1].handle = syncobj_create(fd, 0);
> > +	exec.exec_queue_id = exec_queue;
> > +	exec.address = batch_addr;
> > +	xe_exec(fd, &exec);
> > +
> > +	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0,
> > +				NULL));
> > +	igt_assert_eq(data[0].data, 0xc0ffee);
> > +	data = ptr1;
> > +	igt_assert_eq(data[0].data, 0xc0ffee);
> > +
> > +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > +	syncobj_reset(fd, &sync[0].handle, 1);
> > +	xe_vm_unbind_all_async(fd, vm, 0, bo0, 0, 0);
> > +	xe_vm_unbind_all_async(fd, vm, 0, bo1, sync, 1);
> > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > +
> > +	xe_exec_queue_destroy(fd, exec_queue);
> > +	syncobj_destroy(fd, sync[0].handle);
> > +	syncobj_destroy(fd, sync[1].handle);
> > +	munmap(ptr0, SZ_8M);
> > +	munmap(ptr1, SZ_8M / 2);
> > +	gem_close(fd, bo0);
> > +	gem_close(fd, bo1);
> > +	xe_vm_destroy(fd, vm);
> > +}
> > +
> >  /**
> >   * SUBTEST: shared-%s-page
> >   * Description: Test shared arg[1] page
> > @@ -1973,6 +2092,12 @@ igt_main
> >  	igt_subtest("bind-flag-invalid")
> >  		bind_flag_invalid(fd);
> >  
> > +	igt_subtest("compact-64k-pages")
> > +		xe_for_each_engine(fd, hwe) {
> > +			compact_64k_pages(fd, hwe);
> > +			break;
> > +		}
> > +
> >  	igt_subtest("shared-pte-page")
> >  		xe_for_each_engine(fd, hwe)
> >  			shared_pte_page(fd, hwe, 4,
> > -- 
> > 2.34.1
> > 
