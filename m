Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C81C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jul 2024 04:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D1710E561;
	Tue, 16 Jul 2024 04:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CM/MCmyS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A9F10E561
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jul 2024 04:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721103115; x=1752639115;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DCT1aXrBb+8PzqAJFzk5SI2a0SQYAiiJM5RxzGlE4pw=;
 b=CM/MCmyS70iq96A+JAYEHRtf9inPgtdoG44U9FqTpvJCs62XqWelUvbL
 QnSeAoxGF224g2AAEAgyjvSrYb1R6V/y0/rx00Z8r7KK5rS/o9HxxIjAy
 QY5VeuUiaFy6q6+x5DD/7MnZttppcLtM9jgH2O7kzI/4x3iEYsKS6fFl2
 3T4TUFehT6/xKX1MnVAeCc2XMyaMXAsEPxo7eCUiyh12JTVKMO25W86Js
 MWxktfFoEkao5XAxdYJ/XbZ4t/RZ8E1HFttp96c0rOUj1ETXTeKr/XSFo
 ivZxLbLxAuSDlDPvbIMwT9VcL/g9gm5xtRGX2pJoOiWiSFOdojwNJxqco w==;
X-CSE-ConnectionGUID: 4KrcsFo0QnyR9EJkISjpHA==
X-CSE-MsgGUID: X9zaLvmyRfWAh4aj8p122Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18226782"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18226782"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 21:11:54 -0700
X-CSE-ConnectionGUID: etsWr9NkRB+kjzYCIiMDMw==
X-CSE-MsgGUID: Sfi6Wb3rQpGi0I9QNHpHEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="73099253"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 21:11:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 21:11:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 21:11:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 21:11:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bdocp1zK7z07XO5vifpZhuexqpA/iKuXIafPvj2RTFR7oAAOxYnmot8/mE/T9oNfHCVDtZIWiE5Q+uPccwK4MlmZ8YjS+qLwb5hdq0T15H5RWQbNpz8+eQf4QNK2tDceVg4nldHQVtue7CUiCyFu+9mOX+3OsgHWY5vYsXecyhr9aeRx++obUIvudS4pRf2RBItf6AXcGFhsPAV+m49OF0bAEyBztBuJyvX6IEJsIHEG/HKH9Ru/8Oq94YkUGhtMTREC4vo7KLvtOTirH7M3ofg8Mj8O+Xt1LZmX59hPqbRDh3jD5cqEItwXS8AI0yptloOIR6LV1ZV39Pc+KOTWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFQ2p/gLUgDi5ytGQ40VhmGApayr/lbszUjBln7WPwE=;
 b=nsQ4EQorNwqQ0XijVGueOa7asKqGQQ4O3R1lwzR1D2qYRtHtQBV3dEE7HnZ+IbG1rwjZjtDzbSmr4VZ92jQ/zTWiFUzsv7DaGRJK3B/BFKkYsHtAOA99XsxHLY2OSswb5R6KnSxQlS7pV/KEFyJLXgdukF6YApjiAXTs7xVwvIA6ndED6zB9Zn+ZXluMz+8B9kILH8l6ScsR9Sevrq3UJv+SVCRjTs0679A+ChYr72zcnMobTS9fSFyo4yMS8ubKodE5HMKrmz2xrNw41j3T9gnDF1EcWSDU22mrx5howwKwmdWumP72S6Wug+paUcQqytxRgJAchum7LK2lgmyEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB8149.namprd11.prod.outlook.com (2603:10b6:208:447::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 16 Jul
 2024 04:11:51 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 04:11:51 +0000
Message-ID: <cf5945ea-8794-4dc8-8e9b-1eeffb9833af@intel.com>
Date: Tue, 16 Jul 2024 09:41:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/5] tests/kms_plane_scaling: Update the single
 plane scaling function arguments
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
 <20240715154628.583682-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240715154628.583682-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 2016309b-7677-44e3-50a2-08dca54d6b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk1JWXdZWVpxM2NoSmYzenJudmtENXY5cXZzQ2k1UWNCR0tMY2E0QS9tOWg4?=
 =?utf-8?B?NjVBL0xLeDdSc1EyNk1UZTFWOTQ0REVhYSt1MUJva3RTWGxFY3RVZTNiT1RP?=
 =?utf-8?B?bEhnUFpoVStuM2Z4MGxIaVN2elYvNHd6cUlzUWx6d0I3enJzQVdTVXdBSGJ1?=
 =?utf-8?B?TjFNY28xTWViR09PSXgxUG5rSkFZMFBrMlk5Z2daTlk2cFp4S3RWc2ZuNHdm?=
 =?utf-8?B?U25RZ0d2dXd0SlpKVWxacXhQekoyY2hpU3kxWHc4WmNac0ZHODE2Y1poWEJz?=
 =?utf-8?B?V0JqOUR5aDZ3WTBGUU9MN3BCTFFDZjM0OXVsSFJwQjUzMnB6VzlBcGIyQjlP?=
 =?utf-8?B?a2VwOSt6L1Z6c3lFTkxKSld3dU1WdE1tN3Q5RU9XOUpSUi9BUkQ5S0t3VVVN?=
 =?utf-8?B?WEtYYlQrVE1GQXdVcVVPaWl1UklOdXBjQmhlOGVTUU1CRHpxbkNtejd0L2ZQ?=
 =?utf-8?B?S0hBZTB1dE1OOVh2clpFM1VwaTN1MVcrYStybWxzTTBzMCtiRjAxcjJ5VzNH?=
 =?utf-8?B?aGRKZkw1UjFzRDVzMlZmcXd6TEIvZDZoUjdMQmlWRXlGN3BXMS8zK3dPQWRy?=
 =?utf-8?B?SjZvMThsZk45bFAwQkMzWlpOQVJzcmZXREVxaVBVNWlFMXFrVVJBMHdjSFJU?=
 =?utf-8?B?ZDE4OW1TMDRuZk9YN2Y2VkxJTjBObHNGLzNVWmNtQ1pyd0gyQ3VqWkx1RlBC?=
 =?utf-8?B?Rjh4U0twTkpCR25GVnZ2cGZQMmpDL0hqREdqUXVzRDJwS29mNWdNWCtxTUVC?=
 =?utf-8?B?Q1FOaHBkTHc4OC9oa0FLL1pSYThnM2ZxTkw3UlZiMHVSRW1hUU1nUlVRczdq?=
 =?utf-8?B?RnBOdjVCbTJOZW5hRVYwamNoMGFONzFxalo2cC9teUg0Vkhza0dRVTBudXdO?=
 =?utf-8?B?eGh2WjlPdVN3bi9iaVpTSHNzdGxFUldhOEU0ZlFXbk1RSkh0cnFPNXoxRVZW?=
 =?utf-8?B?MUI5c3ovT0s1bDR2L0VwNnorV2pEcWZrZFFiVG5LTVVtT002VXEvZWprcE1y?=
 =?utf-8?B?TEZNdS9RYm5HSHRQTmZtUGxRYUdUc0VzZnp4Yy9WcXgwdXdIRk40TVZFOGVL?=
 =?utf-8?B?RkRhRXBHL1BaL0JhR0dVRHlWNGJKZ3VRNzZ3NDRJd1p0bzRNRUUyVnZzRVVF?=
 =?utf-8?B?RndnZW5MMjU4OGNnUUZ0L2NUSW5nQWhZWmZhRTFtc2Jnc2dZUXZQRSt6UzV4?=
 =?utf-8?B?N0JVVE55TkpZQ0NmN3oyVEJLeStCV3FUSGJ1b0FtT1JHaDBpd3ovaFZCWW9m?=
 =?utf-8?B?ZC9kazJHYytXSnEvdTBjNUc1MG9QTUdFeXhiam51bkRLWWFWUFRraVZMWUVL?=
 =?utf-8?B?N1NOQ01LdUs3NHZjVzRPVUNVRG1CNkNBcFJ3NU9QWG9VUkhqVk9hTGU0OCty?=
 =?utf-8?B?NGE5RTFXemhuTEs0a28rMFVLUGpzNko5UVNrNS9Xc2YwcVhMUC9DZ2hrUm1G?=
 =?utf-8?B?cmFDK2gyR0xmaXlVdkVQR0xYbTBPbXpFcXNoTng1cGowd0tZYVZSb0JUZEEv?=
 =?utf-8?B?SkpvUEtiYjdVandHY0d3Tmk5QUZiWjVxV3E1QWtlK0xOTk95VmZhUStUM2M0?=
 =?utf-8?B?bXdKOWlLZnJ3SHRnRFpKcTQxOW9MZ2c5SXZZWVpnUXN4cXQwOWU0MXJrd2lM?=
 =?utf-8?B?MWd6elBIa0xueEJ0bkNxZmdNQm1PY215ekhFWFNkQ2VTTTI3MU1oendmSkx3?=
 =?utf-8?B?R1NWNjlxbEFLZnl0VUpDaDhLZTFxQURDU2J3OExDOVRiUGdtQWdDOFkxWXh5?=
 =?utf-8?B?SU91MmYwQllsWG1UVkVQM2kwRjl6SUpjQWJubnJwWlhaVWs3a2QyT0JSbG5i?=
 =?utf-8?B?NkZPY1VucFVGWHRaNGRkQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW5JejBpSGs0ZUpURWtlVU5QcVRRQldLbG04NWhqN2FVVSt2UHF4ZGwxcU1o?=
 =?utf-8?B?WDBITTliNXZ4cTdFWW9BTFA4eVA5eEFwaUQzS0prbUsrS0ZRNzFsUGtzdFEy?=
 =?utf-8?B?WituZXdKUUZUQ21WZ1BkMnM3d0k3RVdPTmlzVUNpVm9lN2JqQUVIVm9YWkJX?=
 =?utf-8?B?K2RMSExIZFMwUk1pSGxySGtwQklmMk10TjdXSFpOTUhhdmFLQy9IVHZMRWdU?=
 =?utf-8?B?OTdHSkFFUm43NDIrWTNzMjZFL3hmZnZmdDdsMVpSLyt3a20ybDF0OHhWaHdy?=
 =?utf-8?B?bVdRbXpKR3dKQlAwbmc3M3AzZmZOZ2RkREIyM3FpK3QxdnVFeTFjYmd0Visr?=
 =?utf-8?B?UlRjblQ3a2RmK2pMWVBZdktVbjA3TUNCM3E4SjZOblhBQW15V2EzZTV4aGFu?=
 =?utf-8?B?U0hyVXVrQitUcEVTa2JrelE3MzNWQ21xazhpVmdQa09QMXF0VDY0WVBXc0lZ?=
 =?utf-8?B?SmlRbHhVdDNQOHI1Y0tyYmp0UTUvWEFzMnA0TnZZQm0wVzhjeVZ0bGZyS2gw?=
 =?utf-8?B?MDAzMngzWVZIRWovRm5wK1ArMDhSY0xZY1VGNHNGYUFQbWo0dlpNTmFjUUFj?=
 =?utf-8?B?bDgvWUpsY3Y1S0w5YmFqRXFSWnJXbDJ2T2l5RDgxTmpidWNoV2NlblRMQ2JW?=
 =?utf-8?B?elhoMyt4eVBrNlF1Z1lKM0tQVzllVTI5YjUvYXQxS0Q0NHRDVW01Mk9ZS0ZE?=
 =?utf-8?B?bXN4ZWdMaU5qQk9BMFlSc212ejFudDhKRzNiVWNqNktVdktDTkI5RWFmRFEz?=
 =?utf-8?B?TU84QVFvaWI0cEhoaXVQTXBlOXpUTUFKUTBjaDFTVnJyRmNvRDI5UzIwazUr?=
 =?utf-8?B?YUhEZ2VXV2d1MkQzSXlhTlFpLzlBS0laaks3eUdWeUVIbnpRQkw4U2loalFl?=
 =?utf-8?B?ZjVJM1RaOU9jL1ozNnhWOUlMeTFTd3FhSmZLTE9OZUZvMVl1UXdveE9qSDFU?=
 =?utf-8?B?VlB1QlJ5M01mRFRhenk2STN1dFpOMXRkbXhCV05kZ3BkdGV4VFBaM1MrME1Q?=
 =?utf-8?B?Z2ErS1RzT2VjZHh6OGVNcDV2V3ErL2dUZU13MnpjcE5pQXJDNDFDSTE0eGEr?=
 =?utf-8?B?Z3EvYXlUKzE4cXNMSWN3a0JEU2tpa05QUmtSNStvZzhKUWpFNmtReGRkU1JX?=
 =?utf-8?B?SVpLbFdjTFk1RnZxSDEyRkUvN2JQNmsrZ25mU2p0M3huZDJvK1ROL2gxdGI3?=
 =?utf-8?B?bnFjbkdwVHhodjhpdVluRmVNMjJrcFdSdWd5ZHdDVyt0d1BmZ2RzQ1l2STM0?=
 =?utf-8?B?MEpoSjhIVThmQlRVODBmS2d1V0lXeGJoaHRCRm1LZlNZbE1QUFJ5NGx2L2Z2?=
 =?utf-8?B?b3NuL0VoVU5sTHhkRlQwUEpJNjVhSjNNQ1Y2V0txTXArTjJDTnMyRkpvS3J6?=
 =?utf-8?B?U0FDd2h1OHlBWUo4ZTBCejdSVjJTVndXdEJkeDhweTV5MnlsQ3hvZ3dkUDd2?=
 =?utf-8?B?UDkxTThiZGhwNVFoZUVGRGFJTklWeDgvbURvM2xuUTk4YVFTRGJSSENJQjNy?=
 =?utf-8?B?WDh3WDdaaEMwZVU2dkhITGdCQnBKdVI2eU9KR1BZTjBQWDdKL1hEU0N2Yk5N?=
 =?utf-8?B?WUVwempyRjNSN3kvRDNEdVViQ0Nrb0lWcVFvT1BEd0JDcWdNSmJPbDVzL1Yy?=
 =?utf-8?B?TjM0VUpvQWVQUTR0SW1TRFV6dXdBUFh4RVFsZkRJVzRIUSt1Z0ZsbVM1d085?=
 =?utf-8?B?a3ZkVElLTmFXdkg0WlUyQk5EM0haSlptNzNaaUp5TkdZMStKMzlEWFc2eXlG?=
 =?utf-8?B?WWFiZWp4QkkzUWtndFZoTXdzSnVPc2g3K1dLc3o5RDNQNktYc3dLUENqL3JE?=
 =?utf-8?B?K0NWcytKSGpYYUFJNmFFR3pGdUpqcEY4SFp0M291NEhETXR3MGZMV0hzelVG?=
 =?utf-8?B?c3J5VTA0QjJMaTFXWlBHUE1DclBLOXk2QkIxUk5MK1lOeDBUV2ZoTnkrVVhB?=
 =?utf-8?B?WnNTdmw2NWdxOFE3UUFZdks1a0xXMDV1NjdZdXg5MWIzUmZOMkNwTE94Nkwy?=
 =?utf-8?B?cDYrdUJvdUVKZGE4UXRoa3laL0l5cWFHR3ZnalQ4aEJkd1VXdW9vNUZKWUc1?=
 =?utf-8?B?U1M1M1RhdFQ0cUc1TmZOTWs1MUozUTNVckRjL3RqUDBEN0pYL2JqYUtRN1Qz?=
 =?utf-8?B?OW85MGlNNE5CbllXMXZONVM5QmVIdnlyL2ZxcTlubjNWeDdkMkRDOCtsTlUw?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2016309b-7677-44e3-50a2-08dca54d6b91
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 04:11:51.8805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TgxLX844FFXj/4AnbJzgOb66PP4r3v36tLYjqnC0YCYw5YOey0n869AetHNv0AMbf1+EWhzel2Fe+sOy+nwIuDd/x2d25wSH+Sy1x/9hZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8149
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


On 7/15/2024 9:16 PM, Naladala Ramanaidu wrote:
> Update the helper test_scaler_with_modifier_pipe to use a scaling_factor
> and is_clip_clamp flag instead of explicit width and height parameters.
> This change simplifies the function interfaces and allows for testing
> scenarios, where we need to recalculate the width and height based on the
> display mode.Adjusted all function calls to match new argument order.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 61 ++++++++++++++++++++++-----------------
>   1 file changed, 35 insertions(+), 26 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 3f63d3cf4..f5efd13ef 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -569,7 +569,8 @@ static void cleanup_crtc(data_t *data)
>   static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   					 uint32_t pixel_format,
>   					 uint64_t modifier,
> -					 int width, int height,
> +					 double sf_plane1,
> +					 bool is_clip_clamp,
>   					 bool is_upscale,
>   					 enum pipe pipe,
>   					 igt_output_t *output,
> @@ -579,9 +580,18 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	drmModeModeInfo *mode;
>   	int commit_ret;
>   	int w, h;
> +	int width, height;
>   
>   	mode = igt_output_get_mode(output);
>   
> +	if (is_clip_clamp == true) {
> +		width = mode->hdisplay + 100;
> +		height = mode->vdisplay + 100;
> +	} else {
> +		width = get_width(mode, sf_plane1);
> +		height = get_height(mode, sf_plane1);
> +	}
> +
>   	if (is_upscale) {
>   		w = width;
>   		h = height;
> @@ -693,7 +703,8 @@ static const uint64_t modifiers[] = {
>   };
>   
>   static void test_scaler_with_modifier_pipe(data_t *d,
> -					   int width, int height,
> +					   double sf_plane1,
> +					   bool is_clip_clamp,
>   					   bool is_upscale,
>   					   enum pipe pipe,
>   					   igt_output_t *output)
> @@ -716,7 +727,8 @@ static void test_scaler_with_modifier_pipe(data_t *d,
>   			if (igt_plane_has_format_mod(plane, format, modifier))
>   				check_scaling_pipe_plane_rot(d, plane,
>   							     format, modifier,
> -							     width, height,
> +							     sf_plane1,
> +							     is_clip_clamp,
>   							     is_upscale,
>   							     pipe, output,
>   							     IGT_ROTATION_0);
> @@ -725,7 +737,8 @@ static void test_scaler_with_modifier_pipe(data_t *d,
>   }
>   
>   static void test_scaler_with_rotation_pipe(data_t *d,
> -					   int width, int height,
> +					   double sf_plane1,
> +					   bool is_clip_clamp,
>   					   bool is_upscale,
>   					   enum pipe pipe,
>   					   igt_output_t *output)
> @@ -749,7 +762,8 @@ static void test_scaler_with_rotation_pipe(data_t *d,
>   			if (igt_plane_has_rotation(plane, rot))
>   				check_scaling_pipe_plane_rot(d, plane,
>   							     format, modifier,
> -							     width, height,
> +							     sf_plane1,
> +							     is_clip_clamp,
>   							     is_upscale,
>   							     pipe, output,
>   							     rot);
> @@ -757,8 +771,9 @@ static void test_scaler_with_rotation_pipe(data_t *d,
>   	}
>   }
>   
> -static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
> -					       enum pipe pipe, igt_output_t *output)
> +static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane1,
> +		bool is_clip_clamp, bool is_upscale, enum pipe pipe,
> +		igt_output_t *output)

Align with parenthesis.

Otherwise looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   {
>   	igt_display_t *display = &d->display;
>   	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
> @@ -787,7 +802,7 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
>   			    can_scale(d, format))
>   			    check_scaling_pipe_plane_rot(d, plane,
>   							 format, modifier,
> -							 width, height,
> +							 sf_plane1, is_clip_clamp,
>   							 is_upscale,
>   							 pipe, output, IGT_ROTATION_0);
>   		}
> @@ -1307,11 +1322,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -							drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   							test_scaler_with_pixel_format_pipe(&data,
> -								get_width(mode, scaler_with_pixel_format_tests[index].sf),
> -								get_height(mode, scaler_with_pixel_format_tests[index].sf),
> +								scaler_with_pixel_format_tests[index].sf,
> +								false,
>   								scaler_with_pixel_format_tests[index].is_upscale,
>   								pipe, output);
>   						}
> @@ -1332,11 +1346,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -							drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   							test_scaler_with_rotation_pipe(&data,
> -								get_width(mode, scaler_with_rotation_tests[index].sf),
> -								get_height(mode, scaler_with_rotation_tests[index].sf),
> +								scaler_with_rotation_tests[index].sf,
> +								false,
>   								scaler_with_rotation_tests[index].is_upscale,
>   								pipe, output);
>   						}
> @@ -1357,11 +1370,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -							drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   							test_scaler_with_modifier_pipe(&data,
> -								get_width(mode, scaler_with_modifiers_tests[index].sf),
> -								get_height(mode, scaler_with_modifiers_tests[index].sf),
> +								scaler_with_modifiers_tests[index].sf,
> +								false,
>   								scaler_with_modifiers_tests[index].is_upscale,
>   								pipe, output);
>   						}
> @@ -1381,10 +1393,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
>   
> -						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
> -							mode->vdisplay + 100, false, pipe, output);
> +						test_scaler_with_pixel_format_pipe(&data, 0.0, true,
> +								false, pipe, output);
>   					}
>   					break;
>   				}
> @@ -1401,10 +1412,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
>   
> -						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
> -							mode->vdisplay + 100, false, pipe, output);
> +						test_scaler_with_rotation_pipe(&data, 0.0, true,
> +								false, pipe, output);
>   					}
>   					break;
>   				}
> @@ -1421,9 +1431,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
> -						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
> -							mode->vdisplay + 100, false, pipe, output);
> +						test_scaler_with_modifier_pipe(&data, 0.0, true,
> +								false, pipe, output);
>   					}
>   					break;
>   				}
