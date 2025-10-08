Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC87CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 23:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6392310E104;
	Wed,  8 Oct 2025 23:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mkc/AVFd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCE910E104
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759966447; x=1791502447;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nVPMYXV8igOSDbpRbPxpxfJH5Kj/mDwvbk1QwXCg+zE=;
 b=Mkc/AVFdivpcd8bBJLOPE6faFqhvwiRgKLVDvMqRJJWSooWRX3mmYLO5
 XxPdD4LAfadcKDbt+Kjsd1FeKH78H9N4We+Ght7uIUEdHVfQ7AWUZaDrw
 m+wae9yYGuWO2MlkX7148XQUcV7+NDRy27cOGQu0MRQhjQxYMvuVPWs9h
 OR6KVXlJlL9+Dmn+1anis/BsgRkJb6ih6rK7MesnAjzwXd/KsxM8KZk3T
 ofk12yvy1hiD+fMb5ibag+tuUT3su+nODWjw4sYaznJdWrMR2kc4J/TMv
 H11Dw+sBemuLT3c+pam7RlFC8ajt3Yj2C5D6CNfigj07uAx9cmdCLl+S3 w==;
X-CSE-ConnectionGUID: gPDrm2enTSi19Gs19cm8Ng==
X-CSE-MsgGUID: KNTZvuYLQS6fR3RbEgD3MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62202146"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="62202146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 16:34:06 -0700
X-CSE-ConnectionGUID: ut7Bw21LTBOpiF2miMMrSQ==
X-CSE-MsgGUID: Ry9XpIkLTIegZ652btqPWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="185688033"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 16:34:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 16:34:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 16:34:05 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 16:34:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXNSkc55FsQhchRX7TCIT5zI/9bgFQet7fiA/54VnvYKvHBJ5fX3SdvsyjaRnRCgdstAOaC2ZQ11LELZx26dATZaG0Iz0nJFfO8gneIVl/DAY/7oHHhTElf0dh5G4nhwGv++kes0/mAGmi8LRvN7IBP9iLSsb3u9E5GeD4SNK0WZ4oVA2KMsHmmGxE1r+2cw6anNHoDRLRdQLDNEnuFwUXIRMRPAoZOeMQUmcqEkEjtHz0HG4IW4ukUVfPt0vgIcIgjxONha8FWWKNnFrMATHurv/ndOUT3i43rlO68ik6FqaHjMpKsCoODUyTFPyqFqhaOi+inixJtYJ/GYkHQNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aYchiNdpS948FOQdx0IrTWmiGSeQSB2JUCas8mBbR4=;
 b=hO65h93e5J75+qVj4laIdwKLmNmhjB6yfZztkihk9l+B+Q6D4afVFXsO2rZclvLhb8lH0xkGQPv2Lp5jpw5cYyB5UqPV8+kJ8/tfqsr+pr2vgdbgv4KWXV10MZWE+fGjiXPUfK+dPg8U68KwoyfM3eKP3I8p2m+vJ2uLbtl1Azo65A1ry6k7MU/96sHraAmMsJ37MCaNeSOSBMo3knqlzyfmfptkP4RMpGmm9lk6EGksH/DG6AUlX6pEYXzxwWhvs060HFzwOuLRVQYkFiKFEcm6wygggvKjoP8/6IlbyG9QHQUdOnzVdry8nXkxlqvI3XgLlyhC91CvzL38EcTvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Wed, 8 Oct
 2025 23:33:59 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 23:33:58 +0000
Date: Wed, 8 Oct 2025 16:33:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 04/18] tests/intel/xe_oa: Change oa_unit_engine to
 take an oa_unit argument
Message-ID: <aOb04cA45Zm5Feok@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-5-ashutosh.dixit@intel.com>
 <aOboZs+GJyJ2/HCg@soc-5CG1426VCC.clients.intel.com>
 <87h5w9dlrw.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87h5w9dlrw.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:303:16d::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 386662be-c0f0-4bd3-c763-08de06c3256c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnIyRmRqOHUvTkVRQTRPazAvL3NlakZnaDlyanZNV1Zsa01BMkcrUDNoSFhl?=
 =?utf-8?B?RkdHZ1hpY3RsQzhERHcwRGdQVC9OWEtsR01oZHFBa0FXUGU1aUErOTBBL1Yx?=
 =?utf-8?B?NlNIT0VOclpqQVlDYkJXWUJpT0toeEVEa2lCeU5CNEg3Y3FGSm9vZ2JlRHJ6?=
 =?utf-8?B?RWJJeS9Kb1ZBeWRxWXZvY3NKVnlPdytmNTlyQ2lKVWlNRzdEam1EcHVVbkdk?=
 =?utf-8?B?eDZsTlRYU0w3VkJMNjBHV0ZVSE5lQ1c3RW1uTmpIR3Yrd0xWdVF0TVI5YWdp?=
 =?utf-8?B?RFBEczlESHByUEFMYkp5OWI3V2tsZXRWcStNQzdwdWxzUW5SREVDL3FNOHhT?=
 =?utf-8?B?ZmpabnNURDRYMUR0LzlPYUNhbUtEUE5odzc3bDBKamY2akJBVVo4VzB5OVZD?=
 =?utf-8?B?SGVENm1hY3orUGs4K0l4ZVhYQ2lCL1FYWWJFZ1gwOENSZFZxTXRiYXg3N3pq?=
 =?utf-8?B?MzU5Wkhpc1FtTU50RHRuNUV2bkhkWVFTZFdBd3phS0pIL3ltT1grY2RXUCtM?=
 =?utf-8?B?YXFOR0hiU2MvR3ZFT0NGN1RqRk40NW1ZNE5QaTlES3VJRFRidzNtNTY2VHQ3?=
 =?utf-8?B?bmVTMWdydU1xRDFVVWZ3MDFQZ0FEVjBlTW5jOWk2am54YXdaM3RiUHZEZmhT?=
 =?utf-8?B?aHVFVGxRQzAyNmNacWZXRzhDVklJd2JSanpPU1BpTkl1WWdEVEVKYVQ0MXpP?=
 =?utf-8?B?MnFSQzBqdkFoQkNYUTREV2xqbmZ0b1ViWVFaQzJLd0xYZlNpYks4c2IvYUFm?=
 =?utf-8?B?QVJ5QnpRZ1dESGplSW1oak5jQWo1ZkFPbERIRDY3dnVCOE0yK1p0OG4wV2My?=
 =?utf-8?B?VTBuQ0pIWnNtcjJ3eGVCNjR6Y2YvWHJFeW9wSmJEdjdONXlNSE15RVJlOHZ4?=
 =?utf-8?B?YTh2bmZySlRNUmdNeXA0SHlxV0Q3RElybGNtb0lKeXVYZ3BjbEVGcmI2VXh5?=
 =?utf-8?B?QmhkbXJFQjB1US9xRGEvVm5iTVBkZnFpSnlObXl4RzBKaURlRGhDVWEvd0FQ?=
 =?utf-8?B?L2tzaEx2KzMvOFg3Y3ltTDYrRVhNRnhMUjh3bFlmVE56OHFLWnVNd3IyTjhq?=
 =?utf-8?B?ZHhZa01CV2E2TFY1amh1MDFDaGduSWpqSFhRVjFjOWZQS1grWFBZQjlXRTlH?=
 =?utf-8?B?U2xlNHVWVE4xK3FpT01QZ3k4bWdmTWZFcnNMZ1ErOHh1bTA4a1hJVUlQQ21m?=
 =?utf-8?B?YXoxcFdSYUNUS3pqQU44VVQwUkNPazZHeTh0VElBK3VPTENqRmNDOE1iTnRj?=
 =?utf-8?B?cFpUdlVNaHNHeXFtdnNXMGZaL05oQmRDSWVEekZOeENRczZWNDZIakE0L3k5?=
 =?utf-8?B?NGllSXl0RzdhN3pGVE5zTzE2YnY3Zi9lZzYxYlFYVVBuRU9WWjdlYk8yM3pj?=
 =?utf-8?B?NEloN1czbGI1UDFKVlhvYkYwdnFuY25ZWUJjYy93WjJCS2d2QnVnT1VJRjFp?=
 =?utf-8?B?dnE4aFRON2dsMitCUU5qcVUzUGtadk12K3F4Unh4cURWWDFvRmNRVTNjZ1Vz?=
 =?utf-8?B?TUxiSFRkT05DV0pBQWNjNmx1R3ZjOURVeTNCU0hiSzhBZVh1ZTNpZ3FXcktX?=
 =?utf-8?B?TWRWNE1KSnhzdnB1cFE1enc3OGVNbS9SVXU0Tjl3TFpUcnVzbWl3dEVxUmsy?=
 =?utf-8?B?d2lyMGFQVlVYeEhwb1IyQ2s2WjlOOHMzR0lUcTk0SEUxYnByWW1JMVZsOXVO?=
 =?utf-8?B?S3NBVjdvSnIzN2ZJY3JhZjloYzlmR001U2lKT2N2WjRnQ01yc2d0UDJORXo5?=
 =?utf-8?B?STk0TGdWYTRIaEdlZVZqNkFuaFRUano2cHNOTXJGU1dCUU5Cck9SL2E4R2Vo?=
 =?utf-8?B?NGhBK1ZJM0NORTVrU01QOER0YTQ1b0kvcWFZZWJaZ2JRY2xPd0c0bXE2WWhI?=
 =?utf-8?B?K29INGx0ZVppZS9UMjhueW5xWmZ4aE04bjgxdktBakJKZkx6STk4VFhwb0pR?=
 =?utf-8?Q?4OsS2IfZNQvSFjrG5sNmnw5RaomjZF5x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NloxYU4wQldhdlhib054VkVhMVhJVmJsVGVsYlczdmxKUTVWSGpYOWhWaGp5?=
 =?utf-8?B?MGs1R2FQaHhVUTI1RW4xSlgxRDJVemsyRitPY1J2S29Fa0tWVmpDcVB3STRy?=
 =?utf-8?B?cWZpOW1hb3VQd2JtS2tGelJwYVc1QlFoUjVyaHFUVDVlVW9jSVhkQ21jQzV3?=
 =?utf-8?B?R3Nvd0dQd2FhbFB6dDJERDArdnNUZlZpMW1kVUVhU3BqU1NwMGtXSmhESEN6?=
 =?utf-8?B?dGNuR1ZzOFJmWFJKcWovRms5NFo3ZjZLam5kdkZRZXdHaTVTSnRZT2RUL01k?=
 =?utf-8?B?YmtqQXRVYkd6REpybG5SZkVPSTFIditxajRtdE9IcnRjUVFEU2ROa2h4TGMw?=
 =?utf-8?B?eEdJRzdzcE9VUnJYa1lSQW92TDdmMCt2eXJoSkVvWWUvUDdvQzdMSk02bzFB?=
 =?utf-8?B?ajVJbUMveS9ZemJScmRhVE5nU2RndnN5M1dVeWswMkxYWEt4ay8yTEplQW1a?=
 =?utf-8?B?ZEVKWU5LaGtHZFpyZmtweUJoMk93YjlaUUhaTG8zUXlUM2w4R2NtSmlqUk95?=
 =?utf-8?B?UkFZd1dORG1ucmVyd2ZzVVJDL0hIVGFOMFhmdUVaYmFhSG5XelMxbXFOTzkx?=
 =?utf-8?B?RUZaa1NpWXEyMk1yZWQ5dzE5L01ZMjdPblRIQVdIcGhlNWlraDBuWnRjRGY1?=
 =?utf-8?B?NmowaG5BSkIwU3BsejZPWEFhSkpMNzVkY09UZWRheVNOZ0ZSWFJnLzluLzFZ?=
 =?utf-8?B?bXBoODF3b3JTK3F0OEhESUh6MzR0R2gzZFltWHRFVGFBQzlYWWVTUDF6VmNS?=
 =?utf-8?B?QVB3ckV3RE5PZ3VkalphYVlVUDJ2NDRsSmJQL2JRblhDVnA3bFlCREczZmRy?=
 =?utf-8?B?K2sweURPdWZtc2dFL2FmQ1ZQeXhwQmZuOVBwb01RMmtIT0ZiTzdLZmI4VzNr?=
 =?utf-8?B?K1NJWXRFVVhVVzFBZmpQcHRoMWJSK2gzaEt3Qm16V2RJajMwUmQ5c04wQXNl?=
 =?utf-8?B?YWhVa3hwWnhyQmNjVDh2WnJTWU9YMFliWksvSzU4S1IycW84N3JEV1dWK0VZ?=
 =?utf-8?B?OGZqNWhKUGN3bW1uWDVFY3ZjVm5xM2FYRElzRC8yMEtNQTNWT2Q3M0t3TjJW?=
 =?utf-8?B?YVQ1c0ZtNUFCWXZOalBiWW5rcDVYdGVnaTUyei9TcjJBUEo4dnBYNThySHhH?=
 =?utf-8?B?UjR3OW5NSkNYbW4wZVpKQklUcndveTEvNDBZZW9lSjBiek1lREd0R05IKzV4?=
 =?utf-8?B?UmpnVis4bEpMMjZPeDg4YjkvK0ZYcTlLWk1VNExkVDhMRjRXQ2hFZVU0d2JG?=
 =?utf-8?B?Zm1zZGJQZVhkZmZLVmdQNXpZWW1zUlpkZ0NlN1JpcGJ3NFhnQy9qcVdzR1Jo?=
 =?utf-8?B?akJoLzNVQmkzdmlYZjJha0xKTFF4ZnJNYmUrT3B4TWhqc0s3YzVtMDJPc2lB?=
 =?utf-8?B?TWNPOEF5RmdQNUpRYXRidFE1VGV2Y042ZlI5UmRxZUtJbWJxVFhXbW00ZFpo?=
 =?utf-8?B?MVpzb3h2blVaeDBNMEhSSjM5eUpZeC8wQlBaUHpiUCt0VXR2QU04ZkZMVmZI?=
 =?utf-8?B?cmE3TEtNOTVmazR1OWdmaWl2czc0bElxUVdaYUk4WTFmZCtVa0xZeWQ1MmF6?=
 =?utf-8?B?RDB2N3dlS0pFL3hPczgwSC9pRVE2YkMxVVYrNFh5TU5rZVBJMjJ0TC8vck8y?=
 =?utf-8?B?bzdkRE1vR3NhTTNVbi9nUXRTdjRwbExUUmZWL1gxUFR6Y29VRUVraXZUcTA0?=
 =?utf-8?B?NnRLMVA5VzVLaWEvbkRQeG9RVE9WeHQ5UytwaXJnb1NTdzUyYUo1UGcrMVVq?=
 =?utf-8?B?UkNVckh3dE93ZW5NaEZMTmw0Z0FnaDNuSVo1QllOK1R1VVlXRTRBLy81Rlhx?=
 =?utf-8?B?WHBLeTFjYzlubXk5MTJWRFg3aDdrMmV1eXdJWUIxeFA3MmdQWVlORi8rNlVQ?=
 =?utf-8?B?TUdOdVdESjRjSmFWMGFhMnhLRDU2NjhrL2Z6bEIxbGFraFliMHZVNWsvQlFF?=
 =?utf-8?B?UVNvV2YyakZEeEFET3NxY2V5bXFVdTZPd1hFR0pIL0QwL3VHNXNDdXRpcHZx?=
 =?utf-8?B?OVNwSmlGRzBhQmRxclA4ckFIVHdJZmZxV2pZeVZzNlNsV1ZQcEhWUGVENWJE?=
 =?utf-8?B?WlR5OWU2bWgyQUZibHJPZjIwRFlvNEVXOG12bTJ6dzMrL05nL1ZhTkpHYS9S?=
 =?utf-8?B?NjFESklPM0FYb0VSRktEdXgzUFhHby9qY0ltV2xwRUp6cnZhV0NCZ0lCalJs?=
 =?utf-8?Q?25Lt+Vzciq+SSxngc6axX+g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 386662be-c0f0-4bd3-c763-08de06c3256c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 23:33:57.9631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ki+fLVUxVP+sYG1bpgJxol+q5cfgKZOy9Vy5EobO+cbLz9iEaGXAPlUdDlwrB+OGHPd1xQ/gHcRvVmH5z+2QwG53o+33S/RfH56DI1fBy8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
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

On Wed, Oct 08, 2025 at 04:19:31PM -0700, Dixit, Ashutosh wrote:
>On Wed, 08 Oct 2025 15:40:38 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Wed, Oct 08, 2025 at 02:17:51PM -0700, Ashutosh Dixit wrote:
>> > To prevent code duplication with oa_unit_by_id(), pass 'struct
>> > drm_xe_oa_unit *' as argument to oa_unit_engine().
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > tests/intel/xe_oa.c | 32 ++++++++------------------------
>> > 1 file changed, 8 insertions(+), 24 deletions(-)
>> >
>> > diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> > index 65e03b1010..c7de1d081d 100644
>> > --- a/tests/intel/xe_oa.c
>> > +++ b/tests/intel/xe_oa.c
>> > @@ -472,25 +472,9 @@ static u64 oa_format_fields(u64 name)
>> > }
>> > #define __ff oa_format_fields
>> >
>> > -static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
>> > +static struct drm_xe_engine_class_instance *oa_unit_engine(struct drm_xe_oa_unit *oau)
>> > {
>> > -	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>> > -	struct drm_xe_engine_class_instance *hwe = NULL;
>> > -	struct drm_xe_oa_unit *oau;
>> > -	u8 *poau;
>> > -
>> > -	poau = (u8 *)&qoa->oa_units[0];
>> > -	for (int i = 0; i < qoa->num_oa_units; i++) {
>> > -		oau = (struct drm_xe_oa_unit *)poau;
>> > -
>> > -		if (i == n) {
>> > -			hwe = oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
>> > -			break;
>> > -		}
>> > -		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>> > -	}
>> > -
>> > -	return hwe;
>> > +	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
>>
>> Since this can now return NULL hwe, test_oa_unit_exclusive_stream() and
>> test_oa_unit_concurrent_oa_buffer_read() should check if the hwe is NULL
>> and account for that.
>
>For test_oa_unit_exclusive_stream() this is done in the patch 16/18
>("tests/intel/xe_oa: Run test_oa_unit_exclusive_stream on multiple OA
>units").
>
>For test_oa_unit_concurrent_oa_buffer_read(), hwe is eliminated in Patch
>10/18 ("tests/intel/xe_oa: Convert blocking/polling tests to take OA unit
>arguments").
>
>So looks ok to me I think. Thanks.
>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>
>>
>> Umesh
>>
>> > }
>> >
>> > static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
>> > @@ -4263,7 +4247,7 @@ test_oa_unit_exclusive_stream(bool exponent)
>> >
>> >	/* for each oa unit, open one random perf stream with sample OA */
>> >	for (i = 0; i < qoa->num_oa_units; i++) {
>> > -		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, i);
>> > +		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, i));
>> >
>> >		oau = (struct drm_xe_oa_unit *)poau;
>> >		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>> > @@ -4295,7 +4279,7 @@ test_oa_unit_exclusive_stream(bool exponent)
>> >	/* for each oa unit make sure no other streams can be opened */
>> >	poau = (u8 *)&qoa->oa_units[0];
>> >	for (i = 0; i < qoa->num_oa_units; i++) {
>> > -		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, i);
>> > +		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, i));
>> >		int err;
>> >
>> >		oau = (struct drm_xe_oa_unit *)poau;
>> > @@ -4345,7 +4329,7 @@ test_oa_unit_concurrent_oa_buffer_read(void)
>> >	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>> >
>> >	igt_fork(child, qoa->num_oa_units) {
>> > -		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, child);
>> > +		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, child));
>> >
>> >		/* No OAM support yet */
>> >		if (oa_unit_by_id(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>> > @@ -4924,18 +4908,18 @@ static const char *xe_engine_class_name(uint32_t engine_class)
>> >
>> > #define __for_one_hwe_in_each_oa_unit(hwe) \
>> >	for (int m = 0; !m || hwe; m++) \
>> > -		for_each_if(hwe = oa_unit_engine(drm_fd, m)) \
>> > +		for_each_if(hwe = oa_unit_engine(oa_unit_by_id(drm_fd, m))) \
>> >			igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
>> >				      hwe->engine_instance)
>> >
>> > /* Only OAG (not OAM) is currently supported */
>> > #define __for_one_hwe_in_oag(hwe) \
>> > -	if ((hwe = oa_unit_engine(drm_fd, 0))) \
>> > +	if ((hwe = oa_unit_engine(oa_unit_by_id(drm_fd, 0)))) \
>> >		igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
>> >			      hwe->engine_instance)
>> >
>> > #define __for_one_hwe_in_oag_w_arg(hwe, str) \
>> > -	if ((hwe = oa_unit_engine(drm_fd, 0))) \
>> > +	if ((hwe = oa_unit_engine(oa_unit_by_id(drm_fd, 0)))) \
>> >		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
>> >			      hwe->engine_instance, str)
>> >
>> > --
>> > 2.48.1
>> >
