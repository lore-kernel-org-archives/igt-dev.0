Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59BCCCD187
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 11:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469D210E213;
	Tue, 14 Oct 2025 11:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anNwP5L2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F4A10E213
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 11:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760441332; x=1791977332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9g1yMp9rKskiC+1tEIgr8rns2ZaUAxKahHp6hKmIAic=;
 b=anNwP5L2q+iH5qGkrSgGQ3MB2AbKKnMwy6L9kMOovtcm04iaRJG2fCRt
 UB8OAHyN2e7CIId16roZpJiFNK8r+Om7ZpgmaZhMvsGqV223pR8WjXxiB
 70BF5Z7VHbMSpvyVNZJhDgLATzs35pXC24xoCSvrD2L9woAeROEkAMDD3
 vPP7Lf+WrDtMO0M6kuZmueaGakqlg3kEQNYSrgCQ0DtzzzLCXmbhPBCPX
 wBo4YpPV2mlCnIxxKNplmjyN4Vbb5ASE3RjaU15cGuMPJe6JpKmJVFghr
 8TAEFCGE1T6e94qN+9rpDWJ1SKZJDDImxMGMVRA96bLVZO8+nrk0SL37t w==;
X-CSE-ConnectionGUID: FAaYfhK6TcOQErrRPjx91w==
X-CSE-MsgGUID: yu2H6fuST2yDzleHFGtljA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66423593"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66423593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:28:51 -0700
X-CSE-ConnectionGUID: WUIcNKb0ThGN1hek/NJfgg==
X-CSE-MsgGUID: 2lCE5eC6R8WQMN1h36sT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="182655945"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:28:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 04:28:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 04:28:50 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 04:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjAWjO6QQ2FPV1ytapBLh/b1y0OiUTS6lWIxkdVanq2VBMAmZEOmCVSUw4151YSjGPKJVvV2akN8QDIy0/nQFvVcn+wCeSJcQas5DsBeFAqByeTuEa4NgydH85l0FR2ADicwObzjOW73hIGoQv7PVlMXfN2vEDBAHe1Jxn73SbfYPplqHaZ93aeGaHi3UN5MgoTMBUMCHiWBZQ1LWd2CXQoStn671H23RhznJBmf8NjRwH1B6LKLUjiVCnAUwI7apfysLfI6/kfsj1s7KkAqd4pjKEqlAir4y83tTpMsKt8TheKOEIvGkRT6sR3beWQc85gCBTGhyRTIsfRUfkUVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=On9YGBzs3X4wdfxkDupq4ZQ6J3YTH8uNAvWNle26TvY=;
 b=g4BHAXVtVJaGZMaQvBSh+ry/PhsrcvSAVUU7D5IfIH6DYhwHtTxnuZncB2nq+YqpFdV5ygefZ/ExzgOXVOwevzOEV0GsZaDGd8o7xZgO6SuG7TlnysRBkzOIN22tXXcjFy2swfdN3qHkajylUHfUypvHJcYrbBruQUS2A7lJqtbBPgMk9dKs1WPakaaCfO3YktYPgmc9b84EdVvrzvSMWxvd5a2dcbxk98B53SNxoJcDbRs9nOSyz1oYhU2OeaC54q9Y3BXW4qbMnhZddkYHeRyyJynJEbLhZ2cURQAzKAgQBt0xorcSjCgg4dp1ixVtahspzRor0lwAST4taudRPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA1PR11MB7197.namprd11.prod.outlook.com (2603:10b6:208:41a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Tue, 14 Oct 2025 11:28:42 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 11:28:42 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Manszewski, Christoph" <christoph.manszewski@intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>, "Maslak, Jan" <jan.maslak@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 5/7] lib/xe/xe_eudebug: Assert that there is always
 client work
Thread-Topic: [PATCH i-g-t 5/7] lib/xe/xe_eudebug: Assert that there is always
 client work
Thread-Index: AQHcPO5sRPrC2zfqYkm0rkguFndLrrTBgSGQ
Date: Tue, 14 Oct 2025 11:28:42 +0000
Message-ID: <DS0PR11MB72645D34AB0F6AD114834B90D9EBA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
 <20251014093848.2394531-6-mika.kuoppala@linux.intel.com>
In-Reply-To: <20251014093848.2394531-6-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA1PR11MB7197:EE_
x-ms-office365-filtering-correlation-id: a7dabdaf-75b6-4cd0-298e-08de0b14d493
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?1isCaJlHfLMto2o3EA0Mr8u5frz8XZCn4xO5Q1aZN5xOPfUS4nji1mH/J6?=
 =?iso-8859-2?Q?pTwZIXRSD84h9bO+PKVOqT86ci5x7OxbyXqF4i9AgQGChVhjiwNq2zXORL?=
 =?iso-8859-2?Q?m3eq1qq/TqIET2CTdhpa9if0NkT0k9TYabR31ARwMyN069qHdADAwiIUxh?=
 =?iso-8859-2?Q?Jr0WPzCVCYLhr+++LCjJ/HIVX9tYtKig00dsnLeNahpNSpnvCVmseqcUyd?=
 =?iso-8859-2?Q?GDWphtl3yFhb8P8kAGH7feDESDim7uCagWQIfet1VfPNtiZO1DwQc/jeiW?=
 =?iso-8859-2?Q?zhkJXPSxygqOa/KeanPuz93DsxEchIMkmgEAfB6av5o0iGA1Tc7ZNxCRpR?=
 =?iso-8859-2?Q?mkNBMrncTyPNswC9tGIns6Ov5qOY7hby/eYRU8ynAbuphI8lBmJUCsRUBQ?=
 =?iso-8859-2?Q?eljywHaRUl/OTN1xrC3itgTFoaGfLuYMKyNPb6smfW+vq33rsdMxNovYJl?=
 =?iso-8859-2?Q?DRawyI6ZdC/z9q3hA6lbKPAkoFMsnXNoEKSTUBjV4TfAyLxF3wODpX1Bi6?=
 =?iso-8859-2?Q?S6H26l8aM7ADrsl7J8q4MIp28Fnu+LaE/+XGQ7FVtg4jhSSgG3skrHRmTK?=
 =?iso-8859-2?Q?NYeK0fNHf93FunxqEXujRfIeJcVkrdvAcytLdmn1GOpHWv7jCP5pFGe16h?=
 =?iso-8859-2?Q?G3AwoXvVTAr5XDeR4zsKsaeMi1KA5N1Bn34j89pqqjtGS9eteMWugWzaKg?=
 =?iso-8859-2?Q?1rApISmTBP1ufnUNsftcPZeGDLHXpTyykT/YzTEPI2a9/3J4FmohWA0bmy?=
 =?iso-8859-2?Q?Q/ZyiItVj24S09rgpW4V019oJA657OI1CM8ybzv6V8tjBL2rJSub+QtnLO?=
 =?iso-8859-2?Q?bJj7rW/E7m7wdvU0Ntwb5bH3osiP1DNriMxFCx0ioer8gUF2FxDmUPwPCg?=
 =?iso-8859-2?Q?YqvgIrjDRnS/u2pM1jmeXvFavG/aooGcop8Lj9TRTnx15c9Pg1+vKryAhb?=
 =?iso-8859-2?Q?3NMXjlF5nqIiz/wgWW0Y3OEn/tGRWceiHRh9/DBPwIQfADGvc5tF1zfyhL?=
 =?iso-8859-2?Q?vwg1BpR0RXDA3ngzXmL/lhZxyiu/PbElCEWK8vpwtIQY3gMvmx9Z7k0Hkp?=
 =?iso-8859-2?Q?6KKi9IJNCcq7u0dqKjnWdAQfu0skXrmJ0BU3Iw1z08NKwpbkarAiRCkx6h?=
 =?iso-8859-2?Q?05QG0gh0FAYHOrZgIEYDBQ5GP1BNzcL8qNg4fIuIx9kwMfi72KRA42XR18?=
 =?iso-8859-2?Q?ABzmunTyoObTBcQ7YOu97kNln4r8LlV7C5dCMxmMJTW+dXxMhziZhcqJWz?=
 =?iso-8859-2?Q?IC3lgeaUTNo6KVBMEs9JCkgnn2C1Pfk4DZhKybPtqOfPy0384Xt73adUrT?=
 =?iso-8859-2?Q?mFfaDj0bB9rIeONxqvaBP0Ipa3R3xfPfouvNomgA664QMKXzPdNS5AjlZU?=
 =?iso-8859-2?Q?0hgX38oW2DMbhgJjqqVQsv1VTbBBB8iqUD1TA81MODxOHStKo8E7NThZ8v?=
 =?iso-8859-2?Q?U+wPfUUakcEEfXMjg846ZLqZggudMCoV7dTcHAkFcolSmoUhYvEDZ82e5n?=
 =?iso-8859-2?Q?k5e5XRGo01Pz77yE3aBPYlgIXFxjA2zn4kPdAVOtcX/rq/7vxl5RQZou7q?=
 =?iso-8859-2?Q?CsHzzBmDY3jbJC2vBedDZXuSGKlP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?hh931hBXHTKshr87+5YJ3/izilKnotoOy+2HMpZRZG2Kn8IMAvZCvYoTDx?=
 =?iso-8859-2?Q?i22k7bUHaV8IaiFyc00J+dulmkuCzj0nxXAe1F1M/2cgw9BqMqBphllx2z?=
 =?iso-8859-2?Q?AyjUtFshJwFAo1+Hw5//NdgPlqY/Kj+1GcZBVy1Eqzlp4Y+vLPdwCK+0yd?=
 =?iso-8859-2?Q?cKUN/do4pYxPBNyw4/PpDJ/iuklBrcf4wk+ugSgyUk32WGgo2HF50Q5LWx?=
 =?iso-8859-2?Q?D1Tu0zik7EUEyb3YyJUviReZcjuW7fdKzkAcOHGicJ5Y6rLpqiC5i+h2YS?=
 =?iso-8859-2?Q?GOq2h6EAVnrj9V9x7bJFEy5rAHytnT0PirP8UA8zWMYErVHu0xmnFosKYm?=
 =?iso-8859-2?Q?ZqlAGaEkfP6UsEr7ub5LbNoc/fTAHo1U6ATgQsVB0zRW8zuuTLElWWjp7y?=
 =?iso-8859-2?Q?wxD0pK85PfAvVIogV6+K2dSD5DoySOWcRlo5A9U6xBPbAdvJrOffZ1tGWw?=
 =?iso-8859-2?Q?yCMSKNftl0E6G4eaCykmacbr1kMZ2xAnR+7TzE3ugxV3tnfStuRa/5W1q+?=
 =?iso-8859-2?Q?VcDb085URjUjtsGQw57rhnyZR5uhffjS9q+Mz/La/Y1COoTjrnTI41ovCx?=
 =?iso-8859-2?Q?VLWRolUjVPMGHgH/8dQmRnmiCf+kcvCgqRca/IVV3fOzF+ihiUcwOxW4yy?=
 =?iso-8859-2?Q?+8+2rk/NBhZe944xGdVW0K41oSvauW3Birrd9x9m1n5QsIImoL0bYJQkN/?=
 =?iso-8859-2?Q?SpMlksusdYNppddptVoOtbdbVpgsD8p95MPvT3GGUG/0PjQdTomtw8zMaq?=
 =?iso-8859-2?Q?aLvNeUDG75qf7CGPCdu7CFJ4/GutDOzjEhxaxgB1wQdH/90P4EphHdZgyP?=
 =?iso-8859-2?Q?7jVZs6UEoh5VBmWBFArvH/FFymQ74Gb8hoFAr9SsWnQ+Yib6dJeDfsW8J0?=
 =?iso-8859-2?Q?zJveTQY3hsFKzU6ldDX3ZOxL02bTDydyfSL3SULEW13mnGTWfIO5zZSTOX?=
 =?iso-8859-2?Q?MYrxPTnwMrfL+/JIXlxkqDAhDoYHS9G75kwJswIvYYAaFvXuUPLZ2SWedC?=
 =?iso-8859-2?Q?aqiU0SecXGJsNJQJ4pi9YwwbUWb5Q6oI5fiHdepagJxmCRAPJvtn2CQEpO?=
 =?iso-8859-2?Q?gnhxAsEgrjsT8I+bNtF0qMuFYZRLI9qxcGSCOjjfut86u2jGbrlKWBE3hU?=
 =?iso-8859-2?Q?hp1nbTGMXkUmw3fTZkxK7rN97FG7a+pDC9VOMxB/bgkafBPet6jhVYkGEL?=
 =?iso-8859-2?Q?TC0r89JZMi5z2QlnAN+au/J8ROccjHtslLMgtURZYgsvX7OntAoNNvxDl8?=
 =?iso-8859-2?Q?AIPvFQR/eUCrFaO0YghryVX6uNsNbxmVe+DH2rQoZ3p4CThvMsHm8PsV10?=
 =?iso-8859-2?Q?bN0kPfeNzBqtSmWYvQeCbLeoD3By2Hl5vA6BX9E+GFDr/ux3YXDmS6psAa?=
 =?iso-8859-2?Q?1PH6lkETNPDeHcGM1VNjbgNUNhpAppJzhjnnX9l73RBn+RMp136WSas3wG?=
 =?iso-8859-2?Q?wYhb/Yr2nQY2Jyr1Ix6OjhFrC/EpWcFMBI0I5Js4QdDJ/EQDdOYpw0MIo7?=
 =?iso-8859-2?Q?uNvRJ6C27b3tXeBDhdUKLD4nQd1ayOzgtWHLumUvVG7CM2Yk/Ca7PeGg95?=
 =?iso-8859-2?Q?9uXVcg9qU9RWo3jBSHfQtNcRFqPIO8hpXXQxhCVLTQQ5URnSFTy7ojPOWA?=
 =?iso-8859-2?Q?d5CFrvZVhTEDptrd0bYWG9nPc1mGNonBdJrmlPEt0cjQrjiXzwDTx0+A?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7dabdaf-75b6-4cd0-298e-08de0b14d493
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 11:28:42.6778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOD2R7P1N+1paURk4VueZCW4xDwvUtuyqHQaoymlqaguObNyTTKD/MP2O2eeatFMPEpU8LvCo3GIy7o1NLMWK3fnGUY6wXkpk9qMVhQ0L4/JJ42ImpZmouRLuLDr9DBg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7197
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Sent: Tuesday, October 14, 2025 11:39 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Manszewski, Christoph <christoph.manszewski@intel.com>; Piatkowski,
> Dominik Karol <dominik.karol.piatkowski@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Maslak, Jan <jan.maslak@intel.com>;
> Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Mika Kuoppala
> <mika.kuoppala@linux.intel.com>
> Subject: [PATCH i-g-t 5/7] lib/xe/xe_eudebug: Assert that there is always=
 client
> work
>=20
> It makes no sense that we would not have a client work
> to do on setup. So assert it is always there and add
> debugs when the client thread enters and exits on work.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  lib/xe/xe_eudebug.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 84309043d5..7ea63b22b4 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1512,8 +1512,11 @@ struct xe_eudebug_client
> *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
>=20
>  		c->pid =3D client_wait_token(c, CLIENT_RUN);
>  		igt_assert_eq(c->pid, mypid);
> -		if (work)
> -			work(c);
> +		igt_assert(work);
> +
> +		igt_debug("client: work start\n");
> +		work(c);
> +		igt_debug("client: work end\n");
>=20
>  		client_signal(c, CLIENT_FINI, c->seqno);
>=20
> --
> 2.43.0

