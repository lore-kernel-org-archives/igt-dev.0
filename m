Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D074C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 16:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A6310E096;
	Fri, 17 Jan 2025 16:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKBG7mS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32A10E096
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737131538; x=1768667538;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N1Frge5oYNpZNIIHCjK4PdIn85WDmfBFMxpPnoM/cv0=;
 b=JKBG7mS9h+xaCBXB9IplXOorJbRt3k49JxpB+cMHjmSpQZFO5cJ3e1Vc
 G9Ykr6qpw2wo6h4RnAbldZAKrTiiIIbrb1zIxUk8mkIl0Tcf2o6I8Ghk3
 xTxXgJq3o6RPxQaOzccmRPcXVfz4HRg5k0uLUXQZD1uSD8Rmn9qdmz//P
 UmYSakiw86Pxqy/7pmy9hAfRmTO1vIqKP1y1EBZs9y65pnxb97HvQK1vc
 LRtxjW2DtAQvB4rsZ2sQ4S7eEyRGHOYRxtgHWTCgig2bwDFZIjH3bQBEi
 d1RtfapfBpGrUkkSw/AWrA+rwWy/lVhgxmrRlfANbycDGDt6qQDWbovzZ g==;
X-CSE-ConnectionGUID: fCmOfBxBSLqmMyJ6JdWmQQ==
X-CSE-MsgGUID: MvSNoVkEQMOdRoADGyT8/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48156494"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="48156494"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 08:32:12 -0800
X-CSE-ConnectionGUID: KvEkm8/fRdSYJLUHQ6auPQ==
X-CSE-MsgGUID: jJev5dyORceEjtndUAiZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110957695"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 08:32:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 08:32:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 08:32:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 08:32:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F97fhTg3LJSBRXpIqaEub3/l0ojIxEX5sB5VIgofjKvgveJIkwegRjYMWfSlLlgmtyHbw/ByU513WZb7HWGDWKtIfnthy0Ylcvqm4gM8OqFnovdzAl8CJzcEGNEtVgBigQKmtGEL5NeXpJecHImi+D1xDvizj5E4evVeKThn7hlobBxt2VJjmjErt75z4rzr5vlBeLT4kCaaOP1BzYcV8OMHWA9Zylm7U0LEnYssf8Tw0ZNjcunDnU862sK3url2wsgUYF1GqMWAx7yHLKraBIxLo0uwby9DWseuwajhn3npIpBqR4fOgpdyTLo5IrqQ3A5fpC0EWWNQkd62sqqUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1Frge5oYNpZNIIHCjK4PdIn85WDmfBFMxpPnoM/cv0=;
 b=siUwTtl60NqF1YCyen+f70wmUOabzNAZ9N6xxAlccg88eI+oYSaRcL3xM3i18VGmenugQtxwKDjIKIR2YrmDCcAXSfAXd6vTflLNJ0+6pk++IKKPUlYyQ/cQDCOKdHOR8QmK10QhBH4ZNMQGToZNrSzhoKbIRUn2rX68wvVWKvhtNACqidUqsmBh1qggyp8UoKNhQpjTXDAuKu/xbFWH9KNPHBFHUAzCMDUpODNnoy/ozWvSg4eni/rKqxrzPEuvZBvDv4wKFSLq0yjBTh/OWDNfHAFpUPeVSWFhzlw86poSj5z3fm4S5ujMLJdqjtwoCS5r2GCY7HjC7RVYvZ6WrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.14; Fri, 17 Jan 2025 16:31:21 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 16:31:21 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 =?utf-8?B?SnVoYS1QZWtrYSBIZWlra2lsw6Q=?= <juhapekka.heikkila@gmail.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, "Atwood, Matthew S"
 <matthew.s.atwood@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>, 
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Jahagirdar, Akshata"
 <akshata.jahagirdar@intel.com>, "Pottumuttu, Sai Teja"
 <sai.teja.pottumuttu@intel.com>
Subject: RE: [PATCH i-g-t v5 0/7] Initial PTL support
Thread-Topic: [PATCH i-g-t v5 0/7] Initial PTL support
Thread-Index: AQHbUZUIPq15tEcL/Ua4pIMDzdhd/bMbLp6AgAAom2A=
Date: Fri, 17 Jan 2025 16:31:21 +0000
Message-ID: <DM8PR11MB56554FF18BF850D4235B723AE01B2@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <20250117140541.ugu4xgqnbdbgftkn@kamilkon-desk.igk.intel.com>
In-Reply-To: <20250117140541.ugu4xgqnbdbgftkn@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|SA1PR11MB8254:EE_
x-ms-office365-filtering-correlation-id: dbb0ae54-fa57-47d5-ee4a-08dd37146074
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NlpMYWFNbDBwdDN3dWtFTHBpS0U0RjdVSmlOdlh0Nm5ONmd0QXJQbC81MVBi?=
 =?utf-8?B?OWtoRk8xWjVNTy9rVXVaMVFjSnZlYnYybHNpbURpSTdLUkl1TGxJYWl0YURu?=
 =?utf-8?B?RGFoUFdhdFZ2V2JDcVFSV1NLV2FtQi83MEM0d0s1SkdzNnNHUFJhdDlOYitH?=
 =?utf-8?B?SnNWdVRRdGJUQndOZ1pJMnlJMjhZUCtYd3JCWW9IdytiTGliRFpxNVpCL0xi?=
 =?utf-8?B?RFhLcTFmWlpKNFM4M0k5VGZuTjdLY3IxcTNUbTl6QmhtWjQ1NDdwaFZlYUFp?=
 =?utf-8?B?YWp3dmgzdzA0c0dVbFN5aG45ejc5QnJXRjF5N3ZzZTVVRzB3eGhvdTNDMXEw?=
 =?utf-8?B?c28zcWcrSnR2WmN6bFhqNGF5Y1pjWXVtd0FLd2JkcnE1dDg4SkR0cW41YWlR?=
 =?utf-8?B?dGJPNFhyckFtRFB0QmN6Z3V1aUNDNDFDMytTMGJVb1dzWTR1SWtESTErS2My?=
 =?utf-8?B?MWdxM0QyNjBPTjRJYkFERjV6NmF1VnBrM1RZTUdjaUc3UnRZYm1aSGM5dnVQ?=
 =?utf-8?B?dEVYaG5GVms0aEJzOTZPelVrUFZLMmMzVzBGN3g5U2d6NngwaENFZzI0VWRQ?=
 =?utf-8?B?a0hCNUIvZzRmcFhRNCs3YjRXVk5OMjFJUGoydXUwUERxTmpkcWVZb0ZmN2VZ?=
 =?utf-8?B?bkpPcS9HNm4wS1JtMlJvOFowUlRxUDZ3RGRHblBHeFBBcVpvTlFKM2JLYm00?=
 =?utf-8?B?MWkybVU1TExlZWpWTURPbVZ4WjhMMFBWUUVMSmxEN21OeEkvOXVFM2J6emlF?=
 =?utf-8?B?Q25NZEs4Nk40QTJ3N0U4RzhXTndtamluU082WjBmelRRTDBEaEVOOFZxUWFl?=
 =?utf-8?B?dm1JVlo2aHppZnZDdGF2Q29pdDRoVnVDc1c5aC9nQllrNnF0TGJnZ2lDNURB?=
 =?utf-8?B?OEZtWlR6ZUwvNUhLQWl6S0VpOEt2T3Jza3ZGNTZNbTZ0UlUzTFhqREFCV1d2?=
 =?utf-8?B?VUFqU0tmOVN2dUpSTGtiKzB4a0tSL1FzZHZaUWRUdWVoZDJXdVIvVjJldjlR?=
 =?utf-8?B?bDZKR0NPMmE3TU9NUTgrOHFDK0ZFVmRScWRIMG5XNkZJTy9Od0R5QVl6YmN0?=
 =?utf-8?B?ZnZFMncwcERsa3o5N0xkY1YxNVNBU3lNeUUxT0tqbEpKZHJJbml5VFBXMGdj?=
 =?utf-8?B?U2V2ZmtsT0Npd3owT0FLYlZOTlBuWHRjY3dXcHpXMGpGSXhmT2NXYWVnSXVZ?=
 =?utf-8?B?S2MzdTYwMUY5Y21NTGUvMTVoY1BrNHhMMFlkblg2SW1XaTdrVkMvTCtjWUFm?=
 =?utf-8?B?VmZaRDViLy95VG5NbjBMRHAybXJ0MDVrU1dvMGpTZUk0cmJZc1VwMlJVcWEr?=
 =?utf-8?B?Vng2V2h2c1RuM2RRME1IV3JiZm94d3dDWFIyMWFhbWJCOUlOT0h1emI0NnFo?=
 =?utf-8?B?eUdXRW1ZY0I5ZjRlSjROeWtmYXJ6U2pkZXI0T3ZPYldzRWlLSVczTjM4Ung0?=
 =?utf-8?B?WHI5a3R0Z250S0syUjNSc3g4ZG5PKzloVTBLcmJrK2d2UlhLS1ZhL3VqSjI0?=
 =?utf-8?B?MmJLNnRML2tGQ1dXSEJ4ZElTTWRNcjhlODBnNFBycFM2MzZEVjR6U0EyTHQy?=
 =?utf-8?B?Z013SS9qSnYyL1pYMWlGVGMwQ1VoekkyRDFnQVBjS1hhQkM5TDFNYzZhQnFy?=
 =?utf-8?B?UGpBdGNYb3cvZ3dYam1PRURuRTdNb2k4SFFBVlJZMldjYk96cFhFMTYrbjZ1?=
 =?utf-8?B?Ukpta2Q2NC83N2J5eWNQdmJPYlF3Sk9ucFdwWkpnRFgvUUNieDNsVG9pa0tZ?=
 =?utf-8?B?WDFwOFhuRHNzTVkxY0pydktPMjB1akw4SjFRWk5QRDJ3cG52cGtPY1Z1Sm4v?=
 =?utf-8?B?SHgrVHc4TFJsajFTNnRQK2Y2NGllYTBsSmYvMUdlZzVYc0J2aVg4NFd3eUJq?=
 =?utf-8?B?V29LR1k4WGtuNlVsdXByOGlJVEVqYXROYVJDdjBVdzA5TFBHNjhwTmkxZEJs?=
 =?utf-8?Q?swf62ESf30OJ6JKlK2QRkOcc3j6GfB/O?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YStreUJHNENEcG1Ud0hwRDhsMWNwMklkZWdNc1VvL0UwMUdpQXFhN1BIV1ZN?=
 =?utf-8?B?QXp4TjI5ZVZ1ZUtmbi81RU9Kb3BXZGVEUy9kbkhBSTFaNnArR0l2ZjJxanZw?=
 =?utf-8?B?MFZHZVlmTHdrcGN6SDl6VDg4dVRySHNEVlRvZFRQTUxEbFI4YmF1ZXNpbzZI?=
 =?utf-8?B?czBSdWZtWDZPVEJRM253NS9hWVp2K1FOTU9RSXBrRXZxd1ArWVlyRGxIOTJh?=
 =?utf-8?B?TXl0UzVETDhyNVVrV3M4YTI4cStPb3BuN1FlL3owcVdNKzIvc242KytjMmJQ?=
 =?utf-8?B?SndEQ3piNW9DdkgzUlRJM3lHMVcya2I5ZVFpRlp1YWFlcFpzazFPeTIvY0I0?=
 =?utf-8?B?N1BBRVRiSHd4VHgrNW5QKzNyUzU0R0ZrbFRUdWk1cEpramZiTUdLN0VYUEVj?=
 =?utf-8?B?czl1aE1aRERmVTRlMU9mZEJsWWg4OXBRbzBpYnJBSU13WTlNc3ArZGduektG?=
 =?utf-8?B?NEhTNktlNmtRN3l6YkZLb2ZSMmdCUm42VXN3L29ReEZ0YmpLSmdiaDJVOFZo?=
 =?utf-8?B?amZZODBSUEptVmwvdUFMMnMrdDVVbiszRTlnVFN4c0VrYnhORER5TTJyeG9q?=
 =?utf-8?B?R0M1OXlmNFpENjZUdDZJbGZTQ09mNEppQ3diczZSeUhxM1d0cnpSWXFXNElV?=
 =?utf-8?B?Rk1KVUtLa0d6ZC92aDhEMjhERjM0UmJjREh0N0hXRjV3bkpzZGpLS1BHY29Z?=
 =?utf-8?B?M3BVbTlQYS9YaXdLUms1REU4UUNZbUNjSWJMZnBBS09nWW42SGtoMlJwSXdI?=
 =?utf-8?B?bi9qS1drcDhtN0dGUE93UndHQ2hscnBtUDF3RkZYcTlsc3ZNRnBnSkdQMUlX?=
 =?utf-8?B?K2ttUGdTRytMQUhXR3BGU3hzWkd0MFNEMW81dzJmc2JhSjQwSGkvUGVQZHpx?=
 =?utf-8?B?N01BV3RRTUh0QXhWUjRuemJySDIxcjVhSnBFN2I4bFh1eXdGME1WZDFHc1pn?=
 =?utf-8?B?K0xTQ2FUTlZROHFCU0xOTzVRL0E2R1JjcFRLdGVMZUVGK3ZJWlRGS0RsL0gz?=
 =?utf-8?B?ODJKdHNXUnN1WHJVV0tDcHVKRjk5Y1p0UkFmRUxIRXR3MkxDN3dmZ1FVQnVR?=
 =?utf-8?B?VEI5ZzFjd3FBOU1DUnhqcGZZc0VKdHZRMkZjbWVFZ1VZVC9ORE9EcDJLdmd2?=
 =?utf-8?B?SmVVU00wMU5qaVIvNU9tZDE5Nm4xOW1HM3ptUjk1RkxXQTJ3WGZDNFZZYlo4?=
 =?utf-8?B?c1hoZkJJTktwMUZBcWR5VmNsemlYUmJYVFRISzI1d2U2RjRPMENHQVc4anI3?=
 =?utf-8?B?VW1oYlNjMGprMnB4VnduWml3elZmajVSTGVqVGVGaFczTDVJQzB2Y1dqQ3Nt?=
 =?utf-8?B?WUtUd1NqaXVXTDd5MXdTVUlOaGdZUHd6Y1o1Sy9Lc3FzanRveXFydi9Ic0s4?=
 =?utf-8?B?eDZ4R3NBSFMyTjJIcWVocUNPc2IrejBRRmlaeWtweVdnZTZZWk9nckVwd1dU?=
 =?utf-8?B?b2lqdzZJTmNGeXBtaERpbnY4V3FSYWprSzJNMmJhY3RSZDl1cE1qN2NuYWVS?=
 =?utf-8?B?cTlXQXBidHNzWGZRVnllRE5kVWdSNEhRaytCVUNnNi8wUU9Oem1UTEhXU0ov?=
 =?utf-8?B?SXJxUW1mV2h5MmZnVlBMd2p6VGgrUERRaWlKWjNUTitoVnZLOWcyTktBZ3c5?=
 =?utf-8?B?T3NvSFNKc0h4ZG5YTzR2WUFUUVkvOEkwYkJTZm9kVHpqUWpqRHRHYWZ2WXRl?=
 =?utf-8?B?aHlyN1pnbE11YmpBMmVRblZtUktWZnNlKytIQVNBck1xQ1BGcmM0UWMwaHkv?=
 =?utf-8?B?dWJ3cE9qNEcrTVdzTnMwNW5JSVJvZW5Hc0V0TkZ0THVCOEVGM2Y5MmNmNzdt?=
 =?utf-8?B?aGJnKzZFU1hWekw5bWRBTW0xQ1NUa0NFQ1IxUy9YNHQ2SlBtWEJRUnhVWHBN?=
 =?utf-8?B?a09tMmFwNGJ5aWlDR3Jyb3BzMnplWW15MjdrNDMrNmh6OHlQd0NTWDkzMFFN?=
 =?utf-8?B?Z2Q4NW4vSG04L2EzUFNYSGhjTHl5ZFUzNjBoUXpxdXFVT1Erd3ZMNjhZbGl2?=
 =?utf-8?B?bmVtRG5OYjNxN3ltS1BtUFd5Z2Nvbjl3RGVSMjcwNkhacHRPUEFHZkdqekd0?=
 =?utf-8?B?SmdwNXBxekEvM1RhRHA2a0tWUXdTMW5sdFViVERzcHNublBCVWp2OEhjTHZF?=
 =?utf-8?Q?KXiqO1nEVbJHvad6nPgx+bARv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb0ae54-fa57-47d5-ee4a-08dd37146074
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 16:31:21.3267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yv6A00o3Ae3C4TuZMBL3+vLnjG+YIFt/aFtE1u04zx3VlAeedv0A5Oxu9Zj21KbViFwP3UVdhzkF2S4RvgB+MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
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

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEthbWlsIEtvbmll
Y3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCAx
NyBKYW51YXJ5IDIwMjUgMTYuMDYNCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBUYXlsb3IsIENsaW50b24gQSA8Y2xpbnRvbi5hLnRheWxvckBpbnRlbC5jb20+OyBK
dWhhLVBla2thIEhlaWtraWzDpA0KPiA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT47IEF1
bGQsIE1hdHRoZXcNCj4gPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+OyBBdHdvb2QsIE1hdHRoZXcg
Uw0KPiA8bWF0dGhldy5zLmF0d29vZEBpbnRlbC5jb20+OyBSb3BlciwgTWF0dGhldyBEDQo+IDxt
YXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgU2FhcmluZW4sIEphbmkgPGphbmkuc2FhcmluZW5A
aW50ZWwuY29tPjsNCj4gQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNv
bT47IEphaGFnaXJkYXIsIEFrc2hhdGENCj4gPGFrc2hhdGEuamFoYWdpcmRhckBpbnRlbC5jb20+
OyBQb3R0dW11dHR1LCBTYWkgVGVqYQ0KPiA8c2FpLnRlamEucG90dHVtdXR0dUBpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQgdjUgMC83XSBJbml0aWFsIFBUTCBzdXBwb3J0
DQo+IA0KPiBIaSBDbGludCwNCj4gT24gMjAyNC0xMi0xOCBhdCAxMzozNjo0NyAtMDgwMCwgQ2xp
bnQgVGF5bG9yIHdyb3RlOg0KPiA+IEluaXRpYWwgc2V0IG9mIHBhdGNoZXMgdG8gZW5hYmxlIHRl
c3RpbmcgUGFudGhlcmxha2UuDQo+IA0KPiBBcHBsaWVkLCB0aGFua3MhDQoNCkdyZWF0LiANCg0K
PiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4NCj4gPiBKdWhhLXBla2thIEhlaWtraWxh
ICg0KToNCj4gPiAgIHRlc3RzL2ttc19hZGRmYl9iYXNpYzogZml4IHgtdGlsZWQgdGVzdHMgZm9y
IGNhc2Ugd2hlbiB0aGVyZSBpcyBubw0KPiA+ICAgICB4LXRpbGUNCj4gPiAgIHRlc3RzL2ludGVs
L2ttc19kcmF3X2NyYzogZml4IHgtdGlsZWQgdGVzdHMgZm9yIGNhc2Ugd2hlbiB0aGVyZSBpcyBu
bw0KPiA+ICAgICB4LXRpbGUNCj4gPiAgIHRlc3RzL2ttc19jdXJzb3JfbGVnYWN5OiBmbGlwX3Zz
X2N1cnNvcl9idXN5X2NyYyB3YXMgcmVxdWlyaW5nIGFueQ0KPiA+ICAgICBkcml2ZXIgYnV0IHVz
ZWQgaW50ZWwgeC10aWxlDQo+ID4gICB0ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tp
bmc6IGZpeCB4LXRpbGVkIHRlc3RzIGZvciBjYXNlIHdoZW4NCj4gPiAgICAgdGhlcmUgaXMgbm8g
eC10aWxlDQo+ID4NCj4gPiBNYXR0IEF0d29vZCAoMSk6DQo+ID4gICBsaWIvaW50ZWxfY2hpcHNl
dDogYWRkIHBhbnRoZXJsYWtlIGRlZmluaXRpb24gYW5kIHN1cHBvcnQNCj4gPg0KPiA+IE1hdHRo
ZXcgQXVsZCAoMik6DQo+ID4gICBsaWIvaW50ZWxfcGF0OiBleHRlbmQgZm9yIHhlMw0KPiA+ICAg
dGVzdHMvaW50ZWwveGVfcGF0OiBleHRlbmQgZm9yIHhlMw0KPiA+DQo+ID4gIGxpYi9pbnRlbF9j
aGlwc2V0LmggICAgICAgICAgICAgICAgICAgIHwgIDIgKysNCj4gPiAgbGliL2ludGVsX2Rldmlj
ZV9pbmZvLmMgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysrKysrDQo+ID4gIGxpYi9pbnRl
bF9wYXQuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKystDQo+ID4gIHRlc3RzL2ludGVs
L2ttc19kcmF3X2NyYy5jICAgICAgICAgICAgIHwgIDYgKysrKy0tDQo+ID4gIHRlc3RzL2ludGVs
L2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgMjAgKysrKysrKysrKysrKysrKy0tLS0NCj4g
PiAgdGVzdHMvaW50ZWwveGVfcGF0LmMgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+ID4g
IHRlc3RzL2ttc19hZGRmYl9iYXNpYy5jICAgICAgICAgICAgICAgIHwgMjIgKysrKysrKysrKysr
LS0tLS0tLS0tLQ0KPiA+ICB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeS5jICAgICAgICAgICAgICB8
ICAyICstDQo+ID4gIDggZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=
