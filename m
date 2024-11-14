Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFBAD68B16
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 13:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FC210E030;
	Thu, 14 Nov 2024 13:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naBXAXED";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E1610E2AE
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731591234; x=1763127234;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=DxOKZdRVeoYB31+tsZ+Ce6S8jP0hHdlMA2/im89zNs4=;
 b=naBXAXEDRLbJFy97NujZLMSgZzVHKhSQy7IwqheYGE5mZ7J5okSHzm6B
 W5Bbqz3DE0HbJH6gh9iReVmjcuqHlbjANBQwY+3EJz6EA0m1ytwgK8h6i
 eVfJgr9jfF45v4p7RH9cCyZALH2Axt3KkYAs6Y8l5Agzt8hg5bL0JHeZZ
 JdCpkLCgFf2bpIdKBQcqXI3tpp3CQF/WH6G2i1ZKCcjj/7kfJzFxgbIFQ
 IjdYUL9ba568Z1+PkhGEOz5eZ1R3HhLA8ILTrUL8sMoptWzjQw+BiURtd
 TNlpvwkYoZAzwQXey6w1p0L3Y3XPmZebNScbhCFl79c6/WNxBZIETJ3F2 w==;
X-CSE-ConnectionGUID: CR4M/PziRRWxV47j5ov3Pg==
X-CSE-MsgGUID: BIKMBhz9T7muJnwWs+Z1aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="56925862"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="56925862"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:33:54 -0800
X-CSE-ConnectionGUID: PlHPetI6RvqpO/RnHoEpnQ==
X-CSE-MsgGUID: vPcQx/gIQWCDyaOtNYTD6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93154381"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 05:33:54 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 05:33:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 05:33:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 05:33:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwpDCzOGVFM2OCX5PLbr8q52hTrdy1XeNDCE/h73KU95qR8/XM3daV9811ygGXF4sP3vXL+KoEhDP1ns2cfvVADNUkU06982Lew5dYk0FXWSJFMoJfJ23VO19Q2fgyPBZSnQ2vlyrwdWgRhoM6TGCOEo1n2yEEiQLRLgkh4/Nut8kSxZhqtiW1DBT7RgfoIA/iHfRXqmFcRcJBctFev/SugMfzw9z00gZSQlgXsm9pLibKQOs8WlhPotx8tQTYk1zJOIOldw2ExP95n9wQoFOYuy5jnbB0oLnfL2lrg+CtICq2jGEyF+tl9jBoxa6JbOv2hWXv3KncToT7MmvuStIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxOKZdRVeoYB31+tsZ+Ce6S8jP0hHdlMA2/im89zNs4=;
 b=UZ2y1YDUeP6IfABeP3QWDfzk8hm53olzAbU2AKXsjYBCve6KFFbsvo61T+xFHecnAcsoW7P8gpqW8yA50I9FKcMJu3nhLUMdayGMA5NMVcE/dDq2HtmkcwQhdCxrvyUCbPTS2QwNT+KTDwqwPD2FqXEG6eWdcCUHQtv9Held4DO5lbjvoXXLGkdTpzBDUOegYZZBJaiHEgnUwcDLqyKULkGX5oIZM3dN6f5ymfnMvhkUTawn/8f05J7sufA6doMx+aXlhXslwN6YyXpyv5WpueMsJgxPfQEXlUGjFdiK+m7dWpUfPM4ts1e2rTvsDUHU39b/eeAR/b+xeCDDaHKAHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by DS0PR11MB8720.namprd11.prod.outlook.com (2603:10b6:8:1aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 13:33:50 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 13:33:50 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/3] tests/xe_gpgpu_fill: Add command line switch to
 dump the surface
Thread-Topic: [PATCH i-g-t 1/3] tests/xe_gpgpu_fill: Add command line switch
 to dump the surface
Thread-Index: AQHbNo2oJYU888xAs0S5pYqidHAdlbK2xo6A
Date: Thu, 14 Nov 2024 13:33:50 +0000
Message-ID: <d35b1fc19f348a4e9969ef331830918247a1e114.camel@intel.com>
References: <20241114120616.70229-1-zbigniew.kempczynski@intel.com>
 <20241114120616.70229-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241114120616.70229-2-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|DS0PR11MB8720:EE_
x-ms-office365-filtering-correlation-id: 8e574567-2632-487b-96fb-08dd04b0f997
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OXRKYVNOZUhOdXQyQkYxYzU4alg2UXlTMXpZeHB4M1hBSUdaRVJBUG85QTZ6?=
 =?utf-8?B?THduSzRZZ3N0NE14RzdpTnF2M3laMWR2U0pMeGhKd1hzUk9Eckw5NHZ1MHlz?=
 =?utf-8?B?bGFveGVTcGUwb2hWSzY3QmJEY29OejQrbTllekFYZ1FIayszdzEyYWdnZ2hB?=
 =?utf-8?B?U21hZktYUTlYclNaakZFUk9wREszR2lVcVFSYUdDRTVkTDhOa2N2Y09yWGd5?=
 =?utf-8?B?UlYyMmZlR0ZaWVZKSWFVNTlQcFRRcWpqeVZZNWMyUmRtdXlMcTlMTUkvb0hP?=
 =?utf-8?B?OE5IOFJKY0xQVlFhZHdFeGJ6ajR4V1hpOUxZWllOSXlncTI0Zzk1YUM3dC91?=
 =?utf-8?B?ZXl4R0ViN0dsZ1pnb1VpbGhMTlZQTEdhQzh1NkpFYXVFN0laSzhtZVF3MlVG?=
 =?utf-8?B?bnRJL29YUHo0WUxsRGk4bkZaaVFsOUlpYndnbnhybEpHSUhFQUlNdDdJTFJK?=
 =?utf-8?B?MWFsclVTc2xJSUNmNWVWU3JIVnhtODdBdmpLQTFBQkhrOHdTT3pEY3ZIQ1JR?=
 =?utf-8?B?ejFTc2xjUkxrMWJLanlLYVJvVGhrY3Q5UEVheng2bGdENGhIcythTlRUQWt4?=
 =?utf-8?B?RlBjVlVOTDhpQWh4Vm9zREo5MEpESzZnUEc0NDVNQjQzRlpuczJVdTVuaDJ6?=
 =?utf-8?B?NVpTckNXT0prdXg1ZjJVQXpwT1NEWC9obFFWY29sbGdEbFhRWDlObmFBbWlt?=
 =?utf-8?B?cEpqaVJ0RXc3aWxlMEhVVUt4RTloVlo0ZDIyKzRQYmJzdmdOQnF3YWVTZ1F3?=
 =?utf-8?B?ZGVkOXlTMmZtL0J3VW8yN0k3UHhvaXp2VU9xaEswTldFN0Y4enc0ajFLci9F?=
 =?utf-8?B?WXRIVXVFSjlHVjJjMTJ2SnNxYS9lMGU0aHVLOG53T1FNMkRMUEVGQklNN2ZQ?=
 =?utf-8?B?dGZyRVBsZzhJRVZ3TjdNNFdhNndjK0NUSTd0WUl1OExZbGptT3R2UVovaUwz?=
 =?utf-8?B?Y3o1aUkrazgwRXpUazg5cEJlTmxuVkFhTU96TzhDdmprTUFtbDg4RzdBN2Yr?=
 =?utf-8?B?K3pZS01YeGIyUmxzenorWHZIS2Vzbjl3NHE1d0tjNHhYQmVkMlplOVhTbW9l?=
 =?utf-8?B?U25BRzYzMlJCVUorSHk4UTlUL2w5cE91WjNteGxabnh0S1Q4d2YxSDR0OGQ3?=
 =?utf-8?B?THpuWGRYRThYLytkL2FLVStINzNra2VUdTczWEVhYVF0dlEzYlRScUw0Y1NJ?=
 =?utf-8?B?NytHVTJUZmtXSjVScHQrNDVWUHNaUjJIekVvbDJHYmllNEh1b2tCamVNMWxz?=
 =?utf-8?B?S1ZwV0FSb1dReG1EdGhnN0dnWUlqT1haeVRrN1FFUlNseGpOVWY2TWN0L3lN?=
 =?utf-8?B?ZEI1WExRanh4SnN5S0NoVW4zRVdYeUR2aUNJZDVjd3Y5UzFoNG1hVGFhY1g1?=
 =?utf-8?B?WU9RMjBhMjIwdjdHLzRXWWNDWVBQc1VyNTloTlVSSUVKS2hHdTl5SWd5bHAv?=
 =?utf-8?B?R24xL0lGOGY2Q2NsT08zOUJaSHg0R2hOaVVENC83Nk9Tdm91cTc4WERFMWpt?=
 =?utf-8?B?UkdmWUJLSDlaS0UxbFI0UFJiR1d5NzZyUm5BYytqY0I2UXRoRzdnOGVrMElW?=
 =?utf-8?B?a3dpOXBjY0Z5TUtqMjlXNEhlTHRvTlhrVzQ1RXV2Zmc0WXdzSDRJbnhrYXNJ?=
 =?utf-8?B?VCt6ZlVXNDlPUy9NMm41bWdSMWZ5czE0S3FadjNXUzFhaEJqdHB4RTNoMjFE?=
 =?utf-8?B?UHYxQndacjltUVIzaGZvRVF1U1RSdUFUOXF1ZlFGeG0zN05sRGhuM2tTY3Vr?=
 =?utf-8?B?UUswRHczMFA4cER4UXZzN05YQnBDaE90clBJKytjdWFvbEF1R0h1RUh5WXlX?=
 =?utf-8?Q?N5/xEMYLQFrd1VIqW2XdTa30ZZO0sXP4Q+un8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGdwa3pzdm1EcWUyQktyZlI5OHBwYlVDY2R6NVdOVStPVmlRdXVYbndiTEJs?=
 =?utf-8?B?RVdnQmVYMmZSMVA5VmRIZ3V3LzhHSnRCM3NXV2VyejlkOUVUU0tjNGxyb1Q1?=
 =?utf-8?B?bGorYVV5RHlHRVBuNkYzdmFraGNyR09xV2tEM29lTytkYVpVYlFsT1VORXBv?=
 =?utf-8?B?REMzSHFiUTZsTWRnRDRFTkxQbGRLekU4a2hCeXVMUjRXR0tMMVRxVlJOb2lF?=
 =?utf-8?B?TnVJeGhlbXZLbndQbWMyVEN5MVBjai91elhpdlB1ZmV6MExnK1h6ZHA1UGF5?=
 =?utf-8?B?U05CdnlRSmhZM2xnVUcrejgzZmoyRmhrZTVFNFR0QTRZVkF6MW9xK2haQ0tD?=
 =?utf-8?B?dnZYWkpQN25mZ0JtcmZYb000Z2pNT3ZFUk8xTWQrdERleWRIVHR5T29aeHBl?=
 =?utf-8?B?Sm1VeTE3UVRZNmp2ajVQTUJNditOaU40eTF6eXV2L3lpVTF6ayt4TmVjZGhD?=
 =?utf-8?B?c1FSaWZkMitKV0lucWo5MEkzbUQ5bW53aXNhdkN4bTZiaFBic2tjQzVjWFkx?=
 =?utf-8?B?OFg5MVZEN1B2WGg3MjF6d3VtT3hIajAzOFdSbmdvSloxR2xieGdnYWJlNW85?=
 =?utf-8?B?RVAzOUFjbjhWWWhTYkZRWGt0dG9BejBYczRlUUdINTh6Y1VJK2R1cW1uQWZP?=
 =?utf-8?B?QU54OVNNcSs3T2IwQ0NMVXZyYWpGZzJzNDZQUDI0MVphTzNweUJVRFNCVjNj?=
 =?utf-8?B?UXQrUzQzd3ltSHlqdWlSOEdRRTd4Tk44QkZTcFZ3N1pPelFBZzJWZGRVa2FU?=
 =?utf-8?B?b2syaVVCdFVPVllOc1pLNE5RNTN0R2pWbWkyUTdGOHF0SmRqSGp3WDUvU3o1?=
 =?utf-8?B?NUhZOVkyem1tUHlBL1lkelFrUzVRYlEzR0VDSVhnVHF1UG9VQjRqZ1k0Yzgr?=
 =?utf-8?B?bmxVTWh2ZGJVZTFyK1JRTW93dzFVbUNkU3pScUQweG1HSnVhUEhUS1JuZFht?=
 =?utf-8?B?d3pub3FNckcycUl2RHBYU0JLMGI0SkZYRmVnV2xYdXVUTlVOU0hmU3pkN2I1?=
 =?utf-8?B?Mkt1aDVlbTRheTA5SFdEU09ZTnVuanAxcVNlc3hpbUx6THppTGs1eTVGZlFz?=
 =?utf-8?B?S0Y5bFJ5am1kYVBuc2N1M0N5bm1nZTRuYWkrUjZwTnNjbU04dUxHa3JCV2pR?=
 =?utf-8?B?dFJraU5LRm1pSWFyRXNLSkE5Q1dTbFBPTXlSS2l1ZFp3RlZneHBwSzVya0U3?=
 =?utf-8?B?V3ZDbHRGOThsRmNnanRTZFVOZUJBaFIrNnU0TUZuSVRpMFBQRGJlS2o0NkVU?=
 =?utf-8?B?RGc3eFhMcVVzMjc5V0xITzBUYVJ1T0RBZTluaHRyNjdXOWJHQkVjaEhFWUFX?=
 =?utf-8?B?NFNYYjk3NVBXK0k0NXBFZDlKUmlBUFhXTGZMejZpb0g1eVp1NXZxWEtmUWU2?=
 =?utf-8?B?c3M0OXMrMWRxNXc2NFhQZmxYc2d5aE9JbU1lVUd5SVgydWo2N05KdFZZcmpj?=
 =?utf-8?B?clY5ZXZXSjFob1h0dTZvSWZWQkk0Q2pyTlF6S2t1N2xiTHV0TjRyM05ZeVNO?=
 =?utf-8?B?NS9xVEtIdFVzcFJEeU5nUEMycjNGT0RGYnlmV0pCUWNZTWlvRXF1cHpHQWN0?=
 =?utf-8?B?aGFOdmJHeU9FRlJtK3R2RVB5bnlNWnFBUkRBbUswUzBROHd6RCtkZDRreTFX?=
 =?utf-8?B?OHg3R1Qxcmg4dHBCMTlxK0FNb3hjZUJqSExlbFpnd3N2ZWltWFEveEZ4RnVN?=
 =?utf-8?B?WHBaMkJ6Mzl4N0ZRYytQbmFQUXpucVFKNnJlVXVwaktvR0l4ckFsNGkzQ0Nm?=
 =?utf-8?B?OU1wMVVDNUZ1MUxYMXhvckxaK3ZGbk5xRU9WZTloMk9YUUhQcldUMDM5MmRJ?=
 =?utf-8?B?akFra0s1ZDZtQkdldzFiQXFHNXpCUlhQZmtiM1lrV1YyMVpjUTdUaHR2UkFp?=
 =?utf-8?B?QUQ2WTN4S3prODlYaDJEZlpDMTJubkhoM1h1Rmkrd1ZBcFlJajRJV0grL3V1?=
 =?utf-8?B?MjkxbkZ5WXVteDlwb1pzK1FEQmkwdi84alYrNVFQZlB0eExQejBSc0Exb09i?=
 =?utf-8?B?dGk1WVlNeTcyaFNlTU4yd21UazJOR1JmSEYvMlRodi9vcWZZb0E3WDRkN2NC?=
 =?utf-8?B?TlRyRlNWNGFCbkFwMkVtOE9ZNExjNGorQ0QreFl6cEZoNGxqcHBzeXUxZ3Nu?=
 =?utf-8?B?cXBxajJONWx2SXJNdndReTllcmVVeFd4QjJpMnI1Q1I0TVdJMUpGdzF6Yk9X?=
 =?utf-8?Q?0+u9Bk+Dc4cGagU0cPfYvyI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <182801E3C4253C4AB69633321D2DA0C8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e574567-2632-487b-96fb-08dd04b0f997
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 13:33:50.4113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: POeAdQyPbfJ3UpblPypN+KXoXCgDIGBR+NJOz9rFlJRbyBn9i74SiBn2a57SvcQJPlXf/IKGJ2vNgOANOFKY60YNDkwXTn581tYSg/q9Wcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8720
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

T24gVGh1LCAyMDI0LTExLTE0IGF0IDEzOjA2ICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IFdoZW4gaW1wbGVtZW50YXRpb24gZm9yIG5ldyBwbGF0Zm9ybSBpcyBhZGRlZCBh
bmQgc2hhZGVyICsgcGlwZWxpbmUNCj4gbmVlZHMgdG8gYmUgYWRvcHRlZCB0aGVyZSdzIHVzZWZ1
bCB0byBkdW1wIHRoZSBzdXJmYWNlIGRhdGEuDQo+IA0KPiAweEM0IHBhdHRlcm4gbWFrZXMgZGlz
dGluY3Rpb24gZnJvbSAweDRDIHdyaXR0ZW4gYnkgdGhlIHNoYWRlciB2ZXJ5DQo+IGhhcmQgc28g
Y2hhbmdlIGl0IHRvIDB4ODggbWFrZXMgZHVtcCBtb3JlIGNsZWFyLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+DQo+IENjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5j
b20+DQpNaWdodCBiZSBpbmRlZWQgaGVscGZ1bDoNCg0KUmV2aWV3ZWQtYnk6IERvbWluaWsgR3J6
ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9p
bnRlbC94ZV9ncGdwdV9maWxsLmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9ncGdwdV9maWxsLmMgYi90ZXN0
cy9pbnRlbC94ZV9ncGdwdV9maWxsLmMNCj4gaW5kZXggMjRmYWI1MTljYy4uNGUxNzg1NDMyYiAx
MDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZ3BncHVfZmlsbC5jDQo+ICsrKyBiL3Rlc3Rz
L2ludGVsL3hlX2dwZ3B1X2ZpbGwuYw0KPiBAQCAtMzYsOSArMzYsMTEgQEANCj4gICNkZWZpbmUg
SEVJR0hUIDY0DQo+ICAjZGVmaW5lIFNUUklERSAoV0lEVEgpDQo+ICAjZGVmaW5lIFNJWkUgKEhF
SUdIVCpTVFJJREUpDQo+IC0jZGVmaW5lIENPTE9SX0M0CTB4YzQNCj4gKyNkZWZpbmUgQ09MT1Jf
ODgJMHg4OA0KPiAgI2RlZmluZSBDT0xPUl80QwkweDRjDQo+ICANCj4gK3N0YXRpYyBib29sIGR1
bXBfc3VyZmFjZTsNCj4gKw0KPiAgdHlwZWRlZiBzdHJ1Y3Qgew0KPiAgCWludCBkcm1fZmQ7DQo+
ICAJdWludDMyX3QgZGV2aWQ7DQo+IEBAIC04OSwyNiArOTEsNTcgQEAgc3RhdGljIHZvaWQgZ3Bn
cHVfZmlsbChkYXRhX3QgKmRhdGEsIGlndF9maWxsZnVuY190IGZpbGwsIHVpbnQzMl90IHJlZ2lv
bikNCj4gIAl1aW50OF90ICpwdHI7DQo+ICAJaW50IGksIGo7DQo+ICANCj4gLQlidWYgPSBjcmVh
dGVfYnVmKGRhdGEsIFdJRFRILCBIRUlHSFQsIENPTE9SX0M0LCByZWdpb24pOw0KPiArCWJ1ZiA9
IGNyZWF0ZV9idWYoZGF0YSwgV0lEVEgsIEhFSUdIVCwgQ09MT1JfODgsIHJlZ2lvbik7DQo+ICAJ
cHRyID0geGVfYm9fbWFwKGRhdGEtPmRybV9mZCwgYnVmLT5oYW5kbGUsIGJ1Zi0+c3VyZmFjZVsw
XS5zaXplKTsNCj4gIA0KPiAgCWZvciAoaSA9IDA7IGkgPCBXSURUSDsgaSsrKQ0KPiAgCQloZWxm
b3IgKGogPSAwOyBqIDwgSEVJR0hUOyBqKyspDQo+IC0JCQlidWZfY2hlY2socHRyLCBpLCBqLCBD
T0xPUl9DNCk7DQo+ICsJCQlidWZfY2hlY2socHRyLCBpLCBqLCBDT0xPUl84OCk7DQo+ICANCj4g
IAlmaWxsKGRhdGEtPmRybV9mZCwgYnVmLCAwLCAwLCBXSURUSCAvIDIsIEhFSUdIVCAvIDIsIENP
TE9SXzRDKTsNCj4gIA0KPiArCWlmIChkdW1wX3N1cmZhY2UpIHsNCj4gKwkJZm9yIChqID0gMDsg
aiA8IEhFSUdIVDsgaisrKSB7DQo+ICsJCQlpZ3RfaW5mbygiWyUwNHhdICIsIGopOw0KPiArCQkJ
Zm9yIChpID0gMDsgaSA8IFdJRFRIOyBpKyspIHsNCj4gKwkJCQlpZ3RfaW5mbygiJTAyeCIsIHB0
cltqICogSEVJR0hUICsgaV0pOw0KPiArCQkJCWlmIChpICUgNCA9PSAzKQ0KPiArCQkJCQlpZ3Rf
aW5mbygiICIpOw0KPiArCQkJfQ0KPiArCQkJaWd0X2luZm8oIlxuIik7DQo+ICsJCX0NCj4gKwl9
DQo+ICsNCj4gIAlmb3IgKGkgPSAwOyBpIDwgV0lEVEg7IGkrKykNCj4gIAkJZm9yIChqID0gMDsg
aiA8IEhFSUdIVDsgaisrKQ0KPiAgCQkJaWYgKGkgPCBXSURUSCAvIDIgJiYgaiA8IEhFSUdIVCAv
IDIpDQo+ICAJCQkJYnVmX2NoZWNrKHB0ciwgaSwgaiwgQ09MT1JfNEMpOw0KPiAgCQkJZWxzZQ0K
PiAtCQkJCWJ1Zl9jaGVjayhwdHIsIGksIGosIENPTE9SX0M0KTsNCj4gKwkJCQlidWZfY2hlY2so
cHRyLCBpLCBqLCBDT0xPUl84OCk7DQo+ICANCj4gIAltdW5tYXAocHRyLCBidWYtPnN1cmZhY2Vb
MF0uc2l6ZSk7DQo+ICB9DQo+ICANCj4gLWlndF9tYWluDQo+ICtzdGF0aWMgaW50IG9wdF9oYW5k
bGVyKGludCBvcHQsIGludCBvcHRfaW5kZXgsIHZvaWQgKmRhdGEpDQo+ICt7DQo+ICsJc3dpdGNo
IChvcHQpIHsNCj4gKwljYXNlICdkJzoNCj4gKwkJZHVtcF9zdXJmYWNlID0gdHJ1ZTsNCj4gKwkJ
YnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJcmV0dXJuIElHVF9PUFRfSEFORExFUl9FUlJPUjsN
Cj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gSUdUX09QVF9IQU5ETEVSX1NVQ0NFU1M7DQo+ICt9DQo+
ICsNCj4gKw0KPiArY29uc3QgY2hhciAqaGVscF9zdHIgPQ0KPiArCSIgIC1kXHREdW1wIHN1cmZh
Y2VcbiINCj4gKwk7DQo+ICsNCj4gKw0KPiAraWd0X21haW5fYXJncygiZCIsIE5VTEwsIGhlbHBf
c3RyLCBvcHRfaGFuZGxlciwgTlVMTCkNCj4gIHsNCj4gIAlkYXRhX3QgZGF0YSA9IHswLCB9Ow0K
PiAgCWlndF9maWxsZnVuY190IGZpbGxfZm4gPSBOVUxMOw0KDQo=
