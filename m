Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552E9606A33E
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 06:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bmJxhivu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EC910E0B6;
	Wed, 11 Nov 2026 06:30:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C62010E0B6
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 06:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794378552; x=1825914552;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tXTUbeoz6yXR4HKNB63iU0CjdpdoaLsW0z02Nb/10cQ=;
 b=bmJxhivuvICRnenmYY2oZdLOYWD8B1GtRSwWTRD/pymJVTa0BTw+ONh/
 da7qd3N1fet1uFXTAIL4xVsj1yLPZ/K+H+nGpk8MxrKOzNb1O1J2q2aaK
 Z30ws6rESiEbXNdc1V7Ceyl93r+GCoG4Zy480af9XzZNjPj3qTE7mIwAR
 DtUgrAgSKeaQoTlGav0q5HhhlQDIfOJRcxNhFXPmoFUcl/9Yc1P654eZB
 9unI18JPDsXx406Siy1ztfMRerQQ/ZZ3J/RtVr1vt/pwkVJbL4dZwLjQK
 qe0TPvDaY696SYUVQdGUmS24RDYIMryhRAQGPtkuTWyucLBhee1ny552w A==;
X-CSE-ConnectionGUID: fXujSc2wS4Cmv6kP0RKNzQ==
X-CSE-MsgGUID: 3Qn3fhsORoOs1vfzf7Ibxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3052886"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3052886"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 22:29:12 -0800
X-CSE-ConnectionGUID: /WPBixVmRpqWdGXi/I05Mg==
X-CSE-MsgGUID: S4bhxtcwSIitUmTNp5ZkcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8520396"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 22:29:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 22:29:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 22:29:11 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 22:29:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+CHWPkmLDtZ826iVZv+CGzDoYBGOVKc3iPUlgq5L/8xqBg5JSvz/iHV4x0st/bM965DrG5UyrIbvsqbUjM6lR+fIl+Z19XsXBkDTNvbguhGLmXhOokrVpM05DvnQWMagcSWLwtF09IWG6d1dmXdf3PFJa6rBQCk2yCVjKE2UJoJupqhDHTYUU3jksGUfUdQmmB/eEzhj1zkVufP2CSuP4jaRR71R6fl66Ha18YMAbkEFi+ejwZcVUlfqbjGC9dhqHBESOt4Ynf7dtHE5OeykhdJvqmsHYBkzMsypOi63RoPxdfrcJQ7v1tPPst6HGFIk2PuoWWtuaOP+I4fQKQGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGISV4k7Bc7QMvVj1o6v2UAYMDG/fD0XpYEpzVB50Fo=;
 b=xl6gg8+/UVX2NKipyFVEUR/+6CT+2mTQBUaXp7W5pBUsgfXZSiwyetd1PtNmCxSaxzVbtrC5bzjVz/G/dOcJRMiWgz0CvZhNnD2j1+HNWf74IgSCVOkX4zZZbrnJy4iscXoyhGwyrl5h0xPRg0qFE84TF1TM9JwVmMriQCZhmCVK7t7gnen+yhXDo1dI8gVymfIW61RhTXwhsKhdg1pl7lp0jDqc3Xp1VtvDJXrQaP7z3gGlmbKHuaWp4vbGUw0wTZzXLoHUwVZ+YqdIau/NIBaPI5c216amdRW4UH/ghv8gt25Lj9tnIhfJs13cdW6xg2L76mfN+ZSS2hn9Bg42Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW3PR11MB4540.namprd11.prod.outlook.com (2603:10b6:303:56::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 06:29:02 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 06:28:56 +0000
Message-ID: <295f9446-9602-4a5e-b4a6-d9243cea2c89@intel.com>
Date: Wed, 11 Nov 2026 11:58:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Continue after unsupported
 eDP pair
To: Mika Kahola <mika.kahola@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20261106093819.2897358-1-mika.kahola@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20261106093819.2897358-1-mika.kahola@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0157.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW3PR11MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: c4fc54f7-021c-44a5-0ad7-08df3fbd1015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|23010399003|376014|18002099003|22082099003|6133799003|3023799007|10067099003|11063799006|261028144727099003|261102123227099003|261021121427099003|261021123027099003|56012099006|261022105027099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: /ktUGvjyY9jjW56bYiApKHMFFx1D7QoGH0aaGE56rK2zFGqp1fCsvNXuMyq5W21WWJonHckEoJIykn48hpRIt7vqVZcIf40wht/SgVHHkDsINGZ8VVyj/pf6GJ/mmJKxsbpLGSG6Yp0PDQ2FIJElkQsxAp3EnZVxpAv5oS9YOFghQqwgKGbTS7hIHvNaWSSav/sgN4Hp+S2t2DkkdN0x56wXcIV6rmJP3I42tbEQ7G00C519XN/9tLxM8EHfQCool4URxi4G3Hl4yEUURM15P4gDUjZrOa9NThg3xD/5g6seftedzXSCNrEa4KQ/bccdTB5H3UIT6xCEick18uqy1+M54wsTMiwPYBKiwFp4qPdbtkLWTsUsDrlJepnfO4tCOWOglP59Pf3MhkaJxb/M90SGylqgAQaGe0mGIMKlEvtRsI8R4FP0D1gbIq1tzznsGfoVOTlijklgrRFUvjf7iHxL8TFAl4AVzENwEJc9SyyxzotpDhu+05E33uHPfTLe/gCr2Dqki9RHSzOx1wA8xTZ3TBTOmqQp+q5mG0hEmp725UcMx2TfDj/4HSRgFrMR/wwe2piOA3P5sJGRPbPUsjBp1Ey5QXdwS8RnF6dtGRWNZKcQclrHryrBLHl1vGWCIOAfVATreCvmbkkDhVJgehvF14ngYHBTE2oeMRONP+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(3023799007)(10067099003)(11063799006)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(56012099006)(261022105027099003)(261026140227099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWxOcHh0RzBSU0RXVGZ4TXZkNmRRR2FEYXhMd2EvRXhQY3REYk9KWFpONEly?=
 =?utf-8?B?bm9HUkx2NGlvOTB4Ly9uRnk4QXpLM2toL0ZreW5WUW81TlZNcXlPeGlKNW01?=
 =?utf-8?B?VlF4NWhrcVAvZEZhbnRuMVNwU3FjMEwvajlYNnkyL3EyN2hoQTRjQ0gzSW5H?=
 =?utf-8?B?dTY2YTNRd0VRSm41cHdzRVFiMC9kUFF2RDkvTmJHRHU1Qm85ZlVaQjhiaFVT?=
 =?utf-8?B?Mmp6WUJwQllsWUQ3ck1qRVo3YXNWalZtWG9ZeW0wc0psZm1Xc1N0aHlHSlBx?=
 =?utf-8?B?TXpFSHR4YlRFNlVJRkx1TEtSdWxCVm1nWXduSXdWbldPVStSb0tZbVRIYWtS?=
 =?utf-8?B?UEUxUVEvYkVPR2Y3R0ZmM2p6SnpKWnV5SmQxZStCam5kOTdxL0NjV0lBWnVZ?=
 =?utf-8?B?YVlnb1BKWUErY0ljSXlRZWJEdXpXVzRTVHFPS3VTbzlTcmZoeXBGdWM0d1ph?=
 =?utf-8?B?WmE2YW5ZdXc5b25ZRGdxTGxnSitPZUJJQkp4K1lWQ2IrT1pkVm92NnBWbDNV?=
 =?utf-8?B?OERuVk9pMXphSEY4a0U1OVRUU2JMSUFyOUJFRFNvMjBseXVPVkJsUDJybDdZ?=
 =?utf-8?B?Q2p3V1BJa00rZ2VDbmxId2NTakJlQmV6WUhwNzBZYkg1dThRUndTc2xpUTlB?=
 =?utf-8?B?L2VCUldqNktTV3JXUGdrSFJpRnQyWXpPSURsL2FXbUdibUZIVWhYYnlJeHZN?=
 =?utf-8?B?RFh1QzVsTk1rMGNWVHpVdUQxbWE5UE5sTVp0eW9oRlJ5dDFVbnNaYytqQmtI?=
 =?utf-8?B?aXRiV2RLbVE0T1ZMcUVoS0xIZW9DQzMySWVjcjI3WHpnczJKQnJyQ3RnMW1M?=
 =?utf-8?B?YkhaSGVISm4rYmtRa1gxTVY0QW9PdVBMYlJ1WmdBQ1RGdlhsV1d4eDh2d1Ro?=
 =?utf-8?B?SkFjdnlQT3FQOVhNYzNIcDE2aEVPSzU0TDYyQlVETlFmWVE1VEltSTJZRXdU?=
 =?utf-8?B?MnBpRWw4Mzl1a0NXQVM3UVduUkRLODZBTk1jNmZ2UDZzbmN1c2pxY29sT1VC?=
 =?utf-8?B?azlVNnJCUGdrekhrNDVrYURGOTgvdmpTRDRBWVVCMGFBZVJqQ3dYSWFNeWcr?=
 =?utf-8?B?TnAxTlRCQkRRbjExbWlTM29raU1VRlNPdjA5YTh1SWs4ZHpyVWxSVWJoK3FS?=
 =?utf-8?B?UklCbmJURFJMdEZwenNuc2tHbUZQZWp3ZU1GSnZKWkk2WXlNUjVXeng1YjhP?=
 =?utf-8?B?UVNFSDRJRzc2b3RBMkZqdU16WWFCVWp6cUdpRHpXRzFVQ050L2t2QzV1S25M?=
 =?utf-8?B?eHBqLzFucGwreWRJeUNjTXUwNmN2Um0xVnJHT296VXZMc3I5WDZ1OTZYbE9s?=
 =?utf-8?B?OGZRNjk3MWI2MDFwZ1pvaDMvT252VU9mdHc4UVlmRnhpMndVVkdmcGlyOHBx?=
 =?utf-8?B?Uk5ONU5DeG9ZKzVCVEJzbFRQM3luaExuYW0wSTB1Z0JOWklCMCtnSVN4dGpT?=
 =?utf-8?B?akc2dDNjMm84d1hMWlpWZmVjckRLMXFJcUh6cnU1c2M0emdRdStzRzFlYVBj?=
 =?utf-8?B?UHdwUE5SR0c4VVA3TWliay9SSlZmUkt4aTN6YlNpMmQrTTkyajgxN09ST083?=
 =?utf-8?B?VlJOSkJjMG9hUEZGMktFMyt5czZXeDdDZDhiUkF3U0Jrc1ZmWUV5MU9Sc3JL?=
 =?utf-8?B?Tlkxd0JuZnhPSmRXV3lyd1pjQ3M2T3IxM0k0ajZ4ckRBZTFGbzNOYWVERWVN?=
 =?utf-8?B?S3RralQwcm1aNGV6WHlqMDNvQVJVbTRGSkhaT3V5UktZRUNSRWtlYU1BM1N0?=
 =?utf-8?B?U3NPaS9pUTJyL3hpcEY0WEkxUXdNcGFnRUJKZ1pxRkVsWGY0anAwZUMvVGYx?=
 =?utf-8?B?M1BHT3lkeE5YMVJlZ2R0K05HcS92a2RBRHFEazlEZEtkKy84d2RLbEtkaU9h?=
 =?utf-8?B?WkdRWVRSWlNmaXE1dEhVZ09CendXTWg2N1JFVkh3dlN2eFduaHhiekhSV3po?=
 =?utf-8?B?L040aWhNcFBNMDhrRFBSRHowdVowSUxzUmVUeGJpNTRMR1NQM1hCN0FRMW9O?=
 =?utf-8?B?Y3k5MGNsYWNpTEVveE5vVVpVQTNnSW1lMWErOXBPaVdJTC80ZmJLbGo2bU5Z?=
 =?utf-8?B?QkhhV2szcUxvaS9IUXZRaU5zUTBqRjVETkx1MmhXQzhJNmp3R0tCQi9qSWlD?=
 =?utf-8?B?bFZ2cDhqbVlzREM5N3JpU1YzSWFSeGdaSmx4OVNGakp5MWdndVlhVDliODZt?=
 =?utf-8?B?alNqM0ZLMkpOMGt4ckZFa0ZxbG1pL1FBdm02VzFkRHBMcTB0QktqbnFiL2Yv?=
 =?utf-8?B?dDVpSUs0ZWpPemdlbjlrZmVHNWhvZStqSy9iWGZzZTdHZTZaRStHY3hFUHVG?=
 =?utf-8?B?UVcxdGk1VnNRTzlZeW1GS2JHNHUrMXMwOWdZVDkyM1JMNnBOc2o1QT09?=
X-Exchange-RoutingPolicyChecked: w5UWPHHa8H2MZBLVMlOEYspVeFUSk5DumB+w2e6Mw0P1U4+w4IU2uINqtvSRuP3trFhxyiOqnqXXOBX8Fay07nlV8nHICMWf68dx0OS1TKBpTTZE7GDwivEMFJbbthok6kzmdEVWvGLXjOW4sznAfzGTNM5mWiudGkoUFxtVrjuYHRijeFSTFFTuBEiD9BNvvTWjV2e3HjK1pLHW5qkA8wp4lhfT/evDIceQExad/FoST42O+eEQXHQsjRSnbP2+TwEHE4XC07h1cjEexD1HGorZr/tK7QbTBAn/D1GseCXowqow2j6uTsh/oFHucsHZZRo2TbdmwOhM+AXt3dfm5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fc54f7-021c-44a5-0ad7-08df3fbd1015
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 06:28:56.2200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSsfM2q1rofn9leFgg4Jx+tvjQ13GW0ZkDnrslfzHc4ImwcJKjnZwYP7/EHK6K/sRbXQ5AFKgDwibHUAh8eYrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4540
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mika,

On 06-11-2026 15:08, Mika Kahola wrote:
> Continue testing after the kernel rejects an eDP joiner pipe pair.
IMHO, we could add a little context as to where this is change is coming 
from.
>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>   tests/intel/kms_joiner.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index fce24f2bd..924fd0f1d 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -277,7 +277,7 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
>   
>   static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
>   {
> -	int i;
> +	int i, ret;
>   	enum hardware_pipe pipe, master_pipe;
>   	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
>   	igt_output_t *output;
> @@ -301,7 +301,25 @@ static void test_single_joiner(data_t *data, int output_count, bool force_joiner
>   			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>   					      DRM_FORMAT_MOD_LINEAR, &fb);
>   			igt_plane_set_fb(primary, &fb);
> -			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +			if (force_joiner &&
> +			    output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +				ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +				if (ret == -EINVAL) {

We need to encode the full restriction that its allowed only on PipeA 
here rather than just a blanket skip on all pipes including A/B 
combination? May be instead of this I would suggest even just skipping 
other pipes if output is eDP.

Also This check would be needed for other cases with eDP as well, so 
this check could be added may be somewhere in the setup_pipe or any 
other initial setup functions?

Regards,
Karthik.B.S
> +					igt_info("Kernel rejected eDP force joiner on pipe pair %s/%s; continuing\n",
> +						 kmstest_pipe_name(pipe),
> +						 kmstest_pipe_name(pipe + 1));
> +					igt_display_reset(&data->display);
> +					igt_plane_set_fb(primary, NULL);
> +					igt_remove_fb(data->drm_fd, &fb);
> +					continue;
> +				}
> +				igt_assert_f(ret == 0,
> +					     "eDP force joiner modeset failed on pipe pair %s/%s: %d\n",
> +					     kmstest_pipe_name(pipe),
> +					     kmstest_pipe_name(pipe + 1), ret);
> +			} else {
> +				igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +			}
>   			igt_display_reset(&data->display);
>   			igt_plane_set_fb(primary, NULL);
>   			igt_remove_fb(data->drm_fd, &fb);
