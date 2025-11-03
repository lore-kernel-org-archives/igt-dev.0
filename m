Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43750CCF9FE
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 12:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E666110E3C0;
	Mon,  3 Nov 2025 12:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ilb7W29O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A61B10E3C7
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 12:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762171531; x=1793707531;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LyPV8Y7GVQiVEly+mwO+Wgxze1urEqHwTchde5WprHU=;
 b=Ilb7W29O/WDhUj7ZZ6rH50ePGayyCa79yQtqYkF1gI8ufaD+W/WD+S4D
 eNMowV3ycI0DYKc7HdixauknS++5WZ9E/ZGHh5TpMp5hngkwoZ2AaYrgQ
 JtO0e+1UR9w9Rin5BCkx8V1Qz3MOgDu5w3iGLZ2CPG4OvYCrD9atiKgzk
 jbNvxRsetrE3y6PJ0JFnKi3amRjrvaOVUUN4bv0bMmxAAKeT1xYBOoztF
 PNDtwwKFTxyQVJE0q+GmJk8hg9mzB/kiZPpZxtAAxVajJPTwVCgi+hqoa
 NJ7LkWky7D9QWQNy5umrA59WsK9NJ63arGpnLeKPnBQKQfhWees6vkD+w g==;
X-CSE-ConnectionGUID: KffccFFJQL+2Fi459cij3w==
X-CSE-MsgGUID: gUzBEg3OSdObGEmnfUyItw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75353953"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="75353953"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 04:05:31 -0800
X-CSE-ConnectionGUID: sLKjDhBRQzC1VxhHLJlqog==
X-CSE-MsgGUID: YEgTBEkeSCKT/cIpc3B3rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="192011632"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 04:05:32 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 04:05:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 04:05:30 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 04:05:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AofJ8QJDbqpic8hxIgsE9ab0r7ETsJ4Lh+koce04ARzmVGWaQCZMxf4j2KeMy7VdRN0XdCLweLf9wIjnz8IALibZxSyh+Fv7KfjI91Z1zsPKa0i+5piqrSSWmwisziHKGwPr3h6Q1oU1CRIgDIzkjyr2oWdEJc3fn26bo2isz9KasqC5lgIfX9/6MdgnFTstce/NN3X38kbROYq7k/CufIR0jo9rUnKr6qp7/Pz91Yk03RQiFFZOg+Hi+lRk2wusGkMKlNKUaYBrx4VYshjvdsAsSInCBpyy2xxeYd5/A5FrTL2DX7aNEdNdzS7pd4eXcP/CQX7Is6RQW75dU3i+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Wp/xl+jfo/B1jN0a4shraCTkJom6y6Ap3e2KZdOFUw=;
 b=hTYzciwB6eB9e1Sgfcg+Kp9wufWCXh9Vg0WCgaVGSRB/BiQXFK1qdwByxErF96xbJxd2E3PtvvMcCxQ4om8HsPUFMm91qvBGnc0Z/EaoncBzk1+wTPCni3Yiafhty1H7LUdHfwLvKjjF+TRwfqCSRASUByuVGFs4RnCaXX6GOg7X05Onmd6Pgbi1QT+b2JMfqbB8AhmKA8uHRomRfTOkMXmfp3OmQsUjeM4/pWrpoQOANpkLbdPN7b/Dj0SfaWUiwbThCwa/Y3eqRv0HndU+ly6M/Y6pVjA2209iu2wwKRzx3MDGrfSukSsu5aXJzFp6gHXc1ZMgxj+rTwMfIlvc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW4PR11MB7007.namprd11.prod.outlook.com (2603:10b6:303:22c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 12:05:28 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 12:05:28 +0000
Date: Mon, 3 Nov 2025 12:05:14 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Simon Fairweather
 <simon.n.fairweather@gmail.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3] tools/intel_gpu_top: Add iteration option -n
Message-ID: <fzr6737mjmdkhfmkxh2uawj47gtzcuig3t4sqqtvtuqzme5pbx@evlm4bcue57t>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251027153247.109572-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251027153247.109572-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DU6P191CA0020.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::27) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW4PR11MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb388f5-2cbe-43a4-ec1f-08de1ad14729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlJ3SzMyaGtMVlgyWjA3UWM2ZXhKdmxUR0d2TlJjVi9vVTQ4U05OaERnekNa?=
 =?utf-8?B?VjYyOUNlTHFsZ3lRbVhEK0x0eW5oNERyZURPNWZuU3I2azBnZlJzcHA3MHU4?=
 =?utf-8?B?UlpCUGZJUnlXUW1MRnJXa2wyd3U3Q3B2WWVHQVlmUnNNWWx0WVJYS1gvTmV3?=
 =?utf-8?B?enc3RUpXVHQ3dmh5eENsM2RJNkN2ckJURFQ1VWlBSkF4R0lOczhmVEdlSzhn?=
 =?utf-8?B?RERmRCtYVmNBc0h6VHJGRUhiY1pKSm9VVVNUeXdIVmJOK0RjR0JJRmw3TnlJ?=
 =?utf-8?B?aTRLVG9vemE3L1l1UFJnUGJLOVU0REhmRnBBZzdndFdVN0E5eno4endlTU1C?=
 =?utf-8?B?UVJDRFp3UjBUNUJLMjgzRnk5UzE5NjBSUk5NWFVYWGFudnhrdHdzRExxUkRy?=
 =?utf-8?B?dUN1ekMrUnRhOWFCVFkranJ6L1JMc09IaG1kSmcrMXpmb0d2WExlWUZIMEdT?=
 =?utf-8?B?ZXVXbVFkdkZ4b0p2VEVaZ0lPdlJyaG1BVzJ4UWhmalRkb3JldUVkOGZwaGx4?=
 =?utf-8?B?c1RXNlpBd0pqS2dEeCtOL3dqclpwS2FSaU9UcmJmZHVMdXFMMjRCcENBSVJj?=
 =?utf-8?B?Q0VUTU4vcWcyZzJxQVl4blQ3T1hxZkhIay9SVm1IVzZ6RFRJdi9RblVIU204?=
 =?utf-8?B?aE0xREJmaCtpQlpVWHg5cmJBNVhJQnNqemgyS1lQSklpMG83cFhFd0JnV01h?=
 =?utf-8?B?eU11Mk1uYzk4Nm43TFMwUGYzVER4c3M0V3pvNi9WQkJVYXR6WDJKQmZZTHUr?=
 =?utf-8?B?TXdmUC9sUVZGbHZBYkhEUWtrREd3RUZjMmJzT2tZMTExYjRLNlB2VEhZMzhM?=
 =?utf-8?B?YmVvMlk1eEtha1FPaXhHVDQvS3VGM1pBRkwwQ1A5b1p6QkcxTmNLV2hYTmpi?=
 =?utf-8?B?dHRNVkcxN1JOMFVNMGl6R3cxT2xmWlN6NUNxK1lqSnZLWnpmNjN0Ynp6U2ky?=
 =?utf-8?B?UmNNdnFuWHRwVDR3WE11YkhUeFJoYXBCM0dPYm9VdFIyTi9ockl0UmwvOWRG?=
 =?utf-8?B?UEdLNWxDUlMycTFERit1bkVrMmVlSnhJQ0pGTnFObkJpWnVtMzFFN0JuQjdW?=
 =?utf-8?B?ZitxQ2VtU3ltWC91Umk2cis2TUJiSUxGYXRKdXZqc1prUkp5cmwyMFBBZ3dX?=
 =?utf-8?B?dW9rWk9STDVQSnlOdmZWcEZjSk1rSlhmaGczZGx3b1RsRktMZ3RCSHRCeUk1?=
 =?utf-8?B?MDV5ckFScmh2Z3U4eDFwSkx2WFZ2Z00ycWlVdUhJOGdGdHRIbmU3NlU0eWNs?=
 =?utf-8?B?RXBDRnpzN3QwaTZQZzI3aGp0TWVyQWtWK1RxdzhtMTZKMTR1UEt3djgwMVdO?=
 =?utf-8?B?N1R3WitVdEhwZWg0dHVOZU55WVNvSXlNUktxUjYwdkVaRXlabHRGb2NVVWFF?=
 =?utf-8?B?aXZBQzlndmF1VU1zdU0zcHpYVGsvcVVUQ09OZGNyaEdUZ2l6NU4wR1JaWU9Z?=
 =?utf-8?B?M0pwSHl6MFlLS1ZXcFRCMXloblVCeDFVcWpJdmhHcVAvVzV6Q3YzcXF3d2Ey?=
 =?utf-8?B?TkIrbWZiR0VqQi9ROTNROFJ5Z2kzbDZiclYrU2ljcTdQRmV0ek5YSVhZLzZN?=
 =?utf-8?B?SVhDU3JRZ0tkbWdjcHpZY012TGdSSXRDcVRiY0hEMkErV3IvTmEvRDBweUNL?=
 =?utf-8?B?amowbllzMFdzUjU4cUJHZWI0NGM1SitzUEt3aXB2OERKeXpQdUNZTk5EeklV?=
 =?utf-8?B?bVhYcjVta1FrVHJMeGl0R2lzVXFOQ2w3bjhKVUVxa0hKenFFV05HNDFEbVho?=
 =?utf-8?B?YUpTM0NyQ1ZDQXFNTS9RblVoNnlHYUR5TmZqY2xFS082QnFKYWlTUkNuaHlt?=
 =?utf-8?B?Y0hCazJYdjZoVGNMWGMvbmpjOURtMHFLYkNZWjVsVGJLS3N0MlVZeDRwZ0xv?=
 =?utf-8?B?NWZhZ0JCSmQ5QVZBRVNzMnFkS01pMEpEa0hvVzdFWC91VE04WEZrdFJNZ05i?=
 =?utf-8?Q?HRKkamIOHCgf5ZdUJBpGFhF8vwYfvP2g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXBvTmJvT2xmeUdoZUZZOVdzc1FyeFV2RzkxSUl5ZFM1RWJpeWJ0K3lIVTh6?=
 =?utf-8?B?aU9BYUxaencxTXFiRmQ3VnFMRStDMGtxeGtiNzJINGxkbDZDSVpMb3ZtOVZt?=
 =?utf-8?B?N3hwTnhpMnlSKytaV3REU3F1eHJaSXRTODl1eVhGNzUzQ0dRQmhnRlIrdXla?=
 =?utf-8?B?b3JlY3B5NThtOTdjZUIvbmtHdTRJRldOSnBIQ3hWMTJaYU5CZ3g0S3BkdkZI?=
 =?utf-8?B?T2tiTEpHZzJYbVhTeHdRVkdkWFZPbWp0WUU3bmltQUpVcXVQU2NaN2g1SElM?=
 =?utf-8?B?WEt4UEw5SFZ4ei9oMHN5bDlSWVJOcDZDYXg3bDI5KzNIZHVWSmdhUkZoRmtm?=
 =?utf-8?B?dSs2aG50MGFFaTRvYjZBSTRqTjFOSVFvVU4weU9sOFNtVmVSYmpDWkdTWE5a?=
 =?utf-8?B?b3UwdVR0bFNPNXUvbWJjTkJJUXNSZlBjWmd0Y1BnSkRDRlZud2QxTytxVms3?=
 =?utf-8?B?Tmw1VjNLOHNWbTlQMm1wTlhPQ0UrL04rYlltVmc5V1p0UnNjM0JXVkR5SVVI?=
 =?utf-8?B?eXVWNUdzS1h1VjhwVlY4TXh0Z0dnZHAwMENlQ0tISzI0aHlGR3RITTNzK0N5?=
 =?utf-8?B?S0U3bC9CREVHcDVqZXFRSGpBN0pCeDFsMGMzQlFMSDVldlFkVmZwWDIra3pV?=
 =?utf-8?B?RFR4N0IvWGFWRjM4Sm0zSDZuNUxtMUlIUFE4b0ltQ29YRHpieCtFd2R6QUVa?=
 =?utf-8?B?V3FuMUtxOWp6MVJZdDhLOThMTnpYSmt0MlpmY3Y4dVVSb2trVE9zUFNaSzRa?=
 =?utf-8?B?MG14dm9CMEdZUWprZzJ1N1QxT2xJNENFUUJWOGo3QVZHL1dWazR1ZkczUmpP?=
 =?utf-8?B?b3F0dEF2UkhBNnNoVTFQaTBrbTczNlVYN29FVVRPUE1HYnlUVkpkVXdhbXNq?=
 =?utf-8?B?VDlBT2svbnR4Tm9QdlMzNEhhcGg0djNRaTBwaStSZDZXV2pXMkNSOE1Wa0pE?=
 =?utf-8?B?eTZYa2N5WG8raFdRTW1YUGduYnRiQy9JOWgvRjgxTW5LdFRicDc4NVhGa1VS?=
 =?utf-8?B?S0VEbnVqbFRnQ2c1M2k4SHJyVTdQdDVSQTlPckptWXM4V0NnZ211dkVGS1Fv?=
 =?utf-8?B?UnRZTEFRWlhaelIzSEdmaVdlSlVDS1hhc3EvWk1PcWFnRHNSZWw1MTJpb05U?=
 =?utf-8?B?UWRGcXRLN3ArQWVaTnNtVEZ3cGtyS1FwS0RrUzU0V1BCZE1COW1LT29tbWNB?=
 =?utf-8?B?SERLY1NrVzJZcm4rWEVhWW44VFkvSmN4akNpaVlYZ1Z5ZE56K29WSmM1cjJx?=
 =?utf-8?B?ZmJVa3lMcGhIWVhiWGZCTXBEdFJuVk9XYjI4eFIvd2RETGNpcll2WFFla0RT?=
 =?utf-8?B?aUJsUURiSVVGajBJdzRWSy9KeXo2VU1WbWhLRmFVNUZGellDWUxEaTZaUEll?=
 =?utf-8?B?Nms3eDZyWU1FR2xMTUxSRzJ5ZGd6OFV2TzNpaSthOGg1R1M2ZEV2VGpSNnVH?=
 =?utf-8?B?L1BQOWQ1Z09kVnV2dFJEZ0ljRllZUTdkUFAxMnIySzM3YWtRaTdJMW9HTnVI?=
 =?utf-8?B?anBvaUttY1QvRnBYbisvOWZNTm8rZklNd1lCM2w2N3NrZFN0SnVKTkw5d3p2?=
 =?utf-8?B?ZlRSMXFqUXVKU05DOUxhL1RsQ011dmJGT3h4OTgwR3lnYi9OTUg3bGw1Wnk1?=
 =?utf-8?B?b3RieW5jYTNYbVlnbExlUDRrWEN4cTNhNGhZdU1VbTNPVG1IMkpWZDZtOHhy?=
 =?utf-8?B?ck82K2pIem1uRXFHOWIvV28zYWc1bXR2L2VjNUhtYTZXU3FYQk96V0Z2VHRl?=
 =?utf-8?B?dndEazdJRm5vSHFTVEw4RnpZNTh6eGJMZytzZjZWd0NLVHQxSGtyVHUxeWhM?=
 =?utf-8?B?S3Y2bDlGbVRXeXZ4Myt6dWFCVVIrL1A2Ykd4c0ZZclJQZ0tTWWVSL01xMkJC?=
 =?utf-8?B?WllmV1dCdWVkZ09PUW53d2N2TWhDQ0VuQVFaK3A2dlMxb21lMU9udDVTZHpl?=
 =?utf-8?B?a2EvUHNTQWJTUlFTcHVMVFc2RExqN24yTHJVWFFIQVZJY2pSbHZPRy9XZ0tJ?=
 =?utf-8?B?TXB1MElNS3dWbUpmc01aTFJvbTJqRjAyUFV4c1Vyd1ZGMy9JL2RhN3psRkp0?=
 =?utf-8?B?SzhmYmxUU0ZKUWxJemFZa2lodjNvbXBwdURhTnlVcVBhSjQ0clg0RklzTHE2?=
 =?utf-8?B?ZXJMNW02OFJxeVhpamd1S3pjUUFjWUlUSThUMk1scmxybUhHVWdSQUt0bnIw?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb388f5-2cbe-43a4-ec1f-08de1ad14729
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 12:05:27.9130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeH6XGPs0T2jsVgF9L4FPaQWl/Wuox92k2oTqlKiiRQfNO50xboPL+lXZfdKewhSofZ3/cCsgp2f0VAS2nsk3Gle0u7sdbeszw5IO/iDYCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7007
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

> From: Simon Fairweather <simon.n.fairweather@gmail.com>
> 
> When using option -J or -c default is looping forever until user
> break process. Lets introduce new option -n <number> and break
> printing after reaching given number of iterations.
> 
> v2: corrected whitespaces, extended description (Kamil)
> v3: reduced number of vars and changed printed help (Krzysztof)
>   added description to man page (Tvrtko)
> 
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---

[...]

>  		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
>  		"\t[-p]            Default to showing physical engines instead of classes.\n"
>  		"\t[-m]            Default to showing all memory regions.\n"
> +		"\t[-n <number>]   Specify application running time as <number - 1> * <refresh period>\n"
Passing 0 or negative causes the app to spin indefinitely.
Furthermore, I think <number - 1> overcomplicates this endeavor.
We should consider a few scenarios and sanitize the inputs:

-n 0 - we break out immediately after a single print,
-n 1 (or any positive number) - the app works for
	<refresh period> amount of time,
-n -1 (or any negative number):
 a) disallow that by returning an error and exiting the app,
 OR
 b) cast that to the closest value that makes sense (maybe 0?)

>  		"\n",
>  		appname, DEFAULT_PERIOD_MS);
>  	printf("To access interactive help, press 'h' while the application is running.\n");
> @@ -2617,9 +2618,10 @@ int main(int argc, char **argv)
>  	struct igt_device_card card;
>  	char *codename = NULL;
>  	struct timespec ts;
> +	int iteration_count = 0;
>  
>  	/* Parse options */
> -	while ((ch = getopt(argc, argv, "o:s:d:mpcJLlh")) != -1) {
> +	while ((ch = getopt(argc, argv, "o:s:d:n:mpcJLlh")) != -1) {
>  		switch (ch) {
>  		case 'o':
>  			output_path = optarg;
> @@ -2630,6 +2632,9 @@ int main(int argc, char **argv)
>  		case 'd':
>  			opt_device = strdup(optarg);
>  			break;
> +		case 'n':
> +			iteration_count = atoi(optarg);
I'd suggest adding
if (iteration_count =< 0)
	stop_top = true;

but I am a bit confused why there are 3 exit points from the
main while loop:
 1) the loop condition while (!stop_top) {,
 2) if (stop_top) before while(!consumed),
 3) if (stop_top) before if (output_mode == INTERACTIVE).

so maybe:

if (iteration_count =< 0)
	iteration_count = 1;

would be good enough?

> +			break;
>  		case 'p':
>  			physical_engines = true;
>  			break;
> @@ -2857,6 +2862,12 @@ int main(int argc, char **argv)
>  		if (disp_clients != iclients.clients)
>  			free_display_clients(disp_clients);
>  
> +		if (iteration_count > 0) {
> +			--iteration_count;
> +			if (!iteration_count)
> +				stop_top = true;
> +		}
> +
>  		if (stop_top)
>  			break;
>  
> -- 
> 2.51.1
> 

-- 
Best Regards,
Krzysztof
