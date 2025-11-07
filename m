Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED084CCF9E3
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 08:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEC810EA40;
	Fri,  7 Nov 2025 08:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLpgmUp/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0453A10EA40
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762505597; x=1794041597;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LGlO/Jfo99+I/t+oKBDiJmRnbzR7jIhWee8ChC9//pI=;
 b=LLpgmUp/wbkDF1MnsTrAJ5phCvP3AQkfSuhqjtJ7nEFJ7GcuRnSqc2du
 kvYijwSQEnNcIAcZ2cGCa+lY9xf52UgGLHWtmlTgTM4pArCBa13SNgrVY
 eoUTA9/jd2tMR9tQ7bd3MTKqndtxruetSpfsAWQwcIm6VfFvtqDnPrb9l
 izSHabEgWF3awwnC56WRDA4UVzqEOa/JhVIIZNgigb6qfAU9fZfpsiSm4
 09TcUvBBhcdvkSfxc8qXnmPhZcXGTNKh9BWP04p21JacJLLzw3PieEFCT
 7O2bgK6HmX+fYEBH2LIHNyDbAeBTJfvcb69qHnSL4BtwFSPHXOO173faR w==;
X-CSE-ConnectionGUID: JRiCh7/sR4+G7cqbVXms5g==
X-CSE-MsgGUID: 4h8k5T+LS02zJxopI9QYsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75344476"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="75344476"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 00:53:16 -0800
X-CSE-ConnectionGUID: sIS0MZ3SSvGoe8nylpBgTA==
X-CSE-MsgGUID: CnOHF2VLTRmxz5T6FlzAXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="188425334"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 00:53:15 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 00:53:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 00:53:15 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 00:53:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BX8FQnIRfSZWiVRkvvw/g/Fx8R5FWf/K0rcc7/fR5bziki/RNEU8GN5hEWJm+O0VzFyjChj0HjEInd9cV8I9XxoW7QbsYsMay4hKC1zdqJvvrLuulXZfBQvuwTGu9Pli05DcFS4sIi8b6dJW6WGvrsIb7N0MstC8yWNfRfp67YM53BEfL7ygx0DaU08loDrl9NPuvCKjkVFAvB6eYdv4nDj+ZxKv5FYpVsyPPxTYssLDIQ/lUc8wiGb3fb+i6+KfrB+/M8TqVS3Lt1kFXl5LFOlhikawQtnGgzNsttj90u7sEn5H/MXu9ixaEFyBpLr/vL7gPabZHmcQdq6pRdtiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEXntmOT15t5wsWiFkBa61eyIjqLG64oWeo0hvW8enk=;
 b=Q7jDc6bEAbxBapgpfQHFl7hLu1mbAdUBCyF/UxWPHB4QGLSdbFszLgZoxhan3XkFeRe/jyYpYZB21AEtE3UTm66frVdZrWxyQjICeDEQ3LHT4g3RFEoKjN/PclwcMcGgxpdispoOr60nfE7uYlV75OJm+ghSj61hbIBPBuhGd5af09/yIAt1ZEpG1dMRZH7Te3FxixAxndp/g2hofXFdt/geIt1SN6wasxYrueo1QJWzlmfWduqPU5sPfoO0FjjcNrx6j+KjvxFQw0I3LMjsGjliJ/OLVqK6ywnJikKgTSpXCOXR7+EoftOxPLa00yBnWPW3PRehf5kigIJUGs/ryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA1PR11MB8395.namprd11.prod.outlook.com (2603:10b6:806:38c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 08:53:11 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::cec1:b76:724f:592e]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::cec1:b76:724f:592e%5]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 08:53:11 +0000
Message-ID: <4110f394-48d8-4551-9c7a-b80547d2808c@intel.com>
Date: Fri, 7 Nov 2025 09:53:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] lib/xe_mmio: Introduce tile-level XE MMIO
 access helpers
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <piotr.piorkowski@intel.com>, <jakub1.kolakowski@intel.com>, "Jan
 Sokolowski" <jan.sokolowski@intel.com>
References: <20251106152811.1997614-1-marcin.bernatowicz@linux.intel.com>
 <20251106152811.1997614-2-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20251106152811.1997614-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::15) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA1PR11MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: b60b1e63-0ff7-4ee2-7d29-08de1ddb1450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlpaRE0xS3ArV1YxVUIza0gyQ1orK0FBVW9OVU1MZUFHS2x2V0xEdEhXV0RV?=
 =?utf-8?B?REJlSzV1Rno4b3Nub1hKRVpuT1VEZ21KeElhV3dyelJNcU1xZGFwaXpqUEd3?=
 =?utf-8?B?N2Z1TEN0ZVIzcnBFVGZYbzg0amFqeGNCakkzR3VkZ015UTZrVVlyaThicEV6?=
 =?utf-8?B?R08vTEszczBCbjc0YlhzSjdDK1E1VnV2Ui9sODhHVjhVSkZtcjBSOGZSMGRR?=
 =?utf-8?B?NGxZdzhRZk1IWVRhNUhkdGUrYUVlbkkrOGhsZG5lRDR1SDhnSFU0M0ZVMHov?=
 =?utf-8?B?cjZ4R2V5dGdqb3dodnAvemR6ME9oeGk2U2NLNWpGS0UwaXgrUXlLVitXWWNZ?=
 =?utf-8?B?YVRNNWZLcW5TY1NMMmthejZzQkRXc21jUlhwalFZbTZOVTFZU2E1OFhKYjRX?=
 =?utf-8?B?YnJxRUk1amdQS1FEbkU2UWlEbi9XZHhWbUJXY3JWSk1FR2VUM0JyQ24xbTVE?=
 =?utf-8?B?S2YzTlFWeE5laG5SNFVRRWlmNFlEUzF4Y3BSWlhrSWxKa0l5TytIOGp3TUxj?=
 =?utf-8?B?UFZKVm1uNlB5S09LWmJ5cW9IdFFQVGc5Q3lORy9BbXRWdFF5YXMwWDJCbVV1?=
 =?utf-8?B?Yzhsd2RTUlVna29PK2JpelVrMzRySkFpcDRFS2pYTFhrbmczMlVUTHpJZWVK?=
 =?utf-8?B?cXNTOHNsREdWei9KZW8zUnYrVkM0cjZVL1hMcWYrTitnRHhKRE9OL3YyaUdj?=
 =?utf-8?B?Tm5CN3hXV1FUbmhyeGZsUUc2TVd5UjhibnpLQnVqNngra3cwWkhEOEpHSjht?=
 =?utf-8?B?eVYwQXl4MVM4TmY5UjJwNSsrcUVONy9sbVBoTVFSdUJjUyttR3JySXRTYmRy?=
 =?utf-8?B?V3E0eURzOXM0ZmszTjFqakRFNTR0VVFZVDZRc243dTNvMUhuNjAvbTVIUjJu?=
 =?utf-8?B?MzJvM0ZZdFR0K2JsejdiSkM3MGcwL1c0Qzk2WlZTS2R1YTFYc1kzczVZdVBt?=
 =?utf-8?B?dll6VlF2c1VwSEhWNFUxOS9JTE5hRGpoTWU3NlpLNHZQdExiMjEzVmVFdjQ3?=
 =?utf-8?B?d1dyQjA4OUFieXhzak1MZVhBc0RIditBSjdOWG53RzNZTysrblNyaVRTV2dU?=
 =?utf-8?B?ZVA1WWdsZWdGZ3BqWXVrMHl6d2xGRFFucEI3NncxT3pveDNYN1g4M1R0NGxs?=
 =?utf-8?B?MFNEQkdJVU1QdExwSXRQckduNkcrcUdhalk4My9HYnk4SmZWV1dKWWRuLzZ4?=
 =?utf-8?B?K3U0S2tKeWVFbnMrQU12ZzFPREdhdzE1Ukc1OHNIVE9oMEpiTzdZSG9LQlI3?=
 =?utf-8?B?U0xhUzBvdXhwRGxncUJVVWpnLzlQdUFhSE5KRUtnUUc3ZjFLbUZWZWpGU0FC?=
 =?utf-8?B?anhsaDhzRGFqQUJPbUJ4VGZoSXF5dTlGbk5xQTVBKzlWQXhOclBrUjVhZjh4?=
 =?utf-8?B?QkhxajNWMm5JZVRnRTJMdktNWExESkhGSmlYTWJzUytVWllJRjZ4YUMzbEpT?=
 =?utf-8?B?ZHg2c3ZtNllWZUNCd0lkLytVVnVSS1JyVlZTMDBYcTdRRFJkRlFsZWJINVVS?=
 =?utf-8?B?T3krQllySjhTd3FnNDhKaGl1Y3RLOENqT2YvZ3NpRmlDTzV0VkQ0M2w3Sk1E?=
 =?utf-8?B?Rmt6cXN3dEo5Wm5uc3NTK0F0eUN0bmM4M1RGV0xub0xnZjJsUFlDQzZyNUli?=
 =?utf-8?B?NmQ3NEJoNHNEdjEyTmtZNS9FaGloSmtnN1RDanZFT2FVV1RBVjVVdnJJbjh2?=
 =?utf-8?B?a3d3ckpaaWt0NUhsT2pCc25Ua2RlYWNSTjRGTUhEVytTNnN0NVdiaGZNWjR2?=
 =?utf-8?B?NVRocWpoaTN5MXlIZEpUWUVLSDdBOWJUZGVoZjhtTXFXTEdHRVlPSXJtWnhu?=
 =?utf-8?B?Y3EybmhKNkZHZStHMnViWkpMTlg2cmhJSHppS1lETWtJUHNWK1BjUnQ2Vlh2?=
 =?utf-8?B?N1hqYngxR2hoYkVMRGZYTFY4amNlVFYvdFZSSG43V0czRkVWMGszcG14VE5m?=
 =?utf-8?Q?Ke9IuQv+9XlsXi1NZuNhSWiH4aSXRfPW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0lLaHpic05BYzJVcTFZcENPZkRCSFdTT2c3b1lPbElhTTB3RTFXZmZtajBD?=
 =?utf-8?B?T3NCaTVXSmdvTHlSMGNmb0VjZkoyMSsyVGc5UTVTa2VSQ1FFLzFEd0VJVVI4?=
 =?utf-8?B?SUpEUVZ0M0hyejRJYWgrTzlmOXZmUXlOL2kvRGpud2kwU0R2TWdyZllnaGpG?=
 =?utf-8?B?K1A3dU1XZDFadFZwaHdONGFleDlEYVhreTg3dmZUVWJkQlZwa1plcHRiTVBz?=
 =?utf-8?B?OE1jZmlrcDg2U0lNWVp2UHNtcFJtdnliUkdxdXo4YmFBb2dpU01rYndIMjI4?=
 =?utf-8?B?Mk1XUG9udkM5ZWdMRlhlRDhzQXJPQVhaNHE1WENLWnBFYWlOL0NqL0ZSWG1t?=
 =?utf-8?B?N08zTC9IcDR2Njc1WndmZnQyc3ZSUlFFTExsL2tBYnkwZGkyU2tUOElVY0FE?=
 =?utf-8?B?UjFyQXVhQlN6dWhzQU92ZDFqcUh4ZFVJd2FDaTRydVlKVlg5ZHlNNnIrZ2sx?=
 =?utf-8?B?TEdXRHlWcjI0MkRNWjd0UVYyMUNPdmJBOGt1ZG5wYW1uWlkzSFA3OVJTb1Y5?=
 =?utf-8?B?R3BwV09MSDV1U0plVksrSlliSlhoY1RCcDJ3bG0zcjI0RVo0S2NPeVF5OWFm?=
 =?utf-8?B?NlkwRmhwUEpQcy92bWZlVXFsekE5MXZRM09tSUY3UHZaVnhiNmZSQ2pUVVFF?=
 =?utf-8?B?dHFHZHF3c1h6K3YvNmpyclBFU2x1WitQYzNkTXRDNU1zT05MQTB4QnVhL1Bk?=
 =?utf-8?B?emcrS09LTTFKa2c0S2ZWNUQwendjcTJvR05tYlB0UWJHMDVTRy9aRlR5T0tp?=
 =?utf-8?B?RHpNWEVGd3lEcWtneTI3UkVFSmphMHlVeGIxVGtVWFF5dEpTaWFid0prdEVz?=
 =?utf-8?B?Rm9PQnE5TEtPekQ5ejZSam8vb2I2SW9jd1FuVFo5bFlZQ1gzaG5XclJYNEtI?=
 =?utf-8?B?ZUFEVDhRVkQzcnFLOFpxdUZDTGtsT2hkM0VWMC9uNjdJNHJCd0Y5dmVBSFhI?=
 =?utf-8?B?bjQ2dnVrbkVxRFJ6YkFHQStmdWloR2tZczMrdDh1WHJHc0pIWDg5dHhmY0xQ?=
 =?utf-8?B?enRTdXl6d1dkc3h6ZWxsZzlIUTFLWEZNRGRHZnJXZGRrTXpkWWo5VzFFMGl3?=
 =?utf-8?B?REpjZXptcWY0Z0U3TFNVV1V5V2RtbXMvMXlqWTlaczF5cnlMMlhpa1pxTG85?=
 =?utf-8?B?OUFvM1NEOGpTRGxOS3ZmS2JMUXpqWmkvaGlxVXlXVWlYZFZmT3BTdUVyNkhO?=
 =?utf-8?B?dDdzcVpqZklxV0Z0Zmp6SzIxNzhwMk1jNmltM1lhS0l1cnRLY0IrcUxoRUda?=
 =?utf-8?B?NGs2N1k1bTB1NzNybnRWYjE4VnJkeTEvMHhLVGZreGF2bkVmeHFqOEZzK3Zx?=
 =?utf-8?B?dXE5RTZLWlMwbytpUi84bU1JcG90NjNESmZNY1N2V3BDWXBxazRnSFpUMUl2?=
 =?utf-8?B?SnVVejhRYWNYL1RGdlptSm8zSjI4VzR3dTFpV1c5TGVKUk56MnVHc0xlYnMv?=
 =?utf-8?B?NFJmS0VCTDJNVGdINjVtVFl5RGZCQzE0K0owZ0hCWDhkeWhMU3FkZjRLc3RX?=
 =?utf-8?B?VW05cFd1ak1ieVpCRzVERXJLSXNYcDVObGRKVVdyMVVOSEk1R0dIVXRUS3h1?=
 =?utf-8?B?TTY4dkxFVHNESWJYT3BRWHFlUldvVCtpRUhLb2huRXUva0F4eWZGSjdJVHp5?=
 =?utf-8?B?bnhrWUt2d1JPOTRqTW5tVWxaTUhZWm1rekVwNmxkb21FOVdIdkhQejdsWnBz?=
 =?utf-8?B?WG4xUm9xb2xKN1MrNUhjYTlsOW5wb3IxQTVZTERqemkveUJFVWRQUHZqaGlz?=
 =?utf-8?B?a2lZd01YWjRueExiamk4VjY4M2szZStXcTFSVkNLdTBiQ3ZoUUl4cWEzeW1k?=
 =?utf-8?B?bkp1Sk92UloyeEFlR1AyOWFQNXhnaHROcm9ncm1La1dZeU55TkJ1bFUwWEl6?=
 =?utf-8?B?amMydy94aWYyWFdQWVl4QkQxU3J0dlNLaFVEc3AxM2w2clNZSTYyQTh4endK?=
 =?utf-8?B?K3hqT1pzNWpSWUVSNHBxTlhPTzc1R2dvL1FRWEJPWFpoT3dLUjZmWHVoRDBJ?=
 =?utf-8?B?b3R5WWpMQjcyNXlkcXRBMExPSzhxa0kvNTlVaWtqT0FhZE10bm9Cd1h3cnpa?=
 =?utf-8?B?TTl1Q0JWWEhhbi93NXVNSkxzUVUvNlAyUXNuelJLdU5ybUpJb2VtZ0lTK3Rw?=
 =?utf-8?Q?7/d/iBtGmj03mQ1oxJKLAvU2O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b60b1e63-0ff7-4ee2-7d29-08de1ddb1450
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 08:53:11.4621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcmFtf9+/t2xAzn+YBaCNrsgZXCl8YLh/wlH58B9bd/japD9bUzPG98Ftb9uKbLxWE6hgZdn5K6y0vcjIYubew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8395
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

On 11/6/2025 16:28, Marcin Bernatowicz wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add new helpers for tile-based MMIO access:
>   - xe_mmio_tile_read32()
>   - xe_mmio_tile_read64()
>   - xe_mmio_tile_write32()
>   - xe_mmio_tile_write64()
>
> These functions provide explicit MMIO read/write operations within
> a given tile by applying TILE_MMIO_SIZE offsetting logic.
> GGTT is also a per-tile resource, so let's adjust the GGTT access
> helpers to use tile IDs instead of GT.
>
> v2:
>   - find the real tile based on gt instead of assuming root tile
> v3:
>   - drop misleading GT-oriented helpers (Lukasz)
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>   lib/xe/xe_mmio.c               | 78 ++++++++++++++++------------------
>   lib/xe/xe_mmio.h               | 13 +++---
>   lib/xe/xe_sriov_provisioning.c |  6 +--
>   lib/xe/xe_sriov_provisioning.h |  2 +-
>   tests/intel/xe_sriov_flr.c     | 12 +++---
>   5 files changed, 52 insertions(+), 59 deletions(-)
>
> diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
> index 834816133..b52e90dba 100644
> --- a/lib/xe/xe_mmio.c
> +++ b/lib/xe/xe_mmio.c
> @@ -107,94 +107,88 @@ void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
>   	return iowrite64(mmio->intel_mmio.igt_mmio, offset, val);
>   }
>   
> -/**
> - * xe_mmio_gt_read32:
> +/** xe_mmio_tile_read32:
>    * @mmio: xe mmio structure for IO operations
> - * @gt: gt id
> - * @offset: mmio register offset in tile to which @gt belongs
> + * @tile: tile id
> + * @offset: mmio register offset in the tile
>    *
> - * 32-bit read of the register at @offset in tile to which @gt belongs.
> + * 32-bit read of the register at @offset in the specified @tile
>    *
> - * Returns:
> - * The value read from the register.
> + * Returns: The value read from the register.
>    */
> -uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
> +uint32_t xe_mmio_tile_read32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
>   {
> -	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> +	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * tile));
>   }
>   
> -/**
> - * xe_mmio_gt_read64:
> +/** xe_mmio_tile_read64:
>    * @mmio: xe mmio structure for IO operations
> - * @gt: gt id
> - * @offset: mmio register offset in tile to which @gt belongs
> + * @tile: tile id
> + * @offset: mmio register offset in the @tile
>    *
> - * 64-bit read of the register at @offset in tile to which @gt belongs.
> + * 64-bit read of the register at @offset in the specified @tile
>    *
> - * Returns:
> - * The value read from the register.
> + * Returns: The value read from the register.
>    */
> -uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
> +uint64_t xe_mmio_tile_read64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
>   {
> -	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> +	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * tile));
>   }
>   
>   /**
> - * xe_mmio_gt_write32:
> + * xe_mmio_tile_write32:
>    * @mmio: xe mmio structure for IO operations
> - * @gt: gt id
> - * @offset: mmio register offset
> + * @tile: tile id
> + * @offset: mmio register offset in the @tile
>    * @val: value to write
>    *
> - * 32-bit write to the register at @offset in tile to which @gt belongs.
> + * 32-bit write to the register at @offset in the specified @tile
>    */
> -void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val)
> +void xe_mmio_tile_write32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint32_t val)
>   {
> -	return xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> -			       val);
> +	xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * tile), val);
>   }
>   
>   /**
> - * xe_mmio_gt_write64:
> + * xe_mmio_tile_write64:
>    * @mmio: xe mmio structure for IO operations
> - * @gt: gt id
> - * @offset: mmio register offset
> + * @tile: tile id
> + * @offset: mmio register offset in the @tile
>    * @val: value to write
>    *
> - * 64-bit write to the register at @offset in tile to which @gt belongs.
> + * 64-bit write to the register at @offset in the specified @tile
>    */
> -void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val)
> +void xe_mmio_tile_write64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint64_t val)
>   {
> -	return xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> -			       val);
> +	xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * tile), val);
>   }
>   
>   /**
>    * xe_mmio_ggtt_read:
>    * @mmio: xe mmio structure for IO operations
> - * @gt: gt id
> - * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> + * @tile: tile id
> + * @offset: PTE offset from the beginning of GGTT in @tile
>    *
> - * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
> + * Read of GGTT PTE at GGTT @offset in the @tile.
>    *
>    * Returns:
>    * The value read from the register.
>    */
> -xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
> +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
>   {
> -	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
> +	return xe_mmio_tile_read64(mmio, tile, offset + GGTT_OFFSET_IN_TILE);
>   }
>   
>   /**
>    * xe_mmio_ggtt_write:
>    * @mmio: xe mmio structure for IO operations
> - * @gt: gt id
> - * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> + * @tile: tile id
> + * @offset: PTE offset from the beginning of GGTT in @tile
>    * @pte: PTE value to write
>    *
> - * Write PTE value at GGTT @offset in tile to which @gt belongs.
> + * Write PTE value at GGTT @offset in the @tile.
>    */
> -void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
> +void xe_mmio_ggtt_write(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, xe_ggtt_pte_t pte)
>   {
> -	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
> +	return xe_mmio_tile_write64(mmio, tile, offset + GGTT_OFFSET_IN_TILE, pte);
>   }
> diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
> index f144d4b53..35cafa448 100644
> --- a/lib/xe/xe_mmio.h
> +++ b/lib/xe/xe_mmio.h
> @@ -29,13 +29,12 @@ uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset);
>   void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val);
>   void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val);
>   
> -uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset);
> -uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset);
> +uint32_t xe_mmio_tile_read32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset);
> +uint64_t xe_mmio_tile_read64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset);
> +void xe_mmio_tile_write32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint32_t val);
> +void xe_mmio_tile_write64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint64_t val);
>   
> -void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val);
> -void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val);
> -
> -xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
> -void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
> +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset);
> +void xe_mmio_ggtt_write(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
>   
>   #endif	/* XE_MMIO_H */
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index ff9d1f7d2..2ca73d2ef 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -90,7 +90,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
>   /**
>    * xe_sriov_find_ggtt_provisioned_pte_offsets - Find GGTT provisioned PTE offsets
>    * @pf_fd: File descriptor for the Physical Function
> - * @gt: GT identifier
> + * @tile: Tile id
>    * @mmio: Pointer to the MMIO structure
>    * @ranges: Pointer to the array of provisioned ranges
>    * @nr_ranges: Pointer to the number of provisioned ranges
> @@ -106,7 +106,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
>    *
>    * Returns 0 on success, or a negative error code on failure.
>    */
> -int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
> +int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, uint8_t tile, struct xe_mmio *mmio,
>   					       struct xe_sriov_provisioned_range **ranges,
>   					       unsigned int *nr_ranges)
>   {
> @@ -122,7 +122,7 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
>   
>   	for (uint32_t offset = START_PTE_OFFSET; offset < MAX_PTE_OFFSET;
>   	     offset += sizeof(xe_ggtt_pte_t)) {
> -		pte = xe_mmio_ggtt_read(mmio, gt, offset);
> +		pte = xe_mmio_ggtt_read(mmio, tile, offset);
>   		vf_id = (pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT;
>   
>   		if (vf_id != current_vf_id) {
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index e1a9d0a63..1e1dca866 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -92,7 +92,7 @@ struct xe_sriov_provisioned_range {
>   
>   const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
>   bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res, unsigned int gt);
> -int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
> +int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, uint8_t tile, struct xe_mmio *mmio,
>   					       struct xe_sriov_provisioned_range **ranges,
>   					       unsigned int *nr_ranges);
>   const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index aabbd8c05..077ed15af 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -493,20 +493,20 @@ struct ggtt_data {
>   
>   static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
>   {
> -	return xe_mmio_ggtt_read(mmio, gt, pte_offset);
> +	return xe_mmio_ggtt_read(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset);
>   }
>   
>   static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
>   {
> -	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
> +	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
>   }
>   
>   static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
>   {
> -	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
> +	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
>   
>   	/* force flush by read some MMIO register */
> -	xe_mmio_gt_read32(mmio, gt, GEN12_VF_CAP_REG);
> +	xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), GEN12_VF_CAP_REG);
>   }
>   
>   static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
> @@ -548,8 +548,8 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>   	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
>   	igt_assert(gdata->pte_offsets);
>   
> -	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, gt, gdata->mmio,
> -							 &ranges, &nr_ranges);
> +	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, xe_gt_get_tile_id(pf_fd, gt),
> +							 gdata->mmio, &ranges, &nr_ranges);
>   	if (ret) {
>   		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
>   				gt, ret);
