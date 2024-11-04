Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819E2D1BDF2
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 21:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4C010E09E;
	Mon,  4 Nov 2024 21:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kokMxD6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E3810E09E
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 21:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730754666; x=1762290666;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=d0VW7q6KxWR0rty7iwDadezkxeTz3lhb8CDvui1J+PI=;
 b=kokMxD6CZe6vCAr5acqNz+KuHr6Srh4vZ1fCxT794wUKjlLyzuI4/DY/
 i5pnMLJGDSlveTJbwxW/v3t7zpe6S/KtKxVQyX0zKdK2D/o4slOlwMdMu
 HzpGsaACXoK+rl3crRgTS9QytAGC0+BwOF5z6/sK3F/SJJ2hJIaD+bHJg
 LBEPRm6OxbJzoJY94UGXljqnHOD3oTX+oxIrCrUYxupIf9fDeYHrCwBWw
 Uv890cFlJopeePAnGNNTY67IYiT0o0PoUworr9WqekSuYBxEQxgL8lUvN
 lIYwXfm81dTbBFImJn3Xb7WTnsIoA08JvYYNpd2/bkK7ca8aYK1Q9/Q0I w==;
X-CSE-ConnectionGUID: cZlvucx1RCCMShSbm6FNLA==
X-CSE-MsgGUID: /libjiquTpG+PY7POqWSFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41105781"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="41105781"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:11:05 -0800
X-CSE-ConnectionGUID: dIvIAaHbTyO2aZakn8fkXw==
X-CSE-MsgGUID: /udLxvfQT/WC+9cZI/zfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="84113019"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 13:11:05 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 13:11:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 13:11:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 13:11:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPlm9PEvpYfAM5IM8rQjJlyWidLJumjDVHZzQG4sdJnA0LAHWsQ/V4ceW62s8A5wFvO17k6NSVb8lrd6sk1YpCSZ6Z1HD2OHmx4XNT1H9XN+GhdK3GabGn3SiecrxBmzPkUBNXmvIpSZSy5j49vZyvEAE2/qZvAfavSuUj7TBx1totvZNYeQdN+cbMDOSVWhtDWkav2UgfeJEXmiAt7IrD0Z23j8i42aiJmjt8W1t/hbKtmLShnJHfbzfWN/CHq8z8eUAlHJIyr169j0OglF+5kCeQ8wR2fJdFMJSYoh1/62fzLJsokId42+DGzbrZwbbSe/sowyNvLnIfBJ5Y1K3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0VW7q6KxWR0rty7iwDadezkxeTz3lhb8CDvui1J+PI=;
 b=FBuk8EH0YfIGf00WBdjKTKaN1LrCwkZixgDFL/cuJmDpVA6ZfD/S5Ai7sj8CFdKXERI8wOejvznolIwMp1pXmTMWmdHSVXbkRJIJZjjQOyGmWxWj94n3U3kOoJ8AQxSAS2uaqmDewXXQPFReXiqlic+crXxgZHr8YLENwAVleiSmzcPj97//hE/YO2YyM0ZHEqdwqvUUJkyVtuASE0biYK+nnYEr2NOh23WhDcUaSeCqa90G/esfrcbcYHSa2bAg6WY960C6bgX2OIHr+ndv5Z4gcxnk8X0ic58y5aRNHslTYX0CG/ZDfTN8N64aJX+w6LSurvOcxPIUTqYuytyNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH0PR11MB8215.namprd11.prod.outlook.com (2603:10b6:610:182::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Mon, 4 Nov
 2024 21:10:56 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 21:10:56 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/2] oa/i915: Add ARL standlone oa files
Thread-Topic: [PATCH i-g-t v2 2/2] oa/i915: Add ARL standlone oa files
Thread-Index: AQHbLvukcaiKfZKfyEKrGLHhAL55CbKnnNSAgAABRIA=
Date: Mon, 4 Nov 2024 21:10:56 +0000
Message-ID: <1482d21ea72a8355751be4cc40c0b7317bec3578.camel@intel.com>
References: <20241104205201.175541-1-jose.souza@intel.com>
 <20241104205201.175541-2-jose.souza@intel.com>
 <85ses6yaia.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85ses6yaia.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH0PR11MB8215:EE_
x-ms-office365-filtering-correlation-id: cf090282-5fe9-4a6f-8813-08dcfd152c93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NHpjMkJNOWhrVTRRanNTMnpCL2srWnZ5MHZCM3JiZjVpMXV4di9FZVdHOXgy?=
 =?utf-8?B?TThta08xbTMxdDVQWnUrVTdqNGlOZ1Z6M0drRWQvcHUrM0t5d3FyejJLWHkw?=
 =?utf-8?B?Vi9zOFB1bzdGSjdMalU1VzlnWHRCYlcvakZhQ2VQRjhMSUpTbkpSR3JIOVJq?=
 =?utf-8?B?Z0VhS1Z5cnM3cHl4TGdXNEdOUkwyaFdpd2dHcVRLOUlTOHRadUNSci9vNWVp?=
 =?utf-8?B?WWpsVXVtUjdOK2RGajVBVkVDMysxWDcyQThKTkhYVHZrMlprTnRQYlVLUXd5?=
 =?utf-8?B?NHBrOUJWS1dKWmpHdzl4MG5IK0I1dkUrTS93UVRobkZyd3h6TkpNQWcwZVlT?=
 =?utf-8?B?Ym11WjdBcUtDckhKZ2xBcVBxbGVwNDZIejhKSzdiZWl6bHBKRitralE4dGFU?=
 =?utf-8?B?cStXWm90Q2hxUFF5THNuL1hQVU1Ia0xtTUsyZTBFK1FmanNjQUFEdVdrOGpW?=
 =?utf-8?B?TXkzWXVaaDRlWlV2c2M5UDRuMHN0YzhDRmRrUGs5Z1NhcG5xRnJ3SUpYTUE0?=
 =?utf-8?B?T3RjdUJMZlpLWW0yZWpkeTBRSVM5WEQzOHJSejBaYWdPRzd5aHoyRmdxMEph?=
 =?utf-8?B?R0wwNStOTC9IT3FxOFgwWU8zTjg5TmdMSFZOc2lpa2F1MGlIa1NMSkJZU0I1?=
 =?utf-8?B?S1I4ZWw5cDBMZGV1cGhFbk13Z20zNGlHTXpqUE1XUmNiL3lnTHE0eU1PbCtP?=
 =?utf-8?B?NDBSUXd2SndLeHY5Q3IrOG1ncEtEV25zR0xCa3FtbkdQZDB5MmdEZVR5ZmlM?=
 =?utf-8?B?U2tmQW5HS0IvV09UQ3crWnFHTUlXU0k2a2k1SFNHUUcrbGFjQnovL3pjYTYz?=
 =?utf-8?B?T0d4cEVBSnpPS3RFQW5SQUVPQWsxY29SVGJNV3FWN05RWVlpMnpsNFVHSXRW?=
 =?utf-8?B?U2NYWTQwZld6UHJWT2pGelkvRTVVQVp3aXd6UDNDaThrL0QyZlZBRnVEU25p?=
 =?utf-8?B?Y1p1QWRUNTZHR3RmR3RvL0dDUmRJNWhNNnU1QzQrSXYyQzg2a3dQdkQ5T1Rr?=
 =?utf-8?B?MXMraXdrNWhBLzdYU1g5L0FVckRpa0h2MHhtK0hWbGtscFQ0MWU4Z3FoQi90?=
 =?utf-8?B?VTd1TUxPTERrSGlHNmFZZmQ2aDNWTUl6Q0p0VCttL0lWclpkUzl2Q1BDVVJX?=
 =?utf-8?B?M2c1YVF4SGt1WUZOdE4yK1p6RTZxZS9ab0FuZmNPQ2IzczdCZ2I4R3VEQ093?=
 =?utf-8?B?emtKdHBNbnhaRklpTGpCa2dQeTI5U3FqdFNzbzc0b0FURkl0elhGN2Zxd2p1?=
 =?utf-8?B?ZjBzSFQvRTh4Y3lBTTNDRnpnUk1tZ1NmSE1rQkxLdXdYZFE4bXNyeDdRVitG?=
 =?utf-8?B?aU8zTHNzY1JPRXhwU1ROc0VWNXI4aEwvam5UR0FLMktXWU5TWVRGOWliSXRo?=
 =?utf-8?B?aTgzWG5ZbEdNRUZKbUJzaWI4bEZBMVBIUGw5MlNOUDZla2R6RUQrc1RvbENz?=
 =?utf-8?B?b3ViT3hHWnZwWWdEMHZObFFEaHY1SlBuanpRUzl4RVhKL3RVUmxjSXdqcnh3?=
 =?utf-8?B?NWx4OS83Ulg3UHF5c0NuZTNiY09zWkRjSjFTUE5EejNVZjhqaWl0R1I2YzlY?=
 =?utf-8?B?L0FIYzJEUjliaGdrbUlEc25ldllxTmcyU0xwclhWbitHOFl2cFVUeEtrTi9n?=
 =?utf-8?B?aXJ4NFhXS3hoY3JyYnM0SHM1TzhOTDUwZU54ZVZYRjRnRnUrNk9NbnFaNkpF?=
 =?utf-8?B?bTF5ZnBuZmkvY3JCZG9zRHhQUVI0ekRPWGFBVkR1ZS9Fd1R3RlNaU0lTb3RF?=
 =?utf-8?B?ZW1WNmdtVkNXaEZtbXJ1YUZzQWVDNEl6TytIZXFoaXczOTN6bm1XdzJ3WEho?=
 =?utf-8?Q?akzqV4n/2veQuhUPPv2RN9/Jzj8cNnDZIQrHY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXlKVUlETzNaaVB4b0lHdk5nMnZlM0pCN2VRdTdneFVhZHgxYVovM1RLZVpy?=
 =?utf-8?B?YjFOYlVZelFyOGRZRFc3VXZVejluVm5RR0M2c0syS1o4ZFVDZjF5OUgxRitM?=
 =?utf-8?B?OFBLOERBb2JHSW5MMDdBZmY1S2ZIQUFOODA4K3VYeWhSTEVQbS9EMmx1Ylgz?=
 =?utf-8?B?c1FuWVV1TDF5cG1NMG8vcnJwY25tREx6bVpLbTZUa2dGSVRUY2Y2L3ArTDRB?=
 =?utf-8?B?Z1Y3aHpaa2Z2d1I4ejVlelJHN2tpL1hKS2JWUWlKaHZYekk1dmFpNXJzYmow?=
 =?utf-8?B?eDlOQWppQjlwNlExTW5VYnRQYjVyUmhvaXNKYnplSjJBTU95N1dXc3lNQS9N?=
 =?utf-8?B?bVp2QnFqQ2toQ212ZUNqRWxjMzZWMVFXd0hJUUpCTlBNcnBGcTVrWHJPZm5Y?=
 =?utf-8?B?cy92MWFJZmpzcTI2RjFXRWx2NHM5a3RESERNRWNRRllLUmlNTktGSlVkZzl4?=
 =?utf-8?B?TzhOWUtnZ2RqMTMxZlpBRk83c0RpQzNNTFVZSmlRRlRuVzRKZC9XZTk2eEQ3?=
 =?utf-8?B?YXVLdENFQ2k3Und5bXByQjdoQWg1b01lR3Iwcm1sU1BVYk5peHhMUE5UbGdO?=
 =?utf-8?B?QWc0YzdSeUlvbkR2UHY5MDZEdzRUa3RGMDNJeFZEK2NWd1JpckdZU0JIbXF6?=
 =?utf-8?B?VVdiL2pkcnR3cnpGOHh1UkhPZkhseTk3NjBWNjhoc01RMlgzeDJ0WjJiVm41?=
 =?utf-8?B?M2t6Mnp0WDJzOEJ3b2dZNDhsRW9KUjZlZmhMMFhSclFleDc0bk1hNDdJcERK?=
 =?utf-8?B?U1RjTVhMRzd5L2ZhUlhaVy9aTEZmaWdvUTRzRk1jR3ZlSmtUUk0wMERHaXZY?=
 =?utf-8?B?aDdodXpXWnRjSWUvRkdYS3NIUWQvQ3hOUDJka1MwK3FrOEN3U1hQdVZtakN5?=
 =?utf-8?B?MEl5YldMU2FVWW9BdTBKZisyRXUwUXk2elFhK21aQnFYVmdKaU1nV2w0Vnd2?=
 =?utf-8?B?aFVuMnFRLzJjUFhwOHVieVJVNW1nZ2lnOWFTaWVLMDladzU0T252THVYbnla?=
 =?utf-8?B?SWxCY2hhNENjMFRPUzJWNkhEWFFJT3Ayb0dhOFJ2UC8wK2dsVWUrNVQzSUo1?=
 =?utf-8?B?WFo0VWxUZUx6TVJUUjNPcGs2Z3NoRXFCWmtaeGd0QWJMbnN5NmZkN25ZWGNX?=
 =?utf-8?B?U3ZYLzExdDR6VllLVmFBcjZ1cmlSWXhkOUxVRGpUeXZKYTVUdmUxT3ZId3Ni?=
 =?utf-8?B?VmF5TUwwbEN4clRVWjNrU2RIZHdUWXdiZjdBczZsNENzSGlQL3FNZnVUS0Zk?=
 =?utf-8?B?ZlhxSnB0Tlh5U25VRG1TQTk1UW16ZU9ONUZ3OWRrN2UzdE9QV2tvZTVwNFZF?=
 =?utf-8?B?R3JZeG9UMDFyZ05WR0w5WkhnaVhIeGtIcnN2eU1semNNY0ptZmlyZ0lMcHZG?=
 =?utf-8?B?Yy9rUHZRVktoSGh4QkxqdHVDb1FLQm1BbHQ4dDBrNGxxd1NmSVpCck9mR0xi?=
 =?utf-8?B?U2N0MGhid2tHK1c2UEt0dkJiZkljdkJudGdtWWYwd0VOejdwamljZDN5ZXJZ?=
 =?utf-8?B?Vkp6NEtENGNtc0xnNkVpNk94UTFsTmVVMVNZUG5TM1JIYVppeUYwM0VGaXZo?=
 =?utf-8?B?OTROVXg1QzkxSWV6K1NrTVlpQXp2OUxTRTM1alF0UlJsblVBbUhNVWdJQ3E4?=
 =?utf-8?B?NTRkOXNGSXVPYkQ5SXBpbElKYWFESHBUa1ppQy84ZTBOdFhnckZBT2pmQjAw?=
 =?utf-8?B?SjYwZFVlSHJ0eml5ZEtWcjNlLzJzTkQrMkJJZWZwMXUzdTFBUGNGNW9CZldi?=
 =?utf-8?B?aFRMZzR0cjFaWjdjZnFtSXUvTmZjR2F2SnZZWG9qTUJzdCtHbUVrVDRvd2dW?=
 =?utf-8?B?WS95UjA0NGpGN0hBdkY1emxYU0c1NnljeGlnWlpDWHBEWFpBQUljTWxqZk5Y?=
 =?utf-8?B?V3F0Mmh2T1hPd1FESitiTHBTOFVXd1hrVDZaN0F5ekdYOFE5TXBIUGdiVTl2?=
 =?utf-8?B?WFowWFRxUU85eU80SFpCZXZjcDlzaFBBSDNWd3JTdkNVRlorVitsdzBUdXB2?=
 =?utf-8?B?UkF6Wk1jTVlQWlNvYm5vVVJmdVdSWlhLejEzemdWcDVPZ3JldFhNaW1NV2lu?=
 =?utf-8?B?N2MzdGEzdm9GeXltbzJFeE1kMnBkVFcxS2hzK2lRZXNyTnZxWTQ5a1plYlda?=
 =?utf-8?Q?fvhTYgm3yBKhP7tlrUoJY+28/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BFF5D2035D8A8408D06247C504C4739@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf090282-5fe9-4a6f-8813-08dcfd152c93
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 21:10:56.3448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8D6tKfsKphNfJ9OpZqqjcM9KVrUCh+T6XTrSiqxPFMunhGwZDlJAPGp7ZHge8JSF9UJrfUbZCxfKXwOBjw+gyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8215
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

T24gTW9uLCAyMDI0LTExLTA0IGF0IDEzOjA2IC0wODAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIE1vbiwgMDQgTm92IDIwMjQgMTI6NTI6MDAgLTA4MDAsIEpvc8OpIFJvYmVydG8gZGUg
U291emEgd3JvdGU6DQo+ID4gDQo+IA0KPiBIaSBKb3NlLA0KPiANCj4gPiBUaGVyZSBpcyBzdWZp
Y2llbnQgZGlmZmVyZW5jZXMgYmV0d2VlbiBnZW5lcmF0ZWQgQVJMIE9BIGZpbGVzIGFuZA0KPiA+
IE1UTCBvbmVzIGZvciB1cyB0byBnZW5lcmF0ZWQgYW5kIHNwbGl0IEFSTCB0byBpdHMgb3duIGZp
bGVzLg0KPiA+IA0KPiA+IHYyOg0KPiA+IC0gYWRkIG1pc3NpbmcgYXJsIGNoZWNrIGluIHBlcmYt
bWV0cmljc2V0LWNvZGVnZW4ucHkNCj4gDQo+IFRoZXNlIHdvcmsgdGhpcyB0aW1lIGNvcnJlY3Qs
IHVubGlrZSB0aGUgbGFzdCB0aW1lIHdoZXJlIHNvbWV0aGluZyB3YXMNCj4gd3Jvbmc/IE1heWJl
IGl0IHdhcyBkdWUgdG8gdGhpcz8NCg0KWWVzLCBpdCB3YXMgbm90IHdvcmtpbmcgYmVjYXVzZSBp
dCB3YXMgbWlzc2luZyB0aGlzIGNoYW5nZS4NCg0KPiANCj4gVGhlIHN1YmplY3Qgc2hvdWxkIGJl
IGxpYi9pOTE1L3BlcmYgKHdoaWNoIEthbWlsIHJlcXVlc3RlZCB0aGUgbGFzdCB0aW1lKSwNCj4g
YnV0IEkgY2FuIGZpeCB0aGF0IHVwIGJlZm9yZSBtZXJnaW5nLiBVbmxlc3MgeW91IGNhbiBtZXJn
ZSwgaW4gdGhhdCBjYXNlDQo+IHBsZWFzZSBmaXggdGhpcyB1cC4NCj4gDQo+IE90aGVyd2lzZToN
Cj4gDQo+IFJldmlld2VkLWJ5OiBBc2h1dG9zaCBEaXhpdCA8YXNodXRvc2guZGl4aXRAaW50ZWwu
Y29tPg0KDQpUaGFuayB5b3UsIHdpbGwgb3BlbiB0aGUgTWVzYSBNUiB0b2RheSBsZXRzIGhvbGQg
dGhlIG1lcmdpbmcgdW50aWwgTGlvbmVsIGdpdmVzIHNvbWUgZmVlZGJhY2suDQpCdXQgbm93IGl0
IGlzIHdvcmtpbmcuDQoNCj4gDQo+ID4gDQo+ID4gQ2M6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9z
aC5kaXhpdEBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IA0KDQo=
