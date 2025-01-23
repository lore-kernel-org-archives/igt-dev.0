Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157B3C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 11:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47E010E7DC;
	Thu, 23 Jan 2025 11:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJNomdnM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF37510E7DC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737631234; x=1769167234;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=SSBICNVqXjIYzbGIXw3jX+hGiGbumw5/BNAaXXQxZO8=;
 b=MJNomdnMAjG6FPdMMPbDkJRdsHeEFhq8D+mxWMTok87aPtWBCMAFFjBR
 v8M/XA7xhobfDNlSNN1qVP6gPK/5sGUziRUaV4XJPTTIG0xV2TKzD4NSE
 g2Z5n2xeSoNq1ibxGdmqNs9k/VRnA6aswVITWIuM0Sp2sU6obajrSZZCT
 yvW+fM+k/Fs49DF5ihQRgzQ9kkf9SHZH1uGdYKA/tKVFqOyiEPhnnt8d8
 YHKbLW6QiRkvUgCrjI3MUHLS2bz4k4D5dwpvpV1ZRiX1hzCczJ4nDufWP
 lZ++XG9VNAHin6NV5IQryu7vXYxwMOOz3cwoBh6FRIb9KclJFI87A2SOT g==;
X-CSE-ConnectionGUID: Bw/aXd5tQoO9z76J4HTjUw==
X-CSE-MsgGUID: hViHqTNKQcOv5jjhS1zoVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41790972"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="41790972"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 03:20:34 -0800
X-CSE-ConnectionGUID: jsm6t6L5RQiP0QBlFaTQCA==
X-CSE-MsgGUID: QT7Y+yK/T7GXAm/GWmbpow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107247285"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 03:20:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 03:20:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 03:20:33 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 03:20:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMSbEGzPTnCGedd9UEV+6cc8RDFRZ6O3PpFjPvzYRcjeeBnZTc6r5rJlVbsNN6INAXkb+MT8LPH5MtAalH++Hn8rWqWCSpjGClI/sJ6R3nFXQlW1ybQs2zx0BazrkKgc7YuDPblepGeYTtIY9rmSReCiFXxvXLOrUJsJEQ1B24pOgYzFF92Dm/hktolsvqkFCLFVqmVZgzopKCC16VVxFFSIKD5hapTIycPRHGhuJDJq+lee0ZRY+L8VALQlKLo+k1MpiR1uhETh4PKOznddxrQHmqHc0Ebr8B+RJpIPys98IbXWxNwa4XCvRxeI78GjFiCI22FGrnmfDs3Un6Wm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q5O8rgW9mb2e69no8kFPbbcOUaXJpMqPtDD+k/5QPM=;
 b=HQkm+Ve7TGCA8DrWgDEZWCTK383I+5CCKX3FSISPwlEFE23UqNhXBJYNrewECIRYW/UNCvBU2FCzDv5P5ijf1lBeCdDKTlFAdh2AyR99nkNDM+u+lF0rjpBwTfMk1mX2RwBY/h0JuhuMIn8MV7U1rjc+KhxliJtMo5Uvra7tgdGGOWZeIlGctLzPwz9zTnOG3oS3brXRHofppgmGttxeLAG5E95pXgueMzp1m3deeXc/jE2luq46UW0UH9FXBBnLFcZmMlClG6WFHz/YzCbfGKnDS+/HPhWqQ3QH57BmbAIUkze65lid8ylp6d9LKDy/ydg3sq7C44VSlVs8y0LKag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 11:20:30 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 11:20:30 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <bzvok6b64e22nudscgjfoomev6pq3rb35felx4yhmqmqdqid4w@dfaoanffylov>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-3-lucas.demarchi@intel.com>
 <173754482486.5500.2959553679406990943@intel.com>
 <bzvok6b64e22nudscgjfoomev6pq3rb35felx4yhmqmqdqid4w@dfaoanffylov>
Subject: Re: [PATCH i-g-t v2 2/7] runner/settings: Use wrapper functions for
 each type
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 23 Jan 2025 08:20:26 -0300
Message-ID: <173763122633.4470.4000369061240793108@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:303:8c::31) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 1421d646-34ab-4a26-11ee-08dd3b9ff1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1BtRGQ5bjE1dXZlS3hjUGwvT3QwQ1QxdSt2S0N5dHFuREthOElLaXR1NGRn?=
 =?utf-8?B?bkVWMEJHVzJIWTEwZmVXQ1VOR1V6Zm14MDA3Tkp5Z1hONHZzVHc2M3QzUllG?=
 =?utf-8?B?WVVOcWpDZ3lwVWtiMTRSZFl3dkZVM1JUUnlQbUVlT1BTNmxNTitQbkptMlQy?=
 =?utf-8?B?V2dyazRIQ0w0WG1zTVlOc2ZyKzQ0aGtEMXFla0ZWU0V1THY5a2RRSGNWSFht?=
 =?utf-8?B?eGpWOER6dm9MVzUrZDRrN1RjU216WCtoaE1GRERUMUZCbk1CZTlkcitRWGpT?=
 =?utf-8?B?eWMrQlRTZ1VGTFJ4YVV6MkJFa0ZuM3E0U1pFQzVGVlhySVdReGJzVkNHUHZU?=
 =?utf-8?B?MWxyNXpvNHFET2xBY0MxRzd0T1o1ZGUwcUt3cmkwb0FvWnNGTHlMcGVJS2pS?=
 =?utf-8?B?ZUxSdEFVQXk1SVRkT0tpZWJ0K1JCbThIMUtRUXNuT0hxS1pIR09wbXJvUWlY?=
 =?utf-8?B?WjZnc2I2VjZwRkprMld4cENHVDN2MVRKKzc5Z1lhMCtBT3VqWHJDdUhCZEh6?=
 =?utf-8?B?NU1GT1lTdFlDc015MlMxd3YrMG9XUTRhSmFzS3ZmSE95MngyMk1za3hOS2Fy?=
 =?utf-8?B?c1k2SVY2bWtVOWNFSnEwUWFVTEVSTFpKL2grWWw3bTlRWk14bUNKNkh2SFJr?=
 =?utf-8?B?RG00ei9PY0JuS2VaQ0F3V3JGa3c3SytwY3JEYzZUMkZUM2FpRDVhbkxVZnZB?=
 =?utf-8?B?bjNjZDZQc25yMldLZE5DRWl2STRoSHVIU21jVWNpWG4rN2RLeGNsTE53WWZ6?=
 =?utf-8?B?SGduVm9LWlVXN0tsaWYwZlBKUmVIWVI0YkJhcXA3anlZclFVOUdTTCtTY1lS?=
 =?utf-8?B?RFplbFQ3ck9JQTZHS0ZBZFEvMEFZekROTHFzYmVaL1ZhTFc5ZjNNeXlweE5o?=
 =?utf-8?B?R2tjRnBvMHZKa1NrYVhjWHowWHFKTWxMRDl6OFp2WWRmWXpkc1NkTStLWjVG?=
 =?utf-8?B?REprelhOYzB6dkw0NmF5enJ0anFZYlZUc1ZDd2tPa0FKTisxUW1UbWY5d0pi?=
 =?utf-8?B?Tm9FcWQ4V1ZjT3l1TmtGeTg0N2pzNzN3TjRZdENMSjRpRmdrbDk3bE0wTzNy?=
 =?utf-8?B?MWl0N2pNUXI1bzJTYlFQbXBxNmQxZm5PU2d1UGlTWGNLUGhkRTVxN3lsazFT?=
 =?utf-8?B?NWtyV1ZSUHRhUWZ6bTgyY0JqYjNiQXVnY2xnSXZtZ1RNWW5hQzhnMnVISE1Y?=
 =?utf-8?B?YTIxd2FObzFhVFA2OWtGdXd3SmhrZ1UxcU82YUtoL25sSjFEK2xLZzQwRGt3?=
 =?utf-8?B?TVFmUXhhbzltL1NRallrZjREZWRucm5CMzJma1NLdCtWUEJwS2pkNEs0cXVO?=
 =?utf-8?B?MmdqbHo5Q3VHT2VKNDJoQkNoMXZUanhJNkRIUGVEcHc1RXJtVzN2eHNwVWxS?=
 =?utf-8?B?aDFOdy8yMXJ1Ty9JTVZlOWJZRkxjRmZBZzJxZWdYc2paTXN2SUJhQUluWG0v?=
 =?utf-8?B?cVQzWGxKd09RUzlRdnVGdFJndWViUlNyYldKcCtCcTYxMERmL0N1TldQVW9v?=
 =?utf-8?B?SmNqOFVOSjVkSGhtUFlMUWdNeDRXSno3ZE91NEdvL0hVQmo2RkdLYmY1K2I0?=
 =?utf-8?B?YkRDaTl4amZ0ek5na2dKSnVWTmZaQmZaUUszWVM0TTFNQkkrelRCcHlubDli?=
 =?utf-8?B?Z1NSOWREQ2lSK0lFRmgyZzRvbVJFTnRYY3cvZnE4MDYzUUlFZVZOMk5ZUk5V?=
 =?utf-8?B?VExVVGZUSnZ3SGRMOTFEa2podnhuYUV4dVRta0hiTE0xaWlmRW9OMWt0b0l3?=
 =?utf-8?B?RDFyQ013MFJVdkFXVFRWUElZc0JPd0x6djBTTFlndUlMbXFIdkJ0UzQ1Mkx5?=
 =?utf-8?B?SjZjWWlEWEZSdW5qejAvUnhiSjZMaFd3ci9JKytuNGxqYjFvekRET3paS3Nj?=
 =?utf-8?Q?Y3ZtjM7eUwGWz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkgrSGVBeWNKNzIyS3ZZY0lYd3doVm9FUUlGRS8yOUQ1bFBJSGxTQk1XaXd5?=
 =?utf-8?B?WGhsTnpab0tjU3Q3ZzNNc3BXYVhGMmN2MEpRM0dqWVFHRUNiQlRabzk0N2Ex?=
 =?utf-8?B?WGJXYTNEaHFGb1dEc2hrejJqcm94bnlpYzBMbU1xa3d1OGJkTXU2M3dva1Rn?=
 =?utf-8?B?MEcwbTQ1U2tlWXRRLy9Ya0ZwQTVUUXJrN0NNV1NyaHlrS0g3Znk2RDdxem94?=
 =?utf-8?B?Ny92ejYreDdkRlJoZmJZUGRnQ1lid0ViUXM4emVMVDhNbTJMWEx0b2NGdHZK?=
 =?utf-8?B?bjlPUC9sMFRFby9Vb0cvcFVCNEVDZmNSMVIxUzlEaWZDeTMyUk5FZWhaL21h?=
 =?utf-8?B?TFAwbGptZXJxclBvUUlWdlhWNTRhYjVoZCtDRmE3Qi9oYVFIYkFHd25Sc05K?=
 =?utf-8?B?aTJkZTl4UkxwL2J3OURSbUlxVlpzK0pBUlBLekJvNzlXbTN5bTJBTUJMN0VJ?=
 =?utf-8?B?RllPdGRBNjR4a0o0dmptbTJEL2Yvd0o4UXZFZFhvVUhpYzRKaHN3N2NNUDJ0?=
 =?utf-8?B?MmNSZmF2Q0htc2NWZjZXdStXTmJYZDU5aDVMOE1Reisza3h0SE1WdWR6bmNv?=
 =?utf-8?B?RVF6QkpRNk5RTGZqZERndmowSVNnSmhUZ2hYeDM4bHRhMDNjN1VabXU5NWRv?=
 =?utf-8?B?SVB3azJPRGUyRTZjbG92LzNqNDJYdkJqaWNTenNDK2xzRTc1ak1xNHMzMmwx?=
 =?utf-8?B?V3lNbDhIU0NhZERFNjFiVjZxUm9TWmNXV2dJeGkzeEM3bzhGTmQ0cHRTeFdE?=
 =?utf-8?B?dzB5dXBTdXBzbFRoelhIYTR3Ymo4MmtuaEV6alVJdFNZSlVWeG1QdXorSGov?=
 =?utf-8?B?TnE0V1AzY2tOMnd2blRtSWJEZWN3RWkxS3cybjNLVDNvaWgwYkFjTnVIZFZ3?=
 =?utf-8?B?dUJpYlh1NGtVOU1mZFZmQVdQWEZKTFd2SCtrRzJiSU03NXovQkVvOVlTZVJh?=
 =?utf-8?B?VXR2UGRxeW1lQ3Rid0p4cFZaQVJGc2FJc2RsQmc3SFBPT256anVVaXlOMlNv?=
 =?utf-8?B?bndJMGZ2eWViZGhHV24xZXNnaENXcTNwamlwZnNGZ2tQQjZ1OVU5TjQzQkRq?=
 =?utf-8?B?RFBjK3pnOXNlU21BSmt3dUxSRzlmZjhNYWQrMUIvS3pLUzlUb0pSRUFhb09z?=
 =?utf-8?B?QndxT2oveEkreHI0cGxFb1V1TEFyazZ5NlJRVzVDK2JlNnlESjNWRTRzSEVm?=
 =?utf-8?B?aEdxNlZsL092d1dPWUFIRzNITm1wZXhaNzJvTFZ3RDdpeTVvOFNPK1NBOTlx?=
 =?utf-8?B?Y0R5a2ZnUmNvZmpTWnZxT1psU2NZV0RJNGlJZTI3ZENsdnBlTjNIZFZ3WmpR?=
 =?utf-8?B?cE1MM2V6YWp5cVNQa3ErS3R1dWZ0SVNRQ2VUSUNLSFBZMjBGTGpBMVFMcUFu?=
 =?utf-8?B?QUcwY1FPUGpsN0dPUXNTQlBGMjdQaVpTTExKZE91b01ObHBHTjI3dkREc2hS?=
 =?utf-8?B?bktYcDlPUG5XRGFMSG14NlNtYURYcFQ4UGZqdXN6d282TngyazFEVExXR2Vv?=
 =?utf-8?B?c2V0M0FiaGVQa1liY3lTeW9SS084d2xjSUJ1S1IwY0R2bW1uNE80Ukd4RENB?=
 =?utf-8?B?cklBWnNjZnhoeFZrOE9ZMi9DdU85b2lqbmFRM2Fsd21kdHhPNTQ0dmVhQUQ3?=
 =?utf-8?B?cVYxSEp4ZHlrb011V2Z0L2UzczFIYUpwK3o2OXVBTjFQdGE3UVhFSEpuVTYw?=
 =?utf-8?B?bTZnRFgvbTdRR0E5VTJZK0lpclFaaTN2S3hxOWhvVm5RY0c2UmMrdS85RFhn?=
 =?utf-8?B?bkpWVnc3U0FQRjdWa1JwUnR0amhJdzhIa1FpZUlVazNSZVA5SmJIcTl0Ulow?=
 =?utf-8?B?RlYwS2RnejcrMkNORHgwK08zajRZT0pIMWZqZFJEK2g2YllQL2JwUThPMi9j?=
 =?utf-8?B?Z1ltMit1WSs0TTlTWEJGaUJ5TEl1RHU5eTdDMHo0WlhvN3R2c0NQenYvZlgz?=
 =?utf-8?B?b056SWNkb1Viem5UL1FmSHNHSElRUHRFczEzWHk4Ylk0S3hmTlE1T0FXNDE4?=
 =?utf-8?B?eUtrVW04V09TdnlBV0txYWdCUEs1UGhUeTk5bzdhVVZxOXBLZUY2alZ1OUV5?=
 =?utf-8?B?VzF3eW9LeXJyeTJ6Wk1ndS9JNlhDczFuNjUxWkU5UzFWTE9WTGEwSENhYTNi?=
 =?utf-8?B?THlFVDU5Z285L1kzaGR3c1p4TGRaVGN4N3crcFhoWVVLYVNyMWcyUXcyRm0w?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1421d646-34ab-4a26-11ee-08dd3b9ff1eb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 11:20:30.3858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3m02mRU+6B7VougltzkUFR7yhyc5Cw1qtzjwwq45ag3Xel+V4wW3rC1JomzloxGIsSuSAZuATuBW3oJ7q8Vkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
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

Quoting Lucas De Marchi (2025-01-23 03:07:09-03:00)
>On Wed, Jan 22, 2025 at 08:20:24AM -0300, Gustavo Sousa wrote:
>>Quoting Lucas De Marchi (2025-01-21 19:57:28-03:00)
>>>Simplify assigning the variables by using wrapper functions. This avoids
>>>calling atoi() on every iteration and will allow to simplify the
>>>strdup() calls in future.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>> runner/settings.c | 74 ++++++++++++++++++++++++++++-------------------
>>> 1 file changed, 45 insertions(+), 29 deletions(-)
>>>
>>>diff --git a/runner/settings.c b/runner/settings.c
>>>index 80d95be5b..13694a51c 100644
>>>--- a/runner/settings.c
>>>+++ b/runner/settings.c
>>>@@ -1152,43 +1152,60 @@ bool serialize_settings(struct settings *setting=
s)
>>> #undef SERIALIZE_LINE
>>> }
>>>
>>>-bool read_settings_from_file(struct settings *settings, FILE *f)
>>>+static int parse_int(char **pval)
>>>+{
>>>+        return atoi(*pval);
>>>+}
>>>+
>>>+static unsigned long parse_ul(char **pval)
>>>+{
>>>+        return strtoul(*pval, NULL, 10);
>>>+}
>>>+
>>>+static char *parse_str(char **pval)
>>> {
>>>-#define PARSE_LINE(s, name, val, field, write)        \
>>>+        return *pval ? strdup(*pval) : NULL;
>>>+}
>>
>>Why do we need char **pval for those functions instead of simply char
>>*val?
>
>you will see on next patch, but :
>
>>
>>>+
>>>+#define PARSE_LINE(s, name, val, field, _f)        \
>>>         if (!strcmp(name, #field)) {                \
>>>-                s->field =3D write;                \
>>>+                s->field =3D _f(&val);                \
>
>right now it does this ^ and in the cleanup it does the free and assign
>the variable back to NULL. In the end we are doing
>
>foo =3D alloc()
>bar =3D=3D strdup(foo)
>free(foo)
>
>when we actually only need the first allocation and pass the ownership
>to the outside. When coding this I thought about calling the function
>leak_str() instead of parse_str(), which would probably clarify (but
>should be done only in the subsequent patch).
>
>
>
>>>                 goto cleanup;                        \
>>>         }
>>>+#define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, =
parse_int)
>>>+#define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, =
parse_ul)
>>>+#define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, =
parse_str)
>>
>>I would have kept these inside read_settings_from_file(), since it is
>>very specific for that function.
>>
>>(And in a follow-up patch even remove the s, name and val parameters to
>>make it simpler.)
>
>Matter of preference, but the defines inside the function pollutes a lot
>the variable declaration. Particularly when we increase the number of
>macros. No reason not to keep them just above the
>function and undefine them just below the function. You will see in the
>next patches I didn't bother undefining them all since just undefining
>a few gives enough protection that those macros can't be used anymore.
>
>As for the arguments, I also don't really like macros that use variables
>not passed as argument. This leads to unmaintainable code - we used to
>have macros in i915 that depended on having a "dev_priv" variable
>somewhere - it took years to cleanup that to rename to i915 and allow
>the driver to run with more than 1 devices (we made a mess with some
>files, declaring a file-scoped variables).

I guess that's a different case, though? Those macros were used
everywhere in the source code, and having an implicit dependenty on the
dev_priv variable is not good in that case.

These ones are specific for read_settings_from_file(), as far as I
understand.

In any case, I just think it would make the code less verbose, but not a
big deal if we end up not doing that.

--
Gustavo Sousa

>
>Lucas De Marchi
>
>>
>>>
>>>+bool read_settings_from_file(struct settings *settings, FILE *f)
>>>+{
>>>         char *name =3D NULL, *val =3D NULL;
>>>
>>>         settings->dmesg_warn_level =3D -1;
>>>
>>>         while (fscanf(f, "%ms : %m[^\n]", &name, &val) =3D=3D 2) {
>>>-                int numval =3D atoi(val);
>>>-                PARSE_LINE(settings, name, val, abort_mask, numval);
>>>-                PARSE_LINE(settings, name, val, disk_usage_limit, strto=
ul(val, NULL, 10));
>>>-                PARSE_LINE(settings, name, val, test_list, val ? strdup=
(val) : NULL);
>>>-                PARSE_LINE(settings, name, val, name, val ? strdup(val)=
 : NULL);
>>>-                PARSE_LINE(settings, name, val, dry_run, numval);
>>>-                PARSE_LINE(settings, name, val, allow_non_root, numval)=
;
>>>-                PARSE_LINE(settings, name, val, facts, numval);
>>>-                PARSE_LINE(settings, name, val, sync, numval);
>>>-                PARSE_LINE(settings, name, val, log_level, numval);
>>>-                PARSE_LINE(settings, name, val, overwrite, numval);
>>>-                PARSE_LINE(settings, name, val, multiple_mode, numval);
>>>-                PARSE_LINE(settings, name, val, inactivity_timeout, num=
val);
>>>-                PARSE_LINE(settings, name, val, per_test_timeout, numva=
l);
>>>-                PARSE_LINE(settings, name, val, overall_timeout, numval=
);
>>>-                PARSE_LINE(settings, name, val, use_watchdog, numval);
>>>-                PARSE_LINE(settings, name, val, piglit_style_dmesg, num=
val);
>>>-                PARSE_LINE(settings, name, val, dmesg_warn_level, numva=
l);
>>>-                PARSE_LINE(settings, name, val, prune_mode, numval);
>>>-                PARSE_LINE(settings, name, val, test_root, val ? strdup=
(val) : NULL);
>>>-                PARSE_LINE(settings, name, val, results_path, val ? str=
dup(val) : NULL);
>>>-                PARSE_LINE(settings, name, val, enable_code_coverage, n=
umval);
>>>-                PARSE_LINE(settings, name, val, cov_results_per_test, n=
umval);
>>>-                PARSE_LINE(settings, name, val, code_coverage_script, v=
al ? strdup(val) : NULL);
>>>+                PARSE_INT(settings, name, val, abort_mask);
>>>+                PARSE_UL(settings, name, val, disk_usage_limit);
>>>+                PARSE_STR(settings, name, val, test_list);
>>>+                PARSE_STR(settings, name, val, name);
>>>+                PARSE_INT(settings, name, val, dry_run);
>>>+                PARSE_INT(settings, name, val, allow_non_root);
>>>+                PARSE_INT(settings, name, val, facts);
>>>+                PARSE_INT(settings, name, val, sync);
>>>+                PARSE_INT(settings, name, val, log_level);
>>>+                PARSE_INT(settings, name, val, overwrite);
>>>+                PARSE_INT(settings, name, val, multiple_mode);
>>>+                PARSE_INT(settings, name, val, inactivity_timeout);
>>>+                PARSE_INT(settings, name, val, per_test_timeout);
>>>+                PARSE_INT(settings, name, val, overall_timeout);
>>>+                PARSE_INT(settings, name, val, use_watchdog);
>>>+                PARSE_INT(settings, name, val, piglit_style_dmesg);
>>>+                PARSE_INT(settings, name, val, dmesg_warn_level);
>>>+                PARSE_INT(settings, name, val, prune_mode);
>>>+                PARSE_STR(settings, name, val, test_root);
>>>+                PARSE_STR(settings, name, val, results_path);
>>>+                PARSE_INT(settings, name, val, enable_code_coverage);
>>>+                PARSE_INT(settings, name, val, cov_results_per_test);
>>>+                PARSE_STR(settings, name, val, code_coverage_script);
>>>
>>>                 printf("Warning: Unknown field in settings file: %s =3D=
 %s\n",
>>>                        name, val);
>>>@@ -1210,9 +1227,8 @@ cleanup:
>>>         free(val);
>>>
>>>         return true;
>>>-
>>>-#undef PARSE_LINE
>>> }
>>>+#undef PARSE_LINE
>>
>>Missing undef for the other macros here?
>>
>>--
>>Gustavo Sousa
>>
>>>
>>> /**
>>>  * read_env_vars_from_file() - load env vars from a file
>>>--
>>>2.48.0
>>>
