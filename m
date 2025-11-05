Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F80CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 05:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8484410E6BE;
	Wed,  5 Nov 2025 05:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWXoVltU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB3E10E6C1
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 05:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762320144; x=1793856144;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=toKvPt28bXXkZlTgXWslZxWJaA+L7fEtzZXpfNS32FI=;
 b=bWXoVltUfcbdKli573ugjTyqj0n0k3812Lg2s4Jc+tx9S0dAcBw72nKQ
 gIDGFzfADi0rXvjOB006CM5O2NA9qLONFkuJab6O5OmeendP0zQGz4TUQ
 Y4PYvO9EzqSS7P9OvLDzwps2pepJVmf+qw+LRwKQxL9h5AJKIUmQMubTf
 k2m9ynknKF0BAxpONrl80JGIq7EX0a4vWgTnXXF65x2pruvelTC0EgZ0+
 QcF5IIQq6XsIVtvuhCs9EXjyvnnyrYj7bptnbdD7bnqmpu0ewbU/xViNg
 NvHcOU8hAvLAgSW8901ilKU0vWo9ueftobNqgS+bnmYhLHO/9XYfMQl1B g==;
X-CSE-ConnectionGUID: sXShx+IrT2ae2Pj0HIa4oQ==
X-CSE-MsgGUID: RszvJ9vaQMCWBDOWrhe2fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75107016"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="75107016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 21:22:23 -0800
X-CSE-ConnectionGUID: YckDOXgURJSbbP41MA+S2Q==
X-CSE-MsgGUID: CGKEVoEYQ7i42PjD82SwfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="218000840"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 21:22:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 21:22:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 21:22:22 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 21:22:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIr5vd/29nBzWmaVrQOHbjytFO79r0yhydT8xvw4lGkV0ju2+EcWP54H0e6HJbpbvi4CwyUesiDIq2Ix5+9SzdTmixo43FJoloKlH2i7UUKrA53paca1VFonvCSgDxppZGsdxaZqUf0giNoKQ1ILRt8F9Qo91oOYTCCm1AcavBsvdAKIB4B6xonBezAoRTR848eSofVU3BHO2+7WnrZXuuETFCiv8JJiRsEH6u/v4xk8xNb+GMFIdjhMlg8tYAAZzFbSbVwxGvV6wWg3f24ZQnoVTDNH04gB6B1hhiUwuL9Yw92/tMV8+JxufwPy0aIMP1WpQ4dDxxLZnLvwXdvIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLx07LFltivexkhzR+WmHFdyr68Z60c54VvnSe8GeJE=;
 b=LlSAen5TgCLJGTNeuua0YvYVjGXuyGxyzvTOxkTVU3FQz6jpWvnACvSfpCCNeX3pHqzGmZzKnWvSEVIzmYe5RVISFUDB7MSGjfUu1ZOj6zD6+eTfcq29awg/+NGwxpZ7/5zDI+fNbmZuwuzR4cSLJYEPvuRWEm1+NA9W5yUl9eaIWmX4DUcVNE3WEcvytwIxvubFv2r0QJ7u24q4bWjWU2/76gdygcNynKOJ1yk2rc/+riYjzpVO0i+qDb1zEiipLSCdX/4ROuYbyHPzM76dosPVBgkuHn1tK4vezlXjk7sMrzHB1umOz5OgRSPEq7EEOiTVWXdKjKYJ4hRoAsyXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Wed, 5 Nov 2025 05:22:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 05:22:14 +0000
Message-ID: <c40cbae4-c670-43bf-9ed7-0e2493be21e9@intel.com>
Date: Wed, 5 Nov 2025 10:52:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v3, 2/2] tests/intel/gem_ctx_freq: Add null termination to
 sysfs frequency buffers
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20251028193519.3273563-4-sk.anirban@intel.com>
 <20251028193519.3273563-6-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251028193519.3273563-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0197.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB5010:EE_
X-MS-Office365-Filtering-Correlation-Id: 104c753f-39f4-473f-b01e-08de1c2b4796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWZxeXBnVFhOM2NLalp4UCtvcFdTcXVlNGNGVUxTdy9WVnlvRlIwUi9zU29w?=
 =?utf-8?B?ZEJrZEJzcUxBVnlsaWFQeGJyaUxxRk1POG1Vd3BLVFNLcXpHL2wxRU8zb291?=
 =?utf-8?B?czliRzVkN1BkNEIzY2p3VXByQlJVNE9DSGhFS2NUaGtVKzRqTkhpazBrelZ6?=
 =?utf-8?B?ZDZZNU1TUDFwMzd3UjlqREw3M0dUOU1YT1JWbVBUaEkrYWdKOWNWQjdvVmFz?=
 =?utf-8?B?Yy8rMEtSdk5UZjE5RGZiYkxRQS9SSUtvQ3YyL1kwczNkd2Z5UjBrdUwzc3V6?=
 =?utf-8?B?WWwrOW42SDVEL3pYdUQ5c2ZiM2paQUZ4VnNyZTNGRWltbm5XUzJ6THpwdkxN?=
 =?utf-8?B?ais3RVo4N3gwdGZFcmZXVGNYQmk2VU1icnNtUWNxSkxkSzRVRHZnc2plUUZM?=
 =?utf-8?B?eWVmNUNtakRUUStRZUVnMnU2SG1lV1BVZDFhL2xLVGx5MDkwTzhLS3FsOGNn?=
 =?utf-8?B?UlZ3SXdLWVBadUpRRGFsWUJ6NC80N2NxT0FhNW9MMURhNi9wU09OcGl1RGNq?=
 =?utf-8?B?VWEzaTZlSUZUM013UHBRM05MK1dPUHVqWWlxeE5hTTMrT3NWbVRROG43aHB4?=
 =?utf-8?B?bmZ5S0dNcnpGNnB2b0NHOEcrUzdzb0xsZVEzOTduM0U4WVRLUDFwcWh0d0Qr?=
 =?utf-8?B?UVJadUMvRFhQUEtkd0dsa3Vsa1YxbHhHVVd5TlpDQktsT3hPZFlZUUhDOSt5?=
 =?utf-8?B?UUNkOHJCZTVEK2dIS0N4RXpOM3JzQjdaSk1OeHdjR1QrTzR4QklmWm9RUFpP?=
 =?utf-8?B?cUZHUUQxd1V6T3lKR3JJMjFQb0RMWmFqTFZLSDBFYktiWmtVMDZLMXhQTlVH?=
 =?utf-8?B?QjI4b21QMnhWSm5OaFd5cXVnbUs1eXd6U2tOaWxvNSs2Zk1rVHBROTJFNU1U?=
 =?utf-8?B?Z0VtNUUrTktwMmFNTnNKVmZxaDYrTUNadEg4bTVaeXhmamlHNlFmSkFLYVNn?=
 =?utf-8?B?WmxzWU56Q1V1VjloMFgzRkUrQ1dhZkhwWmVlb3ZhNUV6VVRuRmlmZVJkNnNx?=
 =?utf-8?B?K3hxbGtOUU11NHUyaU80aUJ3UkpBM3h6cHN5cHZtM0tQVDdGalF4TnJSczN4?=
 =?utf-8?B?czJ6ejBqRUgxZm5wcUFiTWg0V0xySVdleEJPM2VINHFSb2NNcy9UMENJdDhi?=
 =?utf-8?B?amIwNDBBMVBiRTRGYmR2MlZ5UXBMRDJnaEh5dUZsMm9GTnYrOXRGYWF1cmFJ?=
 =?utf-8?B?dWE2OWhRbVRGR28yNmxPOUVWN28vakwxTGdGZ2tXcUdMK3QvRXVNQ3RjU3JU?=
 =?utf-8?B?cFBOT0pwQ2QwRzlLc2h0bjNPWUFCMnBYeGlNSUlmb09iOGZlOHcxWkNRbU5k?=
 =?utf-8?B?SGF4VDFqUG8zUGN2Q0JtSUhxaTA0Q2JKYmRVNEZKRGQ3dS95NXN6SXVDS2ZF?=
 =?utf-8?B?cXZINUJDMTFNWGNhclpzM0Z5VktxUm1WTTVtVElMcXZDZDRpS1phZVZoQjZG?=
 =?utf-8?B?R0VMNVdQZXZhSDIyMmVNUE45WUo3QllXckYwT1VKejE4cXI5cmEyUHVtSXdT?=
 =?utf-8?B?RDU0dW5uUkIwWW5aVnlyNFRaeGJEQ0dZeE9mZjZTMWFWb1ZUQW43dG1oT2dV?=
 =?utf-8?B?R0s3U0ZwcFhqbVltbzlvSTZhZVc4aTVoQUUza0E4QklVdjcrQ2hSZGwxS3lC?=
 =?utf-8?B?RTZNbjVxZFR2MWR6bVVGWGdoT29XZlZsb1Y3NUJ1RVliSTdDeWtBeGhUUCt4?=
 =?utf-8?B?RTlUUG1YRVMzTTJCbERFSjBIWEZ3aUE0ZkYrZ3N1aEtxUlhQZWNJUDdXaE1i?=
 =?utf-8?B?cGpzdDVPVTZiNGoxV1M1MlNHUzR6dEdCOUdJakhyODJjM0NnTmpBWldLZHl1?=
 =?utf-8?B?Q0NvS1JvNFhNWkgrN09sOWVYbUR5eWRJaVF1YkZVMktsVC9BNkFZUENSUnJ2?=
 =?utf-8?B?L1d2TG1USHFCNXpIbGlmSGdTR1JJYTlEVXJ6RW9JYisvMktndXptMWJxUWdh?=
 =?utf-8?Q?0fea58xYEJwd419UQ6Jtt9OiPbz5GNKq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXd2QlhDWGp6ZXBMY3J2Z3JPU3ZlMXBxbk1lYmQvYm1mcld2dTdSSWtrSUNU?=
 =?utf-8?B?WW44SVdTSVZ0SFlrWS8zZFhoTVVqajVLT3ZMN3d2dW9jTjZrUWJ3UTlrQ3RF?=
 =?utf-8?B?eE5SbjlENEJYZ3dXMHorU2hQc0c1Y081UjNmSGRSeVJ4dGZ5MEZDekdSQU54?=
 =?utf-8?B?QlJjeUJucEltamdBbHBrS3oyT2QwQVZtSERWUDVUWFVad01wSmpMZkVyMTZ3?=
 =?utf-8?B?NmFEZ2JzZWtlOTlLd0FXWjJzVzFCTDZUUmVqYytrOSt3a0p4di9hR3padURO?=
 =?utf-8?B?Wm0vUUlSWk02NUtZallDcDA1TDFyeUlvb1hoQlVSMEVhbHh2SFdCOHEyTUND?=
 =?utf-8?B?d1lleDlGUVEyWkR0aDY5ZjhLV3pWM2hrSjlHSlZSd1FnaTZURU5yaG1HbHlJ?=
 =?utf-8?B?aHQ0U3MvUEtHbVE5Y1d1MlppWTJ0NHl4NEpiQzFLd2lXWUZPaU9rYm5ORjBJ?=
 =?utf-8?B?TlNiSlJLd1V0eUl4VWVFSkRNKzFuTTEyZlhsQW9JNjRZOVNrNGxCTmR6RytL?=
 =?utf-8?B?VWFFdXNUU1daS0J5SmNoMGU0SkFmR3diOGViNzhtN3dNTFo1d3BKNXp5KzM5?=
 =?utf-8?B?YWdzaDRhbEcwbnBUYlFSVXJSc0l6TEhHREI4UDhjVGFiR3IwWXdHeWhteXp1?=
 =?utf-8?B?eWt6ZGhjVmRtYjRLbTVRN096dkM4Yk91ZE5iaUcyN0s1UjJ3NGY4bnl3QWVU?=
 =?utf-8?B?NnRFRUNialllU2VHTnJSRnZhVElqb014ZG1wem95eHhEMHFLZVNDR2xjMllJ?=
 =?utf-8?B?UWRQdm1aazBBcGRsbEhQWTZ4WHp0OWdZeVpqRWlIVE9FZjJmOUI4YTBNY0NP?=
 =?utf-8?B?eUlDM2s3M0hkaVp0czlYZjdWZ1JGN2duUnVLWkhXdkp4ZkNsTnFtS2xSTFFa?=
 =?utf-8?B?bVdKcWU5RWVNQ1ppcFlMWXJ4Y3JaR2RwZ1J1Mlh2L1VDTVQ2SWVyajNTRUNS?=
 =?utf-8?B?bFBuNHh3QTkrc2lOaWNqaU1SdUNQaExKQTNtZjNuZGsvVnBYWnhrMjBZTW5W?=
 =?utf-8?B?RzhHWkxDNjBnNVZNZkx2V2M5VkFNeUplMThjbW9ncnZFc0ZOTlZEZTNWbnRJ?=
 =?utf-8?B?dW5aRkJjeW1tckVoTHVJUU1GREYyVm45eU5Ha2pndWZxU3RDOTE0aSswallZ?=
 =?utf-8?B?emZ4MUx5T3pRazVEeG83d0ZUZlk0SG9RMUtOMEhsR21yRVo3TU9EMFFrSWE5?=
 =?utf-8?B?K3poQVJ5eWIrSG5VWXQ2d1lUVC9ieXZhSW1tNHVYSmIzYk11VThwclZ2ZG1x?=
 =?utf-8?B?QmxGT0VIc21pZkhYZ2ZXblhpRTN4d3dScWxKczdtYTRBZEZESitLQVRseVc2?=
 =?utf-8?B?VGZQSHROUkN5a0hhSXBiSjRQamxYQ0lQcGVLMis2VDZzODNsaDJMZlFRMzNT?=
 =?utf-8?B?UkEvYlJkeC9Zd1FITmNwcEhrbDdjSnE1bFR6YWE0YWtKcFlFdHRHZm9VcGI2?=
 =?utf-8?B?cUxKWk1Bbnh3dWk5cFgxVkFNNDFpcmZxeEo3UGIrekJZUkhHSGdORXB1VTF0?=
 =?utf-8?B?STFFM0o4UVpnL2ttSTRZc1dNakVpLzFFem1wYjR5VFdJemx3L0xhRVpWREd3?=
 =?utf-8?B?WlJ4Wkt2ZC9tU2Q3aFV5aHZzQ0lXVFpJYkhSMldwVytCWnUrOUJGekNBRVVt?=
 =?utf-8?B?Rmc2dXIwTFpnallLQzE5K3g2UkVzRG9WSmNka3BWYSs3YlQzY0ZJNGFqMURw?=
 =?utf-8?B?WmpFVm9NRFVvSzI5Q1JZOC8yVlFwOTEyS3phRTN3QzEvRjdtN0NXMUlNZ1E4?=
 =?utf-8?B?M3VaUDkwbEc1QlpXMnU5dXhXek9ROEJzVEtoZXR0RTBrUlc1UDlhNldYNGp3?=
 =?utf-8?B?NW16ZkZMNFMwdHpFazlOOHBPaElZV1ZhVXNMMUpIUjlWeC9SL0JzejRaZzM3?=
 =?utf-8?B?eGY3Yk11THdxTWN3U1VOQm0zZHJ6MGFkeHNsSEZsMlJoSlRpVm4yL1l5VjB1?=
 =?utf-8?B?czQxWEhqODdDSFB0UmpJTlJSTDAyZ2VQQ1grYmoxdkNaOFF6SzA4bExzMW1Q?=
 =?utf-8?B?d1RRWHBvRmJVT0VOckk5Rk5YZnZLRUVWdWVKY2c4bW1ZaUNYZldSRUYyWWRa?=
 =?utf-8?B?Ri9neUFyQStNQkw4dGprSmduTGRKVkZwSHJ4SVZRNHBiS2lrK0JJeENEUDY5?=
 =?utf-8?Q?NoaJj1FsDWlkVaxtPn3EjstLt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 104c753f-39f4-473f-b01e-08de1c2b4796
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 05:22:14.5363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvOygPidSTsprw05aBruUsqaSs8ft9raOfXsZlbFt1Y+ERAC750GVIZ61v1WL+tOPfsginADyMAngJfoZk7PiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
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



On 10/29/2025 1:05 AM, Sk Anirban wrote:
> Ensure buffers are properly null-terminated after reading frequency
> values from sysfs to fix intermittent frequency restoration failures.
> 
> v2: Split patches (Riana)
> v3: Fix subject line (Kamil)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Looks good to me

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   tests/intel/gem_ctx_freq.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
> index ea6ba9ad9..0bac97761 100644
> --- a/tests/intel/gem_ctx_freq.c
> +++ b/tests/intel/gem_ctx_freq.c
> @@ -200,13 +200,19 @@ static void sysfs_range(int dirfd, int gt)
>   static void __restore_sysfs_freq(int dirfd, int fd)
>   {
>   	char buf[256];
> +	int len;
>   
>   	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
>   
> -	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
> +	len = igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf) - 1);
> +	if (len > 0) {
> +		buf[len] = '\0';
>   		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
> +	}
>   
> -	if (igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf)) > 0) {
> +	len = igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf) - 1);
> +	if (len > 0) {
> +		buf[len] = '\0';
>   		igt_sysfs_rps_set(dirfd, RPS_MAX_FREQ_MHZ, buf);
>   		igt_sysfs_rps_set(dirfd, RPS_BOOST_FREQ_MHZ, buf);
>   	}
> @@ -230,14 +236,20 @@ static void restore_sysfs_freq(int sig)
>   static void __disable_boost(int dirfd)
>   {
>   	char buf[256];
> +	int len;
>   
> -	if (igt_sysfs_rps_read(dirfd, RPS_RPn_FREQ_MHZ, buf, sizeof(buf)) > 0) {
> +	len = igt_sysfs_rps_read(dirfd, RPS_RPn_FREQ_MHZ, buf, sizeof(buf) - 1);
> +	if (len > 0) {
> +		buf[len] = '\0';
>   		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
>   		igt_sysfs_rps_set(dirfd, RPS_BOOST_FREQ_MHZ, buf);
>   	}
>   
> -	if (igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf)) > 0)
> +	len = igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf) - 1);
> +	if (len > 0) {
> +		buf[len] = '\0';
>   		igt_sysfs_rps_set(dirfd, RPS_MAX_FREQ_MHZ, buf);
> +	}
>   }
>   
>   static void disable_boost(void)

