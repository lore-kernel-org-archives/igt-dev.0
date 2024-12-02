Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C44D49788
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 07:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3583A10E208;
	Mon,  2 Dec 2024 07:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGx3nl6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3812610E208
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733123098; x=1764659098;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xlPn2ceN8d6DftoXjksnTQUmxuZC4BYo2qRvv2NjsnU=;
 b=fGx3nl6mCf9KPjRHHgVVCLR3qXsecPVuM3ynG7jcEpatxBP1vGZjIWqx
 9rmidTuvVrB4prG3Jkmh1QyYhLKDQPa9AR+/1Z4SmJc1IXD+jnRBKcvNx
 rrQ/AkjLlthrQ8N3gsc6o8MWV8b+rLTbdrvH7sq/bzeC498Zk19/HTmsg
 Wm2zSzrQ2M/MANDerEg6I+A1eVYfTie/YepfdtqjuASiq1YQNhzgdgN8H
 zMwlB3glOQC3/ctxiHfE94TPcv9pilKZAChNtZTwFOVxa1nJ8rY0Yyoct
 H3anVee02ZmEB8x6hCF83vWVLNCaxxgso4LO5XRmEeaNECmz3sETzAoyc A==;
X-CSE-ConnectionGUID: zPh9t5cgQNu4mPDhevLCJg==
X-CSE-MsgGUID: 1TcpW7XUTd2RyHkdq8E+Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="36941329"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="36941329"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2024 23:04:57 -0800
X-CSE-ConnectionGUID: E0yPTHDwRBmt/98/O0NZlQ==
X-CSE-MsgGUID: G/z7BIKZQpSlrmRQCpj2iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="97787756"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2024 23:04:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 1 Dec 2024 23:04:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 1 Dec 2024 23:04:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 1 Dec 2024 23:04:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Do1DjXr+7BaWOSU1qDMg3gLvQJlz90/KcyTzNcbFae+ywuX/hjuGBigH32Cp2FHYEy3smbfzwfyYzwvEZlPgD0kd2I+3xIAYKMu+7ebksmqlDGDgp2kNKHCCq/lqhNaPL0FCTv8KWlzxS9YGeg4k/JJ8bgco/K8bbBjI+ZVi6ad6TvMSNcFKuUKtECMdwNY3SjCe6WCYYDH34PpIfj44H/4T50Myb66okCmcAgQetoEAq3I8nAfHPi5H2p0TcNhP6m9IPeLBPXqjLaJSKLuCkYXImrVhLKsKMLwsOogrhAJl9lkum7t1QLujTIUAez3ZQKyGpQix8LvtWzgMEniVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJPUpDyO3Xgnfaqfx3wUo5yFZ1BWJSGADNshELWTM2E=;
 b=EWMKS+N8lUv2iF7fI6J697f8rLryRrLWF54dF/n1CgD+tE67sY5tPWEAUhcwe3Pn/6oHiPnKROBv/Cjgqo6bImu40p3BdXiZZr0m1Qx3cOOhib1wEeB8Ee80cu1SreFwy5nvwGo3cH2zDgk5ze33c165CiHf9PGarZ8GoSev0VTBdMgO1SGnmR8FgG/nI0fyd57bmoITzho4HfbTYK/argyyXNRVfBrAe70/aVgzXAiwy+HrYRhil1zaAcI8DHNcaVMNxI663lLKELQfN2PXrq20CwrFoma+Bcyb8vIWaK+OeQvX1bPPhktQ918DnJAkqypLK9fp/tzkMk6adRpITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 07:04:54 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%5]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 07:04:54 +0000
Message-ID: <a3a8de99-a4d7-4902-85c8-af03596e2870@intel.com>
Date: Mon, 2 Dec 2024 12:34:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 8/9] XE3: tests/intel/kms_frontbuffer_tracking:
 fix x-tiled tests for case when there is no x-tile
To: Clint Taylor <clinton.a.taylor@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
 <20241114190339.3885752-9-clinton.a.taylor@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241114190339.3885752-9-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::18) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f02822-1106-4edb-9619-08dd129f9f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFk1MWI2UWZ0bm10TlptbncyUjh6MjFuUVV4SEpxN25nNE1HdUwxaGZFNXZV?=
 =?utf-8?B?WVpwVmVUUFNPbGNaMjhBQ29lT0Q1UTVwdTRaTitMQ1I5NFFKZzdoeTZEb2pJ?=
 =?utf-8?B?dHdXWUFlbDlla3BDN2lWNVhBTnZIMU1JWlB0OFVVcGg4dkpBRWV3SnpOcHl1?=
 =?utf-8?B?b1B6SFdMMVJZNXIzbW5jUUVaRnFUOUl5Y2ZrRlZoOTU5TDZDUEQ3VG1mR1Nn?=
 =?utf-8?B?czNUQTJwcFlHN1lpVXFqVFJDeWh4NnFGZW5vbzgzV0kwQ1VjdDZTT1EwMVR2?=
 =?utf-8?B?Ti9FSE15Z1pPTExxaE5iQkFwOXRoQnVyVjdTZGU4OER3aEhBdDBIZUFpRW9I?=
 =?utf-8?B?d0tBUUdINlVjeHVDTHo1WlJ0aE5JSGJ0bnczNmJtek9FUkFWWjgvSEdhSzBE?=
 =?utf-8?B?Q0ZTUS84dUFDU0h6QXl3RlhHdWw0MXVFZlRxa2RMSTV2cUFQcUFRRjlZTlpK?=
 =?utf-8?B?b2R3aTBrWGU0YUVBRWVFU3NyaXg5MjlpTGxFSVpDaXpyQ0tneGs4QStpektT?=
 =?utf-8?B?ZWFqbG1xNmVIL3FyTUVRbTRZcW0zSTRXY2d5R1gvSWdrZnhVbm5zakNncWkw?=
 =?utf-8?B?MDZESTAwSGYwWGYyL2hHbEl1L1Q5RndpTktTcitQVnhNcXRYVy9aYnR6bjRn?=
 =?utf-8?B?dGtoMGpDUWFtNkJBRk1WYU5UeWVrd2x4STVOUnY0bG8yRTA0RkR1WTdlMTlX?=
 =?utf-8?B?QzFGbWtaSGUvK0NaeUJlaUF6MEtGY0hONWF2cXdPdmQrNkk1TVl5bnVobVU0?=
 =?utf-8?B?RW1mWkxyaVE4S3QyRndMay91T2ZxZGxTR3dlc2ZOK01MZm9tNkhEWHRKZWht?=
 =?utf-8?B?dXR5RG43cFk5Q0Y0R3laUTVpVDN4Mmt6RkRxZnNpVFl5QUJvZ05OVUs1V0hS?=
 =?utf-8?B?ZWFKclhYOEtjSE11RlVsK3pkSnlkVVJ2amxvQW9sUjBIYVBjRFVIQ05vSisz?=
 =?utf-8?B?dnliT0JudG5Bc3l0aU9tUnNtNzlpbUZCWGlFdEFQSzRhc1dGRUplZmY2bVNR?=
 =?utf-8?B?TWlOWENjQVo4OFFjUUNhVWUyM1VIU3JkTFBocjhCU2ZOMGovUnVOVE1nY1Ix?=
 =?utf-8?B?WEw4S3JPbmVTNHlqYkxlUDBhVktqZENaTEN6MEVWMkUvODBrZlcrVnkvUlJ5?=
 =?utf-8?B?QitTaFlrbGV2OHZoWVpnTHhaemVIbDgzT08zRXpla2JnaFY3Z0N2STE3L01y?=
 =?utf-8?B?dHVRZ0tCcEs3TkJHQ2NTWWVLcHhROW5waHFMTEc3Vk9kOVVqdEdwNHM2bUY5?=
 =?utf-8?B?NThjbFRmQ2w5SUU3Y21BMlVySk1CbWxMMFk4d0s2ZnBuU1l4T3E3eWlhazRq?=
 =?utf-8?B?WVB2R2lJZ1ljYUhjdWJyRFBwM1RLV1BnWk1iZGF0YklKUHkyQlRtK015bFor?=
 =?utf-8?B?dGUzRUErcU5ucVNFNHZYTnFXOWpiTnROOTEraUZSeFVUMGkrOVc2WWx4dmNN?=
 =?utf-8?B?aVdRQlpTemxFRE9SMTlwb1o4Y0RNanQ0OUVBVjJGZlFVVTZFNC9SOHUvVVRp?=
 =?utf-8?B?RzA1YWR5NXNSR3EreXgxalhZWHV6ZnRHQkcwamkzSHQvd3daaHdORGxKNFJC?=
 =?utf-8?B?U3ZUN3prSFlKUi9sU2dKV1ZPNytyTjFuV1RjWGJnT3FrZFVoRXp0cUZySDQ3?=
 =?utf-8?B?UnBOcVVXaTE1d0l1bmFZWXlNUmNvK3BpM2JibzB3R25DOGhvbTRTeEVaaFZu?=
 =?utf-8?B?VFhiVGYzTTNraHhENUY4NDBhYWNSZCtYajNWVTkvRFFPM2c2a2F5bkxZMXpi?=
 =?utf-8?B?TFk4bk0vZVkyL2ZMUy9EYUI0ZlhYTGlUdHVnd3dQOTlWWVRZOS9iMXo3OWdH?=
 =?utf-8?B?eFV2aWRkYTU3anNralcxQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2I2NlFMMFoyYXFJQTlaMmZQN2RGQ1BGOWZ6alhSdFM0aWpLNmx0OXJla3dt?=
 =?utf-8?B?YXN5UzRvYnVMUnZiRzI4dll6a2VlVGhQNDFLd3o3bjV4U2VDeXN5YitKQjEx?=
 =?utf-8?B?NXgyYlM3RERpQWRwbFRCdXprZytWbU1iTFhPQVYzY0hqT05QcGQ4MHkwUXV2?=
 =?utf-8?B?UHkzb1BBN1pKOE5xTVpkd01IS1hmMlRxOGV1L2RySHZMNVhYdnBma3pXazFW?=
 =?utf-8?B?Ny95UEl1OWQzbThrTEZZSGZOY0dYd2d2czRRTU1rN0JCYTNoQ3YzZGlVNmlI?=
 =?utf-8?B?S2RFODdLbFU5dlpJWHRJaGxWTlF6dnVucjgxK2JyV3ZTb2pWQmRUcHkwUjB3?=
 =?utf-8?B?UGVBdFk2SXFZNm9JQzlMejh5cXdsSlBpZ3plRUpUMDFTbGd6YUdoY2JreSs5?=
 =?utf-8?B?M1pvaC9kdXdIRmFHZ3AzVmFmQ2dQeUdLdWhnbFk0T3ExYXZtUlV3RXZFUHFm?=
 =?utf-8?B?NEFSUUFPajg2VlBHYU0yWnpGWkl6T3MwNlNsZE51dTI5OEl1ZjB1L3djS2My?=
 =?utf-8?B?NVFhL3p3YTRpdnNrRTJsNGhGb3lGS2VRc1ZNTG1lN2NrMzFIb012dFg4V3lw?=
 =?utf-8?B?aVJmajJWQmhzYnZlTk11LzZqeU01T09PeE05WmYyUmlIS3NoOC8xSmFySjNO?=
 =?utf-8?B?Wnh4VFRuNFRTeS9tQS9QSjNEbHJmcThJSlA5R2dZNG82SnhsSG1WRXNOcTdG?=
 =?utf-8?B?YXM1RllpM1BEbldlcmRkb25kK0xvQnhFcnljNkp3YmxDSUNpZ0ZGay9aRmVn?=
 =?utf-8?B?RS9qSTNEajVFeEQ4S3RYYnR6ZnJWM2ROdkJGamhZMEUrWGFnelQxTHJzNFR4?=
 =?utf-8?B?aERNYWU0SU9NNmhFVURBNXBoUzVqdTJ1K0YxajNWZUZuSnpTZTh6eGVrSTYy?=
 =?utf-8?B?Rm93TXZ1bGVoeHIzRVZZanU1dCt1YTFpdlR1d3Y1bTBMM3F0MXBLMW9ucW5N?=
 =?utf-8?B?UnV1aWk2NHMxVG5pUlJQMC9YTk05RXJyc2d5cFRPUUNqMW1NcFJDdktjMjZV?=
 =?utf-8?B?NitvQ2Rmb3F1SnlSK1BTQno0WWVtRFh1NXJOUXpDdkNVWnR1L0JoNWFuZE02?=
 =?utf-8?B?MDBSUFg0QUdFanRma2JQZ0pXN2F1QlZtNS9XMUtlOG1XUjZuQ21PNEE3RU4z?=
 =?utf-8?B?bEdLYWlrMkxLcnFzZlptTTVTK0lQK0lpaWYxTk1ha2FRVFR6VmNXM2VQUnZZ?=
 =?utf-8?B?SUhXbWxpdGh6NE5rbTEvanFubktXeG9VeXF3OVM2U1pEU0lXMGx4bUp0bFZp?=
 =?utf-8?B?dEs3WXpQNHRJMWdjQWpGS01xbERSa1g2MW94Vm01VUNMTEtPQy9EVFNMcmp1?=
 =?utf-8?B?VUVVZzRNRU1pLzgzc1ZWMDdudjdIdTF2dVQ2bHFoV2RRbU82Vnl2MkRLVUl6?=
 =?utf-8?B?UExUdzVnMjdWQkZsaGNybWxuUTVvWXRkNytCemZtaHpqL1p1WGFhU3g5Mloz?=
 =?utf-8?B?cFJscUc5L3ZtOFNITVZkbVdiQXNUSVg3MFN0aFBLWFZhTFZXMTZRUEhuUkxE?=
 =?utf-8?B?RE5ocVEvdzU3VVJKVHBubTB5azRTa1dPZDYySjlQeDM1aHd2NlBYQUl6Tkdr?=
 =?utf-8?B?SWtrdGwrRllQaGlOYnBRclBoSzdoNGQ5SmdBZHMxWHFxSDFqZlBiNHgzZk1O?=
 =?utf-8?B?QldBdlVBM3FnaGx4dHB5L2FYcldCSVcxSjlVeU1vZWowZU9jYUdZcUVzNHhp?=
 =?utf-8?B?QTBVa3pvNlprYUg0dTNIVm43alpBbWl2UmVQa1VWUENXQWpCakhsbC9jNkd5?=
 =?utf-8?B?V3BCQ2VUOHNEazZpS1B2Z0MyTEU1ZG91MUVrRjNjVEh4bTBHbWlvOE4yL3I1?=
 =?utf-8?B?dm1IWTBQeFZTeU9TcmJpR1hqWHB0VTJiYklROXBTdGduK0I3TjQyVGpFanNY?=
 =?utf-8?B?cDVTMEtXZ2RUTlViTUwrZ0VtSk1SSG9wYXgveXcrZGJHa1Vsb3BVcEpnbmti?=
 =?utf-8?B?eExMMDJvT2pxbTlxYjMxakZKeTBGbzBtcGlZTTR1cThFZFpUeE5ta2pYVy9E?=
 =?utf-8?B?YkovcVoycnJvMjZHbDNWOGdNeGNLYS9nZ1d4anNJSEF5YmxCY0RNTnBhbCsr?=
 =?utf-8?B?bnhCOHJuVko5emp2Z0dsSzJqVTZKSWtFN0Z1S2ZPZTdxYTh1SmRYZmsxc1Nj?=
 =?utf-8?B?Q2pwaG85OGN5Q296NXY0Q2E2VHkreHlpMlJGWjdaTWdBMTJyelZOZ0EydXUw?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f02822-1106-4edb-9619-08dd129f9f8c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 07:04:54.5764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAMeilFyMNni0KQtaQWBvDkrPFPZGdwQnpBzt5SKAmKR7yK4IF9EVzzm/MGrXEQcH5SUWt2ssgbmh2LtBOm8wMMM4tOD9NoavXb9UxWKyOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
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

On 15-11-2024 00:33, Clint Taylor wrote:
> From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
> 
> On Xe3 display no more support x-tile and will disable such framebuffers
> 
> Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 25 +++++++++++++++++++++----
>   1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index b7e3f7379..8af41caf3 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2421,7 +2421,12 @@ static void setup_modeset(void)
>   	offscreen_fb.fb = NULL;
>   	offscreen_fb.w = 1024;
>   	offscreen_fb.h = 1024;
> -	create_fbs(FORMAT_DEFAULT, opt.tiling);
> +
> +	/* Xe3 remove x-tile from display + */
> +	if (drm.display_ver <= 20)

As suggested in other patches, lets go with <30 here as well?

And we should adjust the below conditions as well on similar lines I guess.

> +		create_fbs(FORMAT_DEFAULT, opt.tiling);
> +	else
> +		create_fbs(FORMAT_DEFAULT, TILING_4);
>   }
>   
>   static void teardown_modeset(void)
> @@ -2542,7 +2547,6 @@ static void setup_drrs(void)
>   
>   static void setup_environment(void)
>   {
> -	setup_drm();
>   	setup_modeset();
>   
>   	setup_fbc();
> @@ -3386,6 +3390,7 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
>   	case TILING_LINEAR:
>   		return intel_gen(drm.devid) >= 9;
>   	case TILING_X:
> +		return (intel_get_device_info(drm.devid)->display_ver > 20) ? false : true;
>   	case TILING_Y:
>   		return true;
>   	case TILING_4:
> @@ -4468,9 +4473,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	igt_output_t *output;
>   
>   	igt_fixture {
> -		setup_environment();
> +		setup_drm();
>   		drm.devid = intel_get_drm_devid(drm.fd);
>   		drm.display_ver = intel_display_ver(drm.devid);
> +		setup_environment();
>   	}
>   
>   	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
> @@ -4774,6 +4780,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   					if (t.tiling == TILING_4)
>   						igt_require(intel_get_device_info(drm.devid)->has_4tile);
>   
> +					/* Xe3 remove x-tile from display + */
> +					if (t.tiling == TILING_X) {
> +						igt_require(drm.display_ver <= 20);
> +					}

Looks like, this test won't run for TILING_X. As, a little above we have,

if (t.tiling == TILING_X)
    continue;

So, do we need this addition?

Thanks,
Sai Teja

> +
>   					if (tiling_is_valid(t.feature, t.tiling))
>   						draw_subtest(&t);
>   					else
> @@ -4805,7 +4816,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	t.format = FORMAT_DEFAULT;
>   	t.flip = FLIP_PAGEFLIP;
>   	t.method = IGT_DRAW_BLT;
> -	t.tiling = opt.tiling;
> +
> +	/* Xe3 remove x-tile from display + */
> +	if (drm.display_ver <= 20)
> +		t.tiling = opt.tiling;
> +	else
> +		t.tiling = TILING_4;
> +
>   	igt_subtest("basic") {
>   		if (!is_xe_device(drm.fd))
>   			igt_require_gem(drm.fd);
