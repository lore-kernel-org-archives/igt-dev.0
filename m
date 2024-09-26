Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6FECDE012
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 15:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5430010E319;
	Thu, 26 Sep 2024 15:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RB9kAE4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2225C10E319
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 15:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727363654; x=1758899654;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9c6Qr/0wlQm3+0JG6TmngTr2M967ttkVzc9uifUsGiM=;
 b=RB9kAE4AH1Sj2/PftKPuh6J3P+BSuLvmjCDuNuhNJHFvY14hGmVrG2je
 HX1RdiIoPHPCqqZW9MWkysqLYPkWFvXnRYccwtyARcaTH2Pj1wXilDUpv
 l5o2DA25ByZWcgrymUvDkRnVOBdB1VDTfPuUxJpOwZMkUv/wGbdUc1nG7
 PejQ+ucZwyafLJ9dfWvvsKxtcDBoG0il2fUiVOLiXJB2skvb/uRcgjSd+
 IS2jNKy7sEYmHUwkLDmyoQXTIRZtZRxmtLJPcda8ApRnmJEuTgsv+/6nu
 umaqouFXVqq+F3TPRZgf/5Fvg8fbN5h8gKva1DU36s4WiUdfB0jaY08xK A==;
X-CSE-ConnectionGUID: HnksMg56RQO8SCJqEGDs5g==
X-CSE-MsgGUID: rHQAFnMUT72cjC+Ws35Kcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26334052"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="26334052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 08:14:07 -0700
X-CSE-ConnectionGUID: 3ZzUuWMLRtCgKXVPDkvn6w==
X-CSE-MsgGUID: fHU71nM6QAywrnNvmvqd7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72988778"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 08:14:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 08:14:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 08:14:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 08:14:06 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 08:14:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+9CCf4jIFOOFTjJNmrfK8p8FKweJ4yIRFBI34ncvrhIHbEwlQtYBfAyFn4v10gM+1irFnhWg0xlmONtYoJuNl6ri6Ry/Qp2TSXVNLUPGhB40ArgKHcT0tTNuorOXuZrjoy0MIB1o+r1lN8pXPNjDu6v0rZxBex5o566uIc5yM4Xh1423bSVEQ054V31KwZxpdBPt1NVv8HZqUqe1TPhQK8g2hmzGWm6NdIL+dlEwofW5v3jwnfKfewwXMy3knPq602/ytOs8bPBFVV1OO0KsXyiPEsj2oCTB64ZgBKXm1WTfSEIxdYe6BOoUdDqspkcgN7AeeJpU52qZdb4DEKidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c6Qr/0wlQm3+0JG6TmngTr2M967ttkVzc9uifUsGiM=;
 b=yFRgvFz0DwprloMHcN1pZ0inF3i13LJH9gzmZeTgJSA3HKoDyOQClGBqbCpkUJGA47PlmC/Ior0GJOo9qbKUlb8/F9I9bIThTshPEVUoa4V3p/yvjzOMxwU0D9ft15Us9b9qDbX5iLWP/4SZQWt/jPc+nO0cipQ9WhDpzviYRdsS7qRLpGrbOj9fcbOrLLj5M4nN0jg0TW6dN3mGFz2GC8v1gCUR1MFI0eslWgnt1aLg05V3bA/MWwxDH+e5hfGcOXX0CKnMsdF3VHKmONMsljFf4mMCI3XG/L3wENMpBB/Z6FqYsitBdBUkXuL5wkyxfIB4SnSPHfLeEfcx0WN5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Thu, 26 Sep
 2024 15:13:58 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 15:13:58 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Grzegorzek,
 Dominik" <dominik.grzegorzek@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/xe_eudebug_online: Adjust interrupt-other
 test
Thread-Topic: [PATCH i-g-t 2/2] tests/xe_eudebug_online: Adjust
 interrupt-other test
Thread-Index: AQHbEA5ZCP3GXsmUNk62C70c1g7+NrJqKbFw
Date: Thu, 26 Sep 2024 15:13:58 +0000
Message-ID: <CH0PR11MB54444CD05F98E7ECAAFB2FC2E56A2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240926121846.5885-1-dominik.karol.piatkowski@intel.com>
 <20240926121846.5885-3-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20240926121846.5885-3-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL3PR11MB6363:EE_
x-ms-office365-filtering-correlation-id: 2865d402-58a3-40de-791e-08dcde3dd889
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TTBPZkVsRUFvTnNGWXJlVzlkNWUxZ3FGVjNOdnBtRTI2M1RRR1NEcFEvMlYw?=
 =?utf-8?B?YlVDSFZqMFNrc2ZUZ0tBQkxZRXdCUm1XYXlmVWdoQ1IwRnFkRUpkQVQrQ1Qx?=
 =?utf-8?B?NExWN3lqdmFqa0pqMnE1YnlENmhRWnlhanQwSzdyVHRUenVFWWdkdDhYaDhV?=
 =?utf-8?B?OGd3dUg2Wkt5aVg0U2JQMHcxdnF1UGhpVkNjVzFjdXc2bG13UDhKUUg4dEd3?=
 =?utf-8?B?TXZTeHFJMGtpZUpsbVdpMCtJNUhDUStDR25CQzhKajVxNXBoUXNjU01EbGln?=
 =?utf-8?B?My9iOU85N2dKdHVqZnNYenBEOFFxdGZxQm83UTJNbTlxbTdmUHVFVVY4cXpV?=
 =?utf-8?B?c09pc2ZMVURGTXplTG13VWxiSWxlL3FxT3p6eVVEWGJRVXVTTDhaZzZqTEQ4?=
 =?utf-8?B?cW9GREYzd2lWbVZsU1B0NFZad2crcXBVckhNeTdOS1NDeTRka1hsMVdheXcv?=
 =?utf-8?B?VHRFc09SY3dhak1VcUsxSzNYbCtuYjlQMW5lTFU1Y1VBQVJLMWRNRGRtUjdV?=
 =?utf-8?B?MzBSMkMydGl1d1JneDFrNG1uM2w5d1NyZEFNZGV5Zm5Kblp0M2JYY0V5QjVB?=
 =?utf-8?B?cWhTTmZvUm9hQ09abDZLcEgvNlg1MEhValhkMW96TzJ3WGViYW83aU9DUmE2?=
 =?utf-8?B?dGxPQWNUMzczYjB4OGw2dTJrUC9hOTJXZEVkblU0R0lHK1JSRE5mTUVKN29R?=
 =?utf-8?B?SklTRFdYdmxZYThqaG5GZ1lCcmMrZ3lMb1BiT1NzMWt3QU54ZHI2cDRZZ1J5?=
 =?utf-8?B?K3dUdHFBdmZ5VnN1Wm0reGRJNmQweGM2MUJyUXNNaFE1S0lLRHB0bFpqWjNN?=
 =?utf-8?B?VmdmYTdNVlE4NUg3ZHRjNGlJaE5IVXQzQ3pPbUM4a2lzRkVjNDhMTm9DZmdL?=
 =?utf-8?B?SytTYmJPTDVYaFZMYWtWS0NuL0xwUEtwSXovOCtTbis3c21tai8yZjM0Skwz?=
 =?utf-8?B?RzUwdkM4MVl4SU1UYmR5MWZWN3JjU0hHeUYxWWNSSkdQNm5sY0ptR2MwTGJY?=
 =?utf-8?B?L1FtQ05IOGRvMklFUktoSW9qL2JTdjJrMFdzeEFNSEpwVm5YT252TXIrSWJT?=
 =?utf-8?B?RFFCdHd3Y1JmQVhTcmU3aUpkK0NCanc1WWtvL0NmclJEb3p0Tjc0QVhZRDhW?=
 =?utf-8?B?L1FGKzJKY1pKWitmK0IwUmNrMXNXUHJqZ21QdFlVa2p4bUV5TEpIcmE4U0sv?=
 =?utf-8?B?eks1cUpyT01KcjA3Z3ByZE9rL2R3WGtUaHFXRFJ5TUtKM1hObFBDSHJDSzho?=
 =?utf-8?B?OW1QNlJKQzRsVGtWZ2Rib0puR0NFOXhnaWNnMjA2bTBZMWx3a1RaQ3lqRmMr?=
 =?utf-8?B?VHlYc05XMjAvbW1SQ211c2lLMzZIMU5vYStma0VQeVlmd05raU1MZVczVXRB?=
 =?utf-8?B?TERGa1BlNm5CSFRsbWpsRzlBUGlOS2o2NVJoaVFxMnF1M2VuVi9rMTlsZmRk?=
 =?utf-8?B?d0thK3ZqZmRCNVJCcDhITjZSeEd1STIrZ296dERaTlNEenB2ODBHaE5mY3dT?=
 =?utf-8?B?UjlRSVBEcG9mTE1lbGdnZ3Nrc1krS1hCTzZzRFJsNXpQSjcxbGE1MG9rL3Vk?=
 =?utf-8?B?bjl6MmFIM3MyZFkwUHVLeGdZUy9QS09MMEdvWGsybWhVKzJhRG5zWmxjdmd0?=
 =?utf-8?B?MHRZNGNOTlhVRlo2S0p5MW9hOVNyR015T1JRYXV1S1dUYktWZms4UXFlaWlE?=
 =?utf-8?B?UDJvbjZOVjBoSEFKc0IwTlZLSWJTeHNVWWhVajh3SVhwUEIycGlqRDdQTzBh?=
 =?utf-8?B?S1dMdVhkRC94RGR0S1FpMENQMVJoUGpPUUUyN0o0dHo4YUVCYkV5WGpnMFRV?=
 =?utf-8?B?UGs2SkFrM2Vza1UzZ2Q2bXNPaDVLaHVvSzJMczN4VWFoNXcyd3dEVTVqWUZP?=
 =?utf-8?B?aXVycHpCMFg1VnpuV2R5anJYeXJXS3YwcGlBVER5bnEyMGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emZKYkkrOWRoSmo2ZHk3T25vUGY2eXBWN3JBTFpuSEpBek1vdi9EWG5sUmF3?=
 =?utf-8?B?anphRDE0WDVTN0NWRzR6YzRVV0phNjZmb1UzZFE1QllFY29vMFM4VWR1TTB5?=
 =?utf-8?B?VVM4SVZTZXh2Q3hGYThPbDJZbXJkZDkvbkJBdFhmRDNKWXozTWY2TjY0ZnJ6?=
 =?utf-8?B?dXVNdVMyeXFJR0FHdFZHQUVIaWh0VE9EMHRzeHVrWFZlbk1ZTnBLRzhzUnVs?=
 =?utf-8?B?WEhPc2h5cFB0Z1JQQ21OYjJLWEQ3NHFLdWJHQWI5b01HYnE3UTJWckFFeUg3?=
 =?utf-8?B?Ujc3bWdQYVZWRXM3MWMydW5ROG1lbWhkdnFXd0hhMy95NXFuaFNMellhZ2Fs?=
 =?utf-8?B?a3orTytjdEpsUjBtU0IwL3g4RkNvUitWQjdYSnEzbWN1ZzVQWVROUXMwRXhi?=
 =?utf-8?B?MmFtRlRjd3NDa1lDd0hOdHVVOXRDWk5sZWVFTC80cllodTJDV0h1TTkyUVpY?=
 =?utf-8?B?bUk3TnBRc043QWlNSktKdjFhUDlsLzBKMjlDL3Y5OTRQODE4V0dtb05MK0U5?=
 =?utf-8?B?RU1DV3FRUllaKzdzYVlETTNnTll5eVdndGtsUUFnQzFpdGdLZy9mbEZuYTZm?=
 =?utf-8?B?b2ZtUGNyblduRHVYV2F3L3A0RU85ZzQvSjZRV1pvWWtkdVBRQmNYeFVWVDF0?=
 =?utf-8?B?d2V2ckVEa0lXblJ3Zjl4TE83Y1IydDRjcUNYNVo2UDRhVU5CenJUQm9nUjA3?=
 =?utf-8?B?YlUzVGYrVDlGN1ZwTVNEYWNBM1RUNEFiUHREbUhQaHNLWUowMnhHMWlxNGMz?=
 =?utf-8?B?TVI4dlJxM21Iemp2YWhNWWlzWXV5Zkw2Nkw3QWVrMzFHcWdmQ1pxUkFXVnR4?=
 =?utf-8?B?eUF4Rk1Td1NpWFN1dU1FMEpQeGc1clNZdXhwTGxSNXlQN09YTXhnQzZabUJ3?=
 =?utf-8?B?ZXZDZWgvVW5wN01SblhsOUFIN3ZCakZjQmF6UkdMOGpQaW0xcjZidzRDNHNS?=
 =?utf-8?B?ZXNER0p4U01BbmZsb3pWSHV5S28wallYcWU4N0JPaGJXT3R3SVI2eGxZcUE5?=
 =?utf-8?B?OWNUYitOSGo5WjdVRlc1NDJ3SmpDblUxNG8wYm9aWWhYVlN1aVdFTW9hMDhK?=
 =?utf-8?B?TlJ4c0UzbHM1WGN6dXNvczJ4OG9vWEJoL0tFRGRLaFBOSW8rOVNIZm8xMjVt?=
 =?utf-8?B?L2dDQmhEcG51cE92K3ZBNXEzRWxmVzlPc2VxZDFCdFQ4Q09tV3VubFZNdG53?=
 =?utf-8?B?VDhlM05lSHZXRHNma1dPU1orTjBVSUZiZXNvblpDa1BmWXA1a2tKOGhiZmhq?=
 =?utf-8?B?TXY3UzZuQWRBTXV0blNTaWRBcmRwMWVYZE5OUlZKaE9jL0plZkp0c00wVFZ0?=
 =?utf-8?B?TnRoWithUlJYS3l2cTVMK0tXS3lmY2NSbFFvajZWaDRJdVpDVm1ndEpJU3lF?=
 =?utf-8?B?alpZbzZETDlNVDN0OGhqOVRrbElkcXQvSFh2WlNNYTRDZ1Z6a0dhNVZhUmVI?=
 =?utf-8?B?c1g4QVpsbUtYaVFVbUc2U3ROaUVOTE8yTFM4VTRDTGFJMm5nZlZteVNjRkhw?=
 =?utf-8?B?d2phdmNjMjNneUdXazlZU3JZUlErQW4rLzJOcWVhMEEvalJnNDdveXFqdjVH?=
 =?utf-8?B?Y2xLdkpTenRVZFppUzBnbFVlMlZ1MCtpR1NEQzlLRlg4TGovb1dHd1NkT3dB?=
 =?utf-8?B?aWZydnc1MUREWFRTRUlQeEJwcE1rYlVkWjlGVUcwUy9lSE5vNGl4RDRVN3lD?=
 =?utf-8?B?aStBb2h6VGZvZTltMGNxaHBBRlBQclpROTYzb0d5WStPVjNvNVlKYXNST3ZX?=
 =?utf-8?B?VWtxK1pYNVB4bkdvR05oRmtUOFZrc3pmWkgzbGQ1d085S0tLOUFRR1BlQWdG?=
 =?utf-8?B?UFN1cjhsVGcyeTlqVFFBeWZ0bEdkQnpCcytSaUpRMmN0SnZmTnNZWnl4N2tR?=
 =?utf-8?B?RzA5U2phc0JqejhQam1tVjUrQkR4dWlmVXFLaldWeFVONVJ0L05XK1lCbnAy?=
 =?utf-8?B?L2owcXREbkxQTkxPY2lkd1ZRbnB2dko3UUE5WC8rN1lJZWVpK0pGK3JrR1E2?=
 =?utf-8?B?N1ZjdS9jMnA1K2doeHp5N200aEpOUFUybUpVOVNBcW9KZWw4czIxZkIrR1Np?=
 =?utf-8?B?cnI1R0ZSZzMzMWZUMDFhQUdLek1kSVU4REV1c1huNmEzVHlEL3gya1BaMUdv?=
 =?utf-8?Q?/ln/WhMhJhi5NF/YkOCyOSGbb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2865d402-58a3-40de-791e-08dcde3dd889
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 15:13:58.6612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CDFtBqcm4hkEC74hogYpn19g0EN0omQ+d3MCtTVoTsCK4iqcnF0se82WbhSQTFkR76jTyQa8fs3mp5E+xoDh6MDvAk2TcQwpCpC3Sess2kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGlndC1kZXYgPGlndC1kZXYtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBEb21pbmlrIEthcm9sIFBpYXRr
b3dza2kNClNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjYsIDIwMjQgNToxOSBBTQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6
Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBHcnplZ29yemVrLCBEb21pbmlrIDxkb21p
bmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPjsgTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJpc3Rv
cGgubWFuc3pld3NraUBpbnRlbC5jb20+OyBTaWtvcmEsIFBhd2VsIDxwYXdlbC5zaWtvcmFAaW50
ZWwuY29tPjsgUGlhdGtvd3NraSwgRG9taW5payBLYXJvbCA8ZG9taW5pay5rYXJvbC5waWF0a293
c2tpQGludGVsLmNvbT4NClN1YmplY3Q6IFtQQVRDSCBpLWctdCAyLzJdIHRlc3RzL3hlX2V1ZGVi
dWdfb25saW5lOiBBZGp1c3QgaW50ZXJydXB0LW90aGVyIHRlc3QNCj4gDQo+IFRoaXMgdGVzdCBm
YWlscyBkdWUgdG8gcHJlZW1wdGlvbiBpbnRlcmZlcmluZyB3aXRoIGl0Lg0KPiANCj4gSW4gb3Jk
ZXIgdG8gZml4IGl0LCBzZXQgdGhlIHByZWVtcHRfdGltZW91dF91cyBmb3IgZW5naW5lX2NsYXNz
IHVzZWQgaW4NCj4gdGhpcyB0ZXN0IHRvIG1heGltdW0gZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUg
dGVzdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRv
bWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwv
eGVfZXVkZWJ1Z19vbmxpbmUuYyB8IDEzICsrKysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25s
aW5lLmMNCj4gaW5kZXggNjhkMWI3ODZmLi5kOTg0ZWFmOTkgMTAwNjQ0DQo+IC0tLSBhL3Rlc3Rz
L2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1
Z19vbmxpbmUuYw0KPiBAQCAtMjIxMiw2ICsyMjEyLDggQEAgaWd0X21haW4NCj4gIAlzdHJ1Y3Qg
ZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaHdlOw0KPiAgCWJvb2wgd2FzX2VuYWJsZWQ7
DQo+ICAJaW50IGZkOw0KPiArCXVpbnQzMl90IHByZWVtcHRfdGltZW91dDsNCj4gKwl1aW50MTZf
dCBlbmdpbmVfY2xhc3MgPSAweEZGRkY7DQo+ICANCj4gIAlpZ3RfZml4dHVyZSB7DQo+ICAJCWZk
ID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+IEBAIC0yMjQ3LDggKzIyNDksMTcgQEAg
aWd0X21haW4NCj4gIAl0ZXN0X2d0X3JlbmRlcl9vcl9jb21wdXRlKCJpbnRlcnJ1cHQtb3RoZXIt
ZGVidWdnYWJsZSIsIGZkLCBod2UpDQo+ICAJCXRlc3RfaW50ZXJydXB0X290aGVyKGZkLCBod2Us
IFNIQURFUl9MT09QKTsNCj4gIA0KPiAtCXRlc3RfZ3RfcmVuZGVyX29yX2NvbXB1dGUoImludGVy
cnVwdC1vdGhlciIsIGZkLCBod2UpDQo+ICsJdGVzdF9ndF9yZW5kZXJfb3JfY29tcHV0ZSgiaW50
ZXJydXB0LW90aGVyIiwgZmQsIGh3ZSkgew0KPiArCQllbmdpbmVfY2xhc3MgPSBod2UtPmVuZ2lu
ZV9jbGFzczsNCj4gKwkJaWd0X3NraXBfb24oIXhlX2V1ZGVidWdfc2V0X3ByZWVtcHRfdGltZW91
dF90b19tYXgoZmQsIGVuZ2luZV9jbGFzcywNCj4gKwkJCQkJCQkJICAgJnByZWVtcHRfdGltZW91
dCkpOw0KPiAgCQl0ZXN0X2ludGVycnVwdF9vdGhlcihmZCwgaHdlLCBTSEFERVJfTE9PUCB8IERJ
U0FCTEVfREVCVUdfTU9ERSk7DQo+ICsJfQ0KPiArDQo+ICsJaWd0X2ZpeHR1cmUNCj4gKwkJaWYg
KGVuZ2luZV9jbGFzcyAhPSAweEZGRkYgJiYNCj4gKwkJICAgICF4ZV9ldWRlYnVnX3Jlc3RvcmVf
cHJlZW1wdF90aW1lb3V0KGZkLCBlbmdpbmVfY2xhc3MsIHByZWVtcHRfdGltZW91dCkpDQo+ICsJ
CQlpZ3Rfd2FybigiQ2xlYW51cCBvZiBwcmVlbXB0X3RpbWVvdXQgZmFpbGVkIVxuIik7DQoNCklN
TyBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBwdXQgdGhpcyBpbiBhcyBhIHBhcnQgb2Yg
dGhlIHRlc3RfaW50ZXJydXB0X290aGVyIGNvZGU6DQoNCiIiIg0Kc3RhdGljIHZvaWQgdGVzdF9p
bnRlcnJ1cHRfb3RoZXIoaW50IGZkLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5j
ZSAqaHdlLCBpbnQgZmxhZ3MpDQp7DQoJc3RydWN0IG9ubGluZV9kZWJ1Z19kYXRhICpkYXRhOw0K
CXN0cnVjdCBvbmxpbmVfZGVidWdfZGF0YSAqZGVidWdlZV9kYXRhOw0KCXN0cnVjdCB4ZV9ldWRl
YnVnX3Nlc3Npb24gKnM7DQoJc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpkZWJ1Z2VlOw0KCWlu
dCBkZWJ1Z2VlX2ZsYWdzID0gU0hBREVSX0xPT1AgfCBET19OT1RfRVhQRUNUX0NBTkFSSUVTOw0K
CXVpbnQzMl90IHByZWVtcHRfdGltZW91dDsNCglpbnQgdmFsOw0KDQoJaWYgKGZsYWdzICYgRElT
QUJMRV9ERUJVR19NT0RFKQ0KCQlpZ3Rfc2tpcF9vbigheGVfZXVkZWJ1Z19zZXRfcHJlZW1wdF90
aW1lb3V0X3RvX21heChmZCwgaHdlLT5lbmdpbmVfY2xhc3MsDQoJCQkJCQkJCQkgICAmcHJlZW1w
dF90aW1lb3V0KSk7DQouLi4NCgl4ZV9ldWRlYnVnX2NsaWVudF9kZXN0cm95KGRlYnVnZWUpOw0K
CXhlX2V1ZGVidWdfc2Vzc2lvbl9kZXN0cm95KHMpOw0KCW9ubGluZV9kZWJ1Z19kYXRhX2Rlc3Ry
b3koZGF0YSk7DQoJb25saW5lX2RlYnVnX2RhdGFfZGVzdHJveShkZWJ1Z2VlX2RhdGEpOw0KCWlm
IChmbGFncyAmIERJU0FCTEVfREVCVUdfTU9ERSkNCgkJaWd0X3dhcm5fb25fZigheGVfZXVkZWJ1
Z19yZXN0b3JlX3ByZWVtcHRfdGltZW91dChmZCwgaHdlLT5lbmdpbmVfY2xhc3MsDQoJCQkJCQkJ
CQlwcmVlbXB0X3RpbWVvdXQpLA0KCQkJCSJDbGVhbnVwIG9mIHByZWVtcHRfdGltZW91dCBmYWls
ZWQhXG4iKTsNCn0NCiIiIg0KDQpBbHNvLCB3ZSBzaG91bGQgcHJvYmFibHkgY2hlY2sgdG8gbWFr
ZSBzdXJlIHRoYXQgd2UgZG9uJ3QgbmVlZCB0aGlzIGZvciBpbnRlcnJ1cHQtb3RoZXItZGVidWdn
YWJsZSBhcyB3ZWxsLg0KSWYgd2UgZG8gbmVlZCBpdCB0aGVyZSBhZGRpdGlvbmFsbHksIHRoZSBp
Zi1zdGF0ZW1lbnRzIGFyZSB1bm5lY2Vzc2FyeSBndWFyZHMuDQotSm9uYXRoYW4gQ2F2aXR0DQoN
Cj4gIA0KPiAgCXRlc3RfZ3RfcmVuZGVyX29yX2NvbXB1dGUoImludGVycnVwdC1hbGwtc2V0LWJy
ZWFrcG9pbnQiLCBmZCwgaHdlKQ0KPiAgCQl0ZXN0X2ludGVycnVwdF9hbGwoZmQsIGh3ZSwgU0hB
REVSX0xPT1AgfCBUUklHR0VSX1JFU1VNRV9TRVRfQlApOw0KPiAtLSANCj4gMi4zNC4xDQo+IA0K
PiANCg==
