Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF8AE81BBE
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 13:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA4510E3EE;
	Mon,  9 Feb 2026 13:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CB3WDSLo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7E410E3E9
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770642322; x=1802178322;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=xg11tTWyegD26cOArZ65aWouWKWbb29Ur2i3SOowC24=;
 b=CB3WDSLoz9zVVQJvgk1fSS1iP4rGstAAkbG3/PBGNgsLao8Aa4m7BYHc
 YOpQ4svO77qiSk+PQPf2Tj+rJ+lbxQFqFeXWYbflYYb2T2DX7zgkq+nLx
 gsH3OTxCIZazWuyERO8BK+d+UT+DcQVfmnX+rRvkCDpmTQCyQqnpubjql
 2PdCm5pR5Aqx1iLSWlqKuaEkmH/eHOTG8AkS90KEMUAKnK8PI0D7Lh87F
 URi29yutkA+3NOjsX/v/waWrtypUwuee8fmdzt+7g15cINPvShUeLeTRp
 mvpppTT915rpDrldIkXf3c7B/TjOL8UHdglhUAmwL1nztovx1Hvj4GLCm w==;
X-CSE-ConnectionGUID: 5at3+wcySY+hUcxvSRxtqw==
X-CSE-MsgGUID: 19PdGOdYTf6IYAfvfmOmoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89335682"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="89335682"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 05:05:22 -0800
X-CSE-ConnectionGUID: KxM62Z5ZQiiHqsgo1doKyw==
X-CSE-MsgGUID: SZMtLnq8Qb6l28Xmg1xPTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="210752801"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 05:05:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 05:05:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 05:05:21 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 05:05:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0LjWBVurQRVKSyR7oKuJXRzdH6BNkpCxtnGDXHfjyFx3K2OOB3x77SDstzzxBYQi5F3YTFKHKDfFrGwFvArI6nYp1Gac5j3PPxYVJ1CFRNrWQg/NrFssV0WrfQE5LsOmYDGiKUumswJ6empdCRLsiIRH8PdgqSW+vetpH3exlrQCX5Re3h+CNRoKYTmd0B7P0evK8AGEEaqz8h2vsHGv7LtwV+SCZoT0qVo3KDpzE3TMGstYI/pAUABzPMEBT63P66ZKnXJ5R6Evpe73YUEiirVTfJ591Hy2iM+J5NkM/0QqdWKSQH2GjdmlnWogSL36es79CBqZEkD52RWrDZNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg11tTWyegD26cOArZ65aWouWKWbb29Ur2i3SOowC24=;
 b=MYz7lCE97QKFkzPI0dhtl51lobOWX5XCLbnRiFbsMqIeqaIgu36e3ItKE2oTBlu6IHiOhGLN4oIFwBMafQWL882GS47LBn5BotMVVbv0z4t3KYCgNjoqutzPPKZf1J0hWB6yjJlHW5Y09E13KX9GOWOfHoRaAiQeTxqLWdhirxWnIzw78lYD5zxvYW+2KpDNuqWobG6Gsn4QADOq0dB7wFC2xbrRV03ZDlHEj0L/Tr8MOmQAZR9qAsFcfsqUe2yHlR4o9BlVaQaXhVmCqKsItxRnEnUuEzmGUWmiirOIOKRTajKk8T5Gmso1i42OUKNz7mxN9g6ATOVQYF5ZRX2N5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 13:05:18 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 13:05:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 14:05:28 +0100
Message-ID: <DGAGBKCVZCXP.1FYFR2VP5BQIC@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
Subject: Re: [PATCH i-g-t v7 2/3] tests/chamelium/kms_chamelium: use helper
 function for connector lookup in DP/HDMI/VGA tests
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <20260203034546.1516152-1-mohammed.bilal@intel.com>
 <20260203034546.1516152-3-mohammed.bilal@intel.com>
In-Reply-To: <20260203034546.1516152-3-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH8PR11MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dcfcef0-5822-4b9c-3b2d-08de67dbdfb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVdlV0FiUk4vSFljaEx3YTZSWDRMSTJjZVYweUNTV3djbkNyNmdlbDNBOHlS?=
 =?utf-8?B?MEJFdU9SK1ZycWQ3UmpqN0FLZEhtaUg4WVpnNHM1ajNhcmVodGxHY2VBSmdr?=
 =?utf-8?B?a1JVT1lvSXQ1bElOR2VQd3pKUDkzSnc3ZFVkV2lYY2JsTVRHYmhuN1Yyams4?=
 =?utf-8?B?Tk45eEQyaXFzSk1kQWd0Y1BOWXNxcnh2SlFETVMvd1dZMkN0Um8yZmpSMHRE?=
 =?utf-8?B?bnhGeXcvaW00YW9OZm1ibXpYZHVhU0F0V1U5N2Z0cFhTWjZqcEpHaG9LMC9U?=
 =?utf-8?B?ZklhVTdnRzZaVTExcUJzOWVHQmJIOXVYZVczNXdxdEZweDhCTmdNVWlIbkRQ?=
 =?utf-8?B?RFNUUnd0QStaeHhyc2FjeVJiTFdFNll3eSt3ZXVYU1Rod28vb0taVlBoUTFG?=
 =?utf-8?B?TTJDeUp2dXFCa2h5ZjhhclJ6Yzl0L0xuNVhPV3g0cVh6NW9FNUdNWmRFT096?=
 =?utf-8?B?VUxzcmhTRTRIQzVVZGZmOERpRmJXUUtNQnpQQUIxK2srS2dBQ1ltN2FJaHdR?=
 =?utf-8?B?TzVPaXE2TlVFMjdPZmwrRU5Kd0tRdldsZVNDYk9oL0wzZ0J1anZwckVWSnpq?=
 =?utf-8?B?MEpjZDlPQnNoN25OYjVGbFdRallWMEZlNmxuV1R2R3JHMW9Ram1kL3hHYXNK?=
 =?utf-8?B?ZlNPMmY1Yjdrckt6YzRXaURiTERQMVZLRXNxeTN2Z3hLWVFKeks4NHJHbDFN?=
 =?utf-8?B?dk5uM3E2NndFUklaNEoreGJQVFMrK1kvRmpHb08rYjBvdjJJdnhiTFVLUCtr?=
 =?utf-8?B?NlkvbUFXb3NkOUtEYlUvaVpUMTNXZTRhWU1sWEVyc1RreUgwZm5JWjIwdFg1?=
 =?utf-8?B?cEM1Skd1TFhzbGp6T3pIclhXZFg4bHBEVjUzTDFYZlZCU0xiUE5QSTVISXJE?=
 =?utf-8?B?VHV2blNKYzB6NGJFSklGeUxjUVg3dzNJNS8zbGl4cHhCakE0MmFWQWdZaXU2?=
 =?utf-8?B?YmNiaHEzOEFBQ3F6NERIQUtJL2hSRWNIR1VLRW1UTWFPTnJ1a1hsanh5SWhG?=
 =?utf-8?B?Y01jbXZsdW0xSE51akswbnFUY0V1c3VOT1BVOTV3NkFZY1BZSHgrNkt3b096?=
 =?utf-8?B?WThYSGwrVWFuVEJyZm4zZmVlWVU4ZXZ1d2tFQXEzZ0U1SVVDUDcxOEZmNnIw?=
 =?utf-8?B?Y00rYlRqYXIvYzRPOHJnSm44aTZoL29velRKdFZZZU1LQmhyb0E3d1ZzN1BO?=
 =?utf-8?B?K2RTYjE2YUdkbkozMEh5bTBJOUdVd2ZmVXBsZXFDQVhwc3NBUGtiTVNMMmFq?=
 =?utf-8?B?cDZPamx4TEJJZFZYOWdkOGJZVDlYVEJNTVlNSG1UKzFOaGhEcm0zMjFwckFY?=
 =?utf-8?B?dHFpWEJUdGZMenpHclFZb2tReVZLbFBHSEw2c3NWcTRFTThSYjgzb3JtVk1V?=
 =?utf-8?B?V1psdGhDZzJvK2U2VWlXS3JxbnREcFR5Z2ZPS25ZQ1FTekh4SDlURXVLRUVr?=
 =?utf-8?B?Qi9xYXB2MC9FRGlEd1MzTmZUVndrWkpFOEV2dzZuSmVLeVhlQ2lQZ0VZRkNK?=
 =?utf-8?B?VG40ZEw5R3o2ZFJsMzc0OUlYOU5pSWJ4c1dJTm04YnBGcUtVNFVqSUMybGli?=
 =?utf-8?B?VlM2Q1ZEdHRKV2dZeTRSS3ZaaGYyQm9MaGRodE82VmZrSDRZb2JkTDJrRC9W?=
 =?utf-8?B?VWFEa0I2Y1BiM3pweDB5TDBBY0x5SDlaMyt1Zk43bE12OVBnWkxBNnorUWp3?=
 =?utf-8?B?MEhWS1lGUlRFRWpVM1FQZzBKRnhyTGRVdXpJeWdzR2EveFdSTGQ5SzVvcnRr?=
 =?utf-8?B?SS9HMG1TbWRSOUdJQXQ5QTc4UFFRd2ozMnNBM0U3amkwU2hvYndSTVhKNHFZ?=
 =?utf-8?B?M0dCUm5iWStqQldoMFc2aFBJT3JaN290RW9tZXB0SmxZcEdCL2s4eGF1TEIw?=
 =?utf-8?B?bHZyYkNuWWxDMmpwSVdMeWlQNnhvTjVyYnJDRnFiM0FqN3RXWmxOWnc0bk1D?=
 =?utf-8?B?NnJDbGFIUGpBNmxvSjhsRkduTnJQSmZjNlFaWDEwNnJXZ3FobndoSEpaaURq?=
 =?utf-8?B?OW9NUjJlWWlvTnhZeXowVFM0ZHBROWc0bldRMWlucmpFcTJFcUIwaGdEMXZW?=
 =?utf-8?B?dzhvRHRMN0FXTTNIYTVQV2FuQlRqV0g4RUJRekt4RHE3cE54OWxHTXErRmhC?=
 =?utf-8?Q?Oq58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eC9wamJQd1hzVStsY0VmSmM3MDdCQ1JtVnAyVVZYZEdiK09aQTZHakJUdnR1?=
 =?utf-8?B?OEMxM0pRQUxtRjJjM0NsV2pqeGt4cWdGR3FPKzBWZW50UE5nS0xHRDlDNFkv?=
 =?utf-8?B?em95TWdPN3RGR0lRRWQrZkduOWF0Uk5yd3JQK25KVWJlWDZXUk9HR01ld0pi?=
 =?utf-8?B?VWVLMU1JSTdnQ0tUaEtGZ3Z5UGVFa3NLUmpKQkl1WlpyMnNybU5TR28yVExR?=
 =?utf-8?B?azRjS2x1V3h1aDNGYm9LdVVvRTE2dTliUWFidEsydGdDTDJSZzRKWkRYRUNL?=
 =?utf-8?B?NGFUUWlJeXlLTXpORGRtOVpEMlFNZnJldTN1TGhuRmRzWjhKRGYyc3hKOTRD?=
 =?utf-8?B?dmhyMUgveWFNcU5TMVR5MnFwV2t3WDQrcWRFVFR3WEdrSmE4Undobm9LV1ph?=
 =?utf-8?B?bUxGVk82TjM0d1l4NEhPRXNRQzJIaHJMZGRzRDUzUmcvRVFPSURTYUlGTFZw?=
 =?utf-8?B?TlMwazg4cFF5SmQxNWtWOHlYRzhWSDJZNGE4OGMwVlB5ZzlVQldrZWI1ZUpm?=
 =?utf-8?B?OE9oZDJETUVra3J5NjNqRmJSdlU2QzlNZEplbERmeU15R081ZXM4TFFlUnJQ?=
 =?utf-8?B?MHZ3SHo4SmgrbXBTeGF4NmtZU05iQ3VhMnArTEVyMVVrb200WVpyc1MvWkJT?=
 =?utf-8?B?ZEtWelE2T2tPZVdPamF6czNMclg3WmxsZGl1R05vaWdVbmZsNXQ5bkRMS3M5?=
 =?utf-8?B?b3NJZmhpcmNHTzZhTVhBN1E1ZWptZEZhREhqODNjOUNKRHFLTDZEN2IxRjRM?=
 =?utf-8?B?ZEpObGNRcW5FM1BpTWM4c1FJNmh2QXhPM25mLzVKV0pBMmVxZUFra0FIMmFV?=
 =?utf-8?B?QVRSdGoyQWo0TEk2dHBSbUtUd09DQkoreFlZM25sRWh2N1A1ejN3UGJJR1RF?=
 =?utf-8?B?TVkzVFlqTU5MS1ppMWJqRTlOQWpQMHlKeDV4VURpeTdYRkdmMGNJNC9LaE5T?=
 =?utf-8?B?aEV3ZExXVTN2NGFsZkJySHNpRzAxbjJ0MUJ5MzQvTWdMWEIzUjhwK0U3Ym5O?=
 =?utf-8?B?cWNEYklVNXhwVGFyM2FGV2ZtK3I0V3ZNejdvRitiTUpoY2treXhoNDRSUjl6?=
 =?utf-8?B?NVd4TzQzMkR0VGM0UnQ3azg1MkJ2L2syc2ZTWnU2SnAxWGNvTVJNbVRaQ2ND?=
 =?utf-8?B?dHc2UHd0WGM1U2Q4ZFV5aW0wSjZUUXc0dE1ESHF2aEdKN3NhNVAzNHJzR2py?=
 =?utf-8?B?Tlkxd1NyWFpUSUFZeDRUeFpWTXIvOUV1WUN5bEo0T2twR2FLWE5OeWNXRWx1?=
 =?utf-8?B?aTEvQWdPSTN3Y1htWndtNHVtWjhPRDFDZ0ZCcFdtcEVYZmJhaXBaWVNQcGF6?=
 =?utf-8?B?QzRld1A1aXl3M3RNajZmVTZwZDlDSjhkMW5aU2pibDU1YkNZaUZBTVB0V1Bw?=
 =?utf-8?B?alVpUzNYRkQ1NXQ5QVcvU2dRdDJ6Z0UvbCtYanpnQkY0MkVEWWNLaUlBM3ZM?=
 =?utf-8?B?NEF1L3k3eEkvaWVjRTg3WHR0L1BqMzZneTFlY1JGNnE0d3ZiRG82WDQwS3Az?=
 =?utf-8?B?N3Nic01KUkV3ZWNNZ3VHREZBS3J4RUFaTGFqZkZySDJLcG1uS1pRYXVlSFlu?=
 =?utf-8?B?UE1hNlVmZ0YySEZQYmZBS2U0SUp4TGdsUXRDNHBhSElaOWdvWjVCL3psK1d5?=
 =?utf-8?B?MDNFdXlyUmMwNEJrMDQ5NFlNOXhiV2pvMytSVmoxRHhhK250cUJ3emt6dkVV?=
 =?utf-8?B?T05Pak5pelRWK1ZOM283VGxVOHduTUlJQUFNcnJUZEF2Z0pYSFYyRktyamRI?=
 =?utf-8?B?c0R1emMwSlh1T3NPNi9CR0xidUk4TG1rWVNwTTVrY1VDV1Y5V2REWVRaK2Nq?=
 =?utf-8?B?c2J5cXlXNnVCZWtkZ1lVTEc3TG5qd2t0Zkgyb0FGVDBvSUwybFFTT1BKR2NG?=
 =?utf-8?B?ZTN5T3c1azIwWEhoVzVpOEUzU3RlL3luV0ZtN3NpRWZPTlM5Y2xyZ2NQL0tC?=
 =?utf-8?B?cVNNWHM3QmpQalN6SVZOZTJWeFYrV2lkL2xreEdVNVFvbWVpbndxa0hTa2hy?=
 =?utf-8?B?U1pkQXlBYm96QmFQTDBHcWZLRmU1WkVGUlZFeXJrVXBZSmxGWXRUZVo5YXhk?=
 =?utf-8?B?NWd5LytiMjFBLzdoN3g3ZXRxalpsR256YVBqczhXSmdoK1MxSDJrWjJwTnFT?=
 =?utf-8?B?TGFid0VlNXFSeVQ5Rk8vRk9CUlNnMUhPSk80dEorVWJaeVYyQTdpcWY0eHVr?=
 =?utf-8?B?TXEwcGk1MXB6ZnhJb1lxZmhmdnpaV1BLanZlR2Z4Q3k5SVlZRm41aC9JeG43?=
 =?utf-8?B?OGIxdWcxdk1HS2h2eVF0Zi9udFp5VllTRGNpUUR2ZjUvWGN1U3JncFFBbWZY?=
 =?utf-8?B?K2pORlJENTB0NFE4dUNlN2dES0Q3NGtTL1k5ZmRSYXJ4QS9kZ01NdDhvanF6?=
 =?utf-8?Q?whlmO12f/6c0WfCA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcfcef0-5822-4b9c-3b2d-08de67dbdfb3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 13:05:18.3274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUAuBtFVj3Y6JWni21Q+4bz65kAYjYo0c9Qw/EeWmTv3w/Mvy5LN3N9LaKaj+/HgKBOMecI+Hk3b3u/4vAeXyT/F1kfmoEQB8Nz+WAYK4ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7965
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

Hi Mohammed,

On Tue Feb 3, 2026 at 4:45 AM CET, Mohammed Bilal wrote:
> Use the connector_test() helper macro for chamelium hpd, audio, edid, and
> frames tests to iterate over and test all matching connected ports. This
> ensures clean skipping and consistent connector handling across DP/HDMI/V=
GA
> tests, and avoids unintended execution of unrelated fixtures.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

