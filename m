Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03528EF5864
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 05:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A025A10E219;
	Mon, 23 Feb 2026 05:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbnDB9Jm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0A610E219
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 05:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771823482; x=1803359482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9y2kYBcvaNl9jC0XsNakNINCa1UAugKZ4rOv4I4Cq5w=;
 b=jbnDB9JmD+b0B+L5StsQMk6LIPLlqdiUNSkOhtFL9VnfF/hthNR96ggk
 42MfXF96Z8fkhVOyr2obS9H//R7p06qhGu3KIVec3+1v9GPtlzzg4BvC2
 EL4WO7H0+H9FD1i8AFKKvnJ4aDyPt2aVkZDkf/apOGYpRrx3Ltmisr28r
 uJuIBVS7C0F9xmtJEeG4coJBmo2ZjVtJwA/om/dSqyNqSNPMETpxSpTuQ
 ZZQ4e8BkT61K2XOs/ufsaBaHpmUEFdp/EduLGWyEAmvlz/Q9E0smTuIJw
 /okNiRxKQHUtoxU7cfYazJ0KqDBmJ2PR3WlwHSYXGiHuTENdnl7YTdmzu w==;
X-CSE-ConnectionGUID: UPWKMxcIRTq/Lfwzvg8zBA==
X-CSE-MsgGUID: wxXkiOECS8us3VTr+KFYpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72519124"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72519124"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:11:22 -0800
X-CSE-ConnectionGUID: YXqI69BWSXyJn4wH650enw==
X-CSE-MsgGUID: QxU8y9wDRR2pdGSKdWHKrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219570475"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:11:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:11:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 21:11:20 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:11:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtRXCH/C+rHYUQ+gW1d+mnHWe9VYcIQDYfuSp5Rc7nISUBC1L/44Nn+PF5yocKn2V7gkttfZ+PcaQ2FgI8Y5c2ikIUF1qYvPAdbG3lX6R2bYu3hiR2UsDQzqlcf0Yac6NXD2Lg5SeI719Q8xvdfgVBMTpfQlDd6Aod4GKiiq3YZA5ehjVOTxVl3I1iSpXSoPfenNthhSsj2GSPtsb6KIPpa/IOCDM0ZRaFoWtoH0VqjU0sFlBYxWdB6/cyPesxsKUr/goqLubSL/aezOlFfX/RuLrt14pVRUPnvHObvYaIOY+e/VJpkdGKVxORXuU/0dG4Ff3nhx0y+aNQp/sr2C2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y2kYBcvaNl9jC0XsNakNINCa1UAugKZ4rOv4I4Cq5w=;
 b=iu7vkln/2Iumn0qEksgFPfQkFILk4SPfRc20yF2hKwDvP8jG7AarwR+8WqU4hc/vcw7iPH3g0I5VF3bSuRpH8DE+3C0zw/XC2YhTJXTRemj25ikCteMQmjsKBmgVYHwQEeOUOhx0YUqG5pFtei7OCewN9G4cVsB2Sdjtof4vtgod20aqQnejvJIbP3eRR+waVpoFSmmjHkHFSOzMJg75Ps4GYqb+ss2LNd/7CSgf1r2iAQewBFaiQvfT+EOMrVPA5S5GZPOH9UtWU6HpI0Ps1lE8z4t9j5ibQN20ytiQX66L3YJkPOZtxh90ETBtuyczAmLKlWsTbLgy2DQBV75s/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 05:11:17 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 05:11:17 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 6/8] tests/intel/xe_madvise: Add
 dontneed-after-exec subtest
Thread-Topic: [PATCH i-g-t v3 6/8] tests/intel/xe_madvise: Add
 dontneed-after-exec subtest
Thread-Index: AQHcn7YnJLFahsapmke3+u4uABuuyLWPxjew
Date: Mon, 23 Feb 2026 05:11:17 +0000
Message-ID: <BL1PR11MB55256152932652611D4D77BC8477A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-7-arvind.yadav@intel.com>
In-Reply-To: <20260217023423.2632617-7-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7663:EE_
x-ms-office365-filtering-correlation-id: 86167ba5-8f02-4e32-5490-08de7299f945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Wk5KME9vMlpIdUJnaFRQNjdnelBveTNtLzc1OG1SYk1yT1BEdVZSVTlzTGtK?=
 =?utf-8?B?cDhYaldvcFU2YVREWVAxTVdYYWFUOTU4UHVpaldJRzlCNXYyOTc2U3NtMHE5?=
 =?utf-8?B?bzZkaHdEVk05M3d4bXV5T1Jlc1ZmNm9rWThiWXRzRWR2TFN6ZlN5dk1OdlZl?=
 =?utf-8?B?RWxXOFlXYzhqa0p5K2xjTk9GcUpjNmk0Vzdpd3hJRHhaV0ZMWU1Hdi9BUmZO?=
 =?utf-8?B?dUM1bXVFbE1tNm1oKzh1eWdaVnA2S2xNSWh0ZlV4bFRtZXFIVnkxMVhMOVdY?=
 =?utf-8?B?ZjMwdWp1SEhIdG9OaHRtOHBySzF0VGtQaUFrZWJPSHJQR0hLcDJpVkk3UWhP?=
 =?utf-8?B?SWF6K1gzRVVHY3AvZDZuMWJCV3dZWTBCTktGZnlSS3lXZ3Q1Tmp4a09Oalhl?=
 =?utf-8?B?VDlvaHpkc0gwd0g0RDJkRGVjNWdUYzRPeXRPYlM0dEpVMXdZT2xOeEpPSGFH?=
 =?utf-8?B?QUpCalY3elY5MWxLMXhIaW5paVgwR0psUDlXWkwvWkl1UWNONHVCa3JlalN5?=
 =?utf-8?B?bGw3dDlBdlpxcTE0NlQ4VlRZWjM5YnU0dnBnSzJtckFsTk53RllWemdHVDZ5?=
 =?utf-8?B?ZW1zSFI2eXlKa002Mnc2c3JDMVhHbzQybmJSaTQ4b3paNS82UEhHcjQ4RjFF?=
 =?utf-8?B?L2FQUlZSV0hYSVl5bFUrdnJ6YmpSRGVRSTBkN2hNcU9sSWJTT0tYbmcvcS9P?=
 =?utf-8?B?NTY2bFg3anJTKzVyTWl4U2RSdEltT0FBZ210cS90cHZEOFlQZGxSOXAvKzYx?=
 =?utf-8?B?MUpxTStOckdHZDFMd0lSVFgrc0tRcXJUbkQ1YzMzWVdqK29uQ25ENktmTHVE?=
 =?utf-8?B?OEVvTk1WcHN0WHYyc3hoUlIxL1l6SDdZUlhMeU1OK2t6aThOZHJsdU5Eenhx?=
 =?utf-8?B?cWo4MUphc0J5Ujh3VllEQURzR0ZWdUpudXpwdGNKK3pWOFk3Z2RyckNpcXNn?=
 =?utf-8?B?S2o4Y3VzNVYxUmd4Rm0vNlo1Nm96Z2p6cUhLVE52OFY3ZGM3OUtCSVhmWlhC?=
 =?utf-8?B?YU9VRmsxZE5KY3M1OTFHeWpDVHJpWUdqWWt3SjFabDhwcGhiT0JKTElsNHhy?=
 =?utf-8?B?ZjlsQk5CSWN3WjRvRmNod3A0V3pzUUpPS2ZqZnhnUkFSTUp3dDFBdWU3dU1N?=
 =?utf-8?B?dXBLYityQ0FLVDVRcjVHRCtyaUYrRnlhREpudEJFMVNNSktURzZTaldtVnZl?=
 =?utf-8?B?c2pWOGRDYmhpM1NjaTN6ZC9hVEU5TFFLS204L1laL1Vmajl2Y291M0lnYkxE?=
 =?utf-8?B?WEgwV2NMOER2Z0FPdDN2cnZHQ0JaaXFqaVNKMzBKOHhNTTc0azJiSzRRdytF?=
 =?utf-8?B?dXp3cTJldFBWKzlnTjN3ckFvMnZKSUpaN2lTT1cvTU5lV2VzQlQreUhjdlpN?=
 =?utf-8?B?R2lkL2V2SkJPZUZYOU5xVU9TVmx0Z3lWU21QN2NrRTJwNHdXU1VZNzI1NmNj?=
 =?utf-8?B?QWdZaEErTFJES3pvNXMzUVBlalVjSlJYZEx6MnNTSzhJR3p3cEpad0JpZzM4?=
 =?utf-8?B?U3RmN1k2OUV0V2RXaVQrMVROQnlEdkxsNVU5djdDa0x2Ym9BNnY0U2Fwa3lm?=
 =?utf-8?B?RnhEYjFnZm56RmZLTFpXNGdwZnNCT3V1SFNnYUt0d1hkQVIwUHNkYUJxNWVP?=
 =?utf-8?B?N3Btbk4zNUJWanR4OWVmWjZkSDJPY0JsZGlzZWxFMU1PZWhpaitDOWJGcUpK?=
 =?utf-8?B?b2Iwc1VwWTNlQkcxKzRVSXRvNWg0YWtYK2hpNDFuc2lhaWtqUHlnenpEdU95?=
 =?utf-8?B?SEFWR0FIZlZDblN0R1ZlSExqVDJuMDcxN0tmNGxTbFJ0bU9wZEJOWFRVNmZp?=
 =?utf-8?B?MXRsUGJRTzVqTTFjUXAvNlJ6Mng3L1MrcU1OOXdXTE5oVStMUjdVdlRHZDVa?=
 =?utf-8?B?azY4REt4ZTN5cGkrQVhUYjViWmlJbHpTWDRYRTBGRE5EUzBJR2UvYUFSRFhu?=
 =?utf-8?B?TVlBMTM4UkFhekpVeXF5K3RXbHNhYmNqdkdYeFhidWxkRXBLS3ZqcU80blRL?=
 =?utf-8?B?bGFGNnRpZUFuQmtaOEdhdStMcnFYSjFCdTlZTlk4cytVYkQvUU05bkZhTVVU?=
 =?utf-8?B?aFF0YzlaQ3dpOU5hSmdkdzlScVYyWEwwM3BXOE9ROENaK1BqVldDSDhtRzJV?=
 =?utf-8?B?L2Y2akpQQjBvdGdMSGpTVWZWbDdWMVYySTZ1RHJTNkM1SWtKWkZFRmhPeFdu?=
 =?utf-8?Q?xVaPz6f20XWJD3m63jxZghs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVBmRDFHbTIwdDlDSFQxWE9COTFodkpWZGlacGxRc2JhR203Y1gyNnB3eHhO?=
 =?utf-8?B?Vmp1OGJzQ0ZIMkg1QVhXbnNHWm5BWmxPZGdYMDdQRFNxdVY5eGZPYmhVVzdO?=
 =?utf-8?B?NG85NnV4L0NGQW8vOExJMHlLWEptVjQ2bFlhMEJMYXNPUC9ra1lzY0pKYWJo?=
 =?utf-8?B?c0xvdFBlT1VYdHJ0WGZsbzZsSmVHd3A0RHRmRVV2ZDV1WENJQytTTE45OXZL?=
 =?utf-8?B?UDBwQTBRVGhIbDhySTVOaUtLYVdleDBSNHdqNEpXZGpWV0dQdHAyOFVvOGR0?=
 =?utf-8?B?eklTQjRMdVAxVE9UQ2FndUhKU1JEMittaG8renV2anRaS3FIOTFGa3MzQjJY?=
 =?utf-8?B?Uk0yOWZPS3UvYlZWdzZkUmNrYkdGWFNta1RHc3VpNnNjMVIrM0pUNmlPQ0dp?=
 =?utf-8?B?Qm1VM01kTll4eWRST3hiL3NJNy9GcjB5UHdyZzhSRjlNUldWd0dRTXB6SlBa?=
 =?utf-8?B?N1ZQWUVubzV6QkZvT2l5RUc4WW5pUjJGRUJ4b2pIQ2dBb2E2c0N0dWRia2Ix?=
 =?utf-8?B?WkZwSlJ5VDNNaUYwK3ZFTzlMQytOTGtaZWZVcWJiQXVvZjV2WkV2M3g1UkNs?=
 =?utf-8?B?aXpXakZmWmozbVNUVnJwWHJZQUlIbXorNE94Z1VQRW1VNHQ5WENOc29rN1kv?=
 =?utf-8?B?bm9Uc01nS0N1K3pUUXlXeC9ZK0NDUTR3VVlBQlo2T2tHWDRJRzN4UTV2MlFC?=
 =?utf-8?B?azIxSUQ0S2V6eFRUM3RrbjlSUUdEek1ZNjBKbW9ieXA5QkU4NFlyRHNBNUIr?=
 =?utf-8?B?ekl3SGZ5dDFIZmF0Rnc5SkUwSjVnUHMxTzhDbkRnS25RSk55TFJpb0I5QVp6?=
 =?utf-8?B?ZXdFZkR0Y1A3ejB1VGh2RWRjR3NBMUNOSHhqdml4YThlOFNBRUVHMi8rR20y?=
 =?utf-8?B?MXNnajJ0bitOSmV6YmZoeHA1RDRZTG5hankrQ05zQWg5aDBsNExxQ2dUU3Fi?=
 =?utf-8?B?RTJiMHRibGczRkdUYjVvRHR0bW9ydXZpRVh4d2lrZ0FFb01oK2t5V1ZxV04v?=
 =?utf-8?B?R1dCbXpHT2lWMkxzeU5zYUpOVEd0aGcrY0tPUjBCWklHSnFKSVVEQU4vYW5X?=
 =?utf-8?B?NThjc3RBSVU4S3ZkRWFXYlprZWtxWFBuYWo3SWNzNmRDUjROeWxTR2I4SlNO?=
 =?utf-8?B?NVZ3ZnEwWldFOWkrMm9nZnZUTTlQODFsTmtHWmlnNmxGU3NoeWQ4MXVBRUdI?=
 =?utf-8?B?QjFZOVpRWlpLLzhaVyt1VHVvd0t2bHA5T1hWdlRKL3IzaWVXYUhJb3QzVEE2?=
 =?utf-8?B?Tm83MUt5UWFZS1FGdWlEQzNwS2xLSTBNRTl5Umh5UGUxa2tFNkJrOVVkelRH?=
 =?utf-8?B?QW9mTWY3OGdUZ3VFRFRibDFTaWhIaTJnSWRtclVLbjhRMXRwWXV6aEduLy95?=
 =?utf-8?B?WFl4OUx6KzAwaXM3U3pKL1dRSXJHQzBHS21pUzVpVU5tRGdXNG5BVTRhcmVa?=
 =?utf-8?B?aEpVS3dIVGdmQWhZYnhUWnJnZTdUdTQvSG5aQTNWZUZzYTZnUm9NMEFPbFM3?=
 =?utf-8?B?ZFV4bmZpS0FScjJ1T0JCWnZWWjFibE55Q1M4RC9YazZ0TEpNN1JrNGJpb2sz?=
 =?utf-8?B?TTdLRmNwU2FYNDRJTThPenpudXIxMVlaY21BTjQ1L3lqdFo1STNGcUJJSm1y?=
 =?utf-8?B?bzNXUjBiSXFmMThTcElxSnJhdU40cDV4UzFmNHNrRFN0Q3pyY1I3c2VZTS9a?=
 =?utf-8?B?UUEzdC9iVkRiZDNqK2dvZU5qVUUzdEhOcWc4b0swMXp5VHdvY2RaOExrNVE0?=
 =?utf-8?B?V2JDeGIvdFVTdjZaTjF1WmxZYnpYUHBKRGNUbDFvdDZKb1RWb25obTdLMzhB?=
 =?utf-8?B?ZGRwSVRCR1NGbmJLWjd6QjJTL2kvb09nOGd1MUV4d1VkUFBHT3VDQXVRZlk1?=
 =?utf-8?B?aEYyTS9CMndoWHlhaVR1RzJXVlJaYWtoelNzMit1L3FZS0tPVHprVWhlVVpy?=
 =?utf-8?B?OS9LT0U3N3ZIREEvL1UyZm5qTU1pb2RadFBXeUkwbyt0eDVjdDJpYS9JTVhu?=
 =?utf-8?B?REZXZ3lnejU2Rzk2Tms1OVpnZzFVWGliME1VaUltVHliTGw4ckRxT211U3Fm?=
 =?utf-8?B?bDVIUll2V3o0UkEvNmhoS0tFYzBVSXhZU3pCRzN5NjZDUCtCRXlFTy9VTkRQ?=
 =?utf-8?B?Slo2U2VEampOc0lRWm5qNUtocnBwT2MzSXByUHZBdlVUZW12NWY0UkQ2cWlr?=
 =?utf-8?B?WE5Xemh6Y0N5MStVQnEzNHNTMkdIYTdiSi9ITWRYcUFPY2w3MEpXUkx6UDBV?=
 =?utf-8?B?NXVDUU5Sck82NkFkYTRaQ2lFNEJsOTJIUTdzeCtQS3ZIczhKV2FSeE56TUtW?=
 =?utf-8?B?cisrd2ZIcGxnRkZMVjE1RncxWEgwdEJNZnlHYW40VEYrVlJkSDdPQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86167ba5-8f02-4e32-5490-08de7299f945
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 05:11:17.0616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LD6S8OLYIoQS7P2M+SH0YksaEZulnLdn/Fjfu30xSRnrJiQ3uMrSCenDQ206C+JWi19q8tePN48fGTR3CWpZtU2lQ2L1bITS96nF/IdvwIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIEFydmluZCA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgMTcgRmVicnVhcnksIDIw
MjYgMDg6MDQgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
cm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwg
UHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb207DQo+IFNoYXJtYSwgTmlzaGl0IDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDYvOF0gdGVzdHMvaW50ZWwveGVfbWFkdmlz
ZTogQWRkIGRvbnRuZWVkLWFmdGVyLWV4ZWMNCj4gc3VidGVzdA0KPiANCj4gVGhpcyB0ZXN0IHZl
cmlmaWVzIHRoYXQgbWVtb3J5IGNhbiBiZSBtYXJrZWQgcHVyZ2VhYmxlIGFuZCByZWNsYWltZWQg
YWZ0ZXINCj4gc3VjY2Vzc2Z1bCBHUFUgZXhlY3V0aW9uLiBUaGUgdGVzdCBmaXJzdCBleGVjdXRl
cyBhIGJhdGNoIHRoYXQgd3JpdGVzIHRvIGEgZGF0YQ0KPiBCTyBhbmQgdmVyaWZpZXMgdGhlIHJl
c3VsdC4gSXQgdGhlbiBtYXJrcyB0aGUgQk8gYXMgRE9OVE5FRUQsIHRyaWdnZXJzDQo+IG1lbW9y
eSBwcmVzc3VyZSB0byBwdXJnZSBpdCwgYW5kIGF0dGVtcHRzIGEgc2Vjb25kIGV4ZWN1dGlvbi4g
VGhlIHNlY29uZA0KPiBleGVjdXRpb24gbWF5IGZhaWwgb3Igc3VjY2VlZCB3aXRoIHNjcmF0Y2gg
cmViaW5kLCB2YWxpZGF0aW5nIHRoYXQgdGhlIGtlcm5lbA0KPiBjb3JyZWN0bHkgaGFuZGxlcyBw
dXJnZWQgQk9zIGluIEdQVSBzdWJtaXNzaW9ucy4NCj4gDQo+IENjOiBOaXNoaXQgU2hhcm1hIDxu
aXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gQ2M6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlr
YS5ndXJyYW1AaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBp
bnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+DQo+IENjOiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFsLnByYXNhZC5n
aGltaXJheUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFydmluZCBZYWRhdiA8YXJ2aW5k
LnlhZGF2QGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9tYWR2aXNlLmMgfCA5
Mw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVs
L3hlX21hZHZpc2UuYyBiL3Rlc3RzL2ludGVsL3hlX21hZHZpc2UuYyBpbmRleA0KPiA0MmNmMWIz
ZTUuLjUxZWY0ZmFkMyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfbWFkdmlzZS5jDQo+
ICsrKyBiL3Rlc3RzL2ludGVsL3hlX21hZHZpc2UuYw0KPiBAQCAtMTYsNiArMTYsNyBAQA0KPiAN
Cj4gICNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiAgI2luY2x1ZGUgInhlL3hlX3F1ZXJ5Lmgi
DQo+ICsjaW5jbHVkZSAibGliL2lndF9zeW5jb2JqLmgiDQo+IA0KPiAgLyogUHVyZ2VhYmxlIHRl
c3QgY29uc3RhbnRzICovDQo+ICAjZGVmaW5lIFBVUkdFQUJMRV9BRERSCQkweDFhMDAwMA0KPiBA
QCAtMzc4LDYgKzM3OSw5MiBAQCBzdGF0aWMgdm9pZCB0ZXN0X2RvbnRuZWVkX2JlZm9yZV9leGVj
KGludCBmZCwgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuYw0KPiAgCXhlX3Zt
X2Rlc3Ryb3koZmQsIHZtKTsNCj4gIH0NCj4gDQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGRvbnRu
ZWVkLWFmdGVyLWV4ZWMNCj4gKyAqIERlc2NyaXB0aW9uOiBNYXJrIEJPIGFzIERPTlRORUVEIGFm
dGVyIEdQVSBleGVjLCB2ZXJpZnkgbWVtb3J5DQo+ICtiZWNvbWVzIGluYWNjZXNzaWJsZQ0KPiAr
ICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+ICsgKi8NCj4gK3N0YXRpYyB2
b2lkIHRlc3RfZG9udG5lZWRfYWZ0ZXJfZXhlYyhpbnQgZmQsIHN0cnVjdA0KPiArZHJtX3hlX2Vu
Z2luZV9jbGFzc19pbnN0YW5jZSAqaHdlKSB7DQo+ICsJdWludDMyX3Qgdm0sIGV4ZWNfcXVldWUs
IGJvLCBiYXRjaF9ibywgYmluZF9lbmdpbmU7DQo+ICsJdWludDY0X3QgZGF0YV9hZGRyID0gUFVS
R0VBQkxFX0FERFI7DQo+ICsJdWludDY0X3QgYmF0Y2hfYWRkciA9IFBVUkdFQUJMRV9CQVRDSF9B
RERSOw0KPiArCXNpemVfdCBkYXRhX3NpemUgPSBQVVJHRUFCTEVfQk9fU0laRTsNCj4gKwlzaXpl
X3QgYmF0Y2hfc2l6ZSA9IFBVUkdFQUJMRV9CT19TSVpFOw0KPiArCXN0cnVjdCBkcm1feGVfc3lu
YyBzeW5jWzJdID0gew0KPiArCQl7IC50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9VU0VSX0ZFTkNF
LA0KPiArCQkgIC5mbGFncyA9IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMLA0KPiArCQkgIC50aW1l
bGluZV92YWx1ZSA9IFBVUkdFQUJMRV9GRU5DRV9WQUwgfSwNCj4gKwkJeyAudHlwZSA9IERSTV9Y
RV9TWU5DX1RZUEVfU1lOQ09CSiwNCj4gKwkJICAuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJ
R05BTCB9LA0KPiArCX07DQo+ICsJc3RydWN0IGRybV94ZV9leGVjIGV4ZWMgPSB7DQo+ICsJCS5u
dW1fYmF0Y2hfYnVmZmVyID0gMSwNCj4gKwkJLm51bV9zeW5jcyA9IDIsDQo+ICsJCS5zeW5jcyA9
IHRvX3VzZXJfcG9pbnRlcihzeW5jKSwNCj4gKwl9Ow0KPiArCXVpbnQzMl90ICpkYXRhLCAqYmF0
Y2g7DQo+ICsJdWludDMyX3Qgc3luY29iajsNCj4gKwlpbnQgYiwgcmV0Ow0KPiArDQo+ICsJcHVy
Z2VhYmxlX3NldHVwX2JhdGNoX2FuZF9kYXRhKGZkLCAmdm0sICZiaW5kX2VuZ2luZSwNCj4gJmJh
dGNoX2JvLA0KPiArCQkJCSAgICAgICAmYm8sICZiYXRjaCwgJmRhdGEsIGJhdGNoX2FkZHIsDQo+
ICsJCQkJICAgICAgIGRhdGFfYWRkciwgYmF0Y2hfc2l6ZSwgZGF0YV9zaXplKTsNCj4gKwltZW1z
ZXQoZGF0YSwgMCwgZGF0YV9zaXplKTsNCj4gKw0KPiArCXN5bmNvYmogPSBzeW5jb2JqX2NyZWF0
ZShmZCwgMCk7DQo+ICsNCj4gKwkvKiBQcmVwYXJlIGJhdGNoIHRvIHdyaXRlIHRvIGRhdGEgQk8g
Ki8NCj4gKwliID0gMDsNCj4gKwliYXRjaFtiKytdID0gTUlfU1RPUkVfRFdPUkRfSU1NX0dFTjQ7
DQo+ICsJYmF0Y2hbYisrXSA9IGRhdGFfYWRkcjsNCj4gKwliYXRjaFtiKytdID0gZGF0YV9hZGRy
ID4+IDMyOw0KPiArCWJhdGNoW2IrK10gPSAweGZlZWQwMDAxOw0KPiArCWJhdGNoW2IrK10gPSBN
SV9CQVRDSF9CVUZGRVJfRU5EOw0KPiArDQo+ICsJZXhlY19xdWV1ZSA9IHhlX2V4ZWNfcXVldWVf
Y3JlYXRlKGZkLCB2bSwgaHdlLCAwKTsNCj4gKwlleGVjLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1
ZXVlOw0KPiArCWV4ZWMuYWRkcmVzcyA9IGJhdGNoX2FkZHI7DQo+ICsNCj4gKwkvKiBVc2Ugb25s
eSBzeW5jb2JqIGZvciBleGVjIChub3QgVVNFUl9GRU5DRSkgKi8NCj4gKwlzeW5jWzFdLmhhbmRs
ZSA9IHN5bmNvYmo7DQo+ICsJZXhlYy5udW1fc3luY3MgPSAxOw0KPiArCWV4ZWMuc3luY3MgPSB0
b191c2VyX3BvaW50ZXIoJnN5bmNbMV0pOw0KPiArDQo+ICsJcmV0ID0gX194ZV9leGVjKGZkLCAm
ZXhlYyk7DQo+ICsJaWd0X2Fzc2VydF9lcShyZXQsIDApOw0KPiArDQo+ICsJaWd0X2Fzc2VydChz
eW5jb2JqX3dhaXQoZmQsICZzeW5jb2JqLCAxLCBJTlQ2NF9NQVgsIDAsIE5VTEwpKTsNCj4gKwlt
dW5tYXAoZGF0YSwgZGF0YV9zaXplKTsNCj4gKwlkYXRhID0geGVfYm9fbWFwKGZkLCBibywgZGF0
YV9zaXplKTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKGRhdGFbMF0sIDB4ZmVlZDAwMDEpOw0KPiArDQo+
ICsJaWd0X2Fzc2VydChwdXJnZWFibGVfbWFya19hbmRfdmVyaWZ5X3B1cmdlZChmZCwgdm0sIGRh
dGFfYWRkciwNCj4gK2RhdGFfc2l6ZSkpOw0KPiArDQo+ICsJLyogUHJlcGFyZSBzZWNvbmQgYmF0
Y2ggKGRpZmZlcmVudCB2YWx1ZSkgKi8NCj4gKwliID0gMDsNCj4gKwliYXRjaFtiKytdID0gTUlf
U1RPUkVfRFdPUkRfSU1NX0dFTjQ7DQo+ICsJYmF0Y2hbYisrXSA9IGRhdGFfYWRkcjsNCj4gKwli
YXRjaFtiKytdID0gZGF0YV9hZGRyID4+IDMyOw0KPiArCWJhdGNoW2IrK10gPSAweGZlZWQwMDAy
Ow0KPiArCWJhdGNoW2IrK10gPSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiArDQo+ICsJcmV0ID0g
X194ZV9leGVjKGZkLCAmZXhlYyk7DQo+ICsJaWYgKHJldCA9PSAwKSB7DQo+ICsJCS8qIEV4ZWMg
c3VjY2VlZGVkLCBidXQgd2FpdCBtYXkgZmFpbCBvbiBwdXJnZWQgQk8gKGJvdGgNCj4gYmVoYXZp
b3JzIHZhbGlkKSAqLw0KPiArCQlzeW5jb2JqX3dhaXQoZmQsICZzeW5jb2JqLCAxLCBJTlQ2NF9N
QVgsIDAsIE5VTEwpOw0KPiArCX0NCj4gKw0KPiArCW11bm1hcChkYXRhLCBkYXRhX3NpemUpOw0K
PiArCW11bm1hcChiYXRjaCwgYmF0Y2hfc2l6ZSk7DQo+ICsJZ2VtX2Nsb3NlKGZkLCBibyk7DQo+
ICsJZ2VtX2Nsb3NlKGZkLCBiYXRjaF9ibyk7DQo+ICsJc3luY29ial9kZXN0cm95KGZkLCBzeW5j
b2JqKTsNCj4gKwl4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGJpbmRfZW5naW5lKTsNCj4gKwl4
ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWUpOw0KPiArCXhlX3ZtX2Rlc3Ryb3ko
ZmQsIHZtKTsNCj4gK30NCj4gKw0KPiAgaW50IGlndF9tYWluKCkNCj4gIHsNCj4gIAlzdHJ1Y3Qg
ZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdlOyBAQCAtNDA2LDYgKzQ5MywxMiBAQA0K
PiBpbnQgaWd0X21haW4oKQ0KPiAgCQkJYnJlYWs7DQo+ICAJCX0NCj4gDQo+ICsJaWd0X3N1YnRl
c3QoImRvbnRuZWVkLWFmdGVyLWV4ZWMiKQ0KPiArCQl4ZV9mb3JfZWFjaF9lbmdpbmUoZmQsIGh3
ZSkgew0KPiArCQkJdGVzdF9kb250bmVlZF9hZnRlcl9leGVjKGZkLCBod2UpOw0KPiArCQkJYnJl
YWs7DQo+ICsJCX0NCj4gKw0KUmV2aWV3ZWQtYnk6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlr
YS5ndXJyYW1AaW50ZWwuY29tPg0KPiAgCWlndF9maXh0dXJlKCkgew0KPiAgCQl4ZV9kZXZpY2Vf
cHV0KGZkKTsNCj4gIAkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+IC0tDQo+IDIuNDMuMA0KDQo=
