Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B60FE7E0C2
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F37310E14D;
	Mon,  9 Feb 2026 10:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvfvRBv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF00710E14D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770633744; x=1802169744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1smAml3sEK3SGv60EJTPfS0ELYQFEdY8lCwg4u5yYjU=;
 b=DvfvRBv+1MOteh34aP1epCXt3EgAAoz5MeKDJijw31QABNE5P3k6xaXG
 37iYxFXcKrXYpQ7qgZZLvK2dJr4faAv9mx+DSKZtGcTWQDH51cJaaVXng
 AWcEf7jsflsiSqMFLnmMlUON1atdO4Fg3OwrAy081SnfM/5LlyTLFEzvV
 4ftP7m5d7dCMI0QyUAIV9AF/jrbf5VuMabv+sbmRgdYyBSReFouHhiKTI
 SrNOyn0cOZ3dU6o/DalTsvQgUF7HhuOdZdP8oOikWnqCCZBH59FA11jRC
 XC+qL67cEdNIA93JzZnLjZxL9g4e2cgJoe0D+pz5xn+v+P8RlHEzyb5Fy A==;
X-CSE-ConnectionGUID: 5GhZpNtyQui1Z81eKldk5g==
X-CSE-MsgGUID: Y0B296DwR1KqGoXBjbB2ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71642695"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71642695"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:42:23 -0800
X-CSE-ConnectionGUID: zRpqPoauTHKJ/dfNLpp8Lg==
X-CSE-MsgGUID: JQgH/XiLRDCj9AATP1MIgw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:42:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:42:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 02:42:22 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:42:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoFGxPWiKRayNVAIccVqqhF1hE1AezJ13VJGTWwhOjs0r2tZphf79FzNId25uRFXiVrf5Rn8opLCv445hfEFoh2iteYRcqBu5aG0iMGlX9mRk481U1VeTFuWHR9NxrQLXGr4K2A01pofGqu5n7PJYR26xsK4M+UJfcrzvd+dubbMfasV7m+uuhegcgApv2WCWnHkdpz6v2BzpipETPw3EnCrqVMqyAx5ZSIsUAwimoMREIoiTByw7afa3CndvOvSYsVqKtTvL3NKBY+fFTBIj71S6iIOQQbR4NCecubkIjrSimhlB+IcCUYnqSKfL6D9NVbAUqxwZoQsx0g8uWlGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD8m1V7sN1KyALAB2EiRAJqBPLRiKv5z3tL90u6Ukh8=;
 b=uMSZumLuny4ZrinIIPUNo+3j413b4kSHGhV8z0ZloyaUKCLy2uQfXigt5hrcqoXKev9bHr1H8klnbk4K4LNWEMH5UOjXBoNlSGF3Bozc7Y7qQMl6Otvues+D50hFKXDOpF2HT2FzMQaHK1/M1EQDiiMtd6xTLejR/CnbrUcnmlg1ib+NqwIo+wR9oGyLODSxs0nzUlKDM+5wY6K2iYNW4HtUmKurkNVF1Iv0jraTIsZ8f9Udajymhf53oKgMnHjsZi9bA7xrN4neXpgsOJpLgu7OzUmWIAHc2QVCNzC5wfzyvl1k3eA2KQMFQdaIx152qxbsLE5Xwd5h8A2rTWBcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA2PR11MB5196.namprd11.prod.outlook.com (2603:10b6:806:119::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 10:42:15 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 10:42:15 +0000
Message-ID: <17a502c4-87ec-40dd-b45f-72201485bc16@intel.com>
Date: Mon, 9 Feb 2026 11:42:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 7/7] tests/intel/xe_sriov_flr: Skip xe-vfio-pci
 load/bind when IOMMU is off
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
 <20260204163217.121305-8-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260204163217.121305-8-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0183.eurprd09.prod.outlook.com
 (2603:10a6:800:120::37) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA2PR11MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 4951b2ec-d888-4594-8f5b-08de67c7e3b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K05JSXFIUWZCUkdFS2JmRHlQOWlxQktkbEZZUDMwS0lEQTF6VzdiR1ViTW1W?=
 =?utf-8?B?d0FMb2lCOUNsb25uRUVaVFJoeTFVYjRQMVVDdDdaZVZRcndDTm5Eek1sRjhO?=
 =?utf-8?B?NHBaMjcxMVBoa2RJT1A1QlpBMVRaZHY3aVFIaFBhcHRzZ2YybnA5bnNsb0VM?=
 =?utf-8?B?bmxaYlBDczhCV2U1a1l4S3dGUzRrSTBvUmNJOW1pcWdZZ2FQSE5SamxXdm9J?=
 =?utf-8?B?RExyVE1PVHZrK2gzNmh0VldEN2xNNFRRUmdFOVlCUkhCQWhaVndJSUhZd0s0?=
 =?utf-8?B?Mkg2MU1FT2RtR0dCS0U5L2NaZ1lpUDRJQ0ZQckNTc2tLMHZaUCtkS0V4L25P?=
 =?utf-8?B?VDN0ZHlHOEZkL1paWkRvYlBTM1JUS2xhNXRmNVRIMG5zV0taclBlL2VhK2lu?=
 =?utf-8?B?QStMcFJqeDNQV3N5bU5LQmI3TkhRR3Q0akR0bm9EaUVMcFBvZTRITnlOQ2Jq?=
 =?utf-8?B?ZmlYMEpQeVdSeDlyVHRBQWNXc3VJQW5sYm9JMHZEWVdMMllzUWE1NzdvTkRZ?=
 =?utf-8?B?bm1YaTI3R0FCWDltR3Z6LzZoZis3emJuSmFtU1NKaXJ6TURiQmJkRzJLcUhp?=
 =?utf-8?B?SjlzeU9kZk5tcnZET0JQZFAveVlyenFDc1NvZ3V2L0E3cUJ5NURpYjM1cjFU?=
 =?utf-8?B?TnovcHNZUWsvVk1sbDZrVnZ6UmMyK1ltYkZvQ0lLazdyV1hmb2N3TXk1bksw?=
 =?utf-8?B?WDlaa0lOa2ZCQWF3dTUzeXZMN2JwZ3B5aGdQRnAyTGUrbGlPa3RZZW9NRE1o?=
 =?utf-8?B?QlR2bnV4YVVUM1JqOVR4cXdyd2VRQlJKRGI1dDZlWHltaU9PdVNlZHlyaVhr?=
 =?utf-8?B?ZjlSdXQyYnJaZTJla1VQbTBaVUJKampVRjlVRlcrL3hDTndZT1NhU1Z6V3dq?=
 =?utf-8?B?TVpkeGViNEVOMWozLzg2cWNrd0o1T0l6ZUx1Z0xHOG5ieEQ4RXFOalpJSWR1?=
 =?utf-8?B?ZFR1eEdFd0RXT1JZSVREeWFqR082Mm5FZU5McTVlZlBzdk9RQXF4LzkvN2Vi?=
 =?utf-8?B?MzBZYUdhQnhxc0dYS2thaVBJTVpyQUpUTXpxQmhOYWkrVVN0N3g2MXRCbEsw?=
 =?utf-8?B?aVVvSDVHSlRRTTZpMHk3bkYwbW9sOU4xRlI0ZWZqK1ZlRURYSC9BdExUQWsv?=
 =?utf-8?B?UURFKzM0WlpMb0xmZEZLUjRQSWVyQkgzODZMVmpqMWJXbTZyTTUvZkxTZUll?=
 =?utf-8?B?Y0UwMEJnejE5aFhGNy9RL3hFL2t5eVdvTDc1YTdsdVhVWW0vTTVMQmZlM3lv?=
 =?utf-8?B?RlFTS0poSXViSHBTaUxpT2RaMjBORldMMVFnc1Nndzd4WGNieFVLdjNtLzNy?=
 =?utf-8?B?VXNvaml5R1AxTzhneUJPQkpmbC8zT2VqM1lFeEdoZTZrUmxsR1FkMEtTbTVs?=
 =?utf-8?B?eWFLMVBGSU1IQkpzYldyTHA5V3pFQU15WEtzeGlqWFMyeXZHZUk5SnZaelJV?=
 =?utf-8?B?MVpZbFQ3SlZlTzh5aUFSeEY5OHloWXZKYUpHVEk5ZGp0d2NaQVZrR05Xc1Rj?=
 =?utf-8?B?S2dTMU1odW1mWXoxOThCOFhVTGVnWlRIa0VDZEdybno3VHFFbC93aHJmZzlq?=
 =?utf-8?B?K0JENDJ3N1FQL01MN1hoMGZYRFEycWxTQUQ3Yjl4bHFpbzg2R2MvU1hpaGVM?=
 =?utf-8?B?VFoveHFZUGVtUXhpNTdwVTArR285VjF1bFN4VmJYZGpnaEdvQWkySnlrZ1ZG?=
 =?utf-8?B?djhwMmxMeVFqeUVyTWx2SFZyVmo3Qzl2UVR5bWxjK0tTM2FFQmxhU24wZGtp?=
 =?utf-8?B?SGt4U05DdUNndEk0YlQ1dnZFUmRlaG1mb25aU0ZBK1dMT2lJUUs2MEN3QXpt?=
 =?utf-8?B?M1lJb3JXa3RHMktuSGJvRGZZc2loTng4UVFKM1ZyS1RLeWZsckY5Y1JuMzNT?=
 =?utf-8?B?cTl2YTRCTThUVi9UN25hMDIySTZ4eThYNnVjWmNzTDlhNzJwS3pzYUZFQ3ZN?=
 =?utf-8?B?UkRnOU5qaXc3Qi9vNVNmeUxRUiszcGFhelZzMUNsd0IxRnAwdGFDVmM0Mkkz?=
 =?utf-8?B?THlDai9HTVNuNUlZVTNQMjhJRHJscGxaQk9wMTJuTzloVnVIWi9rZDM0Vmlr?=
 =?utf-8?B?Zk9yQ2NRUmF3Tm52dG5Kb3VxdE8xeUZ5K3hBQXYyWmFweHc3bEF6UHNDNjlT?=
 =?utf-8?Q?G/60=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDFvT3V4Yk15MFR2cFlNWjI0My9ZeEcwNXFibzZDRDJLbS9PdXFjR2RLSmEz?=
 =?utf-8?B?UjM1NjNMQ2RRcXFYNHJqYis0MVMrbXFGYi9yRy9Ybk9NVFZ4dlgydVBGdWFL?=
 =?utf-8?B?ZmljckhoK1hZaUN4NWx6OEFJZlhLeVUvbGFVbURMbWNBd3JxeGJEK3VmcTJz?=
 =?utf-8?B?UnJGTXdjUzA3QjRDMmdjeHVteUQzNldPOTYyZ2x2OC9uaFBSTVJxVU13MTZn?=
 =?utf-8?B?amtKSFJDa0JsVFo2K3lXelp4ZDRuZ2FVcDJBZldFR28zaEdwZmJaYTcvOUJW?=
 =?utf-8?B?cmxhYXBSd2tOeGRGd0lpMnhKN3I5d1RkOUgzSUxIOHNqd2Y2d2tKRithNzBW?=
 =?utf-8?B?Q2RrSTVJazRVanIyQ3VhTHVBck1McWZ0SzMvS0dmdU5IaFFJWExXckV3ckZH?=
 =?utf-8?B?M3ZINjFLR2JieWM3My9VQmtybWZpOWFUYll1YlJSV283b004cHpldDRna3lP?=
 =?utf-8?B?Sk1XbWozRXlsQXVZR0pEQ3pwcEpFUk5CajMwT3kzMVJBNG5kbFZySkNuaDRl?=
 =?utf-8?B?b21DTVVNaWxlVllGUEtZbExvaGxVU01mVm1TN3pGaWJ3b1pEWUxhRWFoM0pD?=
 =?utf-8?B?WDQ2WUUrWHE4Uko0OGtEZDZ5elVBNDZMbEt0MCsvb1ZJeDdkVkpzakVhWU5E?=
 =?utf-8?B?eSsydXkvS0hlTWI4YlF2QlNlRVBqcG9lZWhyS21makQ1a1Z6azdoODRyME15?=
 =?utf-8?B?SlFDNDJnZFhBalk5UGtVT2lYakRqMm1jdGZJUFA2ek9mTFYzc1h5SUJCTFBG?=
 =?utf-8?B?MmxiVTlmRW16d1pVY0VXNXlad1Q4bU4xelRndSsreDlGVWVuNGJ0S1pCQTA0?=
 =?utf-8?B?TW1mclVhbjJVb3ZpaWd3S3RjRElvRkJpZTlhc043RFppVGRQeUQ0SkFZb2JM?=
 =?utf-8?B?bHF5ZUVqd0E1dTN3TkFHTFRZMytaYjhJU0tsQy9EL1R6WVdhQjFPRW1ab3BH?=
 =?utf-8?B?b09wOEhERnAvSXYrVHBRWlVIcFBYbWZQQmV1eklvNTNBbCtJcVkraGRJQTBj?=
 =?utf-8?B?VktOVXUrODBkcHNIUVVRSlg4dzZ4YWp4WkRxbzJYWW02aXdkdkdkKytjeFYy?=
 =?utf-8?B?WXFNbmV2Z0pCQnNqeXdqRWNzOGlYTlFMUlhzbllDdTBISWl4YVNza0dsZTVs?=
 =?utf-8?B?NURTRDZ4a1JjYWhxTEp0aVVsUG96a2ZzeVFqSFB4azA4a1Y1S1MrSElhVEZx?=
 =?utf-8?B?UUF0WWxRWEp0V1A0Y0Q5SFpnRFRIZmVmZ08xeW9YS1RydWVLbFR4OWNJZHda?=
 =?utf-8?B?VWN2VWxVVzFtRytMRWN4b2JpNVZoc2s0ZXo1YTI1TEVBWVVPWVdkdTAvcDRu?=
 =?utf-8?B?NzN5bnp6NHY4dHVoNVd6MXJjaXRiM1dwYkNKVkFsclVFMFJvS1hpZzFTeDN1?=
 =?utf-8?B?UEtJMFdId0NydVZFcWwrUHhHS05wZG9yM2xwQWI4eEd0U1VVbFI4OTVLL1ZK?=
 =?utf-8?B?a1dLUGZPenRUbmVWNEUvZERTZ3AyemtWNGNSYWpkMXY1UTNHZUpjQVFRMXdu?=
 =?utf-8?B?ckF0bll3TXA5ZUFaQ2lyU0NtbTU2NkNOaFZrSXd0WXNBUWxuVUdHN2FvWnFn?=
 =?utf-8?B?QzhsSlBUNGFLVUs5QS9jQ1FlbjdlOGdmMVFmcVdpZStMSzRBUVl4NnAwV3VG?=
 =?utf-8?B?TEYraFBiZzFIcXJ6R0Fndmd6d05MT1Y4SVNHc09mQzJESEV6TVBGbCtWckVs?=
 =?utf-8?B?bjVxTS9jQUl0d09MNnhLYVBIYURQS1FWcVFkVjl3eXRKempIdTdUYmp1QTFo?=
 =?utf-8?B?Q3JWQThOL3JxL0htSVJXWE16eUFiNnFMbEN6dHFhbDNSVmhSV3ZEMDRrMlh1?=
 =?utf-8?B?U0I3YkRxdWJMcVBsM2pqOVBsN3craGREcEhheE53RllSM2tIY1JOVVpuNlN4?=
 =?utf-8?B?ZXgwK1ZjMEJKUU1VNURBZnRmL1NoTFptcUpsYkRicWxxb3o0RmJtZWdXUm1W?=
 =?utf-8?B?VGtpRGJOUlhONXF2VHNjTmQxUjdBL1IzcVM5b082dHJJWmluZW5ldTExSUZ1?=
 =?utf-8?B?RlRBZHJOZW00eXJtM2MydHU4V0RmWFBiZWhhQ3FWUDJTaUQzRk05ZWNhVjNl?=
 =?utf-8?B?TWd0WkVtM1FvNm5HT1FIYW55Qm5tZUpWZThkc0E2WEpOZE1jZnluZlJDNG1J?=
 =?utf-8?B?RURZcjRJZHAwbHBjTlp0VlBhSGsxbXJtcDFYVnk2WnM2QVNud0d2R0FOVUZp?=
 =?utf-8?B?bXpUUWpnWnlrYVIxaFQ2MmZuaDdUVGlhbVlxbWpSekpRWTM4anp0UDRLZUJm?=
 =?utf-8?B?aTRqN2YzL2VsbHkzZWJXT1YxbjFZTnRLbml0YnplT0s3a3R5OGNOVWpKc2R6?=
 =?utf-8?B?QjZDbmR3clVEWFpiMGdHQ2ZTSCtxbE9YNVRGWEgvclJ1am5WSlZQQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4951b2ec-d888-4594-8f5b-08de67c7e3b1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:42:15.0744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: be0pZuul9b8f3S4ROiJWcT8W7JGrmca6RogBbhRugDq/so+BUZ+0hh602ombhb0f47p8kItZpJgQqkQqIUZbjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5196
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


On 2/4/2026 17:32, Marcin Bernatowicz wrote:
> When the IOMMU is disabled VFs typically lack an iommu_group, and
> xe-vfio-pci binding may fail. Skip load/bind in that case.

I'm not sure if checking for IOMMU groups is enough.
I think it's possible that the device has the IOMMU group and vfio-pci 
still fail to bind if e.g. CONFIG_VFIO_IOMMU_TYPE1 is disabled.

We have a control on the environment where test is executed, so I'm not 
sure if this patch is needed. We prefer to use the approach with 
xe-vfio-pci, so if it fails because of the system configuration than I 
think it would be better to fix the configuration.

> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 43 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 40 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index b73727787..3fc84bbf9 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -13,6 +13,7 @@
>   #include "igt_kmod.h"
>   #include "igt_pci.h"
>   #include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
>   #include "intel_chipset.h"
>   #include "intel_vram.h"
>   #include "linux_scaffold.h"
> @@ -325,6 +326,44 @@ static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
>   	free(slot);
>   }
>   
> +static bool vf_has_iommu_group(int pf_fd, unsigned int vf_id)
> +{
> +	int sysfs;
> +	bool present;
> +
> +	sysfs = igt_sriov_device_sysfs_open(pf_fd, vf_id);
> +	if (sysfs < 0)
> +		return false;
> +
> +	present = igt_sysfs_has_attr(sysfs, "iommu_group");
> +	close(sysfs);
> +
> +	return present;
> +}
> +
> +static bool vfs_have_iommu_groups(int pf_fd, int num_vfs)
> +{
> +	for (int vf_id = 1; vf_id <= num_vfs; vf_id++)
> +		if (!vf_has_iommu_group(pf_fd, vf_id))
> +			return false;
> +
> +	return true;
> +}
> +
> +static bool try_load_xe_vfio_pci(int pf_fd, int num_vfs)
> +{
> +	if (!g_use_xe_vfio_pci)
> +		return false;
> +
> +	if (!vfs_have_iommu_groups(pf_fd, num_vfs)) {
> +		igt_info("Disabling xe-vfio-pci binding: missing VF IOMMU group(s) (IOMMU off?)\n");
> +		g_use_xe_vfio_pci = false;
> +		return false;
> +	}
> +
> +	return igt_kmod_load("xe_vfio_pci", NULL) >= 0;
> +}
> +
>   /**
>    * flr_exec_strategy - Function pointer for FLR execution strategy
>    * @pf_fd: File descriptor for the Physical Function (PF).
> @@ -386,9 +425,7 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   	if (igt_warn_on(igt_pci_system_reinit()))
>   		goto disable_vfs;
>   
> -	xe_vfio_loaded = false;
> -	if (g_use_xe_vfio_pci)
> -		xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
> +	xe_vfio_loaded = try_load_xe_vfio_pci(pf_fd, num_vfs);
>   	if (xe_vfio_loaded) {
>   		vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
>   		igt_assert(vf_bound);
