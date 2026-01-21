Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480C6D262B0
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 06:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6CF10E6B4;
	Wed, 21 Jan 2026 06:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzuD3Tyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF8410E6B4
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 06:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768975623; x=1800511623;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=M1brH1y+fKU7l5BK5aMZoKeLlHrdwz2JIxKTjOzQRN4=;
 b=NzuD3TynN02Kb0UmMBytM3oLpQ8I89rdUOvJJdMA4K2XsFBcmwyHHCj5
 6sesCX43enpXfHiTZS9OYwxhbs2gSjGXHNiI7+JlfnYkvsPAqwAaba9Vk
 s0JDy2kWrHQUGs1RpC1a1zY6WN7d0ubpi2JEvYXy/6Mth9DIOSSXXCLnF
 T14lU/JPJY4mLYuEvbJqknRY0K42bnY4wtvx5GQvyJDIFhzVv0N10Exve
 aq0onvgsTIUz4FdU1GEq+33tZX4SUG/X1R4U1/qjUFkMWkvHRuYnp9dbC
 8Vx68mXkWUcd192kT5GO4lvspf6cvtBSFEvLBr+RSpsw2msc97evB3RpK g==;
X-CSE-ConnectionGUID: rTY4+y/cTda3ZbqaP6MuMw==
X-CSE-MsgGUID: /KHU+uqMS06r+eFecwAtuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80823949"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208,217";a="80823949"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 22:07:03 -0800
X-CSE-ConnectionGUID: VaTYrgQJR+e2AYBrB7WzSg==
X-CSE-MsgGUID: ZozPRL9aTkqNmiII11JRrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
 d="scan'208,217";a="243920684"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 22:07:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:07:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 22:07:01 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:06:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eev6ojk6kaLzmCZBvsGZXFzrIJCsLOl5RC6mrFVEj5EBPg9kFwUmdzFRsVskoTw39sx7NDSFqP1Th8mAQvenp7aXxIFmt13Ms6io7B5w76qySJpm7Y4S1DG0IoOXuKeKZQAwTwhNJJ+r1iKFfrvjS9LNmUVYHdjdH2JwME3aD2G9w0nhjapRwtvu/vyIgMdflx881RmGr/wCwJceEYjvdEKS1yg1siqsxleOsgnsa6xBqLDKhoN9GQAhlBI6HVPFuntSsdQLbwXQOBx25QuHS8q+6svoFOPQ7zrNIx5slLAdI8hjXswcycbZThnPt2+WIfmzIxCylApe/lUmcqBfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJuB7GOK0I/fBFQwHiZmyxjIi+Ot+kIcwDImC+dja20=;
 b=KRyfrWhVGGP7fQi8bxfIJG/AtndXi59Gj6tdThXgbGK79qp9fLiJK0D58si/zsC2gDqDucOl+HPt4NprtcqpokKnYGRfCMcW2vF1mWv8EIQqy7L81dufE2J6gg44EOUZP+la66PhrOibAHNzELYmCldykZj4mXmiJJiLU12hltPLXwKmUR91CCTKCpo2QGE9wHOMqVi8oj7TIzO2e4q4JDSznXbMAuTyXUnbJBHvQDSGoAd5qnRY/rkjALWZQI9yjhFC9FRrNr63xJMyhNOfhyx+hu95GZ1zeORgwaUHAllmhCvVtuLWLZKFOek8K3Blx79KINkCEzF/rRByqFJj8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 06:06:49 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:06:46 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Santa, Carlos" <carlos.santa@intel.com>, "Badrappan, Jeevaka"
 <jeevaka.badrappan@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Topic: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Index: AQHchTAmGZobl9qsjEqU6WPrCWHrl7VaeYsAgAGyug4=
Date: Wed, 21 Jan 2026 06:06:45 +0000
Message-ID: <CH0PR11MB5427A75528B837E751D3D1A29896A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260114082323.2534785-1-s.sebinraj@intel.com>
 <9c613a62-a076-43a0-8974-0b0a1cffa46b@intel.com>
In-Reply-To: <9c613a62-a076-43a0-8974-0b0a1cffa46b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|PH8PR11MB6925:EE_
x-ms-office365-filtering-correlation-id: 8782649e-d5c5-4775-26f7-08de58b341ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|8096899003|13003099007|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?2fRidX5fGtHcQVJ1r8V6l1lWQiOU3Y+acDfmlSbfRC8bYf2cJwGsDcUxww?=
 =?iso-8859-1?Q?Uzv20brH24rOvCyj/bZZaXABw526af4NFOwi3+gpwLtvC/3jR+v06BOcoI?=
 =?iso-8859-1?Q?A12ftzfkj9MNFg9y1G/OBWG19LhW37CUbu1VTz/ntNFZyMpnIwc3w7bnUh?=
 =?iso-8859-1?Q?t5jcWGEvmckhHaIMqp8qzx73LJJBtbY8GEtmDk+PNOsIQo06ANy9z2lpnX?=
 =?iso-8859-1?Q?y95hO0H4tdN2stLIZpXkR5d0Rn0/5akG0FEIKnWqkDtRSjPNqP/y4qMzrc?=
 =?iso-8859-1?Q?x+VE++6XEJC7y5nkfSz1vWfPtQ0RL/R5gDc1+nIGfI/uIO0+LAjzIKc0iX?=
 =?iso-8859-1?Q?775RLqcm1awJGYqF0eJAAzQSnNgWDMnNF47L+nYtN2pTUA91IWb9ANYMfd?=
 =?iso-8859-1?Q?MiyX2CBpMypoPV+1PS0MkoFBBOM73qUTydMVucV/Hdr8235V2Wg7+8vmfB?=
 =?iso-8859-1?Q?5O5NMxbCH8X0K25SdnPz8h6KHGpeyLhbuUhz4V4NHrrLRZ7czHpN5x4jlF?=
 =?iso-8859-1?Q?BEqtgSOeZUIKiuFG1OiEtu3gTb/LubyE7wE3AR1PW1J1TCbzeilvRSoTan?=
 =?iso-8859-1?Q?jlkuZh/lG/U73T/gUFUecnt1uCfaMtKQ172bEY72C+JRM8SUwiOngYwrAb?=
 =?iso-8859-1?Q?hTGm2Ld/RvC4Rhky8CDNvFwBspfV0Q0voR8e/CMogESI0nIQncWpqRIS0O?=
 =?iso-8859-1?Q?PzXtyCO0sVC+yy0AnN549cFmYP/3d6Oz8HJBemohaseQSIFz+HkHHS7K35?=
 =?iso-8859-1?Q?UWq/NX5K9SgL4GZoHEPZtWuAJxm/l49ygn06st6IzRSv+eORbh/LyrsnCq?=
 =?iso-8859-1?Q?5MzuBLBpwbfbNYxy3OGi+op6LnXLrstH0HZUmj1q1lUnnkn2vftssos5N+?=
 =?iso-8859-1?Q?0AY9dulqjid2Dzv7bzbSKiglfCjFoRnVRhP3pQWEWzAp+Gb2nOr/u8yKDu?=
 =?iso-8859-1?Q?A5RYzGfxpq6tFf+IoSIi6YDeA2AiKOa68ahJnwFyncTT659mzF9dvc43fW?=
 =?iso-8859-1?Q?Dy3p8VcN371j5Qa+Ew16Cg2ohjNQSHTxIFtbTxGbrha6SNma4O7MMYTaHB?=
 =?iso-8859-1?Q?PxwpNafFhKwzUA99BHbtb2KuEPwd6DxNPiHjn+C5Gbkc8UkIPGyDJuhkG2?=
 =?iso-8859-1?Q?ehKQc5tOuhE0ToopYJJlLcZja4uSAEH7qOm8QGh21OC2cFNIKSaiRitq46?=
 =?iso-8859-1?Q?gMfA8JXYg1a/Chtk/Jg08024xE7u4ysJ+OMMLaAkV/rfndiBe/O0SvLZ8M?=
 =?iso-8859-1?Q?U0LcMIbb9OdnRRg7Hlg78kUUGB/fm1n6cPtGHro/udl/VLlwlioEL48agq?=
 =?iso-8859-1?Q?MVuv+AyvDZBFs/OnBGUbZAvTArVolTFdWI3pVSmWoiNKNo0qFH5HGo19oN?=
 =?iso-8859-1?Q?tQMNiQ1flsptXccHLZOa1k7JKthBfVLIJL346GrBbEV2Eq3Gb2pBYgijjR?=
 =?iso-8859-1?Q?d8oOcK138aVoL1S4CTWO3rhZ0iJmX5IR3i0pl9mnGfDBEm9kzejlcYXpGt?=
 =?iso-8859-1?Q?Eei2MfJFDTDKcEUF27hHf0ImYcuL1WlGF+UD3f6zvnZNUFuP/zPBqjd8yX?=
 =?iso-8859-1?Q?ywDE2iS7NGEjpH1XfUaOMFurHnAg6C82ZM8AQj07QyWEo7aHGmEBQJ/gfR?=
 =?iso-8859-1?Q?1UNDrPdZQIkYsBvPuP8oNg005geZjfNums?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(8096899003)(13003099007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QVtb6+cTpZU48hTugNe2STvuMbfasArzZFBRpsaS0bvODtGufKQe4QCG9e?=
 =?iso-8859-1?Q?LA9bVcctKCZdvGDKoTm2vUSbWNTfraQhHGpMCuDVSNRFF8KKDKnYqO/XHT?=
 =?iso-8859-1?Q?a8DxVe7+EZyRUDDcXabrkX5ghlZ06LrH1DMoMog1TQknmW97d9edPme3Sq?=
 =?iso-8859-1?Q?aFzCUpVdvzlhVGVODMLlb6zGJ5bQHIlc4ZepsI0zgI3MHUSqtNZdgeGbOb?=
 =?iso-8859-1?Q?yxVJOid0XlTJ03qg5cBfRDC2kJxga1VkvdjTWbGjxIaM/XQRUWck8X1har?=
 =?iso-8859-1?Q?dhKyWtolcvaJFR0v3ypmyI3Fzj4vMaqAJZGl1rtVykQjsraidoGObrRcqY?=
 =?iso-8859-1?Q?FkYgEqNzTGuClyPQ8zkSTshrwFgvjxvJ9S/ou7LTmKRxPiM1clIAn0aAT3?=
 =?iso-8859-1?Q?Qt/lZsA4MlLdLDIrfTt0HOyqfZvYmubqjBpmkZ/2EH4e/mBAMKcid0nh3+?=
 =?iso-8859-1?Q?Yf8A65vwG2KnMG8IrDMqRxOyu9AxMS4ZFD9GWtY1Q0Zh+qnLcYEDtBuwRQ?=
 =?iso-8859-1?Q?sgnYBQ4l7K7U0zWKKdWUmDaEaxCgVKkZZu4izNOr0MUWv7L6lnQ4iNWIxr?=
 =?iso-8859-1?Q?7m4dAfX3f8f5NhRU5J+LyA1kv8jzsAqkg8YEBsOKF43VJ5SmG8rsJXxbz4?=
 =?iso-8859-1?Q?ylL837ZuyhTCXgyKhq2p4p1IBZn0Xpk6sbMMzERbzInjeyH0AiLJFrhMWS?=
 =?iso-8859-1?Q?GSprVz7E3vlld/Y2Mj4/Bkulqy+VhRisvy8hXCgRPlGgfnblKLM5ytSve8?=
 =?iso-8859-1?Q?5dhwANodhS54wTrjPiY9ihNCanWeasLcf5ldVRdVgPICubCFr0rlwM6I61?=
 =?iso-8859-1?Q?fYEm4qRIGDNV8I3IwguN00+8OtcDEJYbfwMio2F3fvdL5eH3r517e2EL1W?=
 =?iso-8859-1?Q?ZBxLmLnd6P1zmqnOzfyUkPhazFtd93yr4JzNpA5jXfmWkH6wXcU5NUsl/M?=
 =?iso-8859-1?Q?oK6WmqByUaa6lQcyyVGbxwgrxRvb6+NcoBCoKd0+GDfzJUL/llIdyeI4IL?=
 =?iso-8859-1?Q?J9lOjXju4udh+LnR0Dh42FXz4XC8S3dJQiK4a094NwDdGoZCL9alclHr0f?=
 =?iso-8859-1?Q?cm4qlryVUyf2mSFukAx6HCNZ6yPXVi8v9Au8kwzBE6sCUtofbxoiYMIAPr?=
 =?iso-8859-1?Q?QOKw750Jm/pGGlvkQuMWGmt2+gH7t8d5hhhKsUG1EgL70rSYMxFp9T4rh/?=
 =?iso-8859-1?Q?N3hZdP0aLOakgVMgO2ZHmFBpm4DHbYXI4naGN0mZ9ubhBDi4CwMOBn1RPe?=
 =?iso-8859-1?Q?grbkQJ0e9YSzV4q3ma34ljwASkg+Gm3qsEBFGvl3q1bmUZzzROqTMYmpXS?=
 =?iso-8859-1?Q?pT4i4L17RpPIm1GIrBO6c3oOKb+dWOupIReGOARTvSNfKVSRLTL4CXFtNB?=
 =?iso-8859-1?Q?lZDU+ul8xGS0c6PHmoogInKYvbmTQHsJtUkMgSVx1H/2Qxm1mFcYHvSD1E?=
 =?iso-8859-1?Q?lx57vO9NvDzWDHi1txFahggxAfjkwXSTGFXU18LCZnss4Rc9Pa5EDG08vY?=
 =?iso-8859-1?Q?rWq8f6CSnQkTIoRLyQHzW43rdVyrns98sgZSOjHrdQ0zp2U9lAdD1gGBRA?=
 =?iso-8859-1?Q?i26C6mdNRAOME3jJmI5BasQGecVjM3m2o+1U6a5f+dPPh87v1rrb6M5Vjr?=
 =?iso-8859-1?Q?r/PLlEhtrUEgQ+y2jFXRbtEfOyMY5iKGc7oUlaSwJ8rz5R6Udyr8tRKu6a?=
 =?iso-8859-1?Q?aTXIFYT8JppIfsS4v7iRKgTcqy+Xq9G1cqXW7cMtX/zf4jV8denQ5wMK6C?=
 =?iso-8859-1?Q?juMQnYCDQLm1rFlM2jhqzifgOfICulySazmxD9v+NW5Gfb?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427A75528B837E751D3D1A29896ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8782649e-d5c5-4775-26f7-08de58b341ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 06:06:45.8884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dtqhdkBXnq/zXlZEJB5ZzwwYIxP1iOBCkkWyO46bF5CMymBSM+2/UD6isnjhzFXzkifaY8o648wEBgpL36Zcuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
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

--_000_CH0PR11MB5427A75528B837E751D3D1A29896ACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: B S, Karthik <karthik.b.s@intel.com>
Sent: Tuesday, January 20, 2026 9:35 AM
To: Sebinraj, S <s.sebinraj@intel.com>; igt-dev@lists.freedesktop.org <igt-=
dev@lists.freedesktop.org>
Cc: Santa, Carlos <carlos.santa@intel.com>; Badrappan, Jeevaka <jeevaka.bad=
rappan@intel.com>; Karas, Krzysztof <krzysztof.karas@intel.com>; Konieczny,=
 Kamil <kamil.konieczny@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczy=
nski@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit F=
encing

Hi Sebinraj,

On 1/14/2026 1:53 PM, S Sebinraj wrote:
> Add a new test to validate explicit fencing.
> This test handles multiple planes in a single atomic commit.
> This test addresses a critical scenario where drivers must correctly
> synchronize planes with mixed fence states.
>
> Test Scenario:
> - Creates three planes: one primary, two overlay
> - Attaches fences with different states:
>     - Primary plane:   signaled fence (simulating completed GPU work)
>     - Overlay-1 plane: signaled fence (simulating completed GPU work)
>     - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
> - Submits all planes in a single atomic commit with IN_FENCE_FD set
> - Validates that display waits for ALL fences before updating ANY plane
>
> Bug Detection:
> This test catches driver bugs where:
>   - Planes with signaled fences update prematurely before unsignaled
>     fences complete, breaking atomic commit semantics
>   - Fence states are mismanaged across multiple planes causing visual
>     glitches or corruption
>   - The driver fails to wait on all IN_FENCE_FDs atomically
>
> The test uses sw_sync timelines to create controllable fence states,
> allowing precise validation of fence synchronization behavior. An
> OUT_FENCE_PTR is requested to monitor when the display update actually
> completes, enabling detection of premature updates.
>
> Implementation Details:
> - Uses sw_sync for creating fences with controlled signaling
> - Monitors OUT_FENCE to detect premature display updates
> - Validates atomic commit integrity across multiple planes
>
> Background:
> - A bug regressed for Xe driver on PTL (Android) i915/display handling
>    of explicit fences when provided two or more buffers at once,
>    with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>    https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>    use of explicit fencing in the KMS Atomic Modesetting APIs.
>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>   tests/kms_explicit_fence.c | 372 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   1 +
>   2 files changed, 373 insertions(+)
>   create mode 100644 tests/kms_explicit_fence.c
>
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> new file mode 100644
> index 000000000..d3cad5904
> --- /dev/null
> +++ b/tests/kms_explicit_fence.c
> @@ -0,0 +1,372 @@
> +/*
> + * Copyright =A9 2026 Intel Corporation
> Please use SPDX licence, please look into the recently added tests which
uses them.

Sure, I'll change that.

> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +/**
> + * TEST: kms explicit fence multiplane
> + * Category: Display
> + * Description: Test explicit fencing with multiple planes and mixed fen=
ce states
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + *
> + * This test validates correct handling of explicit fences when multiple=
 planes
> + * are updated in a single atomic commit with different fence states. Th=
is is
> + * critical for catching fence synchronization bugs where the driver mig=
ht:
> + * 1. Prematurely display buffers with signaled fences before unsignaled=
 fences complete
> + * 2. Mismanage fence states across multiple planes causing visual glitc=
hes
> + * 3. Fail to wait on all fences atomically before updating the display
> + */
> +
> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>
> +#include <poll.h>
> +
> +/**
> + * SUBTEST: multiplane-atomic-fence-wait
> + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence st=
ates:
> + *              2 planes with signaled fences and 1 plane with unsignale=
d fence.
> + *              Validates that display waits for all fences before updat=
ing any plane.
> + */
> +
> +/* Test configuration macros */
> +#define NUM_PLANES 3
> +#define PLANE_PRIMARY_IDX 0
> +#define PLANE_OVERLAY1_IDX 1
> +#define PLANE_OVERLAY2_IDX 2
> +#define OVERLAY_COUNT 2
> +
> +#define FENCE_TIMEOUT_MS 2000
> +#define VISUAL_DELAY_US 500000  /* 500ms for visual observation */
> +
> +#define OVERLAY_SIZE_DIVISOR 3
> +#define OVERLAY1_POS_X 100
> +#define OVERLAY1_POS_Y 100
> +#define OVERLAY2_OFFSET 100
> +
> +typedef struct {
> +     int drm_fd;
> +     igt_display_t display;
> +     igt_output_t *output;
> +     enum pipe pipe;
> +     igt_plane_t *primary;
> +     igt_plane_t *overlay1;
> +     igt_plane_t *overlay2;
> +     struct igt_fb primary_fb;
> +     struct igt_fb overlay1_fb;
> +     struct igt_fb overlay2_fb;
> +     drmModeModeInfo *mode;
> +     int width, height;
> +} data_t;
> +
> +static void setup_output(data_t *data)
> +{
> +     igt_display_t *display =3D &data->display;
> +     igt_output_t *output;
> +     enum pipe pipe;
> +
> +     for_each_pipe_with_valid_output(display, pipe, output) {
> +             data->output =3D output;
> +             data->pipe =3D pipe;
> +             data->mode =3D igt_output_get_mode(output);
> +
> +             /* Get planes */
> +             data->primary =3D igt_pipe_get_plane_type(
> +                     igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PR=
IMARY);
> +             data->overlay1 =3D igt_pipe_get_plane_type_index(
> +                     igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_OV=
ERLAY, 0);
> +             data->overlay2 =3D igt_pipe_get_plane_type_index(
> +                     igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_OV=
ERLAY, 1);
> +
> +             data->width =3D data->mode->hdisplay;
> +             data->height =3D data->mode->vdisplay;
> +
> +             /* We need at least OVERLAY_COUNT overlay planes for this t=
est */
> +             if (data->overlay1 && data->overlay2)
> +                     return;
> +     }
> +
> +     igt_skip("Need at least %d overlay planes for this test\n", OVERLAY=
_COUNT);
> +}
> +
> +static void cleanup_crtc(data_t *data)
> +{
> +     igt_display_reset(&data->display);
> +
> +     if (data->primary_fb.fb_id)
  > igt_remove_fb already has the check for fb_id, so these checks could
be removed.

Okay got it, I'll change this.

> +             igt_remove_fb(data->drm_fd, &data->primary_fb);
> +     if (data->overlay1_fb.fb_id)
> +             igt_remove_fb(data->drm_fd, &data->overlay1_fb);
> +     if (data->overlay2_fb.fb_id)
> +             igt_remove_fb(data->drm_fd, &data->overlay2_fb);
> +}
> +
> +static void create_fbs(data_t *data)
> +{
> +     int overlay_width =3D data->width / OVERLAY_SIZE_DIVISOR;
> +     int overlay_height =3D data->height / OVERLAY_SIZE_DIVISOR;
> +
> +     /* Primary plane - Blue background */
> +     igt_create_color_fb(data->drm_fd, data->width, data->height,
> +                         DRM_FORMAT_XRGB8888,
> +                         DRM_FORMAT_MOD_LINEAR,
> +                         0.0, 0.0, 1.0, /* Blue */
> +                         &data->primary_fb);
> +
> +     /* Overlay 1 - Red square */
> +     igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +                         DRM_FORMAT_XRGB8888,
> +                         DRM_FORMAT_MOD_LINEAR,
> +                         1.0, 0.0, 0.0, /* Red */
> +                         &data->overlay1_fb);
> +
> +     /* Overlay 2 - Green square */
> +     igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +                         DRM_FORMAT_XRGB8888,
> +                         DRM_FORMAT_MOD_LINEAR,
> +                         0.0, 1.0, 0.0, /* Green */
> +                         &data->overlay2_fb);
> +}
> +
> +/**
> + * multiplane_atomic_fence_wait - Test atomic commit with mixed fence st=
ates
> + *
> + * This test reproduces the critical scenario where multiple planes are =
updated
> + * in a single atomic commit with different fence states. The key valida=
tion is
> + * that the display does NOT update any plane until ALL fences are signa=
led.
> + *
> + * Test setup:
> + * - Primary plane: buffer with a signaled fence (already retired)
> + * - Overlay 1 plane: buffer with a signaled fence (already retired)
> + * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running oper=
ation)
> + *
> + * Expected behavior:
> + * - Atomic commit succeeds immediately (non-blocking)
> + * - Display waits internally for ALL fences before updating
> + * - No plane shows its new buffer until the unsignaled fence completes
> + * - After signaling the last fence, all planes update atomically
> + *
> + * Bug detection:
> + * If the driver has a bug, it will either:
> + * 1. Show the primary and overlay1 buffers prematurely (before overlay2=
's fence signals)
> + * 2. Cause visual glitches from fence mismanagement
> + * 3. Fail the atomic commit
> + */
> +static void multiplane_atomic_fence_wait(data_t *data)
> +{
> +     int timelines[NUM_PLANES];
> +     int fences[NUM_PLANES];
> +     int ret;
> +     int out_fence;
> +     igt_plane_t *planes[NUM_PLANES];
> +     const char *plane_names[NUM_PLANES] =3D { "Primary", "Overlay1", "O=
verlay2" };
> +     bool should_signal[NUM_PLANES] =3D { true, true, false };
> +
> +     igt_debug("Starting multiplane atomic fence wait test\n");
>IMHO, this(& most of the below igt_debug statements) do not add any real
debug value. Please consider dropping most of them unless it is clearly
helping in failure diagnosis.

Sure, I'll drop the debug statements which are not helpful

> +
> +     igt_require_sw_sync();
> +
> +     /* Initial modeset to establish baseline (no fences) */
> +     igt_debug("Setting up initial display configuration...\n");
> +     igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display,=
 data->pipe));
> +     igt_plane_set_fb(data->primary, &data->primary_fb);
> +     igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
> +     igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS=
_Y);
> +     igt_plane_set_fb(data->overlay2, &data->overlay2_fb);
> +     igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSE=
T -
> +                             data->overlay2_fb.width, OVERLAY1_POS_Y);
> +     igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +     igt_debug("Initial display setup complete\n");
> +
> +     /* Setup arrays for loop-based processing */
> +     planes[PLANE_PRIMARY_IDX] =3D data->primary;
> +     planes[PLANE_OVERLAY1_IDX] =3D data->overlay1;
> +     planes[PLANE_OVERLAY2_IDX] =3D data->overlay2;
> May the above part could be a separate setup function so that the test
function is easier to read. Not a must have, good to have.

Sure I'll do that !

> +
> +     /* Create timelines and fences for all planes */
> +     igt_debug("Creating timelines and fences for %d planes...\n", NUM_P=
LANES);
> +     for (int i =3D 0; i < NUM_PLANES; i++) {
> +             /* Create timeline */
> +             timelines[i] =3D sw_sync_timeline_create();
> +             igt_assert(timelines[i] >=3D 0);
> +
> +             /* Create fence at sequence 1 */
> +             fences[i] =3D sw_sync_timeline_create_fence(timelines[i], 1=
);
> +             igt_assert(fences[i] >=3D 0);
> +
> +             /* Signal fence if needed (first 2 planes) */
> +             if (should_signal[i]) {
> +                     sw_sync_timeline_inc(timelines[i], 1);
> +                     igt_assert_eq(sync_fence_status(fences[i]), 1);
> +                     igt_debug("  %s: fence SIGNALED (fd=3D%d)\n",
> +                               plane_names[i], fences[i]);
> +             } else {
> +                     igt_assert_eq(sync_fence_status(fences[i]), 0);
> +                     igt_debug("  %s: fence UNSIGNALED (fd=3D%d) - block=
s commit\n",
> +                               plane_names[i], fences[i]);
> +             }
> +
> +             /* Attach IN_FENCE_FD to plane */
> +             igt_plane_set_fence_fd(planes[i], fences[i]);
> +     }
> +
> +     /* swap overlay colors to see visible change from the previous scan=
out*/
> +     igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
> +     igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS=
_Y);
> +     igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
> +     igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSE=
T -
> +                             data->overlay1_fb.width, OVERLAY1_POS_Y);
> +
> +     /* Request OUT_FENCE to track when display update completes */
> +     igt_pipe_request_out_fence(igt_crtc_for_pipe(&data->display, data->=
pipe));
> +
> +     /*
> +      * The atomic commit should succeed immediately (NONBLOCK mode),
> +      * but the display should NOT update any plane until ALL fences
> +      * (including the unsignaled overlay2 fence) are signaled.
> +      *
> +      * A buggy driver might:
> +      * - Show primary and overlay1 immediately (wrong!)
> +      * - Cause visual corruption
> +      * - Fail the commit
> +      */
> +     ret =3D igt_display_try_commit_atomic(&data->display,
> +                                         DRM_MODE_ATOMIC_NONBLOCK,
> +                                         NULL);
> +     igt_assert_eq(ret, 0);
> +     igt_debug("Atomic commit SUCCEEDED (non-blocking)\n");
> +
> +     /* Get the out fence to monitor completion */
> +     out_fence =3D igt_crtc_for_pipe(&data->display, data->pipe)->out_fe=
nce_fd;
> +     igt_assert(out_fence >=3D 0);
> +     igt_debug("Got OUT_FENCE_FD=3D%d to monitor display update\n", out_=
fence);
> +
> +     /* Verify overlay2 fence (last one) is still unsignaled */
> +     igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
> +     igt_debug("Overlay2 fence still UNSIGNALED - display should be wait=
ing\n");
> +
> +     /* Verify out fence is also unsignaled (display hasn't updated yet)=
 */
> +     ret =3D sync_fence_status(out_fence);
> +     if (ret =3D=3D 1) {
> +             igt_warn("OUT_FENCE already signaled - this may indicate th=
e "
> +                      "driver is not waiting for all IN_FENCEs correctly=
!\n");
> Shouldn't we be already asserting here? no point in the test going ahead?

Yes, Thanks for pointing out

> +     } else {
> +             igt_debug("OUT_FENCE still unsignaled - display correctly "
> +                       "waiting for fences\n");
> +     }
> +
> +     /*
> +      * Wait a moment to ensure the display really is waiting.
> +      * In a buggy implementation, the primary and overlay1 planes might
> +      * show up prematurely during this delay.
> +      */
> +     igt_debug("Waiting %dms to verify display doesn't update "
> +               "prematurely\n", VISUAL_DELAY_US / 1000);
> +     usleep(VISUAL_DELAY_US);
> The visual verification(if required) should be a command line option
passed which can be enabled when required and be disabled by default, as
on CI this manual verification will not be done. Instead can we add a
CRC check here to verify there is no visual change?

I'll change this visual inspection to crc check in the next revision

> +
> +     /* Check if out fence signaled prematurely */
> +     ret =3D sync_fence_status(out_fence);
> +     if (ret =3D=3D 1) {
> +             igt_critical("BUG DETECTED: OUT_FENCE signaled before "
> +                          "overlay2 fence was signaled\n");
> +             igt_critical("This indicates the driver updated the display=
 "
> +                          "without waiting for all fences\n");
> +             igt_assert_f(0, "Display updated prematurely before all fen=
ces signaled");
> +     }
> +     igt_debug("Display has not updated yet (waiting for overlay2 fence)=
\n");
>This should be just igt_assert_f(ret =3D=3D 1, <>)

Okay got it

> +
> +     /* Now signal the blocking fence (overlay2) */
> +     igt_debug("Signaling the blocking overlay2 fence");
> +     sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
> +
> +     /* Wait for overlay2 fence to be signaled */
> +     ret =3D sync_fence_wait(fences[PLANE_OVERLAY2_IDX], FENCE_TIMEOUT_M=
S);
> +     igt_assert_eq(ret, 0);
> +     igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 1);
> +     igt_debug("Overlay2 fence now SIGNALED\n");
> +
> +     /* Now wait for the display update to complete (out fence signals) =
*/
> +     igt_debug("Waiting for display update to complete (OUT_FENCE)\n");
> +     ret =3D sync_fence_wait(out_fence, FENCE_TIMEOUT_MS);
> +     igt_assert_eq(ret, 0);
> +     igt_assert_eq(sync_fence_status(out_fence), 1);
> +     igt_debug("OUT_FENCE signaled - all planes updated atomically\n");
> +
> +     igt_debug("TEST PASSED\n");
> +
> +     usleep(VISUAL_DELAY_US);
> Same as above, should be a CRC check and an optional manual visual
verification.

Will be changed to CRC check

> +
> +     /* Cleanup: close test-specific resources (fences and timelines) */
> +     for (int i =3D 0; i < NUM_PLANES; i++) {
> +             close(fences[i]);
> +             close(timelines[i]);
> +             igt_plane_set_fence_fd(planes[i], -1);
> +     }
> +     close(out_fence);
> +     igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd =3D -1;
> +}
> +
> +static void test_fini(data_t *data)
> +{
> +     /* Reset display state */
> +     igt_plane_set_fb(data->primary, NULL);
> +     igt_plane_set_fb(data->overlay1, NULL);
> +     igt_plane_set_fb(data->overlay2, NULL);
> +     igt_output_set_crtc(data->output, NULL);
> +     igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +int igt_main()
> +{
> +     data_t data =3D {};
> +
> +     igt_fixture() {
> +             data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL | DRIVE=
R_XE);
Why do we need this to be specific to intel?

It need to ne specific and can be generic, I'll change accordingly

> +             kmstest_set_vt_graphics_mode();
> +             igt_display_require(&data.display, data.drm_fd);
> +             igt_display_require_output(&data.display);
> +
> +             setup_output(&data);
> +             create_fbs(&data);
> +     }
> +
> +     igt_describe("Test atomic commit with 3 planes (1 primary, 2 overla=
y) "
> +                  "where 2 planes have signaled fences and 1 plane has a=
n "
> +                  "unsignaled fence. Validates that display does not upd=
ate "
> +                  "any plane until all fences are signaled, catching bug=
s "
> +                  "where drivers might prematurely display buffers or "
> +                  "mismanage fence synchronization across multiple plane=
s.");
> +     igt_subtest("multiplane-atomic-fence-wait")
> +             multiplane_atomic_fence_wait(&data);
> +
> +     igt_fixture() {
> +             test_fini(&data);
> +             cleanup_crtc(&data);
> +             igt_display_fini(&data.display);
> +             drm_close_driver(data.drm_fd);
> +     }
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 0ad728b87..a61395332 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -35,6 +35,7 @@ test_progs =3D [
>        'kms_debugfs',
>        'kms_dither',
>        'kms_display_modes',
> +     'kms_explicit_fence',

> Please keep this in alphabetical order.

Sure I'll change that.

Regards,
Karthik.B.S
>        'kms_dp_aux_dev',
>        'kms_feature_discovery',
>        'kms_flip',

With Regards,
S Sebinraj

--_000_CH0PR11MB5427A75528B837E751D3D1A29896ACH0PR11MB5427namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;B S, Karthik &lt;karthik.b.s@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, January 20, 2026 9:35 AM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;; igt-dev@lists.fre=
edesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<br>
<b>Cc:</b>&nbsp;Santa, Carlos &lt;carlos.santa@intel.com&gt;; Badrappan, Je=
evaka &lt;jeevaka.badrappan@intel.com&gt;; Karas, Krzysztof &lt;krzysztof.k=
aras@intel.com&gt;; Konieczny, Kamil &lt;kamil.konieczny@intel.com&gt;; Kem=
pczynski, Zbigniew &lt;zbigniew.kempczynski@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test fo=
r Explicit Fencing
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi Sebinraj,<br>
<br>
On 1/14/2026 1:53 PM, S Sebinraj wrote:<br>
&gt; Add a new test to validate explicit fencing.<br>
&gt; This test handles multiple planes in a single atomic commit.<br>
&gt; This test addresses a critical scenario where drivers must correctly<b=
r>
&gt; synchronize planes with mixed fence states.<br>
&gt;<br>
&gt; Test Scenario:<br>
&gt; - Creates three planes: one primary, two overlay<br>
&gt; - Attaches fences with different states:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Primary plane:&nbsp;&nbsp; signaled fence (s=
imulating completed GPU work)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Overlay-1 plane: signaled fence (simulating =
completed GPU work)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Overlay-2 plane: unsignaled fence (simulatin=
g long-running GPU job)<br>
&gt; - Submits all planes in a single atomic commit with IN_FENCE_FD set<br=
>
&gt; - Validates that display waits for ALL fences before updating ANY plan=
e<br>
&gt;<br>
&gt; Bug Detection:<br>
&gt; This test catches driver bugs where:<br>
&gt;&nbsp;&nbsp; - Planes with signaled fences update prematurely before un=
signaled<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; fences complete, breaking atomic commit semant=
ics<br>
&gt;&nbsp;&nbsp; - Fence states are mismanaged across multiple planes causi=
ng visual<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; glitches or corruption<br>
&gt;&nbsp;&nbsp; - The driver fails to wait on all IN_FENCE_FDs atomically<=
br>
&gt;<br>
&gt; The test uses sw_sync timelines to create controllable fence states,<b=
r>
&gt; allowing precise validation of fence synchronization behavior. An<br>
&gt; OUT_FENCE_PTR is requested to monitor when the display update actually=
<br>
&gt; completes, enabling detection of premature updates.<br>
&gt;<br>
&gt; Implementation Details:<br>
&gt; - Uses sw_sync for creating fences with controlled signaling<br>
&gt; - Monitors OUT_FENCE to detect premature display updates<br>
&gt; - Validates atomic commit integrity across multiple planes<br>
&gt;<br>
&gt; Background:<br>
&gt; - A bug regressed for Xe driver on PTL (Android) i915/display handling=
<br>
&gt;&nbsp;&nbsp;&nbsp; of explicit fences when provided two or more buffers=
 at once,<br>
&gt;&nbsp;&nbsp;&nbsp; with 1+ already-signaled fences and 1+ not-yet-signa=
led fences.<br>
&gt;&nbsp;&nbsp;&nbsp; <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink"=
 id=3D"OWA90e85943-b368-d7b4-31f4-0f153981cb1f" href=3D"https://patchwork.f=
reedesktop.org/patch/662982/">
https://patchwork.freedesktop.org/patch/662982/</a><br>
&gt; - Adding this test so that IGT contains sufficient testing for the<br>
&gt;&nbsp;&nbsp;&nbsp; use of explicit fencing in the KMS Atomic Modesettin=
g APIs.<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; tests/kms_explicit_fence.c | 372 +++++++++++++++++++++++++=
++++++++++++<br>
&gt;&nbsp;&nbsp; tests/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp;&nbsp; 2 files changed, 373 insertions(+)<br>
&gt;&nbsp;&nbsp; create mode 100644 tests/kms_explicit_fence.c<br>
&gt;<br>
&gt; diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000..d3cad5904<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/kms_explicit_fence.c<br>
&gt; @@ -0,0 +1,372 @@<br>
&gt; +/*<br>
&gt; + * Copyright =A9 2026 Intel Corporation<br>
&gt; Please use SPDX licence, please look into the recently added tests whi=
ch<br>
uses them.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Sure, I'll change that.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&gt; + * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; + * to deal in the Software without restriction, including without lim=
itation<br>
&gt; + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; + * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; + * Software is furnished to do so, subject to the following condition=
s:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice (including t=
he next<br>
&gt; + * paragraph) shall be included in all copies or substantial portions=
 of the<br>
&gt; + * Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO =
EVENT SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING<br>
&gt; + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHE=
R DEALINGS<br>
&gt; + * IN THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * TEST: kms explicit fence multiplane<br>
&gt; + * Category: Display<br>
&gt; + * Description: Test explicit fencing with multiple planes and mixed =
fence states<br>
&gt; + * Driver requirement: i915, xe<br>
&gt; + * Mega feature: General Display Features<br>
&gt; + *<br>
&gt; + * This test validates correct handling of explicit fences when multi=
ple planes<br>
&gt; + * are updated in a single atomic commit with different fence states.=
 This is<br>
&gt; + * critical for catching fence synchronization bugs where the driver =
might:<br>
&gt; + * 1. Prematurely display buffers with signaled fences before unsigna=
led fences complete<br>
&gt; + * 2. Mismanage fence states across multiple planes causing visual gl=
itches<br>
&gt; + * 3. Fail to wait on all fences atomically before updating the displ=
ay<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;igt.h&quot;<br>
&gt; +#include &quot;igt_aux.h&quot;<br>
&gt; +#include &quot;sw_sync.h&quot;<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &lt;stdbool.h&gt;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +#include &lt;sys/eventfd.h&gt;<br>
&gt; +#include &lt;poll.h&gt;<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * SUBTEST: multiplane-atomic-fence-wait<br>
&gt; + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence=
 states:<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 2 planes with signaled fences and 1 plane with unsignaled fence=
.<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; Validates that display waits for all fences before updating any=
 plane.<br>
&gt; + */<br>
&gt; +<br>
&gt; +/* Test configuration macros */<br>
&gt; +#define NUM_PLANES 3<br>
&gt; +#define PLANE_PRIMARY_IDX 0<br>
&gt; +#define PLANE_OVERLAY1_IDX 1<br>
&gt; +#define PLANE_OVERLAY2_IDX 2<br>
&gt; +#define OVERLAY_COUNT 2<br>
&gt; +<br>
&gt; +#define FENCE_TIMEOUT_MS 2000<br>
&gt; +#define VISUAL_DELAY_US 500000&nbsp; /* 500ms for visual observation =
*/<br>
&gt; +<br>
&gt; +#define OVERLAY_SIZE_DIVISOR 3<br>
&gt; +#define OVERLAY1_POS_X 100<br>
&gt; +#define OVERLAY1_POS_Y 100<br>
&gt; +#define OVERLAY2_OFFSET 100<br>
&gt; +<br>
&gt; +typedef struct {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int drm_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *overlay1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *overlay2;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb primary_fb;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb overlay1_fb;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb overlay2_fb;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *mode;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int width, height;<br>
&gt; +} data_t;<br>
&gt; +<br>
&gt; +static void setup_output(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp;data-&gt;dis=
play;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_valid_output(display, pip=
e, output) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;output =3D output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;pipe =3D pipe;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;mode =3D igt_output_get_mode(output);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Get planes */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;primary =3D igt_pipe_get_plane_type(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_for_pipe(displ=
ay, pipe), DRM_PLANE_TYPE_PRIMARY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;overlay1 =3D igt_pipe_get_plane_type_index(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_for_pipe(displ=
ay, pipe), DRM_PLANE_TYPE_OVERLAY, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;overlay2 =3D igt_pipe_get_plane_type_index(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_for_pipe(displ=
ay, pipe), DRM_PLANE_TYPE_OVERLAY, 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;width =3D data-&gt;mode-&gt;hdisplay;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;height =3D data-&gt;mode-&gt;vdisplay;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* We need at least OVERLAY_COUNT overlay planes for this test */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (data-&gt;overlay1 &amp;&amp; data-&gt;overlay2)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;Need at least %d overlay plan=
es for this test\n&quot;, OVERLAY_COUNT);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void cleanup_crtc(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(&amp;data-&gt;display);<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (data-&gt;primary_fb.fb_id)<br>
&nbsp; &gt;&nbsp;igt_remove_fb already has the check for fb_id, so these ch=
ecks could<br>
be removed.</div>
<div style=3D"font-size: 11pt;"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Okay got it, I'll change this.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;primary_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (data-&gt;overlay1_fb.fb_id)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;overlay1_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (data-&gt;overlay2_fb.fb_id)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;overlay2_fb);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void create_fbs(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int overlay_width =3D data-&gt;width / OVERL=
AY_SIZE_DIVISOR;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int overlay_height =3D data-&gt;height / OVE=
RLAY_SIZE_DIVISOR;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Primary plane - Blue background */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;drm_fd, data-&g=
t;width, data-&gt;height,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0.0, 0.0, 1.0, /* Blue */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &amp;data-&gt;primary_fb);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Overlay 1 - Red square */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;drm_fd, overlay=
_width, overlay_height,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 1.0, 0.0, 0.0, /* Red */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &amp;data-&gt;overlay1_fb);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Overlay 2 - Green square */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;drm_fd, overlay=
_width, overlay_height,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0.0, 1.0, 0.0, /* Green */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &amp;data-&gt;overlay2_fb);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * multiplane_atomic_fence_wait - Test atomic commit with mixed fence=
 states<br>
&gt; + *<br>
&gt; + * This test reproduces the critical scenario where multiple planes a=
re updated<br>
&gt; + * in a single atomic commit with different fence states. The key val=
idation is<br>
&gt; + * that the display does NOT update any plane until ALL fences are si=
gnaled.<br>
&gt; + *<br>
&gt; + * Test setup:<br>
&gt; + * - Primary plane: buffer with a signaled fence (already retired)<br=
>
&gt; + * - Overlay 1 plane: buffer with a signaled fence (already retired)<=
br>
&gt; + * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running o=
peration)<br>
&gt; + *<br>
&gt; + * Expected behavior:<br>
&gt; + * - Atomic commit succeeds immediately (non-blocking)<br>
&gt; + * - Display waits internally for ALL fences before updating<br>
&gt; + * - No plane shows its new buffer until the unsignaled fence complet=
es<br>
&gt; + * - After signaling the last fence, all planes update atomically<br>
&gt; + *<br>
&gt; + * Bug detection:<br>
&gt; + * If the driver has a bug, it will either:<br>
&gt; + * 1. Show the primary and overlay1 buffers prematurely (before overl=
ay2's fence signals)<br>
&gt; + * 2. Cause visual glitches from fence mismanagement<br>
&gt; + * 3. Fail the atomic commit<br>
&gt; + */<br>
&gt; +static void multiplane_atomic_fence_wait(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int timelines[NUM_PLANES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int fences[NUM_PLANES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int out_fence;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *planes[NUM_PLANES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const char *plane_names[NUM_PLANES] =3D { &q=
uot;Primary&quot;, &quot;Overlay1&quot;, &quot;Overlay2&quot; };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool should_signal[NUM_PLANES] =3D { true, t=
rue, false };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Starting multiplane atomic f=
ence wait test\n&quot;);<br>
&gt;IMHO, this(&amp; most of the below igt_debug statements) do not add any=
 real<br>
debug value. Please consider dropping most of them unless it is clearly<br>
helping in failure diagnosis.</div>
<div style=3D"font-size: 11pt;"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Sure, I'll drop the debug statements which are not helpful</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_require_sw_sync();<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Initial modeset to establish baseline (no=
 fences) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Setting up initial display c=
onfiguration...\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_crtc(data-&gt;output, igt_crt=
c_for_pipe(&amp;data-&gt;display, data-&gt;pipe));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary, &amp;data=
-&gt;primary_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1, &amp;dat=
a-&gt;overlay1_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay1, OV=
ERLAY1_POS_X, OVERLAY1_POS_Y);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2, &amp;dat=
a-&gt;overlay2_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay2, da=
ta-&gt;width - OVERLAY2_OFFSET -<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay2_fb.width, OVERLAY1_POS_Y);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display, C=
OMMIT_ATOMIC);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Initial display setup comple=
te\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Setup arrays for loop-based processing */=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; planes[PLANE_PRIMARY_IDX] =3D data-&gt;prima=
ry;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; planes[PLANE_OVERLAY1_IDX] =3D data-&gt;over=
lay1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; planes[PLANE_OVERLAY2_IDX] =3D data-&gt;over=
lay2;<br>
&gt; May the above part could be a separate setup function so that the test=
<br>
function is easier to read. Not a must have, good to have.</div>
<div style=3D"font-size: 11pt;"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Sure I'll do that !</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Create timelines and fences for all plane=
s */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Creating timelines and fence=
s for %d planes...\n&quot;, NUM_PLANES);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; NUM_PLANES; i++) {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Create timeline */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; timelines[i] =3D sw_sync_timeline_create();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(timelines[i] &gt;=3D 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Create fence at sequence 1 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fences[i] =3D sw_sync_timeline_create_fence(timelines[i], 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(fences[i] &gt;=3D 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Signal fence if needed (first 2 planes) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (should_signal[i]) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sw_sync_timeline_inc(ti=
melines[i], 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fenc=
e_status(fences[i]), 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;&nbsp; =
%s: fence SIGNALED (fd=3D%d)\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plane_names[i], fences[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fenc=
e_status(fences[i]), 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;&nbsp; =
%s: fence UNSIGNALED (fd=3D%d) - blocks commit\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plane_names[i], fences[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Attach IN_FENCE_FD to plane */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fence_fd(planes[i], fences[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* swap overlay colors to see visible change=
 from the previous scanout*/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1, &amp;dat=
a-&gt;overlay2_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay1, OV=
ERLAY1_POS_X, OVERLAY1_POS_Y);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2, &amp;dat=
a-&gt;overlay1_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay2, da=
ta-&gt;width - OVERLAY2_OFFSET -<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay1_fb.width, OVERLAY1_POS_Y);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Request OUT_FENCE to track when display u=
pdate completes */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_request_out_fence(igt_crtc_for_pipe=
(&amp;data-&gt;display, data-&gt;pipe));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The atomic commit should succeed imm=
ediately (NONBLOCK mode),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * but the display should NOT update an=
y plane until ALL fences<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (including the unsignaled overlay2 f=
ence) are signaled.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * A buggy driver might:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Show primary and overlay1 immediat=
ely (wrong!)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Cause visual corruption<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Fail the commit<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_display_try_commit_atomic(&amp;d=
ata-&gt;display,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; DRM_MODE_ATOMIC_NONBLOCK,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Atomic commit SUCCEEDED (non=
-blocking)\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get the out fence to monitor completion *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; out_fence =3D igt_crtc_for_pipe(&amp;data-&g=
t;display, data-&gt;pipe)-&gt;out_fence_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(out_fence &gt;=3D 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Got OUT_FENCE_FD=3D%d to mon=
itor display update\n&quot;, out_fence);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Verify overlay2 fence (last one) is still=
 unsignaled */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(fences[PLANE=
_OVERLAY2_IDX]), 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Overlay2 fence still UNSIGNA=
LED - display should be waiting\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Verify out fence is also unsignaled (disp=
lay hasn't updated yet) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_status(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret =3D=3D 1) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_warn(&quot;OUT_FENCE already signaled - this may indicate the &quot=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;driver is n=
ot waiting for all IN_FENCEs correctly!\n&quot;);<br>
&gt; Shouldn't we be already asserting here? no point in the test going ahe=
ad?</div>
<div style=3D"font-size: 11pt;"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Yes, Thanks for pointing out</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_debug(&quot;OUT_FENCE still unsignaled - display correctly &quot;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;waiti=
ng for fences\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Wait a moment to ensure the display =
really is waiting.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * In a buggy implementation, the prima=
ry and overlay1 planes might<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * show up prematurely during this dela=
y.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Waiting %dms to verify displ=
ay doesn't update &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &quot;prematurely\n&quot;, VISUAL_DELAY_US / 1000);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; usleep(VISUAL_DELAY_US);<br>
&gt; The visual verification(if required) should be a command line option<b=
r>
passed which can be enabled when required and be disabled by default, as<br=
>
on CI this manual verification will not be done. Instead can we add a<br>
CRC check here to verify there is no visual change?</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">I'll change this visual inspection to crc check in the next revision</di=
v>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Check if out fence signaled prematurely *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_status(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret =3D=3D 1) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_critical(&quot;BUG DETECTED: OUT_FENCE signaled before &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;overlay2 fence was signaled\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_critical(&quot;This indicates the driver updated the display &quot;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;without waiting for all fences\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(0, &quot;Display updated prematurely before all fences sig=
naled&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Display has not updated yet =
(waiting for overlay2 fence)\n&quot;);<br>
&gt;This should be just igt_assert_f(ret =3D=3D 1, &lt;&gt;)</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Okay got it</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Now signal the blocking fence (overlay2) =
*/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Signaling the blocking overl=
ay2 fence&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sw_sync_timeline_inc(timelines[PLANE_OVERLAY=
2_IDX], 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Wait for overlay2 fence to be signaled */=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_wait(fences[PLANE_OVERLAY=
2_IDX], FENCE_TIMEOUT_MS);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(fences[PLANE=
_OVERLAY2_IDX]), 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Overlay2 fence now SIGNALED\=
n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Now wait for the display update to comple=
te (out fence signals) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Waiting for display update t=
o complete (OUT_FENCE)\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_wait(out_fence, FENCE_TIM=
EOUT_MS);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(out_fence), =
1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;OUT_FENCE signaled - all pla=
nes updated atomically\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;TEST PASSED\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; usleep(VISUAL_DELAY_US);<br>
&gt; Same as above, should be a CRC check and an optional manual visual<br>
verification.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Will be changed to CRC check</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Cleanup: close test-specific resources (f=
ences and timelines) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; NUM_PLANES; i++) {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(fences[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(timelines[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fence_fd(planes[i], -1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; close(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_for_pipe(&amp;data-&gt;display, dat=
a-&gt;pipe)-&gt;out_fence_fd =3D -1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void test_fini(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Reset display state */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary, NULL);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1, NULL);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2, NULL);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_crtc(data-&gt;output, NULL);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display, C=
OMMIT_ATOMIC);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int igt_main()<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; data_t data =3D {};<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);<br>
Why do we need this to be specific to intel?</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">It need to ne specific and can be generic, I'll change accordingly</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_set_vt_graphics_mode();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_require(&amp;data.display, data.drm_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_require_output(&amp;data.display);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; setup_output(&amp;data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; create_fbs(&amp;data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Test atomic commit with 3=
 planes (1 primary, 2 overlay) &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;where 2 planes have signaled fences=
 and 1 plane has an &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;unsignaled fence. Validates that di=
splay does not update &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;any plane until all fences are sign=
aled, catching bugs &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;where drivers might prematurely dis=
play buffers or &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mismanage fence synchronization acr=
oss multiple planes.&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;multiplane-atomic-fence-wa=
it&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; multiplane_atomic_fence_wait(&amp;data);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; test_fini(&amp;data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cleanup_crtc(&amp;data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_fini(&amp;data.display);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_close_driver(data.drm_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; diff --git a/tests/meson.build b/tests/meson.build<br>
&gt; index 0ad728b87..a61395332 100644<br>
&gt; --- a/tests/meson.build<br>
&gt; +++ b/tests/meson.build<br>
&gt; @@ -35,6 +35,7 @@ test_progs =3D [<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_debugfs',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_dither',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_display_modes',<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; 'kms_explicit_fence',<br>
<br>
&gt; Please keep this in alphabetical order.<br>
<br>
Sure I'll change that.<br>
<br>
Regards,<br>
Karthik.B.S<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_dp_aux_dev',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_feature_discovery',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_flip',<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">With Regards,</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">S Sebinraj</div>
</body>
</html>

--_000_CH0PR11MB5427A75528B837E751D3D1A29896ACH0PR11MB5427namp_--
