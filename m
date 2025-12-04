Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FD3D21680
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEAD10E1D0;
	Thu,  4 Dec 2025 21:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8i/zP0R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05ED10E1D0
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764882644; x=1796418644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mK/wuFddXSl4HjmNpx1HndDCTUHTPGxvYt2bY5XDah0=;
 b=Y8i/zP0RUjFsWBSOsTi2J0RPXabpV0Oy8mRX2FQzdsQrXDHjYc9vM2pv
 0Ts9v8w+y0qtKBtxz/x2DDfntG8W1TLj8d8bUEBPRBNh9nbzluFSpuUya
 nG+eUP5ENPlZwAJn9bbyU4fNll33SSTDB9VTfJFpTG1SBAD+UQA2Ayam/
 pGBkwSaWUzem9HVD9uABL8UooEjNZTLubhlxq3uLeg6v8GB6SvzwYrqAJ
 H2LJ4mrjVq/ljAdz1Z1Q9sOVQSiemNhrih6IYi3IVxCqbnZ0p+bdACV1R
 TrsEUA/1Cj8vKFMq1SlhalnNC8VeAVN3f7yU1pCBVtnlwJIl5CETK44nD w==;
X-CSE-ConnectionGUID: 2vFdbVzoTXGRhW2HLO0keA==
X-CSE-MsgGUID: 3p8f/HDpSl6/r9HYdIvRUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="67079340"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="67079340"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:10:43 -0800
X-CSE-ConnectionGUID: koUN8K2qSg2qEFO4L8l/Mg==
X-CSE-MsgGUID: y/P29aMQQmSGVH/elXywjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="199259782"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:10:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:10:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 13:10:42 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:10:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/WEyv33T2l9ivCVFOYXtWICfCCf6iJoqmrZ4wVOBl2YSZ4JY0mSZAaHusC0u0p6034trRKPYwfPjtEJJ6JRNF+BOIctZsJ7GOTJJoJwZKPnVNrpJsDov0ebNXMPPeY2K2zMzgUlZHybF/ugZsgOf7z4opMuEJCGUYhgpTGMFbLBQ2sE1xNyO6POvuWQRq8PakJuAdb2ium1Fs3l9+PfgU/LpBi524T6lHIg3bjKRnSPvS02FoNKOabZKT0eRlN4B537elLIG0WtwmEiKHMnJXStZ0n31eb1hKeRwKd0tvcptEtEPQn3zyWpMuMJ8+qptjWa4HY8ixPNqOKu6hu16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mK/wuFddXSl4HjmNpx1HndDCTUHTPGxvYt2bY5XDah0=;
 b=ITuRFReaMG/H3EhkB6olG346oQHMHVXiXtYJAW1KJuz1dgOm/qHAn5Reg+uKUUkdatCEEfxmGs6YJ03v8YkPlYoAL/KnuZr+b9k6P5gBvn8lwJTt49Irc8KvciwHw4AfbDpWYttd6Lff3zEHwKiVi8BePvZgSmrw8jM4OsJmAXn5rY41OBwU9njznlKbfQkkM4O7xIz9jJ2PtdBkdGYlp7fwEIqEk3xsspIBF2HO9boYfRXvO0gl/xyb8sDnd6gLffusB3AmIYqIMQFmS4/NVQCvmDStxm+9HKriPGeQe8shsXXkQn/gR40CzA5hNl1i30EOJ3IdYi4UU5aFsn4MBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.10; Thu, 4 Dec 2025 21:10:39 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:10:38 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 17/19] tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag
Thread-Topic: [PATCH v2 17/19] tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag
Thread-Index: AQHcWpsI/FPFSqSlrkSYPnrtQK86trUSD6mA
Date: Thu, 4 Dec 2025 21:10:38 +0000
Message-ID: <dfa4a32b6459d404d4b06312ac502b9e72dcb020.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-38-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-38-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW3PR11MB4729:EE_
x-ms-office365-filtering-correlation-id: ce3d3a2b-0004-4ce7-a339-08de33799353
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?d3hxWUFEdHpLcTloTGtJaGxFNWZmOWJQZWxpcFQvMW1kdWN6aTkzRjdicGxK?=
 =?utf-8?B?QVhuS1lwVGtpRTg4eU1oZVQ1OEdvWlo0ZEFTR0RtVEt1T3RhRGxrVzhNMXU4?=
 =?utf-8?B?M2drL3NQLys0b1BWRTBTL0h6c2R4dFFjSmhYdW42OFZDdkRLOWVxU0trV3Zh?=
 =?utf-8?B?SVdBWUdIV2hwd0tFeG5BTjVZUldSc3dGV2s3T2NwMUo3b0ZULzdYN0xabjRZ?=
 =?utf-8?B?WHpzMVhwVGMxNGdyaUFLQVQ2c2haSlJGRjg3cGNkTm9yWFJUMVcwQnI4ZVZE?=
 =?utf-8?B?UkRuUTNCZnMzK05yQ1Q1VjlXYUlObFdqRFdSclRUdWNhVllQN1R5ejNEMVI0?=
 =?utf-8?B?dnlTZ0UzeU5WZWM2Z3d6cXRmN3dMZEJ1Q0NHU0VzS04veWU0bWdRbllKeVRS?=
 =?utf-8?B?QlRuOTUycVhrbDRHOEtUYTd3Z0Z6UHVlbFp2TGlCZVdsaXpNcmFtanVSZDNJ?=
 =?utf-8?B?WlJjYWFMd1YxekZHSE1CaGtYMzJZMDlKS0xmcjQ4MStmY25jTVhLOWpMUlJC?=
 =?utf-8?B?U0Rsam1QcHA1NlNoNHVxVHU3eW9KNEYyYlZUc0dVcy9hYTZBdDhPR092ZElX?=
 =?utf-8?B?MTdXMHJWVnNlMm00MHIwanNxam5KOHllWVpnZGNmQmpLYk94NzJmYTBCNDlG?=
 =?utf-8?B?UFJ5dlNmL2tMSDViM29RcnViRGI4ODJqb3RRUmlDc3E3T3JWb1NUZnRVSEFV?=
 =?utf-8?B?eEtQSEZKNzlDSGs0OVJjeElta09kd1V1ZUphc2lTd0VYeXBxVGlMK3I1SVRi?=
 =?utf-8?B?S3NhaERNYjkxbEtxK2xtbDJXU09YTGxnVXZTckZPT1hLeUk4bHVrRkZpZUNG?=
 =?utf-8?B?UitHM0loeWFZMFFmL1BGMjR6OG41aVovMkdpcjk2OVhONHhiRGRyenltRFpi?=
 =?utf-8?B?WTRnbWRaV0NJQURrblI5Z1Vqb0FjVjdRSDg5TklHeHNDTnRGeU9kYnU0dGlL?=
 =?utf-8?B?RXhVTFdNNHNaL3VidmREZVBuRjZ6ek9BOUFwRnBPMkdHMmJsN2xuQWtSMlZT?=
 =?utf-8?B?QjFER011dTQxOStMZlV3QXdvaGVzQkNzMFRtanFGODArM3YzcW1zYXVZWVcv?=
 =?utf-8?B?QUR1NzZMY3hqc2l4WkxGNWJnc3o2UVFBdXFwNjRGc01iSTRjN2JCb2ltZDNV?=
 =?utf-8?B?bGVONlduSFBaSnJRM2VSZFhBNVFrTDhQMTQvUit4N2wrbjRtZXhiZjEzNzBU?=
 =?utf-8?B?ZW9JZ2RDMEU5eEIzaFFMcjdZUFVJb2tySWw4ZlBnQ0JqdHZNcXVUQnRJRXkr?=
 =?utf-8?B?dXlpcGNPSDlWV1hOSzZlWk4xcDhvaHZ5akgvdjRya2xOSFpZM3JXeFZvL0hh?=
 =?utf-8?B?bEpHL2paMWowWjFibkt3MTZOV1pHLzlFa1RvcEd0eW5ibGJJRUJsa0ZOQWJ2?=
 =?utf-8?B?V3RmZW9xanNpbG1Ed0U1NXdtYjd4MVdVeG5hVnJrRFZUOWh1aW1hYXBwNVZF?=
 =?utf-8?B?V29NRzZyOG81MmpIdFZzSGRIUG5hdjI2KzZ4Y1BLZ1h4c3lTeHlFejRtMU4r?=
 =?utf-8?B?VUpmN01UWGxLV3JWRG5KT0d5dFVUN1ZoYXZ4MUJ3U21OZDdOa3BCTmMyWWcx?=
 =?utf-8?B?T09ReFVlMWdZUmRiSGVMei9KbHh5UEZXMHluSkJzcTJITU1JTDhTUzJld0o4?=
 =?utf-8?B?L2NGNGVTeG5DYXpEMUtUaTU2eWhBZU4xaUFJNmt5U0kvUS91SGowUU0xWXd4?=
 =?utf-8?B?c0p4TzFqOVJCYTljZFNULzE2MTl0bFJqTTF3M3lkZW5tSmszYUV3eWphNjVo?=
 =?utf-8?B?SkdmUU1PUFIvNDlGSkFQc01XNGtlNVpKZllhZk9adDBFZVM5Zkd6UDNDaU40?=
 =?utf-8?B?SXZZd1NRMlJWRWU4dkFIVFoyM3drVi9LVFU5THl0OWs2TmhqbzRPWnRGM1d5?=
 =?utf-8?B?bW9Ba3FneHVQUndQdWtnTE9YZW05WlVnTWJNRElXMXMybnlhZ2pOQkVnOE1q?=
 =?utf-8?B?ZitqNzh5MGV6WDVxeG9qZlVDMDVZTzFPVGZ4YS9BUU95S1VDekl4Qk9WZzF5?=
 =?utf-8?B?ak1YZmNWUWVWcW9Qa2ZlWHZPU3p4MXpzS3BjM0Y4bnZKRFI1U3FWSVZ6NnFS?=
 =?utf-8?Q?ferQI1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3U0ZTFOdUduKy9KOTE0eUxsSDlLQjM2VDNRZGlQd3Bwd1pnMzZ4RkEyS0pq?=
 =?utf-8?B?dXVmc0cyWmpZd1lDQVlJV2htYlZDRHNQWmlNaGpueDRBWTFzcXMwSEpuRW9m?=
 =?utf-8?B?N2hZRkJjSjNZWEI4VXYzTU14UHJNWXQ5TGR2KzBxei9aSzBZQStkY2djcURx?=
 =?utf-8?B?MUpvQU1mNTVycDRoalQrVk00QW1lUXQrV1VHUjRka0t0WHI2NVNYbGNVaGND?=
 =?utf-8?B?YVN1bjZKL1VSaDVRVzJtcm13bkpiSDNTd2prbUthbmRCSGFnMnpjNTFwUXNV?=
 =?utf-8?B?bGJrRDdMTW1tczJHOEUyM0Z1MUNWQTlMWk1iT0NVczRUZDRINVJFcHNqa1hh?=
 =?utf-8?B?eEczUC9oMEtNK09kN0JmTW1ScHo4OHpjT2RTZGNXd1ZnbzFtK3NyMGl0a2Jx?=
 =?utf-8?B?bTUwTkRUZFdIWlBoeE9QTWxEUUlQZkkrWG14SHZ6dVdPV1BsaUVkeU1wOVBx?=
 =?utf-8?B?TTRwK2Z3Sm1PYVFuQU5EdTdwNkVIMERXeHdCNUN3MFY4TWNPYlRSUTk1TWdk?=
 =?utf-8?B?dldoMHV1d3hWYTdJdldmNGZNQUNMTS9TV0lUQlBvVkNScHhUd2F2YjdLL2cx?=
 =?utf-8?B?Y05MWkJGWjdKMkI4dVlYQThnKzBDcUlPcVVjTktsVTNrYUtNaTFJcElkU003?=
 =?utf-8?B?VFl6cXVOc084dmV6Wi90OWthTElwd1ljQ0JFM0NIUktMN1M0UEd2SXdROGdE?=
 =?utf-8?B?YjFNY3ZOWndCZnRKUi84bkI4MkdUNFN3NUpDQUI2SG9SVll4ejhoSGpZaFgv?=
 =?utf-8?B?NGdvRHZTaDd2YW9pT1BlWnhxRW81d1d3ZHV4dDZYWnpVUkNzekxoYVovcmh3?=
 =?utf-8?B?YzVFd2NRU056bGMxQTRYRGlneC9yQnpjaTdnM2ZtMWoyYW9kZVNLUDd2eWZ2?=
 =?utf-8?B?V1ZnTzdGdXRFZ3J5VVBtU2paUXViRXVRU0M1UmYxc3plb1RRbmRCWWhwS0RZ?=
 =?utf-8?B?dm16SzdGaUZsQlp3d3hOZ1k2ZzExTnpGbWVUbG93MzZId0N4VlBYQjZzWm1M?=
 =?utf-8?B?NllmZzVJLzkzY0xWdXpET2VDYWhlb3l6V0wxSHVPbksvRTNhZlI1MjQyKzEx?=
 =?utf-8?B?MmpGdGd2Y0JmbWZudmZmakpnY0FDTHdJZmUzekF2VjZBdWllZW10OUQwajhV?=
 =?utf-8?B?VjV1MTQ0M1gxYkN0eUVmRFBZZW9zZlMrR0VMVUJCbWhBL1ZhZnQxZDRmeW1K?=
 =?utf-8?B?WXFMbUF1RTY5cTBBdEF2M2ZmNkVCVGU3VkxXNlc2U2ZlMEEzMFdFdWV4bjAy?=
 =?utf-8?B?eXRuNjM0NlVHQm5BU0t4ckUxL0VScytXU2hsWUh5K05wUHlBbW5VVm1jZFVa?=
 =?utf-8?B?OEx2MXhtZWxscW5hdzZOZzFmY2ZjSkM2RXUyaUNPQ2VYSnJkK1FZcDY0em5M?=
 =?utf-8?B?NUFPb0RFY2lORXpNZ01nenU0aVkxRkF0eEVaMnFrTU9OcFJHVG1xMThZT1lz?=
 =?utf-8?B?bEp2WEZPTk52K290ckQyUG1ldWtyZVl5L3ZLRFIxUjIyZisrSkdIb2R6N29j?=
 =?utf-8?B?RGhMUzdVQjE0a0JvTGFIQWw5Q2dPZjVPUENQQVpMK3NYcWZwWmFnUTN3eTlG?=
 =?utf-8?B?dmY1ZlRnM3lFSGFmbnQ5R1M0WllhNGc2WFpnVTJ3U0xMVWZKZVpWZmVCenoz?=
 =?utf-8?B?d2YveUhVdXJqRWFmdXRDTWtkUnJmR3NlNXJWVjlaRURDSmgyMzFqdFV5QVhk?=
 =?utf-8?B?K2RFS2dRMHBsNDdTYjFUVGxTWFJ0MTBVM3Qyb2tCb3lMb0ljZGZuRzVRWG1D?=
 =?utf-8?B?VWg2NFRhRnNDbzF4bU9EYXlSWkNzU3c5aGt3SjA0OW5KMEFSa1V5ZXRyQU5K?=
 =?utf-8?B?RzZVVnpYQzlRVGNWdXV2TTY4YldleFhZeVR0d2sxTWNQbHd5bnJ6U1U3N2kx?=
 =?utf-8?B?em1tbXQxS2Z6UnlJcmUrZWRzUzAyWHYvc204VWdZL1NYSWRDdWlZd3Myd3pZ?=
 =?utf-8?B?MkdYdjEwTVhaNVdNVGxrOGRscm5Td1hwS1lOMFl4d3pFWVFHTElYdE5HSHM1?=
 =?utf-8?B?Y3Q2VzlXaFZhU25nTktGK2RRSmtyOUtyTUYwVkdFd1ZMRlNMRHkxYUZPMzZO?=
 =?utf-8?B?OTVNSUxmak9SZ0lIaEVSMHl0SVlWL2h5dkNDMThRVkFsUG5KMExFZ01xejNI?=
 =?utf-8?B?SDVHZEt1a2Zmb050d1Y2Ykw2eGVFTXFETlp0Yzc0c3l4aEpSUFBOV2pabk1l?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAD5495908E3B34396643CBCB1C1AE51@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3d3a2b-0004-4ce7-a339-08de33799353
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 21:10:38.8899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a04rPMKtg3Qq8+sRjM8NNtnx0C/lvA/41WEZspKRDOQiG1AsnPGjVYsYhLIQ4DScGaqoueCo8FNyyRBsXT9X4S44bo5dSV/uBmaNRnuCet0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEFkZCBEUk1fWEVfTVVMVElfR1JPVVBfS0VFUF9BQ1RJVkUgdG8gdmFsaWQg
ZmxhZ3MgbGlzdC4KPiBWYWxpZGF0ZSB0aGF0IEtFRVBfQUNUSVZFIGlzIG5vdCBzdXBwb3J0ZWQg
aW4gcHJlZW1wdCBtb2RlCj4gdW5sZXNzIGZhdWx0IG1vZGUgaXMgc2V0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEKPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhh
cHVyYUBpbnRlbC5jb20+Cj4gLS0tCj4gwqB0ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVl
LmMgfCAzMQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAyOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90
ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNf
bXVsdGlfcXVldWUuYwo+IGluZGV4IDlmN2IzYjRkNy4uMjg4ZWY5ZWQ4IDEwMDY0NAo+IC0tLSBh
L3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+ICsrKyBiL3Rlc3RzL2ludGVsL3hl
X2V4ZWNfbXVsdGlfcXVldWUuYwo+IEBAIC0zNywxMCArMzcsMTIgQEAKPiDCoCNkZWZpbmUgRkFV
TFRfTU9ERcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDB4MSA8PCA2KQo+IMKgI2RlZmluZSBT
TUVNwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDcpCj4gwqAj
ZGVmaW5lIFdBSVRfTU9ERcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDgpCj4g
KyNkZWZpbmUgS0VFUF9BQ1RJVkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDkpCj4g
wqAKPiDCoCNkZWZpbmUgTUFYX0lOU1RBTkNFIDkKPiDCoAo+IC0jZGVmaW5lIFhFX01VTFRJX0dS
T1VQX1ZBTElEX0ZMQUdTwqDCoCAoRFJNX1hFX01VTFRJX0dST1VQX0NSRUFURSkKPiArI2RlZmlu
ZSBYRV9NVUxUSV9HUk9VUF9WQUxJRF9GTEFHU8KgwqAgKERSTV9YRV9NVUxUSV9HUk9VUF9DUkVB
VEUKPiB8wqDCoMKgwqDCoMKgwqAgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX1hFX01VTFRJX0dS
T1VQX0tFRVBfQUNUSVZFKQo+IMKgCj4gwqAjZGVmaW5lIEJBU0VfQUREUkVTU8KgwqDCoDB4MWEw
MDAwCj4gwqAKPiBAQCAtODEsNyArODMsOCBAQCBfX3Rlc3Rfc2FuaXR5KGludCBmZCwgaW50IGd0
LCBpbnQgY2xhc3MsIGJvb2wKPiBwcmVlbXB0X21vZGUpCj4gwqDCoMKgwqDCoMKgwqDCoGlmICgh
bikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiDCoAo+IC3CoMKg
wqDCoMKgwqDCoHZtID0geGVfdm1fY3JlYXRlKGZkLCBwcmVlbXB0X21vZGUgPwo+IERSTV9YRV9W
TV9DUkVBVEVfRkxBR19MUl9NT0RFIDogMCwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKgdm0gPSB4ZV92
bV9jcmVhdGUoZmQsIHByZWVtcHRfbW9kZSA/Cj4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01P
REUgfAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
RFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxUX01PREUgOiAwLCAwKTsKPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqAvKiBJbnZhbGlkIGZsYWdzICovCj4gwqDCoMKgwqDCoMKgwqDCoHdoaWxlICghaW52
YWxpZF9mbGFnKQo+IEBAIC0xMDUsNiArMTA4LDE1IEBAIF9fdGVzdF9zYW5pdHkoaW50IGZkLCBp
bnQgZ3QsIGludCBjbGFzcywgYm9vbAo+IHByZWVtcHRfbW9kZSkKPiDCoMKgwqDCoMKgwqDCoMKg
bXVsdGlfcXVldWUuYmFzZS5uZXh0X2V4dGVuc2lvbiA9Cj4gdG9fdXNlcl9wb2ludGVyKCZtdWx0
aV9xdWV1ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnRfZXEoX194ZV9leGVjX3F1ZXVl
X2NyZWF0ZShmZCwgdm0sIDEsIDEsIGVjaSwgZXh0LAo+ICZ2YWwpLCAtRUlOVkFMKTsKPiDCoAo+
ICvCoMKgwqDCoMKgwqDCoC8qIEtFRVBfQUNUSVZFIG5vdCBzdXBwb3J0ZWQgaW4gcHJlZW1wdCBt
b2RlIHdpdGhvdXQKPiBmYXVsdF9tb2RlICovCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHByZWVtcHRf
bW9kZSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2bTIgPSB4ZV92bV9jcmVh
dGUoZmQsIHByZWVtcHRfbW9kZSA/Cj4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUgOiAw
LCAwKTsKClNpbmNlIHdlJ3JlIGNoZWNraW5nIHByZWVtcHRfbW9kZSBleHBsaWNpdGx5IGluIHRo
ZSBpZiBjb25kaXRpb24gYWJvdmUsCmRvIHdlIG5lZWQgdG8ga2VlcCB0aGF0IGhlcmU/CgpGdW5j
dGlvbmFsbHkgYWxsIGxvb2tzIGdvb2QgdGhvdWdoLgoKVGhhbmtzLApTdHVhcnQKCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG11bHRpX3F1ZXVlLnZhbHVlIHw9IERSTV9YRV9NVUxU
SV9HUk9VUF9LRUVQX0FDVElWRTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0
X2Fzc2VydF9lcShfX3hlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bTIsIDEsIDEsCj4gZWNpLCBl
eHQsICZ2YWwpLCAtRUlOVkFMKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbXVs
dGlfcXVldWUudmFsdWUgJj0gfkRSTV9YRV9NVUxUSV9HUk9VUF9LRUVQX0FDVElWRTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfdm1fZGVzdHJveShmZCwgdm0yKTsKPiArwqDC
oMKgwqDCoMKgwqB9Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqAvKiBTZXR0aW5nIG90aGVyIHF1ZXVl
IHByb3BlcnRpZXMgYXJlIHZhbGlkIGZvciBRMCAqLwo+IMKgwqDCoMKgwqDCoMKgwqBtdWx0aV9x
dWV1ZS5iYXNlLm5leHRfZXh0ZW5zaW9uID0gdG9fdXNlcl9wb2ludGVyKCZwcmlvcml0eSk7Cj4g
wqDCoMKgwqDCoMKgwqDCoGV4ZWNfcXVldWVzWzBdID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQs
IHZtLCBlY2ksIGV4dCk7Cj4gQEAgLTIwNSw2ICsyMTcsMjEgQEAgX190ZXN0X3Nhbml0eShpbnQg
ZmQsIGludCBndCwgaW50IGNsYXNzLCBib29sCj4gcHJlZW1wdF9tb2RlKQo+IMKgwqDCoMKgwqDC
oMKgwqBpZ3Rfd2FpdGNoaWxkcmVuKCk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgeGVfdm1fZGVz
dHJveShmZCwgdm0pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiBWYWxpZGF0ZSBjbG9zaW5nIEZE
IHdoaWxlIGtlZXBpbmcgZ3JvdXAgYWN0aXZlICovCj4gK8KgwqDCoMKgwqDCoMKgZmQgPSBkcm1f
b3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsKPiArwqDCoMKgwqDCoMKgwqB2bSA9IHhlX3ZtX2NyZWF0
ZShmZCwgcHJlZW1wdF9tb2RlID8KPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSB8Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fWEVf
Vk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9ERSA6IDAsIDApOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBt
dWx0aV9xdWV1ZS52YWx1ZSA9IERSTV9YRV9NVUxUSV9HUk9VUF9DUkVBVEUgfAo+IERSTV9YRV9N
VUxUSV9HUk9VUF9LRUVQX0FDVElWRTsKPiArwqDCoMKgwqDCoMKgwqBtdWx0aV9xdWV1ZS5iYXNl
Lm5leHRfZXh0ZW5zaW9uID0gMDsKPiArwqDCoMKgwqDCoMKgwqBleGVjX3F1ZXVlc1swXSA9IHhl
X2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgZWNpLCBleHQpOwo+ICsKPiArwqDCoMKgwqDCoMKg
wqBtdWx0aV9xdWV1ZS52YWx1ZSA9IGV4ZWNfcXVldWVzWzBdOwo+ICvCoMKgwqDCoMKgwqDCoGZv
ciAoaSA9IDE7IGkgPCBNQVhfTl9FWEVDX1FVRVVFUzsgaSsrKQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBleGVjX3F1ZXVlc1tpXSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2
bSwgZWNpLAo+IGV4dCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGRybV9jbG9zZV9kcml2ZXIoZmQp
Owo+IMKgfQo+IMKgCj4gwqAvKioKCg==
