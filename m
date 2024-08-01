Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C18C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 19:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C5310E92C;
	Thu,  1 Aug 2024 19:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1zPpoK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100D810E92C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722540464; x=1754076464;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8OeyjEDDK/skjHpkf9oMVrjjoI/HtWxygWOKrElfeOw=;
 b=b1zPpoK88d9Y2YCKmfPB4FDpZux588+S3rvg3wdrhTMvBgZwLVCLnKWW
 JeGltzlmqVe4LOfIb0APq5nZSjBzxSGTJsREETR12UXil7wF7ruk9bV/M
 T+47J+2TIUt8Pt1I/but7IflUiTFnSb50EuBWUrk70VQarpzzynzvvEqm
 9H2XGWykn3G6v44BdRvIN7oZCBZrU8ArRCfbtHBlhN5RMfS9rhbuukRZl
 2WuBfKwG2k8XG0qvRvIBC3CIngYGXAc97yZ4VHhlTYI/VSczqtwAIooPh
 fFqW3TJ59Kru3ZxxtGna56QKwAims86U1AsFYh+sIz2DhOAADoKSCTn9c Q==;
X-CSE-ConnectionGUID: q0dRYLThRMWEZB/gJv3Ogg==
X-CSE-MsgGUID: hZnq/WhnSs+v3vLw+UVzGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="12837777"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="12837777"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 12:27:43 -0700
X-CSE-ConnectionGUID: lj4/OMzoS+ivJl+9CM8uJA==
X-CSE-MsgGUID: jQXCDiXtQGiEf2LDp/E3dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55103793"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 12:27:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 12:27:42 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 12:27:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 12:27:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 12:27:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFNj2dlqVwbUDD8GqcA/xbDszYFPrwLM5OP7Oc7pFTdbvDZqYd8ivthhMVoEkD2wH5h4Jovwm/eOktZmeq/P83maImDRIvYZ54EcBKuaqfByqvsklED2ZUcRvqTAbmbjv+R8LgzaPw9HYMo7X4jvbNLmoU6zyUEtxVzT1IJqcNHVOrfeYZUlrYSqFdHsBaj18N2jLDHK+BmU4lbe0TcNWn9d4W2v1zC1WK2yeiNOiPfBcRYhb0il7fGT/vz39i8lXdsl8z1nUelxpHb0b3u9/CzH2jBKczmOUETxIV5JBKfPQo6C0X4P3ybLemAdjAJVLf4ZMC7tmAcDCuQz7ZZwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OeyjEDDK/skjHpkf9oMVrjjoI/HtWxygWOKrElfeOw=;
 b=k1w3bDlIG5cQzVRfxc741XjdSU8KYpdQQH5C0KhYh5eXmDEhiGt0qhoq86ZSu93EAdsRsY/N/L2vHjVYU2zfyo0ocHVan32UWqJd0uGGfESIBK5FA+oRQrVEkAQFRlt3qfvE1hQJL10uS64ObNJ+iTdxd9XweozjKOIWyBzwUfK4VAfTDsq5lkRD76eWleLRm3sUwYNP5A9tLjS9p9YX7glc/2HM9FweODLKqPfHQJLoRWbmk+lSHjsMAFHWT9MOLNYP1SaU4kL9mgo3CbWee3mCK65dPxG97z/fDSc02WPHCSB6cLlA8j3fYqk6k8nIWcadYY1UuEZj1yjUqNRDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 19:27:39 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.7807.026; Thu, 1 Aug 2024
 19:27:39 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Piatkowski, Dominik Karol"
 <dominik.karol.piatkowski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>
Subject: Re: [PATCH i-g-t v2 63/66] tests/xe_eudebug_online: Add subtests w/o
 long running mode
Thread-Topic: [PATCH i-g-t v2 63/66] tests/xe_eudebug_online: Add subtests w/o
 long running mode
Thread-Index: AQHa4nab3s0pqyIyvECpoOPW/N+porISzM8A
Date: Thu, 1 Aug 2024 19:27:39 +0000
Message-ID: <1a0ea6fba4c8c25d88425382b92b10baec27a2b1.camel@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-64-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-64-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SN7PR11MB7591:EE_
x-ms-office365-filtering-correlation-id: 3cad499d-41dc-48aa-dd8e-08dcb26001ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bXZ0SGxJLzlRRityaVRrUGhZV0dWbEJybnlTN1NucXNHRyt5VlVOKzhUdDBw?=
 =?utf-8?B?dGdQM09QaHIvS2RvY3k4RWtlMWEyTDVpOHZuNUtBbkpxbHBCTy9GYzFNY01P?=
 =?utf-8?B?aUM1VUNmU3Y5N1NTZ1l5V2ErWWNtMlB4UWN3M0NieG1pZUZrWU1ZWWpPcmhG?=
 =?utf-8?B?bjlmNiszbWFYK0JqeWhhSnU5ZHVYQ2srZFIyeGJiZWgvOVVDL2dkWlJyR24w?=
 =?utf-8?B?QXA4djVXdXFTUlMwbzdWbmlabFowRTloUy8zak1jQ0RjNXUwbnlyakpyRHY5?=
 =?utf-8?B?Y0lFbEUwazJXTXhWd2FNUGsweTFESE1XdnA0dE1xQ1NqTURQZjVaU0JjQklL?=
 =?utf-8?B?ZkY5dW54SUlqY3RWSjlSaEhWd2d6czJjVURYbTROa1J2WmRxZ2dRRUdQL3Jz?=
 =?utf-8?B?ZHBHd1hqNlExbmNOWFVkbmFzZ1lRVGJEb0Z3eTJvV2xENHMwRHZtR1IwVkly?=
 =?utf-8?B?NUFHUFp3Snd6Q3VTTnNxL3prcmVwLzA3dGdFMi9aSnNpazk1N0o2MWx5MzhP?=
 =?utf-8?B?K1MvRUJRbEljK21uOGxlc3pVS3BGRlhEOE1MVDcrVUw2MldObzlXMUVocDZB?=
 =?utf-8?B?WUd6RHduWnJVeEdpYmhqQUdaTFBGSi8yYVYvaEdaT1ZBRG5pclJTZEJHVzNV?=
 =?utf-8?B?eXpJNzU3THRXMVlxYjRQejRra3g2dFFFNTZ3TU03YWpXVkQ2akFvdHZySmN5?=
 =?utf-8?B?UTk1SHlOK3gvUVJteVo4NUFrS21mOVhvZWdjY3U5dGFGY1RSalhEMUFIMDlP?=
 =?utf-8?B?N1dOMXNKbjZlRkIzM3JGendWYkFIZVdzaWJGTWUxWkYwaDljYzZXRHFsU3lF?=
 =?utf-8?B?aldta1loN2lqTHdSTVpXMjNNK3hESFRLaEJaOTNJNHpXMU9kNXczeG1pRTR3?=
 =?utf-8?B?dEI3L1YyNENETVY4RDhwQ0N1eTFRdHUvQVhpUEwzM2JUOForekhpTjRWMGlW?=
 =?utf-8?B?K0VnZnFtQ0hEZDlQVlVpR1FJY2I4djNpMHVQVEpaVURFdjMydFE0Z0k1dzVV?=
 =?utf-8?B?dXM4MTVVRmQwNEdyLzZRRXAwSlJBSS9SY0lidjFSaGVFc3NjUDdpSWo4dkE2?=
 =?utf-8?B?WjBuVlc2dlRFSTdYV3ZDOEtMTjE5TkEyL3NQejFYQzVhcnJXcHRSUnJraFFp?=
 =?utf-8?B?YmNiUGR6WTk2UmxtZ1B3bnZEekJqRXFNTFo5WXplUVVrK1VQR1ZRRThXUVli?=
 =?utf-8?B?aEZINk05OS93T1FrL3pXVGMzaW1aa0ZXeE51QkJTTDhmWFR2dWtSVlFIRVRm?=
 =?utf-8?B?TVVZVHNlWUFVZjZBdUpuS3pGa1JTNFV1YkQvdEJZMU1hMXJnR1AwazhZdk0v?=
 =?utf-8?B?cXdvNlNmc1J1NElRNkpxbWd5blV4RFdLSnhSMllrV1Fyc0FSSHlrQ2lXN1gz?=
 =?utf-8?B?WWgwc0k2a3R4K0pXQ2xFbFBYYkhpN3J4QjdPalNZM1JqcldLNVQ2aHBtNDRo?=
 =?utf-8?B?ZjRFVGtOS3p1cDJyOEE2dUpWa2pZa3BpRXlMTGpRUnZKN1hpeVpWZ0pzaXhy?=
 =?utf-8?B?azFJeFVSVWVEMEk5OUhISUFVeDV2dERJMUZZUmsyWnlMRTVwOUcvZ1pUZElh?=
 =?utf-8?B?bVJRd0x5emxxbmpyemlJWmVlcml5ejZSSFJ0dDE0WDlNak1lRmtPbFRvN2F3?=
 =?utf-8?B?Z3lGVG8rRnNTMkswZ25IOGd5MUFWSXhDU2VaSDlXeEhCM2djMlZOanlaNncx?=
 =?utf-8?B?TllNTlhYaE1aR3RKNC9BUHF0VHJUYm5rOFhaM3NKN3BzMFJZcGJDZVhSTEIz?=
 =?utf-8?B?bTlxUzE5ZnRjRUpyc2wrSjhXQWxjNnlrZW1pWnFYWE1RVUIyOG5QT0FPdG1k?=
 =?utf-8?B?TUpKdXRFSmhSRUdKYlphRGFHN1NvK1VIYmhWVUM1NU5rNkkyUjVLUjNibEFX?=
 =?utf-8?B?Q3RVZjYveXlmeEx1T2tadDBycmJoc3dUUFFhVGkrcFhnMkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEMvcjJqd3k5Q2JxcEpCRVJwU2dQb0RWZHFoTTRmTUVkeXp4blhTODVrNUxq?=
 =?utf-8?B?SGo0dVMvNHV5VEUzVEZqTENCMEhOd3Rxa2lqWjNVbkdvaVZoUzgrdE9PQUNN?=
 =?utf-8?B?ZUlCbHZZUVRkUVMrR2gwekJsWjJPVlI4N0cvN2RHbCs0Wk9IVFd4Mi9qbHNO?=
 =?utf-8?B?RGhrdmR0YXF1bFlWL3RYMDRSSml0RFlqUTEybExsUDEwS3NzSFIxTkVBZmRU?=
 =?utf-8?B?eWdOcTdhdm5uVzFnVm1TQWNLcjFQQXpqVDdtS2JyWU9pTDl2eHVjazRYNHBB?=
 =?utf-8?B?bC9jOTZrM1k2ODFtZU03SU0vd0tYbU9iMG05Mk9CTjFMQXdTa1JCeUlsZ1RJ?=
 =?utf-8?B?T0xQdTNPaWd1bFhkZVlNaWswZ1BpSlNMaVRMZ0NjWVFxLy9TVC9nTWpCc0Uz?=
 =?utf-8?B?TU5PQkJaUmJkeG8wVWt1K252U0x1bkJlWlJMNlR6eGtEMVVuMkp5Mkt2MDFq?=
 =?utf-8?B?N3daT0s4RVJBdU5XZEJ5Z3pHWXlXME4zeDNXREFDTDJUS0E4YVpZN0FCVk1O?=
 =?utf-8?B?Z1NGelpwdHVET1pBSTA2dWNLR0JrMjZzOUFyRDEwNnRQTkN5eUg4MHRINnUw?=
 =?utf-8?B?UHMvN1U0VXNmeUExaS9SRTZXazhrblZXWTVsZGxBL2xRY1VVdUZUdkxTQXpi?=
 =?utf-8?B?Y0pRd3h1KzhTR3Vaek1VM3NrTzRnb1lZM2pMN0FDeUQ1OFAzRjhzNXlqUHcr?=
 =?utf-8?B?STA0N2JwTW40aWJJVUo0aUc5eU5rSVJDTjhRRzN3aUk4c2xyOXBZeDUrdjhW?=
 =?utf-8?B?VHJ6R2pyTGhIRUtjM0pXWjZNdEMyN21nclNLelVaRmtCT1hZMkxTdzI3LzlO?=
 =?utf-8?B?OFM2TjRyaWpUZmlqWnJoTWo2c1BpN0lyTVJSaWNmajBaYUZWSytDWEQ0ZE5R?=
 =?utf-8?B?elcwYWdJVjlhSE1Od05JcnhxejYwUGJOUTROVHhoYWZML3B3VThrK1QyV09n?=
 =?utf-8?B?OEw2UjF3c3BCRklyV1BRay9yTk5scE5RZ1BpMlk3eGhyTFdZM0UwWHpMdTVK?=
 =?utf-8?B?S1NCYzNyYThyWWpwa3Aybk9vYUs1MVpOWFJzTTFQd0JiSXJlWkhWUjB4ZTN4?=
 =?utf-8?B?M2FtWVVDaCsrL1J3RXF3MlhDeExCVHY0bmh5dU9HdURObDNGS2k2U0xCaEda?=
 =?utf-8?B?MTNMS0ZFNHkyektFSTN6Zkd5ODZzME1KSm9KaEw4aDhIK2lIQ1BBTEd1Yk5N?=
 =?utf-8?B?TndJc1FjUFJUTWx2c1U5UytSenJ0NkNuTjBONkVCSEN1QkFLbGwyS0RPYWo1?=
 =?utf-8?B?aEFMZnNWSlo2ZFVaRVVoMG5zWERiZFR6NUExMCtxekVlZkN2OVRxamhEa3Zh?=
 =?utf-8?B?dlNxYU95U2IwSDB6dVl6RXVSVjQ4NE1wTDloRzZTLzJGc3ByejFZT2xuRUJK?=
 =?utf-8?B?V0o1Vzk3aXF1MDJuQm0zK0ltRmhZSDk3K0h1bDcwcEJicmRyTWJrSUcvK2V2?=
 =?utf-8?B?S0tyYzVWbTZLbmJMcEVCTzFSV2dEV0IwTFR3NC9aVDdkQlp2aFJUbWY4ZlVI?=
 =?utf-8?B?N09rMEE5L3BCNjUrZVdwZEJBMWRlcWI2cWo2VWNKOGRvWXNOb3lnMXF4dmMr?=
 =?utf-8?B?Mk1CenpXQnlyQ2NodzZDR0J3NERMcVNUS2dHR0xhckp5cHZQV2s3Tmx0WGhv?=
 =?utf-8?B?OHViTllxMDVSaDVyNFhKTmgyMC9NNFNpSkZnZ1o2aElpUUFFTVZ1QUNuSWVh?=
 =?utf-8?B?T0dpR3F6eDAvZURScmxkdmtMU3I4WTVydGthT3p3VjAzY3NHemRWaEN1U1Ns?=
 =?utf-8?B?TUxvWGY3OHluS3RBYXRNbmFtS1BUVkw0YWN0SjJLVXM4MG9MdlEyV3QyRVQr?=
 =?utf-8?B?L2lBVmR2eHpJa2d6cis0YVp2bXJZbi9FbGRkNFQrY200bEFKQjdpam82ZjFE?=
 =?utf-8?B?ekNRQnZyYjVGOTh0bTdhNUZQWGNrNUlnV29WQWlSVzhvY25kbmdhV3dxKzRC?=
 =?utf-8?B?UldDVGczSHAvUi9DaEZ4TG1vWmlZYklXQlZLeVF0Q3cvMzFhZmJjdk5WYjZZ?=
 =?utf-8?B?RHNMZ1lIZHoreXZwOTRqeU5zK3RFVEVqeVRFc3pwRk5aaFk2RGp4bkZmZWxK?=
 =?utf-8?B?V3JGRk5Xa2FRNVN6dG92UDVmN1JtbFdpTEpHOTZjOFVGL2pkVjJEV2JFMERR?=
 =?utf-8?B?V3dKd3VQejNhR0oyNlVqbUxYakM2NGZLbjk4TGxlNHFEa3g3dzA5Q1YvRzFK?=
 =?utf-8?Q?LrzzFj6Ff/7xeL6f0UKZKu4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D01C92157C85324EBC68AE6F3FC0800C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cad499d-41dc-48aa-dd8e-08dcb26001ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 19:27:39.3999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mINTbjQItO/llNu1jJJ6ZnsOEHDYd1QIbjPcRM0akkxPAMZIaKaRX+4wsZG+ITe+sqTu/dIyEj2kGn33Sw9WsIpxNMn4GPWhYlSdJjiz6Ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
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

T24gVHVlLCAyMDI0LTA3LTMwIGF0IDEzOjQ1ICswMjAwLCBDaHJpc3RvcGggTWFuc3pld3NraSB3
cm90ZToNCj4gQ3VycmVudGx5IGFsbCBvdXIgb25saW5lIHRlc3RzIHVzZSB2bXMgaW4gbG9uZyBy
dW5uaW5nIG1vZGUuIEFkZCAzIHN1YnRlc3RzDQo+IHdpdGhvdXQgaXQgdG8gaGF2ZSBzb21lIGNv
dmVyYWdlIGZvciBub24tbHIgbW9kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBN
YW5zemV3c2tpIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+DQo+IENjOiBEb21pbmlr
IEthcm9sIFBpxIV0a293c2tpIDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0K
RXZlbiB0aG91Z2ggdGhlIGNvbW1pdCBpcyBjb3JyZWN0IGl0IHByb2JhYmx5IHdvdWxkIG5lZWQg
dG8gYmUgcmVtb3ZlZCBpbiB0aGUgZnV0dXJlLg0KRHVyaW5nIHVwc3RyZWFtIHJldmlldyBvZiB0
aGUgWGUgaXQgd2FzIHBvaW50ZWQgb3V0IHRoYXQgd2Ugd2lsbCBuZWVkIHRvIGxpbWl0DQpkZWJ1
Z2dlciBmdW5jdGlvbmFsaXR5IHRvIG9ubHkgbHIgbW9kZSwgYXMgd2UgZGVwZW5kIG9uIGl0LiAN
Cg0KUmVnYXJkcyzCoA0KRG9taW5paw0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX2V1ZGVidWdf
b25saW5lLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jIGIvdGVzdHMvaW50ZWwveGVfZXVk
ZWJ1Z19vbmxpbmUuYw0KPiBpbmRleCA5NjEyOWMwNmEuLjg2NDU5MWEzNCAxMDA2NDQNCj4gLS0t
IGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94
ZV9ldWRlYnVnX29ubGluZS5jDQo+IEBAIC0yOCw2ICsyOCw3IEBADQo+ICAjZGVmaW5lIFNIQURF
Ul9OX05PT1BfQlJFQUtQT0lOVAkoMSA8PCA1KQ0KPiAgI2RlZmluZSBTSEFERVJfQ0FDSElOR19T
UkFNCQkoMSA8PCA2KQ0KPiAgI2RlZmluZSBTSEFERVJfQ0FDSElOR19WUkFNCQkoMSA8PCA3KQ0K
PiArI2RlZmluZSBESVNBQkxFX0xPTkdfUlVOTklOR19NT0RFCSgxIDw8IDgpDQo+ICAjZGVmaW5l
IFRSSUdHRVJfUkVTVU1FX1NJTkdMRV9XQUxLCSgxIDw8IDI1KQ0KPiAgI2RlZmluZSBUUklHR0VS
X1JFU1VNRV9QQVJBTExFTF9XQUxLCSgxIDw8IDI2KQ0KPiAgI2RlZmluZSBUUklHR0VSX1JFQ09O
TkVDVAkJKDEgPDwgMjcpDQo+IEBAIC0xMDAzLDEyICsxMDA0LDE2IEBAIHN0YXRpYyB2b2lkIHJ1
bl9vbmxpbmVfY2xpZW50KHN0cnVjdCB4ZV9ldWRlYnVnX2NsaWVudCAqYykNCj4gIAkJCQkJCQkg
ICBEUk1fWEVfREVCVUdfTUVUQURBVEFfUFJPR1JBTV9NT0RVTEUsDQo+ICAJCQkJCQkJICAgMiAq
IHNpemVvZigqbWV0YWRhdGEpLCBtZXRhZGF0YVsxXSk7DQo+ICANCj4gLQljcmVhdGUudm1faWQg
PSB4ZV9ldWRlYnVnX2NsaWVudF92bV9jcmVhdGUoYywgZmQsIERSTV9YRV9WTV9DUkVBVEVfRkxB
R19MUl9NT0RFLCAwKTsNCj4gKwlpZiAoYy0+ZmxhZ3MgJiBESVNBQkxFX0xPTkdfUlVOTklOR19N
T0RFKQ0KPiArCQljcmVhdGUudm1faWQgPSB4ZV9ldWRlYnVnX2NsaWVudF92bV9jcmVhdGUoYywg
ZmQsIDAsIDApOw0KPiArCWVsc2UNCj4gKwkJY3JlYXRlLnZtX2lkID0geGVfZXVkZWJ1Z19jbGll
bnRfdm1fY3JlYXRlKGMsIGZkLCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSwgMCk7DQo+
ICsNCj4gIAl4ZV9ldWRlYnVnX2NsaWVudF9leGVjX3F1ZXVlX2NyZWF0ZShjLCBmZCwgJmNyZWF0
ZSk7DQo+ICANCj4gIAlpYmIgPSB4ZV9iYl9jcmVhdGVfb25fb2Zmc2V0KGZkLCBjcmVhdGUuZXhl
Y19xdWV1ZV9pZCwgY3JlYXRlLnZtX2lkLA0KPiAgCQkJCSAgICAgYmJfb2Zmc2V0LCBiYl9zaXpl
KTsNCj4gLQlpbnRlbF9iYl9zZXRfbHJfbW9kZShpYmIsIHRydWUpOw0KPiArCWludGVsX2JiX3Nl
dF9scl9tb2RlKGliYiwgIShjLT5mbGFncyAmIERJU0FCTEVfTE9OR19SVU5OSU5HX01PREUpKTsN
Cj4gIA0KPiAgCXNpcCA9IGdldF9zaXAoZmQsIGMtPmZsYWdzKTsNCj4gIAlzaGFkZXIgPSBnZXRf
c2hhZGVyKGZkLCBjLT5mbGFncyk7DQo+IEBAIC0xMjUxLDYgKzEyNTYsMTAgQEAgc3RhdGljIHZv
aWQgdWZlbmNlX2Fja190cmlnZ2VyKHN0cnVjdCB4ZV9ldWRlYnVnX2RlYnVnZ2VyICpkLA0KPiAg
ICoJQ2hlY2sgd2hldGhlciBLTUQgc2VuZHMgYXR0ZW50aW9uIGV2ZW50cw0KPiAgICoJZm9yIHdv
cmtsb2FkIGluIGRlYnVnIG1vZGUgc3RvcHBlZCBvbiBicmVha3BvaW50Lg0KPiAgICoNCj4gKyAq
IFNVQlRFU1Q6IGJhc2ljLWJyZWFrcG9pbnQtbm8tbHINCj4gKyAqIERlc2NyaXB0aW9uOg0KPiAr
ICoJU2FtZSBhcyBiYXNpYy1icmVha3BvaW50IGJ1dCB3aXRob3V0IHZtIGluIGxvbmcgcnVubmlu
ZyBtb2RlLg0KPiArICoNCj4gICAqIFNVQlRFU1Q6IGJyZWFrcG9pbnQtbm90LWluLWRlYnVnLW1v
ZGUNCj4gICAqIERlc2NyaXB0aW9uOg0KPiAgICoJQ2hlY2sgd2hldGhlciBLTUQgcmVzZXRzIHRo
ZSBHUFUgd2hlbiBpdCBzcG90cyBhbiBhdHRlbnRpb24NCj4gQEAgLTEzMzcsNiArMTM0NiwxMCBA
QCBzdGF0aWMgdm9pZCB0ZXN0X3Jlc2V0X3dpdGhfYXR0ZW50aW9uX29ubGluZShpbnQgZmQsIHN0
cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzXw0KPiAgICoJaW50ZXJydXB0cyBhbGwgdGhyZWFkcywg
Y2hlY2tzIHdoZXRoZXIgYXR0ZW50aW9uIGV2ZW50IGNhbWUsIGFuZA0KPiAgICoJcmVzdW1lcyBz
dG9wcGVkIHRocmVhZHMgYmFjay4NCj4gICAqDQo+ICsgKiBTVUJURVNUOiBpbnRlcnJ1cHQtYWxs
LW5vLWxyDQo+ICsgKiBEZXNjcmlwdGlvbjoNCj4gKyAqCVNhbWUgYXMgaW50ZXJydXB0LWFsbCBi
dXQgd2l0aG91dCB2bSBpbiBsb25nIHJ1bm5pbmcgbW9kZS4NCj4gKyAqDQo+ICAgKiBTVUJURVNU
OiBpbnRlcnJ1cHQtYWxsLXNldC1icmVha3BvaW50DQo+ICAgKiBEZXNjcmlwdGlvbjoNCj4gICAq
CVNjaGVkdWxlcyBFVSB3b3JrbG9hZCB3aGljaCBzaG91bGQgbGFzdCBhYm91dCBhIGZldyBzZWNv
bmRzLCB0aGVuDQo+IEBAIC0xNTU3LDYgKzE1NzAsMTAgQEAgc3RhdGljIHZvaWQgZXVfYXR0ZW50
aW9uX2RlYnVnZ2VyX2RldGFjaF90cmlnZ2VyKHN0cnVjdCB4ZV9ldWRlYnVnX2RlYnVnZ2VyICpk
LA0KPiAgICoJaW50ZXJydXB0cyBhbGwgdGhyZWFkcyBhbmQgZGV0YWNoZXMgZGVidWdnZXIgd2hl
biBhdHRlbnRpb24gaXMNCj4gICAqCXJhaXNlZC4gVGhlIHRlc3QgY2hlY2tzIGlmIEtNRCByZXNl
dHMgdGhlIHdvcmtsb2FkIHdoZW4gdGhlcmUncw0KPiAgICoJbm8gZGVidWdnZXIgYXR0YWNoZWQg
YW5kIGRvZXMgdGhlIGV2ZW50IHBsYXliYWNrIG9uIGRpc2NvdmVyeS4NCj4gKyAqDQo+ICsgKiBT
VUJURVNUOiBpbnRlcnJ1cHQtcmVjb25uZWN0LW5vLWxyDQo+ICsgKiBEZXNjcmlwdGlvbjoNCj4g
KyAqCVNhbWUgYXMgaW50ZXJydXB0LXJlY29ubmVjdCBidXQgd2l0aG91dCB2bSBpbiBsb25nIHJ1
bm5pbmcgbW9kZS4NCj4gICAqLw0KPiAgc3RhdGljIHZvaWQgdGVzdF9pbnRlcnJ1cHRfcmVjb25u
ZWN0KGludCBmZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSwgaW50
IGZsYWdzKQ0KPiAgew0KPiBAQCAtMTc5Miw2ICsxODA5LDkgQEAgaWd0X21haW4NCj4gIAl0ZXN0
X2d0X3JlbmRlcl9vcl9jb21wdXRlKCJiYXNpYy1icmVha3BvaW50IiwgZmQsIGh3ZSkNCj4gIAkJ
dGVzdF9iYXNpY19vbmxpbmUoZmQsIGh3ZSwgU0hBREVSX0JSRUFLUE9JTlQpOw0KPiAgDQo+ICsJ
dGVzdF9ndF9yZW5kZXJfb3JfY29tcHV0ZSgiYmFzaWMtYnJlYWtwb2ludC1uby1sciIsIGZkLCBo
d2UpDQo+ICsJCXRlc3RfYmFzaWNfb25saW5lKGZkLCBod2UsIFNIQURFUl9CUkVBS1BPSU5UIHwg
RElTQUJMRV9MT05HX1JVTk5JTkdfTU9ERSk7DQo+ICsNCj4gIAl0ZXN0X2d0X3JlbmRlcl9vcl9j
b21wdXRlKCJicmVha3BvaW50LW5vdC1pbi1kZWJ1Zy1tb2RlIiwgZmQsIGh3ZSkNCj4gIAkJdGVz
dF9iYXNpY19vbmxpbmUoZmQsIGh3ZSwgU0hBREVSX0JSRUFLUE9JTlQgfCBESVNBQkxFX0RFQlVH
X01PREUpOw0KPiAgDQo+IEBAIC0xODA3LDYgKzE4MjcsOSBAQCBpZ3RfbWFpbg0KPiAgCXRlc3Rf
Z3RfcmVuZGVyX29yX2NvbXB1dGUoImludGVycnVwdC1hbGwiLCBmZCwgaHdlKQ0KPiAgCQl0ZXN0
X2ludGVycnVwdF9hbGwoZmQsIGh3ZSwgU0hBREVSX0xPT1ApOw0KPiAgDQo+ICsJdGVzdF9ndF9y
ZW5kZXJfb3JfY29tcHV0ZSgiaW50ZXJydXB0LWFsbC1uby1sciIsIGZkLCBod2UpDQo+ICsJCXRl
c3RfaW50ZXJydXB0X2FsbChmZCwgaHdlLCBTSEFERVJfTE9PUCB8IERJU0FCTEVfTE9OR19SVU5O
SU5HX01PREUpOw0KPiArDQo+ICAJdGVzdF9ndF9yZW5kZXJfb3JfY29tcHV0ZSgiaW50ZXJydXB0
LWFsbC1zZXQtYnJlYWtwb2ludCIsIGZkLCBod2UpDQo+ICAJCXRlc3RfaW50ZXJydXB0X2FsbChm
ZCwgaHdlLCBTSEFERVJfTE9PUCB8IFRSSUdHRVJfUkVTVU1FX1NFVF9CUCk7DQo+ICANCj4gQEAg
LTE4MTksNiArMTg0MiwxMCBAQCBpZ3RfbWFpbg0KPiAgCXRlc3RfZ3RfcmVuZGVyX29yX2NvbXB1
dGUoImludGVycnVwdC1yZWNvbm5lY3QiLCBmZCwgaHdlKQ0KPiAgCQl0ZXN0X2ludGVycnVwdF9y
ZWNvbm5lY3QoZmQsIGh3ZSwgU0hBREVSX0xPT1AgfCBUUklHR0VSX1JFQ09OTkVDVCk7DQo+ICAN
Cj4gKwl0ZXN0X2d0X3JlbmRlcl9vcl9jb21wdXRlKCJpbnRlcnJ1cHQtcmVjb25uZWN0LW5vLWxy
IiwgZmQsIGh3ZSkNCj4gKwkJdGVzdF9pbnRlcnJ1cHRfcmVjb25uZWN0KGZkLCBod2UsIFNIQURF
Ul9MT09QIHwgVFJJR0dFUl9SRUNPTk5FQ1QgfA0KPiArCQkJCQkgRElTQUJMRV9MT05HX1JVTk5J
TkdfTU9ERSk7DQo+ICsNCj4gIAl0ZXN0X2d0X3JlbmRlcl9vcl9jb21wdXRlKCJzaW5nbGUtc3Rl
cCIsIGZkLCBod2UpDQo+ICAJCXRlc3Rfc2luZ2xlX3N0ZXAoZmQsIGh3ZSwgU0hBREVSX1NJTkdM
RV9TVEVQIHwgU0lQX1NJTkdMRV9TVEVQIHwNCj4gIAkJCQkgVFJJR0dFUl9SRVNVTUVfUEFSQUxM
RUxfV0FMSyk7DQoNCg==
