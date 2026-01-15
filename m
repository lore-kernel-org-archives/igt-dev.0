Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADA5D3CCA1
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 08:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EABE10E18D;
	Thu, 15 Jan 2026 08:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsGFbdNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9725810E18D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768465677; x=1800001677;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CZaVTftSM2am7Ej8uMsldhHuExIzPPFgopkFhIUsYpE=;
 b=RsGFbdNtv+sqkWc87t9ve180WLnrkV4oNkQXAy8KGiuzezIK/VSX3y16
 29qeNzo6ITrdPW7fqF2FjxATyzO5j4oQXHr+/uBHdWwjL3f555vNRPtW8
 QJFjVYpvGFd4ihw59Ojt+gEFNwFZiIsnNLeDXoMmRG3Qae2LoOa8Hk1kJ
 IBMWZi1SWXL2mUKSUwwN/cstG88C3AiVcIa482o0X8N0QGLM6yjA1/HJZ
 4srzkktYV2/GNjTaGIr6Vhn13b+oP0Ih9bYS4oSdtrjKT0wtEs3EJGvbw
 x6W96IRKqhyo1+MUzWMvXghqrEyOfq+TIWGYcqptdMpJI2dJZ1pouGYqv Q==;
X-CSE-ConnectionGUID: AwvFJzWBRT+9A6TD3tMMtA==
X-CSE-MsgGUID: EVFUsIIYR4+fkTu2pRDaPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73619935"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="73619935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:27:56 -0800
X-CSE-ConnectionGUID: +RmKsZ+VRISvSLCdUaxqUw==
X-CSE-MsgGUID: HGmX8G55TUuarrz4D7Gz4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204039902"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 00:27:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:27:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 00:27:54 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 00:27:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYiWoASzC1uNjkrJdYngpI6G97se3L7ao2L+xyZvf8GArFKgdbywJPD5IKdEoA38Bjh+XChgqEPy1EseSmBYYRpPGXdOYnydq2V42UrQntvb/XZtSMaNJRwfzYnRn10vOuwgDNkgxFMVL22RHkZWV3dVjldJ0xNKKu4e6O/eRTFzHIwtuO97S8s9xDEab8QmRXLC/VXOP2JY5UOpf9xCxCiX+k1Pfike1oSGtm0t/SRozs/9gXGozC29d7IHMyPAZpE5cOhZREnJ7EO9wq5O5pBlazGhYC9Pk2mIEG3O/ECu/Y+lCKlsLxVyS7pCQSB4WQVBqaCcDqCZ18TOVoeEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rAB3ZILnijro+l/3ZJAXlWNtrqf1QB9Pf8BiUJY/Ss=;
 b=BY9ffHu0lPZN9+2qIq0LKu9WZq9GJpRLMks0VcrbtJX27fjO/Qg8AQmyzXGPRTUFGX7R02sJWuWbryrlVGj16ba9M1D/xRGKrAfbFp0dm0J8ntAkVXmT9BYXLAvV1lEzhj0dHnkXRKwCokAZlxGu6PJqMZFBa+kxWtF1YfcHbV3uwwrTJRNB9pNB+z8PrD25TaU9TwB0/ONRPoh/la853W/yBWPQ5FfEcVhZM/V92Z/Mcj7PBEnTS3Zlgkp2O6ppTjJ1a/UUOS3s5rIMWZGWSn5diSJj9EK+vmIkPwjnwFUGc3mpyUvA9OURsqDpgfjG9yMrj3XsNKEhzpkL4eG2vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 08:27:48 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 08:27:47 +0000
Message-ID: <68bcc610-8b22-49d9-9f56-b4fd68b11677@intel.com>
Date: Thu, 15 Jan 2026 09:27:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 09/10] tests/intel/xe_pmu: Prefer SR-IOV admin
 sysfs accessors
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-10-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-10-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::15) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 5842cee2-44dc-49c3-35e5-08de540ff6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkZybmMxZXl3RCtSN1VLWmU4RW0zcmpsYzBJQWNvaG1waVNYb2hqakhZN0ts?=
 =?utf-8?B?NG10YlVoTmRhT1RpcDA5ck9xM3QvRmM4UmZ3RjFsaHhYRHNOYWhWUW1yTnpn?=
 =?utf-8?B?MnFobk04VGFUVExIc0hpS3JENFdlWmpyV2RjSSt0enVTY242SUd4MlFYZUds?=
 =?utf-8?B?L3l2TmI4Q0NUMGJPcVVUWHlzSHROeXhybmhkV3VFWUYrN0Qzam0vSDRicVN2?=
 =?utf-8?B?VFNzSUlQV2Q4MHc0eGFNRHEvYXpsZUVEY0JCQnorNklCYVh0Ly9QSWFkcVpB?=
 =?utf-8?B?R2FoY3M2VFBaR0RwZGtyVDh0UEpxMTN1VWhxYVArbTNTWGdLWU1aOWVqTkVB?=
 =?utf-8?B?WXk5d2xqblVQYkJoTERFZzJiOURxQmM4aFJZWFIwRXoxTGFZOUhYQlZmZUNY?=
 =?utf-8?B?NDl0V05ZM2oyMVFackwyZ2JOUkFWby9jakdCSXFIdEtma00ySUJ0ajE3aG1U?=
 =?utf-8?B?YVkydEF4dUYrbkxYdkNmbTZNTzZKL05wRWRGOXgvSWxTczVSR3dycnU3bC95?=
 =?utf-8?B?RmpkeHU3WGVyMTBLMG5neGsrNmFWVGtnUzFLUVY0QlFIZlpjVmRGTU1qN0di?=
 =?utf-8?B?c1c3WGpQOHZPUlQ0VUY4bloyblVObVFwbCtjT3lYNjBuLytRVUZWRjhFRGFR?=
 =?utf-8?B?M3JGSXhXNStTUUxQalMya3lZK1ViandXOFJ2M1VEeHFvU2J3MlhlU1JWcyt0?=
 =?utf-8?B?am1UQjlvQjFCSnNMWk9LK0FXczBUSTB6eTdqbThNV01Zb0JrMldZZldDNVFi?=
 =?utf-8?B?TjM3VWxXVS9GeUdUeUUzTXhKR0xnNEY4NVVHck4wSEMvb2RVdVE2U3Faa3M3?=
 =?utf-8?B?bjBueWFvUHFSY1NEWHZYNlFGVWpUcVREU0lzUk5ETkJYMXVyYStaNkI4YXdF?=
 =?utf-8?B?eUh4MGQ4aWc3MWdJeU5aSWVEYUFad1VWNHgxcWZYeUh1RjNuRWFKL0hQR2lC?=
 =?utf-8?B?ZmRCTHBDL1lSeXIxQWk2U1hoejB5WU1KQ2pqdGRwMnRtUlBaN3pRRWQ5eWw2?=
 =?utf-8?B?SnZjTG9JUVlsVDRuREIwV2s0dTNlcnRTb0tEWmxPcDI0Z2FXSnZGMHdnNENr?=
 =?utf-8?B?bVRFVDRiRHNOMGtEaGJJREllVGwxZnJpdFFOencya3dJemxheW1UWDhUY1Rw?=
 =?utf-8?B?M2kzdTc2UlFwMmNhWWRzdmlFVVcyYXN5dlFGa3Uyd0hpOVRXc2FlYmxTZCt2?=
 =?utf-8?B?QkZ6dDdiSTBSOWRJdEhZQlozbzc5S0ovUE1uR2dJREtnQjgxYTFxb1UwaWtN?=
 =?utf-8?B?THR6WXpDaWJxQnNUOU9mNjJNOURMcG1qNzdweVdXWFAzcWdrZUpsbjZyYnNY?=
 =?utf-8?B?YzlYZ2VGRGE4V1FqT2JaTFVXYTVpNzF6RTc4dVBsaU9uUlIzT0JrbnZGb2pv?=
 =?utf-8?B?NFJ0N0RiUnR4VVRXdktVMGFDbWRiQWhRWTdkRUovUzI1VllmZUw5QkZKUnVT?=
 =?utf-8?B?cThVK0lRdVI5YVo1UDZnRFp2L2IwdFBkTVFSemRnUStkYTMyT1RrWGRxRVdY?=
 =?utf-8?B?d1c2WWM5QW12Q3h0UVpDcVdUTzdGVDh4aDR5WG5NVit6ekROdGFPMllvbGFw?=
 =?utf-8?B?NEVscUlaNHNXOGtGd2hTVVZmSTQ2T1pkaFlkcWliRTlhNlRKZEF3T3M5SkV2?=
 =?utf-8?B?Q2JUanlQcGszZEdWanpZZ1A2T0kwK25uNXQ5c0kwT3U1V1VmTEtueFA0clp0?=
 =?utf-8?B?SWY1alNET1ZRbmRyZlF0ZWJvemZ6WDJibEN3K1Bqc09JanJuQytkS3g0dkNs?=
 =?utf-8?B?ZnZESTBKNzZMN2JUQUJoemlmZUJ2czdSZ0ZkSU9EblhOczBUSmM5RHBtQk5E?=
 =?utf-8?B?di9sNGdQSXV1Z3UxYUE3ZUdqZlZFMGQ5ZER2cUZaMzBrcnJqcFRWSnI4ZDc2?=
 =?utf-8?B?L05yb2Jsa1VxZTVNSDlLakF5ZUxaU2ZNeUxsaGVvK2Z2Q2gzTm5XVUdROTNn?=
 =?utf-8?B?TytuM3Q0QTJyTWNudnRJQ3QrMnZQa09ZU1p5c0YvNXRkaWMxWjlLMVlMeHhQ?=
 =?utf-8?B?M0tpNE85WjZvWi94K0p1RTJVTCt4NFRHL2xvL3BHaGdBUzBCb0djZjE5T2JF?=
 =?utf-8?B?b0J1U0MyMk0vTEViL0g3Q244VzV6ajBENDJ6d25OTUJCNUNpUCt5NmcrbDgv?=
 =?utf-8?Q?i/6rcyNT1lu/UxbezUeXqyY46?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1NPRVBrcDR2dE9qcm5IRlF5cHF1ejBwd25tWkJVeVdkbUlwYmhlNFRERWg0?=
 =?utf-8?B?R2dXYkw2NXZOcFlvWGhyWU9CbFhYbDZKNVhGUWx0UVNWRUFWQTkrMzlvc29K?=
 =?utf-8?B?Y2lMYUx3bE5tS0MrZi9ZMEtndHJVaVhqelowTTRBVEhHSDRQV3BBQWhzWUph?=
 =?utf-8?B?UGFDSkxpd1QwZ0QrR2ZRdklKZHR4K01kdU1vY0k4enhBYkRIWk5hL3VQb1VE?=
 =?utf-8?B?ZUpUYUdDNVBpR2RHY3N5TWYvb2phVXUvbjh1SHVpWHVsWFVaL1lwZkVtYmdo?=
 =?utf-8?B?TkZkbDVtU20wYU1zeDNWQ0Y5MVh3ZzNmMURNbTBnVng2ckJKNGtOT1ZWdGta?=
 =?utf-8?B?Q1RIdm9rY3MrbEdKL1VvTTAxUHZtVDE0Umpibnpac0YvbTRCSnJvZ3Z0cEVN?=
 =?utf-8?B?Nzl3Tk52bmVOYXBSRFhIYUpMS1N5eG9od3RKZis0eEpCQkxCL3pLNWo5OWlZ?=
 =?utf-8?B?OXFqTXEwcXdOWVAyNHNPREEreDI3Y3ZzYi9yTGkwZENOaGV4VW5EQjhlYlIw?=
 =?utf-8?B?T29VbkZqb1Z6Wkg2UEtobXhCR2ZSNUQ0SXU4Nm16Rk1QVzlSTDg1T0Fzc3V5?=
 =?utf-8?B?dGxNaWJFREkzUHMzbjUvckR5REplRWZrb216b0tOS2F6aTY4NmFLd1JsR0c2?=
 =?utf-8?B?VEU3aklqQ3NkYTNLRWkrYkVjVXBiRE0zTEZ2ZGRETFRqMHZYQ09QdGUxSUVQ?=
 =?utf-8?B?TTR4cUNTd3NQRXFLdDJxaGxjR1h4aHJxT0RaOHJJL0Y0VVljcmNxR2IxZm9l?=
 =?utf-8?B?SDFiNGhkYksrZUZEK044dHBlQ1dGUXBCWmVoMjBjdE9YanBkaDRCbDNmcEcr?=
 =?utf-8?B?cXFxeVVzTEM4VWtLWHFxZk9pUHdGeUF1dEJzVWh0VjM5NGRpbGs0WGZGQ3Vi?=
 =?utf-8?B?R0lDN0h5aE9haVk5NHdEcGs3QXArd2haZWxoYkJVZnFmbE1rSGN5RUVKZ0VO?=
 =?utf-8?B?Y3I1SFhFZjFQY0tqcTY4V0pOMHYyZTJkTXJ6NkxjaHZOblFmOVFPZzdvSjBx?=
 =?utf-8?B?eThybU42T0c3T1pJclFzZzVJUVJVa1BWdm9kRjRSdFlWQmZQVlVDMlRGeHl1?=
 =?utf-8?B?UVdtbWxtQ05LVFk1cklBZndOdXdDRFArZ01QM053ZWRVOEE4SzRIQ2FqVXdO?=
 =?utf-8?B?Y1kwdXRWMHhiYmxJWUlXUFAzUE1nMGNqelBOVSt5bThVRFl3MkRGRFNpVmxR?=
 =?utf-8?B?ZFUxZWptV3BkZlo4MUhhWHlhYzNSeEU4Tm0wVE5OcmdvY1NGRXFXZ2RSYTV0?=
 =?utf-8?B?TWFUV3pHVE5ZeXNncWpTdkkxRWVSK01QTnJHYjRQaVV5d0FsNnUvOHN0ckw1?=
 =?utf-8?B?dUlpZ3lCRERuckkrdmJISU1LcUhmZEx1eVhMczUxY0lxZGFXQXhFYlg2dGEv?=
 =?utf-8?B?dlYyeTZNRG9nWXU0QjdmV3dpMW5hNVVrZVcyT3FQSytsS1JvRXc5bkc3UTE5?=
 =?utf-8?B?TmNQUkp5alhVNzVEaDFQV3hyZnhnQS9KcXlQUnBhUS9wUk44dHVuYSthOTJZ?=
 =?utf-8?B?ZjV0L2k2RFoxZzZjU1pKNmxvZS9rTVhZSTM0Uld3Sy90NGE2SlQyNnlDcUk3?=
 =?utf-8?B?eE93VGFwY3daQVNydDB4TWIvNDc2UjJObTZyVzdzNVU4T0lUWDErcEJIVDhS?=
 =?utf-8?B?VTVzdSsvam9Qb1crTENDQ0lobnhxb0NUcnVGN21RdjJ2SWhnTTVTcHhneDAx?=
 =?utf-8?B?U3pjZC9aSlJlMGVWWGhFZ1Nzc0k4S1FLVTcxR1IvOGQ3UElJOE1zd3Z1SGNT?=
 =?utf-8?B?NDJVTklZNno5Qy9OODVFVVNLVUhGS3AyS3Vrc2VXVm5paGFiZ1lZc2Y3WFFi?=
 =?utf-8?B?VGNMZGNvNm9SVGNZTERNTHFNcm92Z1VNRUZPNHZYaDNiQmY4dm9Qd0RHZ2tM?=
 =?utf-8?B?QmNDUUo5LzJ6K0xFRUVKb3diTUZTSU5sWWR5ZWVDaGNVVERlUWxidzI4S2JT?=
 =?utf-8?B?OE5BYnd4azFyZ01DZXZMMTFlUUszY2VIV2Irc3ZLcGgweGYzMERqcFJyM1Jm?=
 =?utf-8?B?YWxQa1ZibUNDNnJKZWNSQy9Pa2EzdW5Dd1J2SitrcjgxZkZkZ0F3TEs2Yzlu?=
 =?utf-8?B?L2tBSzJzL3VtT2YyZC9NTEE5WkZpM2c3SjhSYVBrU0pPdTM3VUpwTW4vOTcz?=
 =?utf-8?B?Vkl5RkN2VmtsS095VUhKMGw0UVhwWlUva1M4bGpsN2pYSVBnN054OFhYcVlL?=
 =?utf-8?B?QTVGbkI3Z2k2SUJvT2tKN1FqM0RoN1daS3VyUENpWHFOcWc5RVF5Y2IrR3h2?=
 =?utf-8?B?bkZCa09HSXprTTBza3AvWmwxaWpxcUhlU3hSaUJPMFFFeFVVZk1nSElBeDcr?=
 =?utf-8?B?c1cyanFteDBhSkV0M0tVdWVXNGtUaDhiRGZ5a0xwSmVlY2pkOE1VQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5842cee2-44dc-49c3-35e5-08de540ff6af
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 08:27:47.5200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbyCgYebdiRGtVaiEB7tbQSw/LnknrW29/1B4/sDXt+vwGiulz+gpbbSkt7Wu3LYaK6PgqwcZQvur/MLz6oN8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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


On 11/25/2025 11:23, Marcin Bernatowicz wrote:
> Switch xe_pmu scheduling configuration to the SR-IOV admin sysfs
> setters for exec_quantum_ms, preempt_timeout_us and sched_priority,
> skipping the test if sriov_admin is not available.
>
> Also adopts the “Tie preempt timeout to exec quantum” change using the
> new sriov_admin interface.
> Link: https://lore.kernel.org/igt-dev/20251107151251.6323-2-jonathan.cavitt@intel.com/
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   tests/intel/xe_pmu.c | 43 ++++++++++++++++++++++---------------------
>   1 file changed, 22 insertions(+), 21 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 6e91b752a..f8f66ce56 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -102,6 +102,7 @@
>   #include "xe/xe_gt.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_spin.h"
> +#include "xe/xe_sriov_admin.h"
>   #include "xe/xe_sriov_provisioning.h"
>   
>   #define SLEEP_DURATION 2 /* in seconds */
> @@ -693,7 +694,7 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
>   }
>   
>   static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
> -			       int function, bool sched_if_idle)
> +			       int function, enum xe_sriov_sched_priority prio)
>   {
>   	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>   	double busy_percent, exec_quantum_ratio;
> @@ -701,6 +702,9 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
>   	int pmu_fd[2], fn_fd;
>   	uint32_t vm;
>   
> +	if (prio != xe_sriov_profile_get_sched_priority(fd, 0, NULL))
> +		xe_sriov_bulk_set_sched_priority(fd, prio);
> +
>   	if (function > 0) {
>   		fn_fd = igt_sriov_open_vf_drm_device(fd, function);
>   		igt_assert_fd(fn_fd);
> @@ -748,7 +752,7 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
>   	if (function > 0)
>   		close(fn_fd);
>   
> -	if (sched_if_idle)
> +	if (prio == XE_SRIOV_SCHED_PRIORITY_NORMAL)
>   		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>   	else
>   		assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
> @@ -973,10 +977,12 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   
>   static unsigned int enable_and_provision_vfs(int fd)
>   {
> -	unsigned int gt, num_vfs;
> -	int pf_exec_quantum = 64, vf_exec_quantum = 32, vf;
> +	unsigned int num_vfs, vf;
> +	uint32_t pf_exec_quantum_ms = 64, vf_exec_quantum_ms = 32;
> +	uint32_t pf_preempt_timeout_us = 64000, vf_preempt_timeout_us = 32000;
>   
>   	igt_require(igt_sriov_is_pf(fd));
> +	igt_require(xe_sriov_admin_is_present(fd));
>   	igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
>   	xe_sriov_require_default_scheduling_attributes(fd);
>   	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
> @@ -988,37 +994,33 @@ static unsigned int enable_and_provision_vfs(int fd)
>   	igt_require(num_vfs == 2);
>   
>   	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
> -	xe_for_each_gt(fd, gt) {
> -		xe_sriov_set_sched_if_idle(fd, gt, 0);
> -		for (int fn = 0; fn <= num_vfs; fn++)
> -			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? vf_exec_quantum :
> -						     pf_exec_quantum);
> -	}
> +	xe_sriov_bulk_set_exec_quantum_ms(fd, vf_exec_quantum_ms);
> +	xe_sriov_bulk_set_preempt_timeout_us(fd, vf_preempt_timeout_us);
> +	xe_sriov_bulk_set_sched_priority(fd, XE_SRIOV_SCHED_PRIORITY_LOW);
> +	xe_sriov_profile_set_exec_quantum_ms(fd, 0, pf_exec_quantum_ms);
> +	xe_sriov_profile_set_preempt_timeout_us(fd, 0,
> +						pf_preempt_timeout_us);
>   
>   	/* probe VFs */
>   	igt_sriov_enable_driver_autoprobe(fd);
>   	for (vf = 1; vf <= num_vfs; vf++)
>   		igt_sriov_bind_vf_drm_driver(fd, vf);
>   
> -	total_exec_quantum = pf_exec_quantum + (num_vfs * vf_exec_quantum);
> +	total_exec_quantum = pf_exec_quantum_ms + (num_vfs * vf_exec_quantum_ms);
>   
>   	return num_vfs;
>   }
>   
>   static void unprovision_and_disable_vfs(int fd)
>   {
> -	unsigned int gt, num_vfs = igt_sriov_get_enabled_vfs(fd);
> -
> -	xe_for_each_gt(fd, gt) {
> -		xe_sriov_set_sched_if_idle(fd, gt, 0);
> -		for (int fn = 0; fn <= num_vfs; fn++)
> -			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
> -	}
> +	int ret;
>   
> +	ret = __xe_sriov_bulk_restore_defaults(fd);
>   	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
>   	/* abort to avoid execution of next tests with enabled VFs */
>   	igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
>   		       "Failed to disable VF(s)");
> +	igt_abort_on_f(ret, "Failed to restore scheduling params\n");
>   	autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
>   		    igt_sriov_disable_driver_autoprobe(fd);
>   
> @@ -1188,13 +1190,12 @@ igt_main
>   		igt_describe("Validate per-function engine activity");
>   		test_each_engine("fn-engine-activity-load", fd, eci)
>   			for (int fn = 0; fn < num_fns; fn++)
> -				engine_activity_fn(fd, eci, fn, false);
> +				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
>   
>   		igt_describe("Validate per-function engine activity when sched-if-idle is set");
>   		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
> -			xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
>   			for (int fn = 0; fn < num_fns; fn++)
> -				engine_activity_fn(fd, eci, fn, true);
> +				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
>   		}
>   
>   		igt_fixture
