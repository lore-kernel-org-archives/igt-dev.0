Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043D7CA0FE7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 00:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEF510E036;
	Tue, 26 Aug 2025 00:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9uvsfKV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D542E10E036
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 00:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756168742; x=1787704742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d1VCtYlbB7xOcHVwFlZmcw6eT3wUHX4j1AEiv5gw19Q=;
 b=a9uvsfKVYgzwH8eVb16SKOVb6+6ZCRN0rzsJG/Gqm4OwjHumaN4Xdcwl
 6BxK9h0mSDJA3uBCqvMGKfCZk/xszuvvOL7sQBSTa9KoRAFw215kSS7ra
 o+stqmYJH1sdKZ04A2jfEKYFqAQjKAO/rSkwx/cKOjcMVESK5SuUfCz6a
 ACL7wVih4Knqcn9TfEwSbVgVDmbYWH74cavzipcTHbXAnaEsrfDy+NF8q
 qfT4K2YLjmamgTT8+PDgNYivccSaTEOrCdXZKqrHyrBa4VA8uvtW+X8iS
 hxLEUV9cEsGHIxrkq5+pX76/+u4JWvzqsfXEEc7SvNqp3JJHknObvRlI+ w==;
X-CSE-ConnectionGUID: qjfeWZ35THizoqP795phpg==
X-CSE-MsgGUID: 7gSCZ/+SQ0Gts5xS2D7oXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58101598"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58101598"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 17:39:02 -0700
X-CSE-ConnectionGUID: CC5ORXQCTH2kU8/CIrHH+g==
X-CSE-MsgGUID: ai8lNx0xRkSF1m8XpdKB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="168686477"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 17:39:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 17:39:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 17:39:00 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.65)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 17:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s13l8EXNFK7X0yTAEn4621xJejNMhn1XUjRe7SMOHnhdDy07KEGsODX27rroWEewhCr4KT9r9I0uJPGEe9ZPdXLOUViY1joYMTVws9DpdqB+LSUw1OV9XwHDF4rRSFYrK7ggSX6aEKVLyvTnb0zYUBOD2cmY89oNge42dxjoaHyRShttNMsacd3geaAuuEBYkagVgIe0MbtE1c+/YPuzq+dOoG+nKqUShsNPbFwaVoNzNHIIltNJb718Qnp35eCMcOeLpHC4T+4/R59gW7c/5FSAvGi6j6380R8PMqZUmEwwxqze/Xat3YX5zuTMSzw+CM8uskaY+VEJE4H+hGj6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z90aw/faPRl69opoXdbaNAXHF3PdmuO2O1UgkKXf79c=;
 b=nsNQzOIPRiiJrLNR7fxv3kIGS8+y6/IiBuTvJW39glpd8qRkBQkGOCiiQ928UsiSf26npOs5AMzMFHx4SuHDgHNYXSEI4DXqleVG3Xnaxd++3o9EhGR2MMD1rRQRJjSfyd++jifnDBSqSVI+XYbylsh/EvtTnQmBy+anGDY+/ZUTTeBgezZTE3iGJt4z5P7zUysG8I5lHtOs/J5H9e/c26lSPiY6HOduvLF98zbLLQlhfTJGEv7Ka4LeTRi9BpsquS1OGq6y1pYBSrY9UT4+M0roibYq8D8ocnrV+7sFtjgaTZXvQKBF7fFc1eoZJsA47S/VrU905mGAf3yh+w+xGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM3PPF076C797B1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f07) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Tue, 26 Aug
 2025 00:38:53 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 00:38:53 +0000
Date: Mon, 25 Aug 2025 17:38:51 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/4] tests/intel/xe_oa: Fix report dumps in sanity
 check
Message-ID: <aK0CG93jmSw2y0rl@unerlige-desk.amr.corp.intel.com>
References: <20250823003401.109978-6-umesh.nerlige.ramappa@intel.com>
 <20250823003401.109978-7-umesh.nerlige.ramappa@intel.com>
 <87tt1xyjy4.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87tt1xyjy4.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0179.namprd04.prod.outlook.com
 (2603:10b6:303:85::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM3PPF076C797B1:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0a2e10-1e02-4f56-389b-08dde438eeb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R09YS3VBcFFVRDVJZW80Vi9paTVUdkZsdHRyOHlRU3dzc05pUnhudmltR21I?=
 =?utf-8?B?MXBpSTZWUTY2QXZZOWk2MUFSeitmZFBKUkhlOHdqeWNOc1BxZ2VNRlMyNHND?=
 =?utf-8?B?VXhLYTArc01kVFpWeXNxZ2F4azlIWnl1VFMzYXQ4eHVGYUxvNmRaL0pMQXhF?=
 =?utf-8?B?cnZwU0ZKTnJHUUxpSlFkbGY3eHlUYWRDbG5FQUhKUW5RSzVrUWRmVVorZEZM?=
 =?utf-8?B?UnFMeWlxRlgraStjdXMvTVlnc0Z1YXJlbnErY2FMQkJkMjV5QTRpUHVqMzJn?=
 =?utf-8?B?Um1CRktNa1BYZS9tZ2NOVG90VUo4SU9XdmVNNDRaaUFyZ0VpbHJDVVhjT090?=
 =?utf-8?B?Q0pJQXhGcDZQeTVOVm5nbUdKSXdnTlNIYTlSb1NZaWpRM3pmcmgwVVQ5YUli?=
 =?utf-8?B?dC9tYXV5U0QzbUdMSTAvRjVKRDkyQVZidmR3c1hONmhHZVNkcHNiVDI5R1Nr?=
 =?utf-8?B?elVvR0NFNFhmWWVqNExzeWpod0g1ZUpIS2t6WStRLzdPRmNuc01rbElRREpG?=
 =?utf-8?B?RUtNbmlJcnBJL3NYMy9OQW8zOE5FRHlOZmgvVmVUYnYrUURRbWIyOVplNkUz?=
 =?utf-8?B?dWQrWHZqaDMxZmNEYUhCTWwzYzVFV1FaOS91eCtYNmUrcElZYXM0WTdrWjZK?=
 =?utf-8?B?ekMxZzJoR3ZYTnBPKzVpUTBNMGp2TWZyN043OU1XR0dOZmFwZVRQalMyTzg5?=
 =?utf-8?B?aGgvdnl4TjJaQmUwNG9KeFRIU1pzLzl4OHcxeGFidFlGZzRjVG5pR2l5Umwz?=
 =?utf-8?B?RjB1cWF5Y25tczJLOHlnTXQzNkRYSmorUDlhcVdTc0ZDVFJnMER1ZXNSblUw?=
 =?utf-8?B?T2VTMlVFRjV1dEV0L2xKQWt1V0ZmL1lFREQxdTRFTm5GT05kSHJmQ0lBNXVo?=
 =?utf-8?B?NTVYTVQ3WHFmb3JHUFA3R0VqU3dtaEY4SUFvNlBaaEdhR0l0c2xKaHNNTGcv?=
 =?utf-8?B?d2NsckxDck5rWHJFRDVBN2NFNDVHd1U1dFB3SFBDdUJtMVdUdG1ybk1jVWl0?=
 =?utf-8?B?dXluYWZqeXVWRjM5OTJ2Smlwdy9VY1lUSlRDWm40SkszUnYvanJXWDJEeTRu?=
 =?utf-8?B?MldlR2VUeGVtME8zVVhXNlBiSHRxakoveWQ1T25nMnZaSjNsS25IbkQyVnpw?=
 =?utf-8?B?VkV5eWRlYkdpY0ZUTmtiSFU0dWZxb3hsc0VLVkVpUVFaWi8wa2hSSHFuUGNw?=
 =?utf-8?B?WVdMeXpQN205MmVjbXZlc3FXNjR5NHVyNXNzL0Nxay9zUUZzcUNrK2RsRGM4?=
 =?utf-8?B?NDdkS1NJSGFLMzZjTUpvam9UQWNRNE1CLzR3YnhKMDk3aTlPMFUrZUowU2t3?=
 =?utf-8?B?TzJ5NTVpVXVucU5tblBRdGpLd3R6MWcwSzJGWXpGR0l3ajRwY0ZKbHBVbnNX?=
 =?utf-8?B?QnNTTndtTWI1cG5iRkxKeStCK2ZscHIrbTRZRFY5dXVrVHhlMUEvb2h5VWEz?=
 =?utf-8?B?ZXU2bU5wOExlcDY0Yjh4U01JVkFJZUU5cGhsNkI1OHE4TGQ2WkVGTzVTcVR2?=
 =?utf-8?B?UnFsOG52RXUxcXJyME0rU3ExRUpQQWtuVWZKOHRBMEttOTU2RUgraDhnemdY?=
 =?utf-8?B?UTh2SFlhQUhROGI0bHplTDAvT2Rialc5amo4ZmpsNllZQWNPOVc2Sy9taExn?=
 =?utf-8?B?SzFxWUFsUXl6NDJLZ0o3RzR1S3dqMUpSZ3RmWEoxeXhoaFBBOG1oUytqK05T?=
 =?utf-8?B?NFQ3VmRHMFZGeGJGZmxXMllXUWl6RE5GbDdIUWw2S2lYTzRPUGJQSFpLVlha?=
 =?utf-8?B?MEh4NTFRR3hkZ2J0TGIxMjljOEllK2tlZUZyYy9nSTExNkRVMDRGaEQ5ZEJR?=
 =?utf-8?B?N2R5NVZYdkh4YVhaYVdLSGMwejJDZ0trT1JsNUV4TDFDWmgzRnNneXFkWjNJ?=
 =?utf-8?B?OG5sc2FlbU5IV01jUjRqcGQySjF6NytmV25rQ1ZWamxzdzNPQVpkTFhwZWF2?=
 =?utf-8?Q?Of13hCtaswk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0dROGRvd3NITG1zRG5tdFRkZ2llVnZCdzVLNFU0cFQveVZub2JsckNnYWdS?=
 =?utf-8?B?d2toT3grUEFQR3psdmptQm5WSWZ5SXArUURYQjlUdDMvaEw2bmhLazVGcmlR?=
 =?utf-8?B?di82NHFJRkZCb3RNY0pTeDJJY2R1UlhoTWVHdEhzZXE5VUFBMzdEQTJ2ek5n?=
 =?utf-8?B?MzFkNTRPTWROYzh6MDJHQlFIYXQxUGd1bHNZMS9LaTJET3JDZm9Ud2pLWVpQ?=
 =?utf-8?B?RHUwOTBYVVpYdjJqWHFxWFpkZWZWZlpyWUdGbjJkVlRjYVpzb0xPY0pXNi9T?=
 =?utf-8?B?NmpMVy9za08xNEhxTVVuY2xMRGRoK2pWOWUzb0ZTZkEvVk1wcjhzeHFDL0JS?=
 =?utf-8?B?NDNoRjBYZmRtdnRuOFJFQVNMUk10SWw0bEdiUXZTQ0VIQW1jWGFrMUpXYnhL?=
 =?utf-8?B?MVN5Z3MvUFZuaXg5SnNqVnhpVWF2UjdaS1hEeWtNUVdLblB4M0duYmJBeDNC?=
 =?utf-8?B?UU93dEdZU2VORkMyYlFCMWsvdEM1UmVOYTJLQjFUdXBzdUNYTnFRaDBWTVpZ?=
 =?utf-8?B?N3RGY2xCbnNjUFhKaEFySnpiWHM5bFAwZThlZmNmOGVOMnI5WXJDYXI1c3dz?=
 =?utf-8?B?eEN6SFJxMTZFU1QrL2QwaThHNUJJaEZTdzk3Nm0rSGQ0V3hrdldETmdRSjhN?=
 =?utf-8?B?Q0FMTDMyNDBrWFZRS3lPdTVYVDd4MnZBdTliYlRLQytObFJqUHhNdlcyclE2?=
 =?utf-8?B?RXZROFNNR3pwRWg5eUx6bS9CZTdDUElJVjFKTlpTRkVkOTA5V3htY054K1po?=
 =?utf-8?B?MkE3d0VjQVpOdnAzNWlSR1B1Ymh1TzdxVmhtZHM2QjhnbVI3NnFidEhCb3dH?=
 =?utf-8?B?Q2ZKaDFUeGlVZ0lBN1RnTzZXL0c5T3ZBUUFTRXJ5RXhrQjYxNC9MWU9TODRR?=
 =?utf-8?B?d2pSMnpvYlJRTzIyOVFKRERMQmdQcHlVYVFTVlQ0MjJnQ3FuZVByWUJVZ0NO?=
 =?utf-8?B?cjZ0WTZseVFFTm0vc29rYU44c0JXSmlqbzdiNmJOYzcyTXBXRldSaSt5MHBI?=
 =?utf-8?B?M1RpanlaRlRzZTBPMkFFNWZEVGtFcGpDWEVpNldUQWF5UkJTMlh3MHpGNVBm?=
 =?utf-8?B?T2t3Zi9MS1BqRlYwUmNmVWNkZGwxb29lYnpxSm96Z2hRT0VXcnFpTWltMlRa?=
 =?utf-8?B?blVRa3dCMDVMTVhla2VDV1ljOVl2Ly9jQ2xKRVkwdCtiUTgwRGdrTHhqUzlP?=
 =?utf-8?B?TFUxcVpyYkNSb01seWF2OEdWdmw1K1BTdXhmSlBTWXFxemJoTnNzMFBPeW41?=
 =?utf-8?B?L0VIMXdEM3lDR2NNazNsVVF5UDlrVFpPT0hYd204NllaZ05xZnN4bnVtVU54?=
 =?utf-8?B?Y0o5L3JLdkNOQVFmUnBuVkJ0aDd2NFpVTWptWUVQVWttQU9QUy95MktRY0ky?=
 =?utf-8?B?WVZGU1R2WXBYd3JrUzZMRWtycFFsamJTcm02WFhScFZoNGFMYTNPbngrc2I3?=
 =?utf-8?B?a1ZCY2NNWENwK2c4MUpGWmkwZXdXTkp1UWJONHgvRkNza1BnOTFiV1puV2kw?=
 =?utf-8?B?UTAydmNIbnovQWdNeHdkQ0xCdXJoTXRpWnZHMUg0SHVwYlphT3hwbGRpL3Fm?=
 =?utf-8?B?T1BqQjRTK08xU1NCeUppZk44N1cxRnErL1RqeXhOMzFIdmFiZWZTbkdJNytW?=
 =?utf-8?B?VTR1YUQ0c2VQZ1dXQUt4dWhrZlY4emVkdVpTN3c4ZndhQW9jaWVzS1NFRjdm?=
 =?utf-8?B?L0dDd2t1dUtlUWUvNi9kaVpZaEp4TGU1Z3JMeXNpamU4TEcxajkzaE5vaWp6?=
 =?utf-8?B?d01pRy9Ma0NYOTVUOU5GS0FwaVAvNkNMeUFCNUcreFpDQ1k4bEYxbUVPWkN2?=
 =?utf-8?B?WEY5NGlEak8yeUk1ek9GVXJZaXNpTEhtTVVlSHc0TVI2SHlEdWdzK2FZWEZi?=
 =?utf-8?B?SG9GMzJmSGswOVBEWG9VTDkxb2dBM044bzFwWFI0NmJEZnlnRUgzamNmWjZP?=
 =?utf-8?B?dE1ZTEgwR2x0cFJoZ2pPcnhVUjdrQzVLdVJjVTBYMlByZytMeW5qNDByVlZN?=
 =?utf-8?B?bE5xOWxyQnIvMmswYTU0Yis3UFJJQjFTcGxudXZSSURGaWZwaGZVV0YwMmxC?=
 =?utf-8?B?RnVkdExzTFMwZEtveDAxblpjbWRZUFh1dVUvcmRrSi90WERQSGtHd3VFbE8r?=
 =?utf-8?B?aUsxUDUwL1I2dFhKQU8vSkZvekV3SjRlWDJ0RWFLZVJHZ2dwY1NzcmduQm8z?=
 =?utf-8?Q?vvE3jl64ETk4plPJzMOAhvU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0a2e10-1e02-4f56-389b-08dde438eeb6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 00:38:53.2807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtGhOnBiD7aKxJHUdvBUapiscuDjffbZFy9RgpTricFHkhdLUio+f8FqQowgsTVpWzSk+/rxAZH0WUxCRp/DGwOPlU4X6ZNqt7eykOfh7Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF076C797B1
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

On Sat, Aug 23, 2025 at 11:25:07AM -0700, Dixit, Ashutosh wrote:
>On Fri, 22 Aug 2025 17:34:03 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> Fix report dumps in sanity check to dump the right amount of dwords.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 63b59028fc5d..35d25150ec7d 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -1052,8 +1052,8 @@ static void pec_sanity_check_reports(const u32 *report0, const u32 *report1,
>>		return;
>>	}
>>
>> -	dump_report(report0, set->perf_raw_size, "pec_report0");
>> -	dump_report(report1, set->perf_raw_size, "pec_report1");
>> +	dump_report(report0, set->perf_raw_size / 4, "pec_report0");
>> +	dump_report(report1, set->perf_raw_size / 4, "pec_report1");
>
>This is correct.
>
>>
>>	pec_sanity_check(report0, report1, set);
>>  }
>> @@ -1471,8 +1471,6 @@ read_2_oa_reports(int format_id,
>>				break;
>>			}
>>
>> -			dump_report(report, format_size / 4, "oa-formats");
>> -
>
>Not sure about this. Could you move this to a different patch with
>justification, if it's needed? I think this is there to dump Xe1 reports,
>which pec_sanity_check_reports() will not dump, though maybe for Xe2 it
>double dumps? I'd rather have more data there for debug, rather than data
>missing.

oh, I removed it since I saw double dumps. Let me recheck this one.

Thanks,
Umesh
>
>>			igt_debug("read report: reason = %x, timestamp = %"PRIx64", exponent mask=%x\n",
>>				  report[0], oa_timestamp(report, format_id), exponent_mask);
>>
>> --
>> 2.43.0
>>
>
>Thanks.
>--
>Ashutosh
