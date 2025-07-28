Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FABAC83F17
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 03:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128DA10E06D;
	Mon, 28 Jul 2025 03:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXfcgfPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EDB10E06D
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 03:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753674706; x=1785210706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l16d/gAxjlaUA+EKYvY1eeWGsfvpKf9A9llxBPWHvsY=;
 b=BXfcgfPTACwwdgYBPnCPOtrYM+5UOeqnaTHO0BzjLM9IBD5qEZ3gqL2K
 bO+pUieeGGM+OVdwJ8BAunW0jEuFEGbUDd/G20KoAgHWjldwpzakGoc12
 FRFAUx2nrdhJAqNcOVewveyUoFT6owbOD+qU46LrOgj6UIt0hpj2/0jN3
 8TphuGd/Xa1L9vi+zlfVzaVvxVAu6AVxOvFtQD88wgCpBopcoYg0EXygw
 QoQIsg5dUBtM1hfNtE1hwG++WaAfeMrIskpfrteEQTdX8xH1Tte+Wfv1+
 ikFxYywL2SrSlwrrwlD8DTxF6XqdWDPWXrpH2nIiRRDHG87W/81WABtR+ w==;
X-CSE-ConnectionGUID: QQ2ZProTToaQr5pcUTmG7A==
X-CSE-MsgGUID: 6y1K8ycZTUWAU8Dm52cdvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="54994189"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="54994189"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 20:51:28 -0700
X-CSE-ConnectionGUID: l9M+GDwrSaa9L2jexubfiw==
X-CSE-MsgGUID: tKVt1pQCSlahfDmXw3iAtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161593109"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 20:51:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 20:51:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 27 Jul 2025 20:51:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 20:51:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6o/L2AtkaAGlQ2oeMn1q03tqZ+ZqRASH5WJg5vnXA95sfNKAEpk8HuMw2dV2mQl+vuWjhjXBDjpdQ38L6EbJOXa7M4cmNDBPEYHLOll2DAtO0aRVo4tZzW0kBMZEd1cL9qko+DM4iUi8NtRiOrD5chkS6+Kfm0pXVEPH9dszJidwAZjJnzNVxIoZmQT5UUc/st//2WC/ppfYMJGzxPm07KMrBTXU5AFu8TUcMStgFFVNjJcN6jr5DNVbU4c6M3PibJCyjB4d+xhHI5ojdZp4EGEOhuHOnvkFEj8qtHYU83koZZz8MySfyKzyRgOij7VIfbFCzjBMusVsxwe+18sJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l16d/gAxjlaUA+EKYvY1eeWGsfvpKf9A9llxBPWHvsY=;
 b=i12ew0HghrKujUPhf0UReUr7FcmQlWDDkqx/RPaH5IeeRWz+sR1ff2ZUIFK2DXAhuEeu5H3dhSd59qA+btKvFXJx2p0ktGAKeqONF458808XJ5qaBLupESYIn4TvUb/1iNaypmQ7RWixSlWnL/3ltHDQnnAhdTiCSyB2EQneyqCAbfdiPQv7N2HfkTYJ1ZwhIRg8w7Z81lrOdK7lQJQ/bguv3TOa0q+o0pDK/A4AuH6SmJpqlHoBnF0GpvJysu/Lst+wyQBG4mjqPp79tOMlBXS0u74LMioACTYnDRhVi+3jrn/npqNao6F6gfnaIVQCp0q4hlwSgm/0XYunlMv1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 03:51:09 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%4]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 03:51:09 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B S,
 Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_plane_alpha_blend: Reduce test complexity
 for simulation
Thread-Topic: [PATCH i-g-t] tests/kms_plane_alpha_blend: Reduce test
 complexity for simulation
Thread-Index: AQHb+M6/wOiOmu64W0K0Mq4rewzdULQ/WmQAgAeZbkA=
Date: Mon, 28 Jul 2025 03:51:09 +0000
Message-ID: <PH7PR11MB6053CFD1B97A496662B1F36FE75AA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250719170838.1340070-1-pranay.samala@intel.com>
 <20250723074714.m7qby7w6msm3dq42@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250723074714.m7qby7w6msm3dq42@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA0PR11MB4655:EE_
x-ms-office365-filtering-correlation-id: 95e0e762-d23c-46ab-76b8-08ddcd89fd1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Rm96MEpOSWxydUZMVlo5aVFWVE9iNXgwekpFZWljWkVhVC9JNjVaZkdBbGM2?=
 =?utf-8?B?MkRyeHlUWlFsTkRxVS96Z0dLMXJCYmx2SXVEVzNMeVQ2V0Y5ME5qczBuVkxZ?=
 =?utf-8?B?TVllMEMxNlBhRmlpVEp3allkZG9Kd1Z1UFJTOThGVkxScUFTb29OSnEvWFFX?=
 =?utf-8?B?QUwvYUhuNnRXOWxJZkREZ2p5Q29tUExTNUd5enI1M2pnclJPaUd2TkZYM1Nk?=
 =?utf-8?B?WmFldVFFV0tIMW1LdjhkSFV6K0hFMTVyS2FMY1dHMWR6dTJhemZKVFUzY1VJ?=
 =?utf-8?B?Mm82UzdGdTFKajVGSkVZUnNDWkUxQUpJR3NzdzdaOEN3dEFrVlMzSWMrWmJr?=
 =?utf-8?B?QVFCR3FNcVFtNkFQUytjMU1TZVJwTUJuN1lLQk1yL2ZaM3FTSjZkL1hSWjBX?=
 =?utf-8?B?WEVpNE1TNnA2ZXdRU2xhNHAvaEVZZU9qaWgxbG96dEd3clhER2I2SW1TSHd4?=
 =?utf-8?B?V0UvTmRad0tuUDVhZjhUUE9kNzRhY0VTMXlja0pjeUowL3FNc0RiYjNlMkJi?=
 =?utf-8?B?ZnhjdEdreDhNc0ZoTUp1S20zaU41Q2pPRWxhSldiWnNWQjdhWGdKMEd6OEJP?=
 =?utf-8?B?WUM0a1JSYTVrSlFTN0lBVFlCTjFpY1Y5dTRIQkxVNHFuZktoMW9nQ2ZXak5R?=
 =?utf-8?B?aUcySnZ4bk03TC9iVjhPZnFtR0wvWU1meXV0ZE1XOFkxcUJnMVRzeTdsY0hG?=
 =?utf-8?B?MlFRbXVJc3ZFbWZ1bDhWNTNGWkdpL2NqMDU5RUlrQWF0ZTdtSGtZZWZUR2pw?=
 =?utf-8?B?Zlc1eVBiK3VycmFXZlZMT0k5N0dHOGVKdmNxLzNFN2RqNUx0VEw4bXZmNVhy?=
 =?utf-8?B?UGdNaTBGQkc3SXdQQ1hQNy80TEtiYmFVcUp3Y3RQbnU0RDNLUG94MXErNUFw?=
 =?utf-8?B?WTBsVHpqcU9jcDNWQm9GTFBTd05pZHNxU0M5R01yZFhiTG9Vd3ZRckJLeXZy?=
 =?utf-8?B?RXNJb3JidnkxYUVHS0J3b3pxdXZoT1A4aC9Rb2xEVFdYRUt6SnNNdnBNQVE1?=
 =?utf-8?B?Tlh1YlYrY0NSZE9hZzMrN21mN0t1Ly9oWDA2ZEM2cXFCQ2lldGYvb204OTcx?=
 =?utf-8?B?MkI1WTJFQ2pldVZuR3h4RUM0TFRac3VLbHFhMjJwaTZJTEwraU1kT1M4eUU0?=
 =?utf-8?B?blBSUU1HQWRyTXh3UmFSVDdtRUdVVjZDNUswQ3Q1dGhqeU1LTmE0T2dLTTFh?=
 =?utf-8?B?Z0ExaUFVbUY2d3BUekcrV09VUmtkTGNJN044azNtWWM5N3ZPbXdNVVlDdlZx?=
 =?utf-8?B?OG8xVC9ySmNnUFpWRWk1TlllbjY3SWllTklUdDY5NWNGaTR0R2QxQ0RUUGRl?=
 =?utf-8?B?Q2l2N2RCQmNDN1gxeGw1SW5zdXdCN3lKcUFBWTdQSEZaNHhxc2R4eit1aWJN?=
 =?utf-8?B?VFljbkg0ZCtGaTdFN3FlejQ1YW1xaC9EK3J3U1ZieU13WjY2ZDBFQWFZRGM2?=
 =?utf-8?B?V3BSQXh6cDl1WnFycUZMT0E5ZWErNkF6eHVUWjRMS2toajdmUDhrWlNuZWI3?=
 =?utf-8?B?OTdHZ1NrM1dDbEFrbU1mMnV2K0h6NE5LYnBteDdEdGNXR21hR3NNYjJKN0Qz?=
 =?utf-8?B?bFVrVnI2TTJwbFowSStiZHBwQ2dnMXRGNndMZ2lGSmlLdWFFOW1TZ1Zqd0t5?=
 =?utf-8?B?cXJyTy8zZW83TlowSzN6ZzNuZVE0SWwwNzdHV0JweVdUaFpleU1BUUcycmZQ?=
 =?utf-8?B?MC9ab01yOWM3aFV5eTVrbkNSaGJ5NzF4ZUl6UEYrd2dmZ1NkdTVoUUw2MWFt?=
 =?utf-8?B?bk5XeWlEQ3Vac0hNVDF3TWU1RVpxZElOQUg0eFJGbkpESVFCYUF0dzV1cjJR?=
 =?utf-8?B?NjI5OVk4aWdudXErZDJiUTBMZGJodmFSekROdDBTenprcVR0WUx0cVNna0hv?=
 =?utf-8?B?SERZMnovT2xEOGJKN3pEMER5SVViQm5EbjFnSU5IS2pZbFlNWjVTQUFVd2xE?=
 =?utf-8?B?bVpYbUhnWXUxSTJ0cVNNbG5yelRxSDJxMTBUazhGVUhUMmNLd2VtVnczdHZ4?=
 =?utf-8?B?QVRSRkMxU0tnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE5TSHdKRndBdTdUSmlydWpNdk9zRk0vU080V3JQbmxMRVI4WEJYekFya3BD?=
 =?utf-8?B?ZlFEV05kQTR1UDYyNk1xNnltQmRrM09oN1c2N2d6N25kejNFTFM2bEt0MXJi?=
 =?utf-8?B?ckI5Y2p5bW1KcmsvbktRUWV0cW8zUFVaeENpL3RmOWlERzFva0JuaVB2SEJl?=
 =?utf-8?B?L2QrZ2VmUlpxOVE1K1FUMW9YSjFTSFRtWkZXZjdEWkhNZWRqT2JhT0w5a1F5?=
 =?utf-8?B?V083NjBweW9JaTNtYjBwNWNXZWlWTGcxd1dRTHVXbitsWVp3anQ4VGUrYXIw?=
 =?utf-8?B?S3RjU2g0T04xQ1pqNE5rb2E4TkFwSWk4bGJ6cWdjOUkzT2pRaDZuTU1aS05y?=
 =?utf-8?B?cE1sL2ZlZ2JzVnZvVnc1VFkvTnZ4YythYTFya2lMZFNvOUMxcDRjQjZodUJp?=
 =?utf-8?B?NVEzWCs2N1BHVkNONDB4WCtiYkJLMmMzQmFkS1ZHRlhaekl6UElQN3FIVko3?=
 =?utf-8?B?ajBobUwzODY0ejZSYTdPTFVTOXlXN1o0amtKdGN2TTFoUW9Pb295djRYdE04?=
 =?utf-8?B?TjMvSkFqVEpRRmhRMDZTWjBFYi85ZVdjVzVlb2swNmVFWW5XWHd6eVNNRHJk?=
 =?utf-8?B?Ukttald0dHlsUkhnS3NmTkUyWmg5aUJHNE9tQldCeUJoUXhQSTkybTBGeHJn?=
 =?utf-8?B?V0NpRzYwczBjYmh3NkFEZ3VaMlhOcGgzRVR5YzVYMTZMVzFhS0M2K0tqaHpT?=
 =?utf-8?B?WVNsc3JRaG5KaXE1ZkRsNm82clZVL3NnYkZYU0NNek1WU0lJTXJGVlUrYmpF?=
 =?utf-8?B?V1RHdnUxcHZYcWdYbkFIbWVtVGRqYmpveHA1NlQ4TURxRTJncDhnaDFYOC9S?=
 =?utf-8?B?Rk1XV3VmbTFMTGhObHZTUWppdTkvU0NKaUQ0SDB5ZXZ5UW5RanB3MkVmdVFK?=
 =?utf-8?B?d0ppK3FoYms2MFNwQ2xvTkhKaEdhMVVrWEdRNU90RkdrVFlLcEtuSHA4UURj?=
 =?utf-8?B?Tjlua2JRNkozQ2Y3SGV2dHlZVnpqVStnT25KbHhLUTAzUjB1SnJTN0JlWFQw?=
 =?utf-8?B?RlFXRzhpNWdwVjZGN0llSVlKbVcwNDVXQ0NRM2JkSHZDYjdwMjNFT3BRc2Zr?=
 =?utf-8?B?MUdPMGxsemxEWmNjM2x4K1F3MW13RU5BUkR2Skl1d1VsKzltc0lTTHFwTnVP?=
 =?utf-8?B?Z3c4M0MvR1drTlBjQ2lrZWIrbytkZWRvUmhGU295dDQ2U1JMVnFOTWNqNS9z?=
 =?utf-8?B?aVU2VjFtbVRKQ29jRVJidjZNeWZPdFRaVElqY2xjbmtEeEtHMUtqSXArU2s3?=
 =?utf-8?B?cXJLWDczaStTbDJRYm4wMTI5RUVFdys0UTU4UkZpdDBveWVTZTIyNUZibVNV?=
 =?utf-8?B?TE5OZkN2YmhFNmpoR1lNeDRIVTJLSDMxdUkzc3Q3MmtsUHdMM2tMNEU1MU55?=
 =?utf-8?B?d1B0ZWhyaWJyeXZjcmczNzFGZ1ZHUGtsMXV2K0hiYXJ2dVgyWVhReHA3U3Yx?=
 =?utf-8?B?K0xTa1NVK3ZvQzJGakdDd0Vzc3VleFExQTY4bHZ5Y0RQUEMwWUhyVm81ZEsx?=
 =?utf-8?B?ckc5cGNhWE1OeHgxUzFJWXNoVXdoYmYyNk53eXRGZE43VFVHNGtWWUNteE9o?=
 =?utf-8?B?c0ExUU00K0hPOXJSYS9iQ3o4ZVNlem5KNmdwK0E2NUJxQVFXNGZESm8xR0cz?=
 =?utf-8?B?ZlZsMERpQ1FDdFNxZkduZUhlL2d1UDBhZ3haaDZySW1mdlZkUWhpY3pMYm9V?=
 =?utf-8?B?MlBGMmorZjB0b1lsN2xNb291dVM2M2VoYkNpYWVMSm5LTG5vNFVoVXdocFQx?=
 =?utf-8?B?NXoxZDl2Y1NSV2ZQT1pMbkZZMkhINWtRRnlQU3lXTjJOZDJFVE9PK2l4ZFdh?=
 =?utf-8?B?ZHV1OFc3Tmk5UlNaeU56MG5hNW5jbVdnREx0TUVTL2cvWC9NRDJFc0QyWFpI?=
 =?utf-8?B?elZtQTd5WDl4Sm5xY0lyTUQ2U0dPM1pBNm9mT2RIdEc4N20rTnZ5S1lwYWZk?=
 =?utf-8?B?dU5ud1BLNEtQTXh2a2FkYnZnbjJ6TW9KaUxoNWJrY01Qc0RyaWxmc2JiTmZO?=
 =?utf-8?B?bGNXRWkrSGtoNklOaVYzMDI5dnBDUjBrZmNzYmpYVkkyWDZoNS9mcXRSQmV4?=
 =?utf-8?B?dTVQYVNwQWNmV2VVbnhMeDhhbXc0S0JuU3QraTl1MFBXUXkwa2JKeE41WU1Y?=
 =?utf-8?Q?X780BYPwVssiV7JJDOccX8CmV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e0e762-d23c-46ab-76b8-08ddcd89fd1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 03:51:09.6819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QptRr208EWHL7VFxfDoqnNl4OCjzhdncBvjUzM+cVnOGz+KZeyVZyhuLrUPbeRpygsP/b2LrF0mk1Z0ZrH8eaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
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

SGkgS2FtaWwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwg
S29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIEp1bHkgMjMsIDIwMjUgMToxNyBQTQ0KPiBUbzogU2FtYWxhLCBQcmFuYXkgPHByYW5h
eS5zYW1hbGFAaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IEIgUywgS2FydGhpayA8a2FydGhpay5iLnNAaW50ZWwuY29tPjsNCj4gTGF0dGFubmF2YXIsIFNh
bWVlciA8c2FtZWVyLmxhdHRhbm5hdmFyQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCBpLWctdF0gdGVzdHMva21zX3BsYW5lX2FscGhhX2JsZW5kOiBSZWR1Y2UgdGVzdA0KPiBjb21w
bGV4aXR5IGZvciBzaW11bGF0aW9uDQo+IA0KPiBIaSBQcmFuYXksDQo+IE9uIDIwMjUtMDctMTkg
YXQgMjI6Mzg6MzggKzA1MzAsIFByYW5heSBTYW1hbGEgd3JvdGU6DQo+ID4gUmVkdWNlIHRoZSBu
dW1iZXIgb2YgcGxhbmUgYWxwaGEgdmFsdWUgaXRlcmF0aW9ucywgYW5kIGxpbWl0IGV4ZWN1dGlv
bg0KPiA+IHRvIGEgc2luZ2xlIHBsYW5lIGZvciBlYWNoIHBpcGUgdG8gZW5hYmxlIHRoaXMgdGVz
dCBvbiBzaW11bGF0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUHJhbmF5IFNhbWFsYSA8
cHJhbmF5LnNhbWFsYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ttc19wbGFuZV9h
bHBoYV9ibGVuZC5jIHwgMTMgKysrKysrKysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0
cy9rbXNfcGxhbmVfYWxwaGFfYmxlbmQuYw0KPiA+IGIvdGVzdHMva21zX3BsYW5lX2FscGhhX2Js
ZW5kLmMgaW5kZXggMDQ3Y2M1N2I0Li42OTZiYjFlNWUgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMv
a21zX3BsYW5lX2FscGhhX2JsZW5kLmMNCj4gPiArKysgYi90ZXN0cy9rbXNfcGxhbmVfYWxwaGFf
YmxlbmQuYw0KPiA+IEBAIC03OSw2ICs3OSw4IEBAIHR5cGVkZWYgc3RydWN0IHsNCj4gPiAgCWln
dF9waXBlX2NyY190ICpwaXBlX2NyYzsNCj4gPiAgfSBkYXRhX3Q7DQo+ID4NCj4gPiArc3RhdGlj
IGJvb2wgaW5fc2ltdWxhdGlvbjsNCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIF9fZHJhd19ncmFk
aWVudChzdHJ1Y3QgaWd0X2ZiICpmYiwgaW50IHcsIGludCBoLCBkb3VibGUNCj4gPiBhLCBjYWly
b190ICpjcikgIHsNCj4gPiAgCWNhaXJvX3BhdHRlcm5fdCAqcGF0Ow0KPiA+IEBAIC0yODksNyAr
MjkxLDcgQEAgc3RhdGljIHZvaWQgYmFzaWNfYWxwaGEoZGF0YV90ICpkYXRhLCBlbnVtIHBpcGUN
Cj4gPiBwaXBlLCBpZ3RfcGxhbmVfdCAqcGxhbmUpICB7DQo+ID4gIAlpZ3RfZGlzcGxheV90ICpk
aXNwbGF5ID0gJmRhdGEtPmRpc3BsYXk7DQo+ID4gIAlpZ3RfY3JjX3QgcmVmX2NyYywgY3JjOw0K
PiA+IC0JaW50IGk7DQo+ID4gKwlpbnQgaSwgbWF4X2FscGhhX3ZhbHVlOw0KPiA+DQo+ID4gIAkv
KiBUZXN0Y2FzZSAxOiBhbHBoYSA9IDAuMCwgcGxhbmUgc2hvdWxkIGJlIHRyYW5zcGFyZW50LiAq
Lw0KPiA+ICAJaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNwbGF5LCBDT01NSVRfQVRPTUlDKTsgQEAg
LTI5OCw4ICszMDAsMTANCj4gQEANCj4gPiBzdGF0aWMgdm9pZCBiYXNpY19hbHBoYShkYXRhX3Qg
KmRhdGEsIGVudW0gcGlwZSBwaXBlLCBpZ3RfcGxhbmVfdA0KPiA+ICpwbGFuZSkNCj4gPg0KPiA+
ICAJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgJmRhdGEtPmFyZ2JfZmJfMCk7DQo+ID4NCj4gPiAr
CW1heF9hbHBoYV92YWx1ZSA9IGluX3NpbXVsYXRpb24gPyAxNjAgOiAyNTY7DQo+ID4gKw0KPiA+
ICAJLyogdHJhbnNwYXJlbnQgZmIgc2hvdWxkIGJlIHRyYW5zcGFyZW50LCBubyBtYXR0ZXIgd2hh
dC4uICovDQo+ID4gLQlmb3IgKGkgPSA3OyBpIDwgMjU2OyBpICs9IDgpIHsNCj4gPiArCWZvciAo
aSA9IDc7IGkgPCBtYXhfYWxwaGFfdmFsdWU7IGkgKz0gOCkgew0KPiA+ICAJCWlndF9wbGFuZV9z
ZXRfcHJvcF92YWx1ZShwbGFuZSwgSUdUX1BMQU5FX0FMUEhBLCBpIHwgKGkgPDwNCj4gOCkpOw0K
PiA+ICAJCWlndF9kaXNwbGF5X2NvbW1pdDIoZGlzcGxheSwgQ09NTUlUX0FUT01JQyk7DQo+ID4N
Cj4gPiBAQCAtNTY0LDYgKzU2OCw5IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0X29uX3BpcGVfcGxh
bmVzKGRhdGFfdCAqZGF0YSwNCj4gZW51bSBwaXBlIHBpcGUsIGlndF9vdXRwdXRfdCAqDQo+ID4g
IAkJaWd0X2luZm8oIlRlc3RpbmcgcGxhbmUgJXVcbiIsIHBsYW5lLT5pbmRleCk7DQo+ID4gIAkJ
dGVzdChkYXRhLCBwaXBlLCBwbGFuZSk7DQo+ID4gIAkJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwg
TlVMTCk7DQo+ID4gKw0KPiA+ICsJCWlmIChpbl9zaW11bGF0aW9uKQ0KPiA+ICsJCQlicmVhazsN
Cj4gPiAgCX0NCj4gPg0KPiA+ICAJaWd0X291dHB1dF9zZXRfcGlwZShvdXRwdXQsIFBJUEVfTk9O
RSk7IEBAIC03NDMsNiArNzUwLDggQEANCj4gPiBpZ3RfbWFpbl9hcmdzKCJlIiwgTlVMTCwgaGVs
cF9zdHIsIG9wdF9oYW5kbGVyLCBOVUxMKQ0KPiA+ICAJCWZvcl9lYWNoX3BpcGUoJmRhdGEuZGlz
cGxheSwgcGlwZSkNCj4gPiAgCQkJYWN0aXZlX3BpcGVzW2xhc3RfcGlwZSsrXSA9IHBpcGU7DQo+
ID4gIAkJbGFzdF9waXBlLS07DQo+ID4gKw0KPiA+ICsJCWluX3NpbXVsYXRpb24gPSBpZ3RfcnVu
X2luX3NpbXVsYXRpb24oKTsNCj4gDQo+IFNldCB0aGlzIGluIGZpcnN0IGZpeHR1cmUgaW4gaWd0
X21haW4sIG5vdCBoZXJlLg0KSSBoYXZlIHNldCBpdCBpbiB0aGUgZmlyc3QgZml4dHVyZSBpbiBp
Z3RfbWFpbi4NCg0KUmVnYXJkcywNClByYW5heQ0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4g
DQo+ID4gIAl9DQo+ID4NCj4gPiAgCXJ1bl9zdWJ0ZXN0cygmZGF0YSk7DQo+ID4gLS0NCj4gPiAy
LjM0LjENCj4gPg0K
