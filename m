Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FF6CCD193
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 16:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840C810E089;
	Mon, 20 Oct 2025 16:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JapunAFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E673D10E2B0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760977619; x=1792513619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yn0Ppk4ghseSRKJnBTO6JClH86hMZklE7jPbJIvmCbI=;
 b=JapunAFueD6+gyh8VllbPe6v3ygSIQoiZDO7uzxFBIcNRsiNTk9v7gG+
 /hQEJGnJ5OEC/kl1kP6+ToY6mo5t8qj/MFh+EU8GO0WBYxp1nyLitFVVn
 tQ98U6sDKnE5BYaewTtsxxCH3MuYJGCkBnBzPneNctqvsmZ3xzFPPEdvk
 veOwC27yhhUns7SEpcw8FGhpMtU8Je3o9ayYeLWDPURM75ovCwat9+nHU
 1KBANoCMRR8ov2YptwTKr1AD3mzeQVSpQasI5muLQTgTYn/7AGY8aELhH
 bufu2RtyOO2vVMf44xE1I/hxoQIQ3ZJSNELMUfp2nxLYw1709octnTcJN Q==;
X-CSE-ConnectionGUID: 2kSZRD8BQZ2CGYJ3ZYp4lg==
X-CSE-MsgGUID: E/wdos3fSTy3wTvdRsKKjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63242177"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="63242177"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:26:59 -0700
X-CSE-ConnectionGUID: kVcG0p1DQUSJ+vWduHRCJw==
X-CSE-MsgGUID: d/mLEMxQQViqKu7Dyc/ZpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183069334"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:26:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 09:26:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 09:26:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 09:26:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVG3Ckm5veFcwUtj/CJsQxAPH+MmgDEa8Ql7TeKoPOsmoPoAdnaFrz2PHmhNcKYMFjLCB5uLiQHC1fWh/rqmumxxkJfC91E7sXrMDCA7U3ZXNj05xiThbuoaBuHw8fYPuNwJf1qPRUV5HDXHZlfUkmWpcg5+dHvebxnRyuSg+INvJbCftyvsvK+dnFEiALJ9EFesw4e2J3FrdbpiKGp1CXFtpBE3ki891nVc4ykGTEZsuqepdthNnu8lcbXp+9qCF7R7B/yWMVfsSwtaDwo3hRUy9ctJWHfaPGEB/eRyrWVFFJ1zIeRFJ94tuUdCjWmMyDWEPtGxNNdPbMW3PGFxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oa63OalxeUuotSFXw0FJaq/7zbA466FR0EMYhyYhDfY=;
 b=ygbzufgSuwC3cSO7AJubHaeIpsO28SnAE1UmaL2mIDpiR/CzoWf7UMSe/xka96yplRXR4Ht6HS0fqmpOuqzPQjTSo+lTw0nAa/sXicfxtkfdrdailXhueZIcIfsrR3srsSWxBxE7gZRHcZ0b9ccIC4AvSD/6MEELY7e3J1jf+k5Te2eRNT8tPKxarOZg35pj8q+2Iq5zcksquQYliMgqI4h1oBQZ7/DjACbv2mXQGeb2BtZwp8EjASx/xeEBmClQv4Sxl8KDEa+Z8JvaRFwtMRHZqfiQkXE6IckLOyBp3wxWYHWfQydurDJWhDYivGwxDfbReoRJ9dwIZHmreKAwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 16:26:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 16:26:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v1 2/3] lib/xe_mmio: Add init flag and helper to check
 initialization
Date: Mon, 20 Oct 2025 18:26:32 +0200
Message-ID: <20251020162633.2622396-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020162633.2622396-1-piotr.piorkowski@intel.com>
References: <20251020162633.2622396-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0006.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a28cf9-8e48-4d57-9613-08de0ff57b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjREd2R4RUVSaWlRZ2o5N2tJZlZrbDRuUU80TDVLRThJQ2ozSUxwaDRBMzB1?=
 =?utf-8?B?SzZoOVVtenl1NzBJUUhTQWwxZVFMVEdkdFQycG5YNmhxUWdFNEVuTkVBR0RU?=
 =?utf-8?B?cDV5U3JvZW93ZW51NVpGa0Q4d0x1QUFjY0MvNHEvcjdtU3RMOEhvVU1mbVY2?=
 =?utf-8?B?cWc0M2VaTUt6c2RwMk5SMzVSVGlLYkRUVXZYdnhnVGptbFVmTTJaTjRnTTF3?=
 =?utf-8?B?Z0dZS29FeDhsS29kSC9CcWxrenBYbThQVVd0NWFaMmt1bXFIU3gxc0dhUnFM?=
 =?utf-8?B?SUJIYVFTV004THo5b1dSeGxUMzBHRjl5dXB3emRKbzgzaUM2aGFVQnIzdnY0?=
 =?utf-8?B?OFRWN1RUaU1OQTVZdWJzMUo4T2x3WWNOd0NCYmx6WnFKVmFzdVZyelpWNjlC?=
 =?utf-8?B?WHF4RXhrZzR3dy9BQlhVMFlRQVdHaElXNDh2bUJ1SVd0clh1UlFheDREeTl3?=
 =?utf-8?B?MnRaOExQa1o2MVptOUY5RjFmenZxVTZSNlhnT09DaWE5ejFyRkxJNmxqTVUy?=
 =?utf-8?B?YTJCZHB2UnVvSEJyQUVwck1VdFovVThPRkNlK21UdjFhVDFzU09pTkN2eHlJ?=
 =?utf-8?B?d05sR2dwdDlSczB0Uk1xWlFCLzRwb1V4RnpKaXV3VUw3QjRjbnZVdTdDbnR1?=
 =?utf-8?B?WEVQeEs3TGJyaGR4bk5xVHVEek9ZeURRT1p6TXJxZHVFSXhUN2pYMzhuS1Fs?=
 =?utf-8?B?TnRKWFVYNnhVWXlyRktyK3J0ck5zVkVCNmRPenRtUEd4cGx0N2NuNmEzVWc3?=
 =?utf-8?B?amlrcHk0Zm5hUEtZOGNraDhGWitweHBhM1h3bmo5c3QvODZyK3J1OEpPQVIx?=
 =?utf-8?B?Y1JZQ016S29EU3Z6NDdQMSt6VkI4a3Q0MUFiQy80L2I2eXNmKy8zSTNCOUxz?=
 =?utf-8?B?aVMyTFF2ajltR01YUFV0SENxdXloazVuMHBmV3N6VHZXbTRRbGNDL1AzZGN2?=
 =?utf-8?B?ZWp0ZTNJNStFd1E4VCtkeWxGZzlOVmd3czh5cUNkYnZPTTl4MDh3RE1CMlE2?=
 =?utf-8?B?ZWNEdTYxS3l5KzY3WkwwaDBxQzluREFnY2E2ZnZGMyt1TXNFcVhxMzRSQlZN?=
 =?utf-8?B?WUZQNVZ1MlIyOWlQZmcyR2dBMjZzcklNRC9laVVoU1RsTEtVZ3I3UHJzeERq?=
 =?utf-8?B?QlkrcGJsbjZwWGZQdVJ4R2ZPN0laNFhka3NPeGk2TXNneDdLQzlxa0JPb21S?=
 =?utf-8?B?dHhOelVJcU9xcVRMWXM4QUViOFpKRjlHcDBpeGs5NHV1UEx2cXUrODI1Vk9D?=
 =?utf-8?B?RFZrYmtiak1IWThJZmt4MEpaQlNTL3RMS1Y1dFREeTE0S2RKNlFnbGRhY2tK?=
 =?utf-8?B?VW14TVN3T3ZTcU5va0Z6ZklHRVl4VTI3ZWpvaW1BOFBFNFlqZ280QnMrbUxS?=
 =?utf-8?B?d2lOTkN3WHBGYWsydEc0Y2xUUzhTOTlTSzVacGYxcEZmNVRra1ZIMkJtRFhE?=
 =?utf-8?B?WWJhMUwxTmlIVGdlemJDQ2lrRTN5V1Z3NVhZLzAveVN0T3VGclFLVTJ5Tlpx?=
 =?utf-8?B?ZU44WDJtNlhpWWx4VERINWZjT1NIbTBHRU0wZ20xRWltV3ZBM2FFZERxdncw?=
 =?utf-8?B?cHJQRjFuTHpRUE13dWQ0b3I2MzdBUzU5Yk04bjhQVmYzd2J6MHRmYTducTFo?=
 =?utf-8?B?d1pFVC9GSTZTS0QxNEdtalp6UVY0dnhza1g3ZmNHTGRhWktmc041bUJNVVh6?=
 =?utf-8?B?eVBrOUJMcW1ncmRva3I4QTJWdStnSTNST1VkVGZvZTA3YVBZN1NzT1J0eDBD?=
 =?utf-8?B?OGhxOGdaNlBVM3Axby8xRVhVTVU3MTFhd1V4c3dPRXAxQ3l6MEduWDhGeUF0?=
 =?utf-8?B?TE1EUGswcFYwU2pCYjFmMk5oWGNvRzlDUDBRWjh2aTU1b296U25Ob0F0QXdT?=
 =?utf-8?B?U2tCRGZOc1JGVnlwajNZK1d6WEo5TnRveWprRlNvckV4K1FlQkZiK0ZFcVlh?=
 =?utf-8?Q?vA/wcD6R9IawUorH1qzUOP/SxD3xuKZx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFNOcDRxMHlSemVHbVFSTEJhTVRNUEJvaGMwYzI1ZnBQYlBaZ1ZWdWlDSHEz?=
 =?utf-8?B?Z214NHMvajBTVzNPSlNSd3JyRTVuUW1xZVJXOHZYRGRURlBXTVhmdEJ6djBr?=
 =?utf-8?B?WE5UekMxc2hEWDUzRFFOLzRhaUxRWVhkWnU1Q2NGcFdHZjN4WEM5RGY5RVBC?=
 =?utf-8?B?NElwaG9zL1gvcEZuaWNSY3c2QnpLV1hUSzBmbFpqdjBhbytwSE1QcGNuaHhO?=
 =?utf-8?B?YXJPdU1vQ0ovank4NW5KSytoM1U5VndNL3FlMCtCRFp4SW8xNnlib1BTOFAw?=
 =?utf-8?B?Vm1RU2o2UWw4alU4aWRyOEc2bzhBVmF1cTF3TnpqdVBsVjNtWm82bThHZ094?=
 =?utf-8?B?N2E2bTg1RHFVaDVLS1hReVVEN0F3V3EyWDhydEVwc3pzd0ZMd2YrMmR5S2VN?=
 =?utf-8?B?U0RyQTZCZkdDNmprUzZueklQQ2duYlN2UUZlNi9JQTNtd3pHeTRBS3JyeGto?=
 =?utf-8?B?QXJESDl6TFVhSUtJTUZ2b2svWER5SlR6TEo0Mis2N1FRYTVTR1VVdXBjM0dN?=
 =?utf-8?B?amZUMUNvVmxVYlB5QzdYUUVkZDVQYWJ0emRpd3AzMUNTK2ZCUEZxR3JrYzBh?=
 =?utf-8?B?M3hKVmZiampTYXdDTlc3R2R4a3F5RnpmWDRHQ3IyNHNjS3FlN1JjUEVjZnRp?=
 =?utf-8?B?dVlSUlo4b20yeDhNNUNNMkpQd2R0TlBRNEMvS2trRnlUeXZsTXNBOE1IekdC?=
 =?utf-8?B?ZTRaZ3UwcUhDMEpkeXlZWTYyd1hBYWZUemRXNDZoZzR0SURTd0JRaVZ6TzAy?=
 =?utf-8?B?d0VwOTVZbStBVmQzY3BkZnp4M0ZXSUVXamRuWjZnS0wvTUNKV3Fldy9xSVhs?=
 =?utf-8?B?TVdpL3k4TDhsak5FWUlRbDVjNFp3aVFyZlNhRVdIVnhqQ2lRdE5KTm56bjR6?=
 =?utf-8?B?L1A4RzB0dHBtNWNaZUhGVDlwTGJ6eHc1K3ZYMlAxbDRNZjc4SGZWNEExZzZS?=
 =?utf-8?B?QTFWVlJBM2ttemo4eUlxdGM4WWNQS0FHUy80UE1qVFhlSk55a2NBOGN0cWpt?=
 =?utf-8?B?QW1pcWJjQVdaVCtUdnlud3JxcXJUTHJVbS8rV2ZVUUN3MHB6bWVEUjRPM3BK?=
 =?utf-8?B?bnNXamlPc3dKVFRxSnkvaGxMUCtoVldYMDVaR3I5TXBkUms2MW4veTFKOVNR?=
 =?utf-8?B?TzRvM2EraGlVcHJjNy9pNFdYY05tdkkzRjV2MU1WbDllZXphZzhxb2Rrdksr?=
 =?utf-8?B?OVE3ZXc1bUVUbnczTFVLVlJib1NTK214OU9HZXdYaEFQRWN5TVlKaG5aK3lP?=
 =?utf-8?B?ZXBUMS9wc3Q3dUYxbTA2TjhPaDVqM0FJYnBnMXBweEFWSWc3NWV5cjNWVkZu?=
 =?utf-8?B?Zi9tZ0VNenpVSklFdk5hYWRFNXA3OVhCSVdGL3hhRTRxTE5WNjMvSWkzbnlC?=
 =?utf-8?B?U2ZVZVovTUtHUGR6blVLQmMvR2JSdWo4dlQvcFV0dm92QWNuRFA4Z2l4dENR?=
 =?utf-8?B?akZ1clc5cXdXM3JnTDRISUZOZG8xOHpEcE9wK2xoMWVjQW0wN1g1NEZLSTNU?=
 =?utf-8?B?Y2l6R0NzaDZpZE1QQ05iV01xZzRxbXBHZkhIWVlab0VpWjhucGNzOHl3RXBo?=
 =?utf-8?B?WXlaRmRVcEQrMzdTNi9kZE1XZUs5d2haZ2VXZVVVc1FlSWFNVVdHaWh4L1JT?=
 =?utf-8?B?U0hudU9LYXlIbkZhZE8rWERmMkpubW8xNDdiN1FSS3BtTlZVWGV5TlN5L0FQ?=
 =?utf-8?B?TlFWSmRTYVJpQml2c09NUEVTTTZWM3IvZWtCa3NxRDE1UmVBOWM2STNMdkY3?=
 =?utf-8?B?UmZGaEE2UW1iaS9jQXVzV2FSbkdnbVlTL2ZFTVRKaFhEdGM4N2JpNk5SR0tK?=
 =?utf-8?B?b1MyU0h1NUNiZzBDWUN0YVhnSkg1Wkl4UURPSlBvTU5Xbks4bDJQNU8wRVMz?=
 =?utf-8?B?bVRLZUNTMVpNTDFENm9PbXl0MW41TGwyV3JmUndwZnYvT216MGEzUHJZRld2?=
 =?utf-8?B?dkt0c2tGNWhWSjhnbVlYZzhkQW9NRi8wNERpU1ZHTVEyVVp1c1lHRStFQ0lh?=
 =?utf-8?B?WFMvbnc4UC9nWFJZL1p1Wm9YOW00cTd3YXdkMC9OWFFvRytGYXdBMm5abHVr?=
 =?utf-8?B?cEdDSVVNTEs1eDN4Y0E4dFpkNjFGRW83VWg1T0IwRVM0RnNWMGVIQmh5YVNj?=
 =?utf-8?B?b0dqT1BBTWlscWZ3UU9OdEZEdlBmd2xTSXdlK2lCRnNzekcrSUhTT2VHa2t6?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a28cf9-8e48-4d57-9613-08de0ff57b78
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:26:54.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7NenTIDv0YYE9t/nmqMbS8LxRl8Oq+0JufNCr3XKL1I2g0UosmtgEpbL87ycRDPIgIoYG91n3bnPQibIUbmtqyZhJCpcIvyZEtqqNMExgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Track MMIO initialization state via a new `init` flag and expose it
through xe_mmio_is_initialized().

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/xe/xe_mmio.c | 14 ++++++++++++++
 lib/xe/xe_mmio.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 8bc446fb9..43aa354ff 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -25,6 +25,7 @@ void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
 
 	intel_register_access_init(&mmio->intel_mmio, pci_dev, false);
 	mmio->fd = pf_fd;
+	mmio->init = true;
 }
 
 /**
@@ -39,6 +40,18 @@ void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
 	xe_mmio_vf_access_init(pf_fd, 0, mmio);
 }
 
+/**
+ * xe_mmio_is_initialized:
+ * @mmio: xe mmio structure for IO operations
+ *
+ * Returns:
+ * Non-zero if the xe mmio structure is initialized.
+ */
+bool xe_mmio_is_initialized(const struct xe_mmio *mmio)
+{
+	return mmio->init;
+}
+
 /**
  * xe_mmio_access_fini:
  * @mmio: xe mmio structure for IO operations
@@ -49,6 +62,7 @@ void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
 void xe_mmio_access_fini(struct xe_mmio *mmio)
 {
 	intel_register_access_fini(&mmio->intel_mmio);
+	mmio->init = false;
 }
 
 /**
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
index f15017c96..1710a384f 100644
--- a/lib/xe/xe_mmio.h
+++ b/lib/xe/xe_mmio.h
@@ -16,11 +16,13 @@ typedef uint64_t xe_ggtt_pte_t;
 
 struct xe_mmio {
 	int fd;
+	bool init;
 	struct intel_mmio_data intel_mmio;
 };
 
 void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
 void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
+bool xe_mmio_is_initialized(const struct xe_mmio *mmio);
 void xe_mmio_access_fini(struct xe_mmio *mmio);
 
 uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t offset);
-- 
2.34.1

