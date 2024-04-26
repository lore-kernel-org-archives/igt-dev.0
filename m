Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65787C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 11:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A5C11220E;
	Fri, 26 Apr 2024 11:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRycNtgm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A6611220E
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714129870; x=1745665870;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hp96dIwnlFo97mYd9fTv+xboI9y9W/CAppLcV7NkjDU=;
 b=CRycNtgmG/AcDCSPhD/C5utDjA/xNEdt9UQAh3pcu1IfX9GUlzlKrK8J
 7IwOWrPBQqUR3RkpcHF41xfUdiFsTwth8826fOm1A2dGXJ/VOuaDuzRjf
 WasjpBPr/o+s/RU4B6p29FXGPX3S2SseUclyLBCbzsHQ9MAl1dLYD1NZU
 UIB8ZjHUZCzqM8IWTDqqkXX4pjkW9LfqrzYG3DdhDzqytEvp7jg5dwztc
 EqsFUS2uR4cOA965PZ/iPBUWURJJzzDcThULmf5rQQ+rtXl5H+d1gKDVB
 Yl9lhOUBqJHpLkzwB5Enoy2K5q1k/Na4KGC0GQmN48wCkyZWouV/3ly58 A==;
X-CSE-ConnectionGUID: ghDPuBS2TvWet8I+XGYWsA==
X-CSE-MsgGUID: vF68xbK2RXy40gpvMY5Vzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10076043"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="10076043"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:11:09 -0700
X-CSE-ConnectionGUID: tQddWGX1S2mKYMCheR2ubQ==
X-CSE-MsgGUID: VdQbAnXhQPOC6tH/oHI8lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="30190871"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 04:11:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 04:11:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 04:11:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 04:11:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 04:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4mRB14N3YeEP2YEt1KIqyNabkEDtBwA20y7XgcIGRU/46sjZP8YsGsq8K2FmH3ot+/pFzFa/CNjwG4QLq13mvqKBwLbv042YJ4EjufXrQOzYiSnR7qJIzGnWnDZ5pbtBia2dLN58p1CDov8lHZInVHzGIJleFFi/Qkp4/LflwPtPkPu9Uw0QT3/JG18z0geDfEwFu2n8y9JtrLbOCE5UFs/OgMSQGZ7hBRLc9VNfYAYemk+AwdNjFhR6D/NCv+2KFyXQd0P3SqKkfOdGAQlsvOrGSitzV3vLEyHKgPDe4o5plMjB2TGnTZykVllWr+egTsufuDc6xpB+hDKTIBZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIYVkI225W+9Por/6kMs9206TFYiN+Gg0fihiesC4MI=;
 b=GPHvzpbj8m9jrQnTHYKejRYhVjNq6UbOrh6/yK4+i40cdMwAye8IIx+ZLcywknoxbTHTkxLmBpqoQpHvuSGIpXxmnmvtvdOqRJraJbc+1Vx7kAF4qGR4/oZoDiQ4KAkwIbKcbSglHygXSX+Vqrv4opwtCNsF12lR9/d5X7RvJwDTtTix41XRJCQ3pYFDHfvlCAMdcwE8px0zvTfe6XmITtxh6+C4gccAhcYupMe4bgouNumOzEHrVhbUHeq22zki+VKJQI92S1CKK2C3Gy20/Wmri8SS1E7EE+FDoy2l8lY/xDDYvNSov+6Xef97bBsFWQb4Y6IXTv7RHL1qRbo1AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Fri, 26 Apr
 2024 11:11:05 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 11:11:05 +0000
Message-ID: <0788391e-861e-4076-97e5-f32294cbdbb6@intel.com>
Date: Fri, 26 Apr 2024 13:11:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 02/10] lib/intel_blt: Rename confusing fb tile to
 i915 tile
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-3-zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240426090117.78060-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2P250CA0001.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::6) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: f20975be-9392-4292-598f-08dc65e19135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0J0citJQWpzRWN1dmNmcWpOekJwSmF4NERIWWxUM3NHbUhhcm40QndsdFFy?=
 =?utf-8?B?VisyMTE1ZUdPMkw5d1dab1ZoR1l5bHNoVUtuM2ErbDhEcStMSnFWUkRZejJB?=
 =?utf-8?B?N2pIOFlac20vbkJDRGZHdXlkN1BieEFtQi9DQlhnTE8rK1JkNDZlRmsvRGlr?=
 =?utf-8?B?WkZlMXlUbHRJZWR1eXRzNTUyUkdEallZQzhac0JnZXBQN3Fva1dwMTMwK2xj?=
 =?utf-8?B?TFk2ang2M1ZkT1BsSlhxLzFIWW1RekJvSmh5WDNlQVhzRTE4L3d5K0l3YThL?=
 =?utf-8?B?bk1mL3N4bGozZUhiL2psMFcyajh2NFk3N2FQSXVOYjJkZjkyZERKaU4rbDIw?=
 =?utf-8?B?N0lzQWlJdDU3cUo1SDZxb3ZmTGdVeGZiZ2lKUW4vblViOWpBZEtOc3l3MEVh?=
 =?utf-8?B?cXFacXlaakp5b3cybnQvMTZBRnBBK1JOcHpvbkUrVnE1eVpVVjlpbDFZWS9F?=
 =?utf-8?B?NHJIUGRTZ0NjOHY3WjlSbVNpOUFMOHlQNkt6bjZITVJIcUV4VTNhZ0htRm5z?=
 =?utf-8?B?UEk1eC95WHFUT0JseDl1UjNSdkNib1NObTFVcUowTlhLL1BYeVZZeGtETG9C?=
 =?utf-8?B?bzh3K3FYd0N6SCtiRnVOcFdYQ1lCU0NZM2JKQ0dPWUJaeVl2aXJGbUdLRVhB?=
 =?utf-8?B?K1BrKzgrS2UvT0l5L2tJcnBFbHp0Wmp5NGpOSXVPcjNua3E3bEpvUndxQVd1?=
 =?utf-8?B?aGNuc2dwTFk2eG4yTmd4cVI2WUIrU3JDQWs4UFdpaFF1czZ1MmN2NjM2WVpF?=
 =?utf-8?B?bUtwNytmM05BR1hlb2VqQk9TcUhnd0ZSUjk5U3Q4bk1MTzhFMmlaMUVKMGFy?=
 =?utf-8?B?Y3JZUkhSdnd6Mk9SMXJuYnhpZzFaUjlQR0lDYzdBVTE3QUdjemEwVE10TFBm?=
 =?utf-8?B?MmVQeXBUeVZtVE05ekFaRDBkVFZFTmF5K3p5QytCZ29ERVdqYVFtRElQNmF5?=
 =?utf-8?B?dGJiUk1iU2N6ODVHRlRyMk8rNjd6d2FkZndWSXZLMWtCMGNmQ29RN3IwaXNi?=
 =?utf-8?B?ajZjdzRxUHQzWFFWVTVjb01EYnI3ODI5R2pkekpPNTMyNklsRG5Md1NLL1I1?=
 =?utf-8?B?ZE1BMDZlWGhBTTV3aFJiTnhXMCt3MnhlWXJRZElCRWVqUytwc3owTldlendV?=
 =?utf-8?B?TnA5TXljekd3Q2U1WHZuMkxwNTNVY1ZsbXBCekFIOWtPZUt4RUw0dHNna0RL?=
 =?utf-8?B?VTFBOW81Y0F3K2tVVGw1ZHY1TS9GOGtvMWJiVFU4emhSWE1UWUpPKzhEWVh5?=
 =?utf-8?B?b0dRMHdMZ1ZtMUo3R3c4d2J2a2VSenltc21lL01JNkJWSFJxM2dvYVl3WHY3?=
 =?utf-8?B?TW5WVWZmQ1dheCsyV1ZsVTg5WllRV2Z2R3R5czgrNVl0Y0d3YkYvNll1S0x4?=
 =?utf-8?B?V1M0MWFNZDBybUJCS0hjaXdwK0daWlBid29nclgxYVNqSFd4d3VUV2NHVjhh?=
 =?utf-8?B?U2ttTFRhUWhnME5PYXRUZXhUdit2L3VodnFqRDREdnhGTG5iL1VJdlpFc2k2?=
 =?utf-8?B?M3NFaHo5WC9KUWdCelYvVjIzWTh2Z1FDNDFQOWtHRkdtcTBPd0RXSUl3SGJQ?=
 =?utf-8?B?UXJHNGpnVVRUUUJsZ1F3cHI3QWxkL2xTK2pjeW4vZ1NWbTA5NExvbFIwNWlr?=
 =?utf-8?B?MGJtbWhBUmdpcjlEMUFjVVNMaWx5dzFnVDJiY1poM3FBZ0RSSEVZUUNnRytR?=
 =?utf-8?B?aTJ5bTdnNTNBUVN0WjNvUVNxclJHWjkxeWVxYXAvNVdnM2dqM1NQdDRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFA3R3BIQ1pJdHVXN2I0M1d3SWFtcXRkeWgxNlloTGxLamFoYkc0OXBETk9w?=
 =?utf-8?B?ZXFMZFZFVWZUSmFRNTZyVkNEUm13a0UydXZQbnowOW1UZ2lZZzFaWWZQOVhX?=
 =?utf-8?B?NUVzQ0piWTdwemtvMFdQV1BHVHJYK0RTcWF1QlBuVWpwcWdSTVpTREc2OFlR?=
 =?utf-8?B?YVVuVVVSSklMWFJkaEo2QnhkMi8rVEZLTytuSWxXVTZMNXRUQUJFVXVTcDlp?=
 =?utf-8?B?NUYrU0N3NGpIdWdRU0NMUEJrRE1SNys5NVNzZGl0VU45cGU4Y3B0VHFDTmJV?=
 =?utf-8?B?V0EvVDZBbHlBVGZ1OXRTbXFEc3djMUN2Y3FLdmxEbUhOazF1Tm43dnlsVXhK?=
 =?utf-8?B?TktieUFvSCtjcGNzczRoaThuMmFscnQ5SHBROFQ0Yi9mODJ2bDNnbmdIT2ZK?=
 =?utf-8?B?VThFQ2JWa1k1MmIzNTFZZTBqVlM5NGswaWRMNnFYdWc5Y3l6OStkcVBTL0J0?=
 =?utf-8?B?MHhoZkRxQkllRUcxdHRBbzczam0xUkVYNGM1Z0toK0VQNS9LNnp2VW4zWDRD?=
 =?utf-8?B?TU1tbGVkYlRLMVNOVWJwZFBROERQSFQxUUx4ZXg4bG5LN25QOHpoVm9Ub2pS?=
 =?utf-8?B?NEk1bFZ0MXRVUGs1UVpHNVhMWG9SZjVkeEh6OVV6eGhObVkzWHB6TGZKc1Y3?=
 =?utf-8?B?L1cxMjB4NHM0V3F2ZmNRcy9aZlVlazZZbWEweFpXZEFISEdiQndzMGh5eTFl?=
 =?utf-8?B?WGs5QTQzVlRWbERWNmpXamJUMHVoNDRRODkwVWd5aVJadmNzT1JzcEM2My90?=
 =?utf-8?B?VXdzdTM3Z25wdURWYmpydVZreU0zMHZ5MjhydHE0dEZnZU54YTZqbldhWjB6?=
 =?utf-8?B?NkM3b09TWXg2cWRNNGg4dVFSbnk5blE2OU9ZVjNGYlhGYm1aWmJ4R25mTUFJ?=
 =?utf-8?B?RXRMNERrTFNLQkJzVkV3VHprdHgvOUluUWtvdHc0UXhsNnRuZ0dneHZVL1Np?=
 =?utf-8?B?dzJ4elJwWjd4dGpvdms1NlFoTlJDQTVDcmZtNW40U2hlaFQ5bkNCM2xtOVpN?=
 =?utf-8?B?YjVKZHhLbzdtTnBjYUYveXg1TmdDamFJdFlMOG1KTHI1ODVYRUpBZlRsV3Iy?=
 =?utf-8?B?NnM4ZDJhL01nMk9FakZ4V1dySHljQUtIZmxtdWwwVVg3N3NidWJIWk41RmdN?=
 =?utf-8?B?bkFiQXJRWXBKTkdNVExaS3RFZXJjZ3lUcUo3ZkVpN0xCVUpDemNOei8wditj?=
 =?utf-8?B?TWVqc2JUTXZHTnZXQUtDZndoQm9LSGNzanRmSTA5NmY2NlIyY3ludi80TzVQ?=
 =?utf-8?B?c1Bxa1NIbTcvamp6c1JWSklUd3lTdlQ1SDR2TnVYbFlZbWs3ZlZwcUw4cnBF?=
 =?utf-8?B?MHRWdndicXdlem1PY0xDOTZSOC9ZbDN6U1RWL1FEQk14WFBxMFc4NUVtc2Zt?=
 =?utf-8?B?YTdHdVdWenRXYkI3QnBQZThzZ3VvNjArbjRzNTFFejNMcmwrc2lqelhteS9m?=
 =?utf-8?B?a2xTVkVjd0E5M3JTczluZjBFT0RlSlJCSndhVXhGT0FoRi9JYmd2eVdlK0cz?=
 =?utf-8?B?bkJzVXRhZ3NjalkvVzJBVWlUTWFNV1lEeWw3V3djbkxCcFJ5TTlkdlVvK0tB?=
 =?utf-8?B?MHpJL0pGeC91YWt0Qm9FbHJaaFhOSVdRWUFLeitCb2FhSzlLSjgyVFkrTnp6?=
 =?utf-8?B?MVpNTjYrU1k5TlRYWTNCWk5jbUVZL0hCYmVuNStqMTh1RHJsdlR4eHVmZWRD?=
 =?utf-8?B?eGJFQ1RYRnVrb0p4UkNMVUxVRVBwMTJ2aUdtdVBXdUFwZTJROWdMU0E1elVK?=
 =?utf-8?B?ZVo2UmdtazZwS3dXdWk2VlU1Nm12aHFOQ205em1vMTd2cVVrSXcyYTFKaWxq?=
 =?utf-8?B?bUtzdUJ4cEdjMXBVOThCNlBrZzl5d3Zycm9PQlBDb2cyRENWdVZ0VWhnbnBG?=
 =?utf-8?B?bWlSU1QxL2NKODVhTXVVd0NoUmpNaDhkL2RzYS8wMTRFUjR3RSs0bW9odVlN?=
 =?utf-8?B?TWRSSHgyWm5BM0VkTVpOS3czKzF2L3lTZG9SeEtabU95ZytVUFJUZ3BocWlk?=
 =?utf-8?B?RjlDOFYyclk4ejFHTURVTlpWUm4xK0pwRkhmWWt4RjY4MjM1dWhBRCs0UW1T?=
 =?utf-8?B?dHJEVFBNN3RPR05aUkFMNDUwamsrQVFqM1NFYzM2REc0Nk1teHJ5bzlJQ3ZO?=
 =?utf-8?B?RmZKUGRnK1R5YXJVdzdwclAvSkhaUW1hSWNsK2xONnFLS3FGSzhsMnpmajdU?=
 =?utf-8?B?c3dLSTVXaUh4NmtrVUgzNlJad1AyblIyaE5PWVJmUlluNmNvSndxWTBpRnNy?=
 =?utf-8?B?bWhJekxLVEhyRUN1ZzhkbzlPT2xBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f20975be-9392-4292-598f-08dc65e19135
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 11:11:05.9063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncuwTMzuyxs9GVVxGfwmXsCYYEsL3DPaBG/GhK61hGncwv1DsI0rWTddjJUP1dNiGQV8efL7NmY+vcqVEm/cnoF3IIZHR9egMqYV+3P8izU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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


On 26.04.2024 11:01, Zbigniew Kempczyński wrote:
> Fb tile is defacto drm modifier, thus blt_tile_to_fb_tile() name
> is confusing as it converts to I915_TILING*, not drm modifier.
> Lets rename it.

I agree with the sentiment, but I wonder if we should have this function
in intel_blt at all. It's only used in xe_render_copy test. Why not move
it there?

All the best,
Karolina

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/intel_blt.c              | 4 ++--
>   lib/intel_blt.h              | 2 +-
>   tests/intel/xe_render_copy.c | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 4da5cc855e..5a281036c4 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -536,14 +536,14 @@ static int __block_tiling(enum blt_tiling_type tiling)
>   }
>   
>   /**
> - * blt_tile_to_fb_tile:
> + * blt_tile_to_i915_tile:
>    * @tiling: tiling id
>    *
>    * Returns:
>    * id of tiling introduced in i915 like I915_TILING_* used for example
>    * in render-copy code.
>    */
> -int blt_tile_to_fb_tile(enum blt_tiling_type tiling)
> +int blt_tile_to_i915_tile(enum blt_tiling_type tiling)
>   {
>   	switch (tiling) {
>   	case T_LINEAR: return I915_TILING_NONE;
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index cc59666862..fcfce69bee 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -213,7 +213,7 @@ bool blt_platform_has_flat_ccs_enabled(int fd);
>   bool blt_uses_extended_block_copy(int fd);
>   
>   const char *blt_tiling_name(enum blt_tiling_type tiling);
> -int blt_tile_to_fb_tile(enum blt_tiling_type tiling);
> +int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
>   
>   uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
>   			    enum blt_tiling_type tiling);
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index 4f98cb7dfa..ef75c4ce6d 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -407,7 +407,7 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>   					continue;
>   
>   				tiling_name = blt_tiling_name(tiling);
> -				tiling = blt_tile_to_fb_tile(tiling);
> +				tiling = blt_tile_to_i915_tile(tiling);
>   				igt_dynamic_f("render-%s-%ux%u", tiling_name, surfwidth, surfheight)
>   					render(bops, tiling, surfwidth, surfheight, id);
>   			}
